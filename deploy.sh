#!/bin/bash

# V-BIP 2.3 Docker 빌드 및 배포 스크립트
# AWS Lightsail 또는 로컬 환경에서 실행

set -e  # 오류 발생시 스크립트 중단

echo "========================================="
echo "V-BIP 2.3 Docker 배포 시작"
echo "========================================="

# 환경 변수 확인
if [ ! -f .env ]; then
    echo "⚠️  .env 파일이 없습니다. .env.example을 복사하여 생성하세요."
    echo "   cp .env.example .env"
    echo "   편집: nano .env"
    exit 1
fi

# Docker 설치 확인
if ! command -v docker &> /dev/null; then
    echo "❌ Docker가 설치되어 있지 않습니다."
    echo "   설치: curl -fsSL https://get.docker.com | sh"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose가 설치되어 있지 않습니다."
    exit 1
fi

# 이전 컨테이너 중지 및 제거
echo ""
echo "📦 이전 컨테이너 정리 중..."
docker-compose down || true

# Docker 이미지 빌드
echo ""
echo "🔨 Docker 이미지 빌드 중..."
docker-compose build --no-cache

# 컨테이너 실행
echo ""
echo "🚀 컨테이너 실행 중..."
docker-compose up -d

# 컨테이너 상태 확인
echo ""
echo "⏳ 컨테이너 시작 대기 중 (30초)..."
sleep 30

echo ""
echo "📊 컨테이너 상태 확인:"
docker-compose ps

# Health check
echo ""
echo "🏥 Health Check..."
if curl -f http://localhost:5000/api/health > /dev/null 2>&1; then
    echo "✅ API 서버 정상"
else
    echo "❌ API 서버 오류 - 로그를 확인하세요:"
    echo "   docker-compose logs api"
    exit 1
fi

if curl -f http://localhost/health > /dev/null 2>&1; then
    echo "✅ Nginx 정상"
else
    echo "⚠️  Nginx 오류 (선택사항)"
fi

# 데이터베이스 연결 확인
echo ""
echo "🗄️  데이터베이스 연결 확인..."
docker-compose exec -T postgres psql -U vbip_user -d vbip -c "SELECT COUNT(*) FROM error_patterns;" || {
    echo "⚠️  데이터베이스 테이블이 없습니다. 스키마를 확인하세요."
}

echo ""
echo "========================================="
echo "✅ V-BIP 2.3 배포 완료!"
echo "========================================="
echo ""
echo "📍 접속 주소:"
echo "   - API Server: http://localhost:5000"
echo "   - Dashboard: http://localhost"
echo "   - Health Check: http://localhost:5000/api/health"
echo ""
echo "📝 유용한 명령어:"
echo "   - 로그 확인: docker-compose logs -f"
echo "   - 컨테이너 재시작: docker-compose restart"
echo "   - 컨테이너 중지: docker-compose down"
echo "   - 데이터베이스 접속: docker-compose exec postgres psql -U vbip_user -d vbip"
echo ""
