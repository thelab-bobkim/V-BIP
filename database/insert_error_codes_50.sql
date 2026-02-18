-- ============================================================
-- NetBackup 에러코드 50개 샘플 데이터 (AI 분류 포함)
-- ============================================================

INSERT INTO error_patterns (
    error_code, error_type, error_name, error_description, symptom, root_cause,
    troubleshooting_steps, auto_fix_script, auto_fix_enabled, manual_steps_required,
    severity, resolution_level, ai_confidence_score, classification_reason
) VALUES

-- Level 1: AI 자동 해결 가능 (15개)
('1', 'General', 'Partial Success', '일부 작업이 성공적으로 완료되었습니다', '일부 파일 백업 실패', '파일 권한 또는 잠금 문제', '성공한 작업 확인, 실패한 작업 재시도', NULL, FALSE, TRUE, 'Low', 1, 92.5, '일시적 문제로 자동 재시도 가능'),

('24', 'Network', 'Socket Write Failed', '네트워크 소켓 쓰기 실패', '네트워크 통신 중단', '일시적 네트워크 지연', '네트워크 연결 재시도, 대역폭 확인', 
'ping -c 5 $TARGET_SERVER && netstat -an | grep ESTABLISHED', TRUE, FALSE, 'Medium', 1, 88.0, '네트워크 재연결로 자동 해결 가능'),

('25', 'Network', 'Cannot Connect Socket', '소켓 연결 실패', '서버 연결 불가', '방화벽 또는 서비스 중지', '네트워크 연결 테스트, 서비스 상태 확인',
'telnet $TARGET_SERVER $PORT || nc -zv $TARGET_SERVER $PORT', TRUE, FALSE, 'High', 1, 90.0, '서비스 재시작으로 해결 가능'),

('41', 'Network', 'Connection Timeout', '네트워크 연결 시간 초과', '연결 시간 초과', '네트워크 지연 또는 대역폭 부족', '타임아웃 설정 증가, 대역폭 확인', NULL, FALSE, TRUE, 'Medium', 1, 85.5, '타임아웃 재시도로 해결 가능'),

('50', 'Client', 'Client Not Started', '클라이언트 시작 실패', '백업 클라이언트 미실행', '서비스 중지 또는 충돌', '클라이언트 서비스 재시작',
'systemctl restart netbackup-client || service netbackup restart', TRUE, FALSE, 'High', 1, 95.0, '서비스 재시작으로 자동 해결'),

('84', 'Service', 'Media Manager Not Running', '미디어 관리자 미실행', '백업 미디어 관리 불가', '서비스 중지', '미디어 관리자 서비스 시작',
'bprdm start || /usr/openv/netbackup/bin/bprdm start', TRUE, FALSE, 'Critical', 1, 98.0, '서비스 재시작으로 즉시 해결'),

('96', 'System', 'Memory Allocation Failed', '메모리 할당 실패', '시스템 메모리 부족', '메모리 부족', '불필요한 프로세스 종료, 메모리 확보', 
'free -h && sync && echo 3 > /proc/sys/vm/drop_caches', TRUE, FALSE, 'Critical', 1, 87.0, '캐시 정리로 메모리 확보 가능'),

('13', 'Backup', 'File Read Failed', '파일 읽기 실패', '백업 파일 읽기 오류', '파일 잠금 또는 손상', '파일 권한 확인, 잠금 해제', NULL, FALSE, TRUE, 'Medium', 1, 82.0, '파일 잠금 해제로 재시도 가능'),

('213', 'Storage', 'No Storage Units', '사용 가능한 스토리지 없음', '백업 저장소 없음', '스토리지 풀 미할당', '스토리지 유닛 상태 확인', NULL, FALSE, TRUE, 'High', 1, 80.0, '스토리지 재할당으로 해결 가능'),

('6801', 'Deduplication', 'Dedup Engine Not Running', '중복 제거 엔진 미실행', '중복 제거 서비스 중지', '서비스 미시작', '중복 제거 엔진 시작',
'spoold start || /usr/openv/pdde/pdcr/bin/spoold start', TRUE, FALSE, 'High', 1, 93.0, '서비스 시작으로 자동 해결'),

