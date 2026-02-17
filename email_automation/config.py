"""
V-BIP Phase 3-A: Email Automation Configuration
이메일 자동 파싱 시스템 설정
"""

import os
from typing import Dict, List

# ======================
# 이메일 설정
# ======================
EMAIL_CONFIG = {
    # IMAP 서버 설정
    'imap_server': os.getenv('IMAP_SERVER', 'imap.gmail.com'),
    'imap_port': int(os.getenv('IMAP_PORT', 993)),
    'email': os.getenv('VERITAS_EMAIL', ''),
    'password': os.getenv('VERITAS_EMAIL_PASSWORD', ''),
    
    # 검색 설정
    'mailbox': 'INBOX',
    'check_interval_minutes': int(os.getenv('EMAIL_CHECK_INTERVAL', 5)),
    
    # 필터링 설정
    'sender_filter': [
        'veritas',
        'netbackup',
        'backup',
        '@veritas.com'
    ],
    'subject_keywords': [
        '장애',
        'failure',
        'error',
        'alert',
        'warning',
        '백업 실패',
        'backup failed'
    ],
    
    # 첨부파일 설정
    'attachment_folder': '/tmp/vbip_attachments',
    'allowed_extensions': ['.xlsx', '.xls', '.csv'],
    'max_attachment_size_mb': 50
}

# ======================
# 데이터베이스 설정
# ======================
DB_CONFIG = {
    'host': os.getenv('DB_HOST', 'localhost'),
    'port': int(os.getenv('DB_PORT', 5432)),
    'database': os.getenv('DB_NAME', 'veritas_monitor'),
    'user': os.getenv('DB_USER', 'vbip_user'),
    'password': os.getenv('DB_PASSWORD', 'vbip_password_2026')
}

# ======================
# Slack 알림 설정
# ======================
SLACK_CONFIG = {
    'enabled': os.getenv('SLACK_ENABLED', 'true').lower() == 'true',
    'webhook_url': os.getenv('SLACK_WEBHOOK_URL', ''),
    'channel': os.getenv('SLACK_CHANNEL', '#vbip-alerts'),
    'username': 'V-BIP Bot',
    'icon_emoji': ':robot_face:',
    
    # 알림 레벨 설정
    'notify_on_failure': True,
    'notify_on_warning': True,
    'notify_on_success': False,
    
    # 요약 알림
    'daily_summary_time': '09:00',  # 매일 오전 9시
    'weekly_summary_day': 'Monday'   # 매주 월요일
}

# ======================
# 카카오톡 알림 설정 (선택)
# ======================
KAKAO_CONFIG = {
    'enabled': os.getenv('KAKAO_ENABLED', 'false').lower() == 'true',
    'rest_api_key': os.getenv('KAKAO_REST_API_KEY', ''),
    'template_id': os.getenv('KAKAO_TEMPLATE_ID', ''),
    'recipient_uuids': os.getenv('KAKAO_RECIPIENTS', '').split(',')
}

# ======================
# Excel 파싱 설정
# ======================
EXCEL_CONFIG = {
    # 컬럼 매핑 (실제 Excel 헤더명 → DB 컬럼명)
    'column_mapping': {
        '고객사명': 'customer_name',
        '작업유형': 'job_type',
        '백업서버': 'backup_server',
        '상태': 'status',
        '시작시간': 'start_time',
        '종료시간': 'end_time',
        '소요시간(분)': 'duration_minutes',
        '백업크기(GB)': 'backup_size_gb',
        '에러코드': 'error_code',
        '에러메시지': 'error_message',
        'Policy Name': 'policy_name',
        'Job ID': 'job_id',
        'Status': 'status',
        'Start Time': 'start_time',
        'End Time': 'end_time',
        'Error Code': 'error_code',
        'Error Message': 'error_message'
    },
    
    # 상태 매핑 (Excel 상태 → 표준화)
    'status_mapping': {
        '성공': 'success',
        '실패': 'failure',
        '경고': 'warning',
        'Success': 'success',
        'Failed': 'failure',
        'Failure': 'failure',
        'Warning': 'warning',
        'Partial Success': 'warning',
        '0': 'success',
        '1': 'failure'
    },
    
    # 데이터 검증
    'required_columns': ['customer_name', 'status', 'start_time'],
    'skip_empty_rows': True,
    'max_rows_per_file': 10000
}

# ======================
# 스케줄러 설정
# ======================
SCHEDULER_CONFIG = {
    'timezone': 'Asia/Seoul',
    'email_check_interval': 5,  # 분
    'cleanup_interval': 24,      # 시간
    'max_workers': 3,
    
    # 재시도 설정
    'max_retries': 3,
    'retry_delay_seconds': 60
}

