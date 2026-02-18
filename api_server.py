#!/usr/bin/env python3
"""
V-BIP 2.3 AI 자동 문제 해결 시스템 API 서버
에러코드 관리, 인시던트 추적, AI 분류 API
"""

from flask import Flask, jsonify, request, send_from_directory
from flask_cors import CORS
import psycopg2
from psycopg2.extras import RealDictCursor
import os
from datetime import datetime, timedelta
import json
from lightweight_diagnosis_engine import get_diagnosis_engine

app = Flask(__name__, static_folder='dashboard', static_url_path='')
CORS(app)

# AI 진단 엔진 초기화
diagnosis_engine = get_diagnosis_engine()

# 데이터베이스 연결 설정
DB_CONFIG = {
    'host': 'localhost',
    'port': 5432,
    'database': 'vbip',
    'user': 'vbip_user',
    'password': 'vbip_password_2024'
}

def get_db_connection():
    """PostgreSQL 데이터베이스 연결"""
    return psycopg2.connect(**DB_CONFIG, cursor_factory=RealDictCursor)

# ============================================================
# Dashboard UI
# ============================================================

@app.route('/')
def dashboard():
    """대시보드 UI"""
    return send_from_directory('dashboard', 'index.html')

# ============================================================
# 에러코드 관리 API
# ============================================================

