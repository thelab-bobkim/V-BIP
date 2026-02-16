# V-BIP Phase 2-A 배포 가이드
## 김인석 부장 실제 데이터 적용

**배포 날짜**: 2026-02-16  
**버전**: Phase 2-A  
**포함 데이터**: 김인석 부장 16개 고객사, 290건 장애 이력

---

## 📦 포함 내용

### 1. SQL 파일
- `database/insert_kimins eok_data.sql` - 김인석 부장 + 16개 고객사 등록
- `database/insert_backup_jobs_real.sql` - 290건 실제 장애 이력

### 2. Dashboard 업데이트
- `dashboard/app_v2.py` - 엔지니어 필터 기능 추가
- API 엔드포인트 추가:
  - `/api/engineers` - 엔지니어 목록
  - `/api/customers?engineer=김인석` - 필터링된 고객사
  - `/api/backup_jobs/recent?engineer=김인석` - 필터링된 백업 작업
  - `/api/statistics?engineer=김인석` - 통계 정보

---

## 🚀 AWS Lightsail 배포 단계

### 1단계: 파일 업로드

**방법 A: GitHub 사용 (추천)**
```bash
# 로컬에서 GitHub push 후
ssh ubuntu@43.203.181.195
cd /home/ubuntu/V-BIP
git pull origin main
```

**방법 B: 직접 SCP**
```bash
# 로컬에서
scp vbip-phase2a-deploy.tar.gz ubuntu@43.203.181.195:/home/ubuntu/

# SSH 접속
ssh ubuntu@43.203.181.195
cd /home/ubuntu
tar xzf vbip-phase2a-deploy.tar.gz
cp -r vbip-phase2a/* V-BIP/
```

---

### 2단계: 데이터베이스 업데이트

```bash
cd /home/ubuntu/V-BIP

# 1. 김인석 부장 및 16개 고객사 등록
docker exec -i vbip-postgres psql -U vbip_user -d veritas_monitor < database/insert_kimins\ eok_data.sql

# 결과 확인
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -c "
SELECT name, max_concurrent_customers 
FROM engineers 
WHERE name = '김인석';
"

docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -c "
SELECT company_name, primary_engineer, server_count 
FROM customers 
WHERE primary_engineer = '김인석' 
ORDER BY company_name;
"

# 2. 290건 장애 이력 등록
docker exec -i vbip-postgres psql -U vbip_user -d veritas_monitor < database/insert_backup_jobs_real.sql

# 결과 확인
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -c "
SELECT 
    c.company_name,
    COUNT(*) as failure_count
FROM backup_jobs bj
JOIN customers c ON bj.customer_id = bj.customer_id
WHERE c.primary_engineer = '김인석'
AND bj.status = 'Failed'
GROUP BY c.company_name
ORDER BY failure_count DESC;
"
```

**예상 결과**:
```
김인석 부장: 16개 고객사 담당
장애 건수: 290건
```

---

### 3단계: Dashboard 업데이트

```bash
cd /home/ubuntu/V-BIP

# app.py를 app_v2.py로 교체
cp dashboard/app.py dashboard/app_backup.py
cp dashboard/app_v2.py dashboard/app.py

# Docker 이미지 재빌드
docker-compose build dashboard

# Dashboard 재시작
docker-compose up -d dashboard

# 로그 확인
docker logs vbip-dashboard --tail 20
```

---

### 4단계: 기능 테스트

#### 테스트 1: 엔지니어 목록 API
```bash
curl http://43.203.181.195:5002/api/engineers | jq
```

**예상 결과**: 김인석 포함 6명 엔지니어

#### 테스트 2: 김인석 부장 고객사 필터
```bash
curl "http://43.203.181.195:5002/api/customers?engineer=김인석" | jq
```

**예상 결과**: 16개 고객사

#### 테스트 3: 장애 통계
```bash
curl "http://43.203.181.195:5002/api/statistics?engineer=김인석" | jq
```

