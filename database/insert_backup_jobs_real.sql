-- 김인석 부장 담당 고객사 실제 장애 이력
-- 총 290건
-- 생성일: 2026-02-16 06:57:39

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSSQL 백업 실패',
    '2025-11-26 06:57:39',
    '2025-11-26 08:09:39',
    112,
    'Failed',
    58,
    '2: 요청 항목 백업 안됨
13: File read/write 오류
50: Client process aborted',
    '2025-11-26 06:57:39'
FROM customers c
WHERE c.company_name = '코밸'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '파일 백업 실패',
    '2025-09-11 06:57:39',
    '2025-09-11 07:07:39',
    68,
    'Failed',
    13,
    '13: File read/write 오류
58: Client 연결 실패',
    '2025-09-11 06:57:39'
FROM customers c
WHERE c.company_name = '코밸'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 24 장애',
    '2026-01-05 06:57:39',
    '2026-01-05 07:53:39',
    83,
    'Failed',
    24,
    'Socket write failed (네트워크)',
    '2026-01-05 06:57:39'
FROM customers c
WHERE c.company_name = '코밸'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 58 실패',
    '2025-12-24 06:57:39',
    '2025-12-24 07:29:39',
    101,
    'Failed',
    58,
    'Client connection failure',
    '2025-12-24 06:57:39'
FROM customers c
WHERE c.company_name = '코밸'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 96 장애',
    '2025-12-27 06:57:39',
    '2025-12-27 08:54:39',
    103,
    'Failed',
    96,
    'Media 할당 실패',
    '2025-12-27 06:57:39'
FROM customers c
WHERE c.company_name = '코밸'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 장애지원',
    '2026-01-28 06:57:39',
    '2026-01-28 08:33:39',
    114,
    'Failed',
    84,
    'Storage write 오류 또는 Snapshot 실패 대응',
    '2026-01-28 06:57:39'
FROM customers c
WHERE c.company_name = 'KG모빌리티'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 중 Hang 걸림 현상 장애지원',
    '2025-12-21 06:57:39',
    '2025-12-21 08:44:39',
    77,
    'Failed',
    84,
    'Media/Storage I/O 오류 또는 Client 중단으로 인한 Hang',
    '2025-12-21 06:57:39'
FROM customers c
WHERE c.company_name = 'KG모빌리티'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 중 특정 용량 도달 시 Hang',
    '2025-12-18 06:57:39',
    '2025-12-18 08:42:39',
    100,
    'Failed',
    84,
    'Storage 용량/Media 할당/쓰기 지연 문제',
    '2025-12-18 06:57:39'
FROM customers c
WHERE c.company_name = 'KG모빌리티'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM status 156 장애지원',
    '2026-02-09 06:57:39',
    '2026-02-09 08:43:39',
    30,
    'Failed',
    58,
    'Snapshot 오류 (VMware/Hyper-V)',
    '2026-02-09 06:57:39'
FROM customers c
WHERE c.company_name = 'KG모빌리티'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 장애지원',
    '2025-11-27 06:57:39',
    '2025-11-27 07:27:39',
    43,
    'Failed',
    13,
    '파일 I/O / Storage / Client 연결 오류',
    '2025-11-27 06:57:39'
FROM customers c
WHERE c.company_name = 'KG모빌리티'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Arch / VM 장애지원',
    '2025-10-12 06:57:39',
    '2025-10-12 07:21:39',
    94,
    'Failed',
    13,
    'Archive/File I/O 또는 Storage 오류',
    '2025-10-12 06:57:39'
FROM customers c
WHERE c.company_name = 'KG모빌리티'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'SAN 백업 실패 장애지원',
    '2025-11-16 06:57:39',
    '2025-11-16 08:26:39',
    112,
    'Failed',
    84,
    'Tape/Media/Storage 또는 Disk Pool 문제',
    '2025-11-16 06:57:39'
FROM customers c
WHERE c.company_name = 'KG모빌리티'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업 실패 장애처리',
    '2025-11-15 06:57:39',
    '2025-11-15 08:00:39',
    78,
    'Failed',
    84,
    'Storage 또는 Snapshot 실패',
    '2025-11-15 06:57:39'
FROM customers c
WHERE c.company_name = 'KG모빌리티'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'HCI 복구 장애 처리',
    '2025-11-13 06:57:39',
    '2025-11-13 08:03:39',
    51,
    'Failed',
    58,
    '접근 권한 / I/O / Storage 문제 가능',
    '2025-11-13 06:57:39'
FROM customers c
WHERE c.company_name = 'KG모빌리티'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'BCV FC 백업 실패',
    '2025-10-20 06:57:39',
    '2025-10-20 08:15:39',
    66,
    'Failed',
    84,
    'FC 경로 / Media / Storage 문제',
    '2025-10-20 06:57:39'
FROM customers c
WHERE c.company_name = 'KG모빌리티'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'File 서버 FC 백업 속도 이슈',
    '2025-09-01 06:57:39',
    '2025-09-01 08:04:39',
    107,
    'Failed',
    84,
    '성능 저하 / I/O 병목 / Storage 지연',
    '2025-09-01 06:57:39'
FROM customers c
WHERE c.company_name = 'KG모빌리티'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'File 서버 FC 백업 점검',
    '2026-02-15 06:57:39',
    '2026-02-15 07:45:39',
    82,
    'Failed',
    58,
    'Storage/경로/디바이스 성능 점검',
    '2026-02-15 06:57:39'
FROM customers c
WHERE c.company_name = 'KG모빌리티'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 14 백업 중 실패',
    '2025-10-03 06:57:39',
    '2025-10-03 08:33:39',
    57,
    'Failed',
    14,
    'File list / path / access 문제',
    '2025-10-03 06:57:39'
FROM customers c
WHERE c.company_name = '강릉동인병원'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 24 장애',
    '2025-11-18 06:57:39',
    '2025-11-18 07:29:39',
    26,
    'Failed',
    24,
    'Socket write failed (네트워크)',
    '2025-11-18 06:57:39'
FROM customers c
WHERE c.company_name = '강릉동인병원'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 58 실패',
    '2025-12-09 06:57:39',
    '2025-12-09 07:50:39',
    53,
    'Failed',
    58,
    'Client connection failure',
    '2025-12-09 06:57:39'
FROM customers c
WHERE c.company_name = '강릉동인병원'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 84 장애',
    '2025-10-25 06:57:39',
    '2025-10-25 08:29:39',
    97,
    'Failed',
    84,
    'Media write / Disk / Storage 오류',
    '2025-10-25 06:57:39'
FROM customers c
WHERE c.company_name = '강릉동인병원'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 96 장애',
    '2025-12-10 06:57:39',
    '2025-12-10 08:13:39',
    116,
    'Failed',
    96,
    'Media 할당 실패',
    '2025-12-10 06:57:39'
FROM customers c
WHERE c.company_name = '강릉동인병원'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 장애지원',
    '2026-02-06 06:57:39',
    '2026-02-06 08:18:39',
    62,
    'Failed',
    13,
    '파일 I/O / Storage / Client 연결 오류 대응',
    '2026-02-06 06:57:39'
FROM customers c
WHERE c.company_name = '농민신문사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'PTL 다운으로 인한 백업 실패',
    '2025-10-04 06:57:39',
    '2025-10-04 08:36:39',
    15,
    'Failed',
    84,
    'Tape/Media 서버 또는 PTL 장비 다운으로 인한 백업 실패',
    '2025-10-04 06:57:39'
FROM customers c
WHERE c.company_name = '농민신문사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Java 콘솔 접속 불가 / 장기간 백업 미실행',
    '2025-10-27 06:57:39',
    '2025-10-27 07:52:39',
    45,
    'Failed',
    58,
    '콘솔 접속 오류(통신/인증), Backup window/스케줄 문제 또는 Backup not attempted',
    '2025-10-27 06:57:39'
FROM customers c
WHERE c.company_name = '농민신문사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MongoDB failed to start',
    '2026-01-23 06:57:39',
    '2026-01-23 08:29:39',
    20,
    'Failed',
    58,
    'DB 서비스 기동 실패로 백업/연계 작업 영향',
    '2026-01-23 06:57:39'
FROM customers c
WHERE c.company_name = '농민신문사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '복제 실패 / Hardware 장애 확인',
    '2025-10-06 06:57:39',
    '2025-10-06 08:05:39',
    58,
    'Failed',
    84,
    'Storage/Disk Pool/LSU 또는 장비(HW) 이상 점검 및 조치',
    '2025-10-06 06:57:39'
FROM customers c
WHERE c.company_name = '동일패키지'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '소산백업 Hang 걸림 현상',
    '2025-12-12 06:57:39',
    '2025-12-12 08:04:39',
    95,
    'Failed',
    84,
    'Storage I/O 지연, 프로세스 정체 또는 Client 중단 가능',
    '2025-12-12 06:57:39'
FROM customers c
WHERE c.company_name = '동일패키지'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Duplicate 작업 백업 실패',
    '2026-01-02 06:57:39',
    '2026-01-02 07:10:39',
    92,
    'Failed',
    84,
    'Media write 오류 또는 Media 할당 실패',
    '2026-01-02 06:57:39'
FROM customers c
WHERE c.company_name = '동일패키지'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '넷백업 장애지원',
    '2025-11-12 06:57:39',
    '2025-11-12 07:16:39',
    43,
    'Failed',
    13,
    '일반 백업 오류 (I/O, 통신, Client 연결, Storage 등)',
    '2025-11-12 06:57:39'
FROM customers c
WHERE c.company_name = '동일패키지'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 장애지원',
    '2025-12-09 06:57:39',
    '2025-12-09 07:16:39',
    87,
    'Failed',
    13,
    '파일 I/O / Storage / Client 연결 오류 대응',
    '2025-12-09 06:57:39'
