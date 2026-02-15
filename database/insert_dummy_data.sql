-- ============================================
-- V-BIP 더미 데이터 삽입
-- ============================================

-- 1. 엔지니어 데이터 (5명)
INSERT INTO engineers (employee_code, name, email, phone, specialization, skill_level, max_concurrent_tickets) VALUES
('ENG001', '김태현', 'kim.th@dstl.co.kr', '010-1234-5601', ARRAY['Veritas', 'Network', 'Storage'], 'Expert', 8),
('ENG002', '이수진', 'lee.sj@dstl.co.kr', '010-1234-5602', ARRAY['Veritas', 'Linux'], 'Senior', 6),
('ENG003', '박민수', 'park.ms@dstl.co.kr', '010-1234-5603', ARRAY['Veritas', 'Windows'], 'Senior', 6),
('ENG004', '정하늘', 'jung.hn@dstl.co.kr', '010-1234-5604', ARRAY['Network', 'Firewall'], 'Junior', 4),
('ENG005', '최영희', 'choi.yh@dstl.co.kr', '010-1234-5605', ARRAY['Veritas', 'Tape'], 'Expert', 7);

-- 2. 고객사 데이터 (10개사)
INSERT INTO customers (customer_code, customer_name, contact_person, contact_email, contact_phone, 
    site_type, access_method, veritas_version, server_count, total_backup_size_gb, 
    contract_tier, monthly_fee, sla_response_hours, primary_engineer_id, secondary_engineer_id) VALUES
('SAMSUNG', '삼성전자', '김철수', 'kim.cs@samsung.com', '02-2000-1001', 'Remote', 'VPN', '10.1.1', 25, 5000.50, 'Gold', 8000000, 4, 1, 2),
('LG', 'LG전자', '이영희', 'lee.yh@lge.com', '02-3000-2001', 'Hybrid', 'TeamViewer', '10.0.1', 18, 3500.20, 'Gold', 5000000, 4, 1, 3),
('SKHYNIX', 'SK하이닉스', '박성호', 'park.sh@skhynix.com', '031-5000-3001', 'Remote', 'VPN', '10.1.1', 22, 4200.80, 'Gold', 7000000, 4, 2, 1),
('HYUNDAI', '현대자동차', '최민지', 'choi.mj@hyundai.com', '02-4000-4001', 'Onsite', 'OnSite', '9.1.1', 30, 6500.00, 'Gold', 10000000, 8, 1, 5),
('POSCO', '포스코', '정태웅', 'jung.tw@posco.com', '054-6000-5001', 'Onsite', 'OnSite', '10.0.1', 20, 3800.30, 'Silver', 4000000, 8, 3, 2),
('NAVER', '네이버', '강유진', 'kang.yj@naver.com', '031-7000-6001', 'Remote', 'VPN', '10.1.1', 15, 2500.60, 'Silver', 3500000, 8, 2, 4),
('KAKAO', '카카오', '윤서연', 'yoon.sy@kakaocorp.com', '031-8000-7001', 'Hybrid', 'TeamViewer', '10.0.1', 12, 2000.40, 'Silver', 3000000, 8, 3, 1),
('COUPANG', '쿠팡', '임동현', 'lim.dh@coupang.com', '02-9000-8001', 'Remote', 'VPN', '10.1.1', 28, 7200.90, 'Gold', 9000000, 4, 5, 2),
('BAEMIN', '배달의민족', '서지훈', 'seo.jh@woowahan.com', '02-1000-9001', 'Hybrid', 'TeamViewer', '10.0.1', 10, 1500.20, 'Bronze', 2000000, 24, 4, 3),
('WOOWA', '우아한형제들', '한민규', 'han.mg@woowahan.com', '02-1100-0001', 'Onsite', 'OnSite', '9.1.1', 8, 1200.10, 'Bronze', 1500000, 24, 5, 4);

