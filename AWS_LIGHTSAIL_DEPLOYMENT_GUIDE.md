# V-BIP 2.3 AWS Lightsail 프로덕션 배포 가이드

**서버 정보**:
- **퍼블릭 IP**: 3.39.255.201
- **프라이빗 IP**: 172.26.13.4
- **OS**: Ubuntu 20.04/22.04 (Debian 기반)
- **방화벽**: SSH(22), HTTP(80), HTTPS(443), PostgreSQL(5432), Custom(5000-8502)

---

## 📦 배포 전 준비사항

### 1. 서버 접속
```bash
ssh -i ~/.ssh/lightsail_key.pem ubuntu@3.39.255.201
```

### 2. 필수 패키지 설치
```bash
# 시스템 업데이트
sudo apt-get update
sudo apt-get upgrade -y

# Python 3 및 pip
sudo apt-get install -y python3 python3-pip python3-venv

# PostgreSQL 15
sudo apt-get install -y postgresql postgresql-contrib

# Git
sudo apt-get install -y git

# Nginx (리버스 프록시)
sudo apt-get install -y nginx

# Supervisor (프로세스 관리)
sudo apt-get install -y supervisor

# 기타 도구
sudo apt-get install -y curl wget htop vim
```

---

## 🗄️ PostgreSQL 설정

### 1. PostgreSQL 서비스 시작
```bash
sudo service postgresql start
sudo service postgresql enable
```

### 2. 데이터베이스 및 사용자 생성
```bash
sudo -u postgres psql << 'EOF'
CREATE DATABASE vbip;
CREATE USER vbip_user WITH PASSWORD 'YOUR_SECURE_PASSWORD_HERE';
GRANT ALL PRIVILEGES ON DATABASE vbip TO vbip_user;
\c vbip
GRANT ALL ON SCHEMA public TO vbip_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO vbip_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO vbip_user;
\q
EOF
```

### 3. 외부 접속 허용 (선택사항)
```bash
# postgresql.conf 수정
sudo vim /etc/postgresql/15/main/postgresql.conf
# listen_addresses = '*'

# pg_hba.conf 수정
sudo vim /etc/postgresql/15/main/pg_hba.conf
# host    vbip    vbip_user    0.0.0.0/0    md5

# 재시작
sudo service postgresql restart
```

---

## 📂 프로젝트 배포

### 1. GitHub에서 클론
```bash
cd /home/ubuntu
git clone https://github.com/thelab-bobkim/V-BIP.git
cd V-BIP
```

### 2. Python 가상환경 생성
```bash
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements_production.txt
```

### 3. 데이터베이스 스키마 로드
```bash
# V-BIP 기존 스키마
sudo -u postgres psql -d vbip -f database/schema.sql

# AI 확장 스키마
sudo -u postgres psql -d vbip -f database/schema_ai_extension.sql

# 에러코드 50개 로드
sudo -u postgres psql -d vbip -f database/insert_error_codes_50.sql
```

### 4. 환경 변수 설정
```bash
cat > /home/ubuntu/V-BIP/.env << 'EOF'
# Database
DB_HOST=localhost
DB_PORT=5432
DB_NAME=vbip
DB_USER=vbip_user
DB_PASSWORD=YOUR_SECURE_PASSWORD_HERE

# Flask
FLASK_ENV=production
FLASK_DEBUG=False
SECRET_KEY=YOUR_RANDOM_SECRET_KEY_HERE

# API
API_PORT=5000
CORS_ORIGINS=*

# Logging
LOG_LEVEL=INFO
LOG_FILE=/var/log/vbip/api.log
EOF

chmod 600 .env
```

---

## 🚀 Supervisor 설정 (프로세스 관리)

### 1. Supervisor 설정 파일 생성
```bash
sudo tee /etc/supervisor/conf.d/vbip-api.conf << 'EOF'
[program:vbip-api]
directory=/home/ubuntu/V-BIP
command=/home/ubuntu/V-BIP/venv/bin/python3 api_server.py
user=ubuntu
autostart=true
autorestart=true
stderr_logfile=/var/log/vbip/api.err.log
stdout_logfile=/var/log/vbip/api.out.log
environment=PATH="/home/ubuntu/V-BIP/venv/bin"
EOF
```

### 2. 로그 디렉토리 생성
```bash
sudo mkdir -p /var/log/vbip
sudo chown ubuntu:ubuntu /var/log/vbip
```

### 3. Supervisor 재시작
```bash
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start vbip-api
sudo supervisorctl status
```

---

## 🌐 Nginx 리버스 프록시 설정

### 1. Nginx 설정 파일
```bash
sudo tee /etc/nginx/sites-available/vbip << 'EOF'
server {
    listen 80;
    server_name 3.39.255.201;

    # API 서버 프록시
    location /api/ {
        proxy_pass http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # 정적 파일 (향후 대시보드)
    location / {
        root /home/ubuntu/V-BIP/dashboard;
        try_files $uri $uri/ /index.html;
    }
}
EOF
```

### 2. Nginx 활성화
```bash
sudo ln -s /etc/nginx/sites-available/vbip /etc/nginx/sites-enabled/
sudo nginx -t
sudo service nginx restart
```

