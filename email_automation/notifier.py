"""
V-BIP Phase 3-A: Notifier
Slack 및 카카오톡 알림 전송
"""

import requests
import json
import logging
from typing import List, Dict, Optional
from datetime import datetime

from config import SLACK_CONFIG, KAKAO_CONFIG, LOGGING_CONFIG


# 로깅 설정
logging.basicConfig(
    level=getattr(logging, LOGGING_CONFIG['level']),
    format=LOGGING_CONFIG['format']
)
logger = logging.getLogger(__name__)


class SlackNotifier:
    """
    Slack 알림 클래스
    """
    
    def __init__(self):
        """초기화"""
        self.enabled = SLACK_CONFIG['enabled']
        self.webhook_url = SLACK_CONFIG['webhook_url']
        self.channel = SLACK_CONFIG['channel']
        self.username = SLACK_CONFIG['username']
        self.icon_emoji = SLACK_CONFIG['icon_emoji']
    
    def send_message(self, text: str, attachments: List[Dict] = None,
                    color: str = 'good') -> bool:
        """
        Slack 메시지 전송
        
        Args:
            text: 메시지 텍스트
            attachments: 첨부 정보 리스트
            color: 색상 (good, warning, danger)
        
        Returns:
            bool: 전송 성공 여부
        """
        if not self.enabled:
            logger.debug("Slack 알림이 비활성화되어 있습니다")
            return False
        
        if not self.webhook_url:
            logger.error("Slack Webhook URL이 설정되지 않았습니다")
            return False
        
        try:
            payload = {
                'username': self.username,
                'icon_emoji': self.icon_emoji,
                'channel': self.channel,
                'text': text
            }
            
            if attachments:
                payload['attachments'] = attachments
            
            response = requests.post(
                self.webhook_url,
                data=json.dumps(payload),
                headers={'Content-Type': 'application/json'},
                timeout=10
            )
            
            if response.status_code == 200:
                logger.info("✅ Slack 알림 전송 성공")
                return True
            else:
                logger.error(f"❌ Slack 알림 전송 실패: {response.status_code} {response.text}")
                return False
        
        except Exception as e:
            logger.error(f"❌ Slack 알림 전송 실패: {e}")
            return False
    
    def notify_failure(self, customer_name: str, error_code: str,
                      error_message: str, start_time: str) -> bool:
        """
        장애 알림
        
        Args:
            customer_name: 고객사명
            error_code: 에러 코드
            error_message: 에러 메시지
            start_time: 발생 시간
        
        Returns:
            bool: 전송 성공 여부
        """
        text = f"🚨 *백업 장애 발생!*"
        
        attachments = [{
            'color': 'danger',
            'fields': [
                {
                    'title': '고객사',
                    'value': customer_name,
                    'short': True
                },
                {
                    'title': '발생 시간',
                    'value': start_time,
                    'short': True
                },
                {
                    'title': '에러 코드',
                    'value': error_code or 'N/A',
                    'short': True
                },
                {
                    'title': '에러 메시지',
                    'value': error_message or 'N/A',
                    'short': False
                }
            ],
            'footer': 'V-BIP 자동 알림',
            'ts': int(datetime.now().timestamp())
        }]
        
        return self.send_message(text, attachments)
    
    def notify_warning(self, customer_name: str, message: str, start_time: str) -> bool:
        """
        경고 알림
        
        Args:
            customer_name: 고객사명
            message: 경고 메시지
            start_time: 발생 시간
        
        Returns:
            bool: 전송 성공 여부
        """
        text = f"⚠️ *백업 경고 발생*"
        
        attachments = [{
            'color': 'warning',
            'fields': [
                {
                    'title': '고객사',
                    'value': customer_name,
                    'short': True
                },
                {
                    'title': '발생 시간',
                    'value': start_time,
                    'short': True
                },
                {
                    'title': '경고 내용',
                    'value': message,
                    'short': False
                }
            ],
            'footer': 'V-BIP 자동 알림',
            'ts': int(datetime.now().timestamp())
        }]
        
        return self.send_message(text, attachments)
    
    def notify_email_processed(self, subject: str, records_count: int,
                               failures_count: int, warnings_count: int) -> bool:
        """
        이메일 처리 완료 알림
        
        Args:
            subject: 이메일 제목
            records_count: 처리된 레코드 수
            failures_count: 실패 건수
            warnings_count: 경고 건수
        
        Returns:
            bool: 전송 성공 여부
        """
        if failures_count > 0:
            color = 'danger'
            icon = '🚨'
        elif warnings_count > 0:
            color = 'warning'
            icon = '⚠️'
        else:
            color = 'good'
            icon = '✅'
        
        text = f"{icon} *백업 리포트 자동 처리 완료*"
        
        attachments = [{
            'color': color,
            'fields': [
                {
                    'title': '이메일 제목',
                    'value': subject,
                    'short': False
                },
                {
                    'title': '처리된 레코드',
                    'value': f"{records_count}개",
                    'short': True
                },
                {
                    'title': '실패',
                    'value': f"{failures_count}건",
                    'short': True
                },
                {
                    'title': '경고',
                    'value': f"{warnings_count}건",
                    'short': True
                }
            ],
            'footer': 'V-BIP 자동 알림',
            'ts': int(datetime.now().timestamp())
        }]
        
        return self.send_message(text, attachments)
    
    def notify_daily_summary(self, stats: Dict) -> bool:
        """
        일일 요약 알림
        
        Args:
            stats: 통계 정보
        
        Returns:
            bool: 전송 성공 여부
        """
        success_count = stats.get('success_count', 0)
        failure_count = stats.get('failure_count', 0)
        warning_count = stats.get('warning_count', 0)
        total = success_count + failure_count + warning_count
        
        if total == 0:
            success_rate = 0
        else:
            success_rate = (success_count / total) * 100
        
        if success_rate >= 90:
            color = 'good'
            icon = '✅'
        elif success_rate >= 70:
            color = 'warning'
            icon = '⚠️'
        else:
            color = 'danger'
            icon = '🚨'
        
        text = f"{icon} *일일 백업 요약 리포트*"
        
        attachments = [{
            'color': color,
            'fields': [
                {
                    'title': '기간',
                    'value': f"최근 {stats.get('period_days', 1)}일",
                    'short': True
                },
                {
                    'title': '고객사',
                    'value': f"{stats.get('customer_count', 0)}개",
                    'short': True
                },
                {
                    'title': '성공',
                    'value': f"{success_count}건",
                    'short': True
                },
                {
                    'title': '실패',
                    'value': f"{failure_count}건",
                    'short': True
                },
                {
                    'title': '경고',
                    'value': f"{warning_count}건",
                    'short': True
                },
                {
                    'title': '성공률',
                    'value': f"{success_rate:.1f}%",
                    'short': True
                }
            ],
            'footer': 'V-BIP 자동 알림',
            'ts': int(datetime.now().timestamp())
        }]
        
        return self.send_message(text, attachments)