-- 3. 에러 패턴 및 트러블슈팅 가이드 (주요 에러 코드)
INSERT INTO error_patterns (error_code, error_type, error_name, error_description, symptom, root_cause, 
    troubleshooting_steps, auto_fix_script, auto_fix_enabled, severity, avg_resolution_minutes, success_rate_percent) VALUES

('58', 'Tape Error', 'Cannot connect to media server', 
 '미디어 서버에 연결할 수 없습니다. 테이프 드라이브 또는 네트워크 문제일 수 있습니다.',
 '백업 작업이 시작되지 않고 즉시 실패합니다. bptm 프로세스에서 에러 발생.',
 '1) 테이프 드라이브 오프라인 2) 미디어 서버 네트워크 단절 3) bptm 서비스 중단',
 '1단계: 테이프 드라이브 물리적 상태 확인
2단계: 미디어 서버 ping 테스트 (ping <media_server>)
3단계: 방화벽 포트 확인 (13782, 13724)
4단계: bptm 프로세스 재시작
  Windows: net stop "Veritas NetBackup Device Manager" && net start "Veritas NetBackup Device Manager"
  Linux: /usr/openv/netbackup/bin/bptm -restart
5단계: 테이프 드라이브 재부팅 (필요 시)',
 'systemctl restart netbackup-bptm',
 false, 'High', 45, 85.50),

('41', 'Network Error', 'Network connection timeout',
 '클라이언트 서버와의 네트워크 연결이 타임아웃되었습니다.',
 '백업이 시작되었으나 중간에 실패합니다. "socket read failed" 메시지 표시.',
 '1) 클라이언트 서버 네트워크 불안정 2) 방화벽 차단 3) bpcd 서비스 중단 4) DNS 해상도 실패',
 '1단계: 클라이언트 서버 네트워크 연결 확인
  ping <client_server>
  telnet <client_server> 13782
2단계: 방화벽 포트 확인 (13782, 13724, 1556)
3단계: 클라이언트에서 bpcd 서비스 상태 확인
  Windows: net start | findstr bpcd
  Linux: ps -ef | grep bpcd
4단계: bpcd 서비스 재시작
  Windows: net stop "Veritas NetBackup Client Service" && net start "Veritas NetBackup Client Service"
  Linux: /usr/openv/netbackup/bin/bpcd -restart
5단계: DNS 확인 및 hosts 파일 점검
6단계: 백업 재시도',
 'ping -c 3 $CLIENT_IP && systemctl restart netbackup-bpcd',
 true, 'High', 30, 92.30),

('84', 'Disk Space', 'Insufficient disk space on staging',
 '스테이징 디스크 공간이 부족합니다. 백업 데이터를 저장할 수 없습니다.',
 '백업이 실패하고 "disk full" 또는 "no space left" 메시지가 표시됩니다.',
 '1) 스테이징 디렉토리 용량 초과 2) 오래된 백업 파일 미정리 3) 임시 파일 누적',
 '1단계: 디스크 사용량 확인
  Windows: dir /s C:\\backup\\staging
  Linux: df -h /backup/staging
2단계: 오래된 백업 파일 삭제 (7일 이상)
  find /backup/staging -name "*.bak" -mtime +7 -delete
3단계: 임시 파일 정리
  rm -rf /tmp/veritas_*
  rm -rf /var/tmp/nb_*
4단계: 로그 파일 압축/아카이빙
5단계: 디스크 증설 검토 (근본 해결)
6단계: 백업 재시도',
 'find /backup/staging -name "*.bak" -mtime +7 -delete && find /tmp -name "veritas_*" -mtime +3 -delete',
 true, 'Critical', 15, 95.80),

