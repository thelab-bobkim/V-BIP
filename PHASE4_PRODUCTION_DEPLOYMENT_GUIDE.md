# V-BIP 2.3 Phase 4 프로덕션 배포 가이드
## AWS Lightsail 실전 배포 매뉴얼

---

## 📋 Phase 4 개요

**목표**: V-BIP 2.3 시스템을 AWS Lightsail에 프로덕션 환경으로 배포  
**예상 소요 시간**: 3시간  
**난이도**: 중급  
**비용**: 월 $10-20 (인스턴스 사양에 따라)

---

## ✅ 사전 준비 체크리스트

### 필수 준비물
- [ ] AWS 계정 (신용카드 등록 필요)
- [ ] SSH 클라이언트 (Windows: PuTTY, Mac/Linux: Terminal)
- [ ] V-BIP 소스코드 접근 (GitHub 또는 tar.gz)
- [ ] 도메인 네임 (선택사항 - SSL 사용시)

### 확인 사항
- [ ] AWS 계정 활성화 완료
- [ ] 결제 정보 등록 완료
- [ ] Lightsail 서비스 접근 가능
- [ ] GitHub 리포지토리 접근 권한

---

## 🚀 Phase 4 단계별 실행

### STEP 1: AWS Lightsail 인스턴스 생성 (15분)

#### 1.1 AWS Lightsail 콘솔 접속
```
https://lightsail.aws.amazon.com/
```

#### 1.2 인스턴스 생성
1. **"인스턴스 생성" 버튼 클릭**

2. **인스턴스 위치 선택**
   ```
   리전: 아시아 태평양 (서울)
   가용 영역: ap-northeast-2a (자동 선택)
   ```

3. **플랫폼 선택**
   ```
   Linux/Unix
   ```

4. **블루프린트 선택**
   ```
   OS 전용 → Ubuntu 22.04 LTS
   ```

5. **인스턴스 플랜 선택**
   
   **최소 사양 (테스트/개발용)**
   ```
   플랜: $10/월
   - 1 vCPU
   - 2 GB RAM
   - 60 GB SSD
   - 3 TB 전송량
   ```
   
   **권장 사양 (프로덕션용)** ⭐
   ```
   플랜: $20/월
   - 2 vCPU
   - 4 GB RAM
   - 80 GB SSD
   - 4 TB 전송량
   ```

6. **인스턴스 식별**
   ```
   인스턴스 이름: vbip-production
   키-전용 태그: 
     - Project: V-BIP
     - Environment: Production
     - Version: 2.3
   ```

7. **"인스턴스 생성" 클릭**
   - 생성 시간: 약 2-3분
   - 상태: "실행 중"이 될 때까지 대기

#### 1.3 고정 IP 할당 (필수)
1. 생성된 인스턴스 클릭
2. **"네트워킹" 탭** 선택
3. **"고정 IP 생성"** 클릭
4. **이름**: `vbip-production-ip`
5. **"생성 및 연결"** 클릭
6. **IP 주소 기록**: 예) `13.124.XXX.XXX`

#### 1.4 방화벽 규칙 설정
1. **"네트워킹" 탭** → **"IPv4 방화벽"**
2. **기본 규칙 확인**:
   - SSH (TCP 22) - 모든 IP
3. **추가 규칙 생성**:
   ```
   규칙 1:
   애플리케이션: HTTP
   프로토콜: TCP
   포트: 80
   소스: 모든 IP (0.0.0.0/0)

   규칙 2:
   애플리케이션: HTTPS
   프로토콜: TCP
   포트: 443
   소스: 모든 IP (0.0.0.0/0)
   
   규칙 3 (선택사항 - API 직접 접근):
   애플리케이션: 사용자 지정
   프로토콜: TCP
   포트: 5000
   소스: 특정 IP만 (보안 강화)
   ```

---

### STEP 2: SSH 접속 및 시스템 설정 (10분)

#### 2.1 SSH 접속
**방법 A: Lightsail 브라우저 SSH (권장 - 초보자)**
1. 인스턴스 목록에서 **터미널 아이콘** 클릭
2. 브라우저에서 직접 SSH 접속

