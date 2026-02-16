"""
V-BIP Phase 4: Auto Recovery Manager
자동 복구 통합 관리자 (Phase 3-B 진단 → Phase 4 자동 복구)
"""

import json
import time
from typing import Dict, List, Any, Optional
from datetime import datetime
from enum import Enum

try:
    from loguru import logger
except ImportError:
    print("⚠️ pip install loguru")

from config_recovery import RecoveryConfig
from script_generator import ScriptGenerator
from remote_executor import RemoteExecutor


class RecoveryStatus(Enum):
    """복구 상태"""
    PENDING = "pending"  # 대기 중
    APPROVED = "approved"  # 승인됨
    RUNNING = "running"  # 실행 중
    SUCCESS = "success"  # 성공
    FAILED = "failed"  # 실패
    ROLLED_BACK = "rolled_back"  # 롤백됨
    TIMEOUT = "timeout"  # 시간 초과


class AutoRecoveryManager:
    """자동 복구 통합 관리자"""
    
    def __init__(self):
        self.config = RecoveryConfig
        self.script_generator = ScriptGenerator()
        self.executor = RemoteExecutor()
        
        # 복구 작업 히스토리
        self.recovery_history: List[Dict[str, Any]] = []
        
        logger.info("=" * 60)
        logger.info("🤖 AutoRecoveryManager 초기화 완료")
        logger.info("=" * 60)
    
    def process_diagnosis(
        self,
        diagnosis: Dict[str, Any],
        customer_name: str,
        auto_approve_level1: bool = True
    ) -> Dict[str, Any]:
        """
        진단 결과를 받아서 자동 복구 수행
        
        Args:
            diagnosis: Phase 3-B AI 진단 결과
            customer_name: 고객사명
            auto_approve_level1: LEVEL_1 자동 승인 여부
            
        Returns:
            복구 결과
        """
        logger.info("=" * 70)
        logger.info("🚀 자동 복구 프로세스 시작")
        logger.info("=" * 70)
        
        automation_level = diagnosis.get('automation_level', 'LEVEL_3')
        error_code = diagnosis.get('metadata', {}).get('error_code', 'Unknown')
        
        logger.info(f"고객사: {customer_name}")
        logger.info(f"에러 코드: {error_code}")
        logger.info(f"자동화 레벨: {automation_level}")
        
        # 복구 작업 ID 생성
        recovery_id = f"REC-{int(time.time())}"
        
        recovery_task = {
            'recovery_id': recovery_id,
            'customer_name': customer_name,
            'diagnosis': diagnosis,
            'automation_level': automation_level,
            'status': RecoveryStatus.PENDING.value,
            'created_at': datetime.now().isoformat(),
            'steps': []
        }
        
        # 1. 자동화 레벨에 따른 분기
        if automation_level == 'LEVEL_3':
            # 가이드만 제공
            logger.info("📋 LEVEL_3: 가이드만 제공 (자동 복구 없음)")
            recovery_task['status'] = RecoveryStatus.PENDING.value
            recovery_task['message'] = "수동 조치가 필요합니다. 엔지니어에게 가이드를 전달했습니다."
            return recovery_task
        
        # 2. 복구 스크립트 생성
        logger.info("🛠️ Step 1: 복구 스크립트 생성")
        recovery_task['steps'].append({
            'step': 'generate_script',
            'started_at': datetime.now().isoformat()
        })
        
        script_info = self.script_generator.generate_recovery_script(
            diagnosis=diagnosis,
            customer_name=customer_name
        )
        
        recovery_task['script_info'] = script_info
        recovery_task['steps'][-1]['completed_at'] = datetime.now().isoformat()
        recovery_task['steps'][-1]['success'] = True
        
        # 3. 안전성 검증
        safety_check = script_info.get('safety_check', {})
        
        if not safety_check.get('is_safe'):
            logger.error("❌ 안전성 검증 실패!")
            recovery_task['status'] = RecoveryStatus.FAILED.value
            recovery_task['failure_reason'] = 'Safety validation failed'
            recovery_task['violations'] = safety_check.get('violations', [])
            return recovery_task
        
        logger.success("✅ 안전성 검증 통과")
        
        # 4. 승인 프로세스
        if automation_level == 'LEVEL_1' and auto_approve_level1:
            # 자동 승인
            logger.info("✅ LEVEL_1: 자동 승인")
            recovery_task['status'] = RecoveryStatus.APPROVED.value
            recovery_task['approved_at'] = datetime.now().isoformat()
            recovery_task['approved_by'] = 'AUTO'
            
        elif automation_level == 'LEVEL_2':
            # Slack 승인 대기
            logger.info("⏳ LEVEL_2: Slack 승인 대기")
            recovery_task['status'] = RecoveryStatus.PENDING.value
            recovery_task['message'] = "Slack에서 승인을 기다리고 있습니다."
            
            # TODO: Slack Interactive 버튼 전송
            # self.send_slack_approval_request(recovery_task)
            
            # 테스트를 위해 자동 승인 (실제로는 Slack 응답 대기)
            logger.warning("⚠️ [테스트 모드] 자동 승인 (실제로는 Slack 대기)")
            recovery_task['status'] = RecoveryStatus.APPROVED.value
            recovery_task['approved_at'] = datetime.now().isoformat()
            recovery_task['approved_by'] = 'TEST_AUTO'
        
        # 5. 승인되었으면 실행
        if recovery_task['status'] == RecoveryStatus.APPROVED.value:
            execution_result = self._execute_recovery(
                recovery_task=recovery_task,
                customer_name=customer_name
            )
            
            recovery_task.update(execution_result)
        
        # 6. 히스토리에 기록
        self.recovery_history.append(recovery_task)
        
        return recovery_task
    
    def _execute_recovery(
        self,
        recovery_task: Dict[str, Any],
        customer_name: str
    ) -> Dict[str, Any]:
        """
        실제 복구 실행
        
        Args:
            recovery_task: 복구 작업 정보
            customer_name: 고객사명
            
        Returns:
            실행 결과
        """
        logger.info("=" * 60)
        logger.info("⚡ Step 2: 복구 실행")
        logger.info("=" * 60)
        
        recovery_task['steps'].append({
            'step': 'execute_recovery',
            'started_at': datetime.now().isoformat()
        })
        
        # 1. 고객사 서버 정보 조회
        server_info = self.config.CUSTOMER_SERVERS.get(customer_name)
        
        if not server_info:
            logger.error(f"❌ 고객사 서버 정보 없음: {customer_name}")
            return {
                'status': RecoveryStatus.FAILED.value,
                'failure_reason': 'Customer server info not found',
                'execution_result': None
            }
        
        # 2. SSH 연결
        logger.info(f"🔐 SSH 연결: {server_info['host']}")
        
        connected = self.executor.connect(
            host=server_info['host'],
            port=server_info.get('port', 22),
            username=server_info['username'],
            auth_method=server_info.get('auth_method', 'key')
        )
        
        if not connected:
            logger.error("❌ SSH 연결 실패")
            return {
                'status': RecoveryStatus.FAILED.value,
                'failure_reason': 'SSH connection failed',
                'execution_result': None
            }
        
        try:
            # 3. 백업 생성 (중요 파일)
            logger.info("💾 Step 3: 백업 생성")
            backup_paths = [
                '/usr/openv/netbackup/bp.conf',
                '/usr/openv/netbackup/db/config',
            ]
            
            backup_info = self.executor.create_backup(backup_paths)
            recovery_task['backup_info'] = backup_info
            
            # 4. 스크립트 실행
            logger.info("⚡ Step 4: 스크립트 실행")
            recovery_task['status'] = RecoveryStatus.RUNNING.value
            
            script_content = recovery_task['script_info']['script']
            automation_level = recovery_task['automation_level']
            timeout = self.config.SCRIPT_TIMEOUT.get(automation_level, 300)
            
            execution_result = self.executor.execute_script(
                script_content=script_content,
                timeout=timeout
            )
            
            recovery_task['execution_result'] = execution_result
            recovery_task['steps'][-1]['completed_at'] = datetime.now().isoformat()
            recovery_task['steps'][-1]['success'] = execution_result['success']
            
            # 5. 실행 결과 검증
            logger.info("🔍 Step 5: 결과 검증")
            
            if execution_result['success']:
                # 추가 검증: NetBackup 상태 확인
                status_check = self.executor.verify_netbackup_status()
                recovery_task['status_check'] = status_check
                
                # 모든 체크가 성공했는지 확인
                all_ok = all(
                    check['success']
                    for check in status_check.values()
                )
                
                if all_ok:
                    logger.success("✅ 복구 성공!")
                    recovery_task['status'] = RecoveryStatus.SUCCESS.value
                else:
                    logger.warning("⚠️ 스크립트는 성공했으나 상태 확인 실패")
                    recovery_task['status'] = RecoveryStatus.FAILED.value
                    recovery_task['failure_reason'] = 'Post-execution validation failed'
            else:
                logger.error("❌ 스크립트 실행 실패")
                recovery_task['status'] = RecoveryStatus.FAILED.value
                recovery_task['failure_reason'] = f"Script failed: exit code {execution_result['exit_code']}"
                
                # 6. 롤백 (실패 시)
                if backup_info.get('success'):
                    logger.info("🔄 Step 6: 롤백 시도")
                    rollback_success = self.executor.rollback(backup_info)
                    
                    if rollback_success:
                        recovery_task['status'] = RecoveryStatus.ROLLED_BACK.value
                        logger.success("✅ 롤백 성공")
                    else:
                        logger.error("❌ 롤백 실패")
            
        except Exception as e:
            logger.error(f"❌ 예상치 못한 오류: {e}")
            recovery_task['status'] = RecoveryStatus.FAILED.value
            recovery_task['failure_reason'] = str(e)
        
        finally:
            # SSH 연결 종료
            self.executor.disconnect()
        
        recovery_task['completed_at'] = datetime.now().isoformat()
        
        return recovery_task
    
    def get_recovery_summary(self, recovery_task: Dict[str, Any]) -> str:
        """복구 작업 요약 (Slack 알림용)"""
        
        status = recovery_task.get('status', 'Unknown')
        customer = recovery_task.get('customer_name', 'Unknown')
        automation_level = recovery_task.get('automation_level', 'Unknown')
        
        # 상태 이모지
        status_emoji = {
            RecoveryStatus.SUCCESS.value: '✅',
            RecoveryStatus.FAILED.value: '❌',
            RecoveryStatus.ROLLED_BACK.value: '🔄',
            RecoveryStatus.RUNNING.value: '⚡',
            RecoveryStatus.PENDING.value: '⏳',
        }.get(status, '❓')
        
        summary = f"""
{status_emoji} **자동 복구 결과**

**고객사:** {customer}
**복구 ID:** {recovery_task.get('recovery_id', 'Unknown')}
**자동화 레벨:** {automation_level}
**상태:** {status.upper()}

**진단 정보:**
• 에러 코드: {recovery_task.get('diagnosis', {}).get('metadata', {}).get('error_code', 'Unknown')}
• 신뢰도: {recovery_task.get('diagnosis', {}).get('신뢰도', 'N/A')}

**실행 정보:**
• 생성 시간: {recovery_task.get('created_at', 'Unknown')}
• 완료 시간: {recovery_task.get('completed_at', '진행 중')}
"""
        
        # 실행 결과
        exec_result = recovery_task.get('execution_result')
        if exec_result:
            summary += f"\n**실행 결과:**\n"
            summary += f"• Exit Code: {exec_result.get('exit_code', 'N/A')}\n"
            summary += f"• 소요 시간: {exec_result.get('duration', 'N/A')}초\n"
        
        # 실패 사유
        if status == RecoveryStatus.FAILED.value:
            summary += f"\n**실패 사유:** {recovery_task.get('failure_reason', 'Unknown')}\n"
        
        return summary.strip()


