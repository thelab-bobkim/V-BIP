# V-BIP 2.3 AWS Lightsail 배포 가이드

## 📋 목차
1. [사전 준비](#사전-준비)
2. [Lightsail 인스턴스 생성](#lightsail-인스턴스-생성)
3. [Docker 설치](#docker-설치)
4. [V-BIP 배포](#v-bip-배포)
5. [SSL 인증서 설정](#ssl-인증서-설정)
6. [모니터링 및 관리](#모니터링-및-관리)
7. [문제 해결](#문제-해결)

---

## 사전 준비

### 필요한 것들
- AWS 계정
- SSH 클라이언트 (PuTTY, Terminal 등)
- 도메인 네임 (선택사항 - SSL 사용시)
- V-BIP 소스코드 (GitHub 또는 tar.gz)

### 권장 사양
- **인스턴스**: 2GB RAM 이상 (Ubuntu 22.04 LTS)
- **스토리지**: 40GB 이상 (데이터베이스용)
- **네트워크**: 고정 IP 주소

---

## Lightsail 인스턴스 생성

### 1단계: AWS Lightsail 콘솔 접속
1. https://lightsail.aws.amazon.com/ 접속
2. "인스턴스 생성" 클릭

### 2단계: 인스턴스 설정
```
위치: 서울 (ap-northeast-2)
플랫폼: Linux/Unix
OS: Ubuntu 22.04 LTS
플랜: $10/월 (2GB RAM, 1 vCPU, 60GB SSD)
인스턴스 이름: vbip-production
```

### 3단계: 방화벽 설정
기본 SSH(22) 외에 추가 포트 개방:
```
- HTTP: 80
- HTTPS: 443 (SSL 사용시)
- Custom: 5000 (API 직접 접근시)
```

### 4단계: 고정 IP 할당
1. 인스턴스 생성 후 "네트워킹" 탭
2. "고정 IP 생성" → 인스턴스에 연결
3. IP 주소 기록 (예: 13.124.XXX.XXX)

---

## Docker 설치

### SSH 접속
```bash
# Lightsail 콘솔에서 "SSH를 사용하여 연결" 또는
ssh ubuntu@YOUR-FIXED-IP -i LightsailDefaultKey.pem
```

### Docker 및 Docker Compose 설치
```bash
# 시스템 업데이트
sudo apt-get update && sudo apt-get upgrade -y

# Docker 설치
curl -fsSL https://get.docker.com | sh

# Docker Compose 설치
sudo apt-get install -y docker-compose

# 현재 사용자를 docker 그룹에 추가
sudo usermod -aG docker ubuntu

# 재로그인 (그룹 변경 적용)
exit
# 다시 SSH 접속
```

### Docker 설치 확인
```bash
docker --version
docker-compose --version
```

---

## V-BIP 배포

### 1단계: 소스코드 다운로드

#### 방법 A: GitHub에서 Clone
```bash
cd /home/ubuntu
git clone https://github.com/thelab-bobkim/V-BIP.git
cd V-BIP
```

#### 방법 B: tar.gz 파일 업로드
```bash
# 로컬에서 파일 업로드
scp -i LightsailDefaultKey.pem vbip_phase2-5_complete_2026-02-18.tar.gz ubuntu@YOUR-IP:/home/ubuntu/

# 서버에서 압축 해제
cd /home/ubuntu
tar -xzf vbip_phase2-5_complete_2026-02-18.tar.gz
cd V-BIP
```

### 2단계: 환경 설정
```bash
# .env 파일 생성
cp .env.example .env
nano .env
```

**수정할 항목:**
```bash
# 운영 환경용 강력한 비밀번호로 변경
POSTGRES_PASSWORD=YOUR-STRONG-PASSWORD-HERE
SECRET_KEY=YOUR-FLASK-SECRET-KEY-HERE

# 도메인 설정 (SSL 사용시)
DOMAIN_NAME=vbip.yourdomain.com
SSL_ENABLED=true
```

### 3단계: 배포 실행
```bash
# 배포 스크립트 실행
./deploy.sh
```

배포 과정:
1. ✅ Docker 이미지 빌드 (~5분)
2. ✅ PostgreSQL 컨테이너 시작
3. ✅ 데이터베이스 스키마 초기화
4. ✅ Flask API 서버 시작
5. ✅ Nginx 프록시 시작
6. ✅ Health check 통과

### 4단계: 접속 확인
```bash
# 로컬 테스트
curl http://localhost:5000/api/health

# 외부에서 접속 (브라우저)
http://YOUR-FIXED-IP
http://YOUR-FIXED-IP/api/health
```

---

## SSL 인증서 설정 (선택사항)

### Let's Encrypt 무료 SSL 사용

```bash
# Certbot 설치
sudo apt-get install -y certbot python3-certbot-nginx

# Nginx 컨테이너 중지
docker-compose stop nginx

# SSL 인증서 발급
sudo certbot certonly --standalone \
  -d vbip.yourdomain.com \
  --agree-tos \
  -m your-email@example.com

# 인증서 파일 위치 확인
sudo ls -la /etc/letsencrypt/live/vbip.yourdomain.com/

# Nginx 설정 수정
cd /home/ubuntu/V-BIP
nano nginx/nginx.conf
# HTTPS 서버 블록 주석 해제 및 도메인 수정

# Nginx 재시작
docker-compose up -d nginx
```

### 자동 갱신 설정
```bash
# Cron 작업 추가 (3개월마다 갱신)
sudo crontab -e

# 추가할 내용
0 0 1 */3 * certbot renew --quiet && docker-compose restart nginx
```

---

## 모니터링 및 관리

### 로그 확인
```bash
# 전체 로그
docker-compose logs -f

# API 서버 로그만
docker-compose logs -f api

# PostgreSQL 로그
docker-compose logs -f postgres

# Nginx 로그
docker-compose logs -f nginx
```

### 컨테이너 상태
```bash
# 실행 중인 컨테이너 확인
docker-compose ps

# 리소스 사용량
docker stats
```

### 데이터베이스 관리
```bash
# PostgreSQL 접속
docker-compose exec postgres psql -U vbip_user -d vbip

# 에러코드 개수 확인
SELECT COUNT(*) FROM error_patterns;

# Level별 분포
SELECT resolution_level, COUNT(*) 
FROM error_patterns 
GROUP BY resolution_level;

# 최근 incidents 확인
SELECT * FROM incidents ORDER BY detected_at DESC LIMIT 10;
```

### 백업
```bash
# 데이터베이스 백업
docker-compose exec postgres pg_dump -U vbip_user vbip > backup_$(date +%Y%m%d).sql

# 전체 볼륨 백업
docker run --rm \
  -v vbip_postgres_data:/data \
  -v $(pwd):/backup \
  ubuntu tar czf /backup/postgres_data_backup_$(date +%Y%m%d).tar.gz -C /data .
```

### 복원
```bash
# 데이터베이스 복원
cat backup_20260218.sql | docker-compose exec -T postgres psql -U vbip_user -d vbip
```

---

## 문제 해결

### API 서버가 시작되지 않을 때
```bash
# 로그 확인
docker-compose logs api

# 일반적인 원인:
# 1. 데이터베이스 연결 실패 → POSTGRES_PASSWORD 확인
# 2. 포트 충돌 → 5000 포트 사용 중인지 확인
# 3. 메모리 부족 → 인스턴스 사양 업그레이드
```

### 데이터베이스 테이블이 없을 때
```bash
# 스키마 수동 적용
docker-compose exec -T postgres psql -U vbip_user -d vbip < database/schema.sql
docker-compose exec -T postgres psql -U vbip_user -d vbip < database/schema_ai_extension.sql

# API 서버 재시작
docker-compose restart api
```

### 외부 접속이 안될 때
```bash
# 방화벽 확인
sudo ufw status

# Lightsail 방화벽 확인 (콘솔에서)
# 80, 443 포트가 열려있는지 확인
```

### 메모리 부족
```bash
# 현재 메모리 사용량
free -h

# Docker 메모리 정리
docker system prune -a

# 필요시 인스턴스 업그레이드
# Lightsail 콘솔 → 인스턴스 → 관리 → 플랜 변경
```

---

## 성능 최적화

### Gunicorn Workers 조정
```bash
# api_server.py 또는 Dockerfile CMD 수정
# Workers 수 = (2 × CPU 코어 수) + 1
# 2 vCPU → 5 workers
gunicorn --bind 0.0.0.0:5000 --workers 5 --timeout 120 api_server:app
```

### PostgreSQL 튜닝
```bash
# docker-compose.yml에 추가
postgres:
  command: 
    - "postgres"
    - "-c"
    - "shared_buffers=256MB"
    - "-c"
    - "max_connections=100"
    - "-c"
    - "work_mem=8MB"
```

### Nginx 캐싱 (정적 콘텐츠)
```nginx
# nginx.conf에 추가
location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}
```

---

## 유지보수 체크리스트

### 매일
- [ ] Health check 확인: `curl http://localhost:5000/api/health`
- [ ] 로그 모니터링: `docker-compose logs --tail=100`

### 매주
- [ ] 디스크 공간 확인: `df -h`
- [ ] 데이터베이스 백업
- [ ] 에러 발생 통계 확인

### 매월
- [ ] 시스템 업데이트: `sudo apt-get update && sudo apt-get upgrade`
- [ ] SSL 인증서 갱신 확인
- [ ] 성능 리포트 생성

---

## 연락처 및 지원

- **GitHub**: https://github.com/thelab-bobkim/V-BIP
- **문서**: `/home/ubuntu/V-BIP/README.md`
- **이슈 리포트**: GitHub Issues

---

**배포 완료 시간**: 약 30-40분  
**최초 작성**: 2026-02-18  
**최종 업데이트**: Phase 2-5 완료 기준