('96', 'Client Error', 'Client process not responding',
 '클라이언트 서버의 백업 에이전트가 응답하지 않습니다.',
 '백업이 시작되지 않거나 "client not responding" 메시지가 표시됩니다.',
 '1) bpcd 프로세스 중단 2) 클라이언트 서버 과부하 3) 에이전트 버전 불일치 4) 포트 충돌',
 '1단계: 클라이언트 서버 시스템 부하 확인
  top / Task Manager
2단계: bpcd 프로세스 확인
  ps -ef | grep bpcd (Linux)
  tasklist | findstr bpcd (Windows)
3단계: bpcd 재시작
  /usr/openv/netbackup/bin/bpcd -restart (Linux)
  net restart "Veritas NetBackup Client Service" (Windows)
4단계: 포트 충돌 확인
  netstat -an | grep 13782
5단계: 에이전트 버전 확인 및 업데이트
  /usr/openv/netbackup/bin/version (Linux)
6단계: 백업 재시도',
 'systemctl restart netbackup-bpcd',
 true, 'High', 25, 88.60),

('2106', 'License Error', 'License expired or invalid',
 'Veritas NetBackup 라이선스가 만료되었거나 유효하지 않습니다.',
 '모든 백업 작업이 실패하고 "license error" 메시지가 표시됩니다.',
 '1) 라이선스 만료일 도래 2) 라이선스 키 오류 3) 라이선스 서버 문제',
 '1단계: 라이선스 상태 확인
  /usr/openv/netbackup/bin/admincmd/bpminlicense -list_keys
2단계: 라이선스 만료일 확인
  /usr/openv/netbackup/bin/admincmd/bpminlicense -list_expiry
3단계: 신규 라이선스 발급 요청
  - Veritas 영업팀 또는 파트너사 연락
  - PO (구매 주문서) 준비
4단계: 라이선스 키 등록
  /usr/openv/netbackup/bin/admincmd/bpminlicense -add_keys <license_key>
5단계: 라이선스 서비스 재시작
  systemctl restart netbackup
6단계: 라이선스 적용 확인',
 NULL,
 false, 'Critical', 120, 100.00),

('13', 'File Error', 'File read error',
 '백업 대상 파일을 읽을 수 없습니다.',
 '일부 파일이 백업에서 제외되고 경고 메시지가 표시됩니다.',
 '1) 파일 사용 중 (lock) 2) 파일 권한 문제 3) 파일 손상',
 '1단계: 해당 파일 사용 프로세스 확인
  lsof <filename> (Linux)
  handle.exe <filename> (Windows)
2단계: 파일 권한 확인 및 수정
  chmod 644 <filename>
3단계: VSS 스냅샷 사용 (Windows)
  - 백업 정책에서 "Use Windows VSS" 활성화
4단계: 스킵 리스트 확인
  /usr/openv/netbackup/exclude_list
5단계: 백업 재시도',
 NULL,
 false, 'Low', 10, 70.20),

('1', 'General Error', 'Backup failed with general error',
 '일반적인 백업 실패. 상세한 로그 분석이 필요합니다.',
 '백업이 실패하지만 구체적인 에러 코드가 없습니다.',
 '다양한 원인 가능 (로그 분석 필요)',
 '1단계: 상세 로그 확인
  /usr/openv/netbackup/logs/bpbrm/<timestamp>
2단계: 최근 시스템 변경 사항 확인
3단계: 백업 정책 설정 검토
4단계: Veritas 기술 지원팀 문의
5단계: 로그 파일 제출',
 NULL,
 false, 'Medium', 60, 65.40);

-- 시스템 설정 초기값
INSERT INTO system_config (config_key, config_value, description) VALUES
('email_notification_enabled', 'true', '이메일 알림 활성화 여부'),
('email_from_address', 'veritas-monitor@dstl.co.kr', '발신 이메일 주소'),
('email_smtp_server', 'smtp.gmail.com', 'SMTP 서버 주소'),
('email_smtp_port', '587', 'SMTP 포트'),
('slack_webhook_enabled', 'false', 'Slack 알림 활성화 여부'),
('auto_recovery_enabled', 'true', '자동 복구 기능 활성화 여부'),
('log_retention_days', '365', '로그 보관 기간 (일)'),
('backup_check_interval_minutes', '5', '백업 상태 체크 주기 (분)');
