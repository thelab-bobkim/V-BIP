#!/usr/bin/env python3
"""
V-BIP Dashboard v2 - Complete Implementation
기간 필터, 엔지니어 필터, 차트, Excel 다운로드 포함
"""

from flask import Flask, render_template, jsonify, request, send_file
import psycopg2
from psycopg2.extras import RealDictCursor
from datetime import datetime, timedelta
import os
import io
import xlsxwriter

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
    return render_template('dashboard_v2.html')

@app.route('/api/dashboard/summary')
def dashboard_summary():
    """대시보드 요약 정보 - 기간 필터 지원"""
    try:
        # 파라미터 받기
        days = request.args.get('days', type=int)  # None이면 전체 기간
        engineer_id = request.args.get('engineer_id', type=int)  # None이면 전체 엔지니어
        
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        # WHERE 조건 동적 생성
        conditions = ["c.status='Active'"]
        if engineer_id:
            conditions.append(f"c.primary_engineer_id={engineer_id}")
        
        where_clause = " AND ".join(conditions)
        
        # 날짜 조건
        date_condition = ""
        if days:
            date_condition = f"AND bj.start_time >= NOW() - INTERVAL '{days} days'"
        
        # 전체 고객사 수
        cursor.execute(f"SELECT COUNT(*) as total FROM customers c WHERE {where_clause}")
        total_customers = cursor.fetchone()['total']
        
        # 백업 상태별 집계
        cursor.execute(f"""
            SELECT bj.status, COUNT(*) as count
            FROM backup_jobs bj
            JOIN customers c ON bj.customer_id = c.customer_id
            WHERE {where_clause} {date_condition}
            GROUP BY bj.status
        """)
        
        backup_status = {
            'success': 0,
            'failed': 0,
            'warning': 0
        }
        
        for row in cursor.fetchall():
            status = row['status'].lower() if row['status'] else 'unknown'
            if status == 'success':
                backup_status['success'] = row['count']
            elif status == 'failed':
                backup_status['failed'] = row['count']
            elif status == 'warning':
                backup_status['warning'] = row['count']
        
        # 최근 7일 추이 데이터
        cursor.execute(f"""
            SELECT 
                DATE(bj.start_time) as date,
                COUNT(*) as total,
                COUNT(CASE WHEN bj.status = 'Success' THEN 1 END) as success
            FROM backup_jobs bj
            JOIN customers c ON bj.customer_id = c.customer_id
            WHERE {where_clause}
              AND bj.start_time >= NOW() - INTERVAL '7 days'
            GROUP BY DATE(bj.start_time)
            ORDER BY date DESC
            LIMIT 7
        """)
        
        trend_data = []
        for row in cursor.fetchall():
            total = row['total']
            success = row['success']
            success_rate = round((success / total * 100), 1) if total > 0 else 0
            
            trend_data.append({
                'date': row['date'].strftime('%m-%d'),
                'success_rate': str(success_rate)
            })
        
        trend_data.reverse()  # 오래된 날짜부터 표시
        
        # 위험 고객사 목록
        cursor.execute(f"""
            SELECT 
                c.customer_name,
                COUNT(*) as failed_count,
                MAX(bj.start_time) as last_failure
            FROM backup_jobs bj
            JOIN customers c ON bj.customer_id = c.customer_id
            WHERE {where_clause}
              AND bj.status = 'Failed'
              {date_condition}
            GROUP BY c.customer_name
            HAVING COUNT(*) >= 5
            ORDER BY failed_count DESC
            LIMIT 5
        """)
        
        critical_issues = []
        for row in cursor.fetchall():
            critical_issues.append({
                'customer': row['customer_name'],
                'count': row['failed_count'],
                'last_time': row['last_failure'].strftime('%Y-%m-%d %H:%M') if row['last_failure'] else 'N/A'
            })
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'total_customers': total_customers,
            'backup_status': backup_status,
            'trend_data': trend_data,
            'critical_issues': critical_issues
        })
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/customers')
def get_customers():
    """고객사 목록 조회 - 기간 및 엔지니어 필터 지원"""
    try:
        # 파라미터 받기
        days = request.args.get('days', type=int)  # None이면 전체 기간
        engineer_id = request.args.get('engineer_id', type=int)
        
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        # 날짜 조건
        date_condition = ""
        if days:
            date_condition = f"AND bj.start_time >= NOW() - INTERVAL '{days} days'"
        
        # 엔지니어 조건
        engineer_condition = ""
        if engineer_id:
            engineer_condition = f"AND c.primary_engineer_id = {engineer_id}"
        
        cursor.execute(f"""
            SELECT 
                c.customer_id,
                c.customer_code,
                c.customer_name,
                c.contract_tier,
                c.server_count,
                c.status,
                c.created_at,
                e.name as engineer_name,
                COUNT(bj.job_id) as total_jobs,
                COUNT(CASE WHEN bj.status = 'Failed' THEN 1 END) as failed_jobs,
                COUNT(CASE WHEN bj.status = 'Success' THEN 1 END) as success_jobs,
                MAX(CASE WHEN bj.status = 'Success' THEN bj.start_time END) as last_successful_backup,
                MAX(CASE WHEN bj.status = 'Failed' THEN bj.start_time END) as last_failed_backup
            FROM customers c
            LEFT JOIN engineers e ON c.primary_engineer_id = e.engineer_id
            LEFT JOIN backup_jobs bj ON bj.customer_id = c.customer_id {date_condition}
            WHERE c.status = 'Active' {engineer_condition}
            GROUP BY c.customer_id, c.customer_code, c.customer_name, 
                     c.contract_tier, c.server_count, c.status, c.created_at, e.name
            ORDER BY failed_jobs DESC, c.customer_name
        """)
        
        customers = cursor.fetchall()
        cursor.close()
        conn.close()
        
        # datetime을 문자열로 변환
        result = []
        for customer in customers:
            customer_dict = dict(customer)
            if customer_dict.get('last_successful_backup'):
                customer_dict['last_successful_backup'] = customer_dict['last_successful_backup'].strftime('%Y-%m-%d %H:%M')
            if customer_dict.get('last_failed_backup'):
                customer_dict['last_failed_backup'] = customer_dict['last_failed_backup'].strftime('%Y-%m-%d %H:%M')
            if customer_dict.get('created_at'):
                customer_dict['created_at'] = customer_dict['created_at'].strftime('%Y-%m-%d')
            result.append(customer_dict)
        
        return jsonify(result)
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/engineers')
def get_engineers():
    """엔지니어 목록 조회"""
    try:
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        cursor.execute("""
            SELECT engineer_id, name, specialization
            FROM engineers
            ORDER BY name
        """)
        
        engineers = cursor.fetchall()
        cursor.close()
        conn.close()
        
        return jsonify([dict(row) for row in engineers])
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/export/excel')
def export_excel():
    """Excel 내보내기"""
    try:
        # 파라미터 받기
        days = request.args.get('days', type=int)
        engineer_id = request.args.get('engineer_id', type=int)
        
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        # 날짜 조건
        date_condition = ""
        period_text = "전체 기간"
        if days:
            date_condition = f"AND bj.start_time >= NOW() - INTERVAL '{days} days'"
            period_text = f"최근 {days}일"
        
        # 엔지니어 조건
        engineer_condition = ""
        engineer_text = "전체 엔지니어"
        if engineer_id:
            engineer_condition = f"AND c.primary_engineer_id = {engineer_id}"
            cursor.execute("SELECT name FROM engineers WHERE engineer_id = %s", (engineer_id,))
            eng_result = cursor.fetchone()
            if eng_result:
                engineer_text = eng_result['name']
        
        # 데이터 조회
        cursor.execute(f"""
            SELECT 
                c.customer_code as 고객코드,
                c.customer_name as 고객사명,
                e.name as 담당엔지니어,
                c.contract_tier as 계약등급,
                c.server_count as 서버수,
                COUNT(bj.job_id) as 총작업수,
                COUNT(CASE WHEN bj.status = 'Failed' THEN 1 END) as 실패건수,
                COUNT(CASE WHEN bj.status = 'Success' THEN 1 END) as 성공건수,
                ROUND(
                    CAST(COUNT(CASE WHEN bj.status = 'Success' THEN 1 END) AS DECIMAL) / 
                    NULLIF(COUNT(bj.job_id), 0) * 100, 
                    1
                ) as 성공률,
                MAX(CASE WHEN bj.status = 'Failed' THEN bj.start_time END) as 최근장애일
            FROM customers c
            LEFT JOIN engineers e ON c.primary_engineer_id = e.engineer_id
            LEFT JOIN backup_jobs bj ON bj.customer_id = c.customer_id {date_condition}
            WHERE c.status = 'Active' {engineer_condition}
            GROUP BY c.customer_id, c.customer_code, c.customer_name, 
                     e.name, c.contract_tier, c.server_count
            ORDER BY 실패건수 DESC, c.customer_name
        """)
        
        rows = cursor.fetchall()
        cursor.close()
        conn.close()
        
        # Excel 파일 생성
        output = io.BytesIO()
        workbook = xlsxwriter.Workbook(output)
        worksheet = workbook.add_worksheet('고객사 장애 현황')
        
        # 스타일 정의
        title_format = workbook.add_format({
            'bold': True,
            'font_size': 16,
            'align': 'center',
            'valign': 'vcenter',
            'bg_color': '#667eea',
            'font_color': 'white'
        })
        
        header_format = workbook.add_format({
            'bold': True,
            'align': 'center',
            'valign': 'vcenter',
            'bg_color': '#e5e7eb',
            'border': 1
        })
        
        cell_format = workbook.add_format({
            'align': 'center',
            'valign': 'vcenter',
            'border': 1
        })
        
        number_format = workbook.add_format({
            'align': 'center',
            'valign': 'vcenter',
            'border': 1,
            'num_format': '#,##0'
        })
        
        percent_format = workbook.add_format({
            'align': 'center',
            'valign': 'vcenter',
            'border': 1,
            'num_format': '0.0"%"'
        })
        
        # 제목 및 정보
        worksheet.merge_range('A1:J1', 'V-BIP 고객사 장애 현황 리포트', title_format)
        worksheet.write('A2', f'조회 기간: {period_text}')
        worksheet.write('A3', f'담당자: {engineer_text}')
        worksheet.write('A4', f'생성일시: {datetime.now().strftime("%Y-%m-%d %H:%M:%S")}')
        
        # 헤더
        headers = ['고객코드', '고객사명', '담당엔지니어', '계약등급', '서버수', 
                   '총작업수', '실패건수', '성공건수', '성공률(%)', '최근장애일']
        
        for col, header in enumerate(headers):
            worksheet.write(5, col, header, header_format)
        
        # 데이터
        for row_idx, row in enumerate(rows, start=6):
            worksheet.write(row_idx, 0, row['고객코드'], cell_format)
            worksheet.write(row_idx, 1, row['고객사명'], cell_format)
            worksheet.write(row_idx, 2, row['담당엔지니어'], cell_format)
            worksheet.write(row_idx, 3, row['계약등급'], cell_format)
            worksheet.write(row_idx, 4, row['서버수'], number_format)
            worksheet.write(row_idx, 5, row['총작업수'], number_format)
            worksheet.write(row_idx, 6, row['실패건수'], number_format)
            worksheet.write(row_idx, 7, row['성공건수'], number_format)
            worksheet.write(row_idx, 8, row['성공률'] if row['성공률'] else 0, percent_format)
            
            last_failure = row['최근장애일'].strftime('%Y-%m-%d') if row['최근장애일'] else '-'
            worksheet.write(row_idx, 9, last_failure, cell_format)
        
        # 컬럼 너비 조정
        worksheet.set_column('A:A', 12)
        worksheet.set_column('B:B', 20)
        worksheet.set_column('C:C', 15)
        worksheet.set_column('D:D', 10)
        worksheet.set_column('E:E', 10)
        worksheet.set_column('F:H', 12)
        worksheet.set_column('I:I', 12)
        worksheet.set_column('J:J', 15)
        
        workbook.close()
        output.seek(0)
        
        filename = f'VBIP_고객사현황_{datetime.now().strftime("%Y%m%d_%H%M%S")}.xlsx'
        
        return send_file(
            output,
            mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            as_attachment=True,
            download_name=filename
        )
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/customer/<int:customer_id>')
def customer_detail(customer_id):
    """고객사 상세 페이지"""
    return render_template('customer_detail.html', customer_id=customer_id)