FROM customers c
WHERE c.company_name = '서영엔지니어링'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 시 Oracle 서비스 끊김',
    '2025-12-14 06:57:39',
    '2025-12-14 08:19:39',
    27,
    'Failed',
    58,
    '백업 부하 / Snapshot / I/O 경합으로 DB 서비스 영향 분석',
    '2025-12-14 06:57:39'
FROM customers c
WHERE c.company_name = '서영엔지니어링'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle 장애지원',
    '2025-09-25 06:57:39',
    '2025-09-25 08:07:39',
    62,
    'Failed',
    58,
    'DB 상태 / 권한 / 파일 접근 오류 대응',
    '2025-09-25 06:57:39'
FROM customers c
WHERE c.company_name = '서영엔지니어링'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle 장애 처리',
    '2025-08-24 06:57:39',
    '2025-08-24 08:23:39',
    115,
    'Failed',
    58,
    'DB 및 백업 연계 장애 분석/조치',
    '2025-08-24 06:57:39'
FROM customers c
WHERE c.company_name = '서영엔지니어링'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Disk Oracle Backup Status 84',
    '2025-10-10 06:57:39',
    '2025-10-10 08:00:39',
    97,
    'Failed',
    84,
    'Media write / Disk / Storage 오류',
    '2025-10-10 06:57:39'
FROM customers c
WHERE c.company_name = '서영엔지니어링'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle 백업 장애지원',
    '2025-10-10 06:57:39',
    '2025-10-10 08:42:39',
    109,
    'Failed',
    58,
    'DB 백업 실패 (요청 항목 백업 안됨 / I/O / Storage 오류)',
    '2025-10-10 06:57:39'
FROM customers c
WHERE c.company_name = '서영엔지니어링'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle Status 2106 실패',
    '2025-09-11 06:57:39',
    '2025-09-11 08:32:39',
    113,
    'Failed',
    58,
    'Oracle 정책/스크립트/환경 설정 오류',
    '2025-09-11 06:57:39'
FROM customers c
WHERE c.company_name = '서영엔지니어링'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup 장애지원',
    '2025-12-19 06:57:39',
    '2025-12-19 08:43:39',
    72,
    'Failed',
    13,
    '일반 장애 대응 (I/O / 통신 / Client / Storage)',
    '2025-12-19 06:57:39'
FROM customers c
WHERE c.company_name = '서영엔지니어링'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DB 백업 상태 모니터링',
    '2026-02-03 06:57:39',
    '2026-02-03 07:17:39',
    29,
    'Failed',
    58,
    '백업 성공 여부 및 성능/상태 점검',
    '2026-02-03 06:57:39'
FROM customers c
WHERE c.company_name = '서영엔지니어링'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DB 백업 장애지원',
    '2026-01-28 06:57:39',
    '2026-01-28 08:04:39',
    82,
    'Failed',
    58,
    'DB 백업 실패 / I/O / Storage 오류 대응',
    '2026-01-28 06:57:39'
FROM customers c
WHERE c.company_name = '서영엔지니어링'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'SQL 백업 장애지원',
    '2025-12-03 06:57:39',
    '2025-12-03 08:35:39',
    55,
    'Failed',
    58,
    'MSSQL/DB 백업 실패 대응',
    '2025-12-03 06:57:39'
FROM customers c
WHERE c.company_name = '서영엔지니어링'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '마스터/미디어 서버 인증 장애',
    '2025-10-01 06:57:39',
    '2025-10-01 07:59:39',
    60,
    'Failed',
    58,
    '인증 실패 / Socket 통신 오류 / Client 연결 실패',
    '2025-10-01 06:57:39'
FROM customers c
WHERE c.company_name = '서영엔지니어링'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup 장애지원',
    '2025-09-14 06:57:39',
    '2025-09-14 07:13:39',
    61,
    'Failed',
    13,
    '일반 장애 대응 (I/O / 통신 / Client / Storage)',
    '2025-09-14 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유거창공장'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 상태 모니터링 (Flex 5150 NDB 서비스 다운)',
    '2025-09-24 06:57:39',
    '2025-09-24 08:02:39',
    26,
    'Failed',
    58,
    'NDB 서비스 다운으로 인한 백업 영향 / 서비스 상태 점검',
    '2025-09-24 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유거창공장'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 상태 모니터링',
    '2026-01-30 06:57:39',
    '2026-01-30 08:52:39',
    68,
    'Failed',
    58,
    '백업 성공 여부 및 성능/상태 점검',
    '2026-01-30 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유거창공장'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle 아카이브 삭제 구문 미적용',
    '2026-01-13 06:57:39',
    '2026-01-13 07:23:39',
    27,
    'Failed',
    58,
    '아카이브 로그 관리/스크립트 미적용으로 인한 공간/백업 영향',
    '2026-01-13 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유거창공장'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Client 메모리 과다 사용 → 버전 다운그레이드',
    '2025-11-10 06:57:39',
    '2025-11-10 08:08:39',
    30,
    'Failed',
    58,
    'Client 자원 사용률 이슈로 인한 안정화 조치',
    '2025-11-10 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유거창공장'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업실패 장애지원',
    '2025-12-21 06:57:39',
    '2025-12-21 08:22:39',
    100,
    'Failed',
    84,
    '84: Media write error / Storage 문제
156: Snapshot 오류
13: File read/write 오류',
    '2025-12-21 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSSQL Status 2 장애지원',
    '2025-10-26 06:57:39',
    '2025-10-26 08:37:39',
    114,
    'Failed',
    58,
    '요청된 파일/DB 백업 안됨 (권한, 스크립트, DB 상태 등)',
    '2025-10-26 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DR 소산 백업 재 구성, HyperV 장애지원',
    '2025-12-02 06:57:39',
    '2025-12-02 07:11:39',
    73,
    'Failed',
    58,
    '58: Client 연결 실패
1556: Snapshot/VSS/Hyper-V 오류
156: Snapshot 오류',
    '2025-12-02 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'PTL 장비 교체 재설정, HyperV 백업 미실행 장애지원',
    '2026-01-06 06:57:39',
    '2026-01-06 08:45:39',
    109,
    'Failed',
    84,
    '84: Storage/media write 문제
96: Media 할당 실패
156: Snapshot 오류',
    '2026-01-06 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 장애지원',
    '2025-10-16 06:57:39',
    '2025-10-16 08:01:39',
    78,
    'Failed',
    84,
    '195: Client backup not attempted',
    '2025-10-16 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '소산백업 누락본 확인 및 수동 실행',
    '2025-09-07 06:57:39',
    '2025-09-07 08:13:39',
    88,
    'Failed',
    58,
    '190/191: 스케줄/Backup window 문제