('11000', 'Backup', 'Checkpoint Restart Failed', '체크포인트 재시작 실패', '백업 재시작 불가', '체크포인트 데이터 손상', '백업 처음부터 재시작', NULL, FALSE, TRUE, 'Medium', 1, 78.0, '백업 재시작으로 해결'),

('12500', 'Catalog', 'Image Cleanup Failed', '이미지 정리 실패', '카탈로그 정리 오류', '카탈로그 데이터베이스 문제', '카탈로그 검증 후 재시도', NULL, FALSE, TRUE, 'Medium', 1, 76.0, '카탈로그 재검증으로 해결'),

('15000', 'Network', 'Host Name Resolution Failed', '호스트 이름 확인 실패', 'DNS 조회 실패', 'DNS 설정 오류', 'DNS 설정 확인, /etc/hosts 검증',
'nslookup $HOSTNAME || cat /etc/hosts | grep $HOSTNAME', TRUE, FALSE, 'High', 1, 89.0, 'DNS 재조회로 자동 해결'),

('18500', 'Script', 'Pre-backup Script Failed', '백업 전 스크립트 실패', '사전 스크립트 실행 오류', '스크립트 권한 또는 구문 오류', '스크립트 로그 확인, 권한 검증', NULL, FALSE, TRUE, 'Medium', 1, 74.0, '스크립트 재실행으로 해결'),

('19000', 'Script', 'Post-backup Script Failed', '백업 후 스크립트 실패', '사후 스크립트 실행 오류', '스크립트 구문 오류', '스크립트 검증 및 재실행', NULL, FALSE, TRUE, 'Medium', 1, 75.0, '스크립트 수정 후 재실행'),

-- Level 2: 엔지니어 승인 필요 (25개)
('6', 'Backup', 'Backup Failed', '백업 실패', '요청된 파일 백업 실패', '파일 권한, 경로 문제', '파일 권한 및 경로 확인', NULL, FALSE, TRUE, 'High', 2, 78.5, '설정 변경 필요로 엔지니어 확인 요구'),

('54', 'Storage', 'No Tape Drives', '테이프 드라이브 없음', '사용 가능한 드라이브 없음', '드라이브 할당 오류', '드라이브 할당 상태 확인', NULL, FALSE, TRUE, 'Medium', 2, 72.0, '드라이브 재할당 필요'),

('58', 'Storage', 'No Media Defined', '미디어 미정의', '클라이언트 백업 미디어 없음', '미디어 풀 미설정', '미디어 풀 설정 확인', NULL, FALSE, TRUE, 'High', 2, 75.0, '미디어 설정 변경 필요'),

('195', 'Backup', 'Cannot Read Image Header', '백업 이미지 헤더 읽기 실패', '이미지 헤더 손상', '백업 이미지 손상', '다른 이미지로 복원 시도', NULL, FALSE, TRUE, 'High', 2, 68.0, '백업 이미지 검증 필요'),

('227', 'Catalog', 'No Images Processed', '이미지 처리 실패', '처리된 이미지 없음', '카탈로그 문제', '카탈로그 상태 확인, 재처리', NULL, FALSE, TRUE, 'Medium', 2, 70.0, '카탈로그 재구성 필요'),

('230', 'Storage', 'Storage Unit Unavailable', '스토리지 유닛 사용 불가', '스토리지 오프라인', '스토리지 연결 문제', '스토리지 온라인 상태 확인', NULL, FALSE, TRUE, 'High', 2, 73.0, '스토리지 연결 재설정 필요'),

('2800', 'Snapshot', 'Snapshot Operation Failed', '스냅샷 작업 실패', '스냅샷 생성 오류', '스토리지 공간 부족', '스냅샷 공급자 로그 확인', NULL, FALSE, TRUE, 'High', 2, 71.0, '스냅샷 설정 검토 필요'),

('2813', 'Snapshot', 'Snapshot Invalid', '스냅샷 무효화', '스냅샷 유효성 상실', '스냅샷 만료', '스냅샷 재생성', NULL, FALSE, TRUE, 'Medium', 2, 69.0, '스냅샷 정책 재설정 필요'),

('4207', 'Security', 'Pending Authentication', '인증 대기 중', '인증 미완료', '인증 지연', '인증 완료 후 재시도', NULL, FALSE, TRUE, 'Low', 2, 65.0, '인증 설정 확인 필요'),

