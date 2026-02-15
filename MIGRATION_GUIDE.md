# V-BIP AWS Lightsail 마이그레이션 가이드

## 📦 Step 1: 샌드박스에서 압축 파일 다운로드

압축 파일 위치: `/home/user/vbip-phase1-mvp.tar.gz` (62 KB)

**다운로드 방법:**

```bash
# 브라우저에서 다운로드
# (Genspark AI가 제공하는 다운로드 링크 사용)

# 또는 로컬 머신에서 직접 다운로드 (샌드박스 URL 필요)
wget <sandbox_download_url>/vbip-phase1-mvp.tar.gz
```

---

## 🚀 Step 2: AWS Lightsail 서버로 전송

### 2.1 AWS Lightsail 서버 정보 확인

```
IP 주소: 43.203.181.195
사용자: ubuntu
SSH 키: 기존 사용 중인 키
```

### 2.2 파일 전송 (SCP)

```bash
# Mac/Linux
scp vbip-phase1-mvp.tar.gz ubuntu@43.203.181.195:/home/ubuntu/

# Windows (PowerShell)
scp vbip-phase1-mvp.tar.gz ubuntu@43.203.181.195:/home/ubuntu/
```

---

## 🔧 Step 3: AWS 서버에서 설치 및 실행

### 3.1 SSH 접속

```bash
ssh ubuntu@43.203.181.195
```

### 3.2 압축 해제

```bash
cd /home/ubuntu
tar xzf vbip-phase1-mvp.tar.gz
cd vbip
ls -la
```

예상 출력:
```
database/
dashboard/
scripts/
templates/
sample_logs/
docker-compose.yml
Dockerfile.api
Dockerfile.dashboard
requirements.txt
README.md
test_system.sh
```

### 3.3 Docker 및 Docker Compose 확인

```bash
# Docker 버전 확인
docker --version
docker-compose --version

# Docker 서비스 상태 확인
sudo systemctl status docker

# 필요 시 Docker 시작
sudo systemctl start docker
```

### 3.4 기존 컨테이너 정리 (선택)

```bash
# 기존 n8n 컨테이너와 포트 충돌 방지
docker ps

# 필요 시 기존 컨테이너 중지
# docker stop <container_name>
```

### 3.5 V-BIP 실행

```bash
cd /home/ubuntu/vbip

# Docker Compose로 전체 시스템 시작
docker-compose up -d

# 컨테이너 상태 확인
docker ps
```

예상 출력:
```
CONTAINER ID   IMAGE                  STATUS         PORTS
xxxxx          vbip-dashboard         Up 10 seconds  0.0.0.0:5000->5000/tcp
xxxxx          vbip-api               Up 10 seconds  0.0.0.0:5001->5000/tcp
xxxxx          postgres:14-alpine     Up 10 seconds  0.0.0.0:5432->5432/tcp
xxxxx          n8nio/n8n:latest       Up 10 seconds  0.0.0.0:5678->5678/tcp
```

### 3.6 데이터베이스 초기화

```bash
# 스키마 생성
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/schema.sql

# 더미 데이터 삽입 (고객사, 엔지니어, 에러 패턴)
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/insert_dummy_data.sql

# 백업 작업 히스토리 삽입 (1,271건)
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/insert_backup_jobs.sql
```

### 3.7 시스템 테스트

```bash
./test_system.sh
```

예상 출력:
```
======================================
V-BIP 시스템 테스트 스크립트
======================================

1️⃣ Docker 컨테이너 상태 확인
-----------------------------------
vbip-dashboard    Up 1 minute
vbip-api          Up 1 minute
vbip-postgres     Up 1 minute (healthy)
vbip-n8n          Up 1 minute

2️⃣ 데이터베이스 연결 테스트
-----------------------------------
 customer_count
----------------
             10
✓ PostgreSQL 연결 성공

3️⃣ API 엔드포인트 테스트
-----------------------------------
Testing Health Check... ✓ PASSED (HTTP 200)
Testing Dashboard Summary... ✓ PASSED (HTTP 200)
Testing Customer List... ✓ PASSED (HTTP 200)
Testing Statistics... ✓ PASSED (HTTP 200)

...

✅ 모든 테스트 통과!

📊 대시보드 접속: http://localhost:5000
```

---

## 🌐 Step 4: 방화벽 포트 개방

### 4.1 AWS Lightsail 콘솔에서 포트 개방

1. AWS Lightsail 콘솔 접속
2. 인스턴스 선택
3. "네트워킹" 탭 선택
4. "IPv4 방화벽" 섹션에서 "규칙 추가" 클릭

**추가할 포트:**

| 애플리케이션 | 프로토콜 | 포트 범위 | 소스 |
|------------|---------|---------|------|
| 대시보드 | TCP | 5000 | 0.0.0.0/0 |
| API | TCP | 5001 | 0.0.0.0/0 |
| n8n | TCP | 5678 | My IP (관리자만) |
| PostgreSQL | TCP | 5432 | 127.0.0.1/32 (내부 전용) |

### 4.2 Ubuntu 방화벽 설정 (선택)

```bash
# UFW 상태 확인
sudo ufw status

# 포트 허용 (필요 시)
sudo ufw allow 5000/tcp
sudo ufw allow 5001/tcp
sudo ufw allow 5678/tcp
```

---

## ✅ Step 5: 접속 확인

### 5.1 로컬에서 확인

```bash
# 헬스 체크
curl http://43.203.181.195:5000/health

# 대시보드 API
curl http://43.203.181.195:5000/api/dashboard/summary
```

### 5.2 브라우저에서 접속

