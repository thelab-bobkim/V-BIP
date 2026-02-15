#!/bin/bash

echo "======================================"
echo "V-BIP AWS 자동 배포 스크립트"
echo "======================================"
echo ""

# 색상 정의
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# GitHub 정보 입력
read -p "GitHub 사용자명 입력: " GITHUB_USERNAME
REPO_NAME="vbip-backup-monitor"

if [ -z "$GITHUB_USERNAME" ]; then
    echo -e "${RED}✗ 사용자명을 입력해주세요${NC}"
    exit 1
fi

REPO_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

echo ""
echo "Repository: $REPO_URL"
echo ""

# 1. Git 설치 확인
echo "1️⃣ Git 설치 확인..."
if ! command -v git &> /dev/null; then
    echo "Git이 설치되어 있지 않습니다. 설치 중..."
    sudo apt-get update
    sudo apt-get install -y git
    echo -e "${GREEN}✓ Git 설치 완료${NC}"
else
    echo -e "${GREEN}✓ Git 이미 설치됨${NC}"
fi

echo ""
echo "2️⃣ 기존 디렉토리 확인..."
if [ -d "$HOME/vbip" ]; then
    echo -e "${YELLOW}⚠️  기존 vbip 디렉토리가 존재합니다.${NC}"
    read -p "백업 후 삭제하시겠습니까? (y/n): " backup_confirm
    
    if [ "$backup_confirm" == "y" ]; then
        BACKUP_NAME="vbip-backup-$(date +%Y%m%d_%H%M%S)"
        mv "$HOME/vbip" "$HOME/$BACKUP_NAME"
        echo -e "${GREEN}✓ 백업 완료: $HOME/$BACKUP_NAME${NC}"
    else
        echo "기존 디렉토리를 유지합니다."
        exit 0
    fi
fi

echo ""
echo "3️⃣ GitHub에서 Clone..."
cd $HOME

# Private repository인 경우
echo ""
echo "Repository가 Private인가요? (y/n)"
read -p "> " is_private

if [ "$is_private" == "y" ]; then
    echo ""
    echo "Personal Access Token이 필요합니다."
    echo "생성 방법: GitHub → Settings → Developer settings → Personal access tokens → Generate new token"
    echo ""
    read -sp "Personal Access Token 입력: " GITHUB_TOKEN
    echo ""
    REPO_URL="https://$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/$REPO_NAME.git"
fi

git clone "$REPO_URL" vbip

if [ $? -ne 0 ]; then
    echo -e "${RED}✗ Clone 실패${NC}"
    echo ""
    echo "가능한 원인:"
    echo "1. Repository가 존재하지 않음"
    echo "2. Private repository인데 Token이 잘못됨"
    echo "3. 네트워크 문제"
    exit 1
fi

echo -e "${GREEN}✓ Clone 완료${NC}"

cd vbip

echo ""
echo "4️⃣ Docker 상태 확인..."
if ! command -v docker &> /dev/null; then
    echo -e "${RED}✗ Docker가 설치되어 있지 않습니다${NC}"
    echo "Docker 설치 후 다시 실행해주세요."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo -e "${RED}✗ Docker Compose가 설치되어 있지 않습니다${NC}"
    echo "Docker Compose 설치 후 다시 실행해주세요."
    exit 1
fi

echo -e "${GREEN}✓ Docker 확인 완료${NC}"

echo ""
echo "5️⃣ 기존 컨테이너 확인..."
if docker ps -a | grep -q "vbip-"; then
    echo -e "${YELLOW}⚠️  기존 V-BIP 컨테이너가 있습니다.${NC}"
    read -p "중지 및 삭제하시겠습니까? (y/n): " remove_confirm
    
    if [ "$remove_confirm" == "y" ]; then
        docker-compose down
        echo -e "${GREEN}✓ 기존 컨테이너 삭제 완료${NC}"
    fi
fi

echo ""
echo "6️⃣ Docker Compose 실행..."
docker-compose up -d

if [ $? -ne 0 ]; then
    echo -e "${RED}✗ Docker Compose 실행 실패${NC}"
    echo ""
    echo "로그 확인:"
    echo "docker-compose logs"
    exit 1
fi

echo -e "${GREEN}✓ Docker Compose 실행 완료${NC}"

echo ""
echo "7️⃣ 컨테이너 상태 확인 (10초 대기)..."
sleep 10
docker ps --format "table {{.Names}}\t{{.Status}}" | grep vbip

echo ""
echo "8️⃣ 데이터베이스 초기화..."

# 스키마 생성
echo "   - 스키마 생성..."
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/schema.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "     ${GREEN}✓ 스키마 생성 완료${NC}"
else
    echo -e "     ${YELLOW}⚠️  스키마 생성 실패 (이미 존재할 수 있음)${NC}"
fi

# 더미 데이터 삽입
echo "   - 더미 데이터 삽입..."
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/insert_dummy_data.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "     ${GREEN}✓ 더미 데이터 삽입 완료${NC}"
else
    echo -e "     ${YELLOW}⚠️  데이터 삽입 실패 (이미 존재할 수 있음)${NC}"
fi

# 백업 작업 히스토리
echo "   - 백업 작업 히스토리 삽입..."
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -f /docker-entrypoint-initdb.d/insert_backup_jobs.sql > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "     ${GREEN}✓ 백업 작업 히스토리 삽입 완료${NC}"
else
    echo -e "     ${YELLOW}⚠️  히스토리 삽입 실패 (이미 존재할 수 있음)${NC}"
fi

echo ""
echo "9️⃣ 시스템 테스트..."
if [ -f "./test_system.sh" ]; then
    chmod +x ./test_system.sh
    ./test_system.sh
else
    echo -e "${YELLOW}⚠️  test_system.sh 파일이 없습니다${NC}"
    
    # 간단한 헬스 체크
    echo "   - 헬스 체크 수행..."
    sleep 5
    response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/health)
    if [ "$response" -eq 200 ]; then
        echo -e "     ${GREEN}✓ 대시보드 정상${NC}"
    else
        echo -e "     ${RED}✗ 대시보드 응답 없음 (HTTP $response)${NC}"
    fi
fi

echo ""
echo "======================================"
echo "✅ 배포 완료!"
echo "======================================"
echo ""
echo "📊 접속 정보:"
echo "   대시보드: http://$(hostname -I | awk '{print $1}'):5000"
echo "   API: http://$(hostname -I | awk '{print $1}'):5001"
echo "   n8n: http://$(hostname -I | awk '{print $1}'):5678"
echo ""
echo "🔐 n8n 로그인:"
echo "   Username: admin"
echo "   Password: vbip_admin_2026"
echo ""
echo "💾 데이터베이스:"
echo "   Host: localhost"
echo "   Port: 5432"
echo "   Database: veritas_monitor"
echo "   User: vbip_user"
echo "   Password: vbip_password_2026"
echo ""
echo "⚠️  방화벽 포트 개방 필요:"
echo "   AWS Lightsail 콘솔에서 다음 포트 개방"
echo "   - 5000 (대시보드)"
echo "   - 5001 (API)"
echo "   - 5678 (n8n)"
echo ""
echo "📝 유용한 명령어:"
echo "   로그 확인: docker-compose logs"
echo "   재시작: docker-compose restart"
echo "   중지: docker-compose stop"
echo "   상태 확인: docker ps"
echo ""