50: Client process aborted',
    '2025-09-07 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '소산백업 장애지원',
    '2025-11-15 06:57:39',
    '2025-11-15 07:18:39',
    83,
    'Failed',
    84,
    '2074: Disk/OpenStorage/LSU 오류',
    '2025-11-15 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '[수원대학교] 백업 장애지원',
    '2025-10-17 06:57:39',
    '2025-10-17 08:47:39',
    90,
    'Failed',
    13,
    '일반 백업 오류 대표 코드',
    '2025-10-17 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 상태 점검 및 VM Status 84 장애지원',
    '2025-10-08 06:57:39',
    '2025-10-08 07:58:39',
    48,
    'Failed',
    84,
    'Media write / Disk / Storage 문제',
    '2025-10-08 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM Status 158 장애지원',
    '2025-12-20 06:57:39',
    '2025-12-20 08:31:39',
    96,
    'Failed',
    58,
    'Snapshot failure / VSS / Hypervisor 오류',
    '2025-12-20 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '주말간 백업 전체 실패',
    '2025-12-08 06:57:39',
    '2025-12-08 08:15:39',
    63,
    'Failed',
    58,
    '주말 스케줄 백업 실패, Storage/Media 또는 Media 할당 문제',
    '2025-12-08 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'ERP / MSSQL / MariaDB 백업 실패',
    '2026-01-23 06:57:39',
    '2026-01-23 08:09:39',
    47,
    'Failed',
    58,
    'DB/파일 백업 실패 (권한, 파일 I/O, Client 중단 등)',
    '2026-01-23 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NAS 백업 장애',
    '2025-09-05 06:57:39',
    '2025-09-05 08:14:39',
    39,
    'Failed',
    13,
    'NAS 접근/마운트/권한 오류 또는 Disk/Storage 문제',
    '2025-09-05 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '파일 백업 실패',
    '2025-10-16 06:57:39',
    '2025-10-16 08:00:39',
    109,
    'Failed',
    13,
    '파일 I/O 오류 또는 Client 연결 실패',
    '2025-10-16 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Hyper-V 백업 장애',
    '2025-09-01 06:57:39',
    '2025-09-01 07:32:39',
    95,
    'Failed',
    58,
    'Hyper-V Snapshot/VSS 오류',
    '2025-09-01 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 미실행 / 누락',
    '2025-10-20 06:57:39',
    '2025-10-20 08:26:39',
    116,
    'Failed',
    58,
    'Backup window/스케줄 문제 또는 Backup not attempted',
    '2025-10-20 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'bpbkar32 hang / 정지',
    '2026-01-30 06:57:39',
    '2026-01-30 08:57:39',
    111,
    'Failed',
    84,
    '프로세스 hang, I/O 오류 또는 권한 문제 가능',
    '2026-01-30 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup Client 서비스 다운',
    '2025-10-24 06:57:39',
    '2025-10-24 08:28:39',
    105,
    'Failed',
    58,
    'Client connection failure / Socket 연결 실패',
    '2025-10-24 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '복제(Replication) 장애',
    '2025-10-04 06:57:39',
    '2025-10-04 08:34:39',
    45,
    'Failed',
    84,
    'Storage / Disk Pool / LSU 문제',
    '2025-10-04 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Storage Server down',
    '2025-10-18 06:57:39',
    '2025-10-18 07:19:39',
    36,
    'Failed',
    84,
    'Disk/OpenStorage/MSDP 또는 Media 문제',
    '2025-10-18 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VSR 백업 실패',
    '2026-01-24 06:57:39',
    '2026-01-24 07:14:39',
    90,
    'Failed',
    84,
    'Snapshot/Storage 영향 또는 Client 중단',
    '2026-01-24 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업 장애',
    '2026-01-31 06:57:39',
    '2026-01-31 07:39:39',
    118,
    'Failed',
    84,
    'Storage write 오류 또는 Snapshot 실패',
    '2026-01-31 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 14 백업 중 실패',
    '2025-10-02 06:57:39',
    '2025-10-02 08:02:39',
    96,
    'Failed',
    14,
    'File list / Path / Access 문제',
    '2025-10-02 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 24 장애',
    '2025-08-28 06:57:39',
    '2025-08-28 07:43:39',
    19,
    'Failed',
    24,
    'Socket write failed (네트워크 오류)',
    '2025-08-28 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 58 실패',
    '2025-11-06 06:57:39',
    '2025-11-06 07:33:39',
    40,
    'Failed',
    58,
    'Client connection failure',
    '2025-11-06 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 84 장애',
    '2025-10-20 06:57:39',
    '2025-10-20 08:44:39',
    49,
    'Failed',
    84,
    'Media write / Disk / Storage 오류',
    '2025-10-20 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 96 장애',
    '2026-02-13 06:57:39',
    '2026-02-13 08:40:39',
    40,
    'Failed',
    96,
    'Media 할당 실패',
    '2026-02-13 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 158 장애',
    '2025-10-08 06:57:39',
    '2025-10-08 07:56:39',
    24,
    'Failed',
    58,
    'Snapshot failure',
    '2025-10-08 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Unable to communicate with SDCSS IPS',
    '2025-09-06 06:57:39',
    '2025-09-06 08:45:39',
    27,
    'Failed',
    58,
    '네트워크 / 서비스 / 포트 통신 문제',
    '2025-09-06 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'OPS / OpsCenter 장애',
    '2025-12-04 06:57:39',
    '2025-12-04 07:25:39',
    44,
    'Failed',
    13,
    '통신 / 서비스 / DB 연결 문제',
    '2025-12-04 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Elevate 모드 진입 불가',
    '2025-08-21 06:57:39',
    '2025-08-21 08:50:39',
    46,
    'Failed',
    58,
    '인증 / 권한 / 서비스 문제 가능',
    '2025-08-21 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 장애지원',
    '2025-09-16 06:57:39',
    '2025-09-16 08:00:39',
    32,
    'Failed',
    84,
    'Storage write 오류 또는 Snapshot 실패 대응',
    '2025-09-16 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 중 Hang 걸림 현상 장애지원',
    '2025-09-23 06:57:39',
    '2025-09-23 08:53:39',
    112,
    'Failed',
    84,
    'Media/Storage I/O 오류 또는 Client 중단으로 인한 Hang',
    '2025-09-23 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 중 특정 용량 도달 시 Hang',
    '2025-09-05 06:57:39',
    '2025-09-05 07:08:39',
    119,
    'Failed',
    84,
    'Storage 용량/Media 할당/쓰기 지연 문제',
    '2025-09-05 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM status 156 장애지원',
    '2025-11-15 06:57:39',
    '2025-11-15 07:59:39',
    107,
    'Failed',
    58,
    'Snapshot 오류 (VMware/Hyper-V)',
    '2025-11-15 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 장애지원',
    '2025-10-08 06:57:39',
    '2025-10-08 07:51:39',
    112,
    'Failed',
    13,
    '파일 I/O / Storage / Client 연결 오류',
    '2025-10-08 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Arch / VM 장애지원',
    '2025-12-04 06:57:39',
    '2025-12-04 07:13:39',
    63,
    'Failed',
    13,
    'Archive/File I/O 또는 Storage 오류',
    '2025-12-04 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'SAN 백업 실패 장애지원',
    '2025-09-12 06:57:39',
    '2025-09-12 08:08:39',
    17,
    'Failed',
    84,
    'Tape/Media/Storage 또는 Disk Pool 문제',
    '2025-09-12 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업 실패 장애처리',
    '2025-12-26 06:57:39',
    '2025-12-26 07:16:39',
    109,
    'Failed',
    84,
    'Storage 또는 Snapshot 실패',
    '2025-12-26 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'HCI 복구 장애 처리',
    '2026-01-08 06:57:39',
    '2026-01-08 08:03:39',
    104,
    'Failed',
    58,
    '접근 권한 / I/O / Storage 문제 가능',
    '2026-01-08 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'BCV FC 백업 실패',
    '2025-12-04 06:57:39',
    '2025-12-04 07:28:39',
    102,
    'Failed',
    84,
    'FC 경로 / Media / Storage 문제',
    '2025-12-04 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'File 서버 FC 백업 속도 이슈',
    '2025-12-21 06:57:39',
    '2025-12-21 07:40:39',
    34,
    'Failed',
    84,
    '성능 저하 / I/O 병목 / Storage 지연',
    '2025-12-21 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'File 서버 FC 백업 점검',
    '2025-10-10 06:57:39',
    '2025-10-10 07:26:39',
    27,
    'Failed',
    58,
    'Storage/경로/디바이스 성능 점검',
    '2025-10-10 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '주말간 백업 전체 실패',
    '2025-10-25 06:57:39',
    '2025-10-25 07:10:39',
    75,
    'Failed',
    58,
    '1: 부분 성공 / 정책·스크립트 영향
84: Storage/Media write 오류
96: Media 할당 실패',
    '2025-10-25 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'ERP / MSSQL / MariaDB 백업 실패',
    '2025-12-12 06:57:39',
    '2025-12-12 07:13:39',
    13,
    'Failed',
    58,
    '2: 요청 항목 백업 안됨
13: File read/write 오류
50: Client process aborted',
    '2025-12-12 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NAS 백업 장애',
    '2025-12-02 06:57:39',
    '2025-12-02 07:08:39',
    11,
    'Failed',
    13,
    'NAS 접근/권한/마운트 오류
Storage/Disk 문제',
    '2025-12-02 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '파일 백업 실패',
    '2025-11-05 06:57:39',
    '2025-11-05 08:03:39',
    16,
    'Failed',
    13,
    '13: File read/write 오류
58: Client 연결 실패',
    '2025-11-05 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Hyper-V 백업 장애',
    '2025-08-20 06:57:39',
    '2025-08-20 08:24:39',
    62,
    'Failed',
    58,
    'Snapshot/VSS 오류',
    '2025-08-20 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 미실행 / 누락',
    '2025-12-14 06:57:39',
    '2025-12-14 08:57:39',
    51,
    'Failed',
    58,
    '스케줄/Backup window 문제
