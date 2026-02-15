#!/bin/bash

echo "======================================"
echo "V-BIP GitHub 업로드 스크립트"
echo "======================================"
echo ""

# 색상 정의
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# GitHub 사용자명 입력
read -p "GitHub 사용자명 입력: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo -e "${RED}✗ 사용자명을 입력해주세요${NC}"
    exit 1
fi

REPO_NAME="vbip-backup-monitor"

echo ""
echo "Repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""
read -p "계속하시겠습니까? (y/n): " confirm

if [ "$confirm" != "y" ]; then
    echo "취소되었습니다."
    exit 0
fi

echo ""
echo "1️⃣ Git 초기화..."
git init

echo ""
echo "2️⃣ .gitignore 생성..."
cat > .gitignore << 'GITIGNORE'
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
*.pyo
.Python
venv/
env/

# IDE
.vscode/
.idea/
*.swp
*.swo

# 시스템
.DS_Store
Thumbs.db
*.log
GITIGNORE

echo -e "${GREEN}✓ .gitignore 생성 완료${NC}"

echo ""
echo "3️⃣ 파일 추가..."
git add .
echo -e "${GREEN}✓ 파일 추가 완료${NC}"

echo ""
echo "4️⃣ 첫 커밋..."
git commit -m "Initial commit: V-BIP Phase 1 MVP

- PostgreSQL database schema
- Python Veritas log parser
- Flask dashboard & API
- Docker Compose setup
- Complete documentation
- Test scripts"

echo -e "${GREEN}✓ 커밋 완료${NC}"

echo ""
echo "5️⃣ 원격 저장소 연결..."
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
echo -e "${GREEN}✓ 원격 저장소 연결 완료${NC}"

echo ""
echo "6️⃣ GitHub에 푸시..."
echo ""
echo -e "${YELLOW}⚠️  GitHub에서 먼저 Repository를 생성해주세요:${NC}"
echo "   1. https://github.com/new 접속"
echo "   2. Repository name: $REPO_NAME"
echo "   3. Private 선택 (권장)"
echo "   4. README, .gitignore, license 선택 안 함"
echo "   5. Create repository 클릭"
echo ""
read -p "Repository 생성 완료? (y/n): " repo_created

if [ "$repo_created" != "y" ]; then
    echo ""
    echo "Repository 생성 후 다시 실행해주세요:"
    echo "git push -u origin main"
    exit 0
fi

git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ GitHub 업로드 완료!${NC}"
    echo ""
    echo "Repository URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo ""
    echo "다음 단계:"
    echo "1. AWS에서 Clone:"
    echo "   ssh ubuntu@43.203.181.195"
    echo "   git clone https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
    echo "   cd $REPO_NAME"
    echo "   docker-compose up -d"
    echo ""
else
    echo ""
    echo -e "${RED}✗ 푸시 실패${NC}"
    echo ""
    echo "해결 방법:"
    echo "1. GitHub에 Repository가 생성되어 있는지 확인"
    echo "2. GitHub 로그인 확인"
    echo "3. Personal Access Token 사용:"
    echo "   git remote set-url origin https://YOUR_TOKEN@github.com/$GITHUB_USERNAME/$REPO_NAME.git"
    echo "   git push -u origin main"
    exit 1
fi
