# V-BIP GitHub 배포 완전 가이드

## 📦 다운로드

**최신 버전:** [vbip-phase1-mvp.tar.gz](computer:///mnt/user-data/outputs/vbip-phase1-mvp.tar.gz) (69 KB)

---

## 🚀 방법 1: 자동 스크립트 사용 (가장 쉬움)

### Step 1: 압축 파일 다운로드 및 압축 해제

```bash
# 다운로드 폴더로 이동
cd ~/Downloads

# 압축 해제
tar xzf vbip-phase1-mvp.tar.gz
cd vbip
```

### Step 2: GitHub 업로드 (자동)

```bash
# 스크립트 실행
./github_upload.sh

# 프롬프트에 따라 입력:
# 1. GitHub 사용자명 입력
# 2. GitHub에서 Repository 생성 (https://github.com/new)
#    - Repository name: vbip-backup-monitor
#    - Private 선택 (권장)
#    - README, .gitignore 선택 안 함
# 3. 생성 완료 후 'y' 입력
```

### Step 3: AWS 배포 (자동)

```bash
# AWS 서버 SSH 접속
ssh ubuntu@43.203.181.195

# 배포 스크립트 다운로드 (한 줄로 실행)
curl -o aws_deploy.sh https://raw.githubusercontent.com/YOUR_USERNAME/vbip-backup-monitor/main/aws_deploy.sh && chmod +x aws_deploy.sh

# 또는 수동으로 스크립트 생성 (아래 참고)

# 배포 실행
./aws_deploy.sh

# 프롬프트에 따라 입력:
# 1. GitHub 사용자명
# 2. Private repository인 경우 Personal Access Token
# 3. 기존 컨테이너 삭제 확인
```

**완료!** 브라우저에서 `http://43.203.181.195:5000` 접속

---

## 🛠️ 방법 2: 수동 설정 (상세)

### Part A: 로컬에서 GitHub 업로드

#### 1. 압축 파일 다운로드 및 압축 해제

```bash
cd ~/Downloads
tar xzf vbip-phase1-mvp.tar.gz
cd vbip
```

#### 2. Git 초기화

```bash
git init
```

#### 3. .gitignore 생성

```bash
cat > .gitignore << 'EOF'
# 환경 변수
.env
*.env

# 데이터베이스 백업
*.sql.backup
backup_*.sql

# 업로드 파일
uploads/
sample_logs/*.log

# Docker 볼륨
postgres_data/
n8n_data/

# Python
__pycache__/
*.pyc
venv/

# IDE
.vscode/
.idea/
*.swp

# 시스템
.DS_Store
*.log
EOF
```

#### 4. 파일 추가 및 커밋

```bash
git add .
git commit -m "Initial commit: V-BIP Phase 1 MVP"
```

#### 5. GitHub에서 Repository 생성

1. 브라우저에서 https://github.com/new 접속
2. Repository name: `vbip-backup-monitor`
3. Description: `Veritas Backup Intelligence Platform`
4. **Private** 선택 (권장)
5. README, .gitignore, license 선택 안 함
6. **Create repository** 클릭

#### 6. 원격 저장소 연결 및 푸시

```bash
# YOUR_USERNAME을 본인의 GitHub 사용자명으로 변경
git remote add origin https://github.com/YOUR_USERNAME/vbip-backup-monitor.git
git branch -M main
git push -u origin main
```

**인증 방법:**

**Option A: Personal Access Token (권장)**
```bash
# GitHub → Settings → Developer settings → Personal access tokens → Generate new token
# Scopes: repo (전체)

# 생성된 토큰 사용
git remote set-url origin https://YOUR_TOKEN@github.com/YOUR_USERNAME/vbip-backup-monitor.git
git push -u origin main
```

**Option B: SSH Key**
```bash
# SSH 키 생성 (아직 없는 경우)
ssh-keygen -t ed25519 -C "your_email@example.com"

# 공개 키 복사
cat ~/.ssh/id_ed25519.pub

# GitHub → Settings → SSH and GPG keys → New SSH key 에 추가

# Remote URL 변경
git remote set-url origin git@github.com:YOUR_USERNAME/vbip-backup-monitor.git
git push -u origin main
```

---

### Part B: AWS에서 Clone 및 배포

#### 1. SSH 접속

```bash
ssh ubuntu@43.203.181.195
```

#### 2. Git 설치 확인

```bash
git --version

# 설치되지 않았다면
sudo apt-get update
sudo apt-get install -y git
```

#### 3. GitHub Clone

**Public Repository:**
```bash
cd /home/ubuntu
git clone https://github.com/YOUR_USERNAME/vbip-backup-monitor.git
mv vbip-backup-monitor vbip
cd vbip
```

**Private Repository:**
```bash
# Personal Access Token 필요
cd /home/ubuntu
git clone https://YOUR_TOKEN@github.com/YOUR_USERNAME/vbip-backup-monitor.git
mv vbip-backup-monitor vbip
cd vbip
```

#### 4. Docker 실행

```bash
# Docker Compose 실행
docker-compose up -d

# 컨테이너 상태 확인
docker ps
```

#### 5. 데이터베이스 초기화

```bash
# 스키마 생성
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/schema.sql

# 더미 데이터 삽입
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/insert_dummy_data.sql

# 백업 작업 히스토리 삽입
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/insert_backup_jobs.sql
```

#### 6. 시스템 테스트

```bash
./test_system.sh
```

#### 7. 방화벽 포트 개방

**AWS Lightsail 콘솔:**
1. 인스턴스 선택
2. 네트워킹 탭
3. IPv4 방화벽 → 규칙 추가

| 애플리케이션 | 프로토콜 | 포트 | 소스 |
|------------|---------|-----|------|
| 대시보드 | TCP | 5000 | 0.0.0.0/0 |
| API | TCP | 5001 | 0.0.0.0/0 |
| n8n | TCP | 5678 | My IP |

#### 8. 접속 확인

```bash
# 헬스 체크
curl http://localhost:5000/health

# 브라우저에서 접속
# http://43.203.181.195:5000
```

---

## 🔄 업데이트 Workflow

### 로컬에서 수정 후 GitHub 푸시

```bash
cd ~/Downloads/vbip

# 파일 수정 후
git add .
git commit -m "Update: 실제 고객사 데이터 추가"
git push origin main
```

### AWS에서 최신 버전 받기

```bash
ssh ubuntu@43.203.181.195
cd /home/ubuntu/vbip

# 최신 버전 받기
git pull origin main

# Docker 재시작 (필요 시)
docker-compose restart

# 데이터베이스 변경 사항 적용 (필요 시)
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /path/to/migration.sql
```

---

## 🔐 보안 권장 사항

### 1. Private Repository 사용
```
GitHub에서 Repository를 Private으로 설정하여
민감한 정보(비밀번호, 설정 등) 보호
```

### 2. .env 파일 사용
```bash
# vbip/.env 파일 생성 (GitHub에 업로드 안 됨)
DB_PASSWORD=vbip_password_2026
N8N_BASIC_AUTH_PASSWORD=vbip_admin_2026

# docker-compose.yml에서 참조
environment:
  - DB_PASSWORD=${DB_PASSWORD}
```

### 3. GitHub Secrets (CI/CD 사용 시)
```
GitHub → Repository → Settings → Secrets and variables → Actions
- DB_PASSWORD
- AWS_SSH_KEY
- 등등
```

---

## 📝 자동 배포 스크립트 (AWS에서 직접 생성)

AWS 서버에서 다음 스크립트를 생성하여 사용:

```bash
# AWS 서버에서 실행
cat > /home/ubuntu/deploy_vbip.sh << 'SCRIPT'
#!/bin/bash
cd /home/ubuntu/vbip
git pull origin main
docker-compose down
docker-compose up -d
echo "✅ 배포 완료!"
SCRIPT

chmod +x /home/ubuntu/deploy_vbip.sh

# 실행
~/deploy_vbip.sh
```

---

## 🎯 체크리스트

### GitHub 업로드
- [ ] 압축 파일 다운로드
- [ ] 압축 해제
- [ ] Git 초기화
- [ ] .gitignore 생성
- [ ] 커밋
- [ ] GitHub Repository 생성
- [ ] Push 완료

### AWS 배포
- [ ] SSH 접속
- [ ] Git Clone
- [ ] Docker Compose 실행
- [ ] 데이터베이스 초기화
- [ ] 방화벽 포트 개방
- [ ] 브라우저 접속 확인

### 검증
- [ ] 대시보드 정상 접속
- [ ] 더미 데이터 표시
- [ ] API 응답 확인
- [ ] 테스트 스크립트 통과

---

## 🆘 트러블슈팅

### 문제 1: Git Push 실패 (Authentication failed)

**해결:**
```bash
# Personal Access Token 사용
git remote set-url origin https://YOUR_TOKEN@github.com/YOUR_USERNAME/vbip-backup-monitor.git
git push origin main
```

### 문제 2: AWS Clone 실패 (Repository not found)

**원인:** Private repository이고 인증 정보가 없음

**해결:**
```bash
# Token 사용
git clone https://YOUR_TOKEN@github.com/YOUR_USERNAME/vbip-backup-monitor.git
```

### 문제 3: Docker 실행 실패

**해결:**
```bash
# Docker 서비스 확인
sudo systemctl status docker

# 재시작
sudo systemctl restart docker

# 사용자 권한 추가
sudo usermod -aG docker ubuntu
# 로그아웃 후 재로그인
```

### 문제 4: 포트 충돌

**해결:**
```bash
# 사용 중인 포트 확인
sudo lsof -i :5000
sudo lsof -i :5001

# 프로세스 종료
sudo kill -9 <PID>

# 또는 docker-compose.yml에서 포트 변경
ports:
  - "5000:5000"  # → "5010:5000"
```

---

## 📞 도움말

### 유용한 명령어

```bash
# Git 상태 확인
git status

# 변경 사항 확인
git diff

# 커밋 히스토리
git log --oneline

# Docker 로그
docker-compose logs
docker-compose logs -f  # 실시간

# Docker 재시작
docker-compose restart

# Docker 완전 재시작
docker-compose down && docker-compose up -d
```

### 문의

- **기술 지원:** Genspark AI
- **고객사:** (주)디에스티인터내셔널

---

## 🎉 완료!

이제 GitHub를 통해 프로젝트를 관리하고 AWS에 배포할 수 있습니다!

**다음 단계:**
1. 실제 고객사 데이터 수집
2. 로그 파서 테스트
3. Phase 2 개발 계획

---

**Repository URL:** `https://github.com/YOUR_USERNAME/vbip-backup-monitor`  
**AWS Dashboard:** `http://43.203.181.195:5000`  
**Version:** 1.0.0 MVP  
**Date:** 2026-02-15