```
대시보드: http://43.203.181.195:5000
API 문서: http://43.203.181.195:5001/health
n8n: http://43.203.181.195:5678 (admin / vbip_admin_2026)
```

---

## 📊 Step 6: 실제 데이터 추가 준비

### 6.1 더미 데이터 확인

```bash
# SSH 접속
ssh ubuntu@43.203.181.195

# PostgreSQL 접속
docker exec -it vbip-postgres psql -U vbip_user -d veritas_monitor

# 데이터 확인
SELECT customer_name, server_count, contract_tier FROM customers;
SELECT COUNT(*) FROM backup_jobs;
SELECT error_code, error_name FROM error_patterns;

# 종료
\q
```

### 6.2 이번 주 실제 데이터 수집 계획

**수집할 정보:**

1. **고객사 정보** (10개 우선)
   - 고객사 코드 (예: SAMSUNG)
   - 고객사명
   - 담당 엔지니어
   - 원격 접속 방식 (VPN/TeamViewer/OnSite)
   - Veritas 버전
   - 서버 수

2. **Veritas 로그 샘플** (3-5개)
   - 정상 백업 로그 1-2개
   - 장애 로그 3-5개 (다양한 에러 코드)
   - 파일 형식: .log, .txt

3. **엔지니어 정보**
   - 이름, 이메일, 전문 분야

**제공 방법:**
- Excel 파일로 정리하여 공유
- 또는 이메일/채팅으로 텍스트 제공
- 로그 파일은 압축하여 전송

---

## 🔄 Step 7: 실제 데이터 삽입 (이번 주 진행)

### 방법 1: SQL 직접 실행

```sql
-- 고객사 추가
INSERT INTO customers (customer_code, customer_name, contact_person, ...)
VALUES ('ACTUAL_001', '실제고객사', '담당자', ...);

-- 엔지니어 추가
INSERT INTO engineers (employee_code, name, email, ...)
VALUES ('ENG_REAL_001', '실제엔지니어', 'email@dstl.co.kr', ...);
```

### 방법 2: 로그 파서 사용

```bash
docker exec vbip-api python3 /app/scripts/veritas_log_parser.py \
  --file /app/uploads/실제로그.log \
  --customer ACTUAL_001 \
  --uploader admin@dstl.co.kr \
  --source Email
```

---

## 🛠️ 유지보수 명령어

### 로그 확인

```bash
# 전체 로그
docker-compose logs

# 특정 서비스 로그
docker-compose logs dashboard
docker-compose logs api
docker-compose logs postgres

# 실시간 로그
docker-compose logs -f
```

### 재시작

```bash
# 전체 재시작
docker-compose restart

# 특정 서비스 재시작
docker-compose restart dashboard
```

### 중지 및 삭제

```bash
# 전체 중지
docker-compose stop

# 컨테이너 삭제 (데이터 유지)
docker-compose down

# 컨테이너 및 볼륨 삭제 (데이터 삭제)
docker-compose down -v
```

### 데이터베이스 백업

```bash
# 백업
docker exec vbip-postgres pg_dump -U vbip_user veritas_monitor > backup_$(date +%Y%m%d).sql

# 복원
cat backup_20260215.sql | docker exec -i vbip-postgres psql -U vbip_user -d veritas_monitor
```

---

## 📝 다음 단계 (이번 주)

### 우선순위 1: 실제 데이터 수집
- [ ] 고객사 정보 10개 수집
- [ ] Veritas 로그 샘플 3-5개 수집
- [ ] 엔지니어 정보 수집

### 우선순위 2: 데이터 삽입 및 검증
- [ ] 실제 고객사 데이터 입력
- [ ] 로그 파서 테스트
- [ ] 대시보드에서 실제 데이터 확인

### 우선순위 3: Phase 2 기능 추가 (2주차)
- [ ] 웹 업로드 포털
- [ ] 티켓 시스템
- [ ] n8n 자동화 워크플로우

---

## ❓ 트러블슈팅

### 문제 1: 포트가 이미 사용 중

```bash
# 포트 사용 중인 프로세스 확인
sudo lsof -i :5000
sudo lsof -i :5001

# 프로세스 종료
sudo kill -9 <PID>
```

### 문제 2: Docker 권한 오류

```bash
# Docker 그룹에 사용자 추가
sudo usermod -aG docker ubuntu

# 로그아웃 후 재로그인
exit
ssh ubuntu@43.203.181.195
```

### 문제 3: 데이터베이스 연결 실패

```bash
# PostgreSQL 컨테이너 확인
docker logs vbip-postgres

# 재시작
docker-compose restart postgres
```

---

## 📞 지원

문제 발생 시:
1. `./test_system.sh` 실행하여 상태 확인
2. `docker-compose logs` 로그 확인
3. Genspark AI에 문의 (로그 첨부)

---

**마이그레이션 체크리스트:**

- [ ] Step 1: 압축 파일 다운로드
- [ ] Step 2: AWS 서버로 전송
- [ ] Step 3: 압축 해제 및 Docker 실행
- [ ] Step 4: 방화벽 포트 개방
- [ ] Step 5: 브라우저에서 접속 확인
- [ ] Step 6: 더미 데이터 확인
- [ ] Step 7: 이번 주 실제 데이터 수집 계획 수립

**마이그레이션 완료 후 확인사항:**

✅ 대시보드 정상 접속  
✅ API 정상 응답  
✅ 더미 데이터 표시  
✅ 테스트 스크립트 통과  

---

**Version**: 1.0.0  
**Last Updated**: 2026-02-15  
**Migration Status**: Ready for AWS Lightsail