**방법 B: 로컬 SSH 클라이언트**
```bash
# Lightsail에서 기본 키 다운로드
# 계정 → SSH 키 → 기본 키 다운로드

# Mac/Linux
chmod 400 LightsailDefaultKey-ap-northeast-2.pem
ssh -i LightsailDefaultKey-ap-northeast-2.pem ubuntu@13.124.XXX.XXX

# Windows (PuTTY)
# .pem 파일을 .ppk로 변환 후 사용
```

#### 2.2 시스템 업데이트
```bash
# 패키지 목록 업데이트
sudo apt-get update

# 시스템 업그레이드 (약 2-3분 소요)
sudo apt-get upgrade -y

# 시스템 재부팅 (선택사항 - 커널 업데이트시)
# sudo reboot
# 재접속 대기: 약 1분
```

#### 2.3 필수 유틸리티 설치
```bash
# Git 설치
sudo apt-get install -y git curl wget vim

# 설치 확인
git --version
curl --version
```

---

### STEP 3: Docker 설치 (10분)

#### 3.1 Docker Engine 설치
```bash
# Docker 공식 설치 스크립트 실행 (약 2-3분)
curl -fsSL https://get.docker.com | sh

# Docker 버전 확인
docker --version
# 출력 예: Docker version 24.0.7, build afdd53b
```

#### 3.2 Docker Compose 설치
```bash
# Docker Compose 설치
sudo apt-get install -y docker-compose

# 버전 확인
docker-compose --version
# 출력 예: docker-compose version 1.29.2
```

#### 3.3 Docker 권한 설정
```bash
# 현재 사용자를 docker 그룹에 추가
sudo usermod -aG docker ubuntu

# 그룹 변경 즉시 적용
newgrp docker

# 권한 확인 (sudo 없이 실행 가능해야 함)
docker ps
# 출력: CONTAINER ID   IMAGE     COMMAND   ...
```

#### 3.4 Docker 자동 시작 설정
```bash
# Docker 서비스 자동 시작 활성화
sudo systemctl enable docker

# Docker 상태 확인
sudo systemctl status docker
# 출력: active (running) 확인
```

---

### STEP 4: V-BIP 배포 (20분)

#### 4.1 소스코드 다운로드

**방법 A: GitHub Clone (권장)**
```bash
# 홈 디렉토리로 이동
cd /home/ubuntu

# GitHub에서 Clone
git clone https://github.com/thelab-bobkim/V-BIP.git

# 디렉토리 이동
cd V-BIP

# 브랜치 확인
git branch
# 출력: * main

# 최신 커밋 확인
git log --oneline -5
```

**방법 B: tar.gz 파일 업로드**
```bash
# 로컬 PC에서 파일 업로드
# Mac/Linux:
scp -i LightsailDefaultKey.pem vbip_phase2-5_complete_2026-02-18.tar.gz ubuntu@13.124.XXX.XXX:/home/ubuntu/

# Windows: WinSCP 또는 FileZilla 사용

# 서버에서 압축 해제
cd /home/ubuntu
tar -xzf vbip_phase2-5_complete_2026-02-18.tar.gz
cd V-BIP
```

#### 4.2 환경 설정
```bash
# .env 파일 생성
cp .env.example .env

# .env 파일 편집
nano .env
```

**필수 수정 항목:**
```bash
# PostgreSQL 설정 (보안 강화 필수!)
POSTGRES_HOST=postgres
POSTGRES_PORT=5432
POSTGRES_DB=vbip
POSTGRES_USER=vbip_user
POSTGRES_PASSWORD=YOUR_STRONG_PASSWORD_HERE_32_CHARS_MIN  # ⚠️ 반드시 변경!

# Flask 설정
FLASK_ENV=production
FLASK_DEBUG=False
SECRET_KEY=YOUR_FLASK_SECRET_KEY_32_CHARS_MIN  # ⚠️ 반드시 변경!

# 애플리케이션 설정
APP_PORT=5000
GUNICORN_WORKERS=4
GUNICORN_TIMEOUT=120

# 로그 설정
LOG_LEVEL=INFO
LOG_FILE=/app/logs/vbip.log

# AWS Lightsail 배포 설정 (선택사항)
DOMAIN_NAME=your-domain.com  # 도메인 있으면 입력
SSL_ENABLED=false  # SSL 설정 후 true로 변경
```