195: Backup not attempted',
    '2025-12-14 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'bpbkar32 hang / 정지',
    '2025-11-28 06:57:39',
    '2025-11-28 07:51:39',
    91,
    'Failed',
    84,
    'I/O 오류 / 프로세스 정체 / 권한 문제 가능',
    '2025-11-28 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup Client 서비스 다운',
    '2025-11-07 06:57:39',
    '2025-11-07 07:08:39',
    20,
    'Failed',
    58,
    'Client connection failure / Cannot connect on socket',
    '2025-11-07 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '복제(Replication) 장애',
    '2025-10-08 06:57:39',
    '2025-10-08 08:32:39',
    49,
    'Failed',
    84,
    'Storage / Disk Pool / LSU 문제',
    '2025-10-08 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Storage Server down',
    '2025-10-17 06:57:39',
    '2025-10-17 08:46:39',
    60,
    'Failed',
    84,
    'Disk/OpenStorage/MSDP 문제',
    '2025-10-17 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VSR 백업 실패',
    '2025-10-01 06:57:39',
    '2025-10-01 07:35:39',
    103,
    'Failed',
    84,
    'Snapshot/Storage 영향',
    '2025-10-01 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업 장애',
    '2025-12-16 06:57:39',
    '2025-12-16 08:32:39',
    45,
    'Failed',
    84,
    'Storage 또는 Snapshot 오류',
    '2025-12-16 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 14 백업 중 실패',
    '2025-11-30 06:57:39',
    '2025-11-30 07:37:39',
    103,
    'Failed',
    14,
    'File list / path / access 문제',
    '2025-11-30 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 24 장애',
    '2025-10-15 06:57:39',
    '2025-10-15 07:47:39',
    107,
    'Failed',
    24,
    'Socket write failed (네트워크)',
    '2025-10-15 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 58 실패',
    '2026-02-10 06:57:39',
    '2026-02-10 07:18:39',
    110,
    'Failed',
    58,
    'Client connection failure',
    '2026-02-10 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 84 장애',
    '2026-01-09 06:57:39',
    '2026-01-09 07:20:39',
    41,
    'Failed',
    84,
    'Media write / Disk / Storage 오류',
    '2026-01-09 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 96 장애',
    '2025-11-12 06:57:39',
    '2025-11-12 07:58:39',
    29,
    'Failed',
    96,
    'Media 할당 실패',
    '2025-11-12 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 158 장애',
    '2026-02-16 06:57:39',
    '2026-02-16 07:24:39',
    110,
    'Failed',
    58,
    'Snapshot failure',
    '2026-02-16 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Unable to communicate with SDCSS IPS',
    '2026-01-12 06:57:39',
    '2026-01-12 08:28:39',
    10,
    'Failed',
    58,
    '네트워크 / 서비스 / 포트 문제',
    '2026-01-12 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'OPS / OpsCenter 장애',
    '2025-09-23 06:57:39',
    '2025-09-23 07:28:39',
    43,
    'Failed',
    13,
    '통신 / 서비스 / DB 연결 문제',
    '2025-09-23 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Elevate 모드 진입 불가',
    '2026-01-25 06:57:39',
    '2026-01-25 08:04:39',
    63,
    'Failed',
    58,
    '인증 / 권한 / 서비스 문제 가능',
    '2026-01-25 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 장애지원',
    '2025-11-12 06:57:39',
    '2025-11-12 07:52:39',
    59,
    'Failed',
    13,
    '파일 I/O / Storage / Client 연결 오류 대응',
    '2025-11-12 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'PTL 다운으로 인한 백업 실패',
    '2026-01-19 06:57:39',
    '2026-01-19 07:56:39',
    29,
    'Failed',
    84,
    'Tape/Media 서버 또는 PTL 장비 다운으로 인한 백업 실패',
    '2026-01-19 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Java 콘솔 접속 불가 / 장기간 백업 미실행',
    '2025-12-17 06:57:39',
    '2025-12-17 08:25:39',
    76,
    'Failed',
    58,
    '콘솔 접속 오류(통신/인증), Backup window/스케줄 문제 또는 Backup not attempted',
    '2025-12-17 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MongoDB failed to start',
    '2025-09-01 06:57:39',
    '2025-09-01 07:14:39',
    40,
    'Failed',
    58,
    'DB 서비스 기동 실패로 백업/연계 작업 영향',
    '2025-09-01 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '복제 실패 / Hardware 장애 확인',
    '2025-11-01 06:57:39',
    '2025-11-01 07:56:39',
    70,
    'Failed',
    84,
    'Storage/Disk Pool/LSU 또는 장비(HW) 이상 점검 및 조치',
    '2025-11-01 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '소산백업 Hang 걸림 현상',
    '2025-09-28 06:57:39',
    '2025-09-28 08:04:39',
    39,
    'Failed',
    84,
    'Storage I/O 지연, 프로세스 정체 또는 Client 중단 가능',
    '2025-09-28 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Duplicate 작업 백업 실패',
    '2025-10-03 06:57:39',
    '2025-10-03 07:14:39',
    24,
    'Failed',
    84,
    'Media write 오류 또는 Media 할당 실패',
    '2025-10-03 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '넷백업 장애지원',
    '2025-11-10 06:57:39',
    '2025-11-10 07:53:39',
    80,
    'Failed',
    13,
    '일반 백업 오류 (I/O, 통신, Client 연결, Storage 등)',
    '2025-11-10 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NBU 5250 WMC / IPMI WEBUI 장애',
    '2025-10-04 06:57:39',
    '2025-10-04 08:17:39',
    52,
    'Failed',
    58,
    '관리 콘솔/WMC 또는 IPMI 접속 불가, 통신/서비스 점검 및 조치',
    '2025-10-04 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '디스크 교체 / 정책 정리 / 정책 최신화',
    '2025-10-29 06:57:39',
    '2025-10-29 08:14:39',
    107,
    'Failed',
    58,
    'HW 교체 후 정책 재정비 및 백업 구성 최신화',
    '2025-10-29 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업 장애지원',
    '2026-01-09 06:57:39',
    '2026-01-09 07:20:39',
    120,
    'Failed',
    84,
    'Storage write 오류 또는 Snapshot 실패 대응',
    '2026-01-09 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup VMware 장애지원',
    '2025-08-28 06:57:39',
    '2025-08-28 07:27:39',
    46,
    'Failed',
    58,
    'VMware Snapshot/VADP 오류 대응',
    '2025-08-28 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup 케이스 진행',
    '2025-10-21 06:57:39',
    '2025-10-21 08:10:39',
    23,
    'Failed',
    58,
    '일반 장애 분석 및 벤더 케이스 대응',
    '2025-10-21 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Email Notification / MSDP / Universal Share 버그',
    '2026-01-17 06:57:39',
    '2026-01-17 07:53:39',
    41,
    'Failed',
    13,
    '알림 미동작, MSDP/Share 버그, Storage 또는 Client 중단 영향',
    '2026-01-17 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Universal Share 백업 Status 50',
    '2025-11-27 06:57:39',
    '2025-11-27 07:11:39',
    111,
    'Failed',
    50,
    'Client process aborted / Share 접근 또는 프로세스 중단',
    '2025-11-27 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Universal → Standard Share 구성 변경',
    '2026-02-05 06:57:39',
    '2026-02-05 07:20:39',
    98,
    'Failed',
    58,
    '버그/호환성 이슈 회피를 위한 구성 변경',
    '2026-02-05 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSDP 이미지 깨짐',
    '2025-10-06 06:57:39',
    '2025-10-06 08:05:39',
    60,
    'Failed',
    84,
    'MSDP/Disk Pool/Storage 오류, 이미지 무결성 문제',
    '2025-10-06 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Email Notification 미동작',
    '2026-02-14 06:57:39',
    '2026-02-14 08:33:39',
    17,
    'Failed',
    58,
    'SMTP/스크립트/권한/설정 점검',
    '2026-02-14 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Email Notification / TMOUT / MSDP 이미지 깨짐',
    '2025-11-01 06:57:39',
    '2025-11-01 08:32:39',
    75,
    'Failed',
    13,
    '세션 종료/TMOUT 영향, 알림 및 Storage 오류 점검',
    '2025-11-01 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 장애지원',
    '2025-11-09 06:57:39',
    '2025-11-09 07:16:39',
    70,
    'Failed',
    13,
    '파일 I/O / Storage / Client 연결 오류 대응',
    '2025-11-09 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 시 Oracle 서비스 끊김',
    '2025-09-07 06:57:39',
    '2025-09-07 07:07:39',
    35,
    'Failed',
    58,
    '백업 부하 / Snapshot / I/O 경합으로 DB 서비스 영향 분석',
    '2025-09-07 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle 장애지원',
    '2026-01-09 06:57:39',
    '2026-01-09 07:28:39',
    94,
    'Failed',
    58,
    'DB 상태 / 권한 / 파일 접근 오류 대응',
    '2026-01-09 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle 장애 처리',
    '2025-11-02 06:57:39',
    '2025-11-02 07:58:39',
    86,
    'Failed',
    58,
    'DB 및 백업 연계 장애 분석/조치',
    '2025-11-02 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Disk Oracle Backup Status 84',
    '2025-12-27 06:57:39',
    '2025-12-27 07:57:39',
    108,
    'Failed',
    84,
    'Media write / Disk / Storage 오류',
    '2025-12-27 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle 백업 장애지원',
    '2026-02-03 06:57:39',
    '2026-02-03 07:28:39',
    74,
    'Failed',
    58,
    'DB 백업 실패 (요청 항목 백업 안됨 / I/O / Storage 오류)',
    '2026-02-03 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle Status 2106 실패',
    '2025-09-27 06:57:39',
    '2025-09-27 08:50:39',
    39,
    'Failed',
    58,
    'Oracle 정책/스크립트/환경 설정 오류',
    '2025-09-27 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup 장애지원',
    '2025-11-10 06:57:39',
    '2025-11-10 07:22:39',
    46,
    'Failed',
    13,
    '일반 장애 대응 (I/O / 통신 / Client / Storage)',
    '2025-11-10 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DB 백업 상태 모니터링',
    '2025-12-27 06:57:39',
    '2025-12-27 08:13:39',
    11,
    'Failed',
    58,
    '백업 성공 여부 및 성능/상태 점검',
    '2025-12-27 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DB 백업 장애지원',
    '2025-10-27 06:57:39',
    '2025-10-27 07:15:39',
    14,
    'Failed',
    58,
    'DB 백업 실패 / I/O / Storage 오류 대응',
    '2025-10-27 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'SQL 백업 장애지원',
    '2025-11-08 06:57:39',
    '2025-11-08 08:47:39',
    15,
    'Failed',
    58,
    'MSSQL/DB 백업 실패 대응',
    '2025-11-08 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '마스터/미디어 서버 인증 장애',
    '2025-10-09 06:57:39',
    '2025-10-09 08:49:39',
    118,
    'Failed',
    58,
    '인증 실패 / Socket 통신 오류 / Client 연결 실패',
    '2025-10-09 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup 장애지원',
    '2025-12-08 06:57:39',
    '2025-12-08 07:41:39',
    10,
    'Failed',
    13,
    '일반 장애 대응 (I/O / 통신 / Client / Storage)',
    '2025-12-08 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 상태 모니터링 (Flex 5150 NDB 서비스 다운)',
    '2025-10-17 06:57:39',
    '2025-10-17 08:39:39',
    106,
    'Failed',
    58,
    'NDB 서비스 다운으로 인한 백업 영향 / 서비스 상태 점검',
    '2025-10-17 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 상태 모니터링',
    '2025-11-04 06:57:39',
    '2025-11-04 08:10:39',
    23,
    'Failed',
    58,
    '백업 성공 여부 및 성능/상태 점검',
    '2025-11-04 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle 아카이브 삭제 구문 미적용',
    '2026-02-07 06:57:39',
    '2026-02-07 08:56:39',
    88,
    'Failed',
    58,
    '아카이브 로그 관리/스크립트 미적용으로 인한 공간/백업 영향',
    '2026-02-07 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Client 메모리 과다 사용 → 버전 다운그레이드',
    '2025-11-24 06:57:39',
    '2025-11-24 07:09:39',
    112,
    'Failed',
    58,
    'Client 자원 사용률 이슈로 인한 안정화 조치',
    '2025-11-24 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 스냅샷 시 중지 안됨으로 백업 실패',
    '2025-09-17 06:57:39',
    '2025-09-17 07:24:39',
    70,
    'Failed',
    58,
    '스냅샷 생성 시 VM Freeze 미동작, 엔지니어 조치 후 정상 백업 확인(4대)',
    '2025-09-17 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSDP Hang 현상',
    '2026-02-03 06:57:39',
    '2026-02-03 08:53:39',
    22,
    'Failed',
    84,
    'MSDP 처리 정체로 백업/복제 지연',
    '2026-02-03 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Instance fault 장애',
    '2025-12-20 06:57:39',
    '2025-12-20 08:25:39',
    111,
    'Failed',
    13,
    '백업 인스턴스 오류 또는 Storage 영향',
    '2025-12-20 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM SAN LUN 재매핑 / 일부 SAN 미인식',
    '2025-10-26 06:57:39',
    '2025-10-26 08:37:39',
    21,
    'Failed',
    84,
    'SAN 경로/매핑 문제로 디스크 접근 실패',
    '2025-10-26 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '대용량 파일서버 VM 복구 중 중단',
    '2025-11-23 06:57:39',
    '2025-11-23 08:37:39',
    18,
    'Failed',
    84,
    '대용량(15TB) 복구 중 I/O 또는 네트워크 병목',
    '2025-11-23 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DR 추가 VM 복구 지원',
    '2025-12-06 06:57:39',
    '2025-12-06 07:17:39',
    30,
    'Failed',
    58,
    '재해복구 환경 VM 복구 지원',
    '2025-12-06 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '파일서버 VM 장기 복구 속도 이슈',
    '2025-11-28 06:57:39',
    '2025-11-28 07:45:39',
    54,
    'Failed',
    84,
    '복구 성능 저하로 장시간 소요',
    '2025-11-28 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '하드웨어 알람 / 복제 누적 대기',
    '2026-02-12 06:57:39',
    '2026-02-12 07:22:39',
    74,
    'Failed',
    84,
    'HW 알람 발생 및 복제 작업 적체',
    '2026-02-12 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 장애 및 DR 복구 훈련',
    '2025-10-22 06:57:39',
    '2025-10-22 08:28:39',
    73,
    'Failed',
    58,
    '스냅샷 문제 대응 및 DR 복구 훈련 수행',
    '2025-10-22 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSSQL 백업 실패 및 DR 미팅',
    '2026-01-20 06:57:39',
    '2026-01-20 08:04:39',
    47,
    'Failed',
    58,
    'DB 백업 실패 분석 및 재해복구 협의',
    '2026-01-20 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 케이스 진행 / 로그 수집',
    '2025-11-12 06:57:39',
    '2025-11-12 08:19:39',
    40,
    'Failed',
    58,
    '벤더 케이스용 로그 수집',
    '2025-11-12 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업/복구 이슈',
    '2025-11-16 06:57:39',
    '2025-11-16 08:19:39',
    41,
    'Failed',
    84,
    '백업 또는 복구 중 Storage/Snapshot 오류',
    '2025-11-16 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSSQL 로그백업 일부 누락',
    '2026-02-10 06:57:39',
    '2026-02-10 08:29:39',
    11,
    'Failed',
    58,
    '로그 백업 스케줄/정책 누락 확인',
    '2026-02-10 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Flex SMB mount failed + MSSQL Log 장애',
    '2025-10-27 06:57:39',
    '2025-10-27 08:29:39',
    10,
    'Failed',
    84,
    'SMB 마운트 실패 및 로그 백업 간헐적 실패',
    '2025-10-27 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSSQL Log 간헐 실패 케이스',
    '2025-12-21 06:57:39',
    '2025-12-21 07:51:39',
    34,
    'Failed',
    58,
    '일부 DB 로그 백업 실패 원인 분석',
    '2025-12-21 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '서비스 다운 후 전체 백업 모니터링',
    '2025-12-16 06:57:39',
    '2025-12-16 08:49:39',
    64,
    'Failed',
    58,
    '서비스 복구 후 백업 상태 점검 및 보고',
    '2025-12-16 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'SAN 백업 장애',
    '2025-09-26 06:57:39',
    '2025-09-26 08:15:39',
    21,
    'Failed',
    84,
    'SAN/스토리지/클라이언트 연계 장애',
    '2025-09-26 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup 장애지원',
    '2025-10-28 06:57:39',
    '2025-10-28 07:36:39',
    104,
    'Failed',
    13,
    '일반 백업 장애 대응',
    '2025-10-28 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Flex 5150 NDB 서비스 다운',
    '2025-10-10 06:57:39',
    '2025-10-10 07:56:39',
    94,
    'Failed',
    58,
    'NDB 서비스 다운으로 백업 영향',
    '2025-10-10 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '라이선스 재등록 장애지원',
    '2025-12-02 06:57:39',
    '2025-12-02 08:37:39',
    58,
    'Failed',
    58,
    '타 고객 라이선스 만료로 인증 재등록',
    '2025-12-02 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle 아카이브 삭제 미적용',
    '2025-09-02 06:57:39',
    '2025-09-02 08:17:39',
    112,
    'Failed',
    58,
    '아카이브 로그 관리 미적용 문제',
    '2025-09-02 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'BCV 백업 이슈',
    '2025-12-13 06:57:39',
    '2025-12-13 07:37:39',
    27,
    'Failed',
    84,
    'BCV/FC 백업 경로 문제',
    '2025-12-13 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Client 메모리 과다 사용',
    '2025-11-15 06:57:39',
    '2025-11-15 08:41:39',
    10,
    'Failed',
    58,
    '메모리 이슈로 안정성 확보 위해 버전 다운그레이드',
    '2025-11-15 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup 정기점검 및 장애지원',
    '2025-12-05 06:57:39',
    '2025-12-05 07:11:39',
    86,
    'Failed',
    58,
    '정기 점검 및 잠재 장애 조치',
    '2025-12-05 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '스냅샷 생성 시 VM 중지 실패 (4대)',
    '2026-01-08 06:57:39',
    '2026-01-08 07:58:39',
    80,
    'Failed',
    58,
    'Snapshot/VSS 오류로 백업 실패 → VM 엔지니어 조치 후 정상 수행 확인',
    '2026-01-08 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSDP Hang 걸림',
    '2025-12-28 06:57:39',
    '2025-12-28 08:23:39',
    99,
    'Failed',
    84,
    'MSDP/Disk Pool/Storage 지연 또는 서비스 정체',
    '2025-12-28 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Instance Fault 장애',
    '2025-09-29 06:57:39',
    '2025-09-29 07:44:39',
    84,
    'Failed',
    13,
    '프로세스/서비스 또는 Storage 영향 가능',
    '2025-09-29 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM SAN LUN 재맵핑 / 일부 SAN 불가',
    '2026-02-15 06:57:39',
    '2026-02-15 08:36:39',
    14,
    'Failed',
    58,
    'FC/SAN 경로 또는 매핑 문제 점검',
    '2026-02-15 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '대용량 파일서버 VM 복구 중 끊김 (15TB)',
    '2025-10-08 06:57:39',
    '2025-10-08 07:44:39',
    33,
    'Failed',
    84,
    'Storage I/O 또는 통신 오류로 복구 중단',
    '2025-10-08 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DR 추가 VM 복구지원',
    '2026-01-01 06:57:39',
    '2026-01-01 07:19:39',
    67,
    'Failed',
    58,
    'DR 시나리오 기반 VM 복구 수행',
    '2026-01-01 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 복구 장기 지연 / 속도 이슈',
    '2025-12-16 06:57:39',
    '2025-12-16 07:45:39',
    42,
    'Failed',
    58,
    '성능 저하 / I/O 병목 / Storage 지연 분석',
    '2025-12-16 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '복제 작업 누적 대기',
    '2025-08-25 06:57:39',
    '2025-08-25 07:31:39',
    100,
    'Failed',
    58,
    'Storage/LSU/Disk Pool 성능 또는 경로 문제',
    '2025-08-25 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 장애 + DR 전체 복구 훈련',
    '2025-11-25 06:57:39',
    '2025-11-25 08:17:39',
    104,
    'Failed',
    58,
    'Snapshot 실패 대응 및 DR 복구 테스트',
    '2025-11-25 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSSQL 백업 실패',
    '2025-10-18 06:57:39',
    '2025-10-18 07:55:39',
    96,
    'Failed',
    58,
    'DB 백업 실패 / I/O / Client 중단',
    '2025-10-18 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 케이스 진행 / 로그 수집',
    '2025-10-17 06:57:39',
    '2025-10-17 08:03:39',
    104,
    'Failed',
    58,
    '장애 분석 및 벤더 케이스 대응',
    '2025-10-17 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업/복구 이슈',
    '2025-09-13 06:57:39',
    '2025-09-13 08:45:39',
    72,
    'Failed',
    84,
    'Storage 또는 Snapshot 영향',
    '2025-09-13 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSSQL 로그백업 누락',
    '2025-11-08 06:57:39',
    '2025-11-08 07:07:39',
    61,
    'Failed',
    58,
    '스케줄/Backup window 누락 가능',
    '2025-11-08 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Flex SMB mount failed',
    '2025-10-11 06:57:39',
    '2025-10-11 07:12:39',
    67,
    'Failed',
    13,
    'SMB/NFS Share 마운트/접근 오류',
    '2025-10-11 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSSQL Log 백업 불규칙 실패',
    '2025-12-02 06:57:39',
    '2025-12-02 08:47:39',
    48,
    'Failed',
    58,
    'DB 상태/트랜잭션/정책 영향 분석',
    '2025-12-02 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '서비스 다운 후 백업 모니터링',
    '2025-12-19 06:57:39',
    '2025-12-19 08:10:39',
    18,
    'Failed',
    58,
    '장애 이후 전체 백업 상태 점검',
    '2025-12-19 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'SAN 백업 장애',
    '2025-12-12 06:57:39',
    '2025-12-12 07:22:39',
    106,
    'Failed',
    84,
    'SAN/FC/Media/Storage 문제',
    '2025-12-12 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup 장애지원',
    '2025-12-17 06:57:39',
    '2025-12-17 07:24:39',
    21,
    'Failed',
    13,
    '일반 장애 대응',
    '2025-12-17 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Flex 5150 NDB 서비스 다운 모니터링',
    '2025-09-27 06:57:39',
    '2025-09-27 07:15:39',
    16,
    'Failed',
    58,
    'NDB 서비스 상태 점검',
    '2025-09-27 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '라이선스 재등록',
    '2025-11-06 06:57:39',
    '2025-11-06 08:49:39',
    38,
    'Failed',
    58,
    '타 고객 라이선스 만료 대응 / 재등록 수행',
    '2025-11-06 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle 아카이브 삭제 구문 미적용',
    '2025-09-03 06:57:39',
    '2025-09-03 07:35:39',
    99,
    'Failed',
    58,
    '아카이브 로그 관리 미적용 영향',
    '2025-09-03 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업 장애지원',
    '2026-01-13 06:57:39',
    '2026-01-13 08:54:39',
    84,
    'Failed',
    84,
    'Storage/Snapshot 오류 대응',
    '2026-01-13 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'BCV 백업 이슈',
    '2026-01-26 06:57:39',
    '2026-01-26 08:09:39',
    78,
    'Failed',
    58,
    'BCV/Storage/경로 문제 점검',
    '2026-01-26 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Client 메모리 과다 사용 → 다운그레이드',
    '2025-11-03 06:57:39',
    '2025-11-03 07:35:39',
    15,
    'Failed',
    58,
    '자원 사용률 안정화 조치',
    '2025-11-03 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup 정기점검 및 장애지원',
    '2025-10-05 06:57:39',
    '2025-10-05 08:43:39',
    55,
    'Failed',
    58,
    '정기 점검 및 예방 점검 수행',
    '2025-10-05 06:57:39'
