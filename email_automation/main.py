"""
V-BIP Phase 3-A: Main Automation Service
이메일 자동화 메인 서비스
"""

import time
import logging
from datetime import datetime
from typing import List, Dict
from pathlib import Path

from config import (
    EMAIL_CONFIG, SCHEDULER_CONFIG, LOGGING_CONFIG,
    print_config_summary, validate_config
)
from email_monitor import EmailMonitor
from excel_parser import ExcelParser
from db_manager import DatabaseManager
from notifier import Notifier


# 로깅 설정
log_file = Path(LOGGING_CONFIG['log_file'])
log_file.parent.mkdir(parents=True, exist_ok=True)

logging.basicConfig(
    level=getattr(logging, LOGGING_CONFIG['level']),
    format=LOGGING_CONFIG['format'],
    handlers=[
        logging.FileHandler(log_file),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)


class EmailAutomationService:
    """
    이메일 자동화 서비스 메인 클래스
    """
    
    def __init__(self):
        """초기화"""
        self.email_monitor = EmailMonitor()
        self.excel_parser = ExcelParser()
        self.db_manager = DatabaseManager()
        self.notifier = Notifier()
        
        self.is_running = False
        self.last_check_time = None
        self.stats = {
            'emails_processed': 0,
            'records_inserted': 0,
            'failures_notified': 0,
            'warnings_notified': 0
        }
    
    def start(self):
        """서비스 시작"""
        logger.info("=" * 60)
        logger.info("V-BIP Email Automation Service 시작")
        logger.info("=" * 60)
        
        # 설정 검증
        errors = validate_config()
        if errors:
            logger.error("설정 오류가 있습니다:")
            for category, error_list in errors.items():
                logger.error(f"  [{category}]")
                for error in error_list:
                    logger.error(f"    - {error}")
            return
        
        print_config_summary()
        
        # DB 연결
        if not self.db_manager.connect():
            logger.error("데이터베이스 연결 실패, 서비스 종료")
            return
        
        self.is_running = True
        logger.info(f"✅ 서비스 시작됨 (체크 간격: {EMAIL_CONFIG['check_interval_minutes']}분)")
        
        try:
            while self.is_running:
                self.check_and_process()
                time.sleep(EMAIL_CONFIG['check_interval_minutes'] * 60)
        except KeyboardInterrupt:
            logger.info("사용자에 의해 종료됨")
        finally:
            self.stop()
    
    def stop(self):
        """서비스 종료"""
        logger.info("서비스 종료 중...")
        self.is_running = False
        self.db_manager.disconnect()
        self.email_monitor.disconnect()
        logger.info("✅ 서비스 종료됨")
        
        # 최종 통계 출력
        logger.info("=" * 60)
        logger.info("최종 통계:")
        logger.info(f"  처리된 이메일: {self.stats['emails_processed']}개")
        logger.info(f"  삽입된 레코드: {self.stats['records_inserted']}개")
        logger.info(f"  장애 알림: {self.stats['failures_notified']}건")
        logger.info(f"  경고 알림: {self.stats['warnings_notified']}건")
        logger.info("=" * 60)
    
    def check_and_process(self):
        """이메일 확인 및 처리"""
        logger.info(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 이메일 확인 시작...")
        
        try:
            # 새 이메일 가져오기
            check_minutes = EMAIL_CONFIG['check_interval_minutes'] + 5  # 5분 여유
            emails = self.email_monitor.fetch_new_emails(since_minutes=check_minutes)
            
            if not emails:
                logger.info("새 이메일 없음")
                return
            
            logger.info(f"📧 {len(emails)}개 이메일 발견")
            
            # 각 이메일 처리
            for email_data in emails:
                self.process_email(email_data)
            
        except Exception as e:
            logger.error(f"❌ 이메일 확인 중 에러: {e}", exc_info=True)
    
    def process_email(self, email_data: Dict):
        """
        개별 이메일 처리
        
        Args:
            email_data: 이메일 데이터
        """
        email_id = email_data['email_id']
        subject = email_data['subject']
        attachments = email_data['attachments']
        
        logger.info(f"📧 처리 중: {subject}")
        logger.info(f"   첨부파일: {len(attachments)}개")
        
        if not attachments:
            logger.info("   첨부파일 없음, 건너뜀")
            return
        
        all_records = []
        all_errors = []
        
        # 모든 첨부파일 파싱
        for attachment_path in attachments:
            logger.info(f"   📊 파싱: {Path(attachment_path).name}")
            
            records, errors = self.excel_parser.parse_file(attachment_path)
            all_records.extend(records)
            all_errors.extend(errors)
            
            if errors:
                logger.warning(f"   ⚠️ 파싱 에러 {len(errors)}개:")
                for error in errors[:3]:  # 처음 3개만 로그
                    logger.warning(f"      - {error}")
        
        if not all_records:
            logger.warning("   파싱된 레코드 없음")
            self.db_manager.log_email_processing(
                email_id, subject, len(attachments), 0, 'failure',
                '; '.join(all_errors[:3]) if all_errors else 'No records'
            )
            return
        
        # 데이터베이스에 저장
        logger.info(f"   💾 DB 저장 중: {len(all_records)}개 레코드")
        success_count, failure_count = self.db_manager.insert_batch(all_records)
        
        logger.info(f"   ✅ 저장 완료: 성공 {success_count}개, 실패 {failure_count}개")
        
        # 실패/경고 건 알림
        failure_records = [r for r in all_records if r['status'] == 'failure']
        warning_records = [r for r in all_records if r['status'] == 'warning']
        
        for record in failure_records:
            self.notifier.notify_failure(
                customer_name=record['customer_name'],
                error_code=record['error_code'],
                error_message=record['error_message'],
                start_time=record['start_time']
            )
            self.stats['failures_notified'] += 1
        
        for record in warning_records:
            self.notifier.notify_warning(
                customer_name=record['customer_name'],
                message=record['error_message'] or '백업 경고',
                start_time=record['start_time']
            )
            self.stats['warnings_notified'] += 1
        
        # 이메일 처리 완료 알림
        self.notifier.notify_email_processed(
            subject=subject,
            records_count=success_count,
            failures_count=len(failure_records),
            warnings_count=len(warning_records)
        )
        
        # 이메일 처리 로그 저장
        status = 'success' if failure_count == 0 else 'partial'
        self.db_manager.log_email_processing(
            email_id, subject, len(attachments), success_count,
            status, '; '.join(all_errors[:3]) if all_errors else None
        )
        
        # 이메일 읽음 표시
        self.email_monitor.mark_as_read(email_id)
        
        # 통계 업데이트
        self.stats['emails_processed'] += 1
        self.stats['records_inserted'] += success_count
        
        logger.info(f"   ✅ 이메일 처리 완료")
    
    def send_daily_summary(self):
        """일일 요약 전송"""
        try:
            stats = self.db_manager.get_statistics(days=1)
            self.notifier.notify_daily_summary(stats)
            logger.info("✅ 일일 요약 전송 완료")
        except Exception as e:
            logger.error(f"❌ 일일 요약 전송 실패: {e}")


def main():
    """메인 함수"""
    service = EmailAutomationService()
    
    try:
        service.start()
    except Exception as e:
        logger.error(f"서비스 실행 중 에러: {e}", exc_info=True)


if __name__ == '__main__':
    main()
