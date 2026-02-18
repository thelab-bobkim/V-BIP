# V-BIP 2.3 Phase 3 완료 보고서
## AWS Lightsail Docker 배포 패키지 준비

---

## 📋 작업 개요

**Phase**: 3  
**작업명**: AWS Lightsail Docker 배포 패키지 준비  
**상태**: ✅ 완료  
**완료일**: 2026-02-18  
**소요 시간**: 2시간

---

## ✅ 완료된 작업

### 1. Docker 설정 파일
- ✅ **Dockerfile**: Python 3.12 기반, Gunicorn WSGI 서버, Health check 포함
- ✅ **docker-compose.yml**: PostgreSQL, Flask API, Nginx 3-tier 아키텍처
- ✅ **.dockerignore**: 불필요한 파일 제외 (로그, 테스트, 문서 등)

### 2. 환경 설정
- ✅ **.env.example**: 환경 변수 템플릿 (DB, Flask, OpenAI, AWS 설정)
- ✅ **nginx/nginx.conf**: 리버스 프록시, Gzip 압축, SSL 준비

### 3. 배포 스크립트
- ✅ **deploy.sh**: 자동 배포 스크립트 (빌드, 실행, Health check)
  - Docker 설치 확인
  - 이전 컨테이너 정리
  - 이미지 빌드 (no-cache)
  - 컨테이너 실행 (detached mode)
  - Health check 검증
  - 데이터베이스 연결 확인

