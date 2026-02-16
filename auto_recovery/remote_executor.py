"""
V-BIP Phase 4: Remote Execution Engine
SSH를 통한 원격 스크립트 실행
"""

import os
import time
import tempfile
from typing import Dict, List, Any, Optional, Tuple
from datetime import datetime
from pathlib import Path

try:
    import paramiko
    from loguru import logger
except ImportError as e:
    print(f"⚠️ 필요한 라이브러리를 설치하세요: pip install paramiko loguru")

from config_recovery import RecoveryConfig


class RemoteExecutor:
    """원격 스크립트 실행 엔진"""
    
    def __init__(self):
        self.config = RecoveryConfig
        self.ssh_client = None
        logger.info("✅ RemoteExecutor 초기화 완료")
    
    def connect(
        self,
        host: str,
        username: str,
        port: int = 22,
        auth_method: str = 'key',
        password: Optional[str] = None,
        key_path: Optional[str] = None
    ) -> bool:
        """
        SSH 연결 수립
        
        Args:
            host: 서버 주소
            username: 사용자명
            port: SSH 포트
            auth_method: 인증 방법 ('key' or 'password')
            password: 비밀번호 (auth_method='password' 시)
            key_path: SSH 키 경로 (auth_method='key' 시)
            
        Returns:
            연결 성공 여부
        """
        logger.info(f"🔐 SSH 연결 시도: {username}@{host}:{port}")
        
        try:
            self.ssh_client = paramiko.SSHClient()
            self.ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            
            if auth_method == 'key':
                key_file = key_path or os.path.expanduser(self.config.SSH_KEY_PATH)
                logger.info(f"   키 파일: {key_file}")
                
                self.ssh_client.connect(
                    hostname=host,
                    port=port,
                    username=username,
                    key_filename=key_file,
                    timeout=self.config.SSH_TIMEOUT
                )
            else:  # password
                if not password:
                    raise ValueError("비밀번호가 필요합니다.")
                
                self.ssh_client.connect(
                    hostname=host,
                    port=port,
                    username=username,
                    password=password,
                    timeout=self.config.SSH_TIMEOUT
                )
            
            logger.success(f"✅ SSH 연결 성공: {host}")
            return True
            
        except Exception as e:
            logger.error(f"❌ SSH 연결 실패: {e}")
            return False
    
    def execute_script(
        self,
        script_content: str,
        timeout: int = 300,
        working_dir: str = '/tmp'
    ) -> Dict[str, Any]:
        """
        원격 서버에서 스크립트 실행
        
        Args:
            script_content: 실행할 스크립트 내용
            timeout: 실행 시간 제한 (초)
            working_dir: 작업 디렉토리
            
        Returns:
            실행 결과 (stdout, stderr, exit_code, duration)
        """
        if not self.ssh_client:
            logger.error("❌ SSH 연결되지 않음")
            return {
                'success': False,
                'error': 'SSH not connected',
                'stdout': '',
                'stderr': '',
                'exit_code': -1
            }
        
        logger.info("=" * 60)
        logger.info("🚀 원격 스크립트 실행 시작")
        logger.info("=" * 60)
        
        start_time = time.time()
        
        try:
            # 1. 스크립트를 임시 파일로 전송
            remote_script_path = f"{working_dir}/vbip_recovery_{int(time.time())}.sh"
            logger.info(f"📤 스크립트 업로드: {remote_script_path}")
            
            sftp = self.ssh_client.open_sftp()
            with sftp.open(remote_script_path, 'w') as f:
                f.write(script_content)
            
            # 실행 권한 부여
            sftp.chmod(remote_script_path, 0o755)
            sftp.close()
            
            logger.success("✅ 스크립트 업로드 완료")
            
            # 2. 스크립트 실행
            logger.info(f"⚡ 실행 중 (timeout: {timeout}s)...")
            
            exec_command = f"cd {working_dir} && {remote_script_path}"
            stdin, stdout, stderr = self.ssh_client.exec_command(
                exec_command,
                timeout=timeout
            )
            
            # 3. 출력 수집 (실시간 로깅)
            stdout_lines = []
            stderr_lines = []
            
            # stdout 읽기
            for line in stdout:
                line = line.strip()
                stdout_lines.append(line)
                logger.info(f"[STDOUT] {line}")
            
            # stderr 읽기
            for line in stderr:
                line = line.strip()
                stderr_lines.append(line)
                if line:  # 비어있지 않으면 경고 레벨
                    logger.warning(f"[STDERR] {line}")
            
            exit_code = stdout.channel.recv_exit_status()
            
            end_time = time.time()
            duration = end_time - start_time
            
            # 4. 결과 정리
            result = {
                'success': exit_code == 0,
                'exit_code': exit_code,
                'stdout': '\n'.join(stdout_lines),
                'stderr': '\n'.join(stderr_lines),
                'duration': round(duration, 2),
                'started_at': datetime.fromtimestamp(start_time).isoformat(),
                'finished_at': datetime.fromtimestamp(end_time).isoformat(),
                'remote_script_path': remote_script_path
            }
            
            if exit_code == 0:
                logger.success(f"✅ 실행 성공 (소요: {duration:.1f}초)")
            else:
                logger.error(f"❌ 실행 실패 (exit code: {exit_code})")
            
            # 5. 정리 (스크립트 파일 삭제)
            try:
                self.ssh_client.exec_command(f"rm -f {remote_script_path}")
                logger.info("🗑️ 임시 스크립트 삭제 완료")
            except:
                pass
            
            return result
            
        except paramiko.SSHException as e:
            logger.error(f"❌ SSH 실행 오류: {e}")
            return {
                'success': False,
                'error': str(e),
                'exit_code': -1,
                'stdout': '',
                'stderr': str(e),
                'duration': time.time() - start_time
            }
        except Exception as e:
            logger.error(f"❌ 예상치 못한 오류: {e}")
            return {
                'success': False,
                'error': str(e),
                'exit_code': -1,
                'stdout': '',
                'stderr': str(e),
                'duration': time.time() - start_time
            }
    
    def execute_command(
        self,
        command: str,
        timeout: int = 30
    ) -> Tuple[str, str, int]:
        """
        단일 명령어 실행
        
        Args:
            command: 실행할 명령어
            timeout: 실행 시간 제한 (초)
            
        Returns:
            (stdout, stderr, exit_code)
        """
        if not self.ssh_client:
            return '', 'SSH not connected', -1
        
        try:
            stdin, stdout, stderr = self.ssh_client.exec_command(
                command,
                timeout=timeout
            )
            
            stdout_text = stdout.read().decode('utf-8')
            stderr_text = stderr.read().decode('utf-8')
            exit_code = stdout.channel.recv_exit_status()
            
            return stdout_text, stderr_text, exit_code
            
        except Exception as e:
            return '', str(e), -1
    
    def verify_netbackup_status(self) -> Dict[str, Any]:
        """
        NetBackup 서비스 상태 확인
        
        Returns:
            서비스 상태 정보
        """
        logger.info("🔍 NetBackup 상태 확인 중...")
        
        checks = {
            'services': 'bpps -a',
            'errors': 'bperror -problems -hoursago 1',
            'disk_usage': 'df -h /usr/openv',
        }
        
        results = {}
        
        for check_name, command in checks.items():
            stdout, stderr, exit_code = self.execute_command(command, timeout=30)
            
            results[check_name] = {
                'command': command,
                'success': exit_code == 0,
                'output': stdout,
                'error': stderr
            }
            
            if exit_code == 0:
                logger.success(f"✅ {check_name}: OK")
            else:
                logger.warning(f"⚠️ {check_name}: FAILED")
        
        return results
    
    def create_backup(self, paths: List[str]) -> Dict[str, Any]:
        """
        설정 파일 백업 생성
        
        Args:
            paths: 백업할 경로 목록
            
        Returns:
            백업 정보
        """
        backup_dir = f"/tmp/vbip_backup_{int(time.time())}"
        logger.info(f"💾 백업 생성 중: {backup_dir}")
        
        # 백업 디렉토리 생성
        stdout, stderr, exit_code = self.execute_command(f"mkdir -p {backup_dir}")
        
        if exit_code != 0:
            logger.error(f"❌ 백업 디렉토리 생성 실패: {stderr}")
            return {'success': False, 'error': stderr}
        
        backed_up_files = []
        
        for path in paths:
            # 파일 존재 확인
            stdout, stderr, exit_code = self.execute_command(f"test -e {path} && echo 'exists'")
            
            if 'exists' in stdout:
                # 백업 수행
                filename = os.path.basename(path)
                backup_path = f"{backup_dir}/{filename}"
                
                stdout, stderr, exit_code = self.execute_command(f"cp -p {path} {backup_path}")
                
                if exit_code == 0:
                    backed_up_files.append({
                        'original': path,
                        'backup': backup_path
                    })
                    logger.success(f"✅ 백업 완료: {path} → {backup_path}")
                else:
                    logger.warning(f"⚠️ 백업 실패: {path}")
        
        return {
            'success': True,
            'backup_dir': backup_dir,
            'files': backed_up_files,
            'count': len(backed_up_files)
        }
    
    def rollback(self, backup_info: Dict[str, Any]) -> bool:
        """
        백업으로부터 복원
        
        Args:
            backup_info: create_backup()의 반환값
            
        Returns:
            복원 성공 여부
        """
        logger.info("🔄 롤백 시작...")
        
        if not backup_info.get('success'):
            logger.error("❌ 유효한 백업 정보가 없습니다.")
            return False
        
        files = backup_info.get('files', [])
        restored = 0
        
        for file_info in files:
            original = file_info['original']
            backup = file_info['backup']
            
            stdout, stderr, exit_code = self.execute_command(f"cp -p {backup} {original}")
            
            if exit_code == 0:
                logger.success(f"✅ 복원 완료: {backup} → {original}")
                restored += 1
            else:
                logger.error(f"❌ 복원 실패: {original}")
        
        success = restored == len(files)
        
        if success:
            logger.success(f"✅ 롤백 성공: {restored}개 파일 복원")
        else:
            logger.warning(f"⚠️ 부분 롤백: {restored}/{len(files)}개 파일 복원")
        
        return success
    
    def disconnect(self):
        """SSH 연결 종료"""
        if self.ssh_client:
            self.ssh_client.close()
            logger.info("🔌 SSH 연결 종료")
            self.ssh_client = None