@app.route('/api/error-codes', methods=['GET'])
def get_error_codes():
    """에러코드 목록 조회"""
    try:
        resolution_level = request.args.get('resolution_level', type=int)
        search_query = request.args.get('search', '')
        limit = request.args.get('limit', 100, type=int)
        offset = request.args.get('offset', 0, type=int)
        
        conn = get_db_connection()
        cur = conn.cursor()
        
        query = """
            SELECT 
                pattern_id, error_code, error_type, error_name, 
                error_description, severity, resolution_level,
                ai_confidence_score, auto_fix_enabled,
                occurrence_frequency, success_rate_percent,
                avg_resolution_minutes, classification_reason,
                created_at
            FROM error_patterns
            WHERE 1=1
        """
        params = []
        
        if resolution_level:
            query += " AND resolution_level = %s"
            params.append(resolution_level)
        
        if search_query:
            query += " AND (error_code ILIKE %s OR error_name ILIKE %s OR error_description ILIKE %s)"
            search_pattern = f'%{search_query}%'
            params.extend([search_pattern, search_pattern, search_pattern])
        
        query += " ORDER BY occurrence_frequency DESC, error_code"
        query += " LIMIT %s OFFSET %s"
        params.extend([limit, offset])
        
        cur.execute(query, params)
        error_codes = cur.fetchall()
        
        # 총 개수 조회
        count_query = "SELECT COUNT(*) as total FROM error_patterns WHERE 1=1"
        count_params = []
        if resolution_level:
            count_query += " AND resolution_level = %s"
            count_params.append(resolution_level)
        if search_query:
            count_query += " AND (error_code ILIKE %s OR error_name ILIKE %s)"
            search_pattern = f'%{search_query}%'
            count_params.extend([search_pattern, search_pattern])
        
        cur.execute(count_query, count_params)
        total = cur.fetchone()['total']
        
        cur.close()
        conn.close()
        
        return jsonify({
            'success': True,
            'data': error_codes,
            'total': total,
            'limit': limit,
            'offset': offset
        })
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@app.route('/api/error-codes/<error_code>', methods=['GET'])
def get_error_code_detail(error_code):
    """에러코드 상세 조회"""
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        
        cur.execute("""
            SELECT * FROM error_patterns 
            WHERE error_code = %s
        """, (error_code,))
        
        error_pattern = cur.fetchone()
        
        if not error_pattern:
            return jsonify({'success': False, 'error': 'Error code not found'}), 404
        
        # 관련 인시던트 통계
        cur.execute("""
            SELECT 
                COUNT(*) as total_incidents,
                COUNT(CASE WHEN status = 'resolved' THEN 1 END) as resolved_incidents,
                COUNT(CASE WHEN ai_auto_fix_success THEN 1 END) as ai_auto_fixed
            FROM incidents
            WHERE error_code = %s
        """, (error_code,))
        
        incident_stats = cur.fetchone()
        
        # AI 학습 데이터 통계
        cur.execute("""
            SELECT 
                COUNT(*) as training_samples,
                AVG(CASE WHEN resolution_success THEN 100.0 ELSE 0 END) as success_rate,
                AVG(resolution_time_minutes) as avg_resolution_time
            FROM ai_training_data
            WHERE error_code = %s
        """, (error_code,))
        
        training_stats = cur.fetchone()
        
        cur.close()
        conn.close()
        
        return jsonify({
            'success': True,
            'data': {
                'error_pattern': error_pattern,
                'incident_stats': incident_stats,
                'training_stats': training_stats
            }
        })
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@app.route('/api/error-codes/statistics', methods=['GET'])
def get_error_statistics():
    """에러코드 통계"""
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        
        # 레벨별 통계
        cur.execute("""
            SELECT 
                resolution_level,
                COUNT(*) as total_errors,
                ROUND(AVG(ai_confidence_score), 2) as avg_confidence,
                COUNT(CASE WHEN auto_fix_enabled THEN 1 END) as auto_fix_enabled,
                SUM(occurrence_frequency) as total_occurrences,
                ROUND(AVG(success_rate_percent), 2) as avg_success_rate
            FROM error_patterns
            GROUP BY resolution_level
            ORDER BY resolution_level
        """)
        
        level_stats = cur.fetchall()
        
        # 심각도별 통계
        cur.execute("""
            SELECT 
                severity,
                COUNT(*) as count,
                ROUND(AVG(ai_confidence_score), 2) as avg_confidence
            FROM error_patterns
            GROUP BY severity
            ORDER BY 
                CASE severity
                    WHEN 'Critical' THEN 1
                    WHEN 'High' THEN 2
                    WHEN 'Medium' THEN 3
                    WHEN 'Low' THEN 4
                END
        """)
        
        severity_stats = cur.fetchall()
        
        # 자동 수정 가능 에러 통계
        cur.execute("""
            SELECT COUNT(*) as count
            FROM error_patterns
            WHERE auto_fix_enabled = TRUE
        """)
        
        auto_fix_count = cur.fetchone()['count']
        
        cur.close()
        conn.close()
        
        return jsonify({
            'success': True,
            'data': {
                'by_level': level_stats,
                'by_severity': severity_stats,
                'auto_fix_enabled_count': auto_fix_count
            }
        })
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

# ============================================================
# 인시던트 관리 API
# ============================================================

