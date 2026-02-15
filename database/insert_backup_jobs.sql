-- ============================================
-- V-BIP 더미 백업 작업 로그 생성
-- 생성일: 2026-02-15 14:25:16
-- ============================================

-- 백업 작업 로그 삽입 (최근 30일)
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-16 01:39:00', '2026-01-16 02:44:00', 
    65, 'Success', 0, NULL, 
    NULL, 32169093399, 36130, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-16 23:47:00', '2026-01-17 00:43:00', 
    56, 'Success', 0, NULL, 
    NULL, 42554668265, 26622, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-16 01:13:00', '2026-01-16 01:35:00', 
    22, 'Success', 0, NULL, 
    NULL, 9907616485, 14318, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-16 02:05:00', '2026-01-16 05:00:00', 
    175, 'Success', 0, NULL, 
    NULL, 38648547675, 13224, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-16 02:43:00', '2026-01-16 04:15:00', 
    92, 'Success', 0, NULL, 
    NULL, 37168370976, 23068, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-16 23:50:00', '2026-01-17 00:14:00', 
    24, 'Success', 0, NULL, 
    NULL, 33464511693, 42422, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-16 00:38:00', '2026-01-16 00:50:00', 
    12, 'Success', 0, NULL, 
    NULL, 39387978103, 19121, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-16 01:22:00', '2026-01-16 01:53:00', 
    31, 'Success', 0, NULL, 
    NULL, 12034857420, 20056, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-16 02:23:00', '2026-01-16 05:11:00', 
    168, 'Success', 0, NULL, 
    NULL, 17753189303, 14932, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-16 01:06:00', '2026-01-16 03:33:00', 
    147, 'Success', 0, NULL, 
    NULL, 9258270357, 37704, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-16 01:00:00', '2026-01-16 03:48:00', 
    168, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 18358022463, 46751, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-16 01:00:00', '2026-01-16 02:36:00', 
    96, 'Success', 0, NULL, 
    NULL, 9551803963, 28502, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-16 00:55:00', '2026-01-16 01:15:00', 
    20, 'Success', 0, NULL, 
    NULL, 37559638073, 23093, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-16 00:48:00', '2026-01-16 03:41:00', 
    173, 'Success', 0, NULL, 
    NULL, 25794184074, 13000, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-16 00:06:00', '2026-01-16 03:00:00', 
    174, 'Success', 0, NULL, 
    NULL, 42980500636, 6827, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-16 02:32:00', '2026-01-16 04:58:00', 
    146, 'Success', 0, NULL, 
    NULL, 47489555076, 19762, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-16 02:33:00', '2026-01-16 02:51:00', 
    18, 'Success', 0, NULL, 
    NULL, 35483456773, 21164, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-16 23:47:00', '2026-01-17 01:21:00', 
    94, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 43459473504, 24195, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-16 02:43:00', '2026-01-16 03:38:00', 
    55, 'Success', 0, NULL, 
    NULL, 41623923023, 1660, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-16 01:08:00', '2026-01-16 04:06:00', 
    178, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 34315529075, 5164, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-16 23:45:00', '2026-01-17 00:11:00', 
    26, 'Failed', 1, '1', 
    'backup failed with general error, exit status = 1', 23086304780, 33805, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-16 02:05:00', '2026-01-16 04:18:00', 
    133, 'Success', 0, NULL, 
    NULL, 50615976111, 28888, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-16 00:13:00', '2026-01-16 01:29:00', 
    76, 'Success', 0, NULL, 
    NULL, 30021419380, 47331, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-16 00:10:00', '2026-01-16 02:45:00', 
    155, 'Success', 0, NULL, 
    NULL, 40001965831, 32186, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-16 00:00:00', '2026-01-16 02:00:00', 
    120, 'Success', 0, NULL, 
    NULL, 12885500871, 17151, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-16 00:35:00', '2026-01-16 02:48:00', 
    133, 'Success', 0, NULL, 
    NULL, 42951218843, 36282, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-16 01:11:00', '2026-01-16 01:25:00', 
    14, 'Success', 0, NULL, 
    NULL, 14050049611, 43563, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-16 00:33:00', '2026-01-16 02:55:00', 
    142, 'Success', 0, NULL, 
    NULL, 47033309312, 35033, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-16 00:22:00', '2026-01-16 00:59:00', 
    37, 'Success', 0, NULL, 
    NULL, 7025746245, 32718, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-16 01:39:00', '2026-01-16 03:46:00', 
    127, 'Failed', 96, '96', 
    'client APP01 not responding, exit status = 96', 15747780592, 48279, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-16 23:26:00', '2026-01-17 00:35:00', 
    69, 'Success', 0, NULL, 
    NULL, 48707429385, 21654, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-16 02:01:00', '2026-01-16 02:36:00', 
    35, 'Success', 0, NULL, 
    NULL, 23608204761, 47975, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-16 02:17:00', '2026-01-16 04:34:00', 
    137, 'Success', 0, NULL, 
    NULL, 53146426588, 2568, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-16 01:28:00', '2026-01-16 03:25:00', 
    117, 'Success', 0, NULL, 
    NULL, 47676310417, 28825, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-16 00:09:00', '2026-01-16 01:35:00', 
    86, 'Success', 0, NULL, 
    NULL, 27113700433, 2000, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-16 00:41:00', '2026-01-16 01:23:00', 
    42, 'Success', 0, NULL, 
    NULL, 37891967792, 5676, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-16 02:35:00', '2026-01-16 04:18:00', 
    103, 'Success', 0, NULL, 
    NULL, 42983284363, 9026, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-16 23:01:00', '2026-01-16 23:52:00', 
    51, 'Success', 0, NULL, 
    NULL, 8099000482, 30795, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-16 01:02:00', '2026-01-16 03:29:00', 
    147, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 39582086075, 5487, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-16 23:37:00', '2026-01-17 01:41:00', 
    124, 'Success', 0, NULL, 
    NULL, 29443587495, 43108, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-16 00:07:00', '2026-01-16 02:58:00', 
    171, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 14885007408, 8686, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-17 00:34:00', '2026-01-17 00:52:00', 
    18, 'Success', 0, NULL, 
    NULL, 44259536389, 48491, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-17 23:27:00', '2026-01-18 01:12:00', 
    105, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 33648425143, 15473, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-17 02:04:00', '2026-01-17 02:40:00', 
    36, 'Success', 0, NULL, 
    NULL, 51034651150, 24101, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-17 23:00:00', '2026-01-18 01:16:00', 
    136, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 16449281068, 39405, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-17 02:37:00', '2026-01-17 03:33:00', 
    56, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 9345250405, 30425, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-17 00:57:00', '2026-01-17 03:14:00', 
    137, 'Success', 0, NULL, 
    NULL, 26953657954, 20481, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-17 02:07:00', '2026-01-17 05:04:00', 
    177, 'Success', 0, NULL, 
    NULL, 18710270119, 43713, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-17 01:49:00', '2026-01-17 04:43:00', 
    174, 'Success', 0, NULL, 
    NULL, 30772869048, 45821, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-17 00:10:00', '2026-01-17 02:30:00', 
    140, 'Success', 0, NULL, 
    NULL, 8559295238, 3564, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-17 02:44:00', '2026-01-17 05:09:00', 
    145, 'Success', 0, NULL, 
    NULL, 41221583718, 25050, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-17 01:27:00', '2026-01-17 03:52:00', 
    145, 'Success', 0, NULL, 
    NULL, 49963129285, 43226, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-17 00:10:00', '2026-01-17 01:18:00', 
    68, 'Success', 0, NULL, 
    NULL, 35634046353, 46233, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-17 01:01:00', '2026-01-17 01:57:00', 
    56, 'Success', 0, NULL, 
    NULL, 48407090499, 32168, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-17 00:27:00', '2026-01-17 01:43:00', 
    76, 'Success', 0, NULL, 
    NULL, 53114488113, 41112, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-17 23:09:00', '2026-01-18 00:51:00', 
    102, 'Success', 0, NULL, 
    NULL, 26623502812, 7877, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-17 02:53:00', '2026-01-17 04:10:00', 
    77, 'Success', 0, NULL, 
    NULL, 35412164265, 30004, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-17 02:43:00', '2026-01-17 03:41:00', 
    58, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 9446696668, 23904, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-17 01:16:00', '2026-01-17 03:11:00', 
    115, 'Success', 0, NULL, 
    NULL, 35304689394, 15564, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-17 23:43:00', '2026-01-18 02:08:00', 
    145, 'Success', 0, NULL, 
    NULL, 15039308739, 10640, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-17 02:04:00', '2026-01-17 03:21:00', 
    77, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 32577335302, 33736, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-17 00:23:00', '2026-01-17 01:28:00', 
    65, 'Success', 0, NULL, 
    NULL, 52254687619, 41922, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-17 00:40:00', '2026-01-17 01:59:00', 
    79, 'Success', 0, NULL, 
    NULL, 11534903654, 37690, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-17 00:10:00', '2026-01-17 02:21:00', 
    131, 'Success', 0, NULL, 
    NULL, 16555748617, 31278, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-17 00:35:00', '2026-01-17 00:56:00', 
    21, 'Success', 0, NULL, 
    NULL, 23128115077, 43756, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-17 23:00:00', '2026-01-17 23:59:00', 
    59, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 34122406359, 22977, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-17 02:34:00', '2026-01-17 05:00:00', 
    146, 'Success', 0, NULL, 
    NULL, 15327570201, 38735, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-17 23:50:00', '2026-01-18 00:34:00', 
    44, 'Success', 0, NULL, 
    NULL, 49929101499, 29550, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-17 01:27:00', '2026-01-17 03:16:00', 
    109, 'Success', 0, NULL, 
    NULL, 36481649742, 11307, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-17 00:56:00', '2026-01-17 02:53:00', 
    117, 'Success', 0, NULL, 
    NULL, 26973937678, 15487, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-17 02:23:00', '2026-01-17 04:45:00', 
    142, 'Success', 0, NULL, 
    NULL, 32564010565, 45539, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-17 02:53:00', '2026-01-17 03:35:00', 
    42, 'Success', 0, NULL, 
    NULL, 38550381937, 17052, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-17 02:02:00', '2026-01-17 03:57:00', 
    115, 'Success', 0, NULL, 
    NULL, 41821988256, 42113, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-17 23:54:00', '2026-01-18 02:51:00', 
    177, 'Success', 0, NULL, 
    NULL, 13792739283, 39748, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-17 02:26:00', '2026-01-17 03:40:00', 
    74, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 35063310748, 35140, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-17 02:16:00', '2026-01-17 03:07:00', 
    51, 'Success', 0, NULL, 
    NULL, 19355402169, 45383, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-17 23:58:00', '2026-01-18 01:36:00', 
    98, 'Success', 0, NULL, 
    NULL, 46899462008, 32921, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-17 02:00:00', '2026-01-17 03:42:00', 
    102, 'Success', 0, NULL, 
    NULL, 31483579428, 2746, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-17 01:19:00', '2026-01-17 02:20:00', 
    61, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 14218491704, 49172, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-17 01:20:00', '2026-01-17 04:12:00', 
    172, 'Success', 0, NULL, 
    NULL, 33142311855, 45985, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-17 00:12:00', '2026-01-17 02:41:00', 
    149, 'Success', 0, NULL, 
    NULL, 13469455145, 12238, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-17 23:55:00', '2026-01-18 01:04:00', 
    69, 'Success', 0, NULL, 
    NULL, 25051235404, 22600, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'WEEKLY_FULL', 'SAMSUNG_DB01_Full', 'Full',
    '2026-01-18 01:34:00', '2026-01-18 02:27:00', 
    53, 'Success', 0, NULL, 
    NULL, 507922625739, 37199, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'WEEKLY_FULL', 'SAMSUNG_DB02_Full', 'Full',
    '2026-01-18 02:37:00', '2026-01-18 03:31:00', 
    54, 'Success', 0, NULL, 
    NULL, 434493155127, 37263, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'WEEKLY_FULL', 'SAMSUNG_WEB01_Full', 'Full',
    '2026-01-18 02:49:00', '2026-01-18 05:40:00', 
    171, 'Success', 0, NULL, 
    NULL, 278603483873, 4804, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'WEEKLY_FULL', 'SAMSUNG_WEB02_Full', 'Full',
    '2026-01-18 02:29:00', '2026-01-18 02:55:00', 
    26, 'Success', 0, NULL, 
    NULL, 488678306486, 27763, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'WEEKLY_FULL', 'SAMSUNG_APP01_Full', 'Full',
    '2026-01-18 00:35:00', '2026-01-18 01:18:00', 
    43, 'Success', 0, NULL, 
    NULL, 474796822817, 12036, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'WEEKLY_FULL', 'LG_DB01_Full', 'Full',
    '2026-01-18 01:52:00', '2026-01-18 04:05:00', 
    133, 'Success', 0, NULL, 
    NULL, 328455687955, 48537, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'WEEKLY_FULL', 'LG_WEB01_Full', 'Full',
    '2026-01-18 23:57:00', '2026-01-19 00:14:00', 
    17, 'Success', 0, NULL, 
    NULL, 535315029952, 11854, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'WEEKLY_FULL', 'LG_APP01_Full', 'Full',
    '2026-01-18 00:01:00', '2026-01-18 01:07:00', 
    66, 'Success', 0, NULL, 
    NULL, 135870284776, 27357, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'WEEKLY_FULL', 'LG_FILE01_Full', 'Full',
    '2026-01-18 00:02:00', '2026-01-18 00:12:00', 
    10, 'Success', 0, NULL, 
    NULL, 532810937399, 46203, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'WEEKLY_FULL', 'SKHYNIX_DB01_Full', 'Full',
    '2026-01-18 00:29:00', '2026-01-18 02:13:00', 
    104, 'Success', 0, NULL, 
    NULL, 419210074419, 43662, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'WEEKLY_FULL', 'SKHYNIX_DB02_Full', 'Full',
    '2026-01-18 23:15:00', '2026-01-19 01:19:00', 
    124, 'Success', 0, NULL, 
    NULL, 190812109183, 28388, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'WEEKLY_FULL', 'SKHYNIX_APP01_Full', 'Full',
    '2026-01-18 23:28:00', '2026-01-19 01:33:00', 
    125, 'Success', 0, NULL, 
    NULL, 287593721539, 44844, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'WEEKLY_FULL', 'SKHYNIX_APP02_Full', 'Full',
    '2026-01-18 02:54:00', '2026-01-18 03:54:00', 
    60, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 89938141296, 26086, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'WEEKLY_FULL', 'HYUNDAI_DB01_Full', 'Full',
    '2026-01-18 01:48:00', '2026-01-18 03:10:00', 
    82, 'Success', 0, NULL, 
    NULL, 494322139463, 5826, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'WEEKLY_FULL', 'HYUNDAI_DB02_Full', 'Full',
    '2026-01-18 00:54:00', '2026-01-18 01:38:00', 
    44, 'Success', 0, NULL, 
    NULL, 217965271335, 45199, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'WEEKLY_FULL', 'HYUNDAI_DB03_Full', 'Full',
    '2026-01-18 00:52:00', '2026-01-18 01:50:00', 
    58, 'Success', 0, NULL, 
    NULL, 192014584704, 39734, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'WEEKLY_FULL', 'HYUNDAI_WEB01_Full', 'Full',
    '2026-01-18 00:24:00', '2026-01-18 01:55:00', 
    91, 'Success', 0, NULL, 
    NULL, 360080287285, 31991, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'WEEKLY_FULL', 'HYUNDAI_APP01_Full', 'Full',
    '2026-01-18 01:29:00', '2026-01-18 03:49:00', 
    140, 'Success', 0, NULL, 
    NULL, 467376695822, 1151, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'WEEKLY_FULL', 'HYUNDAI_FILE01_Full', 'Full',
    '2026-01-18 23:40:00', '2026-01-19 01:04:00', 
    84, 'Success', 0, NULL, 
    NULL, 463075618672, 42457, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'WEEKLY_FULL', 'POSCO_DB01_Full', 'Full',
    '2026-01-18 01:23:00', '2026-01-18 02:31:00', 
    68, 'Success', 0, NULL, 
    NULL, 139313235737, 33851, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'WEEKLY_FULL', 'POSCO_WEB01_Full', 'Full',
    '2026-01-18 00:28:00', '2026-01-18 03:22:00', 
    174, 'Success', 0, NULL, 
    NULL, 396570344042, 5087, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'WEEKLY_FULL', 'POSCO_APP01_Full', 'Full',
    '2026-01-18 02:42:00', '2026-01-18 03:06:00', 
    24, 'Success', 0, NULL, 
    NULL, 105647907471, 25004, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'WEEKLY_FULL', 'POSCO_FILE01_Full', 'Full',
    '2026-01-18 00:53:00', '2026-01-18 01:23:00', 
    30, 'Success', 0, NULL, 
    NULL, 507823377144, 21489, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'WEEKLY_FULL', 'NAVER_DB01_Full', 'Full',
    '2026-01-18 01:52:00', '2026-01-18 03:10:00', 
    78, 'Success', 0, NULL, 
    NULL, 60148938879, 35967, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'WEEKLY_FULL', 'NAVER_WEB01_Full', 'Full',
    '2026-01-18 23:09:00', '2026-01-18 23:43:00', 
    34, 'Success', 0, NULL, 
    NULL, 205495895042, 17068, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'WEEKLY_FULL', 'NAVER_WEB02_Full', 'Full',
    '2026-01-18 23:20:00', '2026-01-19 00:20:00', 
    60, 'Success', 0, NULL, 
    NULL, 377928797597, 15796, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'WEEKLY_FULL', 'NAVER_APP01_Full', 'Full',
    '2026-01-18 23:55:00', '2026-01-19 01:10:00', 
    75, 'Success', 0, NULL, 
    NULL, 355283452615, 25112, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'WEEKLY_FULL', 'KAKAO_DB01_Full', 'Full',
    '2026-01-18 02:34:00', '2026-01-18 03:57:00', 
    83, 'Success', 0, NULL, 
    NULL, 144175712598, 36890, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'WEEKLY_FULL', 'KAKAO_WEB01_Full', 'Full',
    '2026-01-18 02:24:00', '2026-01-18 04:16:00', 
    112, 'Success', 0, NULL, 
    NULL, 80929457535, 3953, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'WEEKLY_FULL', 'KAKAO_APP01_Full', 'Full',
    '2026-01-18 00:59:00', '2026-01-18 02:52:00', 
    113, 'Success', 0, NULL, 
    NULL, 327053432051, 41435, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'WEEKLY_FULL', 'COUPANG_DB01_Full', 'Full',
    '2026-01-18 23:36:00', '2026-01-19 01:54:00', 
    138, 'Success', 0, NULL, 
    NULL, 238500737424, 49287, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'WEEKLY_FULL', 'COUPANG_DB02_Full', 'Full',
    '2026-01-18 02:52:00', '2026-01-18 05:38:00', 
    166, 'Success', 0, NULL, 
    NULL, 317538629046, 34238, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'WEEKLY_FULL', 'COUPANG_WEB01_Full', 'Full',
    '2026-01-18 01:37:00', '2026-01-18 03:44:00', 
    127, 'Success', 0, NULL, 
    NULL, 250612869385, 31823, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'WEEKLY_FULL', 'COUPANG_WEB02_Full', 'Full',
    '2026-01-18 02:14:00', '2026-01-18 03:00:00', 
    46, 'Success', 0, NULL, 
    NULL, 481573385173, 27932, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'WEEKLY_FULL', 'COUPANG_APP01_Full', 'Full',
    '2026-01-18 23:36:00', '2026-01-19 00:49:00', 
    73, 'Success', 0, NULL, 
    NULL, 172243905910, 49103, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'WEEKLY_FULL', 'COUPANG_FILE01_Full', 'Full',
    '2026-01-18 00:20:00', '2026-01-18 01:03:00', 
    43, 'Success', 0, NULL, 
    NULL, 62211302098, 2160, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'WEEKLY_FULL', 'BAEMIN_DB01_Full', 'Full',
    '2026-01-18 00:22:00', '2026-01-18 00:45:00', 
    23, 'Success', 0, NULL, 
    NULL, 446809805789, 6589, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'WEEKLY_FULL', 'BAEMIN_WEB01_Full', 'Full',
    '2026-01-18 23:27:00', '2026-01-18 23:51:00', 
    24, 'Success', 0, NULL, 
    NULL, 248472422442, 5182, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'WEEKLY_FULL', 'BAEMIN_APP01_Full', 'Full',
    '2026-01-18 01:48:00', '2026-01-18 04:02:00', 
    134, 'Success', 0, NULL, 
    NULL, 420178472503, 2590, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'WEEKLY_FULL', 'WOOWA_DB01_Full', 'Full',
    '2026-01-18 01:15:00', '2026-01-18 02:06:00', 
    51, 'Success', 0, NULL, 
    NULL, 238558764969, 32150, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'WEEKLY_FULL', 'WOOWA_WEB01_Full', 'Full',
    '2026-01-18 00:16:00', '2026-01-18 01:48:00', 
    92, 'Success', 0, NULL, 
    NULL, 329002398963, 22133, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-19 23:03:00', '2026-01-20 00:35:00', 
    92, 'Success', 0, NULL, 
    NULL, 19578145413, 27056, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-19 01:54:00', '2026-01-19 03:48:00', 
    114, 'Success', 0, NULL, 
    NULL, 17306185198, 31251, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-19 00:13:00', '2026-01-19 03:13:00', 
    180, 'Success', 0, NULL, 
    NULL, 9476531674, 20249, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-19 00:47:00', '2026-01-19 01:16:00', 
    29, 'Success', 0, NULL, 
    NULL, 25520544136, 33896, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-19 02:05:00', '2026-01-19 04:47:00', 
    162, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 21108877786, 34415, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-19 01:08:00', '2026-01-19 02:44:00', 
    96, 'Success', 0, NULL, 
    NULL, 40086709405, 7753, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-19 23:59:00', '2026-01-20 02:43:00', 
    164, 'Success', 0, NULL, 
    NULL, 46743264917, 21462, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-19 01:28:00', '2026-01-19 02:16:00', 
    48, 'Success', 0, NULL, 
    NULL, 19921183610, 21154, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-19 23:24:00', '2026-01-20 01:59:00', 
    155, 'Success', 0, NULL, 
    NULL, 48248911326, 10396, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-19 00:44:00', '2026-01-19 00:55:00', 
    11, 'Success', 0, NULL, 
    NULL, 30883687557, 37050, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-19 00:54:00', '2026-01-19 03:40:00', 
    166, 'Success', 0, NULL, 
    NULL, 45764829840, 43543, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-19 00:06:00', '2026-01-19 02:48:00', 
    162, 'Success', 0, NULL, 
    NULL, 40836286704, 37139, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-19 23:38:00', '2026-01-20 00:15:00', 
    37, 'Success', 0, NULL, 
    NULL, 14698838781, 11208, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-19 02:32:00', '2026-01-19 05:09:00', 
    157, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 9102794498, 14224, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-19 01:55:00', '2026-01-19 02:26:00', 
    31, 'Success', 0, NULL, 
    NULL, 42385985370, 45650, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-19 00:24:00', '2026-01-19 02:59:00', 
    155, 'Success', 0, NULL, 
    NULL, 40405739121, 14498, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-19 02:05:00', '2026-01-19 03:56:00', 
    111, 'Success', 0, NULL, 
    NULL, 28635780597, 11444, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-19 02:09:00', '2026-01-19 03:25:00', 
    76, 'Success', 0, NULL, 
    NULL, 18351223320, 47491, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-19 23:04:00', '2026-01-20 00:16:00', 
    72, 'Success', 0, NULL, 
    NULL, 22583770770, 17408, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-19 23:24:00', '2026-01-20 00:36:00', 
    72, 'Success', 0, NULL, 
    NULL, 14473031650, 29724, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-19 23:22:00', '2026-01-20 01:38:00', 
    136, 'Success', 0, NULL, 
    NULL, 40606785511, 33400, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-19 23:13:00', '2026-01-20 00:39:00', 
    86, 'Success', 0, NULL, 
    NULL, 44123607850, 6698, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-19 23:53:00', '2026-01-20 01:04:00', 
    71, 'Success', 0, NULL, 
    NULL, 12064317630, 25806, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-19 23:52:00', '2026-01-20 01:31:00', 
    99, 'Success', 0, NULL, 
    NULL, 48917624737, 21767, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-19 02:26:00', '2026-01-19 04:54:00', 
    148, 'Success', 0, NULL, 
    NULL, 20377021299, 27966, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-19 00:14:00', '2026-01-19 03:04:00', 
    170, 'Success', 0, NULL, 
    NULL, 18220670604, 21211, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-19 23:40:00', '2026-01-20 00:12:00', 
    32, 'Success', 0, NULL, 
    NULL, 15791280859, 37036, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-19 01:12:00', '2026-01-19 03:54:00', 
    162, 'Success', 0, NULL, 
    NULL, 6858164863, 34267, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-19 01:10:00', '2026-01-19 02:01:00', 
    51, 'Success', 0, NULL, 
    NULL, 23350526500, 30680, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-19 01:30:00', '2026-01-19 03:31:00', 
    121, 'Success', 0, NULL, 
    NULL, 17926360590, 45313, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-19 00:54:00', '2026-01-19 02:29:00', 
    95, 'Success', 0, NULL, 
    NULL, 50274841225, 31626, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-19 23:34:00', '2026-01-19 23:55:00', 
    21, 'Success', 0, NULL, 
    NULL, 35186028012, 46689, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-19 02:55:00', '2026-01-19 04:38:00', 
    103, 'Success', 0, NULL, 
    NULL, 7026562839, 46418, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-19 01:51:00', '2026-01-19 04:09:00', 
    138, 'Success', 0, NULL, 
    NULL, 29484876114, 2464, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-19 02:31:00', '2026-01-19 04:56:00', 
    145, 'Success', 0, NULL, 
    NULL, 16280908603, 17462, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-19 23:12:00', '2026-01-20 02:04:00', 
    172, 'Success', 0, NULL, 
    NULL, 40478419655, 30076, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-19 00:36:00', '2026-01-19 03:13:00', 
    157, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 15913634255, 40174, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-19 23:35:00', '2026-01-20 01:23:00', 
    108, 'Success', 0, NULL, 
    NULL, 14497556109, 17060, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-19 00:33:00', '2026-01-19 01:20:00', 
    47, 'Success', 0, NULL, 
    NULL, 28753165574, 25304, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-19 00:35:00', '2026-01-19 02:11:00', 
    96, 'Success', 0, NULL, 
    NULL, 26230862787, 10386, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-19 02:30:00', '2026-01-19 04:40:00', 
    130, 'Success', 0, NULL, 
    NULL, 41447137733, 27712, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-20 23:34:00', '2026-01-21 02:17:00', 
    163, 'Success', 0, NULL, 
    NULL, 38466921765, 18675, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-20 02:10:00', '2026-01-20 02:40:00', 
    30, 'Success', 0, NULL, 
    NULL, 34601761286, 31273, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-20 00:41:00', '2026-01-20 02:40:00', 
    119, 'Success', 0, NULL, 
    NULL, 40092351925, 30223, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-20 23:19:00', '2026-01-21 00:43:00', 
    84, 'Success', 0, NULL, 
    NULL, 35095836378, 44805, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-20 01:47:00', '2026-01-20 03:14:00', 
    87, 'Success', 0, NULL, 
    NULL, 15946234992, 25648, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-20 02:54:00', '2026-01-20 03:33:00', 
    39, 'Success', 0, NULL, 
    NULL, 42621958313, 38810, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-20 02:16:00', '2026-01-20 03:43:00', 
    87, 'Success', 0, NULL, 
    NULL, 18699537079, 5095, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-20 00:50:00', '2026-01-20 01:56:00', 
    66, 'Success', 0, NULL, 
    NULL, 46775707023, 16200, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-20 01:43:00', '2026-01-20 02:40:00', 
    57, 'Success', 0, NULL, 
    NULL, 42593176782, 1568, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-20 01:21:00', '2026-01-20 02:03:00', 
    42, 'Success', 0, NULL, 
    NULL, 53559197005, 43855, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-20 01:34:00', '2026-01-20 04:07:00', 
    153, 'Success', 0, NULL, 
    NULL, 5447089712, 13149, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-20 02:00:00', '2026-01-20 03:31:00', 
    91, 'Success', 0, NULL, 
    NULL, 7651938044, 31308, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-20 00:12:00', '2026-01-20 00:36:00', 
    24, 'Success', 0, NULL, 
    NULL, 52311312468, 36281, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-20 00:58:00', '2026-01-20 02:46:00', 
    108, 'Success', 0, NULL, 
    NULL, 37856337328, 11283, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-20 23:11:00', '2026-01-21 00:20:00', 
    69, 'Success', 0, NULL, 
    NULL, 18187944350, 18885, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-20 01:20:00', '2026-01-20 04:14:00', 
    174, 'Success', 0, NULL, 
    NULL, 12600496417, 38948, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-20 23:08:00', '2026-01-21 02:04:00', 
    176, 'Success', 0, NULL, 
    NULL, 30437997332, 46381, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-20 00:13:00', '2026-01-20 01:08:00', 
    55, 'Success', 0, NULL, 
    NULL, 45079749099, 30415, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-20 23:18:00', '2026-01-21 01:22:00', 
    124, 'Success', 0, NULL, 
    NULL, 51620083002, 25254, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-20 02:18:00', '2026-01-20 02:29:00', 
    11, 'Success', 0, NULL, 
    NULL, 9229731255, 30911, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-20 23:47:00', '2026-01-21 01:07:00', 
    80, 'Success', 0, NULL, 
    NULL, 17462445685, 10925, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-20 01:36:00', '2026-01-20 04:25:00', 
    169, 'Success', 0, NULL, 
    NULL, 45300925578, 21462, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-20 00:12:00', '2026-01-20 02:10:00', 
    118, 'Success', 0, NULL, 
    NULL, 20204098519, 8403, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-20 00:21:00', '2026-01-20 01:53:00', 
    92, 'Success', 0, NULL, 
    NULL, 41631376604, 23759, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-20 01:14:00', '2026-01-20 01:26:00', 
    12, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 10253372285, 4309, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-20 00:00:00', '2026-01-20 01:23:00', 
    83, 'Success', 0, NULL, 
    NULL, 46953783784, 8833, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-20 00:04:00', '2026-01-20 01:24:00', 
    80, 'Success', 0, NULL, 
    NULL, 35272583284, 34811, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-20 01:46:00', '2026-01-20 04:14:00', 
    148, 'Success', 0, NULL, 
    NULL, 34876669290, 32416, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-20 00:26:00', '2026-01-20 03:03:00', 
    157, 'Success', 0, NULL, 
    NULL, 52228541063, 37956, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-20 23:33:00', '2026-01-21 00:27:00', 
    54, 'Success', 0, NULL, 
    NULL, 31129124910, 48457, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-20 00:29:00', '2026-01-20 00:42:00', 
    13, 'Success', 0, NULL, 
    NULL, 6451175611, 4979, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-20 02:46:00', '2026-01-20 04:41:00', 
    115, 'Success', 0, NULL, 
    NULL, 18180003346, 40232, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-20 23:21:00', '2026-01-21 00:50:00', 
    89, 'Success', 0, NULL, 
    NULL, 41500708774, 29468, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-20 23:41:00', '2026-01-21 02:23:00', 
    162, 'Success', 0, NULL, 
    NULL, 11264382188, 16705, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-20 02:36:00', '2026-01-20 03:01:00', 
    25, 'Success', 0, NULL, 
    NULL, 16883030992, 44150, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-20 02:00:00', '2026-01-20 04:37:00', 
    157, 'Success', 0, NULL, 
    NULL, 36514709754, 33244, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-20 23:00:00', '2026-01-21 00:56:00', 
    116, 'Success', 0, NULL, 
    NULL, 52052238143, 33240, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-20 01:01:00', '2026-01-20 02:41:00', 
    100, 'Success', 0, NULL, 
    NULL, 16234532962, 41513, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-20 23:09:00', '2026-01-21 01:37:00', 
    148, 'Success', 0, NULL, 
    NULL, 37434409026, 34516, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-20 00:06:00', '2026-01-20 01:25:00', 
    79, 'Success', 0, NULL, 
    NULL, 35477227867, 38492, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-20 23:48:00', '2026-01-21 00:16:00', 
    28, 'Success', 0, NULL, 
    NULL, 8625805543, 35315, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-21 00:28:00', '2026-01-21 02:16:00', 
    108, 'Success', 0, NULL, 
    NULL, 30595277682, 46763, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-21 00:33:00', '2026-01-21 00:54:00', 
    21, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 7582405075, 36894, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-21 01:00:00', '2026-01-21 02:54:00', 
    114, 'Success', 0, NULL, 
    NULL, 10638238818, 2258, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-21 02:08:00', '2026-01-21 04:02:00', 
    114, 'Success', 0, NULL, 
    NULL, 48160047002, 42024, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-21 01:47:00', '2026-01-21 02:00:00', 
    13, 'Success', 0, NULL, 
    NULL, 11055171098, 27357, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-21 00:31:00', '2026-01-21 02:58:00', 
    147, 'Success', 0, NULL, 
    NULL, 35394166803, 14385, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-21 02:45:00', '2026-01-21 05:22:00', 
    157, 'Success', 0, NULL, 
    NULL, 21253658059, 48157, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-21 02:12:00', '2026-01-21 03:13:00', 
    61, 'Success', 0, NULL, 
    NULL, 33640043837, 29799, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-21 23:54:00', '2026-01-22 00:28:00', 
    34, 'Success', 0, NULL, 
    NULL, 52651824216, 23493, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-21 00:18:00', '2026-01-21 01:51:00', 
    93, 'Success', 0, NULL, 
    NULL, 6094616727, 15003, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-21 02:53:00', '2026-01-21 04:26:00', 
    93, 'Success', 0, NULL, 
    NULL, 9023169388, 37993, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-21 00:33:00', '2026-01-21 02:35:00', 
    122, 'Failed', 96, '96', 
    'client APP01 not responding, exit status = 96', 47076934769, 18205, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-21 01:11:00', '2026-01-21 01:23:00', 
    12, 'Success', 0, NULL, 
    NULL, 37170691884, 19416, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-21 23:42:00', '2026-01-22 00:22:00', 
    40, 'Success', 0, NULL, 
    NULL, 51872434610, 12190, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-21 02:37:00', '2026-01-21 05:00:00', 
    143, 'Success', 0, NULL, 
    NULL, 32759292921, 29143, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-21 01:33:00', '2026-01-21 02:04:00', 
    31, 'Success', 0, NULL, 
    NULL, 17644755578, 3722, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-21 02:54:00', '2026-01-21 05:54:00', 
    180, 'Success', 0, NULL, 
    NULL, 43206997114, 43029, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-21 02:13:00', '2026-01-21 02:54:00', 
    41, 'Success', 0, NULL, 
    NULL, 28803111938, 40762, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-21 01:53:00', '2026-01-21 02:48:00', 
    55, 'Success', 0, NULL, 
    NULL, 28808356536, 2314, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-21 02:06:00', '2026-01-21 02:30:00', 
    24, 'Success', 0, NULL, 
    NULL, 14103002356, 39755, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-21 02:16:00', '2026-01-21 04:16:00', 
    120, 'Success', 0, NULL, 
    NULL, 37871599252, 14402, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-21 02:19:00', '2026-01-21 04:18:00', 
    119, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 50220895543, 18019, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-21 01:48:00', '2026-01-21 02:47:00', 
    59, 'Success', 0, NULL, 
    NULL, 39871607288, 30488, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-21 00:45:00', '2026-01-21 01:18:00', 
    33, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 50199741057, 14904, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-21 02:54:00', '2026-01-21 04:09:00', 
    75, 'Success', 0, NULL, 
    NULL, 51667879562, 26956, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-21 23:01:00', '2026-01-22 00:55:00', 
    114, 'Success', 0, NULL, 
    NULL, 45465117850, 4245, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-21 02:42:00', '2026-01-21 05:02:00', 
    140, 'Success', 0, NULL, 
    NULL, 7739416852, 40600, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-21 23:51:00', '2026-01-22 01:26:00', 
    95, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 42078837576, 15477, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-21 01:35:00', '2026-01-21 02:11:00', 
    36, 'Success', 0, NULL, 
    NULL, 35168971439, 37923, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-21 23:11:00', '2026-01-21 23:29:00', 
    18, 'Success', 0, NULL, 
    NULL, 25653968963, 14162, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-21 23:14:00', '2026-01-21 23:50:00', 
    36, 'Success', 0, NULL, 
    NULL, 9006917295, 39180, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-21 01:53:00', '2026-01-21 03:29:00', 
    96, 'Success', 0, NULL, 
    NULL, 7786480912, 9949, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-21 23:48:00', '2026-01-22 01:34:00', 
    106, 'Success', 0, NULL, 
    NULL, 16677514628, 36032, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-21 01:14:00', '2026-01-21 03:31:00', 
    137, 'Success', 0, NULL, 
    NULL, 44531738172, 18744, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-21 01:37:00', '2026-01-21 01:48:00', 
    11, 'Success', 0, NULL, 
    NULL, 40677880520, 26815, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-21 01:03:00', '2026-01-21 01:52:00', 
    49, 'Success', 0, NULL, 
    NULL, 16302411587, 29368, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-21 00:48:00', '2026-01-21 02:50:00', 
    122, 'Failed', 2106, '2106', 
    'license key expired or invalid, exit status = 2106', 37359273131, 31876, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-21 01:02:00', '2026-01-21 02:49:00', 
    107, 'Success', 0, NULL, 
    NULL, 14743883275, 37928, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-21 02:11:00', '2026-01-21 03:13:00', 
    62, 'Success', 0, NULL, 
    NULL, 40554816431, 47128, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-21 01:50:00', '2026-01-21 04:01:00', 
    131, 'Success', 0, NULL, 
    NULL, 26323186336, 7000, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-21 23:13:00', '2026-01-22 02:10:00', 
    177, 'Success', 0, NULL, 
    NULL, 35577461040, 46349, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-22 00:52:00', '2026-01-22 01:18:00', 
    26, 'Success', 0, NULL, 
    NULL, 51554133724, 4782, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-22 00:33:00', '2026-01-22 02:19:00', 
    106, 'Success', 0, NULL, 
    NULL, 20184756515, 12157, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-22 23:00:00', '2026-01-23 00:54:00', 
    114, 'Success', 0, NULL, 
    NULL, 27987085385, 22644, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-22 02:34:00', '2026-01-22 04:47:00', 
    133, 'Success', 0, NULL, 
    NULL, 25609929332, 34134, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-22 23:34:00', '2026-01-23 00:50:00', 
    76, 'Success', 0, NULL, 
    NULL, 27644995266, 1933, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-22 02:41:00', '2026-01-22 03:52:00', 
    71, 'Success', 0, NULL, 
    NULL, 16748092755, 32531, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-22 23:31:00', '2026-01-23 01:54:00', 
    143, 'Success', 0, NULL, 
    NULL, 33935963662, 28100, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-22 01:35:00', '2026-01-22 01:46:00', 
    11, 'Success', 0, NULL, 
    NULL, 5618583841, 48271, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-22 00:45:00', '2026-01-22 02:30:00', 
    105, 'Success', 0, NULL, 
    NULL, 53037011188, 44155, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-22 00:35:00', '2026-01-22 02:47:00', 
    132, 'Success', 0, NULL, 
    NULL, 51012429702, 29607, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-22 01:43:00', '2026-01-22 03:47:00', 
    124, 'Success', 0, NULL, 
    NULL, 23914349094, 36356, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-22 23:20:00', '2026-01-23 02:16:00', 
    176, 'Success', 0, NULL, 
    NULL, 11419859973, 36797, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-22 00:39:00', '2026-01-22 03:34:00', 
    175, 'Success', 0, NULL, 
    NULL, 51161370828, 27540, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-22 00:21:00', '2026-01-22 02:54:00', 
    153, 'Success', 0, NULL, 
    NULL, 6350087530, 3488, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-22 01:46:00', '2026-01-22 02:14:00', 
    28, 'Success', 0, NULL, 
    NULL, 38593435561, 21476, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-22 23:04:00', '2026-01-23 00:43:00', 
    99, 'Success', 0, NULL, 
    NULL, 9293048972, 6464, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-22 02:39:00', '2026-01-22 03:59:00', 
    80, 'Success', 0, NULL, 
    NULL, 50359346219, 22704, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-22 01:07:00', '2026-01-22 03:39:00', 
    152, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 50924290417, 42751, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-22 02:23:00', '2026-01-22 03:13:00', 
    50, 'Success', 0, NULL, 
    NULL, 28901466716, 6457, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-22 01:49:00', '2026-01-22 02:31:00', 
    42, 'Success', 0, NULL, 
    NULL, 10172803323, 21368, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-22 02:21:00', '2026-01-22 05:20:00', 
    179, 'Success', 0, NULL, 
    NULL, 21727322092, 40079, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-22 00:31:00', '2026-01-22 01:11:00', 
    40, 'Success', 0, NULL, 
    NULL, 24248735185, 47593, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-22 01:09:00', '2026-01-22 03:23:00', 
    134, 'Success', 0, NULL, 
    NULL, 27374945602, 31046, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-22 01:06:00', '2026-01-22 02:29:00', 
    83, 'Success', 0, NULL, 
    NULL, 6836322345, 15741, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-22 00:07:00', '2026-01-22 01:47:00', 
    100, 'Success', 0, NULL, 
    NULL, 51934782113, 28092, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-22 02:43:00', '2026-01-22 03:16:00', 
    33, 'Success', 0, NULL, 
    NULL, 21916727223, 25163, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-22 00:49:00', '2026-01-22 03:37:00', 
    168, 'Success', 0, NULL, 
    NULL, 52518397708, 43875, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-22 01:27:00', '2026-01-22 02:11:00', 
    44, 'Success', 0, NULL, 
    NULL, 24740060452, 27291, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-22 01:03:00', '2026-01-22 03:47:00', 
    164, 'Success', 0, NULL, 
    NULL, 23493594274, 38074, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-22 00:53:00', '2026-01-22 03:35:00', 
    162, 'Success', 0, NULL, 
    NULL, 51631124120, 11836, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-22 23:21:00', '2026-01-23 00:00:00', 
    39, 'Success', 0, NULL, 
    NULL, 5754488573, 27136, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-22 02:43:00', '2026-01-22 03:05:00', 
    22, 'Success', 0, NULL, 
    NULL, 30916796289, 15124, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-22 23:21:00', '2026-01-23 00:40:00', 
    79, 'Success', 0, NULL, 
    NULL, 33636892206, 11322, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-22 23:27:00', '2026-01-23 00:32:00', 
    65, 'Success', 0, NULL, 
    NULL, 45125940412, 38305, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-22 23:21:00', '2026-01-23 01:02:00', 
    101, 'Success', 0, NULL, 
    NULL, 36000413213, 46723, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-22 01:50:00', '2026-01-22 04:45:00', 
    175, 'Success', 0, NULL, 
    NULL, 51141884540, 15832, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-22 00:47:00', '2026-01-22 03:30:00', 
    163, 'Success', 0, NULL, 
    NULL, 19217191518, 10547, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-22 01:20:00', '2026-01-22 02:04:00', 
    44, 'Failed', 96, '96', 
    'client WEB01 not responding, exit status = 96', 26470668511, 9781, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-22 00:21:00', '2026-01-22 01:05:00', 
    44, 'Success', 0, NULL, 
    NULL, 7297700394, 35565, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-22 23:40:00', '2026-01-23 01:17:00', 
    97, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 46893712116, 44403, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-22 00:28:00', '2026-01-22 01:40:00', 
    72, 'Success', 0, NULL, 
    NULL, 48328943515, 45927, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-23 23:50:00', '2026-01-24 02:49:00', 
    179, 'Success', 0, NULL, 
    NULL, 38558968753, 13697, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-23 02:18:00', '2026-01-23 05:06:00', 
    168, 'Success', 0, NULL, 
    NULL, 40612538823, 42797, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-23 23:01:00', '2026-01-24 00:32:00', 
    91, 'Success', 0, NULL, 
    NULL, 49299913872, 31340, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-23 23:40:00', '2026-01-24 00:36:00', 
    56, 'Success', 0, NULL, 
    NULL, 35071676045, 16050, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-23 23:24:00', '2026-01-24 00:51:00', 
    87, 'Success', 0, NULL, 
    NULL, 24737548009, 15751, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-23 01:14:00', '2026-01-23 01:48:00', 
    34, 'Success', 0, NULL, 
    NULL, 49001065602, 6327, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-23 00:21:00', '2026-01-23 00:31:00', 
    10, 'Success', 0, NULL, 
    NULL, 27642899767, 33643, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-23 23:11:00', '2026-01-24 01:04:00', 
    113, 'Success', 0, NULL, 
    NULL, 39906216573, 10317, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-23 02:02:00', '2026-01-23 03:39:00', 
    97, 'Success', 0, NULL, 
    NULL, 50047226260, 4695, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-23 00:41:00', '2026-01-23 03:19:00', 
    158, 'Success', 0, NULL, 
    NULL, 36787823753, 47772, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-23 23:51:00', '2026-01-24 00:39:00', 
    48, 'Success', 0, NULL, 
    NULL, 44221270905, 35158, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-23 02:34:00', '2026-01-23 05:29:00', 
    175, 'Success', 0, NULL, 
    NULL, 42447166336, 13118, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-23 23:39:00', '2026-01-24 00:46:00', 
    67, 'Success', 0, NULL, 
    NULL, 43931756593, 15156, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-23 23:07:00', '2026-01-24 01:55:00', 
    168, 'Success', 0, NULL, 
    NULL, 23996330296, 19716, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-23 02:09:00', '2026-01-23 02:41:00', 
    32, 'Success', 0, NULL, 
    NULL, 30096263201, 38589, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-23 02:26:00', '2026-01-23 05:03:00', 
    157, 'Success', 0, NULL, 
    NULL, 15015240085, 26468, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-23 01:00:00', '2026-01-23 02:57:00', 
    117, 'Success', 0, NULL, 
    NULL, 13498745678, 31392, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-23 00:58:00', '2026-01-23 03:33:00', 
    155, 'Success', 0, NULL, 
    NULL, 20211181411, 4961, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-23 02:19:00', '2026-01-23 03:26:00', 
    67, 'Success', 0, NULL, 
    NULL, 29079347611, 49652, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-23 00:18:00', '2026-01-23 01:27:00', 
    69, 'Success', 0, NULL, 
    NULL, 5475786411, 41802, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-23 00:50:00', '2026-01-23 02:29:00', 
    99, 'Success', 0, NULL, 
    NULL, 32245089694, 16516, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-23 02:27:00', '2026-01-23 05:17:00', 
    170, 'Success', 0, NULL, 
    NULL, 22101611642, 22043, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-23 01:26:00', '2026-01-23 02:57:00', 
    91, 'Success', 0, NULL, 
    NULL, 27679758783, 19279, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-23 02:24:00', '2026-01-23 03:56:00', 
    92, 'Success', 0, NULL, 
    NULL, 15705853911, 43551, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-23 01:05:00', '2026-01-23 03:48:00', 
    163, 'Success', 0, NULL, 
    NULL, 20606719073, 7940, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-23 02:01:00', '2026-01-23 04:34:00', 
    153, 'Success', 0, NULL, 
    NULL, 53598669341, 13825, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-23 01:31:00', '2026-01-23 02:00:00', 
    29, 'Success', 0, NULL, 
    NULL, 10550548683, 21337, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-23 23:14:00', '2026-01-23 23:58:00', 
    44, 'Success', 0, NULL, 
    NULL, 51968549086, 41253, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-23 00:43:00', '2026-01-23 02:04:00', 
    81, 'Success', 0, NULL, 
    NULL, 51537832680, 19977, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-23 02:59:00', '2026-01-23 04:50:00', 
    111, 'Success', 0, NULL, 
    NULL, 11366135047, 34179, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-23 01:29:00', '2026-01-23 02:56:00', 
    87, 'Success', 0, NULL, 
    NULL, 6253180668, 29448, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-23 23:45:00', '2026-01-24 01:44:00', 
    119, 'Success', 0, NULL, 
    NULL, 27996779159, 6147, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-23 23:05:00', '2026-01-24 00:25:00', 
    80, 'Success', 0, NULL, 
    NULL, 52959757368, 32648, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-23 01:22:00', '2026-01-23 04:22:00', 
    180, 'Success', 0, NULL, 
    NULL, 7604143020, 18356, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-23 23:51:00', '2026-01-24 01:55:00', 
    124, 'Success', 0, NULL, 
    NULL, 34504480784, 33788, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-23 23:58:00', '2026-01-24 02:17:00', 
    139, 'Success', 0, NULL, 
    NULL, 47625700757, 35477, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-23 23:08:00', '2026-01-24 02:04:00', 
    176, 'Success', 0, NULL, 
    NULL, 41912343213, 3716, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-23 00:59:00', '2026-01-23 02:41:00', 
    102, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 38199934878, 44273, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-23 23:41:00', '2026-01-24 00:15:00', 
    34, 'Success', 0, NULL, 
    NULL, 6142910444, 4633, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-23 02:38:00', '2026-01-23 03:36:00', 
    58, 'Success', 0, NULL, 
    NULL, 15968043802, 28952, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-23 00:08:00', '2026-01-23 03:04:00', 
    176, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 48763673327, 41655, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-24 02:34:00', '2026-01-24 04:14:00', 
    100, 'Success', 0, NULL, 
    NULL, 43009905508, 7258, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-24 00:01:00', '2026-01-24 00:41:00', 
    40, 'Success', 0, NULL, 
    NULL, 49505212843, 34662, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-24 01:18:00', '2026-01-24 04:17:00', 
    179, 'Success', 0, NULL, 
    NULL, 23214471526, 39361, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-24 02:17:00', '2026-01-24 03:56:00', 
    99, 'Success', 0, NULL, 
    NULL, 43929639765, 12147, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-24 23:39:00', '2026-01-25 02:13:00', 
    154, 'Success', 0, NULL, 
    NULL, 36357352122, 7822, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-24 01:51:00', '2026-01-24 02:41:00', 
    50, 'Success', 0, NULL, 
    NULL, 18809121763, 25009, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-24 23:14:00', '2026-01-25 00:07:00', 
    53, 'Success', 0, NULL, 
    NULL, 33099616695, 30156, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-24 01:43:00', '2026-01-24 03:02:00', 
    79, 'Success', 0, NULL, 
    NULL, 5923882081, 28662, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-24 23:08:00', '2026-01-24 23:42:00', 
    34, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 46746514836, 34892, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-24 01:58:00', '2026-01-24 03:23:00', 
    85, 'Success', 0, NULL, 
    NULL, 50386898419, 26303, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-24 00:27:00', '2026-01-24 01:41:00', 
    74, 'Success', 0, NULL, 
    NULL, 14776056975, 23184, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-24 00:15:00', '2026-01-24 01:05:00', 
    50, 'Success', 0, NULL, 
    NULL, 26742989579, 9878, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-24 02:51:00', '2026-01-24 05:06:00', 
    135, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 33139594040, 15874, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-24 23:02:00', '2026-01-24 23:55:00', 
    53, 'Success', 0, NULL, 
    NULL, 41461263350, 39978, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-24 00:27:00', '2026-01-24 02:59:00', 
    152, 'Success', 0, NULL, 
    NULL, 8337758048, 47903, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-24 00:38:00', '2026-01-24 01:20:00', 
    42, 'Success', 0, NULL, 
    NULL, 9519407762, 32701, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-24 00:30:00', '2026-01-24 03:01:00', 
    151, 'Success', 0, NULL, 
    NULL, 52929949527, 4694, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-24 23:10:00', '2026-01-24 23:56:00', 
    46, 'Success', 0, NULL, 
    NULL, 9801442137, 39689, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-24 23:50:00', '2026-01-25 00:23:00', 
    33, 'Success', 0, NULL, 
    NULL, 36301589834, 21802, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-24 01:18:00', '2026-01-24 03:14:00', 
    116, 'Success', 0, NULL, 
    NULL, 43430361225, 2856, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-24 02:46:00', '2026-01-24 03:12:00', 
    26, 'Success', 0, NULL, 
    NULL, 52210420314, 32568, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-24 01:13:00', '2026-01-24 02:08:00', 
    55, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 8465873540, 48850, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-24 00:20:00', '2026-01-24 01:05:00', 
    45, 'Success', 0, NULL, 
    NULL, 38839489409, 33099, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-24 23:15:00', '2026-01-25 00:23:00', 
    68, 'Success', 0, NULL, 
    NULL, 38734068680, 36588, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-24 23:30:00', '2026-01-25 01:48:00', 
    138, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 37937075725, 44226, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-24 23:45:00', '2026-01-25 01:56:00', 
    131, 'Failed', 96, '96', 
    'client WEB02 not responding, exit status = 96', 33837086222, 44365, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-24 02:40:00', '2026-01-24 03:47:00', 
    67, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 47589248750, 17817, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-24 01:25:00', '2026-01-24 03:02:00', 
    97, 'Success', 0, NULL, 
    NULL, 36541891383, 47530, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-24 00:00:00', '2026-01-24 00:23:00', 
    23, 'Success', 0, NULL, 
    NULL, 6918179718, 21876, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-24 02:58:00', '2026-01-24 05:12:00', 
    134, 'Success', 0, NULL, 
    NULL, 24582528575, 1116, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-24 23:13:00', '2026-01-25 00:21:00', 
    68, 'Success', 0, NULL, 
    NULL, 5884801575, 1451, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-24 01:50:00', '2026-01-24 02:02:00', 
    12, 'Success', 0, NULL, 
    NULL, 48355929356, 43531, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-24 01:37:00', '2026-01-24 03:18:00', 
    101, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 48139461289, 46419, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-24 00:46:00', '2026-01-24 02:38:00', 
    112, 'Success', 0, NULL, 
    NULL, 13491586550, 9241, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-24 02:43:00', '2026-01-24 03:07:00', 
    24, 'Success', 0, NULL, 
    NULL, 33377972539, 10602, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-24 00:36:00', '2026-01-24 03:31:00', 
    175, 'Success', 0, NULL, 
    NULL, 50435949766, 18402, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-24 01:10:00', '2026-01-24 03:56:00', 
    166, 'Success', 0, NULL, 
    NULL, 36240570509, 8779, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-24 01:53:00', '2026-01-24 04:42:00', 
    169, 'Success', 0, NULL, 
    NULL, 36477807888, 15908, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-24 01:47:00', '2026-01-24 04:41:00', 
    174, 'Success', 0, NULL, 
    NULL, 38347493828, 33701, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-24 02:40:00', '2026-01-24 03:30:00', 
    50, 'Success', 0, NULL, 
    NULL, 49501570302, 46449, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-24 23:19:00', '2026-01-25 01:52:00', 
    153, 'Success', 0, NULL, 
    NULL, 9704850748, 12413, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'WEEKLY_FULL', 'SAMSUNG_DB01_Full', 'Full',
    '2026-01-25 01:44:00', '2026-01-25 02:44:00', 
    60, 'Success', 0, NULL, 
    NULL, 392601005246, 6020, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'WEEKLY_FULL', 'SAMSUNG_DB02_Full', 'Full',
    '2026-01-25 00:59:00', '2026-01-25 03:01:00', 
    122, 'Success', 0, NULL, 
    NULL, 98767389590, 5135, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'WEEKLY_FULL', 'SAMSUNG_WEB01_Full', 'Full',
    '2026-01-25 01:59:00', '2026-01-25 04:39:00', 
    160, 'Success', 0, NULL, 
    NULL, 307782110654, 25736, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'WEEKLY_FULL', 'SAMSUNG_WEB02_Full', 'Full',
    '2026-01-25 23:22:00', '2026-01-26 01:19:00', 
    117, 'Success', 0, NULL, 
    NULL, 446113852253, 47324, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'WEEKLY_FULL', 'SAMSUNG_APP01_Full', 'Full',
    '2026-01-25 02:53:00', '2026-01-25 05:40:00', 
    167, 'Success', 0, NULL, 
    NULL, 133689412345, 44467, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'WEEKLY_FULL', 'LG_DB01_Full', 'Full',
    '2026-01-25 00:18:00', '2026-01-25 00:56:00', 
    38, 'Failed', 2106, '2106', 
    'license key expired or invalid, exit status = 2106', 67438676422, 49681, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'WEEKLY_FULL', 'LG_WEB01_Full', 'Full',
    '2026-01-25 00:10:00', '2026-01-25 00:42:00', 
    32, 'Success', 0, NULL, 
    NULL, 293576290033, 42294, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'WEEKLY_FULL', 'LG_APP01_Full', 'Full',
    '2026-01-25 23:57:00', '2026-01-26 01:34:00', 
    97, 'Success', 0, NULL, 
    NULL, 249209400470, 49259, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'WEEKLY_FULL', 'LG_FILE01_Full', 'Full',
    '2026-01-25 02:37:00', '2026-01-25 04:43:00', 
    126, 'Success', 0, NULL, 
    NULL, 347348447743, 21156, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'WEEKLY_FULL', 'SKHYNIX_DB01_Full', 'Full',
    '2026-01-25 02:25:00', '2026-01-25 04:47:00', 
    142, 'Success', 0, NULL, 
    NULL, 199503245139, 32421, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'WEEKLY_FULL', 'SKHYNIX_DB02_Full', 'Full',
    '2026-01-25 02:27:00', '2026-01-25 05:18:00', 
    171, 'Success', 0, NULL, 
    NULL, 161714715125, 33070, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'WEEKLY_FULL', 'SKHYNIX_APP01_Full', 'Full',
    '2026-01-25 01:46:00', '2026-01-25 01:58:00', 
    12, 'Success', 0, NULL, 
    NULL, 485529949559, 31240, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'WEEKLY_FULL', 'SKHYNIX_APP02_Full', 'Full',
    '2026-01-25 23:52:00', '2026-01-26 00:30:00', 
    38, 'Success', 0, NULL, 
    NULL, 152105210635, 10436, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'WEEKLY_FULL', 'HYUNDAI_DB01_Full', 'Full',
    '2026-01-25 01:30:00', '2026-01-25 04:14:00', 
    164, 'Success', 0, NULL, 
    NULL, 431970411684, 47088, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'WEEKLY_FULL', 'HYUNDAI_DB02_Full', 'Full',
    '2026-01-25 02:59:00', '2026-01-25 03:56:00', 
    57, 'Success', 0, NULL, 
    NULL, 68181208368, 39548, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'WEEKLY_FULL', 'HYUNDAI_DB03_Full', 'Full',
    '2026-01-25 23:34:00', '2026-01-26 00:31:00', 
    57, 'Success', 0, NULL, 
    NULL, 522526456962, 39223, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'WEEKLY_FULL', 'HYUNDAI_WEB01_Full', 'Full',
    '2026-01-25 00:09:00', '2026-01-25 02:29:00', 
    140, 'Success', 0, NULL, 
    NULL, 533942030537, 10482, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'WEEKLY_FULL', 'HYUNDAI_APP01_Full', 'Full',
    '2026-01-25 02:32:00', '2026-01-25 03:59:00', 
    87, 'Success', 0, NULL, 
    NULL, 236643819022, 46926, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'WEEKLY_FULL', 'HYUNDAI_FILE01_Full', 'Full',
    '2026-01-25 00:03:00', '2026-01-25 02:13:00', 
    130, 'Success', 0, NULL, 
    NULL, 430628587122, 49412, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'WEEKLY_FULL', 'POSCO_DB01_Full', 'Full',
    '2026-01-25 23:09:00', '2026-01-25 23:36:00', 
    27, 'Success', 0, NULL, 
    NULL, 433371612666, 29236, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'WEEKLY_FULL', 'POSCO_WEB01_Full', 'Full',
    '2026-01-25 01:24:00', '2026-01-25 03:42:00', 
    138, 'Success', 0, NULL, 
    NULL, 165147066401, 29005, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'WEEKLY_FULL', 'POSCO_APP01_Full', 'Full',
    '2026-01-25 23:49:00', '2026-01-26 00:10:00', 
    21, 'Success', 0, NULL, 
    NULL, 195407738381, 38714, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'WEEKLY_FULL', 'POSCO_FILE01_Full', 'Full',
    '2026-01-25 00:58:00', '2026-01-25 03:55:00', 
    177, 'Success', 0, NULL, 
    NULL, 83289657331, 6009, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'WEEKLY_FULL', 'NAVER_DB01_Full', 'Full',
    '2026-01-25 23:16:00', '2026-01-26 00:51:00', 
    95, 'Success', 0, NULL, 
    NULL, 215796681689, 5877, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'WEEKLY_FULL', 'NAVER_WEB01_Full', 'Full',
    '2026-01-25 23:41:00', '2026-01-26 01:50:00', 
    129, 'Success', 0, NULL, 
    NULL, 499722223660, 17870, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'WEEKLY_FULL', 'NAVER_WEB02_Full', 'Full',
    '2026-01-25 00:33:00', '2026-01-25 02:34:00', 
    121, 'Success', 0, NULL, 
    NULL, 93131477000, 47413, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'WEEKLY_FULL', 'NAVER_APP01_Full', 'Full',
    '2026-01-25 23:34:00', '2026-01-26 00:17:00', 
    43, 'Success', 0, NULL, 
    NULL, 92690121059, 25483, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'WEEKLY_FULL', 'KAKAO_DB01_Full', 'Full',
    '2026-01-25 02:18:00', '2026-01-25 04:42:00', 
    144, 'Success', 0, NULL, 
    NULL, 107057586968, 27085, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'WEEKLY_FULL', 'KAKAO_WEB01_Full', 'Full',
    '2026-01-25 23:59:00', '2026-01-26 00:19:00', 
    20, 'Success', 0, NULL, 
    NULL, 178380921983, 48600, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'WEEKLY_FULL', 'KAKAO_APP01_Full', 'Full',
    '2026-01-25 01:54:00', '2026-01-25 03:00:00', 
    66, 'Success', 0, NULL, 
    NULL, 206673003431, 6383, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'WEEKLY_FULL', 'COUPANG_DB01_Full', 'Full',
    '2026-01-25 02:39:00', '2026-01-25 03:12:00', 
    33, 'Success', 0, NULL, 
    NULL, 322574384656, 5430, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'WEEKLY_FULL', 'COUPANG_DB02_Full', 'Full',
    '2026-01-25 23:05:00', '2026-01-26 00:51:00', 
    106, 'Success', 0, NULL, 
    NULL, 481097178394, 22474, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'WEEKLY_FULL', 'COUPANG_WEB01_Full', 'Full',
    '2026-01-25 23:18:00', '2026-01-26 00:49:00', 
    91, 'Success', 0, NULL, 
    NULL, 230181969453, 18920, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'WEEKLY_FULL', 'COUPANG_WEB02_Full', 'Full',
    '2026-01-25 02:17:00', '2026-01-25 04:58:00', 
    161, 'Success', 0, NULL, 
    NULL, 116863313861, 44624, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'WEEKLY_FULL', 'COUPANG_APP01_Full', 'Full',
    '2026-01-25 00:43:00', '2026-01-25 02:51:00', 
    128, 'Success', 0, NULL, 
    NULL, 236292552466, 44745, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'WEEKLY_FULL', 'COUPANG_FILE01_Full', 'Full',
    '2026-01-25 23:31:00', '2026-01-26 02:21:00', 
    170, 'Success', 0, NULL, 
    NULL, 269881792773, 45120, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'WEEKLY_FULL', 'BAEMIN_DB01_Full', 'Full',
    '2026-01-25 00:38:00', '2026-01-25 02:44:00', 
    126, 'Success', 0, NULL, 
    NULL, 384300432168, 28435, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'WEEKLY_FULL', 'BAEMIN_WEB01_Full', 'Full',
    '2026-01-25 01:44:00', '2026-01-25 02:06:00', 
    22, 'Success', 0, NULL, 
    NULL, 329459059048, 35360, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'WEEKLY_FULL', 'BAEMIN_APP01_Full', 'Full',
    '2026-01-25 01:53:00', '2026-01-25 04:29:00', 
    156, 'Success', 0, NULL, 
    NULL, 448541811068, 47250, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'WEEKLY_FULL', 'WOOWA_DB01_Full', 'Full',
    '2026-01-25 02:19:00', '2026-01-25 05:02:00', 
    163, 'Success', 0, NULL, 
    NULL, 73687912676, 1709, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'WEEKLY_FULL', 'WOOWA_WEB01_Full', 'Full',
    '2026-01-25 23:03:00', '2026-01-25 23:19:00', 
    16, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 409758775064, 1112, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-26 01:39:00', '2026-01-26 04:04:00', 
    145, 'Success', 0, NULL, 
    NULL, 49779785867, 4569, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-26 01:23:00', '2026-01-26 02:31:00', 
    68, 'Success', 0, NULL, 
    NULL, 38339773727, 12697, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-26 02:14:00', '2026-01-26 04:47:00', 
    153, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 24508668573, 41152, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-26 01:51:00', '2026-01-26 04:27:00', 
    156, 'Success', 0, NULL, 
    NULL, 32808812629, 4698, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-26 02:44:00', '2026-01-26 05:10:00', 
    146, 'Success', 0, NULL, 
    NULL, 37459122880, 4309, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-26 00:22:00', '2026-01-26 02:04:00', 
    102, 'Success', 0, NULL, 
    NULL, 18984774729, 22323, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-26 02:39:00', '2026-01-26 03:12:00', 
    33, 'Success', 0, NULL, 
    NULL, 51715035600, 18464, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-26 00:21:00', '2026-01-26 02:55:00', 
    154, 'Success', 0, NULL, 
    NULL, 52535159295, 18259, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-26 23:20:00', '2026-01-27 00:27:00', 
    67, 'Success', 0, NULL, 
    NULL, 16565329582, 38684, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-26 23:07:00', '2026-01-27 00:56:00', 
    109, 'Success', 0, NULL, 
    NULL, 24806394079, 42260, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-26 00:42:00', '2026-01-26 01:48:00', 
    66, 'Success', 0, NULL, 
    NULL, 16108478891, 11101, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-26 02:55:00', '2026-01-26 03:51:00', 
    56, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 37004369888, 49126, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-26 23:55:00', '2026-01-27 01:39:00', 
    104, 'Success', 0, NULL, 
    NULL, 11561526243, 49479, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-26 01:17:00', '2026-01-26 03:12:00', 
    115, 'Success', 0, NULL, 
    NULL, 10941267339, 44148, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-26 01:34:00', '2026-01-26 02:44:00', 
    70, 'Success', 0, NULL, 
    NULL, 39318885805, 30990, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-26 00:54:00', '2026-01-26 03:29:00', 
    155, 'Success', 0, NULL, 
    NULL, 43647024435, 28565, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-26 02:30:00', '2026-01-26 03:37:00', 
    67, 'Success', 0, NULL, 
    NULL, 21511595757, 6238, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-26 00:22:00', '2026-01-26 02:13:00', 
    111, 'Success', 0, NULL, 
    NULL, 5449190594, 48009, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-26 23:10:00', '2026-01-27 01:27:00', 
    137, 'Success', 0, NULL, 
    NULL, 31457077409, 35751, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-26 02:56:00', '2026-01-26 04:30:00', 
    94, 'Success', 0, NULL, 
    NULL, 41074162064, 40489, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-26 01:28:00', '2026-01-26 02:27:00', 
    59, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 49633297046, 11379, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-26 00:53:00', '2026-01-26 01:03:00', 
    10, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 39031636914, 46473, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-26 23:52:00', '2026-01-27 00:15:00', 
    23, 'Success', 0, NULL, 
    NULL, 45577871467, 20612, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-26 02:02:00', '2026-01-26 03:42:00', 
    100, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 10048964354, 30699, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-26 23:25:00', '2026-01-26 23:44:00', 
    19, 'Success', 0, NULL, 
    NULL, 48450633167, 28221, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-26 23:39:00', '2026-01-27 02:07:00', 
    148, 'Success', 0, NULL, 
    NULL, 50606967522, 38453, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-26 23:47:00', '2026-01-27 02:34:00', 
    167, 'Success', 0, NULL, 
    NULL, 45133837571, 45729, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-26 02:51:00', '2026-01-26 04:47:00', 
    116, 'Success', 0, NULL, 
    NULL, 50112195775, 16367, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-26 23:02:00', '2026-01-26 23:54:00', 
    52, 'Success', 0, NULL, 
    NULL, 25185691481, 48532, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-26 02:29:00', '2026-01-26 04:54:00', 
    145, 'Success', 0, NULL, 
    NULL, 27526402224, 6915, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-26 00:30:00', '2026-01-26 02:55:00', 
    145, 'Failed', 1, '1', 
    'backup failed with general error, exit status = 1', 41842384735, 37609, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-26 23:44:00', '2026-01-27 00:02:00', 
    18, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 32023595083, 9320, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-26 00:15:00', '2026-01-26 01:11:00', 
    56, 'Success', 0, NULL, 
    NULL, 23907698695, 26706, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-26 02:49:00', '2026-01-26 03:48:00', 
    59, 'Success', 0, NULL, 
    NULL, 23756644298, 38661, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-26 00:32:00', '2026-01-26 02:39:00', 
    127, 'Success', 0, NULL, 
    NULL, 11183556735, 3636, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-26 23:50:00', '2026-01-27 00:20:00', 
    30, 'Success', 0, NULL, 
    NULL, 18210463386, 15355, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-26 00:54:00', '2026-01-26 02:28:00', 
    94, 'Success', 0, NULL, 
    NULL, 24732269686, 46738, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-26 01:49:00', '2026-01-26 03:06:00', 
    77, 'Success', 0, NULL, 
    NULL, 16150992250, 39423, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-26 02:32:00', '2026-01-26 03:32:00', 
    60, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 34709250755, 27733, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-26 00:15:00', '2026-01-26 00:50:00', 
    35, 'Success', 0, NULL, 
    NULL, 6822127065, 49173, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-26 23:47:00', '2026-01-27 01:14:00', 
    87, 'Success', 0, NULL, 
    NULL, 20699643057, 22771, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-27 00:33:00', '2026-01-27 01:14:00', 
    41, 'Success', 0, NULL, 
    NULL, 43899085445, 34495, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-27 01:25:00', '2026-01-27 04:13:00', 
    168, 'Success', 0, NULL, 
    NULL, 46148803874, 4298, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-27 01:53:00', '2026-01-27 02:14:00', 
    21, 'Success', 0, NULL, 
    NULL, 22340490328, 34094, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-27 02:32:00', '2026-01-27 04:25:00', 
    113, 'Success', 0, NULL, 
    NULL, 16021070397, 48362, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-27 02:12:00', '2026-01-27 03:53:00', 
    101, 'Success', 0, NULL, 
    NULL, 33381057731, 25106, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-27 01:15:00', '2026-01-27 03:40:00', 
    145, 'Success', 0, NULL, 
    NULL, 42873677973, 17750, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-27 02:40:00', '2026-01-27 03:13:00', 
    33, 'Success', 0, NULL, 
    NULL, 42704270063, 41299, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-27 02:01:00', '2026-01-27 04:32:00', 
    151, 'Success', 0, NULL, 
    NULL, 10489052296, 40342, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-27 00:36:00', '2026-01-27 00:59:00', 
    23, 'Success', 0, NULL, 
    NULL, 9514478305, 18718, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-27 02:40:00', '2026-01-27 04:45:00', 
    125, 'Success', 0, NULL, 
    NULL, 45020402873, 32971, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-27 23:11:00', '2026-01-28 00:37:00', 
    86, 'Success', 0, NULL, 
    NULL, 48339877686, 19098, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-27 02:04:00', '2026-01-27 03:53:00', 
    109, 'Success', 0, NULL, 
    NULL, 22820654576, 10041, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-27 00:54:00', '2026-01-27 01:28:00', 
    34, 'Failed', 96, '96', 
    'client APP02 not responding, exit status = 96', 37286625417, 43339, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-27 00:29:00', '2026-01-27 00:45:00', 
    16, 'Success', 0, NULL, 
    NULL, 9540710970, 19277, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-27 01:03:00', '2026-01-27 03:41:00', 
    158, 'Success', 0, NULL, 
    NULL, 52819831417, 27763, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-27 01:43:00', '2026-01-27 02:12:00', 
    29, 'Success', 0, NULL, 
    NULL, 24758256315, 39024, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-27 01:36:00', '2026-01-27 02:55:00', 
    79, 'Success', 0, NULL, 
    NULL, 48645568952, 43860, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-27 02:34:00', '2026-01-27 04:04:00', 
    90, 'Success', 0, NULL, 
    NULL, 18803768140, 19023, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-27 02:12:00', '2026-01-27 03:39:00', 
    87, 'Success', 0, NULL, 
    NULL, 21124680530, 42889, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-27 02:26:00', '2026-01-27 02:53:00', 
    27, 'Success', 0, NULL, 
    NULL, 18712043869, 27689, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-27 23:58:00', '2026-01-28 02:25:00', 
    147, 'Success', 0, NULL, 
    NULL, 36411992231, 24902, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-27 00:27:00', '2026-01-27 02:07:00', 
    100, 'Success', 0, NULL, 
    NULL, 7872573649, 8709, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-27 23:49:00', '2026-01-28 02:44:00', 
    175, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 30925346274, 36714, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-27 00:44:00', '2026-01-27 01:51:00', 
    67, 'Success', 0, NULL, 
    NULL, 44406112673, 12333, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-27 02:30:00', '2026-01-27 05:21:00', 
    171, 'Success', 0, NULL, 
    NULL, 10799614277, 27687, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-27 23:24:00', '2026-01-28 00:38:00', 
    74, 'Success', 0, NULL, 
    NULL, 43579497960, 35519, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-27 01:42:00', '2026-01-27 04:14:00', 
    152, 'Success', 0, NULL, 
    NULL, 9435283481, 23822, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-27 01:22:00', '2026-01-27 03:54:00', 
    152, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 39307234972, 9480, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-27 00:37:00', '2026-01-27 03:20:00', 
    163, 'Success', 0, NULL, 
    NULL, 25835019617, 13711, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-27 01:22:00', '2026-01-27 04:02:00', 
    160, 'Success', 0, NULL, 
    NULL, 49867493615, 46031, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-27 01:00:00', '2026-01-27 02:01:00', 
    61, 'Success', 0, NULL, 
    NULL, 14497581673, 16519, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-27 23:26:00', '2026-01-28 01:54:00', 
    148, 'Success', 0, NULL, 
    NULL, 45574109297, 49895, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-27 00:06:00', '2026-01-27 01:17:00', 
    71, 'Success', 0, NULL, 
    NULL, 15595736058, 13860, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-27 23:46:00', '2026-01-28 02:11:00', 
    145, 'Success', 0, NULL, 
    NULL, 26449745217, 2843, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-27 02:40:00', '2026-01-27 05:16:00', 
    156, 'Success', 0, NULL, 
    NULL, 8808225934, 8538, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-27 00:00:00', '2026-01-27 00:26:00', 
    26, 'Success', 0, NULL, 
    NULL, 25761289726, 35342, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-27 02:16:00', '2026-01-27 04:09:00', 
    113, 'Success', 0, NULL, 
    NULL, 23819238795, 46451, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-27 23:52:00', '2026-01-28 02:40:00', 
    168, 'Success', 0, NULL, 
    NULL, 37633366986, 24442, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-27 23:23:00', '2026-01-28 00:10:00', 
    47, 'Success', 0, NULL, 
    NULL, 49185902714, 41538, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-27 02:42:00', '2026-01-27 05:39:00', 
    177, 'Success', 0, NULL, 
    NULL, 39721622485, 29123, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-27 00:18:00', '2026-01-27 02:19:00', 
    121, 'Success', 0, NULL, 
    NULL, 8534990009, 20071, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-28 02:17:00', '2026-01-28 04:07:00', 
    110, 'Success', 0, NULL, 
    NULL, 31808981957, 15299, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-28 23:46:00', '2026-01-29 01:59:00', 
    133, 'Success', 0, NULL, 
    NULL, 53104408672, 1161, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-28 00:01:00', '2026-01-28 01:39:00', 
    98, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 52442247396, 12006, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-28 23:36:00', '2026-01-29 00:28:00', 
    52, 'Success', 0, NULL, 
    NULL, 53189554337, 10768, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-28 01:39:00', '2026-01-28 03:31:00', 
    112, 'Success', 0, NULL, 
    NULL, 13330256240, 8596, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-28 02:09:00', '2026-01-28 03:14:00', 
    65, 'Success', 0, NULL, 
    NULL, 34246391764, 45246, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-28 00:23:00', '2026-01-28 03:16:00', 
    173, 'Success', 0, NULL, 
    NULL, 44262585120, 11025, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-28 23:43:00', '2026-01-29 01:40:00', 
    117, 'Success', 0, NULL, 
    NULL, 50185881967, 19606, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-28 23:14:00', '2026-01-29 00:55:00', 
    101, 'Success', 0, NULL, 
    NULL, 53070353386, 3241, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-28 00:23:00', '2026-01-28 02:14:00', 
    111, 'Success', 0, NULL, 
    NULL, 38507690768, 18763, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-28 23:21:00', '2026-01-29 00:10:00', 
    49, 'Success', 0, NULL, 
    NULL, 25537588561, 45947, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-28 23:48:00', '2026-01-29 02:22:00', 
    154, 'Success', 0, NULL, 
    NULL, 29240596803, 12330, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-28 00:29:00', '2026-01-28 02:09:00', 
    100, 'Success', 0, NULL, 
    NULL, 20230467777, 42912, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-28 01:25:00', '2026-01-28 03:23:00', 
    118, 'Success', 0, NULL, 
    NULL, 45551272331, 13561, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-28 01:43:00', '2026-01-28 03:57:00', 
    134, 'Success', 0, NULL, 
    NULL, 34080384583, 39674, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-28 00:46:00', '2026-01-28 01:15:00', 
    29, 'Success', 0, NULL, 
    NULL, 26439363691, 18052, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-28 02:23:00', '2026-01-28 02:40:00', 
    17, 'Success', 0, NULL, 
    NULL, 35262929365, 3409, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-28 01:05:00', '2026-01-28 03:38:00', 
    153, 'Success', 0, NULL, 
    NULL, 33687559673, 5730, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-28 23:08:00', '2026-01-29 01:05:00', 
    117, 'Success', 0, NULL, 
    NULL, 36830135782, 7764, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-28 02:51:00', '2026-01-28 05:21:00', 
    150, 'Success', 0, NULL, 
    NULL, 28330159548, 18859, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-28 02:32:00', '2026-01-28 05:26:00', 
    174, 'Success', 0, NULL, 
    NULL, 20524179304, 10269, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-28 23:09:00', '2026-01-28 23:53:00', 
    44, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 8612398964, 27837, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-28 23:59:00', '2026-01-29 01:02:00', 
    63, 'Success', 0, NULL, 
    NULL, 46620293661, 19266, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-28 00:08:00', '2026-01-28 00:46:00', 
    38, 'Success', 0, NULL, 
    NULL, 6883914887, 28144, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-28 02:59:00', '2026-01-28 05:57:00', 
    178, 'Success', 0, NULL, 
    NULL, 8476322395, 1699, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-28 01:32:00', '2026-01-28 02:29:00', 
    57, 'Success', 0, NULL, 
    NULL, 20303377959, 20714, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-28 23:44:00', '2026-01-29 01:23:00', 
    99, 'Success', 0, NULL, 
    NULL, 5580284914, 27208, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-28 01:44:00', '2026-01-28 03:12:00', 
    88, 'Success', 0, NULL, 
    NULL, 35474617681, 35031, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-28 00:00:00', '2026-01-28 01:33:00', 
    93, 'Success', 0, NULL, 
    NULL, 22001090920, 14950, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-28 02:55:00', '2026-01-28 05:02:00', 
    127, 'Success', 0, NULL, 
    NULL, 22809200206, 10370, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-28 02:23:00', '2026-01-28 04:51:00', 
    148, 'Success', 0, NULL, 
    NULL, 25394770559, 34297, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-28 23:11:00', '2026-01-29 02:03:00', 
    172, 'Success', 0, NULL, 
    NULL, 42947205553, 24544, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-28 23:05:00', '2026-01-29 01:16:00', 
    131, 'Success', 0, NULL, 
    NULL, 18384555522, 19737, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-28 23:41:00', '2026-01-29 01:18:00', 
    97, 'Success', 0, NULL, 
    NULL, 16932307715, 20351, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-28 02:36:00', '2026-01-28 04:45:00', 
    129, 'Success', 0, NULL, 
    NULL, 49949492651, 6170, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-28 23:22:00', '2026-01-29 00:16:00', 
    54, 'Success', 0, NULL, 
    NULL, 36591676586, 28979, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-28 02:12:00', '2026-01-28 03:03:00', 
    51, 'Success', 0, NULL, 
    NULL, 17167285325, 45842, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-28 02:21:00', '2026-01-28 04:19:00', 
    118, 'Success', 0, NULL, 
    NULL, 53156855385, 27329, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-28 23:50:00', '2026-01-29 00:20:00', 
    30, 'Success', 0, NULL, 
    NULL, 51951397672, 14247, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-28 01:50:00', '2026-01-28 03:46:00', 
    116, 'Success', 0, NULL, 
    NULL, 19027575073, 26283, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-28 01:40:00', '2026-01-28 03:20:00', 
    100, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 30087507938, 7168, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-29 02:52:00', '2026-01-29 05:35:00', 
    163, 'Success', 0, NULL, 
    NULL, 29090330898, 14590, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-29 02:50:00', '2026-01-29 03:24:00', 
    34, 'Success', 0, NULL, 
    NULL, 38372257700, 21448, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-29 01:30:00', '2026-01-29 02:38:00', 
    68, 'Success', 0, NULL, 
    NULL, 53022785203, 15047, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-29 01:52:00', '2026-01-29 03:56:00', 
    124, 'Success', 0, NULL, 
    NULL, 11552653250, 12238, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-29 01:10:00', '2026-01-29 02:43:00', 
    93, 'Success', 0, NULL, 
    NULL, 38811276671, 17152, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-29 00:23:00', '2026-01-29 01:20:00', 
    57, 'Success', 0, NULL, 
    NULL, 28912078394, 49745, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-29 02:36:00', '2026-01-29 04:54:00', 
    138, 'Success', 0, NULL, 
    NULL, 35256993662, 4894, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-29 23:38:00', '2026-01-30 00:18:00', 
    40, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 28637662630, 21949, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-29 23:57:00', '2026-01-30 00:17:00', 
    20, 'Success', 0, NULL, 
    NULL, 51823989680, 8123, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-29 02:52:00', '2026-01-29 05:28:00', 
    156, 'Success', 0, NULL, 
    NULL, 22072144717, 48856, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-29 23:16:00', '2026-01-30 02:15:00', 
    179, 'Success', 0, NULL, 
    NULL, 32265928672, 8484, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-29 23:49:00', '2026-01-30 02:47:00', 
    178, 'Success', 0, NULL, 
    NULL, 10963849053, 20975, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-29 02:15:00', '2026-01-29 04:12:00', 
    117, 'Success', 0, NULL, 
    NULL, 24922314405, 24332, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-29 23:15:00', '2026-01-30 01:48:00', 
    153, 'Success', 0, NULL, 
    NULL, 18320364023, 36975, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-29 02:53:00', '2026-01-29 04:16:00', 
    83, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 11805020422, 36822, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-29 23:01:00', '2026-01-29 23:49:00', 
    48, 'Success', 0, NULL, 
    NULL, 49633875879, 43445, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-29 23:22:00', '2026-01-30 02:12:00', 
    170, 'Success', 0, NULL, 
    NULL, 11120581668, 12608, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-29 00:24:00', '2026-01-29 00:57:00', 
    33, 'Success', 0, NULL, 
    NULL, 51372332907, 36385, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-29 02:03:00', '2026-01-29 03:26:00', 
    83, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 13110923026, 12042, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-29 23:36:00', '2026-01-30 02:22:00', 
    166, 'Success', 0, NULL, 
    NULL, 53031776296, 16218, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-29 00:13:00', '2026-01-29 01:05:00', 
    52, 'Success', 0, NULL, 
    NULL, 34572877776, 23859, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-29 01:34:00', '2026-01-29 03:53:00', 
    139, 'Success', 0, NULL, 
    NULL, 15965733692, 32111, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-29 23:22:00', '2026-01-30 00:34:00', 
    72, 'Success', 0, NULL, 
    NULL, 31159063100, 25500, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-29 02:31:00', '2026-01-29 03:37:00', 
    66, 'Success', 0, NULL, 
    NULL, 39063118951, 49262, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-29 23:21:00', '2026-01-30 01:09:00', 
    108, 'Success', 0, NULL, 
    NULL, 36448772432, 13159, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-29 02:31:00', '2026-01-29 03:12:00', 
    41, 'Success', 0, NULL, 
    NULL, 49379756451, 36670, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-29 00:02:00', '2026-01-29 00:45:00', 
    43, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 35065653267, 22586, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-29 23:43:00', '2026-01-29 23:55:00', 
    12, 'Success', 0, NULL, 
    NULL, 38847897353, 9743, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-29 00:05:00', '2026-01-29 02:53:00', 
    168, 'Success', 0, NULL, 
    NULL, 7004444559, 39112, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-29 00:35:00', '2026-01-29 03:23:00', 
    168, 'Success', 0, NULL, 
    NULL, 16218627780, 33682, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-29 00:38:00', '2026-01-29 03:10:00', 
    152, 'Success', 0, NULL, 
    NULL, 16926378032, 30115, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-29 23:05:00', '2026-01-30 01:28:00', 
    143, 'Success', 0, NULL, 
    NULL, 9006914011, 6932, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-29 02:37:00', '2026-01-29 03:48:00', 
    71, 'Success', 0, NULL, 
    NULL, 45406076175, 47133, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-29 00:41:00', '2026-01-29 02:30:00', 
    109, 'Success', 0, NULL, 
    NULL, 17989635630, 2806, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-29 23:46:00', '2026-01-30 01:14:00', 
    88, 'Success', 0, NULL, 
    NULL, 25879413577, 37043, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-29 01:45:00', '2026-01-29 03:30:00', 
    105, 'Success', 0, NULL, 
    NULL, 9400178048, 46024, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-29 02:17:00', '2026-01-29 04:45:00', 
    148, 'Success', 0, NULL, 
    NULL, 36077214111, 35370, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-29 00:00:00', '2026-01-29 02:43:00', 
    163, 'Success', 0, NULL, 
    NULL, 6609693426, 47138, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-29 23:04:00', '2026-01-29 23:58:00', 
    54, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 13564821531, 34255, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-29 23:44:00', '2026-01-30 01:22:00', 
    98, 'Success', 0, NULL, 
    NULL, 18029730995, 11968, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-29 02:40:00', '2026-01-29 04:42:00', 
    122, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 6531701031, 15825, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-30 00:52:00', '2026-01-30 02:43:00', 
    111, 'Success', 0, NULL, 
    NULL, 12446290322, 37182, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-30 02:45:00', '2026-01-30 05:35:00', 
    170, 'Success', 0, NULL, 
    NULL, 24024778018, 20455, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-30 00:37:00', '2026-01-30 00:51:00', 
    14, 'Success', 0, NULL, 
    NULL, 13405338784, 15453, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-30 00:37:00', '2026-01-30 02:19:00', 
    102, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 36722639520, 29331, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-30 01:09:00', '2026-01-30 02:55:00', 
    106, 'Success', 0, NULL, 
    NULL, 40547927546, 33989, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-30 00:30:00', '2026-01-30 02:59:00', 
    149, 'Success', 0, NULL, 
    NULL, 36914340091, 34058, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-30 01:42:00', '2026-01-30 03:00:00', 
    78, 'Success', 0, NULL, 
    NULL, 9568923766, 46319, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-30 02:47:00', '2026-01-30 04:09:00', 
    82, 'Success', 0, NULL, 
    NULL, 40045532182, 24938, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-30 01:52:00', '2026-01-30 02:38:00', 
    46, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 39998652139, 2104, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-30 00:45:00', '2026-01-30 02:33:00', 
    108, 'Success', 0, NULL, 
    NULL, 34367335409, 46405, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-30 00:42:00', '2026-01-30 02:22:00', 
    100, 'Failed', 1, '1', 
    'backup failed with general error, exit status = 1', 46678897053, 41624, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-30 23:59:00', '2026-01-31 00:49:00', 
    50, 'Success', 0, NULL, 
    NULL, 10850435102, 1906, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-30 23:42:00', '2026-01-31 01:22:00', 
    100, 'Success', 0, NULL, 
    NULL, 36593056835, 40438, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-30 00:17:00', '2026-01-30 03:16:00', 
    179, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 9658132686, 16197, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-30 02:23:00', '2026-01-30 03:36:00', 
    73, 'Success', 0, NULL, 
    NULL, 38804699013, 29634, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-30 02:25:00', '2026-01-30 04:35:00', 
    130, 'Success', 0, NULL, 
    NULL, 45222112238, 22107, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-30 00:13:00', '2026-01-30 00:40:00', 
    27, 'Success', 0, NULL, 
    NULL, 16176452710, 12328, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-30 01:41:00', '2026-01-30 01:51:00', 
    10, 'Success', 0, NULL, 
    NULL, 31655580788, 25249, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-30 00:16:00', '2026-01-30 01:44:00', 
    88, 'Success', 0, NULL, 
    NULL, 28924533920, 36190, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-30 01:50:00', '2026-01-30 02:28:00', 
    38, 'Success', 0, NULL, 
    NULL, 21946235934, 40485, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-30 01:27:00', '2026-01-30 04:17:00', 
    170, 'Success', 0, NULL, 
    NULL, 45004236849, 32065, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-30 00:07:00', '2026-01-30 01:23:00', 
    76, 'Success', 0, NULL, 
    NULL, 25750648526, 30443, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-30 23:03:00', '2026-01-31 01:35:00', 
    152, 'Success', 0, NULL, 
    NULL, 44095276087, 20439, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-30 23:57:00', '2026-01-31 00:31:00', 
    34, 'Success', 0, NULL, 
    NULL, 16674770467, 7448, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-30 23:06:00', '2026-01-31 01:16:00', 
    130, 'Success', 0, NULL, 
    NULL, 21400315512, 18312, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-30 01:48:00', '2026-01-30 02:26:00', 
    38, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 7264950005, 21584, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-30 02:40:00', '2026-01-30 04:00:00', 
    80, 'Success', 0, NULL, 
    NULL, 40773717208, 6175, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-30 02:24:00', '2026-01-30 04:34:00', 
    130, 'Success', 0, NULL, 
    NULL, 26232848364, 34697, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-30 02:45:00', '2026-01-30 02:57:00', 
    12, 'Success', 0, NULL, 
    NULL, 50610854476, 32745, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-30 02:19:00', '2026-01-30 04:56:00', 
    157, 'Success', 0, NULL, 
    NULL, 44019887237, 35352, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-30 01:37:00', '2026-01-30 02:32:00', 
    55, 'Success', 0, NULL, 
    NULL, 52205786016, 6815, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-30 01:06:00', '2026-01-30 03:47:00', 
    161, 'Success', 0, NULL, 
    NULL, 41563907055, 33115, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-30 02:58:00', '2026-01-30 04:20:00', 
    82, 'Success', 0, NULL, 
    NULL, 11445003132, 37443, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-30 01:20:00', '2026-01-30 03:04:00', 
    104, 'Success', 0, NULL, 
    NULL, 26936661227, 11453, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-30 00:20:00', '2026-01-30 00:39:00', 
    19, 'Success', 0, NULL, 
    NULL, 31194503133, 38700, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-30 23:55:00', '2026-01-31 00:51:00', 
    56, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 35458975185, 5186, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-30 23:22:00', '2026-01-31 00:02:00', 
    40, 'Success', 0, NULL, 
    NULL, 53257538186, 16421, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-30 23:56:00', '2026-01-31 02:51:00', 
    175, 'Success', 0, NULL, 
    NULL, 24224518502, 16357, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-30 23:36:00', '2026-01-31 00:13:00', 
    37, 'Success', 0, NULL, 
    NULL, 38112569231, 43679, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-30 02:06:00', '2026-01-30 02:16:00', 
    10, 'Success', 0, NULL, 
    NULL, 46703063611, 21199, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-30 02:21:00', '2026-01-30 02:57:00', 
    36, 'Success', 0, NULL, 
    NULL, 23183673612, 26572, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-01-31 01:55:00', '2026-01-31 04:30:00', 
    155, 'Success', 0, NULL, 
    NULL, 24623363506, 43590, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-01-31 23:16:00', '2026-02-01 01:08:00', 
    112, 'Success', 0, NULL, 
    NULL, 28788994183, 10577, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-01-31 01:20:00', '2026-01-31 04:15:00', 
    175, 'Success', 0, NULL, 
    NULL, 13276875986, 37695, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-01-31 00:58:00', '2026-01-31 02:24:00', 
    86, 'Success', 0, NULL, 
    NULL, 17917579674, 47272, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-01-31 02:02:00', '2026-01-31 03:20:00', 
    78, 'Success', 0, NULL, 
    NULL, 27540270656, 49770, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-01-31 01:05:00', '2026-01-31 01:20:00', 
    15, 'Success', 0, NULL, 
    NULL, 38674961961, 11264, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-01-31 02:46:00', '2026-01-31 03:47:00', 
    61, 'Success', 0, NULL, 
    NULL, 34469676059, 32583, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-01-31 02:14:00', '2026-01-31 02:26:00', 
    12, 'Success', 0, NULL, 
    NULL, 52477251891, 13896, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-01-31 23:56:00', '2026-02-01 02:36:00', 
    160, 'Success', 0, NULL, 
    NULL, 15952296133, 12237, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-01-31 00:47:00', '2026-01-31 01:21:00', 
    34, 'Success', 0, NULL, 
    NULL, 40796933109, 37372, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-01-31 01:12:00', '2026-01-31 01:37:00', 
    25, 'Success', 0, NULL, 
    NULL, 48114220021, 10039, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-01-31 00:27:00', '2026-01-31 01:22:00', 
    55, 'Success', 0, NULL, 
    NULL, 6183164217, 29822, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-01-31 02:52:00', '2026-01-31 03:30:00', 
    38, 'Success', 0, NULL, 
    NULL, 46108725400, 22243, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-01-31 02:08:00', '2026-01-31 04:18:00', 
    130, 'Success', 0, NULL, 
    NULL, 5370524673, 14679, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-01-31 01:19:00', '2026-01-31 03:50:00', 
    151, 'Success', 0, NULL, 
    NULL, 47283580749, 11703, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-01-31 02:34:00', '2026-01-31 04:07:00', 
    93, 'Success', 0, NULL, 
    NULL, 42971064152, 18947, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-01-31 23:56:00', '2026-02-01 00:20:00', 
    24, 'Success', 0, NULL, 
    NULL, 26999824652, 22428, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-01-31 23:06:00', '2026-01-31 23:49:00', 
    43, 'Success', 0, NULL, 
    NULL, 42244564603, 3124, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-01-31 00:15:00', '2026-01-31 02:00:00', 
    105, 'Success', 0, NULL, 
    NULL, 22250210455, 44617, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-01-31 02:13:00', '2026-01-31 03:23:00', 
    70, 'Success', 0, NULL, 
    NULL, 47643810697, 23966, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-01-31 02:01:00', '2026-01-31 02:34:00', 
    33, 'Success', 0, NULL, 
    NULL, 45013071272, 5173, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-01-31 02:57:00', '2026-01-31 05:43:00', 
    166, 'Success', 0, NULL, 
    NULL, 49728424991, 40242, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-01-31 01:24:00', '2026-01-31 03:55:00', 
    151, 'Success', 0, NULL, 
    NULL, 53509141467, 22288, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-01-31 01:18:00', '2026-01-31 01:43:00', 
    25, 'Success', 0, NULL, 
    NULL, 15189980938, 14086, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-01-31 23:50:00', '2026-02-01 01:21:00', 
    91, 'Success', 0, NULL, 
    NULL, 16447892494, 44413, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-01-31 23:15:00', '2026-01-31 23:57:00', 
    42, 'Success', 0, NULL, 
    NULL, 7853483948, 29858, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-01-31 23:55:00', '2026-02-01 01:11:00', 
    76, 'Success', 0, NULL, 
    NULL, 47477561009, 42335, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-01-31 00:24:00', '2026-01-31 02:28:00', 
    124, 'Success', 0, NULL, 
    NULL, 32242134218, 37609, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-01-31 00:35:00', '2026-01-31 02:17:00', 
    102, 'Success', 0, NULL, 
    NULL, 46327660491, 8394, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-01-31 01:09:00', '2026-01-31 02:06:00', 
    57, 'Success', 0, NULL, 
    NULL, 52534035693, 49295, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-01-31 23:19:00', '2026-02-01 00:33:00', 
    74, 'Success', 0, NULL, 
    NULL, 29586897099, 37333, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-01-31 23:35:00', '2026-02-01 00:49:00', 
    74, 'Success', 0, NULL, 
    NULL, 29008291115, 2680, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-01-31 00:25:00', '2026-01-31 00:36:00', 
    11, 'Success', 0, NULL, 
    NULL, 28108676116, 24508, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-01-31 02:47:00', '2026-01-31 05:19:00', 
    152, 'Success', 0, NULL, 
    NULL, 50672298699, 1028, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-01-31 02:44:00', '2026-01-31 05:17:00', 
    153, 'Success', 0, NULL, 
    NULL, 21953960176, 37552, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-01-31 23:12:00', '2026-02-01 00:02:00', 
    50, 'Success', 0, NULL, 
    NULL, 10871010406, 3667, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-01-31 02:42:00', '2026-01-31 05:42:00', 
    180, 'Success', 0, NULL, 
    NULL, 49977891595, 35577, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-01-31 02:51:00', '2026-01-31 03:38:00', 
    47, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 26862303277, 18644, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-01-31 00:32:00', '2026-01-31 01:57:00', 
    85, 'Success', 0, NULL, 
    NULL, 21966037029, 12979, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-01-31 23:56:00', '2026-02-01 01:18:00', 
    82, 'Success', 0, NULL, 
    NULL, 14074792848, 16015, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-01-31 02:37:00', '2026-01-31 03:34:00', 
    57, 'Success', 0, NULL, 
    NULL, 45842771285, 22894, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'WEEKLY_FULL', 'SAMSUNG_DB01_Full', 'Full',
    '2026-02-01 01:39:00', '2026-02-01 03:27:00', 
    108, 'Success', 0, NULL, 
    NULL, 449468896642, 1097, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'WEEKLY_FULL', 'SAMSUNG_DB02_Full', 'Full',
    '2026-02-01 02:12:00', '2026-02-01 03:28:00', 
    76, 'Success', 0, NULL, 
    NULL, 114768259207, 46771, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'WEEKLY_FULL', 'SAMSUNG_WEB01_Full', 'Full',
    '2026-02-01 00:39:00', '2026-02-01 02:35:00', 
    116, 'Success', 0, NULL, 
    NULL, 345667225368, 23330, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'WEEKLY_FULL', 'SAMSUNG_WEB02_Full', 'Full',
    '2026-02-01 01:15:00', '2026-02-01 02:11:00', 
    56, 'Success', 0, NULL, 
    NULL, 384616348714, 31476, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'WEEKLY_FULL', 'SAMSUNG_APP01_Full', 'Full',
    '2026-02-01 02:37:00', '2026-02-01 05:33:00', 
    176, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 227153963050, 31961, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'WEEKLY_FULL', 'LG_DB01_Full', 'Full',
    '2026-02-01 01:46:00', '2026-02-01 04:02:00', 
    136, 'Failed', 1, '1', 
    'backup failed with general error, exit status = 1', 161095113868, 19567, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'WEEKLY_FULL', 'LG_WEB01_Full', 'Full',
    '2026-02-01 00:29:00', '2026-02-01 01:23:00', 
    54, 'Success', 0, NULL, 
    NULL, 274652364162, 13180, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'WEEKLY_FULL', 'LG_APP01_Full', 'Full',
    '2026-02-01 02:57:00', '2026-02-01 03:38:00', 
    41, 'Success', 0, NULL, 
    NULL, 77248003668, 49283, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'WEEKLY_FULL', 'LG_FILE01_Full', 'Full',
    '2026-02-01 00:40:00', '2026-02-01 03:29:00', 
    169, 'Success', 0, NULL, 
    NULL, 403997331909, 7749, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'WEEKLY_FULL', 'SKHYNIX_DB01_Full', 'Full',
    '2026-02-01 01:13:00', '2026-02-01 02:02:00', 
    49, 'Success', 0, NULL, 
    NULL, 498247050801, 49680, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'WEEKLY_FULL', 'SKHYNIX_DB02_Full', 'Full',
    '2026-02-01 00:44:00', '2026-02-01 01:52:00', 
    68, 'Success', 0, NULL, 
    NULL, 114250538612, 36152, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'WEEKLY_FULL', 'SKHYNIX_APP01_Full', 'Full',
    '2026-02-01 23:24:00', '2026-02-01 23:51:00', 
    27, 'Success', 0, NULL, 
    NULL, 353158299728, 33014, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'WEEKLY_FULL', 'SKHYNIX_APP02_Full', 'Full',
    '2026-02-01 02:00:00', '2026-02-01 02:54:00', 
    54, 'Success', 0, NULL, 
    NULL, 229440453215, 9162, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'WEEKLY_FULL', 'HYUNDAI_DB01_Full', 'Full',
    '2026-02-01 01:20:00', '2026-02-01 02:29:00', 
    69, 'Success', 0, NULL, 
    NULL, 474825922620, 36087, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'WEEKLY_FULL', 'HYUNDAI_DB02_Full', 'Full',
    '2026-02-01 01:59:00', '2026-02-01 02:54:00', 
    55, 'Success', 0, NULL, 
    NULL, 475221935255, 35222, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'WEEKLY_FULL', 'HYUNDAI_DB03_Full', 'Full',
    '2026-02-01 00:46:00', '2026-02-01 00:58:00', 
    12, 'Success', 0, NULL, 
    NULL, 202718508776, 46727, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'WEEKLY_FULL', 'HYUNDAI_WEB01_Full', 'Full',
    '2026-02-01 01:00:00', '2026-02-01 03:40:00', 
    160, 'Success', 0, NULL, 
    NULL, 294859002086, 31639, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'WEEKLY_FULL', 'HYUNDAI_APP01_Full', 'Full',
    '2026-02-01 23:52:00', '2026-02-02 01:11:00', 
    79, 'Success', 0, NULL, 
    NULL, 281102813978, 1770, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'WEEKLY_FULL', 'HYUNDAI_FILE01_Full', 'Full',
    '2026-02-01 02:08:00', '2026-02-01 03:28:00', 
    80, 'Success', 0, NULL, 
    NULL, 94241357708, 29838, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'WEEKLY_FULL', 'POSCO_DB01_Full', 'Full',
    '2026-02-01 23:43:00', '2026-02-02 01:42:00', 
    119, 'Success', 0, NULL, 
    NULL, 86473561674, 22364, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'WEEKLY_FULL', 'POSCO_WEB01_Full', 'Full',
    '2026-02-01 23:09:00', '2026-02-02 01:20:00', 
    131, 'Success', 0, NULL, 
    NULL, 422608787056, 9560, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'WEEKLY_FULL', 'POSCO_APP01_Full', 'Full',
    '2026-02-01 02:42:00', '2026-02-01 04:25:00', 
    103, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 274619238835, 11838, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'WEEKLY_FULL', 'POSCO_FILE01_Full', 'Full',
    '2026-02-01 00:15:00', '2026-02-01 01:30:00', 
    75, 'Success', 0, NULL, 
    NULL, 123710200369, 29669, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'WEEKLY_FULL', 'NAVER_DB01_Full', 'Full',
    '2026-02-01 02:59:00', '2026-02-01 04:18:00', 
    79, 'Success', 0, NULL, 
    NULL, 285299173849, 48201, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'WEEKLY_FULL', 'NAVER_WEB01_Full', 'Full',
    '2026-02-01 23:42:00', '2026-02-02 00:05:00', 
    23, 'Success', 0, NULL, 
    NULL, 381672219183, 23274, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'WEEKLY_FULL', 'NAVER_WEB02_Full', 'Full',
    '2026-02-01 00:37:00', '2026-02-01 02:56:00', 
    139, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 61696660437, 26765, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'WEEKLY_FULL', 'NAVER_APP01_Full', 'Full',
    '2026-02-01 02:46:00', '2026-02-01 04:04:00', 
    78, 'Success', 0, NULL, 
    NULL, 195064575893, 10729, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'WEEKLY_FULL', 'KAKAO_DB01_Full', 'Full',
    '2026-02-01 02:02:00', '2026-02-01 02:49:00', 
    47, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 437091300434, 27061, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'WEEKLY_FULL', 'KAKAO_WEB01_Full', 'Full',
    '2026-02-01 00:06:00', '2026-02-01 01:29:00', 
    83, 'Success', 0, NULL, 
    NULL, 215998968268, 44344, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'WEEKLY_FULL', 'KAKAO_APP01_Full', 'Full',
    '2026-02-01 01:43:00', '2026-02-01 02:38:00', 
    55, 'Success', 0, NULL, 
    NULL, 142027998021, 5923, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'WEEKLY_FULL', 'COUPANG_DB01_Full', 'Full',
    '2026-02-01 01:46:00', '2026-02-01 03:59:00', 
    133, 'Success', 0, NULL, 
    NULL, 359271789255, 21823, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'WEEKLY_FULL', 'COUPANG_DB02_Full', 'Full',
    '2026-02-01 23:00:00', '2026-02-02 00:33:00', 
    93, 'Success', 0, NULL, 
    NULL, 238652160517, 25654, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'WEEKLY_FULL', 'COUPANG_WEB01_Full', 'Full',
    '2026-02-01 01:15:00', '2026-02-01 02:13:00', 
    58, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 469169251192, 12694, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'WEEKLY_FULL', 'COUPANG_WEB02_Full', 'Full',
    '2026-02-01 00:58:00', '2026-02-01 03:00:00', 
    122, 'Success', 0, NULL, 
    NULL, 456014945482, 41302, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'WEEKLY_FULL', 'COUPANG_APP01_Full', 'Full',
    '2026-02-01 01:22:00', '2026-02-01 03:52:00', 
    150, 'Success', 0, NULL, 
    NULL, 297105813610, 8486, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'WEEKLY_FULL', 'COUPANG_FILE01_Full', 'Full',
    '2026-02-01 01:02:00', '2026-02-01 01:23:00', 
    21, 'Success', 0, NULL, 
    NULL, 245310172202, 47712, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'WEEKLY_FULL', 'BAEMIN_DB01_Full', 'Full',
    '2026-02-01 00:27:00', '2026-02-01 03:03:00', 
    156, 'Success', 0, NULL, 
    NULL, 228674467190, 33800, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'WEEKLY_FULL', 'BAEMIN_WEB01_Full', 'Full',
    '2026-02-01 23:05:00', '2026-02-02 00:39:00', 
    94, 'Success', 0, NULL, 
    NULL, 300278442514, 34490, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'WEEKLY_FULL', 'BAEMIN_APP01_Full', 'Full',
    '2026-02-01 00:06:00', '2026-02-01 02:07:00', 
    121, 'Success', 0, NULL, 
    NULL, 512741846279, 15864, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'WEEKLY_FULL', 'WOOWA_DB01_Full', 'Full',
    '2026-02-01 01:38:00', '2026-02-01 02:32:00', 
    54, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 319875189700, 31318, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'WEEKLY_FULL', 'WOOWA_WEB01_Full', 'Full',
    '2026-02-01 00:07:00', '2026-02-01 03:03:00', 
    176, 'Success', 0, NULL, 
    NULL, 450803254736, 6821, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-02-02 02:53:00', '2026-02-02 05:17:00', 
    144, 'Success', 0, NULL, 
    NULL, 14679452529, 3607, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-02-02 02:04:00', '2026-02-02 04:30:00', 
    146, 'Success', 0, NULL, 
    NULL, 38424106831, 36381, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-02-02 02:20:00', '2026-02-02 03:38:00', 
    78, 'Success', 0, NULL, 
    NULL, 43099167419, 19860, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-02-02 23:35:00', '2026-02-03 00:16:00', 
    41, 'Success', 0, NULL, 
    NULL, 11416678782, 25305, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-02-02 00:38:00', '2026-02-02 02:20:00', 
    102, 'Success', 0, NULL, 
    NULL, 27730303306, 34084, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-02-02 02:53:00', '2026-02-02 04:58:00', 
    125, 'Success', 0, NULL, 
    NULL, 46800557898, 33347, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-02-02 01:02:00', '2026-02-02 01:30:00', 
    28, 'Success', 0, NULL, 
    NULL, 14568904651, 38547, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-02-02 01:43:00', '2026-02-02 04:33:00', 
    170, 'Success', 0, NULL, 
    NULL, 52675807853, 18464, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-02-02 02:48:00', '2026-02-02 03:03:00', 
    15, 'Success', 0, NULL, 
    NULL, 49496382442, 47054, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-02-02 01:29:00', '2026-02-02 04:22:00', 
    173, 'Success', 0, NULL, 
    NULL, 30258875729, 49971, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-02-02 23:16:00', '2026-02-03 00:43:00', 
    87, 'Success', 0, NULL, 
    NULL, 19463458291, 47190, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-02-02 02:16:00', '2026-02-02 03:45:00', 
    89, 'Success', 0, NULL, 
    NULL, 33078508653, 14881, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-02-02 01:03:00', '2026-02-02 01:44:00', 
    41, 'Success', 0, NULL, 
    NULL, 10264854616, 37269, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-02-02 00:34:00', '2026-02-02 01:50:00', 
    76, 'Success', 0, NULL, 
    NULL, 26767437446, 7934, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-02-02 23:34:00', '2026-02-03 00:46:00', 
    72, 'Success', 0, NULL, 
    NULL, 34057416091, 33154, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-02-02 02:01:00', '2026-02-02 03:49:00', 
    108, 'Success', 0, NULL, 
    NULL, 43582548747, 35588, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-02-02 02:46:00', '2026-02-02 03:53:00', 
    67, 'Success', 0, NULL, 
    NULL, 26625535878, 21160, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-02-02 01:55:00', '2026-02-02 03:34:00', 
    99, 'Success', 0, NULL, 
    NULL, 30542434056, 43195, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-02-02 02:40:00', '2026-02-02 03:07:00', 
    27, 'Success', 0, NULL, 
    NULL, 12857292258, 48548, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-02-02 00:59:00', '2026-02-02 03:46:00', 
    167, 'Success', 0, NULL, 
    NULL, 33071967523, 30122, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-02-02 01:14:00', '2026-02-02 02:46:00', 
    92, 'Success', 0, NULL, 
    NULL, 48680392059, 27802, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-02-02 01:46:00', '2026-02-02 02:06:00', 
    20, 'Success', 0, NULL, 
    NULL, 11201104109, 39827, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-02-02 01:51:00', '2026-02-02 03:18:00', 
    87, 'Success', 0, NULL, 
    NULL, 16952615383, 20473, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-02-02 02:52:00', '2026-02-02 05:01:00', 
    129, 'Success', 0, NULL, 
    NULL, 18172604565, 43523, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-02-02 23:54:00', '2026-02-03 00:09:00', 
    15, 'Success', 0, NULL, 
    NULL, 7457647191, 45016, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-02-02 00:21:00', '2026-02-02 01:49:00', 
    88, 'Success', 0, NULL, 
    NULL, 48284689250, 26737, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-02-02 02:42:00', '2026-02-02 05:02:00', 
    140, 'Success', 0, NULL, 
    NULL, 17074076343, 13706, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-02-02 02:17:00', '2026-02-02 04:50:00', 
    153, 'Success', 0, NULL, 
    NULL, 31488203130, 15413, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-02-02 00:33:00', '2026-02-02 02:29:00', 
    116, 'Success', 0, NULL, 
    NULL, 48466324469, 26087, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-02-02 23:50:00', '2026-02-03 01:57:00', 
    127, 'Success', 0, NULL, 
    NULL, 20560175061, 32850, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-02-02 02:13:00', '2026-02-02 03:09:00', 
    56, 'Success', 0, NULL, 
    NULL, 45825558179, 41472, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-02-02 23:27:00', '2026-02-03 01:43:00', 
    136, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 14275381590, 4301, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-02-02 01:01:00', '2026-02-02 03:02:00', 
    121, 'Success', 0, NULL, 
    NULL, 32393991048, 42261, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-02-02 01:16:00', '2026-02-02 03:49:00', 
    153, 'Success', 0, NULL, 
    NULL, 40789462384, 5676, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-02-02 23:29:00', '2026-02-03 00:52:00', 
    83, 'Success', 0, NULL, 
    NULL, 27813330779, 17597, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-02-02 01:05:00', '2026-02-02 01:49:00', 
    44, 'Success', 0, NULL, 
    NULL, 19515548629, 38809, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-02-02 01:36:00', '2026-02-02 03:38:00', 
    122, 'Success', 0, NULL, 
    NULL, 34445825177, 3562, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-02-02 00:54:00', '2026-02-02 02:20:00', 
    86, 'Success', 0, NULL, 
    NULL, 7292178531, 35068, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-02-02 02:19:00', '2026-02-02 03:36:00', 
    77, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 44968964074, 12030, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-02-02 23:46:00', '2026-02-03 00:11:00', 
    25, 'Success', 0, NULL, 
    NULL, 6862086270, 25416, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-02-02 02:02:00', '2026-02-02 02:42:00', 
    40, 'Success', 0, NULL, 
    NULL, 51254540541, 26240, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-02-03 23:26:00', '2026-02-04 01:02:00', 
    96, 'Success', 0, NULL, 
    NULL, 6096411928, 29085, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-02-03 02:57:00', '2026-02-03 04:06:00', 
    69, 'Success', 0, NULL, 
    NULL, 11113580284, 32710, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-02-03 02:55:00', '2026-02-03 05:23:00', 
    148, 'Success', 0, NULL, 
    NULL, 15010618548, 5593, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-02-03 23:07:00', '2026-02-04 01:03:00', 
    116, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 29414772661, 5025, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-02-03 02:53:00', '2026-02-03 03:19:00', 
    26, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 45300946898, 9988, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-02-03 00:01:00', '2026-02-03 00:30:00', 
    29, 'Success', 0, NULL, 
    NULL, 24311596670, 9100, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-02-03 00:30:00', '2026-02-03 01:56:00', 
    86, 'Success', 0, NULL, 
    NULL, 14686230992, 30314, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-02-03 01:36:00', '2026-02-03 03:11:00', 
    95, 'Success', 0, NULL, 
    NULL, 47120675414, 36344, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-02-03 01:14:00', '2026-02-03 02:31:00', 
    77, 'Success', 0, NULL, 
    NULL, 26507516121, 2155, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-02-03 01:53:00', '2026-02-03 03:40:00', 
    107, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 22069480079, 14207, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-02-03 01:36:00', '2026-02-03 04:34:00', 
    178, 'Success', 0, NULL, 
    NULL, 38464557492, 24543, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-02-03 02:42:00', '2026-02-03 05:23:00', 
    161, 'Success', 0, NULL, 
    NULL, 17098456881, 17385, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-02-03 01:14:00', '2026-02-03 03:27:00', 
    133, 'Success', 0, NULL, 
    NULL, 7998298330, 13164, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-02-03 00:22:00', '2026-02-03 01:59:00', 
    97, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 44088793849, 37654, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-02-03 01:26:00', '2026-02-03 02:37:00', 
    71, 'Success', 0, NULL, 
    NULL, 29556225703, 7229, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-02-03 23:29:00', '2026-02-04 00:54:00', 
    85, 'Success', 0, NULL, 
    NULL, 45475559474, 2654, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-02-03 00:23:00', '2026-02-03 02:11:00', 
    108, 'Success', 0, NULL, 
    NULL, 44241136350, 42175, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-02-03 02:14:00', '2026-02-03 02:55:00', 
    41, 'Success', 0, NULL, 
    NULL, 17116976596, 44479, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-02-03 02:14:00', '2026-02-03 04:55:00', 
    161, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 31947480390, 46356, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-02-03 00:32:00', '2026-02-03 02:18:00', 
    106, 'Success', 0, NULL, 
    NULL, 42963474141, 45026, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-02-03 23:46:00', '2026-02-04 00:19:00', 
    33, 'Success', 0, NULL, 
    NULL, 18094238765, 7401, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-02-03 02:49:00', '2026-02-03 03:44:00', 
    55, 'Success', 0, NULL, 
    NULL, 42849893809, 9639, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-02-03 02:54:00', '2026-02-03 03:25:00', 
    31, 'Success', 0, NULL, 
    NULL, 12724386198, 9090, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-02-03 01:50:00', '2026-02-03 03:27:00', 
    97, 'Success', 0, NULL, 
    NULL, 47276446297, 42680, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-02-03 02:04:00', '2026-02-03 03:37:00', 
    93, 'Success', 0, NULL, 
    NULL, 37252828771, 42509, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-02-03 23:07:00', '2026-02-03 23:38:00', 
    31, 'Success', 0, NULL, 
    NULL, 51833708182, 29916, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-02-03 00:35:00', '2026-02-03 02:06:00', 
    91, 'Success', 0, NULL, 
    NULL, 49067645011, 1800, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-02-03 01:54:00', '2026-02-03 03:45:00', 
    111, 'Success', 0, NULL, 
    NULL, 17892385099, 27455, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-02-03 02:47:00', '2026-02-03 03:45:00', 
    58, 'Success', 0, NULL, 
    NULL, 15263077120, 42421, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-02-03 00:20:00', '2026-02-03 02:17:00', 
    117, 'Success', 0, NULL, 
    NULL, 12567808005, 20052, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-02-03 23:09:00', '2026-02-04 01:05:00', 
    116, 'Success', 0, NULL, 
    NULL, 14960534432, 10396, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-02-03 01:33:00', '2026-02-03 02:50:00', 
    77, 'Success', 0, NULL, 
    NULL, 27481269853, 46372, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-02-03 02:04:00', '2026-02-03 04:17:00', 
    133, 'Success', 0, NULL, 
    NULL, 43152974323, 27760, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-02-03 00:31:00', '2026-02-03 03:28:00', 
    177, 'Success', 0, NULL, 
    NULL, 52469629060, 13883, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-02-03 01:17:00', '2026-02-03 03:59:00', 
    162, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 41297511297, 4373, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-02-03 23:57:00', '2026-02-04 02:50:00', 
    173, 'Success', 0, NULL, 
    NULL, 11547663591, 47888, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-02-03 23:16:00', '2026-02-03 23:46:00', 
    30, 'Success', 0, NULL, 
    NULL, 27041565048, 2409, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-02-03 23:04:00', '2026-02-04 00:28:00', 
    84, 'Success', 0, NULL, 
    NULL, 40658479614, 7172, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-02-03 01:12:00', '2026-02-03 01:45:00', 
    33, 'Success', 0, NULL, 
    NULL, 46883882176, 1732, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-02-03 00:58:00', '2026-02-03 01:11:00', 
    13, 'Success', 0, NULL, 
    NULL, 47581795584, 22424, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-02-03 01:49:00', '2026-02-03 04:33:00', 
    164, 'Success', 0, NULL, 
    NULL, 6236018010, 21491, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-02-04 23:42:00', '2026-02-05 01:03:00', 
    81, 'Success', 0, NULL, 
    NULL, 7859580419, 46598, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-02-04 02:36:00', '2026-02-04 03:15:00', 
    39, 'Success', 0, NULL, 
    NULL, 51724903905, 3777, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-02-04 01:39:00', '2026-02-04 04:23:00', 
    164, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 44543004665, 14753, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-02-04 02:45:00', '2026-02-04 03:02:00', 
    17, 'Success', 0, NULL, 
    NULL, 53037564675, 16241, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-02-04 01:34:00', '2026-02-04 02:10:00', 
    36, 'Success', 0, NULL, 
    NULL, 40726611365, 19868, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-02-04 00:04:00', '2026-02-04 01:49:00', 
    105, 'Success', 0, NULL, 
    NULL, 31605763721, 21317, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-02-04 00:53:00', '2026-02-04 01:34:00', 
    41, 'Success', 0, NULL, 
    NULL, 43792087488, 17427, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-02-04 00:25:00', '2026-02-04 01:42:00', 
    77, 'Success', 0, NULL, 
    NULL, 29248186925, 17339, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-02-04 02:08:00', '2026-02-04 03:45:00', 
    97, 'Success', 0, NULL, 
    NULL, 14104153848, 23883, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-02-04 02:51:00', '2026-02-04 03:37:00', 
    46, 'Success', 0, NULL, 
    NULL, 8762963040, 1484, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-02-04 23:27:00', '2026-02-05 00:28:00', 
    61, 'Success', 0, NULL, 
    NULL, 9598457671, 45748, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-02-04 00:46:00', '2026-02-04 01:33:00', 
    47, 'Success', 0, NULL, 
    NULL, 15824939166, 13374, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-02-04 02:15:00', '2026-02-04 03:48:00', 
    93, 'Success', 0, NULL, 
    NULL, 8319584922, 30247, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-02-04 01:20:00', '2026-02-04 03:22:00', 
    122, 'Success', 0, NULL, 
    NULL, 14746720675, 39311, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-02-04 00:51:00', '2026-02-04 03:08:00', 
    137, 'Success', 0, NULL, 
    NULL, 30524003312, 46672, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-02-04 00:49:00', '2026-02-04 01:54:00', 
    65, 'Success', 0, NULL, 
    NULL, 10972737805, 24699, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-02-04 02:24:00', '2026-02-04 04:40:00', 
    136, 'Success', 0, NULL, 
    NULL, 31972183900, 27131, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-02-04 02:45:00', '2026-02-04 03:15:00', 
    30, 'Success', 0, NULL, 
    NULL, 18411655834, 21383, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-02-04 02:02:00', '2026-02-04 05:00:00', 
    178, 'Success', 0, NULL, 
    NULL, 46816593805, 15080, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-02-04 00:58:00', '2026-02-04 03:15:00', 
    137, 'Failed', 96, '96', 
    'client DB01 not responding, exit status = 96', 29117575910, 36667, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-02-04 00:19:00', '2026-02-04 01:59:00', 
    100, 'Success', 0, NULL, 
    NULL, 45395235893, 16223, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-02-04 01:46:00', '2026-02-04 02:13:00', 
    27, 'Success', 0, NULL, 
    NULL, 37471748360, 43859, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-02-04 01:04:00', '2026-02-04 03:50:00', 
    166, 'Success', 0, NULL, 
    NULL, 13485575892, 14987, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-02-04 00:31:00', '2026-02-04 02:33:00', 
    122, 'Success', 0, NULL, 
    NULL, 6239361639, 20015, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-02-04 00:11:00', '2026-02-04 02:14:00', 
    123, 'Success', 0, NULL, 
    NULL, 34147206487, 5841, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-02-04 23:59:00', '2026-02-05 00:27:00', 
    28, 'Success', 0, NULL, 
    NULL, 40730085747, 21604, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-02-04 00:03:00', '2026-02-04 02:32:00', 
    149, 'Success', 0, NULL, 
    NULL, 24575934767, 23469, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-02-04 01:41:00', '2026-02-04 02:31:00', 
    50, 'Success', 0, NULL, 
    NULL, 21901258813, 34598, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-02-04 02:08:00', '2026-02-04 02:18:00', 
    10, 'Success', 0, NULL, 
    NULL, 20109977722, 43185, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-02-04 02:23:00', '2026-02-04 04:48:00', 
    145, 'Success', 0, NULL, 
    NULL, 15262366102, 38391, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-02-04 01:50:00', '2026-02-04 02:17:00', 
    27, 'Success', 0, NULL, 
    NULL, 9347167280, 15738, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-02-04 23:41:00', '2026-02-04 23:58:00', 
    17, 'Success', 0, NULL, 
    NULL, 18230807190, 35819, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-02-04 02:51:00', '2026-02-04 04:35:00', 
    104, 'Success', 0, NULL, 
    NULL, 16006982748, 8608, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-02-04 23:13:00', '2026-02-05 01:56:00', 
    163, 'Success', 0, NULL, 
    NULL, 47076255416, 12927, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-02-04 00:22:00', '2026-02-04 03:18:00', 
    176, 'Success', 0, NULL, 
    NULL, 41247795004, 32905, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-02-04 02:30:00', '2026-02-04 03:38:00', 
    68, 'Failed', 1, '1', 
    'backup failed with general error, exit status = 1', 26206327876, 45548, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-02-04 01:39:00', '2026-02-04 04:06:00', 
    147, 'Success', 0, NULL, 
    NULL, 18930166405, 20041, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-02-04 01:39:00', '2026-02-04 02:22:00', 
    43, 'Success', 0, NULL, 
    NULL, 13288327342, 3504, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-02-04 02:09:00', '2026-02-04 02:27:00', 
    18, 'Success', 0, NULL, 
    NULL, 27921338026, 34532, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-02-04 01:35:00', '2026-02-04 02:46:00', 
    71, 'Success', 0, NULL, 
    NULL, 49738388283, 48200, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-02-04 02:53:00', '2026-02-04 03:35:00', 
    42, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 42931668077, 22247, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-02-05 01:25:00', '2026-02-05 02:54:00', 
    89, 'Success', 0, NULL, 
    NULL, 8442013538, 24713, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-02-05 02:58:00', '2026-02-05 04:02:00', 
    64, 'Success', 0, NULL, 
    NULL, 49205807281, 2591, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-02-05 02:47:00', '2026-02-05 05:43:00', 
    176, 'Success', 0, NULL, 
    NULL, 45094110817, 29318, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-02-05 23:14:00', '2026-02-06 01:27:00', 
    133, 'Success', 0, NULL, 
    NULL, 50099865997, 9766, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-02-05 00:13:00', '2026-02-05 01:54:00', 
    101, 'Success', 0, NULL, 
    NULL, 39824678956, 2268, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-02-05 00:08:00', '2026-02-05 00:53:00', 
    45, 'Success', 0, NULL, 
    NULL, 19582756602, 47773, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-02-05 01:15:00', '2026-02-05 01:58:00', 
    43, 'Success', 0, NULL, 
    NULL, 35672185113, 6150, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-02-05 00:49:00', '2026-02-05 02:18:00', 
    89, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 26800983157, 31838, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-02-05 23:02:00', '2026-02-06 00:55:00', 
    113, 'Success', 0, NULL, 
    NULL, 8941305068, 4681, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-02-05 02:02:00', '2026-02-05 03:06:00', 
    64, 'Success', 0, NULL, 
    NULL, 32681914531, 4012, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-02-05 01:16:00', '2026-02-05 01:46:00', 
    30, 'Success', 0, NULL, 
    NULL, 38775015615, 32596, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-02-05 01:57:00', '2026-02-05 02:16:00', 
    19, 'Success', 0, NULL, 
    NULL, 43777825712, 31738, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-02-05 02:24:00', '2026-02-05 04:03:00', 
    99, 'Success', 0, NULL, 
    NULL, 14541971868, 11768, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-02-05 02:39:00', '2026-02-05 04:51:00', 
    132, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 20287138067, 26844, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-02-05 00:00:00', '2026-02-05 02:40:00', 
    160, 'Success', 0, NULL, 
    NULL, 13877132474, 48821, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-02-05 00:54:00', '2026-02-05 03:50:00', 
    176, 'Success', 0, NULL, 
    NULL, 13153908236, 23503, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-02-05 02:57:00', '2026-02-05 05:39:00', 
    162, 'Success', 0, NULL, 
    NULL, 30091988688, 14613, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-02-05 23:16:00', '2026-02-06 00:26:00', 
    70, 'Success', 0, NULL, 
    NULL, 13878340654, 13300, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-02-05 23:56:00', '2026-02-06 00:44:00', 
    48, 'Success', 0, NULL, 
    NULL, 39740331542, 5559, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-02-05 01:45:00', '2026-02-05 02:01:00', 
    16, 'Success', 0, NULL, 
    NULL, 18515719213, 40851, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-02-05 01:58:00', '2026-02-05 04:56:00', 
    178, 'Success', 0, NULL, 
    NULL, 39097154797, 27912, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-02-05 01:47:00', '2026-02-05 04:22:00', 
    155, 'Success', 0, NULL, 
    NULL, 20857525737, 27086, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-02-05 23:41:00', '2026-02-06 02:30:00', 
    169, 'Success', 0, NULL, 
    NULL, 15536954523, 25684, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-02-05 00:33:00', '2026-02-05 00:51:00', 
    18, 'Success', 0, NULL, 
    NULL, 34152219370, 10360, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-02-05 23:04:00', '2026-02-06 01:41:00', 
    157, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 43141481511, 36284, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-02-05 00:46:00', '2026-02-05 02:27:00', 
    101, 'Success', 0, NULL, 
    NULL, 24919361715, 48509, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-02-05 00:24:00', '2026-02-05 03:01:00', 
    157, 'Success', 0, NULL, 
    NULL, 17445664729, 35558, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-02-05 00:17:00', '2026-02-05 03:01:00', 
    164, 'Success', 0, NULL, 
    NULL, 41538041945, 7219, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-02-05 23:12:00', '2026-02-05 23:29:00', 
    17, 'Success', 0, NULL, 
    NULL, 46023329927, 47215, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-02-05 02:49:00', '2026-02-05 04:40:00', 
    111, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 44279189866, 1160, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-02-05 23:06:00', '2026-02-06 00:00:00', 
    54, 'Success', 0, NULL, 
    NULL, 11554068893, 40636, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-02-05 23:46:00', '2026-02-06 01:33:00', 
    107, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 36616748580, 28181, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-02-05 01:52:00', '2026-02-05 02:37:00', 
    45, 'Success', 0, NULL, 
    NULL, 37802083655, 28332, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-02-05 02:08:00', '2026-02-05 04:39:00', 
    151, 'Success', 0, NULL, 
    NULL, 8578520230, 46492, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-02-05 23:27:00', '2026-02-06 01:26:00', 
    119, 'Success', 0, NULL, 
    NULL, 12064352902, 45857, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-02-05 01:06:00', '2026-02-05 02:55:00', 
    109, 'Success', 0, NULL, 
    NULL, 8902046097, 32846, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-02-05 23:30:00', '2026-02-06 00:55:00', 
    85, 'Success', 0, NULL, 
    NULL, 51330017065, 6256, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-02-05 02:45:00', '2026-02-05 03:04:00', 
    19, 'Success', 0, NULL, 
    NULL, 45639587363, 30445, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-02-05 00:41:00', '2026-02-05 03:27:00', 
    166, 'Success', 0, NULL, 
    NULL, 52639305479, 49633, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-02-05 01:49:00', '2026-02-05 04:28:00', 
    159, 'Success', 0, NULL, 
    NULL, 17458157911, 37853, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-02-05 00:57:00', '2026-02-05 01:48:00', 
    51, 'Success', 0, NULL, 
    NULL, 32227278288, 28035, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-02-06 02:22:00', '2026-02-06 04:09:00', 
    107, 'Success', 0, NULL, 
    NULL, 23625760090, 27157, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-02-06 02:35:00', '2026-02-06 04:23:00', 
    108, 'Success', 0, NULL, 
    NULL, 19829515798, 34588, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-02-06 01:09:00', '2026-02-06 02:29:00', 
    80, 'Success', 0, NULL, 
    NULL, 51381691711, 13922, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-02-06 01:06:00', '2026-02-06 02:22:00', 
    76, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 52971526209, 7777, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-02-06 02:41:00', '2026-02-06 05:10:00', 
    149, 'Success', 0, NULL, 
    NULL, 48964214034, 27740, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-02-06 23:08:00', '2026-02-07 01:30:00', 
    142, 'Success', 0, NULL, 
    NULL, 29898765865, 34839, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-02-06 01:06:00', '2026-02-06 02:58:00', 
    112, 'Success', 0, NULL, 
    NULL, 23640575021, 39940, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-02-06 00:16:00', '2026-02-06 02:30:00', 
    134, 'Success', 0, NULL, 
    NULL, 47189914832, 20518, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-02-06 00:01:00', '2026-02-06 01:03:00', 
    62, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 17690338225, 6722, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-02-06 23:05:00', '2026-02-07 00:13:00', 
    68, 'Success', 0, NULL, 
    NULL, 42647173515, 29977, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-02-06 00:03:00', '2026-02-06 01:04:00', 
    61, 'Success', 0, NULL, 
    NULL, 12723690956, 46008, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-02-06 00:20:00', '2026-02-06 01:49:00', 
    89, 'Success', 0, NULL, 
    NULL, 13164162136, 40478, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-02-06 02:56:00', '2026-02-06 04:47:00', 
    111, 'Success', 0, NULL, 
    NULL, 30855920865, 22850, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-02-06 00:16:00', '2026-02-06 03:12:00', 
    176, 'Success', 0, NULL, 
    NULL, 48765604640, 31759, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-02-06 01:54:00', '2026-02-06 04:28:00', 
    154, 'Success', 0, NULL, 
    NULL, 22555673706, 1041, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-02-06 02:34:00', '2026-02-06 03:43:00', 
    69, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 6236313882, 17095, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-02-06 02:40:00', '2026-02-06 03:58:00', 
    78, 'Success', 0, NULL, 
    NULL, 48115037609, 25602, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-02-06 02:26:00', '2026-02-06 03:55:00', 
    89, 'Success', 0, NULL, 
    NULL, 43065763182, 25502, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-02-06 01:58:00', '2026-02-06 04:41:00', 
    163, 'Success', 0, NULL, 
    NULL, 37464915980, 28879, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-02-06 02:11:00', '2026-02-06 05:04:00', 
    173, 'Success', 0, NULL, 
    NULL, 18193299067, 15669, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-02-06 23:18:00', '2026-02-07 00:26:00', 
    68, 'Success', 0, NULL, 
    NULL, 29843100045, 46919, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-02-06 01:10:00', '2026-02-06 01:35:00', 
    25, 'Success', 0, NULL, 
    NULL, 50539002045, 39631, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-02-06 00:22:00', '2026-02-06 00:44:00', 
    22, 'Success', 0, NULL, 
    NULL, 34096088685, 24258, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-02-06 01:48:00', '2026-02-06 02:45:00', 
    57, 'Success', 0, NULL, 
    NULL, 51202273379, 11446, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-02-06 02:18:00', '2026-02-06 02:52:00', 
    34, 'Success', 0, NULL, 
    NULL, 53103361531, 39143, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-02-06 23:56:00', '2026-02-07 01:16:00', 
    80, 'Success', 0, NULL, 
    NULL, 39322346811, 5409, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-02-06 01:35:00', '2026-02-06 03:54:00', 
    139, 'Success', 0, NULL, 
    NULL, 26262582624, 32679, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-02-06 23:00:00', '2026-02-07 01:25:00', 
    145, 'Success', 0, NULL, 
    NULL, 49726482918, 21835, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-02-06 01:36:00', '2026-02-06 04:35:00', 
    179, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 28023950976, 41037, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-02-06 23:32:00', '2026-02-07 01:34:00', 
    122, 'Success', 0, NULL, 
    NULL, 14810889734, 19629, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-02-06 23:29:00', '2026-02-07 00:23:00', 
    54, 'Success', 0, NULL, 
    NULL, 23741847249, 32544, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-02-06 00:46:00', '2026-02-06 01:35:00', 
    49, 'Success', 0, NULL, 
    NULL, 36244491421, 37887, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-02-06 01:28:00', '2026-02-06 03:53:00', 
    145, 'Success', 0, NULL, 
    NULL, 31337529613, 46723, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-02-06 00:21:00', '2026-02-06 03:11:00', 
    170, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 23901915017, 16670, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-02-06 01:40:00', '2026-02-06 03:35:00', 
    115, 'Failed', 2106, '2106', 
    'license key expired or invalid, exit status = 2106', 10277153866, 19690, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-02-06 01:38:00', '2026-02-06 02:22:00', 
    44, 'Success', 0, NULL, 
    NULL, 51955734192, 36456, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-02-06 23:46:00', '2026-02-07 01:24:00', 
    98, 'Success', 0, NULL, 
    NULL, 16460127864, 4431, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-02-06 01:36:00', '2026-02-06 03:19:00', 
    103, 'Success', 0, NULL, 
    NULL, 17061968428, 37226, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-02-06 01:01:00', '2026-02-06 03:50:00', 
    169, 'Success', 0, NULL, 
    NULL, 16206126813, 28527, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-02-06 23:02:00', '2026-02-06 23:20:00', 
    18, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 30708315015, 6597, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-02-06 02:36:00', '2026-02-06 02:59:00', 
    23, 'Success', 0, NULL, 
    NULL, 19318162722, 18369, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-02-07 23:36:00', '2026-02-08 00:00:00', 
    24, 'Success', 0, NULL, 
    NULL, 51066440804, 14322, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-02-07 02:11:00', '2026-02-07 03:08:00', 
    57, 'Success', 0, NULL, 
    NULL, 44117160531, 6254, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-02-07 00:56:00', '2026-02-07 01:59:00', 
    63, 'Success', 0, NULL, 
    NULL, 15454504692, 34857, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-02-07 23:13:00', '2026-02-08 01:52:00', 
    159, 'Success', 0, NULL, 
    NULL, 12969806894, 27682, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-02-07 01:53:00', '2026-02-07 04:43:00', 
    170, 'Success', 0, NULL, 
    NULL, 28701702767, 24252, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-02-07 01:44:00', '2026-02-07 02:50:00', 
    66, 'Success', 0, NULL, 
    NULL, 20991839924, 2314, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-02-07 02:51:00', '2026-02-07 04:56:00', 
    125, 'Success', 0, NULL, 
    NULL, 52719938339, 37113, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-02-07 23:59:00', '2026-02-08 01:04:00', 
    65, 'Success', 0, NULL, 
    NULL, 45457267286, 19631, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-02-07 02:59:00', '2026-02-07 04:39:00', 
    100, 'Failed', 96, '96', 
    'client FILE01 not responding, exit status = 96', 19160982908, 20328, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-02-07 01:36:00', '2026-02-07 03:47:00', 
    131, 'Success', 0, NULL, 
    NULL, 16494443440, 29250, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-02-07 23:08:00', '2026-02-08 02:01:00', 
    173, 'Success', 0, NULL, 
    NULL, 50370121125, 18488, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-02-07 01:44:00', '2026-02-07 04:20:00', 
    156, 'Success', 0, NULL, 
    NULL, 46253261134, 19310, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-02-07 01:19:00', '2026-02-07 02:49:00', 
    90, 'Success', 0, NULL, 
    NULL, 23753012668, 35843, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-02-07 23:53:00', '2026-02-08 00:28:00', 
    35, 'Success', 0, NULL, 
    NULL, 31476413405, 24250, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-02-07 02:34:00', '2026-02-07 03:05:00', 
    31, 'Success', 0, NULL, 
    NULL, 17373463037, 36369, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-02-07 02:42:00', '2026-02-07 05:40:00', 
    178, 'Failed', 96, '96', 
    'client DB03 not responding, exit status = 96', 13685417418, 7474, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-02-07 23:34:00', '2026-02-08 01:47:00', 
    133, 'Success', 0, NULL, 
    NULL, 41347117661, 14270, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-02-07 23:23:00', '2026-02-07 23:35:00', 
    12, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 22718909712, 29963, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-02-07 23:45:00', '2026-02-08 02:30:00', 
    165, 'Success', 0, NULL, 
    NULL, 28076054769, 28802, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-02-07 00:56:00', '2026-02-07 03:54:00', 
    178, 'Success', 0, NULL, 
    NULL, 35223453499, 44253, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-02-07 23:12:00', '2026-02-08 01:49:00', 
    157, 'Success', 0, NULL, 
    NULL, 11327972558, 36712, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-02-07 02:45:00', '2026-02-07 03:28:00', 
    43, 'Success', 0, NULL, 
    NULL, 16668696929, 8240, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-02-07 01:04:00', '2026-02-07 03:52:00', 
    168, 'Success', 0, NULL, 
    NULL, 8781596268, 38508, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-02-07 23:48:00', '2026-02-08 02:24:00', 
    156, 'Success', 0, NULL, 
    NULL, 45590828335, 12424, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-02-07 02:16:00', '2026-02-07 03:46:00', 
    90, 'Success', 0, NULL, 
    NULL, 31047383006, 25827, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-02-07 02:06:00', '2026-02-07 02:57:00', 
    51, 'Success', 0, NULL, 
    NULL, 22268198658, 9676, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-02-07 01:19:00', '2026-02-07 01:34:00', 
    15, 'Success', 0, NULL, 
    NULL, 28829766125, 14769, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-02-07 01:52:00', '2026-02-07 03:46:00', 
    114, 'Success', 0, NULL, 
    NULL, 25222145872, 44327, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-02-07 01:47:00', '2026-02-07 04:18:00', 
    151, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 41918301973, 19882, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-02-07 23:13:00', '2026-02-08 01:37:00', 
    144, 'Success', 0, NULL, 
    NULL, 50900704838, 44053, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-02-07 02:00:00', '2026-02-07 03:31:00', 
    91, 'Success', 0, NULL, 
    NULL, 9442846519, 12727, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-02-07 02:32:00', '2026-02-07 04:48:00', 
    136, 'Success', 0, NULL, 
    NULL, 16770703873, 4138, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-02-07 02:35:00', '2026-02-07 02:58:00', 
    23, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 43985030785, 17584, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-02-07 00:04:00', '2026-02-07 03:00:00', 
    176, 'Success', 0, NULL, 
    NULL, 43718539099, 25099, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-02-07 01:24:00', '2026-02-07 03:14:00', 
    110, 'Success', 0, NULL, 
    NULL, 37146102689, 3779, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-02-07 02:12:00', '2026-02-07 04:39:00', 
    147, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 52754342539, 10928, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-02-07 02:16:00', '2026-02-07 04:12:00', 
    116, 'Success', 0, NULL, 
    NULL, 21447277950, 19641, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-02-07 00:01:00', '2026-02-07 00:20:00', 
    19, 'Success', 0, NULL, 
    NULL, 40124378960, 48900, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-02-07 23:45:00', '2026-02-08 01:47:00', 
    122, 'Success', 0, NULL, 
    NULL, 49795115935, 17238, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-02-07 00:25:00', '2026-02-07 01:02:00', 
    37, 'Success', 0, NULL, 
    NULL, 9313627237, 31187, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-02-07 02:44:00', '2026-02-07 04:28:00', 
    104, 'Success', 0, NULL, 
    NULL, 22506994186, 1653, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'WEEKLY_FULL', 'SAMSUNG_DB01_Full', 'Full',
    '2026-02-08 00:13:00', '2026-02-08 02:49:00', 
    156, 'Success', 0, NULL, 
    NULL, 283932856682, 15510, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'WEEKLY_FULL', 'SAMSUNG_DB02_Full', 'Full',
    '2026-02-08 02:36:00', '2026-02-08 03:48:00', 
    72, 'Success', 0, NULL, 
    NULL, 326722637204, 24450, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'WEEKLY_FULL', 'SAMSUNG_WEB01_Full', 'Full',
    '2026-02-08 00:26:00', '2026-02-08 02:45:00', 
    139, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 61080991057, 46646, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'WEEKLY_FULL', 'SAMSUNG_WEB02_Full', 'Full',
    '2026-02-08 02:58:00', '2026-02-08 05:18:00', 
    140, 'Failed', 1, '1', 
    'backup failed with general error, exit status = 1', 339589681918, 30644, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'WEEKLY_FULL', 'SAMSUNG_APP01_Full', 'Full',
    '2026-02-08 02:53:00', '2026-02-08 03:04:00', 
    11, 'Success', 0, NULL, 
    NULL, 130724632242, 31138, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'WEEKLY_FULL', 'LG_DB01_Full', 'Full',
    '2026-02-08 00:45:00', '2026-02-08 03:00:00', 
    135, 'Success', 0, NULL, 
    NULL, 192641500260, 22824, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'WEEKLY_FULL', 'LG_WEB01_Full', 'Full',
    '2026-02-08 02:57:00', '2026-02-08 05:49:00', 
    172, 'Success', 0, NULL, 
    NULL, 84465729932, 4168, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'WEEKLY_FULL', 'LG_APP01_Full', 'Full',
    '2026-02-08 23:44:00', '2026-02-09 02:42:00', 
    178, 'Success', 0, NULL, 
    NULL, 135232413534, 19475, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'WEEKLY_FULL', 'LG_FILE01_Full', 'Full',
    '2026-02-08 01:03:00', '2026-02-08 02:38:00', 
    95, 'Success', 0, NULL, 
    NULL, 329023615269, 1437, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'WEEKLY_FULL', 'SKHYNIX_DB01_Full', 'Full',
    '2026-02-08 00:50:00', '2026-02-08 03:16:00', 
    146, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 63172980437, 23853, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'WEEKLY_FULL', 'SKHYNIX_DB02_Full', 'Full',
    '2026-02-08 23:56:00', '2026-02-09 02:07:00', 
    131, 'Success', 0, NULL, 
    NULL, 453757087320, 17536, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'WEEKLY_FULL', 'SKHYNIX_APP01_Full', 'Full',
    '2026-02-08 01:49:00', '2026-02-08 04:30:00', 
    161, 'Success', 0, NULL, 
    NULL, 318603656915, 9969, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'WEEKLY_FULL', 'SKHYNIX_APP02_Full', 'Full',
    '2026-02-08 01:35:00', '2026-02-08 03:47:00', 
    132, 'Success', 0, NULL, 
    NULL, 82035567669, 49144, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'WEEKLY_FULL', 'HYUNDAI_DB01_Full', 'Full',
    '2026-02-08 00:35:00', '2026-02-08 02:58:00', 
    143, 'Success', 0, NULL, 
    NULL, 336211103103, 38056, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'WEEKLY_FULL', 'HYUNDAI_DB02_Full', 'Full',
    '2026-02-08 01:37:00', '2026-02-08 01:49:00', 
    12, 'Success', 0, NULL, 
    NULL, 145355739940, 47043, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'WEEKLY_FULL', 'HYUNDAI_DB03_Full', 'Full',
    '2026-02-08 00:42:00', '2026-02-08 03:18:00', 
    156, 'Success', 0, NULL, 
    NULL, 335244190202, 19475, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'WEEKLY_FULL', 'HYUNDAI_WEB01_Full', 'Full',
    '2026-02-08 00:48:00', '2026-02-08 01:55:00', 
    67, 'Success', 0, NULL, 
    NULL, 230914069674, 20385, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'WEEKLY_FULL', 'HYUNDAI_APP01_Full', 'Full',
    '2026-02-08 23:19:00', '2026-02-09 01:09:00', 
    110, 'Success', 0, NULL, 
    NULL, 353377982008, 34149, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'WEEKLY_FULL', 'HYUNDAI_FILE01_Full', 'Full',
    '2026-02-08 01:57:00', '2026-02-08 03:07:00', 
    70, 'Success', 0, NULL, 
    NULL, 479811927132, 24367, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'WEEKLY_FULL', 'POSCO_DB01_Full', 'Full',
    '2026-02-08 01:05:00', '2026-02-08 03:51:00', 
    166, 'Success', 0, NULL, 
    NULL, 113355279046, 17463, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'WEEKLY_FULL', 'POSCO_WEB01_Full', 'Full',
    '2026-02-08 23:32:00', '2026-02-09 02:00:00', 
    148, 'Success', 0, NULL, 
    NULL, 275240965250, 5401, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'WEEKLY_FULL', 'POSCO_APP01_Full', 'Full',
    '2026-02-08 01:03:00', '2026-02-08 03:35:00', 
    152, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 151729555954, 9074, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'WEEKLY_FULL', 'POSCO_FILE01_Full', 'Full',
    '2026-02-08 23:15:00', '2026-02-09 00:19:00', 
    64, 'Success', 0, NULL, 
    NULL, 378608177570, 34253, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'WEEKLY_FULL', 'NAVER_DB01_Full', 'Full',
    '2026-02-08 01:07:00', '2026-02-08 01:54:00', 
    47, 'Success', 0, NULL, 
    NULL, 526649887053, 36720, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'WEEKLY_FULL', 'NAVER_WEB01_Full', 'Full',
    '2026-02-08 01:15:00', '2026-02-08 02:10:00', 
    55, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 70481052498, 4901, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'WEEKLY_FULL', 'NAVER_WEB02_Full', 'Full',
    '2026-02-08 23:53:00', '2026-02-09 00:42:00', 
    49, 'Success', 0, NULL, 
    NULL, 194315555191, 41288, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'WEEKLY_FULL', 'NAVER_APP01_Full', 'Full',
    '2026-02-08 00:22:00', '2026-02-08 02:27:00', 
    125, 'Success', 0, NULL, 
    NULL, 465991941922, 12254, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'WEEKLY_FULL', 'KAKAO_DB01_Full', 'Full',
    '2026-02-08 00:22:00', '2026-02-08 01:10:00', 
    48, 'Success', 0, NULL, 
    NULL, 133813996341, 10131, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'WEEKLY_FULL', 'KAKAO_WEB01_Full', 'Full',
    '2026-02-08 01:43:00', '2026-02-08 03:59:00', 
    136, 'Success', 0, NULL, 
    NULL, 506864278283, 35801, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'WEEKLY_FULL', 'KAKAO_APP01_Full', 'Full',
    '2026-02-08 00:07:00', '2026-02-08 02:14:00', 
    127, 'Success', 0, NULL, 
    NULL, 450629870622, 2268, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'WEEKLY_FULL', 'COUPANG_DB01_Full', 'Full',
    '2026-02-08 23:20:00', '2026-02-09 01:36:00', 
    136, 'Success', 0, NULL, 
    NULL, 310815287545, 19196, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'WEEKLY_FULL', 'COUPANG_DB02_Full', 'Full',
    '2026-02-08 01:07:00', '2026-02-08 03:53:00', 
    166, 'Success', 0, NULL, 
    NULL, 414906523263, 1608, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'WEEKLY_FULL', 'COUPANG_WEB01_Full', 'Full',
    '2026-02-08 01:20:00', '2026-02-08 01:35:00', 
    15, 'Success', 0, NULL, 
    NULL, 534329942334, 5777, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'WEEKLY_FULL', 'COUPANG_WEB02_Full', 'Full',
    '2026-02-08 00:37:00', '2026-02-08 02:18:00', 
    101, 'Success', 0, NULL, 
    NULL, 318167996753, 11387, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'WEEKLY_FULL', 'COUPANG_APP01_Full', 'Full',
    '2026-02-08 23:38:00', '2026-02-09 01:50:00', 
    132, 'Success', 0, NULL, 
    NULL, 522071767248, 16589, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'WEEKLY_FULL', 'COUPANG_FILE01_Full', 'Full',
    '2026-02-08 00:36:00', '2026-02-08 01:51:00', 
    75, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 368242125285, 49378, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'WEEKLY_FULL', 'BAEMIN_DB01_Full', 'Full',
    '2026-02-08 23:42:00', '2026-02-09 01:08:00', 
    86, 'Success', 0, NULL, 
    NULL, 320025040161, 49047, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'WEEKLY_FULL', 'BAEMIN_WEB01_Full', 'Full',
    '2026-02-08 23:47:00', '2026-02-09 01:53:00', 
    126, 'Success', 0, NULL, 
    NULL, 372641991575, 4073, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'WEEKLY_FULL', 'BAEMIN_APP01_Full', 'Full',
    '2026-02-08 00:30:00', '2026-02-08 02:35:00', 
    125, 'Success', 0, NULL, 
    NULL, 200387913409, 38751, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'WEEKLY_FULL', 'WOOWA_DB01_Full', 'Full',
    '2026-02-08 01:38:00', '2026-02-08 02:03:00', 
    25, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 319084949518, 14175, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'WEEKLY_FULL', 'WOOWA_WEB01_Full', 'Full',
    '2026-02-08 00:45:00', '2026-02-08 02:13:00', 
    88, 'Success', 0, NULL, 
    NULL, 386220126301, 39633, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-02-09 01:13:00', '2026-02-09 01:50:00', 
    37, 'Success', 0, NULL, 
    NULL, 27998323689, 17424, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-02-09 01:55:00', '2026-02-09 03:15:00', 
    80, 'Success', 0, NULL, 
    NULL, 26081266880, 36567, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-02-09 23:58:00', '2026-02-10 01:36:00', 
    98, 'Success', 0, NULL, 
    NULL, 5973435514, 38058, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-02-09 00:24:00', '2026-02-09 00:44:00', 
    20, 'Success', 0, NULL, 
    NULL, 12805254801, 46311, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-02-09 02:03:00', '2026-02-09 02:23:00', 
    20, 'Success', 0, NULL, 
    NULL, 35541180939, 30218, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-02-09 01:06:00', '2026-02-09 01:42:00', 
    36, 'Success', 0, NULL, 
    NULL, 13831618174, 20008, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-02-09 02:13:00', '2026-02-09 04:56:00', 
    163, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 13295545794, 27360, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-02-09 00:18:00', '2026-02-09 01:26:00', 
    68, 'Success', 0, NULL, 
    NULL, 37864401713, 41650, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-02-09 01:09:00', '2026-02-09 03:08:00', 
    119, 'Success', 0, NULL, 
    NULL, 24529380497, 31286, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-02-09 01:18:00', '2026-02-09 03:50:00', 
    152, 'Success', 0, NULL, 
    NULL, 37111962010, 33121, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-02-09 01:12:00', '2026-02-09 01:34:00', 
    22, 'Success', 0, NULL, 
    NULL, 48772709716, 14438, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-02-09 01:58:00', '2026-02-09 04:47:00', 
    169, 'Success', 0, NULL, 
    NULL, 34570535017, 9672, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-02-09 01:17:00', '2026-02-09 01:43:00', 
    26, 'Success', 0, NULL, 
    NULL, 50656323886, 8988, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-02-09 00:31:00', '2026-02-09 01:20:00', 
    49, 'Success', 0, NULL, 
    NULL, 31340074824, 7525, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-02-09 01:23:00', '2026-02-09 02:29:00', 
    66, 'Success', 0, NULL, 
    NULL, 22421080920, 6275, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-02-09 02:50:00', '2026-02-09 04:58:00', 
    128, 'Success', 0, NULL, 
    NULL, 27630049865, 33644, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-02-09 23:16:00', '2026-02-09 23:51:00', 
    35, 'Success', 0, NULL, 
    NULL, 22349820870, 30374, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-02-09 01:08:00', '2026-02-09 02:56:00', 
    108, 'Success', 0, NULL, 
    NULL, 33989554958, 44877, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-02-09 02:37:00', '2026-02-09 04:21:00', 
    104, 'Success', 0, NULL, 
    NULL, 6374705177, 28218, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-02-09 23:06:00', '2026-02-10 01:31:00', 
    145, 'Success', 0, NULL, 
    NULL, 32368104734, 32100, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-02-09 00:47:00', '2026-02-09 01:43:00', 
    56, 'Success', 0, NULL, 
    NULL, 27501971950, 35463, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-02-09 00:27:00', '2026-02-09 02:40:00', 
    133, 'Success', 0, NULL, 
    NULL, 10134157222, 49442, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-02-09 02:16:00', '2026-02-09 03:08:00', 
    52, 'Success', 0, NULL, 
    NULL, 14972453303, 22042, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-02-09 01:01:00', '2026-02-09 02:39:00', 
    98, 'Success', 0, NULL, 
    NULL, 33619468738, 49567, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-02-09 23:58:00', '2026-02-10 00:28:00', 
    30, 'Success', 0, NULL, 
    NULL, 38018813690, 43006, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-02-09 00:16:00', '2026-02-09 00:56:00', 
    40, 'Success', 0, NULL, 
    NULL, 6320077850, 24982, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-02-09 00:42:00', '2026-02-09 01:54:00', 
    72, 'Success', 0, NULL, 
    NULL, 17972759239, 42325, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-02-09 01:35:00', '2026-02-09 02:57:00', 
    82, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 49523752505, 13858, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-02-09 23:30:00', '2026-02-10 01:18:00', 
    108, 'Success', 0, NULL, 
    NULL, 17542857384, 8641, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-02-09 00:39:00', '2026-02-09 03:24:00', 
    165, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 6009242908, 23064, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-02-09 23:04:00', '2026-02-10 01:48:00', 
    164, 'Success', 0, NULL, 
    NULL, 49827066643, 47439, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-02-09 00:26:00', '2026-02-09 02:39:00', 
    133, 'Success', 0, NULL, 
    NULL, 18724892206, 15644, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-02-09 23:39:00', '2026-02-10 01:27:00', 
    108, 'Success', 0, NULL, 
    NULL, 47442067775, 49180, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-02-09 01:25:00', '2026-02-09 02:13:00', 
    48, 'Success', 0, NULL, 
    NULL, 22012000317, 38157, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-02-09 23:26:00', '2026-02-10 01:03:00', 
    97, 'Success', 0, NULL, 
    NULL, 28103578491, 42505, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-02-09 02:02:00', '2026-02-09 03:38:00', 
    96, 'Success', 0, NULL, 
    NULL, 8771246923, 45450, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-02-09 00:13:00', '2026-02-09 01:02:00', 
    49, 'Success', 0, NULL, 
    NULL, 52427202047, 38327, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-02-09 23:38:00', '2026-02-10 01:30:00', 
    112, 'Success', 0, NULL, 
    NULL, 28183183443, 38406, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-02-09 01:32:00', '2026-02-09 01:45:00', 
    13, 'Success', 0, NULL, 
    NULL, 35577248017, 23241, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-02-09 01:05:00', '2026-02-09 02:42:00', 
    97, 'Success', 0, NULL, 
    NULL, 21341065625, 40657, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-02-09 23:17:00', '2026-02-09 23:50:00', 
    33, 'Success', 0, NULL, 
    NULL, 43045230684, 19487, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-02-10 02:30:00', '2026-02-10 04:31:00', 
    121, 'Success', 0, NULL, 
    NULL, 32598108517, 41978, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-02-10 02:05:00', '2026-02-10 05:04:00', 
    179, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 51437852843, 48857, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-02-10 02:18:00', '2026-02-10 02:33:00', 
    15, 'Success', 0, NULL, 
    NULL, 40562196336, 7291, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-02-10 00:41:00', '2026-02-10 01:24:00', 
    43, 'Success', 0, NULL, 
    NULL, 31879703724, 26686, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-02-10 00:01:00', '2026-02-10 02:50:00', 
    169, 'Success', 0, NULL, 
    NULL, 23593295449, 2155, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-02-10 01:45:00', '2026-02-10 03:53:00', 
    128, 'Success', 0, NULL, 
    NULL, 36764944823, 9712, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-02-10 02:06:00', '2026-02-10 02:29:00', 
    23, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 37251922706, 31605, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-02-10 01:35:00', '2026-02-10 03:33:00', 
    118, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 43532086393, 33600, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-02-10 00:02:00', '2026-02-10 01:41:00', 
    99, 'Success', 0, NULL, 
    NULL, 39664107940, 14287, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-02-10 01:10:00', '2026-02-10 02:23:00', 
    73, 'Success', 0, NULL, 
    NULL, 14561398049, 15133, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-02-10 00:59:00', '2026-02-10 03:05:00', 
    126, 'Success', 0, NULL, 
    NULL, 48239326851, 25286, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-02-10 01:46:00', '2026-02-10 03:47:00', 
    121, 'Success', 0, NULL, 
    NULL, 19021481941, 20337, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-02-10 23:43:00', '2026-02-11 01:54:00', 
    131, 'Success', 0, NULL, 
    NULL, 25005672019, 19918, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-02-10 23:45:00', '2026-02-11 01:05:00', 
    80, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 13195220120, 47103, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-02-10 00:42:00', '2026-02-10 03:32:00', 
    170, 'Success', 0, NULL, 
    NULL, 38871804620, 12822, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-02-10 23:05:00', '2026-02-11 00:14:00', 
    69, 'Success', 0, NULL, 
    NULL, 51466780308, 10419, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-02-10 23:07:00', '2026-02-11 01:05:00', 
    118, 'Success', 0, NULL, 
    NULL, 40649667678, 31320, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-02-10 00:40:00', '2026-02-10 02:48:00', 
    128, 'Success', 0, NULL, 
    NULL, 49646082654, 47158, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-02-10 23:49:00', '2026-02-11 01:29:00', 
    100, 'Success', 0, NULL, 
    NULL, 24340331517, 48821, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-02-10 00:43:00', '2026-02-10 01:13:00', 
    30, 'Success', 0, NULL, 
    NULL, 45959796200, 1201, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-02-10 00:45:00', '2026-02-10 03:05:00', 
    140, 'Success', 0, NULL, 
    NULL, 7392073126, 9678, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-02-10 02:35:00', '2026-02-10 05:18:00', 
    163, 'Success', 0, NULL, 
    NULL, 31132049586, 24451, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-02-10 00:33:00', '2026-02-10 03:19:00', 
    166, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 21205904936, 37455, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-02-10 00:44:00', '2026-02-10 03:15:00', 
    151, 'Success', 0, NULL, 
    NULL, 40624334989, 19037, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-02-10 01:58:00', '2026-02-10 02:17:00', 
    19, 'Success', 0, NULL, 
    NULL, 33295284866, 2840, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-02-10 02:13:00', '2026-02-10 04:07:00', 
    114, 'Success', 0, NULL, 
    NULL, 52900274161, 17593, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-02-10 01:03:00', '2026-02-10 01:54:00', 
    51, 'Success', 0, NULL, 
    NULL, 31499667484, 16947, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-02-10 00:33:00', '2026-02-10 00:48:00', 
    15, 'Success', 0, NULL, 
    NULL, 41929059794, 8533, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-02-10 00:20:00', '2026-02-10 01:38:00', 
    78, 'Success', 0, NULL, 
    NULL, 46721261507, 42593, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-02-10 00:46:00', '2026-02-10 01:05:00', 
    19, 'Success', 0, NULL, 
    NULL, 39642451844, 28112, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-02-10 02:00:00', '2026-02-10 03:00:00', 
    60, 'Success', 0, NULL, 
    NULL, 11773792760, 18619, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-02-10 00:25:00', '2026-02-10 03:21:00', 
    176, 'Success', 0, NULL, 
    NULL, 11189909319, 5262, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-02-10 23:32:00', '2026-02-11 01:36:00', 
    124, 'Success', 0, NULL, 
    NULL, 27563008979, 1824, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-02-10 02:38:00', '2026-02-10 02:51:00', 
    13, 'Success', 0, NULL, 
    NULL, 41410469135, 47489, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-02-10 02:46:00', '2026-02-10 03:53:00', 
    67, 'Success', 0, NULL, 
    NULL, 14248886068, 6330, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-02-10 00:31:00', '2026-02-10 02:02:00', 
    91, 'Success', 0, NULL, 
    NULL, 25407582150, 15031, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-02-10 01:35:00', '2026-02-10 03:40:00', 
    125, 'Success', 0, NULL, 
    NULL, 51631441226, 43703, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-02-10 00:54:00', '2026-02-10 03:27:00', 
    153, 'Success', 0, NULL, 
    NULL, 11839331684, 24945, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-02-10 23:03:00', '2026-02-11 01:15:00', 
    132, 'Success', 0, NULL, 
    NULL, 16649988026, 33267, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-02-10 00:31:00', '2026-02-10 02:07:00', 
    96, 'Success', 0, NULL, 
    NULL, 42924215085, 23195, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-02-10 02:59:00', '2026-02-10 03:14:00', 
    15, 'Success', 0, NULL, 
    NULL, 24745716421, 10348, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-02-11 23:22:00', '2026-02-12 00:47:00', 
    85, 'Success', 0, NULL, 
    NULL, 35206990573, 11355, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-02-11 23:55:00', '2026-02-12 00:49:00', 
    54, 'Success', 0, NULL, 
    NULL, 24227295746, 1675, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-02-11 01:08:00', '2026-02-11 03:06:00', 
    118, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 22675128524, 16104, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-02-11 23:51:00', '2026-02-12 00:09:00', 
    18, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 33196393932, 39934, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-02-11 02:57:00', '2026-02-11 04:53:00', 
    116, 'Success', 0, NULL, 
    NULL, 13645006835, 17537, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-02-11 23:09:00', '2026-02-12 00:50:00', 
    101, 'Success', 0, NULL, 
    NULL, 36223441121, 3926, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-02-11 02:38:00', '2026-02-11 04:20:00', 
    102, 'Success', 0, NULL, 
    NULL, 52714023618, 45383, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-02-11 01:08:00', '2026-02-11 01:28:00', 
    20, 'Success', 0, NULL, 
    NULL, 7851244878, 6915, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-02-11 23:36:00', '2026-02-12 01:50:00', 
    134, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 48060909555, 30379, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-02-11 02:16:00', '2026-02-11 02:37:00', 
    21, 'Success', 0, NULL, 
    NULL, 30849753829, 15128, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-02-11 02:21:00', '2026-02-11 02:44:00', 
    23, 'Success', 0, NULL, 
    NULL, 10911135214, 26630, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-02-11 00:17:00', '2026-02-11 01:26:00', 
    69, 'Success', 0, NULL, 
    NULL, 15011704031, 28156, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-02-11 02:51:00', '2026-02-11 03:28:00', 
    37, 'Success', 0, NULL, 
    NULL, 32541248834, 39494, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-02-11 01:14:00', '2026-02-11 03:25:00', 
    131, 'Success', 0, NULL, 
    NULL, 48462692923, 28427, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-02-11 00:21:00', '2026-02-11 02:51:00', 
    150, 'Success', 0, NULL, 
    NULL, 18857731134, 14708, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-02-11 02:51:00', '2026-02-11 04:31:00', 
    100, 'Success', 0, NULL, 
    NULL, 33125018959, 31725, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-02-11 01:22:00', '2026-02-11 03:06:00', 
    104, 'Success', 0, NULL, 
    NULL, 21409335079, 45943, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-02-11 02:50:00', '2026-02-11 03:15:00', 
    25, 'Success', 0, NULL, 
    NULL, 13831008232, 22802, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-02-11 23:32:00', '2026-02-12 00:13:00', 
    41, 'Success', 0, NULL, 
    NULL, 10854038692, 17632, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-02-11 00:44:00', '2026-02-11 00:56:00', 
    12, 'Success', 0, NULL, 
    NULL, 43479087268, 28474, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-02-11 02:31:00', '2026-02-11 04:41:00', 
    130, 'Success', 0, NULL, 
    NULL, 26679761016, 29213, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-02-11 01:00:00', '2026-02-11 02:16:00', 
    76, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 6673547506, 47339, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-02-11 01:08:00', '2026-02-11 01:47:00', 
    39, 'Success', 0, NULL, 
    NULL, 43992053900, 40414, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-02-11 00:45:00', '2026-02-11 03:18:00', 
    153, 'Success', 0, NULL, 
    NULL, 8987933557, 40037, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-02-11 02:32:00', '2026-02-11 03:19:00', 
    47, 'Success', 0, NULL, 
    NULL, 42038614674, 25211, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-02-11 02:22:00', '2026-02-11 02:46:00', 
    24, 'Success', 0, NULL, 
    NULL, 12251506735, 21299, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-02-11 02:42:00', '2026-02-11 04:29:00', 
    107, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 12002966814, 33703, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-02-11 02:46:00', '2026-02-11 04:13:00', 
    87, 'Success', 0, NULL, 
    NULL, 12135969247, 2216, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-02-11 00:19:00', '2026-02-11 00:45:00', 
    26, 'Success', 0, NULL, 
    NULL, 43929546726, 18993, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-02-11 23:24:00', '2026-02-12 01:41:00', 
    137, 'Success', 0, NULL, 
    NULL, 38255950986, 1716, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-02-11 02:31:00', '2026-02-11 03:58:00', 
    87, 'Success', 0, NULL, 
    NULL, 16287242438, 7146, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-02-11 02:24:00', '2026-02-11 04:26:00', 
    122, 'Success', 0, NULL, 
    NULL, 49822245063, 47978, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-02-11 00:59:00', '2026-02-11 02:37:00', 
    98, 'Success', 0, NULL, 
    NULL, 50754450167, 34751, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-02-11 00:31:00', '2026-02-11 01:34:00', 
    63, 'Success', 0, NULL, 
    NULL, 7977781436, 20598, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-02-11 00:28:00', '2026-02-11 03:21:00', 
    173, 'Success', 0, NULL, 
    NULL, 48926541425, 34570, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-02-11 01:33:00', '2026-02-11 04:11:00', 
    158, 'Success', 0, NULL, 
    NULL, 15479166006, 19054, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-02-11 23:06:00', '2026-02-12 01:27:00', 
    141, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 42437525632, 11774, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-02-11 23:26:00', '2026-02-12 01:34:00', 
    128, 'Success', 0, NULL, 
    NULL, 9040670829, 35054, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-02-11 02:07:00', '2026-02-11 03:12:00', 
    65, 'Success', 0, NULL, 
    NULL, 36925971201, 25673, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-02-11 00:17:00', '2026-02-11 01:09:00', 
    52, 'Success', 0, NULL, 
    NULL, 38517795422, 40611, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-02-11 02:44:00', '2026-02-11 05:30:00', 
    166, 'Success', 0, NULL, 
    NULL, 23828516701, 47575, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-02-12 01:39:00', '2026-02-12 02:04:00', 
    25, 'Success', 0, NULL, 
    NULL, 48577090615, 30963, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-02-12 02:44:00', '2026-02-12 05:39:00', 
    175, 'Success', 0, NULL, 
    NULL, 33147710846, 1887, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-02-12 00:45:00', '2026-02-12 03:26:00', 
    161, 'Success', 0, NULL, 
    NULL, 34151477230, 46084, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-02-12 00:02:00', '2026-02-12 00:19:00', 
    17, 'Success', 0, NULL, 
    NULL, 25952154898, 13791, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-02-12 02:27:00', '2026-02-12 04:03:00', 
    96, 'Success', 0, NULL, 
    NULL, 30982709182, 44970, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-02-12 01:41:00', '2026-02-12 04:37:00', 
    176, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 41170457828, 21930, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-02-12 00:56:00', '2026-02-12 02:37:00', 
    101, 'Success', 0, NULL, 
    NULL, 34140477814, 5106, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-02-12 02:38:00', '2026-02-12 05:03:00', 
    145, 'Success', 0, NULL, 
    NULL, 28067328157, 20690, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-02-12 23:39:00', '2026-02-12 23:56:00', 
    17, 'Success', 0, NULL, 
    NULL, 45693527754, 35392, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-02-12 01:48:00', '2026-02-12 04:11:00', 
    143, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 45327707698, 8210, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-02-12 01:36:00', '2026-02-12 03:18:00', 
    102, 'Success', 0, NULL, 
    NULL, 44655537513, 18376, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-02-12 00:08:00', '2026-02-12 02:48:00', 
    160, 'Success', 0, NULL, 
    NULL, 34704479857, 8580, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-02-12 23:11:00', '2026-02-13 00:21:00', 
    70, 'Success', 0, NULL, 
    NULL, 8638832449, 23333, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-02-12 23:50:00', '2026-02-13 00:49:00', 
    59, 'Success', 0, NULL, 
    NULL, 41753586673, 44533, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-02-12 01:24:00', '2026-02-12 03:22:00', 
    118, 'Success', 0, NULL, 
    NULL, 45618657497, 45782, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-02-12 00:53:00', '2026-02-12 03:44:00', 
    171, 'Success', 0, NULL, 
    NULL, 12640661314, 24857, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-02-12 02:07:00', '2026-02-12 04:27:00', 
    140, 'Success', 0, NULL, 
    NULL, 20552812263, 3445, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-02-12 23:55:00', '2026-02-13 02:09:00', 
    134, 'Success', 0, NULL, 
    NULL, 31562582456, 49418, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-02-12 23:33:00', '2026-02-13 00:06:00', 
    33, 'Success', 0, NULL, 
    NULL, 42408251774, 22615, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-02-12 23:23:00', '2026-02-13 00:47:00', 
    84, 'Success', 0, NULL, 
    NULL, 8596934777, 3933, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-02-12 01:01:00', '2026-02-12 02:36:00', 
    95, 'Success', 0, NULL, 
    NULL, 14294445114, 28317, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-02-12 02:05:00', '2026-02-12 04:33:00', 
    148, 'Success', 0, NULL, 
    NULL, 39682676338, 33573, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-02-12 02:07:00', '2026-02-12 02:43:00', 
    36, 'Success', 0, NULL, 
    NULL, 44064840419, 31642, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-02-12 01:21:00', '2026-02-12 02:34:00', 
    73, 'Success', 0, NULL, 
    NULL, 26393595512, 27455, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-02-12 01:10:00', '2026-02-12 02:00:00', 
    50, 'Success', 0, NULL, 
    NULL, 44874292726, 16085, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-02-12 02:29:00', '2026-02-12 04:57:00', 
    148, 'Success', 0, NULL, 
    NULL, 13751984947, 28830, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-02-12 23:53:00', '2026-02-13 01:06:00', 
    73, 'Success', 0, NULL, 
    NULL, 41348385472, 39182, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-02-12 23:36:00', '2026-02-13 02:34:00', 
    178, 'Success', 0, NULL, 
    NULL, 17153034588, 10200, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-02-12 00:46:00', '2026-02-12 02:41:00', 
    115, 'Success', 0, NULL, 
    NULL, 27655076356, 37371, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-02-12 00:51:00', '2026-02-12 02:16:00', 
    85, 'Success', 0, NULL, 
    NULL, 24589052211, 1312, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-02-12 01:27:00', '2026-02-12 03:35:00', 
    128, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 11759678950, 3613, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-02-12 01:03:00', '2026-02-12 03:34:00', 
    151, 'Success', 0, NULL, 
    NULL, 14528540695, 31934, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-02-12 02:25:00', '2026-02-12 04:30:00', 
    125, 'Success', 0, NULL, 
    NULL, 8545509948, 21983, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-02-12 01:19:00', '2026-02-12 04:06:00', 
    167, 'Success', 0, NULL, 
    NULL, 12672093881, 35154, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-02-12 00:01:00', '2026-02-12 01:46:00', 
    105, 'Success', 0, NULL, 
    NULL, 50858825382, 38424, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-02-12 02:17:00', '2026-02-12 02:53:00', 
    36, 'Success', 0, NULL, 
    NULL, 34656038472, 35491, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-02-12 00:49:00', '2026-02-12 02:06:00', 
    77, 'Success', 0, NULL, 
    NULL, 22022098620, 45630, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-02-12 23:18:00', '2026-02-12 23:51:00', 
    33, 'Success', 0, NULL, 
    NULL, 17225110527, 21096, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-02-12 23:23:00', '2026-02-13 01:08:00', 
    105, 'Success', 0, NULL, 
    NULL, 34815225534, 39015, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-02-12 00:36:00', '2026-02-12 02:14:00', 
    98, 'Success', 0, NULL, 
    NULL, 7895738198, 21905, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-02-12 01:33:00', '2026-02-12 02:57:00', 
    84, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 38819393783, 45085, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-02-13 01:08:00', '2026-02-13 01:48:00', 
    40, 'Success', 0, NULL, 
    NULL, 51480665097, 19870, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-02-13 23:06:00', '2026-02-14 02:02:00', 
    176, 'Success', 0, NULL, 
    NULL, 40784331579, 17730, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-02-13 23:16:00', '2026-02-14 02:01:00', 
    165, 'Success', 0, NULL, 
    NULL, 29035258334, 34136, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-02-13 01:13:00', '2026-02-13 03:56:00', 
    163, 'Success', 0, NULL, 
    NULL, 53066436662, 13710, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-02-13 02:42:00', '2026-02-13 04:55:00', 
    133, 'Failed', 13, '13', 
    'file read error for /data/file.dat, exit status = 13', 32933157115, 33278, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-02-13 02:39:00', '2026-02-13 03:55:00', 
    76, 'Success', 0, NULL, 
    NULL, 20605458112, 12650, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-02-13 23:58:00', '2026-02-14 02:09:00', 
    131, 'Success', 0, NULL, 
    NULL, 19483795858, 37955, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-02-13 23:24:00', '2026-02-14 02:19:00', 
    175, 'Success', 0, NULL, 
    NULL, 10844457185, 28269, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-02-13 02:32:00', '2026-02-13 04:32:00', 
    120, 'Failed', 84, '84', 
    'disk full on staging directory /backup/staging, exit status = 84', 20099896965, 18362, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-02-13 00:26:00', '2026-02-13 02:44:00', 
    138, 'Success', 0, NULL, 
    NULL, 51768746056, 32256, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-02-13 02:48:00', '2026-02-13 03:41:00', 
    53, 'Success', 0, NULL, 
    NULL, 8735093613, 22740, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-02-13 02:00:00', '2026-02-13 02:37:00', 
    37, 'Success', 0, NULL, 
    NULL, 10881183170, 27906, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-02-13 23:25:00', '2026-02-14 02:17:00', 
    172, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 33801791795, 34499, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-02-13 01:37:00', '2026-02-13 03:15:00', 
    98, 'Success', 0, NULL, 
    NULL, 39059353783, 10127, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-02-13 00:45:00', '2026-02-13 01:34:00', 
    49, 'Success', 0, NULL, 
    NULL, 19175608736, 28782, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-02-13 23:40:00', '2026-02-14 02:30:00', 
    170, 'Success', 0, NULL, 
    NULL, 46335847633, 33772, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-02-13 02:46:00', '2026-02-13 03:17:00', 
    31, 'Success', 0, NULL, 
    NULL, 10544791938, 42471, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-02-13 00:05:00', '2026-02-13 02:17:00', 
    132, 'Success', 0, NULL, 
    NULL, 18346506779, 38918, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-02-13 01:04:00', '2026-02-13 01:51:00', 
    47, 'Success', 0, NULL, 
    NULL, 53024621728, 33382, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-02-13 02:11:00', '2026-02-13 03:18:00', 
    67, 'Success', 0, NULL, 
    NULL, 44707656250, 27731, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-02-13 23:32:00', '2026-02-14 00:43:00', 
    71, 'Success', 0, NULL, 
    NULL, 42210862137, 25524, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-02-13 00:54:00', '2026-02-13 03:49:00', 
    175, 'Success', 0, NULL, 
    NULL, 26769871641, 31240, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-02-13 00:54:00', '2026-02-13 01:52:00', 
    58, 'Success', 0, NULL, 
    NULL, 27001794635, 12353, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-02-13 02:56:00', '2026-02-13 05:47:00', 
    171, 'Success', 0, NULL, 
    NULL, 39631810560, 7724, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-02-13 23:39:00', '2026-02-14 00:50:00', 
    71, 'Success', 0, NULL, 
    NULL, 27058884464, 40905, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-02-13 23:11:00', '2026-02-14 00:11:00', 
    60, 'Failed', 1, '1', 
    'backup failed with general error, exit status = 1', 5958099864, 10292, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-02-13 01:27:00', '2026-02-13 01:44:00', 
    17, 'Success', 0, NULL, 
    NULL, 26365211718, 3741, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-02-13 02:21:00', '2026-02-13 02:56:00', 
    35, 'Success', 0, NULL, 
    NULL, 28550264420, 33779, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-02-13 00:07:00', '2026-02-13 01:00:00', 
    53, 'Success', 0, NULL, 
    NULL, 40065192679, 39256, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-02-13 00:48:00', '2026-02-13 03:21:00', 
    153, 'Success', 0, NULL, 
    NULL, 34277523500, 18497, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-02-13 01:03:00', '2026-02-13 03:29:00', 
    146, 'Success', 0, NULL, 
    NULL, 13969057149, 41871, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-02-13 02:18:00', '2026-02-13 04:14:00', 
    116, 'Success', 0, NULL, 
    NULL, 46224406756, 36982, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-02-13 02:34:00', '2026-02-13 03:30:00', 
    56, 'Success', 0, NULL, 
    NULL, 47301288606, 20830, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-02-13 23:48:00', '2026-02-14 01:38:00', 
    110, 'Success', 0, NULL, 
    NULL, 37552742306, 28129, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-02-13 00:46:00', '2026-02-13 02:49:00', 
    123, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 45507608158, 18996, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-02-13 00:48:00', '2026-02-13 02:30:00', 
    102, 'Success', 0, NULL, 
    NULL, 45810954411, 8658, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-02-13 02:40:00', '2026-02-13 03:59:00', 
    79, 'Success', 0, NULL, 
    NULL, 32741831857, 41792, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-02-13 00:56:00', '2026-02-13 02:41:00', 
    105, 'Success', 0, NULL, 
    NULL, 8758194801, 44507, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-02-13 02:18:00', '2026-02-13 02:52:00', 
    34, 'Success', 0, NULL, 
    NULL, 28595211095, 10455, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-02-13 23:13:00', '2026-02-14 02:03:00', 
    170, 'Success', 0, NULL, 
    NULL, 27414670563, 42707, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-02-13 02:33:00', '2026-02-13 02:52:00', 
    19, 'Success', 0, NULL, 
    NULL, 41827698946, 37359, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'DAILY_INCREMENTAL', 'SAMSUNG_DB01_Incremental', 'Incremental',
    '2026-02-14 23:56:00', '2026-02-15 00:12:00', 
    16, 'Success', 0, NULL, 
    NULL, 11913598179, 8457, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'DAILY_INCREMENTAL', 'SAMSUNG_DB02_Incremental', 'Incremental',
    '2026-02-14 00:35:00', '2026-02-14 01:11:00', 
    36, 'Success', 0, NULL, 
    NULL, 26301994074, 1165, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB01_Incremental', 'Incremental',
    '2026-02-14 00:40:00', '2026-02-14 02:54:00', 
    134, 'Success', 0, NULL, 
    NULL, 7267037109, 2655, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'DAILY_INCREMENTAL', 'SAMSUNG_WEB02_Incremental', 'Incremental',
    '2026-02-14 02:06:00', '2026-02-14 04:23:00', 
    137, 'Success', 0, NULL, 
    NULL, 28933846706, 22046, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'DAILY_INCREMENTAL', 'SAMSUNG_APP01_Incremental', 'Incremental',
    '2026-02-14 23:05:00', '2026-02-15 00:51:00', 
    106, 'Success', 0, NULL, 
    NULL, 33905292059, 35333, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'DAILY_INCREMENTAL', 'LG_DB01_Incremental', 'Incremental',
    '2026-02-14 02:14:00', '2026-02-14 02:50:00', 
    36, 'Success', 0, NULL, 
    NULL, 33416610734, 18786, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'DAILY_INCREMENTAL', 'LG_WEB01_Incremental', 'Incremental',
    '2026-02-14 02:22:00', '2026-02-14 03:52:00', 
    90, 'Success', 0, NULL, 
    NULL, 17533677908, 35224, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'DAILY_INCREMENTAL', 'LG_APP01_Incremental', 'Incremental',
    '2026-02-14 23:40:00', '2026-02-15 01:45:00', 
    125, 'Success', 0, NULL, 
    NULL, 49592602420, 48357, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'DAILY_INCREMENTAL', 'LG_FILE01_Incremental', 'Incremental',
    '2026-02-14 00:53:00', '2026-02-14 03:30:00', 
    157, 'Success', 0, NULL, 
    NULL, 45395206078, 40708, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'DAILY_INCREMENTAL', 'SKHYNIX_DB01_Incremental', 'Incremental',
    '2026-02-14 02:41:00', '2026-02-14 05:27:00', 
    166, 'Success', 0, NULL, 
    NULL, 43985703678, 4750, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'DAILY_INCREMENTAL', 'SKHYNIX_DB02_Incremental', 'Incremental',
    '2026-02-14 23:41:00', '2026-02-15 01:58:00', 
    137, 'Success', 0, NULL, 
    NULL, 21833913066, 42560, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'DAILY_INCREMENTAL', 'SKHYNIX_APP01_Incremental', 'Incremental',
    '2026-02-14 01:57:00', '2026-02-14 02:12:00', 
    15, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 21409174405, 22257, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'DAILY_INCREMENTAL', 'SKHYNIX_APP02_Incremental', 'Incremental',
    '2026-02-14 01:07:00', '2026-02-14 03:17:00', 
    130, 'Success', 0, NULL, 
    NULL, 11661254374, 32714, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'DAILY_INCREMENTAL', 'HYUNDAI_DB01_Incremental', 'Incremental',
    '2026-02-14 23:14:00', '2026-02-14 23:39:00', 
    25, 'Success', 0, NULL, 
    NULL, 36726850723, 19437, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'DAILY_INCREMENTAL', 'HYUNDAI_DB02_Incremental', 'Incremental',
    '2026-02-14 00:45:00', '2026-02-14 01:02:00', 
    17, 'Success', 0, NULL, 
    NULL, 23209172966, 4822, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'DAILY_INCREMENTAL', 'HYUNDAI_DB03_Incremental', 'Incremental',
    '2026-02-14 00:40:00', '2026-02-14 02:11:00', 
    91, 'Success', 0, NULL, 
    NULL, 50649968438, 37565, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'DAILY_INCREMENTAL', 'HYUNDAI_WEB01_Incremental', 'Incremental',
    '2026-02-14 00:25:00', '2026-02-14 01:45:00', 
    80, 'Failed', 58, '58', 
    'ERR - cannot connect to media server, exit status = 58', 27702864472, 6786, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'DAILY_INCREMENTAL', 'HYUNDAI_APP01_Incremental', 'Incremental',
    '2026-02-14 23:58:00', '2026-02-15 01:40:00', 
    102, 'Success', 0, NULL, 
    NULL, 42942057871, 8077, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'DAILY_INCREMENTAL', 'HYUNDAI_FILE01_Incremental', 'Incremental',
    '2026-02-14 00:58:00', '2026-02-14 03:16:00', 
    138, 'Success', 0, NULL, 
    NULL, 10343946507, 38558, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'DAILY_INCREMENTAL', 'POSCO_DB01_Incremental', 'Incremental',
    '2026-02-14 23:23:00', '2026-02-15 00:19:00', 
    56, 'Success', 0, NULL, 
    NULL, 26589507966, 41665, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'DAILY_INCREMENTAL', 'POSCO_WEB01_Incremental', 'Incremental',
    '2026-02-14 23:54:00', '2026-02-15 02:08:00', 
    134, 'Success', 0, NULL, 
    NULL, 12271177340, 2264, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'DAILY_INCREMENTAL', 'POSCO_APP01_Incremental', 'Incremental',
    '2026-02-14 01:31:00', '2026-02-14 01:49:00', 
    18, 'Success', 0, NULL, 
    NULL, 16087530823, 37915, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'DAILY_INCREMENTAL', 'POSCO_FILE01_Incremental', 'Incremental',
    '2026-02-14 02:15:00', '2026-02-14 03:02:00', 
    47, 'Success', 0, NULL, 
    NULL, 34984080325, 14262, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'DAILY_INCREMENTAL', 'NAVER_DB01_Incremental', 'Incremental',
    '2026-02-14 01:04:00', '2026-02-14 02:49:00', 
    105, 'Success', 0, NULL, 
    NULL, 11081509034, 41569, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'DAILY_INCREMENTAL', 'NAVER_WEB01_Incremental', 'Incremental',
    '2026-02-14 23:55:00', '2026-02-15 01:15:00', 
    80, 'Success', 0, NULL, 
    NULL, 25577360613, 24790, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'DAILY_INCREMENTAL', 'NAVER_WEB02_Incremental', 'Incremental',
    '2026-02-14 00:38:00', '2026-02-14 01:46:00', 
    68, 'Success', 0, NULL, 
    NULL, 34506259154, 33552, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'DAILY_INCREMENTAL', 'NAVER_APP01_Incremental', 'Incremental',
    '2026-02-14 00:41:00', '2026-02-14 03:08:00', 
    147, 'Success', 0, NULL, 
    NULL, 24839783009, 33630, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'DAILY_INCREMENTAL', 'KAKAO_DB01_Incremental', 'Incremental',
    '2026-02-14 02:58:00', '2026-02-14 05:28:00', 
    150, 'Success', 0, NULL, 
    NULL, 31152566888, 31268, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'DAILY_INCREMENTAL', 'KAKAO_WEB01_Incremental', 'Incremental',
    '2026-02-14 02:26:00', '2026-02-14 03:20:00', 
    54, 'Success', 0, NULL, 
    NULL, 33183181504, 40990, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'DAILY_INCREMENTAL', 'KAKAO_APP01_Incremental', 'Incremental',
    '2026-02-14 02:39:00', '2026-02-14 03:58:00', 
    79, 'Success', 0, NULL, 
    NULL, 48175795398, 28729, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'DAILY_INCREMENTAL', 'COUPANG_DB01_Incremental', 'Incremental',
    '2026-02-14 23:24:00', '2026-02-15 02:00:00', 
    156, 'Success', 0, NULL, 
    NULL, 13646433943, 25028, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'DAILY_INCREMENTAL', 'COUPANG_DB02_Incremental', 'Incremental',
    '2026-02-14 00:46:00', '2026-02-14 03:13:00', 
    147, 'Success', 0, NULL, 
    NULL, 42018288450, 4212, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'DAILY_INCREMENTAL', 'COUPANG_WEB01_Incremental', 'Incremental',
    '2026-02-14 01:30:00', '2026-02-14 02:54:00', 
    84, 'Success', 0, NULL, 
    NULL, 18197132646, 43163, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'DAILY_INCREMENTAL', 'COUPANG_WEB02_Incremental', 'Incremental',
    '2026-02-14 01:55:00', '2026-02-14 03:21:00', 
    86, 'Success', 0, NULL, 
    NULL, 15696423567, 18514, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'DAILY_INCREMENTAL', 'COUPANG_APP01_Incremental', 'Incremental',
    '2026-02-14 02:20:00', '2026-02-14 03:27:00', 
    67, 'Success', 0, NULL, 
    NULL, 22823140538, 36528, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'DAILY_INCREMENTAL', 'COUPANG_FILE01_Incremental', 'Incremental',
    '2026-02-14 23:06:00', '2026-02-14 23:32:00', 
    26, 'Success', 0, NULL, 
    NULL, 43811877226, 44211, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'DAILY_INCREMENTAL', 'BAEMIN_DB01_Incremental', 'Incremental',
    '2026-02-14 00:03:00', '2026-02-14 00:28:00', 
    25, 'Success', 0, NULL, 
    NULL, 18015094902, 49909, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'DAILY_INCREMENTAL', 'BAEMIN_WEB01_Incremental', 'Incremental',
    '2026-02-14 02:39:00', '2026-02-14 02:50:00', 
    11, 'Success', 0, NULL, 
    NULL, 11489082050, 20078, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'DAILY_INCREMENTAL', 'BAEMIN_APP01_Incremental', 'Incremental',
    '2026-02-14 02:17:00', '2026-02-14 04:49:00', 
    152, 'Success', 0, NULL, 
    NULL, 10164493145, 35093, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'DAILY_INCREMENTAL', 'WOOWA_DB01_Incremental', 'Incremental',
    '2026-02-14 02:19:00', '2026-02-14 03:20:00', 
    61, 'Success', 0, NULL, 
    NULL, 26357756628, 47441, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'DAILY_INCREMENTAL', 'WOOWA_WEB01_Incremental', 'Incremental',
    '2026-02-14 02:32:00', '2026-02-14 03:22:00', 
    50, 'Success', 0, NULL, 
    NULL, 44756612642, 43006, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB01', 'WEEKLY_FULL', 'SAMSUNG_DB01_Full', 'Full',
    '2026-02-15 02:49:00', '2026-02-15 03:50:00', 
    61, 'Success', 0, NULL, 
    NULL, 253336447324, 28086, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'DB02', 'WEEKLY_FULL', 'SAMSUNG_DB02_Full', 'Full',
    '2026-02-15 00:48:00', '2026-02-15 02:51:00', 
    123, 'Success', 0, NULL, 
    NULL, 282842280988, 35518, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB01', 'WEEKLY_FULL', 'SAMSUNG_WEB01_Full', 'Full',
    '2026-02-15 02:09:00', '2026-02-15 03:31:00', 
    82, 'Success', 0, NULL, 
    NULL, 77978096158, 17756, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'WEB02', 'WEEKLY_FULL', 'SAMSUNG_WEB02_Full', 'Full',
    '2026-02-15 02:19:00', '2026-02-15 02:49:00', 
    30, 'Success', 0, NULL, 
    NULL, 163924911857, 25116, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(1, 'APP01', 'WEEKLY_FULL', 'SAMSUNG_APP01_Full', 'Full',
    '2026-02-15 00:00:00', '2026-02-15 02:56:00', 
    176, 'Success', 0, NULL, 
    NULL, 494967489799, 42909, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'DB01', 'WEEKLY_FULL', 'LG_DB01_Full', 'Full',
    '2026-02-15 00:45:00', '2026-02-15 03:25:00', 
    160, 'Failed', 41, '41', 
    'socket read failed - connection timed out, exit status = 41', 269514416020, 8341, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'WEB01', 'WEEKLY_FULL', 'LG_WEB01_Full', 'Full',
    '2026-02-15 02:44:00', '2026-02-15 03:26:00', 
    42, 'Success', 0, NULL, 
    NULL, 254302355309, 21615, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'APP01', 'WEEKLY_FULL', 'LG_APP01_Full', 'Full',
    '2026-02-15 23:26:00', '2026-02-16 02:15:00', 
    169, 'Success', 0, NULL, 
    NULL, 483105019586, 9626, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(2, 'FILE01', 'WEEKLY_FULL', 'LG_FILE01_Full', 'Full',
    '2026-02-15 23:51:00', '2026-02-16 01:51:00', 
    120, 'Success', 0, NULL, 
    NULL, 519363070567, 32861, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB01', 'WEEKLY_FULL', 'SKHYNIX_DB01_Full', 'Full',
    '2026-02-15 01:03:00', '2026-02-15 02:49:00', 
    106, 'Success', 0, NULL, 
    NULL, 415516777116, 16307, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'DB02', 'WEEKLY_FULL', 'SKHYNIX_DB02_Full', 'Full',
    '2026-02-15 23:58:00', '2026-02-16 01:31:00', 
    93, 'Success', 0, NULL, 
    NULL, 504308330447, 37408, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP01', 'WEEKLY_FULL', 'SKHYNIX_APP01_Full', 'Full',
    '2026-02-15 23:37:00', '2026-02-16 02:07:00', 
    150, 'Success', 0, NULL, 
    NULL, 213802524788, 7226, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(3, 'APP02', 'WEEKLY_FULL', 'SKHYNIX_APP02_Full', 'Full',
    '2026-02-15 00:41:00', '2026-02-15 00:57:00', 
    16, 'Success', 0, NULL, 
    NULL, 377445112608, 2905, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB01', 'WEEKLY_FULL', 'HYUNDAI_DB01_Full', 'Full',
    '2026-02-15 02:22:00', '2026-02-15 04:30:00', 
    128, 'Success', 0, NULL, 
    NULL, 60911575113, 6499, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB02', 'WEEKLY_FULL', 'HYUNDAI_DB02_Full', 'Full',
    '2026-02-15 02:11:00', '2026-02-15 02:33:00', 
    22, 'Success', 0, NULL, 
    NULL, 533458509020, 15361, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'DB03', 'WEEKLY_FULL', 'HYUNDAI_DB03_Full', 'Full',
    '2026-02-15 02:49:00', '2026-02-15 03:37:00', 
    48, 'Success', 0, NULL, 
    NULL, 434030851904, 26233, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'WEB01', 'WEEKLY_FULL', 'HYUNDAI_WEB01_Full', 'Full',
    '2026-02-15 01:39:00', '2026-02-15 04:14:00', 
    155, 'Success', 0, NULL, 
    NULL, 527388209038, 40828, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'APP01', 'WEEKLY_FULL', 'HYUNDAI_APP01_Full', 'Full',
    '2026-02-15 01:09:00', '2026-02-15 03:27:00', 
    138, 'Success', 0, NULL, 
    NULL, 487562602687, 37909, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(4, 'FILE01', 'WEEKLY_FULL', 'HYUNDAI_FILE01_Full', 'Full',
    '2026-02-15 23:28:00', '2026-02-16 01:11:00', 
    103, 'Success', 0, NULL, 
    NULL, 91719836194, 16386, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'DB01', 'WEEKLY_FULL', 'POSCO_DB01_Full', 'Full',
    '2026-02-15 23:22:00', '2026-02-15 23:52:00', 
    30, 'Success', 0, NULL, 
    NULL, 166206320336, 6959, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'WEB01', 'WEEKLY_FULL', 'POSCO_WEB01_Full', 'Full',
    '2026-02-15 00:55:00', '2026-02-15 03:27:00', 
    152, 'Success', 0, NULL, 
    NULL, 415716652412, 44304, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'APP01', 'WEEKLY_FULL', 'POSCO_APP01_Full', 'Full',
    '2026-02-15 01:44:00', '2026-02-15 04:03:00', 
    139, 'Success', 0, NULL, 
    NULL, 535719619923, 23372, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(5, 'FILE01', 'WEEKLY_FULL', 'POSCO_FILE01_Full', 'Full',
    '2026-02-15 01:23:00', '2026-02-15 02:34:00', 
    71, 'Success', 0, NULL, 
    NULL, 309154584646, 44339, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'DB01', 'WEEKLY_FULL', 'NAVER_DB01_Full', 'Full',
    '2026-02-15 23:04:00', '2026-02-16 00:46:00', 
    102, 'Success', 0, NULL, 
    NULL, 378051877007, 11471, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB01', 'WEEKLY_FULL', 'NAVER_WEB01_Full', 'Full',
    '2026-02-15 02:10:00', '2026-02-15 04:33:00', 
    143, 'Success', 0, NULL, 
    NULL, 444546535207, 41319, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'WEB02', 'WEEKLY_FULL', 'NAVER_WEB02_Full', 'Full',
    '2026-02-15 01:06:00', '2026-02-15 01:27:00', 
    21, 'Success', 0, NULL, 
    NULL, 336079040586, 45238, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(6, 'APP01', 'WEEKLY_FULL', 'NAVER_APP01_Full', 'Full',
    '2026-02-15 23:13:00', '2026-02-16 01:17:00', 
    124, 'Success', 0, NULL, 
    NULL, 360652441804, 14432, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'DB01', 'WEEKLY_FULL', 'KAKAO_DB01_Full', 'Full',
    '2026-02-15 23:20:00', '2026-02-16 02:12:00', 
    172, 'Success', 0, NULL, 
    NULL, 387543262938, 25586, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'WEB01', 'WEEKLY_FULL', 'KAKAO_WEB01_Full', 'Full',
    '2026-02-15 02:43:00', '2026-02-15 05:01:00', 
    138, 'Success', 0, NULL, 
    NULL, 315413508117, 32564, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(7, 'APP01', 'WEEKLY_FULL', 'KAKAO_APP01_Full', 'Full',
    '2026-02-15 01:53:00', '2026-02-15 02:12:00', 
    19, 'Success', 0, NULL, 
    NULL, 338882093095, 23419, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB01', 'WEEKLY_FULL', 'COUPANG_DB01_Full', 'Full',
    '2026-02-15 23:12:00', '2026-02-16 01:56:00', 
    164, 'Success', 0, NULL, 
    NULL, 350328157671, 19588, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'DB02', 'WEEKLY_FULL', 'COUPANG_DB02_Full', 'Full',
    '2026-02-15 00:45:00', '2026-02-15 01:07:00', 
    22, 'Success', 0, NULL, 
    NULL, 249443965997, 12466, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB01', 'WEEKLY_FULL', 'COUPANG_WEB01_Full', 'Full',
    '2026-02-15 02:20:00', '2026-02-15 04:09:00', 
    109, 'Success', 0, NULL, 
    NULL, 67889383065, 4705, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'WEB02', 'WEEKLY_FULL', 'COUPANG_WEB02_Full', 'Full',
    '2026-02-15 02:49:00', '2026-02-15 05:31:00', 
    162, 'Success', 0, NULL, 
    NULL, 395655214474, 37001, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'APP01', 'WEEKLY_FULL', 'COUPANG_APP01_Full', 'Full',
    '2026-02-15 02:52:00', '2026-02-15 04:08:00', 
    76, 'Success', 0, NULL, 
    NULL, 391806355039, 27181, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(8, 'FILE01', 'WEEKLY_FULL', 'COUPANG_FILE01_Full', 'Full',
    '2026-02-15 00:55:00', '2026-02-15 01:09:00', 
    14, 'Success', 0, NULL, 
    NULL, 322399867772, 47633, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'DB01', 'WEEKLY_FULL', 'BAEMIN_DB01_Full', 'Full',
    '2026-02-15 00:18:00', '2026-02-15 00:41:00', 
    23, 'Success', 0, NULL, 
    NULL, 397237118743, 41499, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'WEB01', 'WEEKLY_FULL', 'BAEMIN_WEB01_Full', 'Full',
    '2026-02-15 02:17:00', '2026-02-15 03:30:00', 
    73, 'Success', 0, NULL, 
    NULL, 497359486616, 12153, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(9, 'APP01', 'WEEKLY_FULL', 'BAEMIN_APP01_Full', 'Full',
    '2026-02-15 23:34:00', '2026-02-16 02:02:00', 
    148, 'Success', 0, NULL, 
    NULL, 305858794421, 26640, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'DB01', 'WEEKLY_FULL', 'WOOWA_DB01_Full', 'Full',
    '2026-02-15 02:36:00', '2026-02-15 03:48:00', 
    72, 'Success', 0, NULL, 
    NULL, 70397688248, 6263, 
    'Dummy', 'system');
INSERT INTO backup_jobs (customer_id, server_name, policy_name, job_name, backup_type, 
    start_time, end_time, duration_minutes, status, exit_code, error_code, error_message, 
    bytes_written, files_backed_up, log_source, uploaded_by) VALUES
(10, 'WEB01', 'WEEKLY_FULL', 'WOOWA_WEB01_Full', 'Full',
    '2026-02-15 02:43:00', '2026-02-15 04:06:00', 
    83, 'Success', 0, NULL, 
    NULL, 61525287537, 11928, 
    'Dummy', 'system');

-- 총 1271건의 백업 작업 로그 생성 완료

-- 로그 업로드 히스토리
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(4, 'Email', 
    'HYUNDAI_backup_20260116.log', 1747, 
    'engineer@dstl.co.kr', '2026-01-16 13:50:16', 'Success', 
    6, 3, 4.55);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(8, 'Email', 
    'COUPANG_backup_20260116.log', 1523, 
    'engineer@dstl.co.kr', '2026-01-16 11:06:16', 'Success', 
    6, 0, 6.63);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(5, 'Agent', 
    'POSCO_backup_20260117.log', 2443, 
    'engineer@dstl.co.kr', '2026-01-17 14:52:16', 'Success', 
    4, 2, 5.60);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(10, 'Email', 
    'WOOWA_backup_20260117.log', 3304, 
    'engineer@dstl.co.kr', '2026-01-17 15:31:16', 'Success', 
    2, 1, 6.22);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(4, 'Email', 
    'HYUNDAI_backup_20260118.log', 1470, 
    'engineer@dstl.co.kr', '2026-01-18 15:09:16', 'Success', 
    6, 0, 1.90);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(8, 'Agent', 
    'COUPANG_backup_20260118.log', 4362, 
    'engineer@dstl.co.kr', '2026-01-18 13:43:16', 'Success', 
    6, 1, 2.44);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(8, 'Agent', 
    'COUPANG_backup_20260119.log', 4264, 
    'engineer@dstl.co.kr', '2026-01-19 09:13:16', 'Success', 
    6, 0, 4.34);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(4, 'Email', 
    'HYUNDAI_backup_20260120.log', 4941, 
    'engineer@dstl.co.kr', '2026-01-20 16:37:16', 'Success', 
    6, 0, 2.59);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(6, 'Email', 
    'NAVER_backup_20260121.log', 1773, 
    'engineer@dstl.co.kr', '2026-01-21 09:33:16', 'Success', 
    4, 1, 2.75);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(2, 'Agent', 
    'LG_backup_20260122.log', 4009, 
    'engineer@dstl.co.kr', '2026-01-22 10:10:16', 'Success', 
    4, 1, 4.33);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(4, 'Agent', 
    'HYUNDAI_backup_20260123.log', 4454, 
    'engineer@dstl.co.kr', '2026-01-23 15:57:16', 'Success', 
    6, 3, 5.57);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(9, 'Email', 
    'BAEMIN_backup_20260123.log', 2976, 
    'engineer@dstl.co.kr', '2026-01-23 11:19:16', 'Success', 
    3, 0, 2.84);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(7, 'Agent', 
    'KAKAO_backup_20260124.log', 4173, 
    'engineer@dstl.co.kr', '2026-01-24 13:04:16', 'Success', 
    3, 3, 8.30);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(9, 'Email', 
    'BAEMIN_backup_20260125.log', 1553, 
    'engineer@dstl.co.kr', '2026-01-25 17:56:16', 'Success', 
    3, 1, 8.02);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(4, 'Email', 
    'HYUNDAI_backup_20260125.log', 3229, 
    'engineer@dstl.co.kr', '2026-01-25 15:52:16', 'Success', 
    6, 2, 4.22);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(7, 'Agent', 
    'KAKAO_backup_20260126.log', 3090, 
    'engineer@dstl.co.kr', '2026-01-26 13:12:16', 'Success', 
    3, 1, 4.69);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(5, 'Agent', 
    'POSCO_backup_20260127.log', 1128, 
    'engineer@dstl.co.kr', '2026-01-27 10:32:16', 'Success', 
    4, 1, 6.75);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(3, 'Email', 
    'SKHYNIX_backup_20260127.log', 1541, 
    'engineer@dstl.co.kr', '2026-01-27 11:19:16', 'Success', 
    4, 1, 4.95);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(1, 'Agent', 
    'SAMSUNG_backup_20260128.log', 4653, 
    'engineer@dstl.co.kr', '2026-01-28 15:53:16', 'Success', 
    5, 0, 7.93);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(1, 'Email', 
    'SAMSUNG_backup_20260128.log', 1091, 
    'engineer@dstl.co.kr', '2026-01-28 15:29:16', 'Success', 
    5, 2, 7.02);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(1, 'Email', 
    'SAMSUNG_backup_20260129.log', 4717, 
    'engineer@dstl.co.kr', '2026-01-29 12:56:16', 'Success', 
    5, 0, 7.84);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(2, 'Email', 
    'LG_backup_20260130.log', 4975, 
    'engineer@dstl.co.kr', '2026-01-30 16:22:16', 'Success', 
    4, 1, 4.79);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(10, 'Agent', 
    'WOOWA_backup_20260131.log', 3160, 
    'engineer@dstl.co.kr', '2026-01-31 10:37:16', 'Success', 
    2, 3, 6.36);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(2, 'Email', 
    'LG_backup_20260201.log', 3529, 
    'engineer@dstl.co.kr', '2026-02-01 11:02:16', 'Success', 
    4, 1, 2.07);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(6, 'Email', 
    'NAVER_backup_20260202.log', 756, 
    'engineer@dstl.co.kr', '2026-02-02 14:43:16', 'Success', 
    4, 0, 4.72);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(4, 'Email', 
    'HYUNDAI_backup_20260202.log', 3460, 
    'engineer@dstl.co.kr', '2026-02-02 13:42:16', 'Success', 
    6, 1, 7.01);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(5, 'Email', 
    'POSCO_backup_20260203.log', 507, 
    'engineer@dstl.co.kr', '2026-02-03 17:25:16', 'Success', 
    4, 3, 4.49);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(4, 'Email', 
    'HYUNDAI_backup_20260204.log', 2015, 
    'engineer@dstl.co.kr', '2026-02-04 10:30:16', 'Success', 
    6, 1, 4.41);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(7, 'Agent', 
    'KAKAO_backup_20260204.log', 4363, 
    'engineer@dstl.co.kr', '2026-02-04 11:11:16', 'Success', 
    3, 1, 7.62);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(10, 'Agent', 
    'WOOWA_backup_20260205.log', 916, 
    'engineer@dstl.co.kr', '2026-02-05 15:53:16', 'Success', 
    2, 1, 4.98);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(10, 'Agent', 
    'WOOWA_backup_20260205.log', 4313, 
    'engineer@dstl.co.kr', '2026-02-05 09:40:16', 'Success', 
    2, 3, 3.29);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(4, 'Email', 
    'HYUNDAI_backup_20260206.log', 4097, 
    'engineer@dstl.co.kr', '2026-02-06 13:03:16', 'Success', 
    6, 0, 8.49);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(2, 'Agent', 
    'LG_backup_20260206.log', 659, 
    'engineer@dstl.co.kr', '2026-02-06 12:08:16', 'Success', 
    4, 2, 4.10);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(7, 'Agent', 
    'KAKAO_backup_20260207.log', 2382, 
    'engineer@dstl.co.kr', '2026-02-07 15:03:16', 'Success', 
    3, 1, 5.12);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(5, 'Email', 
    'POSCO_backup_20260207.log', 4269, 
    'engineer@dstl.co.kr', '2026-02-07 09:13:16', 'Success', 
    4, 2, 7.42);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(4, 'Agent', 
    'HYUNDAI_backup_20260208.log', 2677, 
    'engineer@dstl.co.kr', '2026-02-08 10:39:16', 'Success', 
    6, 0, 7.30);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(1, 'Agent', 
    'SAMSUNG_backup_20260208.log', 2047, 
    'engineer@dstl.co.kr', '2026-02-08 16:16:16', 'Success', 
    5, 1, 7.28);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(4, 'Email', 
    'HYUNDAI_backup_20260209.log', 1325, 
    'engineer@dstl.co.kr', '2026-02-09 17:32:16', 'Success', 
    6, 0, 3.60);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(10, 'Agent', 
    'WOOWA_backup_20260210.log', 4560, 
    'engineer@dstl.co.kr', '2026-02-10 15:23:16', 'Success', 
    2, 3, 7.59);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(1, 'Email', 
    'SAMSUNG_backup_20260211.log', 4930, 
    'engineer@dstl.co.kr', '2026-02-11 14:25:16', 'Success', 
    5, 3, 8.00);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(7, 'Agent', 
    'KAKAO_backup_20260212.log', 591, 
    'engineer@dstl.co.kr', '2026-02-12 14:36:16', 'Success', 
    3, 1, 4.19);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(10, 'Email', 
    'WOOWA_backup_20260213.log', 4718, 
    'engineer@dstl.co.kr', '2026-02-13 13:59:16', 'Success', 
    2, 3, 7.72);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(8, 'Agent', 
    'COUPANG_backup_20260213.log', 1291, 
    'engineer@dstl.co.kr', '2026-02-13 15:31:16', 'Success', 
    6, 2, 5.55);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(4, 'Email', 
    'HYUNDAI_backup_20260214.log', 4410, 
    'engineer@dstl.co.kr', '2026-02-14 14:21:16', 'Success', 
    6, 3, 4.39);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(6, 'Email', 
    'NAVER_backup_20260215.log', 1513, 
    'engineer@dstl.co.kr', '2026-02-15 11:57:16', 'Success', 
    4, 2, 2.35);
INSERT INTO log_uploads (customer_id, upload_method, file_name, file_size_kb, 
    uploader_email, upload_timestamp, parsing_status, jobs_extracted, errors_found, processing_time_seconds) VALUES
(4, 'Agent', 
    'HYUNDAI_backup_20260215.log', 3174, 
    'engineer@dstl.co.kr', '2026-02-15 17:33:16', 'Success', 
    6, 3, 7.94);

-- 총 46건의 업로드 기록 생성 완료

-- 통계 정보
-- 전체 백업 작업: 1271건
-- 성공: 1134건 (89.2%)
-- 실패: 137건 (10.8%)