**예상 결과**:
```json
{
  "total_customers": 16,
  "recent_failures": 290,
  "error_distribution": [...]
}
```

#### 테스트 4: 웹 브라우저 접속
```
http://43.203.181.195:5002
```

필터 드롭다운에서 "김인석" 선택 → 16개 고객사 표시

---

## 📊 데이터 요약

### 김인석 부장 담당 고객사 (16개)

| No | 고객사명 | 등급 | 서버 수 | 장애 건수 | SLA |
|----|----------|------|---------|----------|-----|
| 1 | 서울우유본사 ⚠️ | Platinum | 35 | 149 | 2h |
| 2 | 동국제약 | Gold | 18 | 21 | 4h |
| 3 | 한국자산관리공사 | Gold | 20 | 17 | 4h |
| 4 | KG모빌리티 | Gold | 15 | 12 | 4h |
| 5 | 서영엔지니어링 | Silver | 10 | 12 | 8h |
| 6 | 안락 | Silver | 10 | 12 | 8h |
| 7 | 동일패키지 | Silver | 10 | 12 | 8h |
| 8 | 리치앤코 | Silver | 10 | 11 | 8h |
| 9 | 수원대학교 | Silver | 12 | 10 | 8h |
| 10 | 지씨씨엘(GCCL) | Silver | 12 | 10 | 8h |
| 11 | 칙고쿠삼화페인트 | Bronze | 8 | 8 | 12h |
| 12 | 코밸 | Bronze | 8 | 5 | 12h |
| 13 | 강릉동인병원 | Bronze | 6 | 5 | 12h |
| 14 | 서울우유거창공장 | Silver | 8 | 5 | 8h |
| 15 | 세중 | Bronze | 6 | 5 | 12h |
| 16 | 농민신문사 | Bronze | 5 | 4 | 12h |

**총 서버 수**: 213대  
**총 장애 건수**: 290건  
**평균 장애/고객사**: 18.1건

---

## ⚠️ 주의사항

### 중복 방지
- `ON CONFLICT` 절이 있어 재실행 시 update됩니다
- 데이터 손실 우려 없음

### 롤백 방법
```sql
-- 김인석 부장 데이터만 삭제
DELETE FROM backup_jobs 
WHERE customer_id IN (
    SELECT customer_id FROM customers WHERE primary_engineer = '김인석'
);

DELETE FROM customers WHERE primary_engineer = '김인석';
DELETE FROM engineers WHERE name = '김인석';
```

### 백업 권장
```bash
# 배포 전 DB 백업
docker exec vbip-postgres pg_dump -U vbip_user veritas_monitor > /home/ubuntu/backup_before_phase2a_$(date +%Y%m%d).sql
```

---

## 🎯 배포 후 확인사항

- [ ] 엔지니어 등록: 1명 (김인석)
- [ ] 고객사 등록: 16개
- [ ] 장애 이력: 290건
- [ ] Dashboard API 정상 응답
- [ ] 웹 페이지 접속 가능
- [ ] 엔지니어 필터 작동

---

## 📞 문제 발생 시

### Dashboard 접속 안 됨
```bash
docker logs vbip-dashboard --tail 50
docker-compose restart dashboard
```

### DB 연결 오류
```bash
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -c "SELECT 1;"
```

### 데이터 확인
```bash
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -c "
SELECT 
    (SELECT COUNT(*) FROM engineers WHERE name = '김인석') as engineers,
    (SELECT COUNT(*) FROM customers WHERE primary_engineer = '김인석') as customers,
    (SELECT COUNT(*) FROM backup_jobs bj 
     JOIN customers c ON bj.customer_id = c.customer_id 
     WHERE c.primary_engineer = '김인석') as backup_jobs;
"
```

---

**배포 완료 예상 시간**: 15분  
**작성자**: Genspark AI Agent  
**버전**: Phase 2-A (2026-02-16)