@app.route('/api/customer/<int:customer_id>')
def get_customer_detail(customer_id):
    """고객사 상세 정보 API"""
    try:
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        # 고객사 기본 정보
        cursor.execute("""
            SELECT c.*, 
                   e1.name as primary_engineer_name,
                   e2.name as secondary_engineer_name
            FROM customers c
            LEFT JOIN engineers e1 ON c.primary_engineer_id = e1.engineer_id
            LEFT JOIN engineers e2 ON c.secondary_engineer_id = e2.engineer_id
            WHERE c.customer_id = %s
        """, (customer_id,))
        
        customer = cursor.fetchone()
        
        if not customer:
            return jsonify({'error': 'Customer not found'}), 404
        
        # 최근 백업 작업 목록 (30일)
        cursor.execute("""
            SELECT 
                job_id,
                job_name,
                server_name,
                backup_type,
                status,
                error_code,
                error_message,
                start_time,
                end_time,
                duration_minutes,
                backup_size_gb
            FROM backup_jobs
            WHERE customer_id = %s
              AND start_time >= NOW() - INTERVAL '30 days'
            ORDER BY start_time DESC
            LIMIT 100
        """, (customer_id,))
        
        jobs = cursor.fetchall()
        
        # 통계 정보
        cursor.execute("""
            SELECT 
                COUNT(*) as total_jobs,
                COUNT(CASE WHEN status = 'Success' THEN 1 END) as success_count,
                COUNT(CASE WHEN status = 'Failed' THEN 1 END) as failed_count,
                AVG(duration_minutes) as avg_duration
            FROM backup_jobs
            WHERE customer_id = %s
              AND start_time >= NOW() - INTERVAL '30 days'
        """, (customer_id,))
        
        stats = cursor.fetchone()
        
        cursor.close()
        conn.close()
        
        # datetime 변환
        customer_dict = dict(customer)
        if customer_dict.get('created_at'):
            customer_dict['created_at'] = customer_dict['created_at'].strftime('%Y-%m-%d')
        
        jobs_list = []
        for job in jobs:
            job_dict = dict(job)
            if job_dict.get('start_time'):
                job_dict['start_time'] = job_dict['start_time'].strftime('%Y-%m-%d %H:%M')
            if job_dict.get('end_time'):
                job_dict['end_time'] = job_dict['end_time'].strftime('%Y-%m-%d %H:%M')
            jobs_list.append(job_dict)
        
        return jsonify({
            'customer': customer_dict,
            'jobs': jobs_list,
            'stats': dict(stats)
        })
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/health')
def health():
    """헬스 체크"""
    return jsonify({'status': 'healthy'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5002, debug=True)