@app.route('/api/incidents', methods=['GET'])
def get_incidents():
    """인시던트 목록 조회"""
    try:
        status = request.args.get('status')
        customer_id = request.args.get('customer_id', type=int)
        resolution_level = request.args.get('resolution_level', type=int)
        limit = request.args.get('limit', 50, type=int)
        offset = request.args.get('offset', 0, type=int)
        
        conn = get_db_connection()
        cur = conn.cursor()
        
        query = """
            SELECT 
                i.incident_id, i.incident_number, i.status,
                i.resolution_level, i.ai_confidence,
                i.ai_recommended_action, i.detected_at,
                i.sla_deadline, i.sla_violated,
                c.customer_name, c.customer_code,
                e.name as engineer_name,
                ep.error_code, ep.error_name, ep.severity
            FROM incidents i
            LEFT JOIN customers c ON i.customer_id = c.customer_id
            LEFT JOIN engineers e ON i.assigned_engineer_id = e.engineer_id
            LEFT JOIN error_patterns ep ON i.error_code = ep.error_code
            WHERE 1=1
        """
        params = []
        
        if status:
            query += " AND i.status = %s"
            params.append(status)
        
        if customer_id:
            query += " AND i.customer_id = %s"
            params.append(customer_id)
        
        if resolution_level:
            query += " AND i.resolution_level = %s"
            params.append(resolution_level)
        
        query += " ORDER BY i.detected_at DESC LIMIT %s OFFSET %s"
        params.extend([limit, offset])
        
        cur.execute(query, params)
        incidents = cur.fetchall()
        
        cur.close()
        conn.close()
        
        return jsonify({
            'success': True,
            'data': incidents,
            'limit': limit,
            'offset': offset
        })
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@app.route('/api/incidents', methods=['POST'])
def create_incident():
    """인시던트 생성"""
    try:
        data = request.json
        
        conn = get_db_connection()
        cur = conn.cursor()
        
        # 인시던트 번호 생성
        incident_number = f"INC-{datetime.now().strftime('%Y%m%d-%H%M%S')}"
        
        # SLA 마감시간 계산
        sla_hours = {1: 1, 2: 4, 3: 24}
        sla_deadline = datetime.now() + timedelta(hours=sla_hours.get(data.get('resolution_level', 2), 4))
        
        cur.execute("""
            INSERT INTO incidents (
                incident_number, customer_id, job_id, error_code,
                status, resolution_level, ai_confidence,
                ai_recommended_action, sla_deadline
            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
            RETURNING incident_id, incident_number
        """, (
            incident_number,
            data['customer_id'],
            data.get('job_id'),
            data.get('error_code'),
            'open',
            data.get('resolution_level', 2),
            data.get('ai_confidence', 0),
            data.get('ai_recommended_action', ''),
            sla_deadline
        ))
        
        result = cur.fetchone()
        conn.commit()
        cur.close()
        conn.close()
        
        return jsonify({
            'success': True,
            'data': result
        }), 201
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@app.route('/api/incidents/<int:incident_id>/approve', methods=['POST'])
def approve_incident(incident_id):
    """엔지니어 승인"""
    try:
        data = request.json
        
        conn = get_db_connection()
        cur = conn.cursor()
        
        cur.execute("""
            UPDATE incidents
            SET 
                approval_status = 'approved',
                approval_notes = %s,
                approved_by = %s,
                approved_at = CURRENT_TIMESTAMP,
                status = 'in_progress'
            WHERE incident_id = %s
            RETURNING incident_number
        """, (
            data.get('approval_notes', ''),
            data.get('approved_by', 'Unknown'),
            incident_id
        ))
        
        result = cur.fetchone()
        conn.commit()
        cur.close()
        conn.close()
        
        return jsonify({
            'success': True,
            'message': f'Incident {result["incident_number"]} approved',
            'data': result
        })
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

# ============================================================
# AI 분류 및 통계 API
# ============================================================

