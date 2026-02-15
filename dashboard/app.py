#!/usr/bin/env python3
"""
V-BIP Dashboard
엔지니어용 모니터링 대시보드
"""

from flask import Flask, render_template, jsonify, request
import psycopg2
from psycopg2.extras import RealDictCursor
from datetime import datetime, timedelta
import os

app = Flask(__name__)

# 데이터베이스 설정
DB_CONFIG = {
    'host': os.getenv('DB_HOST', 'localhost'),
    'port': os.getenv('DB_PORT', '5432'),
    'database': os.getenv('DB_NAME', 'veritas_monitor'),
    'user': os.getenv('DB_USER', 'vbip_user'),
    'password': os.getenv('DB_PASSWORD', 'vbip_password_2026')
}

def get_db_connection():
    """데이터베이스 연결"""
    return psycopg2.connect(**DB_CONFIG)

@app.route('/')
def index():
    """메인 대시보드"""
    return render_template('dashboard.html')

@app.route('/api/dashboard/summary')
def dashboard_summary():
    """대시보드 요약 정보"""
    try:
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        # 전체 고객사 수
        cursor.execute("SELECT COUNT(*) as total FROM customers WHERE status='Active'")
        total_customers = cursor.fetchone()['total']
        
        # 최근 24시간 백업 상태
        cursor.execute("""
            SELECT status, COUNT(*) as count
            FROM backup_jobs
            WHERE start_time >= NOW() - INTERVAL '24 hours'
            GROUP BY status
        """)
        backup_status = {row['status']: row['count'] for row in cursor.fetchall()}
        
        # 긴급 조치 필요 (최근 1시간 내 장애)
        cursor.execute("""
            SELECT 
                bj.job_id,
                c.customer_name,
                bj.server_name,
                bj.error_code,
                ep.error_name,
                ep.severity,
                bj.start_time,
                EXTRACT(EPOCH FROM (NOW() - bj.start_time))/60 as minutes_ago
            FROM backup_jobs bj
            JOIN customers c ON bj.customer_id = c.customer_id
            LEFT JOIN error_patterns ep ON bj.error_code = ep.error_code
            WHERE bj.status = 'Failed'
              AND bj.start_time >= NOW() - INTERVAL '1 hour'
            ORDER BY bj.start_time DESC
            LIMIT 10
        """)
        critical_issues = cursor.fetchall()
        
        # 최근 7일 백업 성공률 추이
        cursor.execute("""
            WITH daily_stats AS (
                SELECT 
                    DATE(start_time) as backup_date,
                    COUNT(*) as total,
                    SUM(CASE WHEN status='Success' THEN 1 ELSE 0 END) as success
                FROM backup_jobs
                WHERE start_time >= CURRENT_DATE - INTERVAL '7 days'
                GROUP BY DATE(start_time)
                ORDER BY backup_date
            )
            SELECT 
                TO_CHAR(backup_date, 'MM-DD') as date,
                ROUND((success::DECIMAL / total * 100), 1) as success_rate
            FROM daily_stats
        """)
        trend_data = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'total_customers': total_customers,
            'backup_status': {
                'success': backup_status.get('Success', 0),
                'failed': backup_status.get('Failed', 0),
                'warning': backup_status.get('Warning', 0)
            },
            'critical_issues': [dict(row) for row in critical_issues],
            'trend_data': [dict(row) for row in trend_data]
        })
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/customers')
def get_customers():
    """고객사 목록 조회"""
    try:
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        cursor.execute("""
            SELECT 
                c.customer_id,
                c.customer_code,
                c.customer_name,
                c.contract_tier,
                c.server_count,
                e.name as engineer_name,
                (
                    SELECT COUNT(*) 
                    FROM backup_jobs bj 
                    WHERE bj.customer_id = c.customer_id 
                      AND bj.status = 'Failed'
                      AND bj.start_time >= NOW() - INTERVAL '24 hours'
                ) as recent_failures,
                (
                    SELECT MAX(start_time) 
                    FROM backup_jobs bj 
                    WHERE bj.customer_id = c.customer_id
                      AND bj.status = 'Success'
                ) as last_successful_backup
            FROM customers c
            LEFT JOIN engineers e ON c.primary_engineer_id = e.engineer_id
            WHERE c.status = 'Active'
            ORDER BY recent_failures DESC, c.customer_name
        """)
        
        customers = cursor.fetchall()
        cursor.close()
        conn.close()
        
        return jsonify([dict(row) for row in customers])
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/customer/<int:customer_id>/jobs')
def get_customer_jobs(customer_id):
    """특정 고객사의 백업 작업 히스토리"""
    try:
        # 날짜 범위 파라미터
        days = request.args.get('days', 7, type=int)
        
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        cursor.execute("""
            SELECT 
                bj.job_id,
                bj.server_name,
                bj.policy_name,
                bj.backup_type,
                bj.start_time,
                bj.end_time,
                bj.duration_minutes,
                bj.status,
                bj.error_code,
                ep.error_name,
                ep.severity,
                ROUND(bj.bytes_written / 1024.0 / 1024.0 / 1024.0, 2) as size_gb
            FROM backup_jobs bj
            LEFT JOIN error_patterns ep ON bj.error_code = ep.error_code
            WHERE bj.customer_id = %s
              AND bj.start_time >= NOW() - INTERVAL '%s days'
            ORDER BY bj.start_time DESC
            LIMIT 100
        """, (customer_id, days))
        
        jobs = cursor.fetchall()
        cursor.close()
        conn.close()
        
        return jsonify([dict(row) for row in jobs])
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/job/<int:job_id>/troubleshooting')
def get_troubleshooting_guide(job_id):
    """특정 작업의 트러블슈팅 가이드"""
    try:
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        cursor.execute("""
            SELECT 
                bj.job_id,
                bj.server_name,
                bj.error_code,
                bj.error_message,
                bj.start_time,
                c.customer_name,
                c.contact_person,
                c.contact_phone,
                ep.error_name,
                ep.error_description,
                ep.symptom,
                ep.root_cause,
                ep.troubleshooting_steps,
                ep.auto_fix_enabled,
                ep.auto_fix_script,
                ep.prevention_tips,
                ep.severity,
                ep.avg_resolution_minutes
            FROM backup_jobs bj
            JOIN customers c ON bj.customer_id = c.customer_id
            LEFT JOIN error_patterns ep ON bj.error_code = ep.error_code
            WHERE bj.job_id = %s
        """, (job_id,))
        
        result = cursor.fetchone()
        cursor.close()
        conn.close()
        
        if result:
            return jsonify(dict(result))
        else:
            return jsonify({'error': 'Job not found'}), 404
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/statistics')
def get_statistics():
    """전체 통계"""
    try:
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        # 최근 30일 통계
        cursor.execute("""
            SELECT 
                COUNT(*) as total_jobs,
                SUM(CASE WHEN status='Success' THEN 1 ELSE 0 END) as success_count,
                SUM(CASE WHEN status='Failed' THEN 1 ELSE 0 END) as failed_count,
                ROUND(SUM(CASE WHEN status='Success' THEN 1 ELSE 0 END)::DECIMAL / COUNT(*) * 100, 2) as success_rate,
                ROUND(SUM(bytes_written) / 1024.0 / 1024.0 / 1024.0 / 1024.0, 2) as total_tb_backed_up,
                ROUND(AVG(duration_minutes), 1) as avg_duration_minutes
            FROM backup_jobs
            WHERE start_time >= NOW() - INTERVAL '30 days'
        """)
        overall_stats = dict(cursor.fetchone())
        
        # 에러 타입별 통계
        cursor.execute("""
            SELECT 
                bj.error_code,
                ep.error_name,
                ep.severity,
                COUNT(*) as occurrence_count,
                ROUND(AVG(ep.avg_resolution_minutes), 1) as avg_resolution_minutes
            FROM backup_jobs bj
            LEFT JOIN error_patterns ep ON bj.error_code = ep.error_code
            WHERE bj.status = 'Failed'
              AND bj.start_time >= NOW() - INTERVAL '30 days'
            GROUP BY bj.error_code, ep.error_name, ep.severity
            ORDER BY occurrence_count DESC
            LIMIT 10
        """)
        error_stats = cursor.fetchall()
        
        # 고객사별 성공률
        cursor.execute("""
            SELECT 
                c.customer_name,
                c.contract_tier,
                COUNT(*) as total_jobs,
                SUM(CASE WHEN bj.status='Success' THEN 1 ELSE 0 END) as success_count,
                ROUND(SUM(CASE WHEN bj.status='Success' THEN 1 ELSE 0 END)::DECIMAL / COUNT(*) * 100, 1) as success_rate
            FROM backup_jobs bj
            JOIN customers c ON bj.customer_id = c.customer_id
            WHERE bj.start_time >= NOW() - INTERVAL '30 days'
            GROUP BY c.customer_id, c.customer_name, c.contract_tier
            ORDER BY success_rate ASC
            LIMIT 10
        """)
        customer_stats = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'overall': overall_stats,
            'error_distribution': [dict(row) for row in error_stats],
            'customer_performance': [dict(row) for row in customer_stats]
        })
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/health')
def health_check():
    """헬스 체크"""
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT 1")
        cursor.close()
        conn.close()
        return jsonify({'status': 'healthy', 'database': 'connected'})
    except Exception as e:
        return jsonify({'status': 'unhealthy', 'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)
