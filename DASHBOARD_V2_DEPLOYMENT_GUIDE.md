# V-BIP Dashboard v2 배포 가이드

## 📋 개요

Dashboard v2는 다음 기능을 포함합니다:

### ✨ 새로운 기능

1. **기간 필터**
   - 최근 7일/30일/3개월/6개월/1년/전체 기간
   - URL 파라미터: `?days=30`

2. **엔지니어 필터**
   - 전체 엔지니어 또는 특정 엔지니어만 조회
   - URL 파라미터: `?engineer_id=1`

3. **실시간 통계**
   - 고객사 수
   - 성공/실패/경고 백업 건수
   - 최근 7일 성공률 추이 차트

4. **Excel 다운로드**
   - 필터링된 데이터를 Excel로 내보내기
   - 포맷팅 및 스타일 적용

5. **향상된 UI/UX**
   - Chart.js를 활용한 시각화
   - 반응형 디자인
   - 실시간 업데이트 시간 표시

---

## 🚀 배포 방법

### 1. GitHub에서 최신 코드 가져오기

```bash
cd /home/ubuntu/V-BIP
git pull origin main
```

### 2. 새 Python 패키지 설치

```bash
pip install xlsxwriter==3.1.9
```

또는 requirements.txt 사용:

```bash
pip install -r requirements.txt
```

### 3. Dashboard 교체

#### 방법 A: 기존 app.py 백업 후 교체 (권장)

```bash
# 기존 파일 백업
cp dashboard/app.py dashboard/app_v1_backup.py

# v2를 메인으로 사용
cp dashboard/app_v2_complete.py dashboard/app.py
```

#### 방법 B: v2를 별도 포트로 실행

dashboard_v2_complete.py를 그대로 사용:

```bash
python3 dashboard/app_v2_complete.py
```

포트 5002에서 실행됩니다.

### 4. Docker 환경에서 배포

#### docker-compose.yml 수정

```yaml
services:
  dashboard:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "5002:5002"  # v2 포트
    environment:
      - DB_HOST=postgres
      - DB_PORT=5432
      - DB_NAME=veritas_monitor
      - DB_USER=vbip_user
      - DB_PASSWORD=vbip_password_2026
    depends_on:
      - postgres
    volumes:
      - ./dashboard:/app/dashboard
      - ./templates:/app/templates
    command: python3 dashboard/app_v2_complete.py
```

#### 재배포

```bash
cd /home/ubuntu/V-BIP
docker-compose down
docker-compose build dashboard
docker-compose up -d
```

---

## 📊 API 엔드포인트

### 1. 대시보드 요약 정보

**GET** `/api/dashboard/summary`

**쿼리 파라미터:**
- `days` (optional): 조회 기간 (7, 30, 90, 180, 365 등)
- `engineer_id` (optional): 엔지니어 ID

**응답 예시:**

```json
{
  "total_customers": 16,
  "backup_status": {
    "success": 5,
    "failed": 275,
    "warning": 0
  },
  "trend_data": [
    {"date": "02-10", "success_rate": "85.7"},
    {"date": "02-11", "success_rate": "87.3"}
  ],
  "critical_issues": [
    {
      "customer": "서울우유본사",
      "count": 149,
      "last_time": "2026-02-10 14:23"
    }
  ]
}
```

### 2. 고객사 목록

**GET** `/api/customers`

**쿼리 파라미터:**
- `days` (optional): 조회 기간
- `engineer_id` (optional): 엔지니어 ID

**응답 예시:**

```json
[
  {
    "customer_id": 1,
    "customer_code": "SMILK001",
    "customer_name": "서울우유본사",
    "contract_tier": "Platinum",
    "server_count": 45,
    "engineer_name": "김인석",
    "total_jobs": 149,
    "failed_jobs": 145,
    "success_jobs": 4,
    "last_failed_backup": "2026-02-10 14:23"
  }
]
```

### 3. 엔지니어 목록

**GET** `/api/engineers`

**응답 예시:**

```json
[
  {
    "engineer_id": 1,
    "name": "김인석",
    "specialization": "Veritas NetBackup"
  }
]
```

### 4. Excel 내보내기

**GET** `/api/export/excel`

**쿼리 파라미터:**
- `days` (optional): 조회 기간
- `engineer_id` (optional): 엔지니어 ID

**응답:** Excel 파일 다운로드

---

## 🔧 문제 해결

### 1. Chart.js가 로드되지 않음

**증상:** 차트가 표시되지 않고 빈 공간만 보임

**해결:**

```html
<!-- CDN 확인 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
```

인터넷 연결 확인 필요.

### 2. Excel 다운로드 실패

**증상:** "Excel 다운로드에 실패했습니다" 오류

**해결:**

```bash
# xlsxwriter 설치 확인
pip list | grep xlsxwriter

# 없으면 설치
pip install xlsxwriter==3.1.9
```

### 3. 데이터가 표시되지 않음

**증상:** "데이터를 불러오는 중..." 무한 로딩

**해결:**

```bash
# API 응답 확인
curl http://localhost:5002/api/dashboard/summary
curl http://localhost:5002/api/customers

# 로그 확인 (Docker)
docker logs vbip-dashboard --tail 50

# 로그 확인 (직접 실행)
python3 dashboard/app_v2_complete.py
```

### 4. 필터가 작동하지 않음

**증상:** 기간/엔지니어 필터 변경 시 데이터가 업데이트되지 않음

**해결:**

브라우저 콘솔(F12) 확인:

```javascript
// 자바스크립트 오류 확인
console.error()

// 네트워크 요청 확인
Network 탭에서 API 호출 확인
```

---

## 📈 성능 최적화

### 1. 데이터베이스 인덱스

필터링 성능 향상을 위한 인덱스:

```sql
-- start_time 인덱스 (기간 필터용)
CREATE INDEX IF NOT EXISTS idx_backup_jobs_start_time 
ON backup_jobs(start_time DESC);

-- engineer_id 인덱스 (엔지니어 필터용)
CREATE INDEX IF NOT EXISTS idx_customers_primary_engineer 
ON customers(primary_engineer_id);

-- 복합 인덱스
CREATE INDEX IF NOT EXISTS idx_backup_jobs_customer_status_time 
ON backup_jobs(customer_id, status, start_time DESC);
```

### 2. 캐싱 (선택사항)

자주 조회되는 데이터는 Redis 캐싱 고려:

```python
from flask_caching import Cache

cache = Cache(app, config={'CACHE_TYPE': 'redis'})

@app.route('/api/customers')
@cache.cached(timeout=60, query_string=True)
def get_customers():
    # ... 기존 코드
```

---

## 🎯 다음 단계 (Phase 2-B)

Dashboard v2 배포 완료 후:

1. **자동 알림 시스템**
   - 이메일 알림
   - Slack 웹훅

2. **웹 업로드 포털**
   - Excel 파일 드래그&드롭
   - 자동 파싱 및 DB 저장

3. **월간 리포트 생성**
   - PDF 자동 생성
   - 이메일 발송

4. **AI 기반 장애 예측**
   - 머신러닝 모델
   - 위험 고객사 사전 경고

---

## 📞 지원

문제 발생 시:

1. GitHub Issues 생성: https://github.com/thelab-bobkim/V-BIP/issues
2. 로그 파일 첨부
3. 상세한 증상 설명

---

**작성일:** 2026-02-16  
**버전:** v2.0.0  
**작성자:** V-BIP Development Team