# ======================
# 로깅 설정
# ======================
LOGGING_CONFIG = {
    'level': os.getenv('LOG_LEVEL', 'INFO'),
    'log_file': './logs/email_automation.log',
    'max_bytes': 10 * 1024 * 1024,  # 10MB
    'backup_count': 5,
    'format': '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
}

# ======================
# AI 진단 설정 (Phase 3-B)
# ======================
AI_CONFIG = {
    'enabled': os.getenv('AI_DIAGNOSIS_ENABLED', 'false').lower() == 'true',
    'model': 'gpt-4',
    'api_key': os.getenv('OPENAI_API_KEY', ''),
    'temperature': 0.3,
    'max_tokens': 500,
    
    # 진단 프롬프트
    'diagnosis_prompt_template': """
    백업 작업이 실패했습니다. 다음 정보를 바탕으로 원인을 분석하고 해결 방안을 제시해주세요:
    
    - 고객사: {customer_name}
    - 에러 코드: {error_code}
    - 에러 메시지: {error_message}
    - 백업 서버: {backup_server}
    - 작업 유형: {job_type}
    - 과거 유사 장애: {similar_failures}
    
    응답 형식:
    1. 원인 분석 (가능성 높은 순서대로 3가지)
    2. 해결 방안 (각 원인별)
    3. 예방 조치
    """
}

# ======================
# 보안 설정
# ======================
SECURITY_CONFIG = {
    'encrypt_passwords': True,
    'allowed_ips': ['*'],  # 모든 IP 허용, 필요시 특정 IP만 제한
    'max_login_attempts': 5,
    'session_timeout_minutes': 30
}

# ======================
# 성능 설정
# ======================
PERFORMANCE_CONFIG = {
    'batch_size': 100,  # 한 번에 처리할 레코드 수
    'connection_pool_size': 5,
    'query_timeout_seconds': 30,
    'cache_ttl_seconds': 300  # 5분
}

# ======================
# 개발/테스트 설정
# ======================
DEV_CONFIG = {
    'debug_mode': os.getenv('DEBUG', 'false').lower() == 'true',
    'mock_email': False,  # 테스트용 가짜 이메일 사용
    'mock_slack': False,  # 테스트용 Slack 비활성화
    'test_data_path': '/tmp/test_data'
}


def validate_config() -> Dict[str, List[str]]:
    """
    설정 검증 함수
    
    Returns:
        Dict[str, List[str]]: 검증 결과 (카테고리별 에러 메시지)
    """
    errors = {}
    
    # 필수 이메일 설정 확인
    if not EMAIL_CONFIG['email'] or not EMAIL_CONFIG['password']:
        errors['email'] = ['이메일 계정 정보가 설정되지 않았습니다 (VERITAS_EMAIL, VERITAS_EMAIL_PASSWORD)']
    
    # 데이터베이스 설정 확인
    if not DB_CONFIG['password']:
        errors['database'] = ['데이터베이스 비밀번호가 설정되지 않았습니다']
    
    # Slack 설정 확인 (활성화된 경우)
    if SLACK_CONFIG['enabled'] and not SLACK_CONFIG['webhook_url']:
        errors['slack'] = ['Slack이 활성화되었으나 webhook URL이 설정되지 않았습니다']
    
    # AI 설정 확인 (활성화된 경우)
    if AI_CONFIG['enabled'] and not AI_CONFIG['api_key']:
        errors['ai'] = ['AI 진단이 활성화되었으나 API 키가 설정되지 않았습니다']
    
    return errors


def print_config_summary():
    """설정 요약 출력"""
    print("=" * 60)
    print("V-BIP Phase 3-A 설정 요약")
    print("=" * 60)
    print(f"📧 이메일 체크 간격: {EMAIL_CONFIG['check_interval_minutes']}분")
    print(f"💾 데이터베이스: {DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}")
    print(f"🔔 Slack 알림: {'활성화' if SLACK_CONFIG['enabled'] else '비활성화'}")
    print(f"🤖 AI 진단: {'활성화' if AI_CONFIG['enabled'] else '비활성화'}")
    print(f"🐛 디버그 모드: {'활성화' if DEV_CONFIG['debug_mode'] else '비활성화'}")
    print("=" * 60)
    
    # 설정 검증
    errors = validate_config()
    if errors:
        print("\n⚠️ 설정 오류:")
        for category, error_list in errors.items():
            print(f"  [{category}]")
            for error in error_list:
                print(f"    - {error}")
    else:
        print("\n✅ 모든 설정이 올바릅니다!")
    print("=" * 60)


if __name__ == '__main__':
    print_config_summary()
