"""
V-BIP 2.3 Phase 2-3: Engineer Approval Workflow Manager
Level 2 에러에 대한 엔지니어 승인 워크플로우
"""

import psycopg2
from psycopg2.extras import RealDictCursor
from typing import Dict, List, Optional
from datetime import datetime, timedelta

DB_CONFIG = {
    'host': 'localhost',
    'port': 5432,
    'database': 'vbip',
    'user': 'vbip_user',
    'password': 'vbip_password_2024'
}

class ApprovalWorkflowManager:
    """엔지니어 승인 워크플로우 관리자"""
    
    def __init__(self):
        self.db_config = DB_CONFIG
        print("🔐 ApprovalWorkflowManager 초기화 완료")
    
    def get_db_connection(self):
        """데이터베이스 연결"""
        return psycopg2.connect(**self.db_config, cursor_factory=RealDictCursor)
    
    def create_approval_request(
        self,
        error_code: str,
        customer_name: str,
        auto_fix_script: str,
        engineer_name: Optional[str] = None,
        context: Optional[Dict] = None
    ) -> Dict:
        """
        승인 요청 생성
        
        Args:
            error_code: 에러코드
            customer_name: 고객사명
            auto_fix_script: 실행할 자동 수정 스크립트
            engineer_name: 담당 엔지니어 (선택)
            context: 추가 컨텍스트 정보
            
        Returns:
            생성된 incident 정보
        """
        conn = self.get_db_connection()
        cur = conn.cursor()
        
        try:
            # 1. 에러 패턴 정보 조회
            cur.execute("""
                SELECT pattern_id, error_name, resolution_level, ai_confidence_score
                FROM error_patterns
                WHERE error_code = %s
            """, (error_code,))
            
            pattern = cur.fetchone()
            if not pattern:
                return {'success': False, 'error': f'에러코드 {error_code}를 찾을 수 없습니다.'}
            
            # 2. 고객 정보 조회
            cur.execute("""
                SELECT customer_id, customer_name
                FROM customers
                WHERE customer_name = %s
                LIMIT 1
            """, (customer_name,))
            
            customer = cur.fetchone()
            if not customer:
                return {'success': False, 'error': f'고객사 {customer_name}을 찾을 수 없습니다.'}
            
            # 3. 엔지니어 배정 (선택적)
            engineer_id = None
            if engineer_name:
                cur.execute("""
                    SELECT engineer_id
                    FROM engineers
                    WHERE name = %s
                    LIMIT 1
                """, (engineer_name,))
                
                engineer = cur.fetchone()
                if engineer:
                    engineer_id = engineer['engineer_id']
            
            # 4. Incident 번호 생성
            incident_number = f"INC-{datetime.now().strftime('%Y%m%d-%H%M%S')}"
            
            # 5. SLA 마감 시간 계산 (Level 2 = 4시간)
            sla_deadline = datetime.now() + timedelta(hours=4)
            
            # 6. Incident 생성
            cur.execute("""
                INSERT INTO incidents (
                    incident_number, customer_id, error_code,
                    status, resolution_level,
                    ai_analyzed, ai_recommended_action, ai_confidence,
                    assigned_engineer_id, approval_status,
                    detected_at, sla_deadline
                ) VALUES (
                    %s, %s, %s,
                    %s, %s,
                    %s, %s, %s,
                    %s, %s,
                    %s, %s
                )
                RETURNING incident_id, incident_number
            """, (
                incident_number, customer['customer_id'], error_code,
                'pending_approval', pattern['resolution_level'],
                True, auto_fix_script, pattern['ai_confidence_score'],
                engineer_id, 'pending',
                datetime.now(), sla_deadline
            ))
            
            result = cur.fetchone()
            conn.commit()
            
            print(f"✅ 승인 요청 생성: {result['incident_number']}")
            
            return {
                'success': True,
                'incident_id': result['incident_id'],
                'incident_number': result['incident_number'],
                'error_code': error_code,
                'error_name': pattern['error_name'],
                'customer_name': customer_name,
                'auto_fix_script': auto_fix_script,
                'approval_status': 'pending',
                'sla_deadline': sla_deadline.isoformat(),
                'assigned_engineer': engineer_name,
                'created_at': datetime.now().isoformat()
            }
            
        except Exception as e:
            conn.rollback()
            print(f"❌ 승인 요청 생성 실패: {e}")
            return {'success': False, 'error': str(e)}
        finally:
            cur.close()
            conn.close()
    
    def approve_request(
        self,
        incident_id: int,
        approved_by: str,
        approval_notes: Optional[str] = None,
        execute_immediately: bool = True
    ) -> Dict:
        """
        승인 요청 승인
        
        Args:
            incident_id: Incident ID
            approved_by: 승인자 이름
            approval_notes: 승인 메모
            execute_immediately: 즉시 실행 여부
            
        Returns:
            승인 결과 및 실행 결과
        """
        conn = self.get_db_connection()
        cur = conn.cursor()
        
        try:
            # 1. Incident 정보 조회
            cur.execute("""
                SELECT i.*, ep.auto_fix_script, c.customer_name
                FROM incidents i
                JOIN error_patterns ep ON i.error_code = ep.error_code
                JOIN customers c ON i.customer_id = c.customer_id
                WHERE i.incident_id = %s
            """, (incident_id,))
            
            incident = cur.fetchone()
            if not incident:
                return {'success': False, 'error': f'Incident ID {incident_id}를 찾을 수 없습니다.'}
            
            # 2. 승인 상태 확인
            if incident['approval_status'] != 'pending':
                return {
                    'success': False,
                    'error': f"이미 {incident['approval_status']} 상태입니다."
                }
            
            # 3. 승인 업데이트
            cur.execute("""
                UPDATE incidents
                SET approval_status = 'approved',
                    approved_by = %s,
                    approved_at = %s,
                    approval_notes = %s,
                    status = CASE 
                        WHEN %s THEN 'in_progress'
                        ELSE 'pending_approval'
                    END,
                    updated_at = %s
                WHERE incident_id = %s
            """, (
                approved_by,
                datetime.now(),
                approval_notes,
                execute_immediately,
                datetime.now(),
                incident_id
            ))
            
            conn.commit()
            
            result = {
                'success': True,
                'incident_id': incident_id,
                'incident_number': incident['incident_number'],
                'approval_status': 'approved',
                'approved_by': approved_by,
                'approved_at': datetime.now().isoformat()
            }
            
            # 4. 즉시 실행
            if execute_immediately:
                print(f"🚀 자동 복구 스크립트 실행 중...")
                
                # recovery_manager_v2를 사용하여 실행
                from auto_recovery.recovery_manager_v2 import AutoRecoveryManager
                
                manager = AutoRecoveryManager()
                execution_result = manager._simulate_script_execution(
                    incident['auto_fix_script'],
                    incident['customer_name'],
                    {}
                )
                
                # 실행 결과 저장
                cur.execute("""
                    UPDATE incidents
                    SET status = %s,
                        resolution_method = 'approved_auto',
                        resolved_at = %s,
                        resolution_time_minutes = EXTRACT(EPOCH FROM (NOW() - detected_at)) / 60
                    WHERE incident_id = %s
                """, (
                    'resolved' if execution_result['status'] == 'success' else 'escalated',
                    datetime.now() if execution_result['status'] == 'success' else None,
                    incident_id
                ))
                
                conn.commit()
                
                result['execution_result'] = execution_result
                result['status'] = 'resolved' if execution_result['status'] == 'success' else 'escalated'
            
            print(f"✅ 승인 완료: {incident['incident_number']}")
            return result
            
        except Exception as e:
            conn.rollback()
            print(f"❌ 승인 실패: {e}")
            return {'success': False, 'error': str(e)}
        finally:
            cur.close()
            conn.close()
    
    def reject_request(
        self,
        incident_id: int,
        rejected_by: str,
        rejection_reason: str
    ) -> Dict:
        """
        승인 요청 거부
        
        Args:
            incident_id: Incident ID
            rejected_by: 거부자 이름
            rejection_reason: 거부 사유
            
        Returns:
            거부 결과
        """
        conn = self.get_db_connection()
        cur = conn.cursor()
        
        try:
            # 1. Incident 정보 조회
            cur.execute("""
                SELECT incident_number, approval_status
                FROM incidents
                WHERE incident_id = %s
            """, (incident_id,))
            
            incident = cur.fetchone()
            if not incident:
                return {'success': False, 'error': f'Incident ID {incident_id}를 찾을 수 없습니다.'}
            
            if incident['approval_status'] != 'pending':
                return {
                    'success': False,
                    'error': f"이미 {incident['approval_status']} 상태입니다."
                }
            
            # 2. 거부 업데이트
            cur.execute("""
                UPDATE incidents
                SET approval_status = 'rejected',
                    approved_by = %s,
                    approved_at = %s,
                    approval_notes = %s,
                    status = 'escalated',
                    updated_at = %s
                WHERE incident_id = %s
            """, (
                rejected_by,
                datetime.now(),
                f"거부 사유: {rejection_reason}",
                datetime.now(),
                incident_id
            ))
            
            conn.commit()
            
            print(f"⛔ 승인 거부: {incident['incident_number']}")
            
            return {
                'success': True,
                'incident_id': incident_id,
                'incident_number': incident['incident_number'],
                'approval_status': 'rejected',
                'rejected_by': rejected_by,
                'rejection_reason': rejection_reason,
                'rejected_at': datetime.now().isoformat()
            }
            
        except Exception as e:
            conn.rollback()
            print(f"❌ 거부 실패: {e}")
            return {'success': False, 'error': str(e)}
        finally:
            cur.close()
            conn.close()
    
    def get_pending_approvals(self, limit: int = 50) -> List[Dict]:
        """대기 중인 승인 요청 목록"""
        conn = self.get_db_connection()
        cur = conn.cursor()
        
        cur.execute("""
            SELECT 
                i.incident_id, i.incident_number, i.error_code,
                ep.error_name, ep.auto_fix_script,
                c.customer_name,
                i.ai_confidence, i.detected_at, i.sla_deadline,
                e.name as assigned_engineer,
                EXTRACT(EPOCH FROM (i.sla_deadline - NOW())) / 60 as minutes_until_sla
            FROM incidents i
            LEFT JOIN error_patterns ep ON i.error_code = ep.error_code
            LEFT JOIN customers c ON i.customer_id = c.customer_id
            LEFT JOIN engineers e ON i.assigned_engineer_id = e.engineer_id
            WHERE i.approval_status = 'pending'
              AND i.status = 'pending_approval'
            ORDER BY i.sla_deadline ASC
            LIMIT %s
        """, (limit,))
        
        results = cur.fetchall()
        cur.close()
        conn.close()
        
        return [dict(row) for row in results]
    
    def get_incident_details(self, incident_id: int) -> Optional[Dict]:
        """Incident 상세 정보 조회"""
        conn = self.get_db_connection()
        cur = conn.cursor()
        
        cur.execute("""
            SELECT 
                i.*,
                ep.error_name, ep.error_description, ep.auto_fix_script,
                c.customer_name,
                e.name as assigned_engineer,
                i.approved_by, i.approval_notes
            FROM incidents i
            LEFT JOIN error_patterns ep ON i.error_code = ep.error_code
            LEFT JOIN customers c ON i.customer_id = c.customer_id
            LEFT JOIN engineers e ON i.assigned_engineer_id = e.engineer_id
            WHERE i.incident_id = %s
        """, (incident_id,))
        
        result = cur.fetchone()
        cur.close()
        conn.close()
        
        return dict(result) if result else None


