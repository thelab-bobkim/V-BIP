#!/usr/bin/env python3
"""
V-BIP Dashboard v2
김인석 부장 데이터 포함
"""

from flask import Flask, render_template, jsonify, request
import psycopg2
from psycopg2.extras import RealDictCursor
from datetime import datetime, timedelta
import os

app = Flask(__name__, template_folder='/app/templates', static_folder='/app/static')

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
    return render_template('dashboard_v2.html')

@app.route('/api/engineers')
def get_engineers():
    """엔지니어 목록"""
    try:
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        cursor.execute("""
            SELECT 
                engineer_id,
                name,
                email,
                specialization,
                skill_tags,
                (SELECT COUNT(*) FROM customers WHERE primary_engineer = engineers.name) as customer_count
            FROM engineers
            WHERE status = 'active'
            ORDER BY name
        """)
        
        engineers = cursor.fetchall()
        cursor.close()
        conn.close()
        
        return jsonify({
            'engineers': [dict(eng) for eng in engineers]
        })
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/customers')
def get_customers():
    """고객사 목록 (엔지니어 필터 지원)"""
    try:
        engineer = request.args.get('engineer', '')
        
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        query = """
            SELECT 
                c.customer_id,
                c.company_name,
                c.contract_type,
                c.server_count,
                c.primary_engineer,
                c.sla_level,
                c.last_backup_check,
                COUNT(CASE WHEN bj.status = 'Failed' AND bj.created_at >= NOW() - INTERVAL '30 days' THEN 1 END) as recent_failures
            FROM customers c
            LEFT JOIN backup_jobs bj ON c.customer_id = bj.customer_id
            WHERE c.status = 'active'
        """
        
        if engineer:
            query += f" AND c.primary_engineer = '{engineer}'"
        
        query += """
            GROUP BY c.customer_id, c.company_name, c.contract_type, c.server_count, 
                     c.primary_engineer, c.sla_level, c.last_backup_check
            ORDER BY recent_failures DESC, c.company_name
        """
        
        cursor.execute(query)
        customers = cursor.fetchall()
        cursor.close()
        conn.close()
        
        return jsonify({
            'customers': [dict(cust) for cust in customers]
        })
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/backup_jobs/recent')
def recent_backup_jobs():
    """최근 백업 작업 (엔지니어 필터 지원)"""
    try:
        engineer = request.args.get('engineer', '')
        limit = int(request.args.get('limit', 50))
        
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        query = """
            SELECT 
                bj.job_id,
                c.company_name,
                bj.job_name,
                bj.status,
                bj.error_code,
                bj.error_message,
                bj.start_time,
                bj.duration_minutes,
                c.primary_engineer
            FROM backup_jobs bj
            JOIN customers c ON bj.customer_id = c.customer_id
            WHERE 1=1
        """
        
        if engineer:
            query += f" AND c.primary_engineer = '{engineer}'"
        
        query += f"""
            ORDER BY bj.start_time DESC
            LIMIT {limit}
        """
        
        cursor.execute(query)
        jobs = cursor.fetchall()
        cursor.close()
        conn.close()
        
        return jsonify({
            'jobs': [dict(job) for job in jobs]
        })
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/statistics')
def get_statistics():
    """통계 정보 (엔지니어 필터 지원)"""
    try:
        engineer = request.args.get('engineer', '')
        
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        # 고객사 수
        customer_query = "SELECT COUNT(*) as count FROM customers WHERE status = 'active'"
        if engineer:
            customer_query += f" AND primary_engineer = '{engineer}'"
        
        cursor.execute(customer_query)
        total_customers = cursor.fetchone()['count']
        
        # 최근 30일 장애 통계
        failure_query = """
            SELECT COUNT(*) as count
            FROM backup_jobs bj
            JOIN customers c ON bj.customer_id = c.customer_id
            WHERE bj.status = 'Failed' 
            AND bj.created_at >= NOW() - INTERVAL '30 days'
        """
        if engineer:
            failure_query += f" AND c.primary_engineer = '{engineer}'"
        
        cursor.execute(failure_query)
        recent_failures = cursor.fetchone()['count']
        
        # 에러 코드 분포
        error_dist_query = """
            SELECT 
                bj.error_code,
                COUNT(*) as count
            FROM backup_jobs bj
            JOIN customers c ON bj.customer_id = c.customer_id
            WHERE bj.status = 'Failed'
            AND bj.created_at >= NOW() - INTERVAL '30 days'
        """
        if engineer:
            error_dist_query += f" AND c.primary_engineer = '{engineer}'"
        
        error_dist_query += """
            GROUP BY bj.error_code
            ORDER BY count DESC
            LIMIT 5
        """
        
        cursor.execute(error_dist_query)
        error_distribution = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'total_customers': total_customers,
            'recent_failures': recent_failures,
            'error_distribution': [dict(err) for err in error_distribution]
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