**강력한 비밀번호 생성 방법:**
```bash
# 랜덤 32자 비밀번호 생성
openssl rand -base64 32

# 예시 출력:
# Kj9mP3xQ7zR5vN8wL2aB6tY4uH1sF0eC
```

**파일 저장:**
- nano 편집기: `Ctrl+O` (저장) → `Enter` → `Ctrl+X` (종료)
- vim 편집기: `ESC` → `:wq` → `Enter`

#### 4.3 디렉토리 권한 확인
```bash
# 로그 디렉토리 생성
mkdir -p logs

# 권한 설정
chmod 755 logs
chmod +x deploy.sh

# 파일 구조 확인
ls -la
```

#### 4.4 배포 실행
```bash
# 자동 배포 스크립트 실행
./deploy.sh
```

**예상 출력:**
```
=========================================
V-BIP 2.3 Docker 배포 시작
=========================================

📦 이전 컨테이너 정리 중...
No stopped containers

🔨 Docker 이미지 빌드 중...
Building api...
Step 1/9 : FROM python:3.12-slim
...
Successfully built abc123def456
Successfully tagged vbip_api:latest

🚀 컨테이너 실행 중...
Creating vbip-postgres ... done
Creating vbip-api      ... done
Creating vbip-nginx    ... done

⏳ 컨테이너 시작 대기 중 (30초)...

📊 컨테이너 상태 확인:
      Name                    State     Ports
------------------------------------------------------
vbip-postgres   Up 30 seconds  0.0.0.0:5432->5432/tcp
vbip-api        Up 28 seconds  0.0.0.0:5000->5000/tcp
vbip-nginx      Up 26 seconds  0.0.0.0:80->80/tcp

🏥 Health Check...
✅ API 서버 정상
✅ Nginx 정상

🗄️  데이터베이스 연결 확인...
 count 
-------
  2825
(1 row)

=========================================
✅ V-BIP 2.3 배포 완료!
=========================================

📍 접속 주소:
   - API Server: http://localhost:5000
   - Dashboard: http://localhost
   - Health Check: http://localhost:5000/api/health
```

#### 4.5 수동 빌드 (deploy.sh 오류시)
```bash
# Docker Compose로 직접 빌드 및 실행
docker-compose down
docker-compose build --no-cache
docker-compose up -d

# 로그 확인
docker-compose logs -f
```

---

### STEP 5: 접속 확인 및 테스트 (15분)

#### 5.1 로컬 Health Check
```bash
# API 서버 Health Check
curl http://localhost:5000/api/health

# 예상 출력:
# {
#   "database": "connected",
#   "status": "healthy",
#   "success": true,
#   "timestamp": "2026-02-18T12:30:00.123456"
# }

# 대시보드 HTML 확인
curl http://localhost | head -20

# Nginx 확인
curl http://localhost/health
# 출력: healthy
```

#### 5.2 외부 접속 테스트
**브라우저에서 접속:**
```
http://YOUR-FIXED-IP
예: http://13.124.XXX.XXX
```

**예상 화면:**
- ✅ V-BIP 2.3 대시보드 로딩
- ✅ 통계 카드 표시 (총 에러코드, 오늘 인시던트 등)
- ✅ 차트 렌더링 (Level별 분포, 일일 추이)
- ✅ 승인 대기 목록 로딩

**API 엔드포인트 테스트:**
```bash
# 로컬 PC 또는 서버에서
curl http://YOUR-FIXED-IP/api/health

curl http://YOUR-FIXED-IP/api/error-codes/statistics

curl http://YOUR-FIXED-IP/api/approval/pending
```

