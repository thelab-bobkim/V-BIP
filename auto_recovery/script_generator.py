"""
V-BIP Phase 4: Recovery Script Generator
AI 기반 복구 스크립트 자동 생성
"""

import json
import re
from typing import Dict, List, Any, Optional
from datetime import datetime

try:
    from openai import OpenAI
    from loguru import logger
except ImportError as e:
    print(f"⚠️ 필요한 라이브러리를 설치하세요: {e}")

from config_recovery import RecoveryConfig


class ScriptGenerator:
    """AI 기반 복구 스크립트 생성기"""
    
    def __init__(self):
        self.config = RecoveryConfig
        self.client = OpenAI(api_key=self.config.OPENAI_API_KEY)
        logger.info("✅ ScriptGenerator 초기화 완료")
    
    def generate_recovery_script(
        self,
        diagnosis: Dict[str, Any],
        customer_name: str,
        server_info: Optional[Dict[str, str]] = None
    ) -> Dict[str, Any]:
        """
        진단 결과로부터 복구 스크립트 생성
        
        Args:
            diagnosis: AI 진단 결과 (Phase 3-B)
            customer_name: 고객사명
            server_info: 서버 정보 (OS, NetBackup 버전 등)
            
        Returns:
            생성된 스크립트 + 메타데이터
        """
        logger.info("=" * 60)
        logger.info("🛠️ 복구 스크립트 생성 시작")
        logger.info("=" * 60)
        
        # 1. 에러 코드 확인
        error_code = diagnosis.get('metadata', {}).get('error_code', 'Unknown')
        automation_level = diagnosis.get('automation_level', 'LEVEL_3')
        
        logger.info(f"에러 코드: {error_code}")
        logger.info(f"자동화 레벨: {automation_level}")
        
        # 2. 사전 정의된 Playbook이 있는지 확인
        if error_code in self.config.RECOVERY_PLAYBOOKS:
            logger.info(f"📚 사전 정의된 Playbook 발견: {error_code}")
            return self._use_predefined_playbook(error_code, diagnosis, customer_name)
        
        # 3. AI로 새 스크립트 생성
        logger.info("🤖 AI 스크립트 생성 시작...")
        return self._generate_with_ai(diagnosis, customer_name, server_info)
    
    def _use_predefined_playbook(
        self,
        error_code: str,
        diagnosis: Dict[str, Any],
        customer_name: str
    ) -> Dict[str, Any]:
        """사전 정의된 Playbook 사용"""
        playbook = self.config.RECOVERY_PLAYBOOKS[error_code]
        
        logger.info(f"📖 Playbook: {playbook['name']}")
        
        # Bash 스크립트 생성
        script_lines = [
            "#!/bin/bash",
            "set -euo pipefail",
            "",
            f"# Auto-generated recovery script for Error {error_code}",
            f"# Customer: {customer_name}",
            f"# Generated: {datetime.now().isoformat()}",
            "",
            "LOG_FILE=\"/tmp/vbip_recovery_$$.log\"",
            "BACKUP_DIR=\"/tmp/vbip_backup_$$\"",
            "",
            "log() {",
            "    echo \"[$(date '+%Y-%m-%d %H:%M:%S')] $*\" | tee -a \"$LOG_FILE\"",
            "}",
            "",
            "check_status() {",
            "    if [ $? -eq 0 ]; then",
            "        log \"SUCCESS: $1\"",
            "        return 0",
            "    else",
            "        log \"FAILED: $1\"",
            "        return 1",
            "    fi",
            "}",
            "",
            "log \"=== Recovery started ===\"",
            ""
        ]
        
        # 각 단계 추가
        for step_info in playbook['steps']:
            step_num = step_info['step']
            description = step_info['description']
            commands = step_info['commands']
            
            script_lines.append(f"# Step {step_num}: {description}")
            script_lines.append(f"log \"Step {step_num}: {description}\"")
            
            for cmd in commands:
                script_lines.append(f"{cmd}")
                script_lines.append(f"check_status \"Step {step_num}: {description}\" || exit 1")
            
            script_lines.append("")
        
        script_lines.extend([
            "log \"=== Recovery completed successfully ===\"",
            "exit 0"
        ])
        
        script = "\n".join(script_lines)
        
        # 안전성 검증
        safety_check = self.validate_script_safety(script)
        
        result = {
            'script': script,
            'steps': playbook['steps'],
            'estimated_time': self._estimate_execution_time(playbook['steps']),
            'risk_level': 'LOW',
            'rollback_possible': True,
            'source': 'predefined_playbook',
            'playbook_name': playbook['name'],
            'safety_check': safety_check,
            'generated_at': datetime.now().isoformat()
        }
        
        logger.success("✅ Playbook 기반 스크립트 생성 완료")
        return result
    
    def _generate_with_ai(
        self,
        diagnosis: Dict[str, Any],
        customer_name: str,
        server_info: Optional[Dict[str, str]]
    ) -> Dict[str, Any]:
        """AI로 새 스크립트 생성"""
        
        # 서버 정보 기본값
        if not server_info:
            server_info = {
                'os': 'Linux (Ubuntu/CentOS)',
                'netbackup_version': '5.x Appliance'
            }
        
        # 프롬프트 생성
        prompt = self.config.RECOVERY_SCRIPT_PROMPT.format(
            diagnosis_result=json.dumps(diagnosis, indent=2, ensure_ascii=False),
            customer_name=customer_name,
            server_os=server_info.get('os', 'Unknown'),
            netbackup_version=server_info.get('netbackup_version', 'Unknown')
        )
        
        try:
            response = self.client.chat.completions.create(
                model=self.config.OPENAI_MODEL,
                messages=[
                    {
                        "role": "system",
                        "content": "당신은 Veritas NetBackup 전문가입니다. 안전한 복구 스크립트를 생성합니다."
                    },
                    {
                        "role": "user",
                        "content": prompt
                    }
                ],
                temperature=self.config.OPENAI_TEMPERATURE,
                max_tokens=3000,
                response_format={"type": "json_object"}
            )
            
            result_text = response.choices[0].message.content
            result = json.loads(result_text)
            
            # 안전성 검증
            script = result.get('script', '')
            safety_check = self.validate_script_safety(script)
            result['safety_check'] = safety_check
            result['source'] = 'ai_generated'
            result['generated_at'] = datetime.now().isoformat()
            
            if not safety_check['is_safe']:
                logger.error(f"❌ 안전하지 않은 스크립트 감지!")
                logger.error(f"위반 사항: {safety_check['violations']}")
                result['approved'] = False
            else:
                logger.success("✅ 안전성 검증 통과")
                result['approved'] = True
            
            return result
            
        except Exception as e:
            logger.error(f"❌ AI 스크립트 생성 실패: {e}")
            return self._create_fallback_script(diagnosis, customer_name)
    
    def validate_script_safety(self, script: str) -> Dict[str, Any]:
        """
        스크립트 안전성 검증
        
        Args:
            script: Bash 스크립트
            
        Returns:
            검증 결과 (is_safe, violations, warnings)
        """
        violations = []
        warnings = []
        
        # 1. 블랙리스트 명령어 검사
        for dangerous_cmd in self.config.BLACKLIST_COMMANDS:
            if dangerous_cmd.lower() in script.lower():
                violations.append(f"금지된 명령어 발견: {dangerous_cmd}")
        
        # 2. 위험 명령어 검사 (경고만)
        for risky_cmd in self.config.RISKY_COMMANDS:
            if risky_cmd in script:
                warnings.append(f"위험 명령어 발견: {risky_cmd}")
        
        # 3. 필수 안전 장치 확인
        safety_features = {
            'set -e': 'set -e' in script or 'set -euo pipefail' in script,
            'error_handling': 'check_status' in script or '|| exit' in script,
            'logging': 'log(' in script or 'echo' in script,
        }
        
        missing_features = [k for k, v in safety_features.items() if not v]
        if missing_features:
            warnings.append(f"누락된 안전 기능: {', '.join(missing_features)}")
        
        # 4. 파일 삭제 명령어 검사
        delete_patterns = [
            r'rm\s+-[rf]+',
            r'rm\s+[^-]',
            r'unlink',
        ]
        for pattern in delete_patterns:
            if re.search(pattern, script):
                warnings.append(f"파일 삭제 명령어 발견: {pattern}")
        
        is_safe = len(violations) == 0
        
        return {
            'is_safe': is_safe,
            'violations': violations,
            'warnings': warnings,
            'checked_at': datetime.now().isoformat()
        }
    
    def _estimate_execution_time(self, steps: List[Dict]) -> str:
        """예상 실행 시간 계산"""
        total_seconds = 0
        
        for step in steps:
            commands = step.get('commands', [])
            # 명령어당 평균 5초 가정
            total_seconds += len(commands) * 5
            
            # sleep 명령어가 있으면 추가
            for cmd in commands:
                if 'sleep' in cmd:
                    match = re.search(r'sleep\s+(\d+)', cmd)
                    if match:
                        total_seconds += int(match.group(1))
        
        if total_seconds < 60:
            return f"{total_seconds}초"
        elif total_seconds < 3600:
            minutes = total_seconds // 60
            return f"{minutes}분"
        else:
            hours = total_seconds // 3600
            minutes = (total_seconds % 3600) // 60
            return f"{hours}시간 {minutes}분"
    
    def _create_fallback_script(
        self,
        diagnosis: Dict[str, Any],
        customer_name: str
    ) -> Dict[str, Any]:
        """AI 생성 실패 시 기본 스크립트"""
        
        script = """#!/bin/bash
set -euo pipefail

LOG_FILE="/tmp/vbip_fallback_$$.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

log "=== Fallback recovery script ==="
log "Customer: {customer_name}"
log "Error: {error_message}"

# Basic health check
log "Checking NetBackup services..."
bpps -a

log "Checking recent errors..."
bperror -problems -hoursago 24

log "=== Please review the logs and contact support if needed ==="
exit 0
""".format(
            customer_name=customer_name,
            error_message=diagnosis.get('metadata', {}).get('error_message', 'Unknown')
        )
        
        return {
            'script': script,
            'steps': [{'step': 1, 'description': 'Health check only', 'commands': ['bpps -a']}],
            'estimated_time': '1분',
            'risk_level': 'MINIMAL',
            'rollback_possible': True,
            'source': 'fallback',
            'safety_check': {'is_safe': True, 'violations': [], 'warnings': []},
            'generated_at': datetime.now().isoformat()
        }