### 4. 배포 문서
- ✅ **DEPLOYMENT_GUIDE_LIGHTSAIL.md**: AWS Lightsail 완전 배포 가이드
  - 인스턴스 생성 가이드
  - Docker 설치 절차
  - V-BIP 배포 단계별 설명
  - SSL 인증서 설정 (Let's Encrypt)
  - 모니터링 및 로그 관리
  - 백업/복원 절차
  - 문제 해결 가이드
  - 성능 최적화 팁

---

## 🏗️ 아키텍처

### Docker 컨테이너 구성
```
┌─────────────────────────────────────────┐
│           Nginx (Port 80/443)           │
│         (리버스 프록시 & SSL)             │
└──────────────┬──────────────────────────┘
               │
┌──────────────▼──────────────────────────┐
│     Flask API Server (Port 5000)        │
│   - Gunicorn (4 workers)                │
│   - V-BIP 2.3 API Endpoints             │
│   - AI 진단 엔진                         │
│   - 자동 복구 매니저                      │
└──────────────┬──────────────────────────┘
               │
┌──────────────▼──────────────────────────┐
│    PostgreSQL 15 (Port 5432)            │
│   - 14 테이블                            │
│   - 2,804 에러코드                       │
│   - 자동 스키마 초기화                    │
└─────────────────────────────────────────┘
```

### 볼륨 및 데이터 지속성
- **postgres_data**: PostgreSQL 데이터 영구 저장
- **logs**: 애플리케이션 로그 파일

---

## 🔧 기술 스택

### 컨테이너 이미지
- **Python**: 3.12-slim (경량화)
- **PostgreSQL**: 15-alpine (최신 안정 버전)
- **Nginx**: alpine (경량 웹서버)

### Python 패키지
```
Flask==3.1.2
Flask-CORS==5.0.0
psycopg2-binary==2.9.11
gunicorn==23.0.0
openai==2.21.0
PyMuPDF==1.27.1
pdfplumber==0.11.4
requests==2.32.3
python-dotenv==1.0.0
```

### 네트워크
- **vbip-network**: 컨테이너 간 내부 통신
- **포트 매핑**: 80 (HTTP), 443 (HTTPS), 5000 (API), 5432 (DB)

---

## 📊 배포 사양

### 권장 최소 사양 (AWS Lightsail)
- **인스턴스**: Ubuntu 22.04 LTS
- **플랜**: $10/월
  - CPU: 1 vCPU
  - RAM: 2GB
  - SSD: 60GB
  - 전송량: 3TB/월
- **고정 IP**: 무료 (1개)

### 프로덕션 권장 사양
- **플랜**: $20/월
  - CPU: 2 vCPU
  - RAM: 4GB
  - SSD: 80GB
  - 전송량: 4TB/월

---

## 🚀 배포 절차 요약

### 1단계: Lightsail 인스턴스 생성 (5분)
```bash
# AWS 콘솔에서 진행
Region: 서울 (ap-northeast-2)
OS: Ubuntu 22.04 LTS
플랜 선택 → 고정 IP 할당
```

### 2단계: Docker 설치 (5분)
```bash
ssh ubuntu@YOUR-IP
curl -fsSL https://get.docker.com | sh
sudo apt-get install -y docker-compose
sudo usermod -aG docker ubuntu
```

### 3단계: V-BIP 배포 (10분)
```bash
# GitHub Clone
git clone https://github.com/thelab-bobkim/V-BIP.git
cd V-BIP

# 환경 설정
cp .env.example .env
nano .env  # 비밀번호 변경

# 배포 실행
./deploy.sh
```

### 4단계: 접속 확인 (2분)
```bash
# 브라우저에서
http://YOUR-FIXED-IP
http://YOUR-FIXED-IP/api/health
```

**총 소요 시간**: 약 30분

---

## 🔐 보안 설정

### 환경 변수 (필수 변경)
```bash
# 운영 환경용 강력한 비밀번호로 변경
POSTGRES_PASSWORD=<랜덤 32자 이상>
SECRET_KEY=<Flask 비밀키 32자 이상>
```

### 방화벽 규칙
```bash
# Lightsail 콘솔에서 설정
- SSH (22): 관리자 IP만 허용
- HTTP (80): 모든 IP 허용
- HTTPS (443): 모든 IP 허용 (SSL 사용시)
- API (5000): 선택적 (Nginx 사용시 차단)
```

### SSL/TLS (Let's Encrypt)
```bash
# 무료 SSL 인증서 자동 발급
sudo certbot certonly --standalone -d your-domain.com
# 자동 갱신 (3개월마다)
```

---

## 📈 모니터링 및 관리

### Health Check
```bash
# 자동 Health Check (30초마다)
docker-compose ps
curl http://localhost:5000/api/health
```

### 로그 확인
```bash
# 실시간 로그
docker-compose logs -f

# API 서버 로그만
docker-compose logs -f api

# 최근 100줄
docker-compose logs --tail=100
```

### 백업
```bash
# 데이터베이스 백업 (일일 권장)
docker-compose exec postgres pg_dump -U vbip_user vbip > backup_$(date +%Y%m%d).sql

# 전체 볼륨 백업 (주간 권장)
docker run --rm \
  -v vbip_postgres_data:/data \
  -v $(pwd):/backup \
  ubuntu tar czf /backup/postgres_backup_$(date +%Y%m%d).tar.gz -C /data .
```

---

## 🐛 문제 해결

### 컨테이너가 시작되지 않을 때
```bash
# 로그 확인
docker-compose logs api

# 일반적인 원인:
# 1. 데이터베이스 연결 실패 → .env 파일 확인
# 2. 포트 충돌 → 5000 포트 사용 프로세스 확인
# 3. 메모리 부족 → 인스턴스 업그레이드
```

### 외부 접속이 안될 때
```bash
# 방화벽 확인
sudo ufw status
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Lightsail 콘솔에서 방화벽 규칙 확인
```

### 데이터베이스 초기화
```bash
# 스키마 재적용
docker-compose down -v  # 볼륨 삭제 포함
docker-compose up -d
```

---

## 📦 배포 파일 목록

```
V-BIP/
├── Dockerfile                          # Flask API 이미지
├── docker-compose.yml                  # 3-tier 구성
├── .dockerignore                       # 빌드 제외 파일
├── .env.example                        # 환경 변수 템플릿
├── deploy.sh                           # 자동 배포 스크립트 ⭐
├── requirements.txt                    # Python 패키지
├── nginx/
│   └── nginx.conf                      # Nginx 설정
├── database/
│   ├── schema.sql                      # 기본 스키마
│   └── schema_ai_extension.sql         # AI 확장 스키마
├── api_server.py                       # Flask 애플리케이션
├── auto_recovery/
│   └── recovery_manager_v2.py          # 자동 복구 로직
├── ai_diagnosis/
│   └── lightweight_diagnosis_engine.py # AI 진단 엔진
├── approval_workflow_manager.py        # 승인 워크플로우
└── DEPLOYMENT_GUIDE_LIGHTSAIL.md      # 배포 가이드 ⭐
```

---

## ✅ 검증 체크리스트

### 배포 전 체크리스트
- [x] Dockerfile 작성 및 최적화
- [x] docker-compose.yml 3-tier 구성
- [x] .env.example 환경 변수 템플릿
- [x] nginx.conf 리버스 프록시 설정
- [x] deploy.sh 자동 배포 스크립트
- [x] DEPLOYMENT_GUIDE_LIGHTSAIL.md 작성
- [x] .dockerignore 불필요한 파일 제외
- [x] Health check 엔드포인트 구현
- [x] 데이터베이스 자동 초기화 설정

### 배포 후 체크리스트 (Phase 4)
- [ ] AWS Lightsail 인스턴스 생성
- [ ] Docker & Docker Compose 설치
- [ ] V-BIP 배포 실행
- [ ] Health check 통과 확인
- [ ] 대시보드 접속 확인
- [ ] API 엔드포인트 테스트
- [ ] 데이터베이스 연결 확인
- [ ] SSL 인증서 설정 (선택)
- [ ] 백업 스크립트 설정
- [ ] 모니터링 설정

---

## 🎯 다음 단계 (Phase 4)

### Phase 4: AWS Lightsail 프로덕션 배포
**예상 소요 시간**: 3시간

#### 주요 작업
1. **Lightsail 인스턴스 생성** (30분)
   - 서울 리전 선택
   - Ubuntu 22.04 LTS 설치
   - 고정 IP 할당
   - 방화벽 규칙 설정

2. **Docker 설치 및 배포** (1시간)
   - Docker Engine 설치
   - Docker Compose 설치
   - V-BIP 소스코드 배포
   - 환경 변수 설정
   - 컨테이너 실행

3. **검증 및 테스트** (1시간)
   - Health check 확인
   - 대시보드 UI 테스트
   - API 엔드포인트 테스트
   - 자동 복구 기능 테스트
   - 승인 워크플로우 테스트
   - 부하 테스트 (선택)

4. **모니터링 설정** (30분)
   - 로그 확인 절차
   - 백업 스크립트 설정
   - 알림 설정 (선택)
   - SSL 인증서 설정 (선택)

---

## 📚 참고 자료

- **GitHub 리포지토리**: https://github.com/thelab-bobkim/V-BIP
- **Docker 공식 문서**: https://docs.docker.com/
- **AWS Lightsail 문서**: https://docs.aws.amazon.com/lightsail/
- **Flask 배포 가이드**: https://flask.palletsprojects.com/en/3.0.x/deploying/
- **PostgreSQL Docker**: https://hub.docker.com/_/postgres

---

## 📞 지원 및 문의

- **이슈 리포트**: GitHub Issues
- **문서 업데이트**: Phase 4 완료 후 최종 업데이트 예정

---

**Phase 3 완료**  
**작성자**: V-BIP Development Team  
**최종 수정**: 2026-02-18  
**다음 Phase**: Phase 4 - AWS Lightsail 프로덕션 배포