('4212', 'Security', 'Authentication Service Unavailable', '인증 서비스 사용 불가', '인증 서비스 중지', '서비스 오류', '인증 서비스 재시작', NULL, FALSE, TRUE, 'High', 2, 77.0, '인증 서비스 재구성 필요'),

('5010', 'Policy', 'Policy Execution Failed', '정책 실행 실패', '백업 정책 실행 오류', '정책 설정 오류', '정책 설정 검증', NULL, FALSE, TRUE, 'High', 2, 76.0, '정책 수정 필요'),

('6000', 'Database', 'Database Connection Failed', '데이터베이스 연결 실패', 'DB 연결 불가', 'DB 서비스 중지', 'DB 서비스 상태 확인', NULL, FALSE, TRUE, 'Critical', 2, 80.0, 'DB 연결 설정 재구성 필요'),

('7200', 'Storage', 'Disk Pool Full', '디스크 풀 가득 참', '저장 공간 없음', '디스크 공간 부족', '디스크 공간 확보 또는 확장', NULL, FALSE, TRUE, 'Critical', 2, 82.0, '디스크 용량 관리 필요'),

('7421', 'Storage', 'Get Storage Config Failed', '스토리지 구성 조회 실패', '설정 조회 오류', '스토리지 서버 문제', '스토리지 서버 상태 확인', NULL, FALSE, TRUE, 'Medium', 2, 74.0, '스토리지 구성 재설정 필요'),

('7422', 'Storage', 'Create Disk Pool Failed', '디스크 풀 생성 실패', '풀 생성 오류', '권한 또는 공간 부족', '권한 및 공간 확인', NULL, FALSE, TRUE, 'Medium', 2, 72.0, '디스크 풀 설정 수정 필요'),

('8000', 'Policy', 'Operation Denied by Policy', '정책에 의해 거부', '작업 차단됨', '정책 제한', '정책 설정 검토', NULL, FALSE, TRUE, 'Medium', 2, 70.0, '정책 권한 변경 필요'),

('8100', 'Security', 'Invalid Server Credentials', '서버 자격 증명 무효', '인증 실패', '자격 증명 만료', '자격 증명 재설정', NULL, FALSE, TRUE, 'High', 2, 79.0, '인증 정보 갱신 필요'),

('9001', 'License', 'License Invalid or Expired', '라이선스 무효/만료', '라이선스 오류', '라이선스 만료', '라이선스 갱신', NULL, FALSE, TRUE, 'Critical', 2, 95.0, '라이선스 관리 필요'),

('10000', 'Cloud', 'Cloud Provider Unreachable', '클라우드 공급자 연결 불가', '클라우드 접근 실패', '인터넷 연결 문제', '인터넷 연결 확인', NULL, FALSE, TRUE, 'High', 2, 76.0, '클라우드 연결 재설정 필요'),

('10500', 'Replication', 'Replication Job Failed', '복제 작업 실패', '복제 오류', '대상 서버 문제', '대상 서버 상태 확인', NULL, FALSE, TRUE, 'High', 2, 75.0, '복제 설정 검토 필요'),

('11500', 'Database', 'Database Locked', '데이터베이스 잠금', 'DB 접근 불가', 'DB 잠금 상태', '잠금 해제', NULL, FALSE, TRUE, 'High', 2, 73.0, 'DB 잠금 해제 작업 필요'),

('12000', 'Catalog', 'Catalog Backup Failed', '카탈로그 백업 실패', '카탈로그 저장 오류', '스토리지 문제', '카탈로그 백업 재시도', NULL, FALSE, TRUE, 'Critical', 2, 81.0, '카탈로그 백업 설정 재구성 필요'),

('13000', 'Vault', 'Vault Session Failed', '볼트 세션 실패', '볼트 작업 오류', '미디어 문제', '볼트 구성 확인', NULL, FALSE, TRUE, 'High', 2, 69.0, '볼트 설정 재확인 필요'),

('13500', 'Storage', 'Media Import Failed', '미디어 가져오기 실패', '미디어 로드 오류', '미디어 ID 오류', '미디어 ID 확인', NULL, FALSE, TRUE, 'High', 2, 71.0, '미디어 관리 재설정 필요'),

