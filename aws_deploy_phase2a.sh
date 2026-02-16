#!/bin/bash
# V-BIP Phase 2-A AWS Lightsail 자동 배포 스크립트
# 실행: bash aws_deploy_phase2a.sh

set -e  # 에러 발생 시 중단

echo "========================================="
echo " V-BIP Phase 2-A 자동 배포 시작"
echo "========================================="
echo ""

# 색상 정의
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 현재 디렉토리 확인
if [ ! -f "PHASE2A_DEPLOYMENT_GUIDE.md" ]; then
    echo -e "${RED}오류: PHASE2A_DEPLOYMENT_GUIDE.md 파일이 없습니다.${NC}"
    echo "vbip-phase2a-deploy.tar.gz 압축을 먼저 해제하세요."
    exit 1
fi

echo -e "${GREEN}✓ 배포 파일 확인 완료${NC}"
echo ""

# 1단계: DB 백업
echo "========================================="
echo " 1단계: 기존 DB 백업"
echo "========================================="

BACKUP_FILE="/home/ubuntu/V-BIP/backup_before_phase2a_$(date +%Y%m%d_%H%M%S).sql"
echo "백업 파일: $BACKUP_FILE"

docker exec vbip-postgres pg_dump -U vbip_user veritas_monitor > "$BACKUP_FILE"

if [ -f "$BACKUP_FILE" ]; then
    echo -e "${GREEN}✓ DB 백업 완료: $(ls -lh $BACKUP_FILE | awk '{print $5}')${NC}"
else
    echo -e "${RED}오류: DB 백업 실패${NC}"
    exit 1
fi

echo ""

# 2단계: 김인석 부장 및 16개 고객사 등록
echo "========================================="
echo " 2단계: 김인석 부장 & 고객사 등록"
echo "========================================="

if [ -f "database/insert_kimins eok_data.sql" ]; then
    echo "SQL 파일 실행 중..."
    docker exec -i vbip-postgres psql -U vbip_user -d veritas_monitor < "database/insert_kimins eok_data.sql"
    
    echo ""
    echo "등록 확인:"
    docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -c "
    SELECT 
        '엔지니어' as category, 
        name, 
        max_concurrent_customers as count
    FROM engineers 
    WHERE name = '김인석'
    UNION ALL
    SELECT 
        '고객사' as category,
        '총' as name,
        COUNT(*)::integer as count
    FROM customers 
    WHERE primary_engineer = '김인석';
    "
    
    echo -e "${GREEN}✓ 김인석 부장 및 16개 고객사 등록 완료${NC}"
else
    echo -e "${RED}오류: insert_kimins eok_data.sql 파일이 없습니다.${NC}"
    exit 1
fi

echo ""

# 3단계: 290건 장애 이력 등록
echo "========================================="
echo " 3단계: 290건 장애 이력 등록"
echo "========================================="

if [ -f "database/insert_backup_jobs_real.sql" ]; then
    echo "장애 이력 SQL 실행 중... (시간이 걸릴 수 있습니다)"
    docker exec -i vbip-postgres psql -U vbip_user -d veritas_monitor < "database/insert_backup_jobs_real.sql"
    
    echo ""
    echo "등록 확인:"
    docker exec vbip-postgres psql -U vbip_user -d veritas_monitor -c "
    SELECT 
        c.company_name,
        COUNT(*) as failure_count
    FROM backup_jobs bj
    JOIN customers c ON bj.customer_id = c.customer_id
    WHERE c.primary_engineer = '김인석'
    AND bj.status = 'Failed'
    GROUP BY c.company_name
    ORDER BY failure_count DESC
    LIMIT 5;
    "
    
    echo -e "${GREEN}✓ 장애 이력 등록 완료${NC}"
else
    echo -e "${RED}오류: insert_backup_jobs_real.sql 파일이 없습니다.${NC}"
    exit 1
fi

echo ""

# 4단계: Dashboard 업데이트
echo "========================================="
echo " 4단계: Dashboard 업데이트"
echo "========================================="

if [ -f "dashboard/app_v2.py" ]; then
    echo "기존 app.py 백업..."
    cp dashboard/app.py dashboard/app_backup_$(date +%Y%m%d_%H%M%S).py
    
    echo "app_v2.py를 app.py로 교체..."
    cp dashboard/app_v2.py dashboard/app.py
    
    echo "Docker 이미지 재빌드..."
    docker-compose build dashboard
    
    echo "Dashboard 재시작..."
    docker-compose up -d dashboard
    
    sleep 5
    
    echo -e "${GREEN}✓ Dashboard 업데이트 완료${NC}"
else
    echo -e "${RED}오류: dashboard/app_v2.py 파일이 없습니다.${NC}"
    exit 1
fi

echo ""

# 5단계: 기능 테스트
echo "========================================="
echo " 5단계: 기능 테스트"
echo "========================================="

echo "Dashboard 로그 확인:"
docker logs vbip-dashboard --tail 10

echo ""
echo "API 테스트:"

# 엔지니어 목록
echo -e "${YELLOW}1. 엔지니어 목록 API${NC}"
curl -s http://localhost:5002/api/engineers | python3 -m json.tool | head -20

echo ""

# 김인석 부장 고객사
echo -e "${YELLOW}2. 김인석 부장 고객사 (16개)${NC}"
CUSTOMER_COUNT=$(curl -s "http://localhost:5002/api/customers?engineer=김인석" | python3 -c "import sys, json; print(len(json.load(sys.stdin)['customers']))")
echo "고객사 수: $CUSTOMER_COUNT"

if [ "$CUSTOMER_COUNT" -eq "16" ]; then
    echo -e "${GREEN}✓ 고객사 16개 확인${NC}"
else
    echo -e "${YELLOW}⚠ 예상과 다른 고객사 수: $CUSTOMER_COUNT${NC}"
fi

echo ""

# 통계
echo -e "${YELLOW}3. 김인석 부장 통계${NC}"
curl -s "http://localhost:5002/api/statistics?engineer=김인석" | python3 -m json.tool

echo ""

# 6단계: 완료 요약
echo "========================================="
echo " 배포 완료!"
echo "========================================="
echo ""
echo -e "${GREEN}✓ 모든 단계 완료${NC}"
echo ""
echo "배포 요약:"
echo "  - 김인석 부장: 등록 완료"
echo "  - 고객사: 16개"
echo "  - 장애 이력: 290건"
echo "  - Dashboard: 업데이트 완료"
echo ""
echo "웹 접속:"
echo "  http://43.203.181.195:5002"
echo ""
echo "백업 파일:"
echo "  $BACKUP_FILE"
echo ""
echo -e "${YELLOW}다음 단계:${NC}"
echo "  1. 웹 브라우저에서 Dashboard 접속"
echo "  2. 엔지니어 필터에서 '김인석' 선택"
echo "  3. 16개 고객사 및 290건 장애 확인"
echo ""
echo "문제 발생 시:"
echo "  - 로그 확인: docker logs vbip-dashboard"
echo "  - 롤백: 가이드 문서 참조 (PHASE2A_DEPLOYMENT_GUIDE.md)"
echo ""
echo "========================================="
