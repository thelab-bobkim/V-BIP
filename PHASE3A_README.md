# V-BIP Phase 3-A: Email Automation System
## 이메일 자동 파싱 및 실시간 알림 시스템

### 🎯 목표
Veritas NetBackup 장애 메일을 자동으로 수신, 파싱, 저장하고 Slack으로 즉시 알림

### ✨ 주요 기능

#### 1. 📧 이메일 자동 모니터링
- IMAP 프로토콜로 Gmail/Outlook 연동
- 5분 간격 자동 체크
- Veritas 키워드 기반 필터링
- Excel 첨부파일 자동 다운로드

#### 2. 📊 Excel 자동 파싱
- 다양한 형식 지원 (.xlsx, .xls, .csv)
- 유연한 컬럼 매핑
- 데이터 검증 및 정제
- 상태 값 자동 표준화

#### 3. 💾 데이터베이스 관리
- PostgreSQL 자동 저장
- 중복 체크 및 방지
- 고객사 자동 등록
- 트랜잭션 안전성 보장

#### 4. 🔔 실시간 알림
- Slack Webhook 연동
- 장애/경고 즉시 알림
- 이메일 처리 완료 알림
- 일일/주간 요약 리포트

---

### 📦 프로젝트 구조

```
email_automation/
├── config.py                    # 설정 관리
├── email_monitor.py             # 이메일 모니터링
├── excel_parser.py              # Excel 파싱
├── db_manager.py                # 데이터베이스 관리
├── notifier.py                  # Slack/카카오톡 알림
├── main.py                      # 메인 서비스
├── .env.example                 # 환경 변수 템플릿
├── vbip-email-automation.service  # systemd 서비스 파일
└── PHASE3A_DEPLOYMENT_GUIDE.md  # 배포 가이드
```

---

### 🚀 빠른 시작

#### 1. 패키지 설치
```bash
pip3 install -r requirements_phase3a.txt
```

#### 2. 환경 설정
```bash
cd email_automation
cp .env.example .env
nano .env  # 실제 값으로 수정
```

필수 설정:
- `VERITAS_EMAIL`: 이메일 주소
- `VERITAS_EMAIL_PASSWORD`: Gmail 앱 비밀번호
- `SLACK_WEBHOOK_URL`: Slack Webhook URL
- `DB_PASSWORD`: 데이터베이스 비밀번호

#### 3. 테스트
```bash
# 설정 확인
python3 config.py

# 이메일 연결 테스트
python3 email_monitor.py

# Slack 알림 테스트
python3 notifier.py
```

#### 4. 서비스 시작
```bash
# 일회성 실행 (테스트용)
python3 main.py

# systemd 서비스 등록 (운영용)
sudo cp vbip-email-automation.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable vbip-email-automation.service
sudo systemctl start vbip-email-automation.service

# 로그 확인
sudo journalctl -u vbip-email-automation.service -f
```

---

### 📊 모니터링

#### 서비스 상태
```bash
sudo systemctl status vbip-email-automation.service
```

#### 로그 확인
```bash
# 실시간 로그
sudo journalctl -u vbip-email-automation.service -f

# 최근 100줄
sudo journalctl -u vbip-email-automation.service -n 100

# 에러만 필터
sudo journalctl -u vbip-email-automation.service | grep ERROR
```

#### 통계
```bash
# 처리된 이메일 수
sudo journalctl -u vbip-email-automation.service | grep "이메일 발견" | wc -l

# 장애 알림 수
sudo journalctl -u vbip-email-automation.service | grep "백업 장애" | wc -l
```

---

### 🔧 설정 옵션

#### 이메일 체크 간격 변경
```bash
# .env 파일에서
EMAIL_CHECK_INTERVAL=10  # 10분으로 변경
```

#### Slack 알림 비활성화
```bash
# .env 파일에서
SLACK_ENABLED=false
```

#### 로그 레벨 변경
```bash
# .env 파일에서
LOG_LEVEL=DEBUG  # DEBUG, INFO, WARNING, ERROR, CRITICAL
```

---

### 💡 작동 원리

```
1. 메일 모니터링 (5분마다)
   └─> Gmail IMAP 연결
   └─> "장애", "failure" 키워드 검색
   └─> 첨부파일 다운로드

2. Excel 파싱
   └─> pandas로 파일 읽기
   └─> 컬럼 자동 매핑
   └─> 데이터 검증 및 정제

3. DB 저장
   └─> 고객사 ID 조회/생성
   └─> 중복 체크
   └─> 배치 삽입

4. Slack 알림
   └─> 실패 건 → 빨간색 알림
   └─> 경고 건 → 노란색 알림
   └─> 처리 완료 → 요약 알림
```

---

### 🎯 ROI 분석

#### 기존 방식 (수동)
- 이메일 확인: 1회/일 × 5분 = 5분
- Excel 다운로드/열기: 2분
- 데이터 입력: 10분
- Dashboard 확인: 3분
- **총 소요 시간: 20분/일**

#### 자동화 후
- 이메일 확인: 자동 (5분 간격)
- Excel 파싱: 자동 (초 단위)
- 데이터 입력: 자동
- Slack 즉시 알림: 자동
- **총 소요 시간: 0분/일**

**효과**:
- 월 400분 (약 6.7시간) 절약
- 장애 인지 시간: 24시간 → 5분 (99.7% 단축)
- 인적 오류 방지: 100%

---

### 🔗 관련 문서

- [Phase 3-A 배포 가이드](PHASE3A_DEPLOYMENT_GUIDE.md)
- [Dashboard v2 가이드](DASHBOARD_V2_DEPLOYMENT_GUIDE.md)
- [전체 시스템 구조](DEPLOYMENT_SUMMARY.md)

---

### 📞 문제 해결

**이메일 연결 실패**:
- Gmail 2단계 인증 활성화 확인
- 앱 비밀번호 재생성
- IMAP 활성화 확인

**Slack 알림 실패**:
- Webhook URL 재확인
- 채널에 App 추가 확인
- 수동 테스트: `python3 notifier.py`

**DB 연결 실패**:
- PostgreSQL 실행 확인
- 환경 변수 확인
- Docker 네트워크 확인

---

**버전**: 1.0  
**최종 업데이트**: 2026-02-16  
**개발자**: Genspark AI Assistant
