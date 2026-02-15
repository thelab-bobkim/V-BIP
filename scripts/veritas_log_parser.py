#!/usr/bin/env python3
"""
V-BIP Veritas Log Parser
Veritas NetBackup 로그 파일을 파싱하여 PostgreSQL에 저장
"""

import re
import sys
import argparse
from datetime import datetime
from typing import List, Dict, Optional
import psycopg2
from psycopg2.extras import RealDictCursor

class VeritasLogParser:
    """Veritas NetBackup 로그 파서"""
    
    # 정규표현식 패턴
    PATTERNS = {
        'timestamp': re.compile(r'(\d{2}/\d{2}/\d{4}\s+\d{2}:\d{2}:\d{2})'),
        
        'job_start': re.compile(
            r'(\d{2}/\d{2}/\d{4}\s+\d{2}:\d{2}:\d{2})\s+-\s+Info.*'
            r'backup started.*client\s+(\S+),\s+policy\s+(\S+)'
        ),
        
        'error': re.compile(
            r'(\d{2}/\d{2}/\d{4}\s+\d{2}:\d{2}:\d{2})\s+-\s+Error.*'
            r'exit status\s*=\s*(\d+)'
        ),
        
        'error_detail': re.compile(
            r'ERR\s+-\s+(.+?)(?:,\s*exit status|$)'
        ),
        
        'job_end': re.compile(
            r'(\d{2}/\d{2}/\d{4}\s+\d{2}:\d{2}:\d{2})\s+-\s+Info.*'
            r'backup\s+(completed|failed).*client\s+(\S+)'
        ),
        
        'bytes_written': re.compile(
            r'kilobytes transferred:\s+(\d+)'
        ),
        
        'files_backed_up': re.compile(
            r'files backed up:\s+(\d+)'
        )
    }
    
    def __init__(self, db_config: Dict[str, str]):
        """
        Args:
            db_config: PostgreSQL 연결 설정
                {host, database, user, password, port}
        """
        self.db_config = db_config
        self.conn = None
        self.cursor = None
        
    def connect_db(self):
        """데이터베이스 연결"""
        try:
            self.conn = psycopg2.connect(**self.db_config)
            self.cursor = self.conn.cursor(cursor_factory=RealDictCursor)
            print(f"✓ PostgreSQL 연결 성공: {self.db_config['database']}")
        except Exception as e:
            print(f"✗ DB 연결 실패: {e}")
            sys.exit(1)
    
    def close_db(self):
        """데이터베이스 연결 종료"""
        if self.cursor:
            self.cursor.close()
        if self.conn:
            self.conn.close()
    
    def parse_timestamp(self, timestamp_str: str) -> datetime:
        """타임스탬프 문자열을 datetime 객체로 변환"""
        return datetime.strptime(timestamp_str, '%m/%d/%Y %H:%M:%S')
    
    def get_customer_id(self, customer_code: str) -> Optional[int]:
        """고객사 코드로 ID 조회"""
        query = "SELECT customer_id FROM customers WHERE customer_code = %s"
        self.cursor.execute(query, (customer_code,))
        result = self.cursor.fetchone()
        return result['customer_id'] if result else None
    
    def parse_log_file(self, file_path: str, customer_code: str, uploader_email: str = 'system') -> Dict:
        """
        로그 파일 파싱
        
        Args:
            file_path: 로그 파일 경로
            customer_code: 고객사 코드 (예: 'SAMSUNG')
            uploader_email: 업로더 이메일
            
        Returns:
            파싱 결과 딕셔너리
        """
        jobs = []
        current_job = None
        line_number = 0
        
        print(f"\n📄 로그 파일 파싱 시작: {file_path}")
        
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                for line in f:
                    line_number += 1
                    line = line.strip()
                    
                    if not line:
                        continue
                    
                    # Job 시작 감지
                    match = self.PATTERNS['job_start'].search(line)
                    if match:
                        if current_job:  # 이전 작업 저장
                            jobs.append(current_job)
                        
                        current_job = {
                            'customer_code': customer_code,
                            'start_time': self.parse_timestamp(match.group(1)),
                            'server_name': match.group(2),
                            'policy_name': match.group(3),
                            'status': 'Running',
                            'errors': [],
                            'bytes_written': 0,
                            'files_backed_up': 0
                        }
                        continue
                    
                    # 에러 감지
                    match = self.PATTERNS['error'].search(line)
                    if match and current_job:
                        error_code = match.group(2)
                        error_time = self.parse_timestamp(match.group(1))
                        
                        # 에러 상세 메시지 추출
                        detail_match = self.PATTERNS['error_detail'].search(line)
                        error_message = detail_match.group(1).strip() if detail_match else line
                        
                        current_job['errors'].append({
                            'time': error_time,
                            'code': error_code,
                            'message': error_message
                        })
                        continue
                    
                    # Job 종료 감지
                    match = self.PATTERNS['job_end'].search(line)
                    if match and current_job:
                        current_job['end_time'] = self.parse_timestamp(match.group(1))
                        current_job['status'] = 'Failed' if match.group(2) == 'failed' else 'Success'
                        
                        # Duration 계산
                        if 'end_time' in current_job and 'start_time' in current_job:
                            duration = (current_job['end_time'] - current_job['start_time']).total_seconds() / 60
                            current_job['duration_minutes'] = int(duration)
                        
                        jobs.append(current_job)
                        current_job = None
                        continue
                    
                    # Bytes written 감지
                    match = self.PATTERNS['bytes_written'].search(line)
                    if match and current_job:
                        kb = int(match.group(1))
                        current_job['bytes_written'] = kb * 1024  # KB to Bytes
                        continue
                    
                    # Files backed up 감지
                    match = self.PATTERNS['files_backed_up'].search(line)
                    if match and current_job:
                        current_job['files_backed_up'] = int(match.group(1))
                        continue
            
            # 마지막 작업 저장
            if current_job:
                jobs.append(current_job)
            
            print(f"✓ 파싱 완료: {len(jobs)}개 작업 발견")
            
            # 통계
            errors_found = sum(len(job['errors']) for job in jobs)
            print(f"  - 에러 발견: {errors_found}건")
            
            return {
                'success': True,
                'jobs_count': len(jobs),
                'errors_count': errors_found,
                'jobs': jobs
            }
            
        except FileNotFoundError:
            print(f"✗ 파일을 찾을 수 없습니다: {file_path}")
            return {'success': False, 'error': 'File not found'}
        except Exception as e:
            print(f"✗ 파싱 오류: {e}")
            return {'success': False, 'error': str(e)}
    
    def save_to_database(self, parse_result: Dict, customer_code: str, uploader_email: str,
                         log_file_name: str, log_source: str = 'Email') -> bool:
        """
        파싱 결과를 데이터베이스에 저장
        
        Args:
            parse_result: parse_log_file() 반환값
            customer_code: 고객사 코드
            uploader_email: 업로더 이메일
            log_file_name: 로그 파일 이름
            log_source: 로그 소스 ('Email', 'WebUpload', 'Agent')
            
        Returns:
            성공 여부
        """
        if not parse_result['success']:
            return False
        
        # 고객사 ID 조회
        customer_id = self.get_customer_id(customer_code)
        if not customer_id:
            print(f"✗ 고객사 코드를 찾을 수 없습니다: {customer_code}")
            return False
        
        print(f"\n💾 데이터베이스 저장 중...")
        
        try:
            jobs = parse_result['jobs']
            saved_count = 0
            
            for job in jobs:
                # 에러 정보 추출
                error_code = None
                error_message = None
                exit_code = 0
                
                if job['errors']:
                    first_error = job['errors'][0]
                    error_code = first_error['code']
                    error_message = first_error['message']
                    exit_code = int(error_code)
                
                # Backup type 추정 (policy 이름에서)
                backup_type = 'Incremental'
                if 'FULL' in job['policy_name'].upper():
                    backup_type = 'Full'
                elif 'DIFF' in job['policy_name'].upper():
                    backup_type = 'Differential'
                
                # INSERT 쿼리
                insert_query = """
                INSERT INTO backup_jobs 
                (customer_id, server_name, policy_name, job_name, backup_type,
                 start_time, end_time, duration_minutes, status, exit_code, 
                 error_code, error_message, bytes_written, files_backed_up,
                 log_source, uploaded_by, raw_log_file_path)
                VALUES 
                (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                RETURNING job_id
                """
                
                values = (
                    customer_id,
                    job['server_name'],
                    job['policy_name'],
                    f"{customer_code}_{job['server_name']}_{backup_type}",
                    backup_type,
                    job['start_time'],
                    job.get('end_time'),
                    job.get('duration_minutes'),
                    job['status'],
                    exit_code,
                    error_code,
                    error_message,
                    job['bytes_written'],
                    job['files_backed_up'],
                    log_source,
                    uploader_email,
                    log_file_name
                )
                
                self.cursor.execute(insert_query, values)
                job_id = self.cursor.fetchone()['job_id']
                saved_count += 1
                
                # 에러가 있으면 알림 히스토리 생성 (나중에 n8n이 처리)
                if error_code:
                    print(f"  ⚠️  Job {job_id}: {job['server_name']} - Error {error_code}")
            
            # 로그 업로드 히스토리 저장
            upload_query = """
            INSERT INTO log_uploads
            (customer_id, upload_method, file_name, uploader_email, 
             parsing_status, jobs_extracted, errors_found)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
            """
            
            self.cursor.execute(upload_query, (
                customer_id,
                log_source,
                log_file_name,
                uploader_email,
                'Success',
                len(jobs),
                parse_result['errors_count']
            ))
            
            self.conn.commit()
            
            print(f"✓ 저장 완료: {saved_count}개 작업")
            return True
            
        except Exception as e:
            self.conn.rollback()
            print(f"✗ DB 저장 실패: {e}")
            return False