@app.route('/api/ai/classify', methods=['POST'])
def classify_error():
    """AI 에러 분류 (개선된 버전)"""
    try:
        data = request.json
        error_message = data.get('error_message', '')
        error_code = data.get('error_code', '')
        error_description = data.get('error_description', '')
        
        # AI 진단 엔진 사용
        if error_code:
            classification = diagnosis_engine.classify_error(
                error_code, 
                error_message, 
                error_description
            )
        else:
            # 에러 코드 자동 추출
            extracted_code = diagnosis_engine.extract_error_code(error_message)
            if extracted_code:
                classification = diagnosis_engine.classify_error(
                    extracted_code,
                    error_message,
                    error_description
                )
            else:
                return jsonify({
                    'success': False,
                    'error': 'Error code not found in message'
                }), 400
        
        return jsonify({
            'success': True,
            'data': classification
        })
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@app.route('/api/ai/diagnose', methods=['POST'])
def diagnose_error():
    """AI 에러 진단 (전체 분석)"""
    try:
        data = request.json
        error_log = data.get('error_log', '')
        
        if not error_log:
            return jsonify({
                'success': False,
                'error': 'error_log is required'
            }), 400
        
        # 진단 실행
        result = diagnosis_engine.diagnose(error_log)
        
        # 유사 사례 조회
        if result.get('success') and result.get('error_code'):
            similar_cases = diagnosis_engine.get_similar_cases(
                result['error_code'],
                limit=3
            )
            result['similar_cases'] = similar_cases
        
        return jsonify(result)
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@app.route('/api/ai/similar-cases/<error_code>', methods=['GET'])
def get_similar_cases(error_code):
    """유사 사례 조회"""
    try:
        limit = request.args.get('limit', 5, type=int)
        cases = diagnosis_engine.get_similar_cases(error_code, limit)
        
        return jsonify({
            'success': True,
            'error_code': error_code,
            'total_cases': len(cases),
            'cases': cases
        })
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@app.route('/api/dashboard/stats', methods=['GET'])
def get_dashboard_stats():
    """대시보드 통계"""
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        
        # 총 에러코드 수
        cur.execute("SELECT COUNT(*) as total FROM error_patterns")
        total_errors = cur.fetchone()['total']
        
        # 오늘 발생한 인시던트
        cur.execute("""
            SELECT COUNT(*) as today_incidents
            FROM incidents
            WHERE DATE(detected_at) = CURRENT_DATE
        """)
        today_incidents = cur.fetchone()['today_incidents']
        
        # 대기 중인 승인
        cur.execute("""
            SELECT COUNT(*) as pending_approvals
            FROM incidents
            WHERE status = 'pending_approval' AND approval_status = 'pending'
        """)
        pending_approvals = cur.fetchone()['pending_approvals']
        
        # AI 자동 해결 성공률 (최근 30일)
        cur.execute("""
            SELECT 
                COUNT(CASE WHEN ai_auto_fix_success THEN 1 END) as success_count,
                COUNT(CASE WHEN ai_auto_fix_attempted THEN 1 END) as attempted_count
            FROM incidents
            WHERE detected_at >= CURRENT_DATE - INTERVAL '30 days'
              AND ai_auto_fix_attempted = TRUE
        """)
        ai_stats = cur.fetchone()
        ai_success_rate = (ai_stats['success_count'] / ai_stats['attempted_count'] * 100) if ai_stats['attempted_count'] > 0 else 0
        
        cur.close()
        conn.close()
        
        return jsonify({
            'success': True,
            'data': {
                'total_error_codes': total_errors,
                'today_incidents': today_incidents,
                'pending_approvals': pending_approvals,
                'ai_auto_fix_success_rate': round(ai_success_rate, 2),
                'ai_attempted_count': ai_stats['attempted_count'],
                'ai_success_count': ai_stats['success_count']
            }
        })
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

# ============================================================
# 헬스 체크
# ============================================================

@app.route('/api/health', methods=['GET'])
def health_check():
    """API 서버 상태 확인"""
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT 1")
        cur.close()
        conn.close()
        
        return jsonify({
            'success': True,
            'status': 'healthy',
            'database': 'connected',
            'timestamp': datetime.now().isoformat()
        })
    except Exception as e:
        return jsonify({
            'success': False,
            'status': 'unhealthy',
            'database': 'disconnected',
            'error': str(e)
        }), 503

# ==================== Engineer Approval Workflow APIs ====================