def main():
    """테스트 실행"""
    
    # 테스트 진단 결과 (Phase 3-B 출력)
    test_diagnosis = {
        'error_code': '89',
        '원인_분석': [
            'Shared memory segment 오류',
            'IPC 리소스 고갈'
        ],
        '해결_방안': [
            'Shared memory 정리 (ipcrm)',
            'NetBackup 서비스 재시작'
        ],
        'automation_level': 'LEVEL_1',  # 자동 실행
        '신뢰도': 0.92,
        '위험도': 2,
        'metadata': {
            'error_code': '89',
            'customer_name': '서울우유본사',
            'error_message': 'Shared memory segment error'
        }
    }
    
    # 자동 복구 매니저 초기화
    manager = AutoRecoveryManager()
    
    # 복구 실행
    print("\n⚠️ 주의: 실제 고객사 서버 정보가 config에 설정되어 있어야 합니다.\n")
    
    recovery_result = manager.process_diagnosis(
        diagnosis=test_diagnosis,
        customer_name='서울우유본사',
        auto_approve_level1=True
    )
    
    # 결과 출력
    print("\n" + "=" * 60)
    print("📊 복구 결과")
    print("=" * 60)
    print(json.dumps(recovery_result, indent=2, ensure_ascii=False, default=str))
    
    # 요약
    print("\n" + "=" * 60)
    print("📱 Slack 알림 메시지")
    print("=" * 60)
    print(manager.get_recovery_summary(recovery_result))


if __name__ == "__main__":
    main()