FROM customers c
WHERE c.company_name = '서울우유본사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 14 백업 중 실패',
    '2025-09-19 06:57:39',
    '2025-09-19 07:36:39',
    74,
    'Failed',
    14,
    'File list / path / access 문제',
    '2025-09-19 06:57:39'
FROM customers c
WHERE c.company_name = '세중'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 24 장애',
    '2025-11-03 06:57:39',
    '2025-11-03 08:34:39',
    98,
    'Failed',
    24,
    'Socket write failed (네트워크)',
    '2025-11-03 06:57:39'
FROM customers c
WHERE c.company_name = '세중'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 58 실패',
    '2026-01-28 06:57:39',
    '2026-01-28 07:48:39',
    79,
    'Failed',
    58,
    'Client connection failure',
    '2026-01-28 06:57:39'
FROM customers c
WHERE c.company_name = '세중'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 84 장애',
    '2025-11-28 06:57:39',
    '2025-11-28 08:11:39',
    23,
    'Failed',
    84,
    'Media write / Disk / Storage 오류',
    '2025-11-28 06:57:39'
FROM customers c
WHERE c.company_name = '세중'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 96 장애',
    '2025-10-24 06:57:39',
    '2025-10-24 07:14:39',
    118,
    'Failed',
    96,
    'Media 할당 실패',
    '2025-10-24 06:57:39'