#### 5.3 데이터베이스 확인
```bash
# PostgreSQL 접속
docker-compose exec postgres psql -U vbip_user -d vbip

# 에러코드 개수 확인
SELECT COUNT(*) FROM error_patterns;
# 출력: 2825 (또는 현재 개수)

# Level별 분포
SELECT resolution_level, COUNT(*) as count 
FROM error_patterns 
GROUP BY resolution_level 
ORDER BY resolution_level;

# 자동 수정 가능 코드
SELECT COUNT(*) 
FROM error_patterns 
WHERE resolution_level = 1;

# PostgreSQL 종료
\q
```

#### 5.4 로그 확인
```bash
# 전체 로그
docker-compose logs --tail=50

# API 서버 로그만
docker-compose logs -f api

# 실시간 모니터링 (Ctrl+C로 종료)
docker-compose logs -f
```

---

### STEP 6: SSL 인증서 설정 (선택사항, 20분)

**⚠️ 주의: 도메인 네임이 있어야 합니다!**

#### 6.1 도메인 DNS 설정
1. 도메인 등록 사이트 (예: Gabia, AWS Route 53, Cloudflare)
2. A 레코드 추가:
   ```
   호스트: @ (또는 vbip)
   유형: A
   값: YOUR-FIXED-IP (13.124.XXX.XXX)
   TTL: 3600
   ```
3. 전파 대기: 5-10분

#### 6.2 DNS 전파 확인
```bash
# 서버에서 확인
nslookup your-domain.com

# 또는
dig your-domain.com +short
# 출력: YOUR-FIXED-IP
```

#### 6.3 Certbot 설치
```bash
# Certbot 및 Nginx 플러그인 설치
sudo apt-get install -y certbot python3-certbot-nginx
```

#### 6.4 SSL 인증서 발급
```bash
# Nginx 컨테이너 임시 중지 (80 포트 사용 중이므로)
docker-compose stop nginx

# SSL 인증서 발급
sudo certbot certonly --standalone \
  -d your-domain.com \
  --agree-tos \
  -m your-email@example.com \
  --non-interactive

# 예상 출력:
# Successfully received certificate.
# Certificate is saved at: /etc/letsencrypt/live/your-domain.com/fullchain.pem
# Key is saved at:         /etc/letsencrypt/live/your-domain.com/privkey.pem
```

#### 6.5 Nginx HTTPS 설정
```bash
# Nginx 설정 파일 편집
nano nginx/nginx.conf
```

**HTTPS 서버 블록 주석 해제 및 수정:**
```nginx
# 기존 주석 제거하고 활성화
server {
    listen 443 ssl http2;
    server_name your-domain.com;  # ← 실제 도메인으로 변경

    # SSL 인증서 경로
    ssl_certificate /etc/letsencrypt/live/your-domain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/your-domain.com/privkey.pem;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    # 나머지 location 블록은 기존과 동일
    location /api/ {
        proxy_pass http://api_backend;
        ...
    }
    
    location / {
        proxy_pass http://api_backend;
        ...
    }
}

# HTTP → HTTPS 리다이렉트 (선택사항)
server {
    listen 80;
    server_name your-domain.com;
    return 301 https://$server_name$request_uri;
}
```

#### 6.6 docker-compose.yml SSL 볼륨 추가
```bash
# docker-compose.yml 편집
nano docker-compose.yml
```

**nginx 서비스에 볼륨 추가:**
```yaml
  nginx:
    ...
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf:ro
      - /etc/letsencrypt:/etc/letsencrypt:ro  # ← 추가
```

#### 6.7 Nginx 재시작
```bash
# Nginx 컨테이너 재시작
docker-compose up -d nginx

# 로그 확인
docker-compose logs nginx
```

#### 6.8 HTTPS 접속 테스트
```bash
# 브라우저에서
https://your-domain.com

# 커맨드라인에서
curl https://your-domain.com
```

#### 6.9 자동 갱신 설정
```bash
# Cron 작업 추가
sudo crontab -e

# 매월 1일 자정에 갱신 (3개월마다 필요)
0 0 1 * * certbot renew --quiet && docker-compose restart nginx
```

---

### STEP 7: 최종 검증 (20분)