@app.route('/api/approval/request', methods=['POST'])
def create_approval_request():
    """승인 요청 생성 API"""
    try:
        from approval_workflow_manager import ApprovalWorkflowManager
        
        data = request.json
        error_code = data.get('error_code')
        customer_name = data.get('customer_name')
        auto_fix_script = data.get('auto_fix_script')
        engineer_name = data.get('engineer_name')
        context = data.get('context', {})
        
        if not error_code or not customer_name:
            return jsonify({
                'success': False,
                'error': 'error_code and customer_name are required'
            }), 400
        
        manager = ApprovalWorkflowManager()
        result = manager.create_approval_request(
            error_code,
            customer_name,
            auto_fix_script,
            engineer_name,
            context
        )
        
        return jsonify(result)
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@app.route('/api/approval/<int:incident_id>/approve', methods=['POST'])
def approve_request(incident_id):
    """승인 요청 승인 API"""
    try:
        from approval_workflow_manager import ApprovalWorkflowManager
        
        data = request.json
        approved_by = data.get('approved_by', 'System')
        approval_notes = data.get('approval_notes')
        execute_immediately = data.get('execute_immediately', True)
        
        manager = ApprovalWorkflowManager()
        result = manager.approve_request(
            incident_id,
            approved_by,
            approval_notes,
            execute_immediately
        )
        
        return jsonify(result)
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@app.route('/api/approval/<int:incident_id>/reject', methods=['POST'])
def reject_request(incident_id):
    """승인 요청 거부 API"""
    try:
        from approval_workflow_manager import ApprovalWorkflowManager
        
        data = request.json
        rejected_by = data.get('rejected_by', 'System')
        rejection_reason = data.get('rejection_reason', 'No reason provided')
        
        manager = ApprovalWorkflowManager()
        result = manager.reject_request(
            incident_id,
            rejected_by,
            rejection_reason
        )
        
        return jsonify(result)
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@app.route('/api/approval/pending', methods=['GET'])
def get_pending_approvals():
    """대기 중인 승인 목록 API"""
    try:
        from approval_workflow_manager import ApprovalWorkflowManager
        
        limit = request.args.get('limit', 50, type=int)
        
        manager = ApprovalWorkflowManager()
        pending = manager.get_pending_approvals(limit=limit)
        
        return jsonify({
            'success': True,
            'total': len(pending),
            'approvals': pending
        })
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@app.route('/api/approval/<int:incident_id>', methods=['GET'])
def get_incident_details(incident_id):
    """Incident 상세 정보 API"""
    try:
        from approval_workflow_manager import ApprovalWorkflowManager
        
        manager = ApprovalWorkflowManager()
        details = manager.get_incident_details(incident_id)
        
        if details:
            return jsonify({
                'success': True,
                'incident': details
            })
        else:
            return jsonify({
                'success': False,
                'error': 'Incident not found'
            }), 404
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

# ==================== Auto Recovery APIs ====================

@app.route('/api/recovery/process', methods=['POST'])
def process_recovery():
    """자동 복구 실행 API"""
    try:
        from auto_recovery.recovery_manager_v2 import AutoRecoveryManager
        
        data = request.json
        error_code = data.get('error_code')
        customer_name = data.get('customer_name', 'Unknown')
        context = data.get('context', {})
        auto_approve = data.get('auto_approve_level1', True)
        
        if not error_code:
            return jsonify({
                'success': False,
                'error': 'error_code is required'
            }), 400
        
        manager = AutoRecoveryManager()
        result = manager.process_error(
            error_code,
            customer_name,
            context,
            auto_approve
        )
        
        return jsonify(result)
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

@app.route('/api/recovery/auto-fixable', methods=['GET'])
def get_auto_fixable():
    """자동 수정 가능한 에러 목록"""
    try:
        from auto_recovery.recovery_manager_v2 import AutoRecoveryManager
        
        limit = request.args.get('limit', 50, type=int)
        
        manager = AutoRecoveryManager()
        errors = manager.get_auto_fixable_errors(limit=limit)
        
        return jsonify({
            'success': True,
            'total': len(errors),
            'errors': errors
        })
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

if __name__ == '__main__':
    print("=" * 60)
    print("V-BIP 2.3 AI 자동 문제 해결 시스템 API 서버 시작")
    print("=" * 60)
    print(f"🌐 서버 주소: http://0.0.0.0:5000")
    print(f"📊 API 문서: http://0.0.0.0:5000/api/health")
    print(f"🤖 자동 복구 API: http://0.0.0.0:5000/api/recovery/process")
    print("=" * 60)
    app.run(host='0.0.0.0', port=5000, debug=True)
