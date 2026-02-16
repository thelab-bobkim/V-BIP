-- 김인석 부장 담당 고객사 및 장애 데이터 등록
-- 실행일: 2026-02-16

-- 1. 김인석 부장 엔지니어 등록
INSERT INTO engineers (name, email, phone, specialization, skill_tags, max_concurrent_customers, status)
VALUES 
('김인석', 'kim.inseok@dsti.co.kr', '010-1234-5678', 'Veritas NetBackup 전문가', 
 ARRAY['Veritas', 'NetBackup', 'VM백업', '장애대응'], 16, 'active')
ON CONFLICT (email) DO UPDATE 
SET name = EXCLUDED.name, 
    specialization = EXCLUDED.specialization,
    max_concurrent_customers = EXCLUDED.max_concurrent_customers;

-- 2. 16개 고객사 등록
INSERT INTO customers (
    company_name, 
    contract_type, 
    server_count, 
    primary_engineer, 
    contact_name, 
    contact_email, 
    contact_phone,
    address,
    sla_level,
    sla_response_time_hours,
    status
) VALUES
-- 1. 코밸 (5건 장애)
('코밸', 'Silver', 8, '김인석', '담당자', 'contact@kovel.co.kr', '02-1234-5678', 
 '서울특별시', 'Silver', 8, 'active'),

-- 2. KG모빌리티 (12건 장애)
('KG모빌리티', 'Gold', 15, '김인석', '담당자', 'contact@kgm.co.kr', '02-2345-6789', 
 '서울특별시', 'Gold', 4, 'active'),

-- 3. 강릉동인병원 (5건 장애)
('강릉동인병원', 'Bronze', 6, '김인석', '담당자', 'contact@gdh.or.kr', '033-123-4567', 
 '강원도 강릉시', 'Bronze', 12, 'active'),

-- 4. 농민신문사 (4건 장애)
('농민신문사', 'Bronze', 5, '김인석', '담당자', 'contact@nongmin.com', '02-3456-7890', 
 '서울특별시', 'Bronze', 12, 'active'),

-- 5. 동국제약 (21건 장애)
('동국제약', 'Gold', 18, '김인석', '담당자', 'contact@dkp.co.kr', '02-4567-8901', 
 '서울특별시', 'Gold', 4, 'active'),

-- 6. 동일패키지 (4건 장애)
('동일패키지', 'Bronze', 5, '김인석', '담당자', 'contact@dongil.co.kr', '031-234-5678', 
 '경기도', 'Bronze', 12, 'active'),

-- 7. 리치앤코 (11건 장애)
('리치앤코', 'Silver', 10, '김인석', '담당자', 'contact@richnco.com', '02-5678-9012', 
 '서울특별시', 'Silver', 8, 'active'),

-- 8. 서영엔지니어링 (12건 장애)
('서영엔지니어링', 'Silver', 10, '김인석', '담당자', 'contact@seoyoung.co.kr', '02-6789-0123', 
 '서울특별시', 'Silver', 8, 'active'),

-- 9. 서울우유거창공장 (5건 장애)
('서울우유거창공장', 'Silver', 8, '김인석', '담당자', 'contact@seoulmilk-gc.co.kr', '055-234-5678', 
 '경상남도 거창군', 'Silver', 8, 'active'),

-- 10. 서울우유본사 (149건 장애) ⚠️ 최다 장애
('서울우유본사', 'Platinum', 35, '김인석', '담당자', 'contact@seoulmilk.co.kr', '02-7890-1234', 
 '서울특별시', 'Platinum', 2, 'active'),

-- 11. 세중 (5건 장애)
('세중', 'Bronze', 6, '김인석', '담당자', 'contact@sejung.co.kr', '02-8901-2345', 
 '서울특별시', 'Bronze', 12, 'active'),

-- 12. 수원대학교 (10건 장애)
('수원대학교', 'Silver', 12, '김인석', '담당자', 'contact@suwon.ac.kr', '031-345-6789', 
 '경기도 수원시', 'Silver', 8, 'active'),

-- 13. 안락 (12건 장애)
('안락', 'Silver', 10, '김인석', '담당자', 'contact@anrak.co.kr', '051-234-5678', 
 '부산광역시', 'Silver', 8, 'active'),

-- 14. 지씨씨엘(GCCL) (10건 장애)
('지씨씨엘(GCCL)', 'Silver', 12, '김인석', '담당자', 'contact@gccl.co.kr', '02-9012-3456', 
 '서울특별시', 'Silver', 8, 'active'),

-- 15. 칙고쿠삼화페인트 (8건 장애)
('칙고쿠삼화페인트', 'Bronze', 8, '김인석', '담당자', 'contact@chikkoku.co.kr', '031-456-7890', 
 '경기도', 'Bronze', 12, 'active'),

-- 16. 한국자산관리공사 (17건 장애)
('한국자산관리공사', 'Gold', 20, '김인석', '담당자', 'contact@kamco.or.kr', '02-0123-4567', 
 '부산광역시', 'Gold', 4, 'active')

ON CONFLICT (company_name) DO UPDATE 
SET primary_engineer = EXCLUDED.primary_engineer,
    server_count = EXCLUDED.server_count,
    contract_type = EXCLUDED.contract_type;

-- 등록 확인
SELECT 
    '엔지니어 등록' as category,
    COUNT(*) as count 
FROM engineers 
WHERE name = '김인석'
UNION ALL
SELECT 
    '고객사 등록' as category,
    COUNT(*) as count 
FROM customers 
WHERE primary_engineer = '김인석';
