-- =========================================
-- V-BIP Phase 2-A: 김인석 부장 실제 데이터
-- 최종 수정 버전 (employee_code 추가)
-- =========================================

-- 1. 김인석 부장 등록 (중복 방지)
INSERT INTO engineers (employee_code, name, email, phone, specialization)
VALUES ('ENG006', '김인석', 'kim.inseok@dsti.co.kr', '010-1234-5678', ARRAY['Veritas NetBackup', 'VMware Backup'])
ON CONFLICT (email) DO NOTHING;

-- 2. 김인석 부장 담당 고객사 16개 등록
INSERT INTO customers (
    customer_code,
    customer_name,
    contact_person,
    contact_email,
    contact_phone,
    site_type,
    server_count,
    contract_tier,
    primary_engineer_id,
    status
) VALUES
('COVEL001', '코밸', '운영팀장', 'ops@covel.co.kr', '02-1234-5001', 'On-Premise', 8, 'Bronze', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('KGMOB001', 'KG모빌리티', 'IT담당', 'it@kgmobility.com', '02-1234-5002', 'Hybrid', 25, 'Gold', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('GNHOS001', '강릉동인병원', '전산실장', 'it@gndongin.co.kr', '033-1234-5003', 'On-Premise', 12, 'Silver', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('NMNEWS001', '농민신문사', '시스템관리자', 'sysadmin@nongmin.com', '02-1234-5004', 'On-Premise', 6, 'Bronze', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('DKPHAR001', '동국제약', 'IT운영팀', 'itops@dkpharma.co.kr', '02-1234-5005', 'Hybrid', 35, 'Gold', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('DIPACK001', '동일패키지', '정보시스템팀', 'is@dongilpack.com', '02-1234-5006', 'On-Premise', 18, 'Silver', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('SYENG001', '서영엔지니어링', 'IT관리자', 'admin@seoyoung.co.kr', '02-1234-5007', 'On-Premise', 15, 'Silver', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('SMILK001', '서울우유본사', 'IT본부장', 'it@seoulmilk.co.kr', '02-1234-5008', 'Hybrid', 45, 'Platinum', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('SMILK002', '서울우유거창공장', '공장IT팀', 'itgc@seoulmilk.co.kr', '055-1234-5009', 'On-Premise', 10, 'Silver', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('SEJUNG001', '세중', '시스템팀', 'sys@sejung.com', '02-1234-5010', 'On-Premise', 8, 'Bronze', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('SWUNI001', '수원대학교', '전산정보원', 'ict@suwon.ac.kr', '031-1234-5011', 'On-Premise', 22, 'Silver', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('ANRAK001', '안락', '정보보안팀', 'security@anrak.co.kr', '02-1234-5012', 'Hybrid', 16, 'Silver', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('GCCL001', '지씨씨엘', 'IT운영팀', 'itops@gccl.co.kr', '02-1234-5013', 'On-Premise', 14, 'Silver', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('CHIK001', '칙고쿠삼화페인트', '시스템관리팀', 'sysadmin@chikkoku.co.kr', '02-1234-5014', 'On-Premise', 12, 'Bronze', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('KAMCO001', '한국자산관리공사', 'IT기획팀', 'itplan@kamco.or.kr', '02-1234-5015', 'Hybrid', 28, 'Gold', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active'),
('RICHCO001', '리치앤코', 'IT지원팀', 'itsupport@richnco.com', '02-1234-5016', 'On-Premise', 15, 'Silver', 
    (SELECT engineer_id FROM engineers WHERE name = '김인석'), 'Active')
ON CONFLICT (customer_code) DO UPDATE SET
    primary_engineer_id = EXCLUDED.primary_engineer_id,
    updated_at = CURRENT_TIMESTAMP;

-- 3. 등록 확인
SELECT 
    '엔지니어' as 구분,
    COUNT(*) as 건수
FROM engineers 
WHERE name = '김인석'
UNION ALL
SELECT 
    '고객사' as 구분,
    COUNT(*) as 건수
FROM customers 
WHERE primary_engineer_id = (SELECT engineer_id FROM engineers WHERE name = '김인석');

-- 4. 고객사 목록 출력
SELECT 
    customer_code as 고객코드,
    customer_name as 고객사명,
    server_count as 서버수,
    contract_tier as 계약등급,
    status as 상태
FROM customers 
WHERE primary_engineer_id = (SELECT engineer_id FROM engineers WHERE name = '김인석')
ORDER BY customer_name;