('14500', 'Database', 'Volume DB Inconsistency', '볼륨 DB 불일치', 'DB 데이터 불일치', 'DB 손상', 'DB 일관성 검사', NULL, FALSE, TRUE, 'High', 2, 74.0, 'DB 복구 작업 필요'),

-- Level 3: 온사이트 지원 필요 (10개)
('71', 'Restore', 'No Files Restored', '복원 파일 없음', '복원 실패', '카탈로그 또는 미디어 손상', '백업 카탈로그 검증', NULL, FALSE, TRUE, 'Critical', 3, 55.0, '현장 조사 및 미디어 검증 필요'),

('83', 'Storage', 'No Robot Response', '로봇 응답 없음', '로봇 제어 실패', '로봇 하드웨어 문제', '로봇 상태 확인, 재시작', NULL, FALSE, TRUE, 'High', 3, 52.0, '로봇 하드웨어 점검 필요'),

('150', 'Storage', 'Drive Incompatible', '드라이브 호환 불가', '미디어-드라이브 불일치', '호환성 문제', '호환 미디어 사용', NULL, FALSE, TRUE, 'Medium', 3, 48.0, '하드웨어 호환성 현장 확인'),

('14000', 'Backup', 'Image Corrupted', '백업 이미지 손상', '이미지 복원 불가', '미디어 손상', '다른 백업 이미지 사용', NULL, FALSE, TRUE, 'Critical', 3, 58.0, '미디어 물리적 검사 필요'),

('15500', 'Security', 'Encryption Key Invalid', '암호화 키 무효', '복호화 실패', '키 분실 또는 손상', '올바른 키 제공', NULL, FALSE, TRUE, 'Critical', 3, 60.0, '키 관리 시스템 현장 점검'),

('16000', 'Storage', 'Shared Storage Inaccessible', '공유 스토리지 접근 불가', '스토리지 연결 실패', 'NFS/CIFS 문제', '마운트 및 권한 확인', NULL, FALSE, TRUE, 'High', 3, 54.0, '스토리지 네트워크 현장 점검'),

('16500', 'Client', 'Client Config Missing', '클라이언트 구성 누락', '설정 없음', '설정 파일 손실', '클라이언트 재구성', NULL, FALSE, TRUE, 'High', 3, 50.0, '클라이언트 현장 재설치 필요'),

('17000', 'Security', 'Certificate Verification Failed', '인증서 검증 실패', '인증서 오류', '인증서 만료/손상', '인증서 갱신', NULL, FALSE, TRUE, 'High', 3, 57.0, '인증서 인프라 현장 점검'),

('17500', 'Storage', 'Lifecycle Policy Violation', '수명 주기 정책 위반', '정책 위배', '정책 설정 오류', '정책 재설정', NULL, FALSE, TRUE, 'Medium', 3, 45.0, '정책 아키텍처 재설계 필요'),

('19500', 'Storage', 'Failed to Mount Destination', '대상 마운트 실패', '백업 대상 마운트 오류', '마운트 포인트 문제', '마운트 포인트 확인', NULL, FALSE, TRUE, 'High', 3, 53.0, '스토리지 연결 현장 점검');

-- 통계 업데이트
UPDATE error_patterns SET occurrence_frequency = FLOOR(RANDOM() * 100) + 10;
UPDATE error_patterns SET success_rate_percent = CASE
    WHEN resolution_level = 1 THEN 85 + RANDOM() * 10
    WHEN resolution_level = 2 THEN 70 + RANDOM() * 15
    ELSE 50 + RANDOM() * 20
END;
UPDATE error_patterns SET avg_resolution_minutes = CASE
    WHEN resolution_level = 1 THEN 10 + FLOOR(RANDOM() * 50)
    WHEN resolution_level = 2 THEN 60 + FLOOR(RANDOM() * 180)
    ELSE 240 + FLOOR(RANDOM() * 600)
END;

-- 결과 확인
SELECT 
    resolution_level,
    COUNT(*) as total_errors,
    ROUND(AVG(ai_confidence_score), 2) as avg_confidence,
    COUNT(CASE WHEN auto_fix_enabled THEN 1 END) as auto_fix_enabled_count
FROM error_patterns
GROUP BY resolution_level
ORDER BY resolution_level;

SELECT 'NetBackup 에러코드 50개 데이터 로드 완료!' as message;