def main():
    """테스트 실행"""
    
    # 테스트 진단 결과
    test_diagnosis = {
        'error_code': '83',
        '원인_분석': [
            '테이프 드라이브가 준비되지 않음',
            '미디어가 로드되지 않음'
        ],
        '해결_방안': [
            '드라이브 상태 확인 (vmquery -a)',
            '스토리지 장치 재스캔 (vmchange -res)'
        ],
        'automation_level': 'LEVEL_2',
        '신뢰도': 0.85,
        'metadata': {
            'error_code': '83',
            'customer_name': '서울우유본사',
            'error_message': 'Media open error on tape drive'
        }
    }
    
    # 스크립트 생성기 초기화
    generator = ScriptGenerator()
    
    # 스크립트 생성
    result = generator.generate_recovery_script(
        diagnosis=test_diagnosis,
        customer_name='서울우유본사'
    )
    
    # 결과 출력
    print("\n" + "=" * 60)
    print("생성된 복구 스크립트")
    print("=" * 60)
    print(f"출처: {result.get('source', 'Unknown')}")
    print(f"예상 시간: {result.get('estimated_time', 'Unknown')}")
    print(f"위험도: {result.get('risk_level', 'Unknown')}")
    print(f"롤백 가능: {result.get('rollback_possible', False)}")
    
    safety = result.get('safety_check', {})
    print(f"\n안전성 검증: {'✅ 통과' if safety.get('is_safe') else '❌ 실패'}")
    if safety.get('violations'):
        print(f"위반 사항: {safety['violations']}")
    if safety.get('warnings'):
        print(f"경고: {safety['warnings']}")
    
    print("\n스크립트 내용:")
    print("-" * 60)
    print(result.get('script', 'No script'))
    print("-" * 60)


if __name__ == "__main__":
    main()