def test_approval_workflow():
    """테스트 함수"""
    print("\n" + "=" * 70)
    print("🧪 ApprovalWorkflowManager 테스트")
    print("=" * 70 + "\n")
    
    manager = ApprovalWorkflowManager()
    
    # 1. 승인 요청 생성
    print("--- Test 1: 승인 요청 생성 ---")
    request = manager.create_approval_request(
        error_code='1',
        customer_name='Samsung Electronics',
        auto_fix_script='systemctl restart netbackup',
        engineer_name=None,
        context={'severity': 'high'}
    )
    
    if request['success']:
        print(f"✅ Incident: {request['incident_number']}")
        incident_id = request['incident_id']
        
        # 2. 대기 중인 승인 목록
        print("\n--- Test 2: 대기 중인 승인 목록 ---")
        pending = manager.get_pending_approvals(limit=5)
        print(f"대기 중인 승인: {len(pending)}건")
        for p in pending[:3]:
            print(f"  - {p['incident_number']}: {p['error_name']} "
                  f"(SLA까지 {p['minutes_until_sla']:.0f}분)")
        
        # 3. Incident 상세 정보
        print("\n--- Test 3: Incident 상세 정보 ---")
        details = manager.get_incident_details(incident_id)
        if details:
            print(f"Incident: {details['incident_number']}")
            print(f"에러: {details['error_name']}")
            print(f"상태: {details['approval_status']}")
    else:
        print(f"❌ 오류: {request['error']}")


if __name__ == '__main__':
    test_approval_workflow()
