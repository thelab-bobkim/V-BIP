#!/bin/bash
# V-BIP 2.3 에러코드 초기 로드 스크립트

set -e

echo "======================================"
echo "V-BIP 2.3 에러코드 초기 로드"
echo "======================================"

# 컨테이너 실행 확인
if ! docker ps | grep -q vbip-postgres; then
    echo "❌ PostgreSQL 컨테이너가 실행 중이 아닙니다."
    echo "   먼저 './deploy.sh'를 실행하세요."
    exit 1
fi

echo ""
echo "📥 2,804개 에러코드 로드 중..."

# 에러코드 로드 (Docker 컨테이너 내부에서 실행)
docker exec -i vbip-api python3 load_classified_errors_to_db.py

echo ""
echo "✅ 에러코드 로드 완료!"
echo ""
echo "📊 통계 확인:"
docker exec -i vbip-postgres psql -U vbip_user -d vbip -c "
SELECT 
    resolution_level,
    COUNT(*) as count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) as percentage
FROM error_patterns
GROUP BY resolution_level
ORDER BY resolution_level;
"

echo ""
echo "🔍 자동 수정 가능한 에러코드 TOP 10:"
docker exec -i vbip-postgres psql -U vbip_user -d vbip -c "
SELECT 
    error_code,
    error_name,
    ai_confidence_score
FROM error_patterns
WHERE resolution_level = 1 AND auto_fix_enabled = TRUE
ORDER BY ai_confidence_score DESC
LIMIT 10;
"
