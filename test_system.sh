#!/bin/bash

echo "======================================"
echo "V-BIP 시스템 테스트 스크립트"
echo "======================================"
echo ""

# 색상 정의
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 테스트 카운터
PASSED=0
FAILED=0

# 테스트 함수
test_endpoint() {
    local name=$1
    local url=$2
    local expected_code=${3:-200}
    
    echo -n "Testing $name... "
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    
    if [ "$response" -eq "$expected_code" ]; then
        echo -e "${GREEN}✓ PASSED${NC} (HTTP $response)"
        ((PASSED++))
        return 0
    else
        echo -e "${RED}✗ FAILED${NC} (HTTP $response, expected $expected_code)"
        ((FAILED++))
        return 1
    fi
}

echo "1️⃣ Docker 컨테이너 상태 확인"
echo "-----------------------------------"
docker ps --format "table {{.Names}}\t{{.Status}}" | grep vbip
echo ""

echo "2️⃣ 데이터베이스 연결 테스트"
echo "-----------------------------------"
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -c "SELECT COUNT(*) as customer_count FROM customers;" 2>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ PostgreSQL 연결 성공${NC}"
    ((PASSED++))
else
    echo -e "${RED}✗ PostgreSQL 연결 실패${NC}"
    ((FAILED++))
fi
echo ""

echo "3️⃣ API 엔드포인트 테스트"
echo "-----------------------------------"
test_endpoint "Health Check" "http://localhost:5000/health"
test_endpoint "Dashboard Summary" "http://localhost:5000/api/dashboard/summary"
test_endpoint "Customer List" "http://localhost:5000/api/customers"
test_endpoint "Statistics" "http://localhost:5000/api/statistics"
echo ""

echo "4️⃣ 데이터베이스 내용 확인"
echo "-----------------------------------"

echo "고객사 수:"
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -c "
    SELECT 
        status, 
        COUNT(*) as count 
    FROM customers 
    GROUP BY status;
" 2>/dev/null

echo ""
echo "백업 작업 통계 (최근 30일):"
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -c "
    SELECT 
        status, 
        COUNT(*) as count,
        ROUND(COUNT(*)::DECIMAL / (SELECT COUNT(*) FROM backup_jobs WHERE start_time >= NOW() - INTERVAL '30 days') * 100, 1) as percentage
    FROM backup_jobs 
    WHERE start_time >= NOW() - INTERVAL '30 days'
    GROUP BY status
    ORDER BY count DESC;
" 2>/dev/null

echo ""
echo "에러 분포 (상위 5개):"
docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -c "
    SELECT 
        error_code, 
        COUNT(*) as occurrence_count
    FROM backup_jobs 
    WHERE status = 'Failed' 
      AND start_time >= NOW() - INTERVAL '30 days'
    GROUP BY error_code 
    ORDER BY occurrence_count DESC 
    LIMIT 5;
" 2>/dev/null

echo ""
echo "5️⃣ 로그 파서 테스트"
echo "-----------------------------------"
echo "샘플 로그 파일 파싱 중..."
docker exec vbip-api python3 /app/scripts/veritas_log_parser.py \
    --file /app/sample_logs/SAMSUNG_backup_20260215.log \
    --customer SAMSUNG \
    --uploader test_system \
    --db-host postgres \
    --db-name veritas_monitor \
    --db-user vbip_user \
    --db-password vbip_password_2026 2>&1 | grep -E "(✓|✗|파싱|저장)"

if [ ${PIPESTATUS[0]} -eq 0 ]; then
    echo -e "${GREEN}✓ 로그 파서 테스트 성공${NC}"
    ((PASSED++))
else
    echo -e "${RED}✗ 로그 파서 테스트 실패${NC}"
    ((FAILED++))
fi

echo ""
echo "======================================"
echo "테스트 결과 요약"
echo "======================================"
echo -e "${GREEN}통과: $PASSED${NC}"
echo -e "${RED}실패: $FAILED${NC}"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}✅ 모든 테스트 통과!${NC}"
    echo ""
    echo "🎉 V-BIP 시스템이 정상적으로 작동하고 있습니다."
    echo ""
    echo "📊 대시보드 접속: http://localhost:5000"
    echo "🔧 API 문서: http://localhost:5001/docs (Phase 2)"
    echo "⚙️  n8n 워크플로우: http://localhost:5678 (admin / vbip_admin_2026)"
    echo ""
    exit 0
else
    echo -e "${RED}❌ 일부 테스트가 실패했습니다.${NC}"
    echo ""
    echo "문제 해결 방법:"
    echo "1. Docker 컨테이너 재시작: docker-compose restart"
    echo "2. 로그 확인: docker-compose logs"
    echo "3. 데이터베이스 재초기화: ./scripts/reset_database.sh"
    echo ""
    exit 1
fi