FROM customers c
WHERE c.company_name = '세중'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업실패 장애지원',
    '2025-10-24 06:57:39',
    '2025-10-24 07:55:39',
    24,
    'Failed',
    84,
    '',
    '2025-10-24 06:57:39'
FROM customers c
WHERE c.company_name = '수원대학교'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSSQL Status 2 장애지원',
    '2025-11-30 06:57:39',
    '2025-11-30 07:25:39',
    40,
    'Failed',
    58,
    '',
    '2025-11-30 06:57:39'
FROM customers c
WHERE c.company_name = '수원대학교'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DR 소산 백업 재 구성, HyperV 장애지원',
    '2025-12-11 06:57:39',
    '2025-12-11 08:13:39',
    52,
    'Failed',
    58,
    '',
    '2025-12-11 06:57:39'
FROM customers c
WHERE c.company_name = '수원대학교'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'PTL 장비 교체 재설정, HyperV 백업 미실행 장애지원',
    '2025-12-29 06:57:39',
    '2025-12-29 08:30:39',
    85,
    'Failed',
    84,
    '',
    '2025-12-29 06:57:39'
FROM customers c
WHERE c.company_name = '수원대학교'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 장애지원',
    '2025-11-17 06:57:39',
    '2025-11-17 08:16:39',
    22,
    'Failed',
    84,
    '',
    '2025-11-17 06:57:39'
FROM customers c
WHERE c.company_name = '수원대학교'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '소산백업 누락본 확인 및 수동 실행',
    '2026-02-14 06:57:39',
    '2026-02-14 07:09:39',
    108,
    'Failed',
    58,
    '',
    '2026-02-14 06:57:39'
FROM customers c
WHERE c.company_name = '수원대학교'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '소산백업 장애지원',
    '2025-09-21 06:57:39',
    '2025-09-21 07:42:39',
    83,
    'Failed',
    84,
    '',
    '2025-09-21 06:57:39'
FROM customers c
WHERE c.company_name = '수원대학교'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '[수원대학교] 백업 장애지원',
    '2025-11-04 06:57:39',
    '2025-11-04 08:17:39',
    66,
    'Failed',
    13,
    '',
    '2025-11-04 06:57:39'
FROM customers c
WHERE c.company_name = '수원대학교'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 상태 점검 및 VM Status 84 장애지원',
    '2025-09-10 06:57:39',
    '2025-09-10 08:49:39',
    60,
    'Failed',
    84,
    '',
    '2025-09-10 06:57:39'
FROM customers c
WHERE c.company_name = '수원대학교'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM Status 158 장애지원',
    '2025-10-16 06:57:39',
    '2025-10-16 07:24:39',
    37,
    'Failed',
    58,
    '',
    '2025-10-16 06:57:39'
FROM customers c
WHERE c.company_name = '수원대학교'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 장애지원',
    '2025-10-18 06:57:39',
    '2025-10-18 07:39:39',
    92,
    'Failed',
    13,
    '일반 백업 오류 대응 (I/O / Storage / Client 연결)',
    '2025-10-18 06:57:39'
FROM customers c
WHERE c.company_name = '안락'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'bpend_notify 미실행',
    '2025-12-31 06:57:39',
    '2025-12-31 07:41:39',
    91,
    'Failed',
    58,
    'Notify 스크립트 미동작 / 권한 / 경로 / 설정 점검',
    '2025-12-31 06:57:39'
FROM customers c
WHERE c.company_name = '안락'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '정책 bpend_notify 미실행',
    '2025-12-10 06:57:39',
    '2025-12-10 07:08:39',
    39,
    'Failed',
    58,
    '정책 설정 / 스크립트 / 권한 문제 분석',
    '2025-12-10 06:57:39'
FROM customers c
WHERE c.company_name = '안락'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Restore 서버 장애지원',
    '2025-11-13 06:57:39',
    '2025-11-13 08:24:39',
    13,
    'Failed',
    58,
    '접근 권한 / 파일 I/O / 서비스 영향',
    '2025-11-13 06:57:39'
FROM customers c
WHERE c.company_name = '안락'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'SQL 서버 클러스터 VIP 변경',
    '2025-12-04 06:57:39',
    '2025-12-04 07:53:39',
    80,
    'Failed',
    58,
    'VIP 기반 구성 변경 및 백업 영향 점검',
    '2025-12-04 06:57:39'
FROM customers c
WHERE c.company_name = '안락'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '자동복구 스크립트 장애지원',
    '2025-12-09 06:57:39',
    '2025-12-09 07:32:39',
    27,
    'Failed',
    58,
    '스크립트 오류 / 권한 / 실행 조건 점검',
    '2025-12-09 06:57:39'
FROM customers c
WHERE c.company_name = '안락'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSDP 용량 부족',
    '2026-01-08 06:57:39',
    '2026-01-08 08:45:39',
    109,
    'Failed',
    84,
    'Disk Pool/Storage 용량 부족 → Resize 조치',
    '2026-01-08 06:57:39'
FROM customers c
WHERE c.company_name = '안락'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '정기점검',
    '2025-12-08 06:57:39',
    '2025-12-08 07:26:39',
    22,
    'Failed',
    58,
    '정기 점검 및 예방 점검 수행',
    '2025-12-08 06:57:39'
FROM customers c
WHERE c.company_name = '안락'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Flex 하드웨어 장애',
    '2025-12-19 06:57:39',
    '2025-12-19 08:38:39',
    17,
    'Failed',
    58,
    'Appliance HW 알람 / 성능 / 서비스 영향 점검',
    '2025-12-19 06:57:39'
FROM customers c
WHERE c.company_name = '안락'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Flex HW 장애 → Cold Reboot / 패스워드 변경',
    '2025-12-30 06:57:39',
    '2025-12-30 07:41:39',
    84,
    'Failed',
    58,
    '서비스 복구 및 보안 정책 반영',
    '2025-12-30 06:57:39'