---

## ✅ 배포 확인

### 1. 서비스 상태 확인
```bash
# PostgreSQL
sudo service postgresql status

# Supervisor
sudo supervisorctl status vbip-api

# Nginx
sudo service nginx status
```

### 2. API 테스트
```bash
# 헬스 체크
curl http://3.39.255.201/api/health

# 에러코드 통계
curl http://3.39.255.201/api/error-codes/statistics

# AI 진단
curl -X POST http://3.39.255.201/api/ai/diagnose \
  -H "Content-Type: application/json" \
  -d '{"error_log": "NetBackup error 84: Media Manager not running"}'
```

### 3. 로그 확인
```bash
# API 로그
tail -f /var/log/vbip/api.out.log

# Nginx 로그
tail -f /var/log/nginx/access.log

# PostgreSQL 로그
sudo tail -f /var/log/postgresql/postgresql-15-main.log
```

---

## 🔒 보안 설정

### 1. 방화벽 (UFW)
```bash
sudo ufw allow 22/tcp    # SSH
sudo ufw allow 80/tcp    # HTTP
sudo ufw allow 443/tcp   # HTTPS
sudo ufw allow 5432/tcp  # PostgreSQL (필요시)
sudo ufw enable
sudo ufw status
```

### 2. SSL/TLS (Let's Encrypt)
```bash
sudo apt-get install -y certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com
```

### 3. PostgreSQL 비밀번호 강화
```bash
sudo -u postgres psql -d vbip << 'EOF'
ALTER USER vbip_user WITH PASSWORD 'NEW_STRONG_PASSWORD';
\q
EOF
```

---

## 🔄 업데이트 및 유지보수

### 1. 코드 업데이트
```bash
cd /home/ubuntu/V-BIP
git pull origin main
source venv/bin/activate
pip install -r requirements_production.txt
sudo supervisorctl restart vbip-api
```

### 2. 데이터베이스 백업
```bash
# 백업
pg_dump -U vbip_user -h localhost -d vbip -F c -f vbip_backup_$(date +%Y%m%d).dump

# 복원
pg_restore -U vbip_user -h localhost -d vbip -c vbip_backup_20260218.dump
```

### 3. 로그 로테이션
```bash
sudo tee /etc/logrotate.d/vbip << 'EOF'
/var/log/vbip/*.log {
    daily
    missingok
    rotate 14
    compress
    delaycompress
    notifempty
    create 0640 ubuntu ubuntu
    sharedscripts
    postrotate
        supervisorctl restart vbip-api > /dev/null
    endscript
}
EOF
```

---

## 📊 모니터링

### 1. 시스템 리소스
```bash
# CPU, 메모리
htop

# 디스크 사용량
df -h

# 네트워크
netstat -tulpn | grep LISTEN
```

### 2. API 성능
```bash
# 응답 시간
curl -w "@curl-format.txt" -o /dev/null -s http://localhost/api/health

# 동시 접속 테스트
ab -n 1000 -c 10 http://localhost/api/health
```

---

## 🚨 트러블슈팅

### API 서버가 시작되지 않는 경우
```bash
# 로그 확인
sudo supervisorctl tail -f vbip-api stderr

# 수동 실행 테스트
cd /home/ubuntu/V-BIP
source venv/bin/activate
python3 api_server.py
```

### PostgreSQL 연결 오류
```bash
# 연결 테스트
psql -h localhost -U vbip_user -d vbip

# 연결 설정 확인
sudo cat /etc/postgresql/15/main/pg_hba.conf
```

### Nginx 502 Bad Gateway
```bash
# API 서버 상태 확인
sudo supervisorctl status vbip-api

# 포트 확인
sudo lsof -i :5000

# Nginx 설정 테스트
sudo nginx -t
```

---

## 📝 Requirements (production)

```txt
# requirements_production.txt
flask==3.1.0
flask-cors==5.0.0
psycopg2-binary==2.9.9
gunicorn==21.2.0
python-dotenv==1.0.0
```

---

## 🎯 배포 체크리스트

- [ ] PostgreSQL 설치 및 데이터베이스 생성
- [ ] 프로젝트 클론 및 가상환경 설정
- [ ] 데이터베이스 스키마 로드
- [ ] 환경 변수 설정 (.env)
- [ ] Supervisor 설정
- [ ] Nginx 설정
- [ ] 방화벽 설정
- [ ] API 테스트
- [ ] SSL 인증서 설치 (선택)
- [ ] 로그 로테이션 설정
- [ ] 백업 스크립트 설정

---

## 📞 지원

**GitHub**: https://github.com/thelab-bobkim/V-BIP  
**API 문서**: http://3.39.255.201/api/health  
**상태**: 프로덕션 준비 완료

**배포 완료 후 접속 URL**:
- **API 서버**: http://3.39.255.201/api/
- **헬스 체크**: http://3.39.255.201/api/health
- **대시보드**: http://3.39.255.201/ (향후 추가)

---

**다음 단계**: 실제 Lightsail 서버에 접속하여 위 가이드대로 배포 진행
