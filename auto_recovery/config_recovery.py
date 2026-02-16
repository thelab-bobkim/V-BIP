"""
V-BIP Phase 4: Auto Recovery System Configuration
자동 복구 시스템 설정
"""

import os
from typing import Dict, List, Set
from dotenv import load_dotenv

load_dotenv()


class RecoveryConfig:
    """자동 복구 시스템 설정"""
    
    # ============================================
    # OpenAI Configuration (Phase 3-B 공유)
    # ============================================
    OPENAI_API_KEY = os.getenv('OPENAI_API_KEY', '')
    OPENAI_MODEL = os.getenv('OPENAI_MODEL', 'gpt-4-turbo-preview')
    OPENAI_TEMPERATURE = float(os.getenv('OPENAI_TEMPERATURE', '0.2'))  # 더 보수적
    
    # ============================================
    # SSH Configuration
    # ============================================
    # 고객사 NetBackup 서버 접속 정보
    SSH_DEFAULT_PORT = int(os.getenv('SSH_DEFAULT_PORT', '22'))
    SSH_TIMEOUT = int(os.getenv('SSH_TIMEOUT', '30'))
    SSH_KEY_PATH = os.getenv('SSH_KEY_PATH', '~/.ssh/id_rsa')
    
    # 고객사 서버 목록 (실제 배포 시 DB나 별도 파일로 관리)
    CUSTOMER_SERVERS = {
        '서울우유본사': {
            'host': '192.168.1.100',  # 예시
            'port': 22,
            'username': 'netbackup_admin',
            'auth_method': 'key'  # 'key' or 'password'
        },
        '동국제약': {
            'host': '192.168.2.100',
            'port': 22,
            'username': 'netbackup_admin',
            'auth_method': 'key'
        }
        # ... 추가 고객사
    }
    
    # ============================================
    # Safety Configuration
    # ============================================
    # 절대 실행 금지 명령어 (블랙리스트)
    BLACKLIST_COMMANDS = {
        'rm -rf /',
        'rm -rf /*',
        'mkfs',
        'dd if=/dev/zero',
        'format',
        'fdisk',
        '> /dev/sda',
        'shutdown',
        'reboot',
        'init 0',
        'init 6',
        'halt',
        'poweroff',
        'killall',
        'pkill -9',
        'chmod 777 /',
        'chown -R',
        ':(){:|:&};:',  # Fork bomb
    }
    
    # 위험 명령어 (LEVEL_1에서 금지, LEVEL_2는 승인 필요)
    RISKY_COMMANDS = {
        'rm',
        'mv',
        'chmod',
        'chown',
        'kill',
        'systemctl stop',
        'service stop',
        'bpdown',
    }
    
    # 안전한 명령어 (화이트리스트)
    SAFE_COMMANDS = {
        'bpps',
        'bpserviceinfo',
        'vmquery',
        'bpstulist',
        'bperror',
        'bptestbpcd',
        'bpup',
        'systemctl start',
        'systemctl restart',
        'service start',
        'service restart',
        'cat',
        'ls',
        'grep',
        'tail',
        'head',
        'echo',
        'date',
    }
    
    # ============================================
    # Recovery Script Configuration
    # ============================================
    # 스크립트 실행 시간 제한 (초)
    SCRIPT_TIMEOUT = {
        'LEVEL_1': 300,   # 5분
        'LEVEL_2': 1200,  # 20분
        'LEVEL_3': 3600   # 60분 (수동 조치용)
    }
    
    # 재시도 설정
    MAX_RETRIES = int(os.getenv('MAX_RETRIES', '3'))
    RETRY_DELAY = int(os.getenv('RETRY_DELAY', '10'))  # 초
    
    # ============================================
    # Slack Interactive Configuration
    # ============================================
    SLACK_WEBHOOK_URL = os.getenv('SLACK_WEBHOOK_URL', '')
    SLACK_BOT_TOKEN = os.getenv('SLACK_BOT_TOKEN', '')  # Interactive 버튼용
    SLACK_SIGNING_SECRET = os.getenv('SLACK_SIGNING_SECRET', '')
    
    # Interactive 버튼 타임아웃 (분)
    APPROVAL_TIMEOUT_MINUTES = int(os.getenv('APPROVAL_TIMEOUT_MINUTES', '30'))
    
    # ============================================
    # Recovery Prompt Templates
    # ============================================
    RECOVERY_SCRIPT_PROMPT = """
당신은 Veritas NetBackup 전문가입니다. 다음 진단 결과를 바탕으로 **안전한** 복구 스크립트를 생성하세요.

## 진단 결과
{diagnosis_result}

## 고객사 정보
- 고객사: {customer_name}
- 서버 OS: {server_os}
- NetBackup 버전: {netbackup_version}

## 스크립트 생성 요구사항

### 1. 안전성 최우선
- 데이터 손실 위험이 있는 명령어 절대 금지
- 모든 명령어 실행 전 상태 백업
- 에러 발생 시 즉시 중단

### 2. 검증 로직 포함
- 각 단계 실행 후 성공 여부 확인
- 실패 시 다음 단계로 진행 금지
- 최종 결과 검증 (복구 성공 여부)

### 3. 롤백 기능
- 변경 사항 기록
- 실패 시 원래 상태로 복원 가능

### 4. 로깅
- 모든 명령어 실행 결과 로그 기록
- 타임스탬프 포함
- 표준 출력/에러 분리

### 5. 스크립트 구조
```bash
#!/bin/bash
set -euo pipefail  # 에러 시 즉시 중단

# 설정
LOG_FILE="/tmp/vbip_recovery_$$.log"
BACKUP_DIR="/tmp/vbip_backup_$$"

# 함수 정의
log() {{
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}}

check_status() {{
    if [ $? -eq 0 ]; then
        log "SUCCESS: $1"
        return 0
    else
        log "FAILED: $1"
        return 1
    fi
}}

# 백업 생성
create_backup() {{
    log "Creating backup..."
    # 백업 로직
}}

# 복구 작업
recovery_step_1() {{
    log "Step 1: ..."
    # 복구 명령어
    check_status "Step 1"
}}

# 검증
verify_recovery() {{
    log "Verifying recovery..."
    # 검증 로직
}}

# 롤백
rollback() {{
    log "Rolling back..."
    # 롤백 로직
}}

# 메인 실행
main() {{
    log "=== Recovery started ==="
    
    create_backup || {{ log "Backup failed"; exit 1; }}
    
    recovery_step_1 || {{ rollback; exit 1; }}
    # ... 추가 단계
    
    verify_recovery || {{ rollback; exit 1; }}
    
    log "=== Recovery completed successfully ==="
    exit 0
}}

# 시그널 핸들러
trap 'rollback; exit 1' INT TERM

main
```

## 출력 형식
JSON 형식으로 응답하세요:
```json
{{
  "script": "#!/bin/bash\\n...",
  "steps": [
    {{"step": 1, "description": "...", "commands": ["cmd1", "cmd2"]}},
    ...
  ],
  "estimated_time": "5-10분",
  "risk_level": "LOW|MEDIUM|HIGH",
  "rollback_possible": true,
  "pre_checks": ["check1", "check2"],
  "post_checks": ["verify1", "verify2"]
}}
```

**중요**: 절대로 데이터를 삭제하거나 시스템을 중단시키는 명령어를 포함하지 마세요!
"""
    
    # ============================================
    # Verification Prompt
    # ============================================
    VERIFICATION_PROMPT = """
다음 복구 스크립트 실행 결과를 분석하고, 복구가 성공했는지 판정하세요.

## 원래 문제
{original_error}

## 실행된 스크립트
{executed_script}

## 실행 로그
{execution_log}

## 현재 상태 확인 결과
{current_status}

## 판정 기준
1. 원래 에러가 해결되었는가?
2. 새로운 문제가 발생하지 않았는가?
3. 서비스가 정상 작동하는가?

JSON 응답:
```json
{{
  "success": true/false,
  "reason": "판정 이유",
  "confidence": 0.0-1.0,
  "new_issues": ["issue1", ...],
  "recommendations": ["추가 조치 사항"]
}}
```
"""
    
    # ============================================
    # NetBackup Commands Library (확장)
    # ============================================
    NETBACKUP_COMMANDS = {
        'service_control': {
            'start': 'bpup -f -v',
            'stop': 'bpdown -f -v',
            'restart': 'bpdown -f -v && sleep 5 && bpup -f -v',
            'status': 'bpps -a'
        },
        'process_management': {
            'restart_nbpem': 'bpdown -f -v nbpem && bpup -f -v nbpem',
            'restart_nbjm': 'bpdown -f -v nbjm && bpup -f -v nbjm',
        },
        'media_operations': {
            'rescan_robot': 'vmchange -res',
            'query_media': 'vmquery -a',
            'list_storage': 'bpstulist -U',
        },
        'catalog_operations': {
            'check_consistency': 'bpdbm -consistency',
            'recalculate_expiry': 'bpexpdate -recalculate',
        },
        'diagnostic': {
            'check_errors': 'bperror -problems -hoursago 24',
            'test_client': 'bptestbpcd -client {hostname}',
            'network_diag': 'NBDNA -problem_report',
        },
        'cleanup': {
            'clear_shm': 'ipcrm -a',  # Shared memory cleanup
            'cleanup_logs': 'find /usr/openv/netbackup/logs -type f -mtime +7 -delete',
        }
    }
    
    # ============================================
    # Recovery Playbooks (사전 정의)
    # ============================================
    RECOVERY_PLAYBOOKS = {
        '13': {  # File read failed
            'name': 'File Read Error Recovery',
            'steps': [
                {
                    'step': 1,
                    'description': 'Check network connectivity',
                    'commands': ['ping -c 3 {client_host}'],
                    'validation': 'ping_success'
                },
                {
                    'step': 2,
                    'description': 'Restart nbpem service',
                    'commands': ['bpdown -f -v nbpem', 'sleep 5', 'bpup -f -v nbpem'],
                    'validation': 'service_running'
                },
                {
                    'step': 3,
                    'description': 'Verify service status',
                    'commands': ['bpps -a | grep nbpem'],
                    'validation': 'process_exists'
                }
            ],
            'rollback_steps': [
                # 서비스 재시작은 롤백 불필요 (stateless)
            ]
        },
        '83': {  # Media open error
            'name': 'Media Open Error Recovery',
            'steps': [
                {
                    'step': 1,
                    'description': 'Check drive status',
                    'commands': ['vmquery -a'],
                    'validation': 'drive_ready'
                },
                {
                    'step': 2,
                    'description': 'Rescan storage devices',
                    'commands': ['vmchange -res'],
                    'validation': 'scan_success'
                },
                {
                    'step': 3,
                    'description': 'Verify media loaded',
                    'commands': ['vmquery -a | grep {media_id}'],
                    'validation': 'media_found'
                }
            ]
        },
        '89': {  # Shared memory error
            'name': 'Shared Memory Cleanup',
            'steps': [
                {
                    'step': 1,
                    'description': 'Backup current IPC state',
                    'commands': ['ipcs > /tmp/ipcs_backup_$$.txt'],
                    'validation': 'file_created'
                },
                {
                    'step': 2,
                    'description': 'Clear shared memory segments',
                    'commands': ['ipcrm -a'],
                    'validation': 'shm_cleared'
                },
                {
                    'step': 3,
                    'description': 'Restart NetBackup services',
                    'commands': ['bpdown -f -v', 'sleep 10', 'bpup -f -v'],
                    'validation': 'services_running'
                }
            ]
        }
    }
    
    # ============================================
    # Database Configuration
    # ============================================
    # Phase 3-A와 공유
    DB_HOST = os.getenv('DB_HOST', 'localhost')
    DB_PORT = int(os.getenv('DB_PORT', '5432'))
    DB_NAME = os.getenv('DB_NAME', 'veritas_monitor')
    DB_USER = os.getenv('DB_USER', 'vbip_user')
    DB_PASSWORD = os.getenv('DB_PASSWORD', '')
    
    @classmethod
    def validate(cls) -> bool:
        """설정 검증"""
        errors = []
        
        if not cls.OPENAI_API_KEY:
            errors.append("OPENAI_API_KEY가 설정되지 않았습니다.")
        
        if not cls.SLACK_WEBHOOK_URL:
            errors.append("SLACK_WEBHOOK_URL이 설정되지 않았습니다.")
        
        if not cls.DB_PASSWORD:
            errors.append("DB_PASSWORD가 설정되지 않았습니다.")
        
        if errors:
            print("❌ 설정 오류:")
            for error in errors:
                print(f"  - {error}")
            return False
        
        print("✅ 설정 검증 완료")
        return True
    
    @classmethod
    def print_config(cls):
        """현재 설정 출력"""
        print("=" * 60)
        print("V-BIP Phase 4 Auto Recovery Configuration")
        print("=" * 60)
        print(f"OpenAI Model: {cls.OPENAI_MODEL}")
        print(f"SSH Timeout: {cls.SSH_TIMEOUT}s")
        print(f"Max Retries: {cls.MAX_RETRIES}")
        print(f"Blacklist Commands: {len(cls.BLACKLIST_COMMANDS)}")
        print(f"Safe Commands: {len(cls.SAFE_COMMANDS)}")
        print(f"Predefined Playbooks: {len(cls.RECOVERY_PLAYBOOKS)}")
        print(f"Customer Servers: {len(cls.CUSTOMER_SERVERS)}")
        print("=" * 60)


if __name__ == "__main__":
    RecoveryConfig.print_config()
    RecoveryConfig.validate()