FROM customers c
WHERE c.company_name = '안락'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '하드웨어 장애 케이스 진행',
    '2025-10-07 06:57:39',
    '2025-10-07 07:26:39',
    106,
    'Failed',
    58,
    '장비 HW 이상 분석 및 조치',
    '2025-10-07 06:57:39'
FROM customers c
WHERE c.company_name = '안락'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '하드웨어 장애 케이스 오픈 / 로그수집',
    '2025-09-28 06:57:39',
    '2025-09-28 08:55:39',
    70,
    'Failed',
    58,
    '벤더 케이스 대응 / 로그 분석',
    '2025-09-28 06:57:39'
FROM customers c
WHERE c.company_name = '안락'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업실패 장애지원',
    '2025-09-14 06:57:39',
    '2025-09-14 07:19:39',
    40,
    'Failed',
    84,
    '',
    '2025-09-14 06:57:39'
FROM customers c
WHERE c.company_name = '지씨씨엘(GCCL)'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSSQL Status 2 장애지원',
    '2025-10-27 06:57:39',
    '2025-10-27 08:33:39',
    89,
    'Failed',
    58,
    '',
    '2025-10-27 06:57:39'
FROM customers c
WHERE c.company_name = '지씨씨엘(GCCL)'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DR 소산 백업 재 구성, HyperV 장애지원',
    '2025-11-12 06:57:39',
    '2025-11-12 07:36:39',
    116,
    'Failed',
    58,
    '',
    '2025-11-12 06:57:39'
FROM customers c
WHERE c.company_name = '지씨씨엘(GCCL)'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'PTL 장비 교체 재설정, HyperV 백업 미실행 장애지원',
    '2025-11-21 06:57:39',
    '2025-11-21 07:56:39',
    79,
    'Failed',
    84,
    '',
    '2025-11-21 06:57:39'
FROM customers c
WHERE c.company_name = '지씨씨엘(GCCL)'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 장애지원',
    '2025-12-16 06:57:39',
    '2025-12-16 07:32:39',
    23,
    'Failed',
    84,
    '',
    '2025-12-16 06:57:39'
FROM customers c
WHERE c.company_name = '지씨씨엘(GCCL)'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '소산백업 누락본 확인 및 수동 실행',
    '2025-11-28 06:57:39',
    '2025-11-28 07:11:39',
    108,
    'Failed',
    58,
    '',
    '2025-11-28 06:57:39'
FROM customers c
WHERE c.company_name = '지씨씨엘(GCCL)'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '소산백업 장애지원',
    '2026-02-15 06:57:39',
    '2026-02-15 07:27:39',
    64,
    'Failed',
    84,
    '',
    '2026-02-15 06:57:39'
FROM customers c
WHERE c.company_name = '지씨씨엘(GCCL)'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '[수원대학교] 백업 장애지원',
    '2025-09-16 06:57:39',
    '2025-09-16 07:14:39',
    65,
    'Failed',
    13,
    '',
    '2025-09-16 06:57:39'
FROM customers c
WHERE c.company_name = '지씨씨엘(GCCL)'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 상태 점검 및 VM Status 84 장애지원',
    '2026-01-25 06:57:39',
    '2026-01-25 08:56:39',
    89,
    'Failed',
    84,
    '',
    '2026-01-25 06:57:39'
FROM customers c
WHERE c.company_name = '지씨씨엘(GCCL)'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM Status 158 장애지원',
    '2025-11-06 06:57:39',
    '2025-11-06 07:28:39',
    54,
    'Failed',
    58,
    '',
    '2025-11-06 06:57:39'
FROM customers c
WHERE c.company_name = '지씨씨엘(GCCL)'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VSR 백업 실패 장애지원',
    '2025-09-13 06:57:39',
    '2025-09-13 08:46:39',
    24,
    'Failed',
    84,
    'Storage/Snapshot 영향 또는 Client process aborted',
    '2025-09-13 06:57:39'
FROM customers c
WHERE c.company_name = '칙고쿠삼화페인트'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '장애지원',
    '2025-08-31 06:57:39',
    '2025-08-31 07:19:39',
    87,
    'Failed',
    58,
    '일반 장애 분석 및 조치',
    '2025-08-31 06:57:39'
FROM customers c
WHERE c.company_name = '칙고쿠삼화페인트'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DB 스크립트 수정 / VSR 설치 중 Error',
    '2026-01-06 06:57:39',
    '2026-01-06 07:59:39',
    86,
    'Failed',
    58,
    '스크립트 오류 또는 설치/환경 설정 문제 처리',
    '2026-01-06 06:57:39'
FROM customers c
WHERE c.company_name = '칙고쿠삼화페인트'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Begin-End 스크립트 bpend_notify 미작동',
    '2025-09-28 06:57:39',
    '2025-09-28 08:05:39',
    69,
    'Failed',
    58,
    'Notify 스크립트 미동작 / 권한 / 경로 점검',
    '2025-09-28 06:57:39'
FROM customers c
WHERE c.company_name = '칙고쿠삼화페인트'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '주말 백업 모니터링 / VSR 추가 설치',
    '2025-12-18 06:57:39',
    '2025-12-18 08:03:39',
    114,
    'Failed',
    58,
    '백업 상태 점검 및 VSR 구성 반영',
    '2025-12-18 06:57:39'
FROM customers c
WHERE c.company_name = '칙고쿠삼화페인트'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '데이터 / OS 백업 상태 모니터링',
    '2026-02-03 06:57:39',
    '2026-02-03 08:31:39',
    17,
    'Failed',
    58,
    '백업 성공 여부 및 성능/상태 점검',
    '2026-02-03 06:57:39'
FROM customers c
WHERE c.company_name = '칙고쿠삼화페인트'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle 서버 OS 긴급 복구',
    '2025-10-16 06:57:39',
    '2025-10-16 07:30:39',
    14,
    'Failed',
    58,
    '접근 권한 / Storage 또는 복구 경로 문제 가능',
    '2025-10-16 06:57:39'
FROM customers c
WHERE c.company_name = '칙고쿠삼화페인트'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MongoDB failed to start 장애지원',
    '2026-02-02 06:57:39',
    '2026-02-02 07:59:39',
    77,
    'Failed',
    58,
    'DB 서비스 기동 실패로 백업/연계 영향',
    '2026-02-02 06:57:39'
FROM customers c
WHERE c.company_name = '칙고쿠삼화페인트'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '조세시스템 Appliance HW 에러',
    '2025-12-22 06:57:39',
    '2025-12-22 07:41:39',
    67,
    'Failed',
    58,
    '하드웨어 에러 확인 및 상태 점검',
    '2025-12-22 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DMZ 구간 VM 백업 이슈',
    '2025-12-29 06:57:39',
    '2025-12-29 08:47:39',
    74,
    'Failed',
    58,
    'DMZ 환경 백업 테스트 / 케이스 진행 / 구성 검증',
    '2025-12-29 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DMZ VM 백업 tcpdump 분석',
    '2025-10-07 06:57:39',
    '2025-10-07 07:22:39',
    81,
    'Failed',
    24,
    '네트워크 통신/패킷 분석',
    '2025-10-07 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'DMZ VMware 백업 구성 이슈',
    '2026-02-02 06:57:39',
    '2026-02-02 07:41:39',
    52,
    'Failed',
    13,
    '접근/통신/구성 문제 테스트',
    '2026-02-02 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'nbmbak1 DMZ VMware 백업 이슈',
    '2025-11-16 06:57:39',
    '2025-11-16 08:36:39',
    69,
    'Failed',
    58,
    'Storage/통신/정책 영향 분석',
    '2025-11-16 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'PTL 드라이브 주기적 다운',
    '2026-02-11 06:57:39',
    '2026-02-11 08:25:39',
    75,
    'Failed',
    84,
    'Tape/Drive/Media 서버 점검 및 원인 분석',
    '2026-02-11 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '솔라리스 클라이언트 테스트',
    '2025-09-08 06:57:39',
    '2025-09-08 08:21:39',
    84,
    'Failed',
    58,
    '클라이언트 설치 유무 검증 / 프로젝트 지원',
    '2025-09-08 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle / Vault 백업 장애',
    '2026-01-13 06:57:39',
    '2026-01-13 08:46:39',
    115,
    'Failed',
    13,
    '아카이브/Storage/I/O 오류 대응',
    '2026-01-13 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Arch Status 13 / arch_del 미수행',
    '2025-08-30 06:57:39',
    '2025-08-30 07:42:39',
    89,
    'Failed',
    13,
    '파일 접근/아카이브 삭제 스크립트 오류',
    '2025-08-30 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'intbak Job Hang / PTL 다운',
    '2026-01-13 06:57:39',
    '2026-01-13 08:32:39',
    109,
    'Failed',
    58,
    'Job hang 및 Tape Drive 상태 점검',
    '2026-01-13 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Appliance 디스크 교체',
    '2025-09-01 06:57:39',
    '2025-09-01 08:12:39',
    16,
    'Failed',
    58,
    '디스크 교체 및 점검 보고',
    '2025-09-01 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'PTL 드라이브 재인식',
    '2025-11-14 06:57:39',
    '2025-11-14 08:47:39',
    57,
    'Failed',
    58,
    'Media 서버 / Drive 재스캔 조치',
    '2025-11-14 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Oracle 아카이브 스크립트 실패',
    '2026-01-06 06:57:39',
    '2026-01-06 08:54:39',
    45,
    'Failed',
    58,
    '스크립트/환경 설정 오류 처리',
    '2026-01-06 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'PTL Drive Down 장애처리',
    '2025-09-14 06:57:39',
    '2025-09-14 07:54:39',
    58,
    'Failed',
    84,
    'Drive/Media/경로 점검',
    '2025-09-14 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 장애지원',
    '2025-10-15 06:57:39',
    '2025-10-15 08:45:39',
    57,
    'Failed',
    13,
    '일반 백업 오류 대응',
    '2025-10-15 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup 정기점검',
    '2025-11-19 06:57:39',
    '2025-11-19 07:17:39',
    56,
    'Failed',
    58,
    '정기 점검 수행',
    '2025-11-19 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup Client 설치 / 정책 구성',
    '2026-01-09 06:57:39',
    '2026-01-09 07:47:39',
    109,
    'Failed',
    58,
    '클라이언트 설치 및 정책 설정',
    '2026-01-09 06:57:39'
