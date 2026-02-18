"""
V-BIP 2.3 Phase 2-2: Auto Recovery Manager (Enhanced)
2,804개 에러코드 DB 통합 및 자동 복구 실행
"""

import json
import psycopg2
from psycopg2.extras import RealDictCursor
from typing import Dict, List, Any, Optional
from datetime import datetime
import subprocess
from enum import Enum

# Database connection
DB_CONFIG = {
    'host': 'localhost',
    'port': 5432,
    'database': 'vbip',
    'user': 'vbip_user',
    'password': 'vbip_password_2024'
}

class RecoveryStatus(Enum):
    """복구 상태"""
    PENDING = "pending"
    APPROVED = "approved"
    RUNNING = "running"
    SUCCESS = "success"
    FAILED = "failed"
    ROLLED_BACK = "rolled_back"
    TIMEOUT = "timeout"

class AutoRecoveryManager:
    """자동 복구 통합 관리자 - DB 통합 버전"""
    
    def __init__(self):
        self.db_config = DB_CONFIG
        print("🤖 AutoRecoveryManager 초기화 완료 (DB 연결)")
    
    def get_db_connection(self):
        """데이터베이스 연결"""
        return psycopg2.connect(**self.db_config, cursor_factory=RealDictCursor)
    
    def get_error_pattern(self, error_code: str) -> Optional[Dict]:
        """에러코드로 패턴 정보 조회"""
        conn = self.get_db_connection()
        cur = conn.cursor()
        
        cur.execute("""
            SELECT 
                pattern_id, error_code, error_name, error_description,
                symptom, root_cause, troubleshooting_steps,
                auto_fix_script, auto_fix_enabled,
                severity, avg_resolution_minutes,
                resolution_level, ai_confidence_score,
                classification_reason
            FROM error_patterns
            WHERE error_code = %s
        """, (error_code,))
        
        result = cur.fetchone()
        cur.close()
        conn.close()
        
        return dict(result) if result else None
    
    def process_error(
        self,
        error_code: str,
        customer_name: str,
        context: Optional[Dict] = None,
        auto_approve_level1: bool = True
    ) -> Dict[str, Any]:
        """
        에러코드를 받아서 자동 복구 수행
        
        Args:
            error_code: NetBackup 에러 코드
            customer_name: 고객사명
            context: 추가 컨텍스트 (로그, 환경 정보 등)
            auto_approve_level1: Level 1 자동 승인 여부
            
        Returns:
            복구 결과
        """
        print("=" * 70)
        print("🚀 자동 복구 프로세스 시작")
        print("=" * 70)
        
        # 1. 에러코드 패턴 조회
        pattern = self.get_error_pattern(error_code)
        
        if not pattern:
            print(f"⚠️ 에러코드 {error_code}를 찾을 수 없습니다.")
            return {
                'success': False,
                'error_code': error_code,
                'message': f"에러코드 {error_code} 정보 없음"
            }
        
        print(f"✅ 에러코드: {error_code} ({pattern['error_name']})")
        print(f"📊 Resolution Level: {pattern['resolution_level']}")
        print(f"🎯 AI 신뢰도: {pattern['ai_confidence_score']}%")
        print(f"🔧 자동 수정 가능: {pattern['auto_fix_enabled']}")
        
        # 2. Resolution Level에 따른 처리
        resolution_level = pattern['resolution_level']
        
        if resolution_level == 3:
            # Level 3: 현장 지원 필요
            print("\n📋 Level 3: 현장 지원 필요 (자동 복구 불가)")
            return {
                'success': True,
                'action': 'manual_required',
                'error_code': error_code,
                'error_name': pattern['error_name'],
                'resolution_level': 3,
                'message': '현장 엔지니어 지원 필요',
                'troubleshooting_steps': pattern['troubleshooting_steps'],
                'customer_name': customer_name,
                'timestamp': datetime.now().isoformat()
            }
        
        elif resolution_level == 2:
            # Level 2: 엔지니어 승인 필요
            print("\n📋 Level 2: 엔지니어 승인 필요")
            return {
                'success': True,
                'action': 'approval_required',
                'error_code': error_code,
                'error_name': pattern['error_name'],
                'resolution_level': 2,
                'auto_fix_script': pattern['auto_fix_script'],
                'message': '엔지니어 승인 후 자동 복구 가능',
                'troubleshooting_steps': pattern['troubleshooting_steps'],
                'customer_name': customer_name,
                'timestamp': datetime.now().isoformat(),
                'approval_url': f'/api/incidents/{error_code}/approve'
            }
        
        elif resolution_level == 1:
            # Level 1: AI 자동 해결
            print("\n🤖 Level 1: AI 자동 해결 시작")
            
            if not auto_approve_level1:
                print("⚠️ Level 1 자동 승인이 비활성화되어 있습니다.")
                return {
                    'success': True,
                    'action': 'approval_required',
                    'error_code': error_code,
                    'resolution_level': 1,
                    'message': 'Level 1이지만 자동 승인 비활성화',
                    'customer_name': customer_name
                }
            
            # 자동 수정 스크립트 실행
            if pattern['auto_fix_enabled'] and pattern['auto_fix_script']:
                print(f"🛠️ 자동 수정 스크립트 실행:\n{pattern['auto_fix_script']}")
                
                # 시뮬레이션 모드 (실제 실행 안함)
                execution_result = self._simulate_script_execution(
                    pattern['auto_fix_script'],
                    customer_name,
                    context
                )
                
                # DB에 복구 히스토리 기록
                self._save_recovery_history(
                    error_code,
                    customer_name,
                    pattern,
                    execution_result
                )
                
                return {
                    'success': True,
                    'action': 'auto_recovered',
                    'error_code': error_code,
                    'error_name': pattern['error_name'],
                    'resolution_level': 1,
                    'execution_result': execution_result,
                    'message': '자동 복구 완료',
                    'customer_name': customer_name,
                    'timestamp': datetime.now().isoformat()
                }
            else:
                print("⚠️ 자동 수정 스크립트가 없습니다.")
                return {
                    'success': False,
                    'action': 'no_script',
                    'error_code': error_code,
                    'message': '자동 수정 스크립트 없음',
                    'customer_name': customer_name
                }
    
    def _simulate_script_execution(
        self,
        script: str,
        customer_name: str,
        context: Optional[Dict]
    ) -> Dict[str, Any]:
        """
        스크립트 실행 시뮬레이션 (안전을 위해 실제 실행 안함)
        실제 배포 시 remote_executor.py 사용
        """
        print(f"\n🔍 [시뮬레이션 모드] 스크립트 실행 중...")
        print(f"   Customer: {customer_name}")
        print(f"   Script: {script}")
        
        # 시뮬레이션 결과
        return {
            'status': 'success',
            'message': '시뮬레이션 성공 (실제 실행 안함)',
            'script': script,
            'execution_time_seconds': 2.5,
            'output': 'OK - Simulation completed',
            'timestamp': datetime.now().isoformat()
        }
    
    def _save_recovery_history(
        self,
        error_code: str,
        customer_name: str,
        pattern: Dict,
        execution_result: Dict
    ):
        """복구 히스토리 DB 저장"""
        conn = self.get_db_connection()
        cur = conn.cursor()
        
        try:
            # auto_recovery_logs 테이블에 저장
            cur.execute("""
                INSERT INTO auto_recovery_logs (
                    customer_id, error_code, recovery_method,
                    recovery_status, steps_executed, 
                    execution_time_seconds, success_flag,
                    error_message, rollback_required, rollback_completed
                ) VALUES (
                    (SELECT customer_id FROM customers WHERE customer_name = %s LIMIT 1),
                    %s, %s, %s, %s, %s, %s, %s, %s, %s
                )
            """, (
                customer_name,
                error_code,
                'auto_fix_script',
                execution_result['status'],
                json.dumps([{'script': execution_result['script']}]),
                execution_result.get('execution_time_seconds', 0),
                execution_result['status'] == 'success',
                execution_result.get('output', ''),
                False,
                False
            ))
            
            conn.commit()
            print("✅ 복구 히스토리 저장 완료")
            
        except Exception as e:
            print(f"⚠️ 복구 히스토리 저장 실패: {e}")
            conn.rollback()
        finally:
            cur.close()
            conn.close()
    
    def get_auto_fixable_errors(self, limit: int = 50) -> List[Dict]:
        """자동 수정 가능한 에러 목록 조회"""
        conn = self.get_db_connection()
        cur = conn.cursor()
        
        cur.execute("""
            SELECT 
                error_code, error_name, error_description,
                auto_fix_script, ai_confidence_score,
                avg_resolution_minutes
            FROM error_patterns
            WHERE resolution_level = 1 
              AND auto_fix_enabled = TRUE
              AND auto_fix_script IS NOT NULL
            ORDER BY ai_confidence_score DESC, error_code
            LIMIT %s
        """, (limit,))
        
        results = cur.fetchall()
        cur.close()
        conn.close()
        
        return [dict(row) for row in results]


