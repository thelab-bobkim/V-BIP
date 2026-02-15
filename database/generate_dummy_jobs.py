#!/usr/bin/env python3
"""
V-BIP 더미 백업 로그 생성기
최근 30일간의 백업 작업 히스토리 생성 (약 150-200건)
"""

import random
from datetime import datetime, timedelta

# 고객사 ID와 서버 정보
CUSTOMERS = [
    {'id': 1, 'code': 'SAMSUNG', 'name': '삼성전자', 'servers': ['DB01', 'DB02', 'WEB01', 'WEB02', 'APP01']},
    {'id': 2, 'code': 'LG', 'name': 'LG전자', 'servers': ['DB01', 'WEB01', 'APP01', 'FILE01']},
    {'id': 3, 'code': 'SKHYNIX', 'name': 'SK하이닉스', 'servers': ['DB01', 'DB02', 'APP01', 'APP02']},
    {'id': 4, 'code': 'HYUNDAI', 'name': '현대자동차', 'servers': ['DB01', 'DB02', 'DB03', 'WEB01', 'APP01', 'FILE01']},
    {'id': 5, 'code': 'POSCO', 'name': '포스코', 'servers': ['DB01', 'WEB01', 'APP01', 'FILE01']},
    {'id': 6, 'code': 'NAVER', 'name': '네이버', 'servers': ['DB01', 'WEB01', 'WEB02', 'APP01']},
    {'id': 7, 'code': 'KAKAO', 'name': '카카오', 'servers': ['DB01', 'WEB01', 'APP01']},
    {'id': 8, 'code': 'COUPANG', 'name': '쿠팡', 'servers': ['DB01', 'DB02', 'WEB01', 'WEB02', 'APP01', 'FILE01']},
    {'id': 9, 'code': 'BAEMIN', 'name': '배달의민족', 'servers': ['DB01', 'WEB01', 'APP01']},
    {'id': 10, 'code': 'WOOWA', 'name': '우아한형제들', 'servers': ['DB01', 'WEB01']}
]

# 백업 정책 (주간 Full, 평일 Incremental)
POLICIES = ['DAILY_FULL', 'DAILY_INCREMENTAL', 'WEEKLY_FULL', 'MONTHLY_FULL']

# 에러 코드 및 발생 확률
ERROR_CODES = {
    '58': 0.08,   # Tape Error (8%)
    '41': 0.10,   # Network Timeout (10%)
    '84': 0.05,   # Disk Space (5%)
    '96': 0.04,   # Client Not Responding (4%)
    '2106': 0.01, # License Error (1%)
    '13': 0.03,   # File Read Error (3%)
    '1': 0.02     # General Error (2%)
}

# 백업 타입별 데이터 크기 (GB)
BACKUP_SIZE_RANGES = {
    'Full': (50, 500),
    'Incremental': (5, 50),
    'Differential': (20, 150)
}

