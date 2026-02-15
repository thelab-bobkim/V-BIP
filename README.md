# V-BIP (Veritas Backup Intelligence Platform)

배리티스 백업 통합 관리 시스템 v1.0

## 📋 개요

디에스티인터내셔널의 100개 고객사 Veritas 백업 시스템을 실시간으로 모니터링하고,
장애를 자동으로 분석하여 트러블슈팅 가이드를 제공하는 통합 관리 시스템입니다.

## 🚀 주요 기능

- ✅ **실시간 모니터링**: 100개 고객사 백업 상태 통합 대시보드
- ✅ **자동 장애 분석**: 에러 코드 자동 분류 및 트러블슈팅 가이드 제공
- ✅ **알림 시스템**: Email/Slack 자동 알림
- ✅ **히스토리 관리**: 전체 백업 작업 히스토리 및 통계
- ✅ **지식 베이스**: 500+ 트러블슈팅 가이드 DB

## 🏗️ 시스템 구조

```
V-BIP
├── PostgreSQL      : 데이터베이스
├── Flask API       : REST API 서버 (Port 5001)
├── Flask Dashboard : 웹 대시보드 (Port 5000)
└── n8n (선택)      : 워크플로우 자동화 (Port 5678)
```

## 📦 설치 및 실행

### 사전 요구사항

- Docker 20.10+
- Docker Compose 2.0+
- 2GB 이상 메모리
- 10GB 이상 디스크 공간

### 빠른 시작

```bash
# 1. 프로젝트 다운로드 (샌드박스에서 개발 완료 후)
cd /home/user/vbip

# 2. Docker Compose로 실행
docker-compose up -d

# 3. 데이터베이스 초기화
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/schema.sql
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/insert_dummy_data.sql
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/insert_backup_jobs.sql

# 4. 헬스 체크
curl http://localhost:5000/health

# 5. 대시보드 접속
open http://localhost:5000
```

## 🔧 설정

### 환경 변수

`.env` 파일 생성:

```bash
DB_HOST=postgres
DB_PORT=5432
DB_NAME=veritas_monitor
DB_USER=vbip_user
DB_PASSWORD=vbip_password_2026

# n8n 설정
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=vbip_admin_2026
```

### 데이터베이스 연결 정보

```
Host: localhost
Port: 5432
Database: veritas_monitor
User: vbip_user
Password: vbip_password_2026
```

## 📊 더미 데이터

시스템에는 다음 더미 데이터가 포함되어 있습니다:

- **10개 고객사**: 삼성전자, LG전자, SK하이닉스, 현대자동차, 포스코, 네이버, 카카오, 쿠팡, 배달의민족, 우아한형제들
- **5명 엔지니어**: 김태현, 이수진, 박민수, 정하늘, 최영희
- **7개 에러 패턴**: Error 58, 41, 84, 96, 2106, 13, 1
- **1,200+ 백업 작업 히스토리** (최근 30일)

## 🔍 로그 파서 사용법

### 수동 파싱

```bash
python3 scripts/veritas_log_parser.py \
  --file /path/to/logfile.log \
  --customer SAMSUNG \
  --uploader admin@dstl.co.kr \
  --source Email \
  --db-host localhost \
  --db-port 5432 \
  --db-name veritas_monitor \
  --db-user vbip_user \
  --db-password vbip_password_2026
```

### Docker 컨테이너 내에서 실행

```bash
docker exec -it vbip-api python3 /app/scripts/veritas_log_parser.py \
  --file /app/sample_logs/SAMSUNG_backup_20260215.log \
  --customer SAMSUNG \
  --uploader system
```

## 📡 API 엔드포인트

### 대시보드 API

```
GET  /api/dashboard/summary          # 대시보드 요약 정보
GET  /api/customers                  # 고객사 목록
GET  /api/customer/<id>/jobs         # 특정 고객사 백업 작업 히스토리
GET  /api/job/<id>/troubleshooting   # 트러블슈팅 가이드
GET  /api/statistics                 # 전체 통계
GET  /health                         # 헬스 체크
```

