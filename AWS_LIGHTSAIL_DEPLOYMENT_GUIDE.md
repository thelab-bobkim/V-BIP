# V-BIP 2.3 AWS Lightsail 배포 가이드

## 📋 목차
1. [사전 준비사항](#사전-준비사항)
2. [Lightsail 인스턴스 생성](#lightsail-인스턴스-생성)
3. [서버 초기 설정](#서버-초기-설정)
4. [Docker 설치](#docker-설치)
5. [V-BIP 배포](#v-bip-배포)
6. [도메인 및 SSL 설정](#도메인-및-ssl-설정)
7. [모니터링 및 유지보수](#모니터링-및-유지보수)

---

## 🔧 사전 준비사항

### 필요한 계정 및 도구
- AWS 계정 (Lightsail 사용 가능)
- SSH 클라이언트 (터미널, PuTTY 등)
- Git 클라이언트
- 도메인 (선택사항)

### 권장 사양
- **인스턴스 크기**: 최소 2GB RAM (4GB 권장)
- **스토리지**: 40GB 이상
- **OS**: Ubuntu 22.04 LTS

---

## 🚀 Lightsail 인스턴스 생성

### 1단계: AWS Lightsail 콘솔 접속
1. https://lightsail.aws.amazon.com 접속
2. "인스턴스 생성" 클릭

### 2단계: 인스턴스 설정
```yaml
플랫폼: Linux/Unix
청사진: OS 전용 → Ubuntu 22.04 LTS
인스턴스 플랜: 
  - 개발/테스트: $5/월 (1GB RAM, 1 vCPU, 40GB SSD)
  - 운영: $10/월 (2GB RAM, 1 vCPU, 60GB SSD) ⭐ 권장
  - 프로덕션: $20/월 (4GB RAM, 2 vCPU, 80GB SSD)
```

### 3단계: SSH 키 페어 설정
```bash
# 기본 SSH 키 사용 또는 새 키 생성
# 키 다운로드: LightsailDefaultKey-ap-northeast-2.pem
```

### 4단계: 인스턴스 생성
- 인스턴스 이름: `vbip-production`
- 생성 완료 대기 (약 1-2분)

---

## ⚙️ 서버 초기 설정

### SSH 접속
```bash
# SSH 키 권한 설정
chmod 400 ~/Downloads/LightsailDefaultKey-ap-northeast-2.pem

# SSH 접속
ssh -i ~/Downloads/LightsailDefaultKey-ap-northeast-2.pem ubuntu@<LIGHTSAIL_IP>
```

### 시스템 업데이트
```bash
# 패키지 업데이트
sudo apt-get update
sudo apt-get upgrade -y

# 필수 패키지 설치
sudo apt-get install -y \
    git \
    curl \
    wget \
    vim \
    ufw \
    htop
```

### 방화벽 설정
```bash
# UFW 방화벽 활성화
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp    # HTTP
sudo ufw allow 443/tcp   # HTTPS
sudo ufw allow 5000/tcp  # Flask API (임시)
sudo ufw enable
sudo ufw status
```

---

## 🐳 Docker 설치

### Docker Engine 설치
```bash
# Docker 공식 저장소 추가
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Docker 사용자 그룹 추가
sudo usermod -aG docker ubuntu

# 재로그인 (SSH 재접속)
exit
ssh -i ~/Downloads/LightsailDefaultKey-ap-northeast-2.pem ubuntu@<LIGHTSAIL_IP>

# Docker 버전 확인
docker --version
```

### Docker Compose 설치
```bash
# Docker Compose 설치
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# 버전 확인
docker-compose --version
```

---

## 📦 V-BIP 배포

### 1단계: 코드 다운로드
```bash
# 프로젝트 디렉토리 생성
mkdir -p ~/vbip
cd ~/vbip

# GitHub에서 클론
git clone https://github.com/thelab-bobkim/V-BIP.git .

# 또는 백업 파일에서 복원
wget https://www.genspark.ai/api/files/s/LzuC0BEE -O vbip_backup.tar.gz
tar -xzf vbip_backup.tar.gz
cd V-BIP
```

### 2단계: 환경변수 설정
```bash
# .env 파일 생성
cp .env.example .env
vim .env

# 설정 예시:
# POSTGRES_PASSWORD=강력한_비밀번호_여기에_입력
# SECRET_KEY=$(openssl rand -hex 32)
```

### 3단계: Docker 컨테이너 빌드 및 시작
```bash
# 배포 스크립트 실행
./deploy.sh

# 또는 수동 실행
docker-compose build
docker-compose up -d

# 컨테이너 상태 확인
docker-compose ps
```

### 4단계: 초기 데이터 로드
```bash
# 2,804개 에러코드 로드
./load_initial_data.sh

# 로그 확인
docker-compose logs -f api
```

### 5단계: 서비스 확인
```bash
# Health Check
curl http://localhost:5000/api/health

# API 테스트
curl http://localhost:5000/api/error-codes/statistics | python3 -m json.tool

# 대시보드 접속
curl http://localhost
```

---

## 🌐 도메인 및 SSL 설정

### 도메인 연결 (Route 53 또는 Lightsail DNS)
```bash
# Lightsail 고정 IP 생성
# AWS Lightsail 콘솔 → 네트워킹 → 고정 IP 생성 → 인스턴스 연결

# DNS A 레코드 설정
vbip.yourdomain.com → <LIGHTSAIL_STATIC_IP>
```

### Let's Encrypt SSL 인증서 설치
```bash
# Certbot 설치
sudo apt-get install -y certbot

# SSL 인증서 발급
sudo certbot certonly --standalone -d vbip.yourdomain.com

# 인증서 복사
sudo cp /etc/letsencrypt/live/vbip.yourdomain.com/fullchain.pem ~/vbip/nginx/ssl/
sudo cp /etc/letsencrypt/live/vbip.yourdomain.com/privkey.pem ~/vbip/nginx/ssl/
sudo chown ubuntu:ubuntu ~/vbip/nginx/ssl/*.pem

# Nginx 설정 업데이트 (nginx/nginx.conf에서 HTTPS 섹션 활성화)
vim ~/vbip/nginx/nginx.conf

# Docker Compose 재시작
docker-compose restart nginx
```

### SSL 자동 갱신 설정
```bash
# Cron 작업 추가
sudo crontab -e

# 매월 1일 03:00에 SSL 인증서 갱신
0 3 1 * * certbot renew --quiet && docker-compose -f /home/ubuntu/vbip/docker-compose.yml restart nginx
```

---

## 📊 모니터링 및 유지보수

### 시스템 모니터링
```bash
# 디스크 사용량
df -h

# 메모리 사용량
free -h

# Docker 컨테이너 상태
docker-compose ps

# Docker 리소스 사용량
docker stats

# 시스템 리소스
htop
```

### 로그 확인
```bash
# 전체 로그
docker-compose logs -f

# API 서버 로그만
docker-compose logs -f api

# PostgreSQL 로그만
docker-compose logs -f postgres

# 최근 100줄
docker-compose logs --tail=100 api
```

### 데이터베이스 백업
```bash
# 백업 스크립트 생성
cat > ~/backup_db.sh << 'EOF'
#!/bin/bash
BACKUP_DIR="/home/ubuntu/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
mkdir -p $BACKUP_DIR

docker exec vbip-postgres pg_dump -U vbip_user vbip > $BACKUP_DIR/vbip_backup_$TIMESTAMP.sql

# 30일 이상된 백업 삭제
find $BACKUP_DIR -name "vbip_backup_*.sql" -mtime +30 -delete

echo "Backup completed: vbip_backup_$TIMESTAMP.sql"
EOF

chmod +x ~/backup_db.sh

# Cron 작업 추가 (매일 새벽 2시)
(crontab -l 2>/dev/null; echo "0 2 * * * /home/ubuntu/backup_db.sh") | crontab -
```

### 애플리케이션 업데이트
```bash
# 최신 코드 다운로드
cd ~/vbip
git pull origin main

# Docker 이미지 재빌드
docker-compose build

# 무중단 재시작
docker-compose up -d

# 헬스체크
curl http://localhost:5000/api/health
```

### 문제 해결

#### 컨테이너가 시작되지 않는 경우
```bash
# 로그 확인
docker-compose logs api
docker-compose logs postgres

# 컨테이너 재시작
docker-compose restart

# 전체 재시작
docker-compose down
docker-compose up -d
```

#### 데이터베이스 연결 오류
```bash
# PostgreSQL 컨테이너 상태 확인
docker exec -it vbip-postgres pg_isready -U vbip_user

# 직접 접속 테스트
docker exec -it vbip-postgres psql -U vbip_user -d vbip

# 연결 설정 확인
docker exec vbip-api printenv | grep POSTGRES
```

#### 포트 충돌
```bash
# 포트 사용 확인
sudo netstat -tulpn | grep :5000
sudo netstat -tulpn | grep :5432

# 프로세스 종료
sudo fuser -k 5000/tcp
```

---

## 🔒 보안 권장사항

### 1. SSH 보안 강화
```bash
# 비밀번호 인증 비활성화
sudo vim /etc/ssh/sshd_config
# PasswordAuthentication no

sudo systemctl restart sshd
```

### 2. PostgreSQL 보안
```bash
# 강력한 비밀번호 사용
# .env 파일에서 POSTGRES_PASSWORD 변경

# 외부 접근 차단
# docker-compose.yml에서 5432 포트 제거 (내부 네트워크만 사용)
```

### 3. API 인증 추가
```python
# api_server.py에 JWT 인증 추가 권장
# Flask-JWT-Extended 라이브러리 사용
```

---

## 📞 지원 및 문의

- **GitHub**: https://github.com/thelab-bobkim/V-BIP
- **이메일**: thelab.bobkim@gmail.com
- **문서**: https://github.com/thelab-bobkim/V-BIP/wiki

---

## 📝 체크리스트

배포 완료 전 확인사항:

- [ ] Lightsail 인스턴스 생성 완료
- [ ] SSH 접속 확인
- [ ] Docker 및 Docker Compose 설치
- [ ] V-BIP 코드 다운로드
- [ ] .env 파일 설정
- [ ] Docker 컨테이너 시작
- [ ] 초기 데이터 로드 (2,804개 에러코드)
- [ ] Health Check 성공
- [ ] 도메인 연결 (선택사항)
- [ ] SSL 인증서 설치 (선택사항)
- [ ] 자동 백업 설정
- [ ] 모니터링 도구 설정

---

**작성일**: 2026-02-18  
**버전**: V-BIP 2.3  
**최종 업데이트**: Phase 3 완료