def test_recovery_manager():
    """테스트 함수"""
    print("\n" + "=" * 70)
    print("🧪 AutoRecoveryManager 테스트")
    print("=" * 70 + "\n")
    
    manager = AutoRecoveryManager()
    
    # 1. Level 1 에러 테스트 (자동 수정 가능)
    print("\n--- Test 1: Level 1 에러 (자동 해결) ---")
    result = manager.process_error(
        error_code='50',
        customer_name='Test Customer',
        auto_approve_level1=True
    )
    print(json.dumps(result, indent=2, ensure_ascii=False))
    
    # 2. Level 2 에러 테스트 (승인 필요)
    print("\n--- Test 2: Level 2 에러 (엔지니어 승인) ---")
    result = manager.process_error(
        error_code='1',
        customer_name='Test Customer',
        auto_approve_level1=True
    )
    print(json.dumps(result, indent=2, ensure_ascii=False))
    
    # 3. 자동 수정 가능한 에러 목록 조회
    print("\n--- Test 3: 자동 수정 가능한 에러 목록 (Top 10) ---")
    auto_fixable = manager.get_auto_fixable_errors(limit=10)
    for idx, error in enumerate(auto_fixable, 1):
        print(f"{idx}. 에러코드 {error['error_code']}: {error['error_name']} "
              f"(신뢰도: {error['ai_confidence_score']}%)")


if __name__ == '__main__':
    test_recovery_manager()