FROM customers c
WHERE c.company_name = '한국자산관리공사'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '주말간 백업 전체 실패',
    '2025-10-17 06:57:39',
    '2025-10-17 08:09:39',
    71,
    'Failed',
    58,
    '1: 부분 성공 / 정책·스크립트 영향
84: Storage/Media write 오류
96: Media 할당 실패',
    '2025-10-17 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'ERP / MSSQL / MariaDB 백업 실패',
    '2025-10-22 06:57:39',
    '2025-10-22 07:23:39',
    27,
    'Failed',
    58,
    '2: 요청 항목 백업 안됨
13: File read/write 오류
50: Client process aborted',
    '2025-10-22 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NAS 백업 장애',
    '2025-12-29 06:57:39',
    '2025-12-29 08:17:39',
    18,
    'Failed',
    13,
    'NAS 접근/권한/마운트 오류
Storage/Disk 문제',
    '2025-12-29 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '파일 백업 실패',
    '2026-01-03 06:57:39',
    '2026-01-03 07:29:39',
    105,
    'Failed',
    13,
    '13: File read/write 오류
58: Client 연결 실패',
    '2026-01-03 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Hyper-V 백업 장애',
    '2025-09-25 06:57:39',
    '2025-09-25 08:03:39',
    82,
    'Failed',
    58,
    'Snapshot/VSS 오류',
    '2025-09-25 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '백업 미실행 / 누락',
    '2025-09-06 06:57:39',
    '2025-09-06 07:15:39',
    95,
    'Failed',
    58,
    '스케줄/Backup window 문제
195: Backup not attempted',
    '2025-09-06 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'bpbkar32 hang / 정지',
    '2025-08-24 06:57:39',
    '2025-08-24 08:08:39',
    28,
    'Failed',
    84,
    'I/O 오류 / 프로세스 정체 / 권한 문제 가능',
    '2025-08-24 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup Client 서비스 다운',
    '2025-10-29 06:57:39',
    '2025-10-29 08:07:39',
    38,
    'Failed',
    58,
    'Client connection failure / Cannot connect on socket',
    '2025-10-29 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '복제(Replication) 장애',
    '2025-12-13 06:57:39',
    '2025-12-13 08:08:39',
    72,
    'Failed',
    84,
    'Storage / Disk Pool / LSU 문제',
    '2025-12-13 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Storage Server down',
    '2025-12-13 06:57:39',
    '2025-12-13 08:57:39',
    31,
    'Failed',
    84,
    'Disk/OpenStorage/MSDP 문제',
    '2025-12-13 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VSR 백업 실패',
    '2026-01-16 06:57:39',
    '2026-01-16 08:39:39',
    110,
    'Failed',
    84,
    'Snapshot/Storage 영향',
    '2026-01-16 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업 장애',
    '2025-10-10 06:57:39',
    '2025-10-10 07:39:39',
    61,
    'Failed',
    84,
    'Storage 또는 Snapshot 오류',
    '2025-10-10 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 14 백업 중 실패',
    '2025-12-14 06:57:39',
    '2025-12-14 07:34:39',
    39,
    'Failed',
    14,
    'File list / path / access 문제',
    '2025-12-14 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 24 장애',
    '2025-10-18 06:57:39',
    '2025-10-18 08:05:39',
    85,
    'Failed',
    24,
    'Socket write failed (네트워크)',
    '2025-10-18 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 58 실패',
    '2025-12-04 06:57:39',
    '2025-12-04 08:00:39',
    70,
    'Failed',
    58,
    'Client connection failure',
    '2025-12-04 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 84 장애',
    '2025-09-22 06:57:39',
    '2025-09-22 07:51:39',
    95,
    'Failed',
    84,
    'Media write / Disk / Storage 오류',
    '2025-09-22 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 96 장애',
    '2026-02-08 06:57:39',
    '2026-02-08 08:17:39',
    37,
    'Failed',
    96,
    'Media 할당 실패',
    '2026-02-08 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Status 158 장애',
    '2025-11-01 06:57:39',
    '2025-11-01 08:19:39',
    22,
    'Failed',
    58,
    'Snapshot failure',
    '2025-11-01 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Unable to communicate with SDCSS IPS',
    '2025-12-28 06:57:39',
    '2025-12-28 07:54:39',
    13,
    'Failed',
    58,
    '네트워크 / 서비스 / 포트 문제',
    '2025-12-28 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'OPS / OpsCenter 장애',
    '2026-01-28 06:57:39',
    '2026-01-28 07:57:39',
    92,
    'Failed',
    13,
    '통신 / 서비스 / DB 연결 문제',
    '2026-01-28 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Elevate 모드 진입 불가',
    '2025-10-15 06:57:39',
    '2025-10-15 08:43:39',
    40,
    'Failed',
    58,
    '인증 / 권한 / 서비스 문제 가능',
    '2025-10-15 06:57:39'
FROM customers c
WHERE c.company_name = '동국제약'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NBU 5250 WMC / IPMI WEBUI 장애',
    '2026-01-19 06:57:39',
    '2026-01-19 07:58:39',
    96,
    'Failed',
    58,
    '관리 콘솔/WMC 또는 IPMI 접속 불가, 통신/서비스 점검 및 조치',
    '2026-01-19 06:57:39'
FROM customers c
WHERE c.company_name = '리치앤코'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    '디스크 교체 / 정책 정리 / 정책 최신화',
    '2025-10-04 06:57:39',
    '2025-10-04 07:18:39',
    32,
    'Failed',
    58,
    'HW 교체 후 정책 재정비 및 백업 구성 최신화',
    '2025-10-04 06:57:39'
FROM customers c
WHERE c.company_name = '리치앤코'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'VM 백업 장애지원',
    '2025-11-14 06:57:39',
    '2025-11-14 08:46:39',
    91,
    'Failed',
    84,
    'Storage write 오류 또는 Snapshot 실패 대응',
    '2025-11-14 06:57:39'
FROM customers c
WHERE c.company_name = '리치앤코'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup VMware 장애지원',
    '2025-10-09 06:57:39',
    '2025-10-09 08:23:39',
    85,
    'Failed',
    58,
    'VMware Snapshot/VADP 오류 대응',
    '2025-10-09 06:57:39'
FROM customers c
WHERE c.company_name = '리치앤코'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'NetBackup 케이스 진행',
    '2026-01-02 06:57:39',
    '2026-01-02 07:28:39',
    106,
    'Failed',
    58,
    '일반 장애 분석 및 벤더 케이스 대응',
    '2026-01-02 06:57:39'
FROM customers c
WHERE c.company_name = '리치앤코'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Email Notification / MSDP / Universal Share 버그',
    '2025-12-28 06:57:39',
    '2025-12-28 07:36:39',
    97,
    'Failed',
    13,
    '알림 미동작, MSDP/Share 버그, Storage 또는 Client 중단 영향',
    '2025-12-28 06:57:39'
FROM customers c
WHERE c.company_name = '리치앤코'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Universal Share 백업 Status 50',
    '2025-12-17 06:57:39',
    '2025-12-17 08:57:39',
    37,
    'Failed',
    50,
    'Client process aborted / Share 접근 또는 프로세스 중단',
    '2025-12-17 06:57:39'
FROM customers c
WHERE c.company_name = '리치앤코'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Universal → Standard Share 구성 변경',
    '2025-10-09 06:57:39',
    '2025-10-09 08:02:39',
    49,
    'Failed',
    58,
    '버그/호환성 이슈 회피를 위한 구성 변경',
    '2025-10-09 06:57:39'
FROM customers c
WHERE c.company_name = '리치앤코'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'MSDP 이미지 깨짐',
    '2026-01-07 06:57:39',
    '2026-01-07 08:45:39',
    54,
    'Failed',
    84,
    'MSDP/Disk Pool/Storage 오류, 이미지 무결성 문제',
    '2026-01-07 06:57:39'
FROM customers c
WHERE c.company_name = '리치앤코'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Email Notification 미동작',
    '2025-09-14 06:57:39',
    '2025-09-14 07:18:39',
    20,
    'Failed',
    58,
    'SMTP/스크립트/권한/설정 점검',
    '2025-09-14 06:57:39'
FROM customers c
WHERE c.company_name = '리치앤코'
LIMIT 1;

INSERT INTO backup_jobs (
    customer_id, 
    server_name, 
    policy_name,
    job_name, 
    start_time, 
    end_time,
    duration_minutes,
    status, 
    error_code, 
    error_message,
    created_at
) SELECT 
    c.customer_id,
    'SERVER-01',
    'Daily_Backup',
    'Email Notification / TMOUT / MSDP 이미지 깨짐',
    '2026-01-22 06:57:39',
    '2026-01-22 07:08:39',
    52,
    'Failed',
    13,
    '세션 종료/TMOUT 영향, 알림 및 Storage 오류 점검',
    '2026-01-22 06:57:39'
FROM customers c
WHERE c.company_name = '리치앤코'
LIMIT 1;


-- 등록 확인
SELECT COUNT(*) as total_backup_jobs FROM backup_jobs;
SELECT status, COUNT(*) as count FROM backup_jobs GROUP BY status;
