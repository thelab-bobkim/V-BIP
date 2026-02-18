#!/bin/bash
# V-BIP 2.3 배포 스크립트

set -e

echo "======================================"
echo "V-BIP 2.3 Docker 배포 스크립트"
echo "======================================"

# 환경 변수 확인
if [ ! -f .env ]; then
    echo "⚠️  .env 파일이 없습니다. .env.example을 복사하세요."
    cp .env.example .env
    echo "✅ .env 파일을 생성했습니다. 설정을 확인하세요."
    exit 1
fi

# Docker 설치 확인
if ! command -v docker &> /dev/null; then
    echo "❌ Docker가 설치되어 있지 않습니다."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose가 설치되어 있지 않습니다."
    exit 1
fi

echo "✅ Docker 및 Docker Compose 확인 완료"

# 기존 컨테이너 중지 및 제거
echo ""
echo "📦 기존 컨테이너 중지 및 제거 중..."
docker-compose down

# Docker 이미지 빌드
echo ""
echo "🔨 Docker 이미지 빌드 중..."
docker-compose build

# Docker 컨테이너 시작
echo ""
echo "🚀 Docker 컨테이너 시작 중..."
docker-compose up -d

# 컨테이너 상태 확인
echo ""
echo "⏳ 컨테이너 시작 대기 중 (30초)..."
sleep 30

# Health check
echo ""
echo "🔍 Health Check 수행 중..."
if curl -f http://localhost:5000/api/health; then
    echo ""
    echo "✅ API 서버 정상 작동"
else
    echo ""
    echo "❌ API 서버 Health Check 실패"
    echo "📋 로그 확인:"
    docker-compose logs api
    exit 1
fi

# 서비스 URL 출력
echo ""
echo "======================================"
echo "✅ V-BIP 2.3 배포 완료!"
echo "======================================"
echo ""
echo "📌 서비스 URL:"
echo "   - 대시보드: http://localhost"
echo "   - API 서버: http://localhost/api"
echo "   - Health Check: http://localhost:5000/api/health"
echo ""
echo "📋 관리 명령어:"
echo "   - 로그 확인: docker-compose logs -f"
echo "   - 컨테이너 중지: docker-compose down"
echo "   - 컨테이너 재시작: docker-compose restart"
echo "   - DB 접속: docker exec -it vbip-postgres psql -U vbip_user -d vbip"
echo ""