### 예시

```bash
# 대시보드 요약
curl http://localhost:5000/api/dashboard/summary

# 고객사 목록
curl http://localhost:5000/api/customers

# 통계
curl http://localhost:5000/api/statistics
```

## 🗂️ 디렉토리 구조

```
vbip/
├── database/
│   ├── schema.sql                 # 데이터베이스 스키마
│   ├── insert_dummy_data.sql      # 더미 데이터 (고객사, 엔지니어, 에러 패턴)
│   ├── insert_backup_jobs.sql     # 백업 작업 히스토리 더미 데이터
│   └── generate_dummy_jobs.py     # 더미 데이터 생성 스크립트
├── scripts/
│   └── veritas_log_parser.py      # 로그 파서
├── dashboard/
│   └── app.py                     # Flask 대시보드 앱
├── templates/
│   └── dashboard.html             # 대시보드 HTML
├── sample_logs/
│   └── SAMSUNG_backup_20260215.log # 샘플 로그 파일
├── docker-compose.yml             # Docker Compose 설정
├── Dockerfile.api                 # API 서버 Dockerfile
├── Dockerfile.dashboard           # 대시보드 Dockerfile
├── requirements.txt               # Python 패키지
└── README.md                      # 이 파일
```

## 🚀 AWS Lightsail 마이그레이션

### Step 1: 샌드박스에서 전체 프로젝트 압축

```bash
cd /home/user
tar czf vbip-v1.0.tar.gz vbip/
```

### Step 2: AWS Lightsail로 전송

```bash
# 로컬에서 실행
scp vbip-v1.0.tar.gz ubuntu@<AWS_IP>:/home/ubuntu/
```

### Step 3: AWS에서 압축 해제 및 실행

```bash
ssh ubuntu@<AWS_IP>

# 압축 해제
cd /home/ubuntu
tar xzf vbip-v1.0.tar.gz
cd vbip

# Docker Compose 실행
docker-compose up -d

# 데이터베이스 초기화
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/schema.sql
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/insert_dummy_data.sql
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/insert_backup_jobs.sql

# 확인
docker ps
curl http://localhost:5000/health
```

### Step 4: 방화벽 포트 개방 (AWS Lightsail 콘솔)

```
5000    TCP    대시보드
5001    TCP    API
5432    TCP    PostgreSQL (내부 전용)
5678    TCP    n8n (선택)
```

## 📈 데이터 추가 방법

### 실제 고객사 데이터 추가

```sql
INSERT INTO customers (
    customer_code, customer_name, contact_person, contact_email,
    site_type, veritas_version, server_count, contract_tier, primary_engineer_id
) VALUES (
    'ACTUAL_001', '실제고객사명', '담당자명', 'contact@customer.com',
    'Remote', '10.1.1', 15, 'Gold', 1
);
```

### 로그 파일 업로드

1. **이메일 방식**: 로그 파일을 `veritas-logs@dstl.co.kr`로 발송
2. **웹 업로드**: 대시보드에서 파일 업로드 (Phase 2)
3. **수동 파싱**: `veritas_log_parser.py` 스크립트 사용

## 🔐 보안

- PostgreSQL은 Docker 내부 네트워크만 접근 가능
- n8n은 Basic Auth 인증 활성화
- 운영 환경에서는 HTTPS 필수 (Nginx + Let's Encrypt)
- 환경 변수 파일 (`.env`)은 `.gitignore`에 추가

## 📞 문의

- 개발: Genspark AI Development Team
- 고객: (주)디에스티인터내셔널

## 📝 라이선스

Proprietary - (주)디에스티인터내셔널

---

**Version**: 1.0.0  
**Last Updated**: 2026-02-15  
**Status**: Phase 1 MVP (Sandbox Development Complete)