#### 7.1 기능 테스트

**대시보드 UI 테스트:**
- [ ] 대시보드 로딩 (http://YOUR-IP 또는 https://your-domain.com)
- [ ] 통계 카드 렌더링
- [ ] 차트 표시 (Level별 분포, 일일 추이)
- [ ] 에러코드 목록 로딩
- [ ] 승인 대기 목록 표시
- [ ] 탭 전환 (Dashboard, Approval Queue, Error Codes)

**API 엔드포인트 테스트:**
```bash
# 1. Health Check
curl http://YOUR-IP/api/health

# 2. 통계 API
curl http://YOUR-IP/api/error-codes/statistics

# 3. 에러코드 목록
curl http://YOUR-IP/api/error-codes?limit=10

# 4. Level 1 코드만
curl http://YOUR-IP/api/error-codes?resolution_level=1&limit=10

# 5. 승인 대기 목록
curl http://YOUR-IP/api/approval/pending

# 6. 자동 수정 가능 코드
curl http://YOUR-IP/api/recovery/auto-fixable
```

**자동 복구 테스트:**
```bash
# Level 1 에러 자동 복구 시뮬레이션
curl -X POST http://YOUR-IP/api/recovery/process \
  -H "Content-Type: application/json" \
  -d '{
    "error_code": "15000",
    "customer_name": "Test Customer",
    "auto_approve": true
  }'

# 예상 출력:
# {
#   "action": "auto_recovered",
#   "error_name": "Host Name Resolution Failed",
#   "resolution_level": 1,
#   "execution_time": "2.5s",
#   "status": "success",
#   "script": "nslookup $HOSTNAME || cat /etc/hosts | grep $HOSTNAME",
#   "output": "OK - Simulation completed",
#   "message": "AI 자동 복구 완료...",
#   "success": true
# }
```

**승인 워크플로우 테스트:**
```bash
# Level 2 에러 승인 요청 생성
curl -X POST http://YOUR-IP/api/approval/request \
  -H "Content-Type: application/json" \
  -d '{
    "error_code": "1",
    "customer_name": "Samsung Electronics",
    "error_log": "The requested operation was partially successful."
  }'

# 승인 대기 목록 확인
curl http://YOUR-IP/api/approval/pending

# 승인 실행 (incident_id는 위에서 받은 ID)
curl -X POST http://YOUR-IP/api/approval/1/approve \
  -H "Content-Type: application/json" \
  -d '{
    "approved_by": "김태현",
    "notes": "테스트 승인"
  }'
```

#### 7.2 성능 테스트
```bash
# API 응답 시간 측정
time curl http://YOUR-IP/api/health

# 동시 요청 테스트 (Apache Bench 설치 필요)
sudo apt-get install -y apache2-utils

# 100개 요청, 10개 동시
ab -n 100 -c 10 http://YOUR-IP/api/health

# 결과 확인:
# - Requests per second: 100+ 이상 권장
# - Time per request: 50ms 이하 권장
```

#### 7.3 리소스 모니터링
```bash
# 컨테이너 리소스 사용량
docker stats --no-stream

# 예상 출력:
# vbip-api: CPU 1-5%, MEM 200-300MB
# vbip-postgres: CPU 0-2%, MEM 50-100MB
# vbip-nginx: CPU 0-1%, MEM 10-20MB

# 디스크 사용량
df -h
# /dev/xvda1: 60GB 중 5-10GB 사용 예상

# 메모리 사용량
free -h
# 총 2GB 중 1GB 사용 예상 (4GB 플랜: 여유 충분)
```

#### 7.4 로그 분석
```bash
# 에러 로그 확인
docker-compose logs api | grep ERROR

# 경고 로그 확인
docker-compose logs api | grep WARNING

# 최근 100줄 확인
docker-compose logs --tail=100
```

---

### STEP 8: 백업 설정 (10분)

#### 8.1 데이터베이스 백업 스크립트
```bash
# 백업 디렉토리 생성
mkdir -p /home/ubuntu/backups

# 백업 스크립트 작성
nano /home/ubuntu/backup_vbip.sh
```

**backup_vbip.sh 내용:**
```bash
#!/bin/bash
# V-BIP 데이터베이스 자동 백업 스크립트

BACKUP_DIR="/home/ubuntu/backups"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="vbip_backup_$DATE.sql"

echo "Starting V-BIP database backup: $DATE"

# Docker 컨테이너에서 pg_dump 실행
docker-compose exec -T postgres pg_dump -U vbip_user vbip > "$BACKUP_DIR/$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
    
    # 압축
    gzip "$BACKUP_DIR/$BACKUP_FILE"
    
    # 7일 이상 오래된 백업 삭제
    find "$BACKUP_DIR" -name "vbip_backup_*.sql.gz" -mtime +7 -delete
    
    echo "Old backups cleaned up (kept last 7 days)"
else
    echo "Backup failed!"
    exit 1
fi
```

**실행 권한 부여:**
```bash
chmod +x /home/ubuntu/backup_vbip.sh
```

#### 8.2 Cron 자동 백업 설정
```bash
# Crontab 편집
crontab -e

# 매일 새벽 2시 자동 백업
0 2 * * * /home/ubuntu/backup_vbip.sh >> /home/ubuntu/backups/backup.log 2>&1
```

#### 8.3 수동 백업 테스트
```bash
# 백업 스크립트 실행
/home/ubuntu/backup_vbip.sh

# 백업 파일 확인
ls -lh /home/ubuntu/backups/

# 예상 출력:
# vbip_backup_20260218_140000.sql.gz (약 5-10MB)
```

#### 8.4 복원 테스트
```bash
# 백업 복원 (주의: 기존 데이터 덮어씀!)
# 1. 압축 해제
gunzip /home/ubuntu/backups/vbip_backup_YYYYMMDD_HHMMSS.sql.gz

# 2. 데이터베이스 복원
cat /home/ubuntu/backups/vbip_backup_YYYYMMDD_HHMMSS.sql | \
  docker-compose exec -T postgres psql -U vbip_user -d vbip

# 3. 확인
docker-compose exec postgres psql -U vbip_user -d vbip -c "SELECT COUNT(*) FROM error_patterns;"
```

---

### STEP 9: 모니터링 설정 (10분)

#### 9.1 컨테이너 자동 재시작 (이미 설정됨)
```bash
# docker-compose.yml에서 확인
cat docker-compose.yml | grep restart
# 출력: restart: always
```

#### 9.2 Health Check 스크립트
```bash
# 헬스 체크 스크립트 작성
nano /home/ubuntu/health_check.sh
```

**health_check.sh 내용:**
```bash
#!/bin/bash
# V-BIP Health Check 스크립트

API_URL="http://localhost:5000/api/health"
EMAIL="your-email@example.com"  # 알림 받을 이메일

# Health Check 실행
RESPONSE=$(curl -s -w "%{http_code}" $API_URL)
HTTP_CODE=$(echo $RESPONSE | tail -c 4)

if [ "$HTTP_CODE" != "200" ]; then
    echo "V-BIP API Health Check Failed: HTTP $HTTP_CODE"
    echo "Time: $(date)"
    echo "Response: $RESPONSE"
    
    # 컨테이너 재시작 시도
    echo "Attempting to restart containers..."
    cd /home/ubuntu/V-BIP
    docker-compose restart api
    
    # 이메일 알림 (선택사항 - mailutils 설치 필요)
    # echo "V-BIP API failed at $(date)" | mail -s "V-BIP Alert" $EMAIL
else
    echo "V-BIP Health Check OK: $(date)"
fi
```

**실행 권한 부여:**
```bash
chmod +x /home/ubuntu/health_check.sh
```

#### 9.3 Cron 모니터링 설정
```bash
# Crontab에 추가
crontab -e

# 5분마다 Health Check
*/5 * * * * /home/ubuntu/health_check.sh >> /home/ubuntu/health_check.log 2>&1
```

#### 9.4 로그 로테이션
```bash
# 로그 로테이션 설정
sudo nano /etc/logrotate.d/vbip
```

**로그 로테이션 설정:**
```
/home/ubuntu/V-BIP/logs/*.log {
    daily
    rotate 7
    compress
    delaycompress
    missingok
    notifempty
    create 0644 ubuntu ubuntu
}
```

---

### STEP 10: 보안 강화 (10분)

#### 10.1 SSH 보안 강화
```bash
# SSH 설정 편집
sudo nano /etc/ssh/sshd_config

# 수정할 항목:
# PasswordAuthentication no  # 비밀번호 로그인 비활성화 (키만 허용)
# PermitRootLogin no          # Root 로그인 차단
# Port 2222                   # SSH 포트 변경 (선택사항)

# SSH 서비스 재시작
sudo systemctl restart sshd
```

#### 10.2 UFW 방화벽 설정
```bash
# UFW 활성화
sudo ufw enable

# 기본 정책 설정
sudo ufw default deny incoming
sudo ufw default allow outgoing

# 필요한 포트만 개방
sudo ufw allow 22/tcp    # SSH
sudo ufw allow 80/tcp    # HTTP
sudo ufw allow 443/tcp   # HTTPS

# 상태 확인
sudo ufw status verbose
```

#### 10.3 Fail2Ban 설치 (SSH 브루트포스 차단)
```bash
# Fail2Ban 설치
sudo apt-get install -y fail2ban

# 서비스 시작
sudo systemctl start fail2ban
sudo systemctl enable fail2ban

# 상태 확인
sudo fail2ban-client status
```

#### 10.4 보안 업데이트 자동 설치
```bash
# Unattended-upgrades 설치
sudo apt-get install -y unattended-upgrades

# 자동 업데이트 활성화
sudo dpkg-reconfigure -plow unattended-upgrades
```

---

## ✅ Phase 4 완료 체크리스트

### 인프라
- [ ] AWS Lightsail 인스턴스 생성 완료
- [ ] 고정 IP 할당 완료
- [ ] 방화벽 규칙 설정 완료
- [ ] SSH 접속 가능

### 시스템
- [ ] 시스템 업데이트 완료
- [ ] Docker 설치 완료
- [ ] Docker Compose 설치 완료
- [ ] Git 설치 완료

### 배포
- [ ] V-BIP 소스코드 다운로드 완료
- [ ] .env 환경 설정 완료 (비밀번호 변경!)
- [ ] Docker 이미지 빌드 완료
- [ ] 컨테이너 실행 완료 (postgres, api, nginx)

### 검증
- [ ] Health Check API 정상 응답
- [ ] 대시보드 UI 접속 가능
- [ ] API 엔드포인트 정상 동작
- [ ] 데이터베이스 연결 확인 (2,825 에러코드)
- [ ] 자동 복구 기능 테스트 성공
- [ ] 승인 워크플로우 테스트 성공

### 보안 및 운영
- [ ] SSL 인증서 설정 (선택사항)
- [ ] 데이터베이스 백업 스크립트 설정
- [ ] Cron 자동 백업 설정
- [ ] Health Check 모니터링 설정
- [ ] 방화벽 규칙 설정
- [ ] 로그 로테이션 설정

---

## 📊 배포 결과 확인

### 시스템 정보
```bash
# 시스템 정보 출력
echo "=== V-BIP 2.3 배포 정보 ==="
echo "서버 IP: $(curl -s ifconfig.me)"
echo "OS: $(lsb_release -d | cut -f2)"
echo "Docker 버전: $(docker --version)"
echo ""
echo "=== 컨테이너 상태 ==="
cd /home/ubuntu/V-BIP
docker-compose ps
echo ""
echo "=== 데이터베이스 ==="
docker-compose exec postgres psql -U vbip_user -d vbip -c "SELECT COUNT(*) as total_errors FROM error_patterns;"
echo ""
echo "=== API Health ==="
curl -s http://localhost:5000/api/health | python3 -m json.tool
```

### 접속 정보
```
대시보드 URL: http://YOUR-FIXED-IP
              또는 https://your-domain.com (SSL 설정시)

API 엔드포인트: http://YOUR-FIXED-IP/api/
Health Check: http://YOUR-FIXED-IP/api/health

SSH 접속: ssh ubuntu@YOUR-FIXED-IP -i LightsailDefaultKey.pem

Docker 관리:
  cd /home/ubuntu/V-BIP
  docker-compose ps
  docker-compose logs -f
  docker-compose restart
```

---

## 🐛 문제 해결

### 자주 발생하는 문제

#### 1. 컨테이너가 시작되지 않음
```bash
# 로그 확인
docker-compose logs api

# 원인 1: 데이터베이스 연결 실패
# 해결: .env 파일의 POSTGRES_PASSWORD 확인

# 원인 2: 포트 충돌
# 해결: 사용 중인 프로세스 확인
sudo lsof -i :5000

# 원인 3: 메모리 부족
# 해결: 인스턴스 업그레이드 (2GB → 4GB)
```

#### 2. 외부 접속 안됨
```bash
# 방화벽 확인
sudo ufw status

# Lightsail 방화벽 확인 (콘솔)
# 80, 443 포트 개방 확인

# Nginx 상태 확인
docker-compose logs nginx
```

#### 3. 데이터베이스 테이블 없음
```bash
# 스키마 수동 적용
cd /home/ubuntu/V-BIP
docker-compose exec -T postgres psql -U vbip_user -d vbip < database/schema.sql
docker-compose exec -T postgres psql -U vbip_user -d vbip < database/schema_ai_extension.sql

# API 재시작
docker-compose restart api
```

#### 4. SSL 인증서 발급 실패
```bash
# DNS 전파 확인
nslookup your-domain.com

# 80 포트 사용 중인지 확인
sudo lsof -i :80

# Nginx 중지 후 재시도
docker-compose stop nginx
sudo certbot certonly --standalone -d your-domain.com
```

#### 5. 메모리 부족
```bash
# 메모리 사용량 확인
free -h

# Docker 정리
docker system prune -a

# 필요시 인스턴스 업그레이드
# Lightsail 콘솔 → 스냅샷 생성 → 더 큰 플랜으로 생성
```

---

## 📈 성능 최적화

### Gunicorn Workers 조정
```bash
# 2 vCPU 인스턴스: 5 workers
# 1 vCPU 인스턴스: 3 workers

# Dockerfile CMD 수정
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "5", "--timeout", "120", "api_server:app"]
```

### PostgreSQL 튜닝
```yaml
# docker-compose.yml 수정
postgres:
  command:
    - "postgres"
    - "-c"
    - "shared_buffers=512MB"  # 4GB RAM 인스턴스
    - "-c"
    - "max_connections=50"
    - "-c"
    - "work_mem=16MB"
```

### Nginx 캐싱
```nginx
# nginx.conf에 추가
proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=api_cache:10m max_size=100m;

location /api/error-codes/statistics {
    proxy_cache api_cache;
    proxy_cache_valid 200 5m;
    proxy_pass http://api_backend;
}
```

---

## 🎯 다음 단계

### 운영 모드 전환 후
1. **모니터링 강화**
   - CloudWatch 또는 Datadog 연동
   - 알림 설정 (이메일, Slack)
   - 대시보드 메트릭 수집

2. **백업 전략**
   - 일일 자동 백업 → S3 업로드
   - 주간 전체 백업 (볼륨 포함)
   - 복구 테스트 주기적 실행

3. **스케일링**
   - 로드 밸런서 도입 (Lightsail LB)
   - 다중 인스턴스 배포
   - 캐싱 레이어 추가 (Redis)

4. **보안 강화**
   - WAF (Web Application Firewall) 설정
   - DDoS 방어 설정
   - 침입 탐지 시스템 (IDS)

---

## 📞 지원

**GitHub**: https://github.com/thelab-bobkim/V-BIP  
**문서**: `/home/ubuntu/V-BIP/README.md`  
**이슈 리포트**: GitHub Issues

---

**Phase 4 완료 예상 시간**: 3시간  
**작성일**: 2026-02-18  
**버전**: V-BIP 2.3