class KakaoNotifier:
    """
    카카오톡 알림 클래스 (Business API 사용)
    """
    
    def __init__(self):
        """초기화"""
        self.enabled = KAKAO_CONFIG['enabled']
        self.rest_api_key = KAKAO_CONFIG['rest_api_key']
        self.template_id = KAKAO_CONFIG['template_id']
        self.recipient_uuids = KAKAO_CONFIG['recipient_uuids']
    
    def send_message(self, template_args: Dict) -> bool:
        """
        카카오톡 메시지 전송
        
        Args:
            template_args: 템플릿 인자
        
        Returns:
            bool: 전송 성공 여부
        """
        if not self.enabled:
            logger.debug("카카오톡 알림이 비활성화되어 있습니다")
            return False
        
        if not self.rest_api_key or not self.template_id:
            logger.error("카카오톡 API 키 또는 템플릿 ID가 설정되지 않았습니다")
            return False
        
        try:
            # 실제 구현은 카카오톡 Business API 문서 참조
            # 여기서는 기본 구조만 제공
            logger.info("카카오톡 알림 전송 (구현 필요)")
            return True
        
        except Exception as e:
            logger.error(f"❌ 카카오톡 알림 전송 실패: {e}")
            return False


class Notifier:
    """
    통합 알림 클래스
    """
    
    def __init__(self):
        """초기화"""
        self.slack = SlackNotifier()
        self.kakao = KakaoNotifier()
    
    def notify_failure(self, customer_name: str, error_code: str,
                      error_message: str, start_time: str):
        """장애 알림 (모든 채널)"""
        self.slack.notify_failure(customer_name, error_code, error_message, start_time)
        # self.kakao.send_message(...) - 필요시 활성화
    
    def notify_warning(self, customer_name: str, message: str, start_time: str):
        """경고 알림 (모든 채널)"""
        self.slack.notify_warning(customer_name, message, start_time)
    
    def notify_email_processed(self, subject: str, records_count: int,
                               failures_count: int, warnings_count: int):
        """이메일 처리 완료 알림"""
        self.slack.notify_email_processed(subject, records_count, failures_count, warnings_count)
    
    def notify_daily_summary(self, stats: Dict):
        """일일 요약 알림"""
        self.slack.notify_daily_summary(stats)


def test_notifier():
    """테스트 함수"""
    print("=" * 60)
    print("Notifier 테스트")
    print("=" * 60)
    
    notifier = Notifier()
    
    # 장애 알림 테스트
    print("\n1. 장애 알림 테스트...")
    notifier.notify_failure(
        customer_name='테스트고객사',
        error_code='58',
        error_message='미디어 서버 연결 실패',
        start_time='2026-02-16 01:00:00'
    )
    
    # 경고 알림 테스트
    print("\n2. 경고 알림 테스트...")
    notifier.notify_warning(
        customer_name='테스트고객사',
        message='백업 소요 시간이 평균보다 50% 길어졌습니다',
        start_time='2026-02-16 02:00:00'
    )
    
    # 이메일 처리 완료 알림 테스트
    print("\n3. 이메일 처리 완료 알림 테스트...")
    notifier.notify_email_processed(
        subject='[Veritas] 2026-02-16 백업 리포트',
        records_count=15,
        failures_count=3,
        warnings_count=1
    )
    
    # 일일 요약 알림 테스트
    print("\n4. 일일 요약 알림 테스트...")
    notifier.notify_daily_summary({
        'success_count': 45,
        'failure_count': 5,
        'warning_count': 2,
        'customer_count': 16,
        'period_days': 1
    })
    
    print("\n" + "=" * 60)
    print("✅ 테스트 완료")
    print("=" * 60)


if __name__ == '__main__':
    test_notifier()