def main():
    """테스트 실행 (로컬)"""
    
    # 테스트 스크립트
    test_script = """#!/bin/bash
set -euo pipefail

LOG_FILE="/tmp/vbip_test_$$.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

log "=== Test script started ==="

log "Step 1: System info"
uname -a

log "Step 2: Date"
date

log "Step 3: Uptime"
uptime

log "=== Test script completed ==="
exit 0
"""
    
    print("\n" + "=" * 60)
    print("🧪 RemoteExecutor 테스트")
    print("=" * 60)
    print("\n⚠️ 참고: 실제 원격 서버가 필요합니다.")
    print("로컬 테스트를 위해서는 localhost에 SSH 서버가 실행 중이어야 합니다.\n")
    
    # 설정
    test_host = input("SSH 호스트 (엔터: localhost): ").strip() or "localhost"
    test_user = input("SSH 사용자 (엔터: 현재 사용자): ").strip() or os.getenv('USER')
    
    executor = RemoteExecutor()
    
    # 연결
    connected = executor.connect(
        host=test_host,
        username=test_user,
        auth_method='key'
    )
    
    if not connected:
        print("❌ SSH 연결 실패")
        return
    
    # 스크립트 실행
    result = executor.execute_script(test_script, timeout=60)
    
    print("\n" + "=" * 60)
    print("📊 실행 결과")
    print("=" * 60)
    print(f"성공: {result['success']}")
    print(f"Exit Code: {result['exit_code']}")
    print(f"소요 시간: {result['duration']}초")
    print(f"\nSTDOUT:")
    print(result['stdout'])
    if result['stderr']:
        print(f"\nSTDERR:")
        print(result['stderr'])
    
    # 연결 종료
    executor.disconnect()


if __name__ == "__main__":
    main()
