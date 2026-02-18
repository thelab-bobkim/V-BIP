#!/usr/bin/env python3
"""
V-BIP 2.3 AI 자동 문제 해결 시스템 API 서버
에러코드 관리, 인시던트 추적, AI 분류 API
"""

from flask import Flask, jsonify, request
from flask_cors import CORS
import psycopg2
from psycopg2.extras import RealDictCursor
import os
from datetime import datetime, timedelta
import json

app = Flask(__name__)
CORS(app)

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
    """AI 에러 분류 (간단한 키워드 기반)"""
    try:
        data = request.json
        error_message = data.get('error_message', '').lower()
        error_code = data.get('error_code', '')
        
        # 키워드 기반 분류
        auto_fix_keywords = ['restart', 'retry', 'reconnect', 'timeout', 'temporary', 'cache']
        engineer_keywords = ['configuration', 'policy', 'credentials', 'authentication', 'database']
        onsite_keywords = ['hardware', 'tape', 'robot', 'physical', 'device', 'san']
        
        # 점수 계산
        auto_score = sum(1 for kw in auto_fix_keywords if kw in error_message)
        engineer_score = sum(1 for kw in engineer_keywords if kw in error_message)
        onsite_score = sum(1 for kw in onsite_keywords if kw in error_message)
        
        # 분류 결정
        scores = {1: auto_score, 2: engineer_score, 3: onsite_score}
        resolution_level = max(scores, key=scores.get)
        
        confidence = min(85 + scores[resolution_level] * 5, 99)
        
        reasons = {
            1: f"자동 해결 키워드 {auto_score}개 감지: 자동 재시도 가능",
            2: f"엔지니어 확인 키워드 {engineer_score}개 감지: 설정 변경 필요",
            3: f"온사이트 키워드 {onsite_score}개 감지: 현장 점검 필요"
        }
        
        return jsonify({
            'success': True,
            'data': {
                'error_code': error_code,
                'resolution_level': resolution_level,
                'ai_confidence_score': confidence,
                'classification_reason': reasons[resolution_level],
                'recommended_action': f"Level {resolution_level} 처리 필요"
            }
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

if __name__ == '__main__':
    print("=" * 60)
    print("V-BIP 2.3 AI 자동 문제 해결 시스템 API 서버 시작")
    print("=" * 60)
    print(f"🌐 서버 주소: http://0.0.0.0:5000")
    print(f"📊 API 문서: http://0.0.0.0:5000/api/health")
    print("=" * 60)
    app.run(host='0.0.0.0', port=5000, debug=True)