def generate_backup_jobs():
    """백업 작업 로그 생성"""
    jobs = []
    
    # 30일전부터 오늘까지
    end_date = datetime.now()
    start_date = end_date - timedelta(days=30)
    
    current_date = start_date
    job_counter = 1
    
    while current_date <= end_date:
        # 각 고객사별로 서버마다 백업 작업 생성
        for customer in CUSTOMERS:
            for server in customer['servers']:
                # 백업 타입 결정 (일요일: Full, 평일: Incremental)
                if current_date.weekday() == 6:  # 일요일
                    backup_type = 'Full'
                    policy = 'WEEKLY_FULL'
                else:
                    backup_type = 'Incremental'
                    policy = 'DAILY_INCREMENTAL'
                
                # 백업 시작 시간 (밤 11시 ~ 새벽 2시 랜덤)
                backup_hour = random.randint(23, 26) % 24
                backup_minute = random.randint(0, 59)
                start_time = current_date.replace(hour=backup_hour, minute=backup_minute, second=0)
                
                # 백업 소요 시간 (10분 ~ 180분)
                duration = random.randint(10, 180)
                end_time = start_time + timedelta(minutes=duration)
                
                # 성공/실패 결정 (90% 성공률)
                is_success = random.random() > 0.10
                
                if is_success:
                    status = 'Success'
                    exit_code = 0
                    error_code = None
                    error_message = None
                else:
                    status = 'Failed'
                    # 에러 코드 랜덤 선택 (가중치 적용)
                    error_code = random.choices(
                        list(ERROR_CODES.keys()),
                        weights=list(ERROR_CODES.values())
                    )[0]
                    exit_code = int(error_code)
                    
                    # 에러 메시지 생성
                    error_messages = {
                        '58': f'ERR - cannot connect to media server, exit status = 58',
                        '41': f'socket read failed - connection timed out, exit status = 41',
                        '84': f'disk full on staging directory /backup/staging, exit status = 84',
                        '96': f'client {server} not responding, exit status = 96',
                        '2106': f'license key expired or invalid, exit status = 2106',
                        '13': f'file read error for /data/file.dat, exit status = 13',
                        '1': f'backup failed with general error, exit status = 1'
                    }
                    error_message = error_messages.get(error_code, 'Unknown error')
                
                # 백업 데이터 크기
                size_range = BACKUP_SIZE_RANGES.get(backup_type, (10, 100))
                bytes_written = random.randint(int(size_range[0] * 1024**3), int(size_range[1] * 1024**3))
                files_backed_up = random.randint(1000, 50000)
                
                # SQL INSERT 문 생성
                job = f"""INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
({customer['id']}, '{server}', '{policy}', '{customer['code']}_{server}_{backup_type}', '{backup_type}',
    '{start_time.strftime("%Y-%m-%d %H:%M:%S")}', '{end_time.strftime("%Y-%m-%d %H:%M:%S")}', 
    {duration}, '{status}', {exit_code}, {'NULL' if error_code is None else f"'{error_code}'"}, 
    {'NULL' if error_message is None else f"'{error_message}'"}, {bytes_written}, {files_backed_up}, 
    'Dummy', 'system');"""
                
                jobs.append(job)
                job_counter += 1
        
        # 다음 날로 이동
        current_date += timedelta(days=1)
    
    return jobs

def generate_log_upload_records(total_jobs):
    """로그 업로드 히스토리 생성"""
    uploads = []
    
    # 30일간 매일 1-2개 업로드 기록
    end_date = datetime.now()
    start_date = end_date - timedelta(days=30)
    current_date = start_date
    
    upload_id = 1
    while current_date <= end_date:
        num_uploads = random.randint(1, 2)
        for _ in range(num_uploads):
            customer = random.choice(CUSTOMERS)
            upload_time = current_date.replace(hour=random.randint(9, 17), minute=random.randint(0, 59))
            
            jobs_count = len([s for s in customer['servers']])
            errors_count = random.randint(0, 3)
            
            upload = f"""INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
({customer['id']}, '{'Agent' if random.random() > 0.5 else 'Email'}', 
    '{customer['code']}_backup_{upload_time.strftime("%Y%m%d")}.log', {random.randint(500, 5000)}, 
    'engineer@dstl.co.kr', '{upload_time.strftime("%Y-%m-%d %H:%M:%S")}', 'Success', 
    {jobs_count}, {errors_count}, {random.uniform(1.5, 8.5):.2f});"""
            
            uploads.append(upload)
            upload_id += 1
        
        current_date += timedelta(days=1)
    
    return uploads

def main():
    print("-- ============================================")
    print("-- V-BIP 더미 백업 작업 로그 생성")
    print(f"-- 생성일: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("-- ============================================\n")
    
    # 백업 작업 로그 생성
    print("-- 백업 작업 로그 삽입 (최근 30일)")
    jobs = generate_backup_jobs()
    for job in jobs:
        print(job)
    
    print(f"\n-- 총 {len(jobs)}건의 백업 작업 로그 생성 완료\n")
    
    # 로그 업로드 히스토리 생성
    print("-- 로그 업로드 히스토리")
    uploads = generate_log_upload_records(len(jobs))
    for upload in uploads:
        print(upload)
    
    print(f"\n-- 총 {len(uploads)}건의 업로드 기록 생성 완료")
    
    # 통계 정보
    success_count = len([j for j in jobs if "'Success'" in j])
    failed_count = len(jobs) - success_count
    success_rate = (success_count / len(jobs)) * 100
    
    print(f"\n-- 통계 정보")
    print(f"-- 전체 백업 작업: {len(jobs)}건")
    print(f"-- 성공: {success_count}건 ({success_rate:.1f}%)")
    print(f"-- 실패: {failed_count}건 ({100-success_rate:.1f}%)")

if __name__ == '__main__':
    main()
