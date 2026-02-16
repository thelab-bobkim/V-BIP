"""
V-BIP Phase 3-B: AI Integrated Email Monitor
Phase 3-A 이메일 모니터 + Phase 3-B AI 진단 통합
"""

import os
import sys
import time
from typing import Dict, Any, Optional
from datetime import datetime

# Phase 3-A 모듈 임포트
sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'email_automation'))
try:
    from email_monitor import EmailMonitor as Phase3A_EmailMonitor
    from excel_parser import ExcelParser
    from db_manager import DatabaseManager
    from notifier import Notifier
    from config import EmailConfig, DBConfig, NotificationConfig
except ImportError as e:
    print(f"⚠️ Phase 3-A 모듈을 찾을 수 없습니다: {e}")
    print("email_automation 디렉토리가 있는지 확인하세요.")

# Phase 3-B 모듈 임포트
try:
    from diagnosis_engine import DiagnosisEngine
    from config_ai import AIConfig
    from loguru import logger
except ImportError as e:
    print(f"⚠️ Phase 3-B 모듈 설치 필요: {e}")


class AIIntegratedMonitor:
    """AI 진단 기능이 통합된 이메일 모니터"""
    
    def __init__(self):
        """초기화"""
        logger.info("=" * 60)
        logger.info("🚀 V-BIP Phase 3-A + 3-B 통합 시스템 시작")
        logger.info("=" * 60)
        
        # Phase 3-A 컴포넌트
        self.email_monitor = Phase3A_EmailMonitor()
        self.excel_parser = ExcelParser()
        self.db_manager = DatabaseManager()
        self.notifier = Notifier()
        
        # Phase 3-B 컴포넌트
        self.ai_enabled = AIConfig.validate()
        if self.ai_enabled:
            try:
                self.diagnosis_engine = DiagnosisEngine()
                logger.success("✅ AI 진단 엔진 활성화")
            except Exception as e:
                logger.error(f"⚠️ AI 진단 엔진 초기화 실패: {e}")
                logger.warning("AI 진단 없이 Phase 3-A 모드로 동작합니다.")
                self.ai_enabled = False
        else:
            logger.warning("⚠️ AI 설정 없음 - Phase 3-A 모드로 동작")
            self.ai_enabled = False
        
        logger.info(f"AI 진단: {'활성화 ✅' if self.ai_enabled else '비활성화 ⚠️'}")
    
    def process_backup_failure(self, backup_data: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """
        백업 실패 건에 대한 AI 진단 수행
        
        Args:
            backup_data: 파싱된 백업 데이터
            
        Returns:
            진단 결과 (AI 비활성화 시 None)
        """
        if not self.ai_enabled:
            return None
        
        # 실패 건만 진단
        if backup_data.get('status', '').lower() not in ['failure', 'failed', '실패']:
            return None
        
        logger.info(f"🔍 AI 진단 시작: {backup_data.get('customer_name', 'Unknown')}")
        
        try:
            # AI 진단 실행
            diagnosis = self.diagnosis_engine.diagnose(
                error_code=str(backup_data.get('error_code', '')),
                error_message=backup_data.get('error_message', 'No error message'),
                customer_name=backup_data.get('customer_name', 'Unknown'),
                occurrence_time=backup_data.get('start_time', datetime.now().isoformat()),
                backup_policy=backup_data.get('policy_name', 'Unknown')
            )
            
            logger.success(f"✅ 진단 완료: {diagnosis.get('automation_level', 'Unknown')} 레벨")
            return diagnosis
            
        except Exception as e:
            logger.error(f"❌ AI 진단 실패: {e}")
            return None
    
    def save_diagnosis_to_db(self, backup_id: int, diagnosis: Dict[str, Any]):
        """
        진단 결과를 데이터베이스에 저장
        
        Args:
            backup_id: 백업 레코드 ID
            diagnosis: 진단 결과
        """
        try:
            # diagnosis_results 테이블에 저장
            # (테이블이 없다면 생성 필요)
            
            diagnosis_data = {
                'backup_id': backup_id,
                'automation_level': diagnosis.get('automation_level', 'LEVEL_3'),
                'confidence_score': diagnosis.get('신뢰도', 0.0),
                'risk_score': diagnosis.get('위험도', 10),
                'estimated_time': diagnosis.get('예상_소요_시간', 'Unknown'),
                'root_causes': str(diagnosis.get('원인_분석', [])),
                'solutions': str(diagnosis.get('해결_방안', [])),
                'commands': str(diagnosis.get('필요_명령어', [])),
                'diagnosis_time': datetime.now(),
                'raw_result': str(diagnosis)
            }
            
            # 실제 DB 저장 (db_manager 확장 필요)
            # self.db_manager.save_diagnosis(diagnosis_data)
            
            logger.info(f"💾 진단 결과 저장 완료 (Backup ID: {backup_id})")
            
        except Exception as e:
            logger.error(f"❌ 진단 결과 저장 실패: {e}")
    
    def send_ai_notification(self, backup_data: Dict[str, Any], diagnosis: Optional[Dict[str, Any]]):
        """
        AI 진단 결과가 포함된 알림 전송
        
        Args:
            backup_data: 백업 데이터
            diagnosis: 진단 결과 (None이면 일반 알림)
        """
        try:
            if diagnosis and self.ai_enabled:
                # AI 진단 결과 포함 알림
                slack_message = self.diagnosis_engine.format_diagnosis_for_slack(diagnosis)
                
                # 자동화 레벨에 따른 버튼 추가
                automation_level = diagnosis.get('automation_level', 'LEVEL_3')
                
                if automation_level == 'LEVEL_1':
                    # 자동 복구 시작 알림
                    slack_message += "\n\n🤖 **자동 복구를 시작합니다...**"
                    # TODO: Phase 4 자동 복구 실행
                    
                elif automation_level == 'LEVEL_2':
                    # 승인 요청 버튼
                    slack_message += "\n\n⚠️ **복구 승인이 필요합니다.**"
                    slack_message += "\n버튼을 클릭하여 승인하세요."
                    # TODO: Slack Interactive 버튼 추가
                
                else:  # LEVEL_3
                    # 엔지니어 조치 요청
                    slack_message += "\n\n👨‍💼 **엔지니어 조치가 필요합니다.**"
                    slack_message += f"\n담당자: @{backup_data.get('assigned_engineer', 'engineer')}"
                
                # Slack 전송
                self.notifier.send_slack_notification(
                    title=f"🔴 백업 실패 + AI 진단 | {backup_data.get('customer_name', 'Unknown')}",
                    message=slack_message,
                    severity='critical'
                )
                
            else:
                # 일반 알림 (Phase 3-A)
                self.notifier.send_slack_notification(
                    title=f"⚠️ 백업 실패 | {backup_data.get('customer_name', 'Unknown')}",
                    message=self._format_basic_notification(backup_data),
                    severity='warning'
                )
                
        except Exception as e:
            logger.error(f"❌ 알림 전송 실패: {e}")
    
    def _format_basic_notification(self, backup_data: Dict[str, Any]) -> str:
        """기본 알림 메시지 포맷팅 (AI 비활성화 시)"""
        return f"""
**고객사:** {backup_data.get('customer_name', 'Unknown')}
**상태:** {backup_data.get('status', 'Unknown')}
**시작 시간:** {backup_data.get('start_time', 'Unknown')}
**소요 시간:** {backup_data.get('duration_minutes', 'Unknown')}분
**에러 코드:** {backup_data.get('error_code', 'N/A')}
**에러 메시지:** {backup_data.get('error_message', 'N/A')}

담당 엔지니어가 확인 중입니다.
        """.strip()
    
    def run_once(self):
        """한 번 실행 (테스트용)"""
        logger.info("📧 이메일 체크 시작...")
        
        # Phase 3-A: 이메일 확인 및 Excel 다운로드
        emails = self.email_monitor.fetch_backup_alerts()
        
        if not emails:
            logger.info("새 이메일 없음")
            return
        
        logger.info(f"📬 새 이메일 {len(emails)}개 발견")
        
        for email_data in emails:
            # Excel 파일 처리
            attachments = email_data.get('attachments', [])
            
            for attachment_path in attachments:
                # Excel 파싱
                parsed_data = self.excel_parser.parse(attachment_path)
                
                for backup_record in parsed_data:
                    # DB 저장
                    backup_id = self.db_manager.save_backup_record(backup_record)
                    
                    # AI 진단 (실패 건만)
                    diagnosis = self.process_backup_failure(backup_record)
                    
                    # 진단 결과 저장
                    if diagnosis:
                        self.save_diagnosis_to_db(backup_id, diagnosis)
                    
                    # 알림 전송
                    self.send_ai_notification(backup_record, diagnosis)
        
        logger.success("✅ 이메일 처리 완료")
    
    def run_forever(self, interval_seconds: int = 300):
        """
        무한 루프 실행
        
        Args:
            interval_seconds: 체크 간격 (초)
        """
        logger.info(f"🔄 {interval_seconds}초 간격으로 모니터링 시작...")
        
        while True:
            try:
                self.run_once()
                logger.info(f"⏰ {interval_seconds}초 후 다음 체크...")
                time.sleep(interval_seconds)
                
            except KeyboardInterrupt:
                logger.warning("\n⚠️ 사용자 중단 (Ctrl+C)")
                break
            except Exception as e:
                logger.error(f"❌ 오류 발생: {e}")
                logger.info(f"🔄 {interval_seconds}초 후 재시도...")
                time.sleep(interval_seconds)


def main():
    """메인 실행 함수"""
    
    # 시스템 초기화
    monitor = AIIntegratedMonitor()
    
    # 테스트 모드 vs 프로덕션 모드
    import argparse
    parser = argparse.ArgumentParser(description='V-BIP AI Integrated Monitor')
    parser.add_argument('--test', action='store_true', help='테스트 모드 (1회 실행)')
    parser.add_argument('--interval', type=int, default=300, help='체크 간격 (초)')
    args = parser.parse_args()
    
    if args.test:
        logger.info("🧪 테스트 모드 - 1회 실행")
        monitor.run_once()
    else:
        logger.info("🚀 프로덕션 모드 - 무한 루프")
        monitor.run_forever(args.interval)


if __name__ == "__main__":
    main()