def main():
    parser = argparse.ArgumentParser(description='Veritas NetBackup 로그 파서')
    parser.add_argument('--file', required=True, help='로그 파일 경로')
    parser.add_argument('--customer', required=True, help='고객사 코드 (예: SAMSUNG)')
    parser.add_argument('--uploader', default='system', help='업로더 이메일')
    parser.add_argument('--source', default='Email', choices=['Email', 'WebUpload', 'Agent'],
                       help='로그 소스')
    parser.add_argument('--db-host', default='localhost', help='PostgreSQL 호스트')
    parser.add_argument('--db-port', default='5432', help='PostgreSQL 포트')
    parser.add_argument('--db-name', default='veritas_monitor', help='데이터베이스 이름')
    parser.add_argument('--db-user', default='postgres', help='DB 사용자')
    parser.add_argument('--db-password', default='', help='DB 비밀번호')
    
    args = parser.parse_args()
    
    # DB 설정
    db_config = {
        'host': args.db_host,
        'port': args.db_port,
        'database': args.db_name,
        'user': args.db_user,
        'password': args.db_password
    }
    
    # 파서 초기화
    parser_instance = VeritasLogParser(db_config)
    parser_instance.connect_db()
    
    # 로그 파싱
    result = parser_instance.parse_log_file(args.file, args.customer, args.uploader)
    
    # DB 저장
    if result['success']:
        import os
        log_file_name = os.path.basename(args.file)
        success = parser_instance.save_to_database(
            result, args.customer, args.uploader, log_file_name, args.source
        )
        
        if success:
            print(f"\n✅ 전체 프로세스 완료!")
            print(f"   작업: {result['jobs_count']}건")
            print(f"   에러: {result['errors_count']}건")
    else:
        print(f"\n❌ 파싱 실패")
        sys.exit(1)
    
    parser_instance.close_db()


if __name__ == '__main__':
    main()
