# V-BIP Phase 3-A 배포 가이드
## 이메일 자동 파싱 시스템

**배포 날짜**: 2026-02-16  
**버전**: Phase 3-A  
**개발자**: Genspark AI Assistant

---

## 📦 시스템 개요

### 주요 기능
1. **📧 이메일 자동 모니터링**
   - IMAP 프로토콜로 Veritas 장애 메일 자동 수신
   - 5분 간격 자동 체크
   - Excel 첨부파일 자동 다운로드

2. **📊 Excel 자동 파싱**
   - 다양한 Excel 형식 지원 (.xlsx, .xls, .csv)
   - 컬럼 자동 매핑
   - 데이터 검증 및 정제

3. **💾 데이터베이스 자동 저장**
   - PostgreSQL 자동 저장
   - 중복 체크
   - 고객사 자동 등록

4. **🔔 실시간 알림**
   - Slack 즉시 알림
   - 장애/경고 자동 구분
   - 일일/주간 요약 리포트

---

## 🚀 AWS 서버 배포 단계

### 1단계: 사전 준비

#### 1-1. 서버 스펙 확인
```bash
# 최소 요구사항
# - CPU: 2코어
# - 메모리: 4GB
# - 디스크: 여유 공간 10GB 이상

free -h
df -h
```

#### 1-2. Python 패키지 설치
```bash
cd /home/ubuntu/V-BIP
pip3 install -r requirements_phase3a.txt
```

---

### 2단계: 이메일 설정

#### 2-1. Gmail 앱 비밀번호 생성

**중요**: Gmail 2단계 인증 활성화 필요!

1. https://myaccount.google.com/apppasswords 접속
2. 앱 이름: "V-BIP Email Automation" 입력
3. 생성된 16자리 비밀번호 복사

#### 2-2. 환경 변수 설정
```bash
cd /home/ubuntu/V-BIP/email_automation

# 환경 변수 파일 생성
cp .env.example .env

# 실제 값으로 수정
nano .env
```

**필수 설정 항목**:
```bash
VERITAS_EMAIL=your-email@gmail.com
VERITAS_EMAIL_PASSWORD=abcd-efgh-ijkl-mnop  # 앱 비밀번호

SLACK_WEBHOOK_URL=https://hooks.slack.com/services/YOUR/WEBHOOK/URL

DB_HOST=postgres  # Docker 사용 시
DB_PASSWORD=vbip_password_2026
```

---

### 3단계: Slack Webhook 설정

#### 3-1. Slack Webhook URL 생성
1. https://api.slack.com/messaging/webhooks 접속
2. "Create New App" → "From scratch"
3. App Name: "V-BIP Alert Bot"
4. Workspace 선택
5. "Incoming Webhooks" 활성화
6. "Add New Webhook to Workspace" 클릭
7. 채널 선택 (예: #vbip-alerts)
8. Webhook URL 복사

#### 3-2. 테스트
```bash
curl -X POST \
  -H 'Content-Type: application/json' \
  -d '{"text":"🎉 V-BIP 알림 테스트!"}' \
  YOUR_WEBHOOK_URL
```

---

### 4단계: 서비스 설치 및 시작

#### 4-1. systemd 서비스 등록
```bash
# 서비스 파일 복사
sudo cp /home/ubuntu/V-BIP/email_automation/vbip-email-automation.service \
        /etc/systemd/system/

# 서비스 활성화
sudo systemctl daemon-reload
sudo systemctl enable vbip-email-automation.service
```

#### 4-2. 서비스 시작
```bash
sudo systemctl start vbip-email-automation.service

# 상태 확인
sudo systemctl status vbip-email-automation.service
```

#### 4-3. 로그 확인
```bash
# 실시간 로그
sudo journalctl -u vbip-email-automation.service -f

# 최근 100줄
sudo journalctl -u vbip-email-automation.service -n 100

# 로그 파일
tail -f /var/log/vbip/email_automation.log
```

---

## 🧪 테스트

### 1. 개별 모듈 테스트

```bash
cd /home/ubuntu/V-BIP/email_automation

# 1. 설정 확인
python3 config.py

# 2. 이메일 연결 테스트
python3 email_monitor.py

# 3. Excel 파싱 테스트
python3 excel_parser.py

# 4. DB 연결 테스트
python3 db_manager.py

# 5. Slack 알림 테스트
python3 notifier.py
```

### 2. 전체 시스템 테스트

**테스트 이메일 발송**:
1. Gmail에서 Veritas 장애 리포트 Excel 파일을 첨부하여 자신에게 전송
2. 제목에 "장애" 또는 "failure" 포함
3. 5분 대기
4. Slack 채널에서 알림 확인
5. Dashboard에서 데이터 확인

---

## 📊 모니터링

### 서비스 상태
```bash
# 서비스 실행 상태
sudo systemctl status vbip-email-automation.service

# CPU/메모리 사용량
ps aux | grep python3 | grep main.py

# 실행 시간
sudo systemctl show vbip-email-automation.service | grep ExecMainStartTimestamp
```

### 로그 분석
```bash
# 처리된 이메일 수
sudo journalctl -u vbip-email-automation.service | grep "이메일 발견" | wc -l

# 에러 발생 확인
sudo journalctl -u vbip-email-automation.service | grep "ERROR"

# 최근 장애 알림
sudo journalctl -u vbip-email-automation.service | grep "백업 장애"
```

---

## 🔧 문제 해결

### 문제 1: 이메일 연결 실패
```
❌ IMAP 연결 실패: [AUTHENTICATIONFAILED] Invalid credentials
```

**해결 방법**:
1. Gmail 앱 비밀번호가 올바른지 확인
2. 2단계 인증이 활성화되어 있는지 확인
3. IMAP이 활성화되어 있는지 확인 (Gmail 설정 → 전달 및 POP/IMAP)

### 문제 2: Slack 알림 실패
```
❌ Slack 알림 전송 실패: 404
```

**해결 방법**:
1. Webhook URL이 올바른지 확인
2. Slack App이 채널에 추가되어 있는지 확인
3. 수동 테스트: `python3 notifier.py`

### 문제 3: 데이터베이스 연결 실패
```
❌ DB 연결 실패: could not connect to server
```

**해결 방법**:
1. PostgreSQL이 실행 중인지 확인: `docker ps | grep postgres`
2. 환경 변수 확인: `cat /home/ubuntu/V-BIP/email_automation/.env`
3. 네트워크 확인: `ping postgres` (Docker 네트워크 내부에서)

### 문제 4: 서비스 시작 실패
```bash
# 상세 에러 로그 확인
sudo journalctl -xeu vbip-email-automation.service

# 권한 확인
ls -la /home/ubuntu/V-BIP/email_automation/

# Python 경로 확인
which python3
```

---

## 🔄 업데이트

### 코드 업데이트
```bash
cd /home/ubuntu/V-BIP
git pull origin main

# 서비스 재시작
sudo systemctl restart vbip-email-automation.service

# 로그 확인
sudo journalctl -u vbip-email-automation.service -f
```

### 패키지 업데이트
```bash
pip3 install -r requirements_phase3a.txt --upgrade

sudo systemctl restart vbip-email-automation.service
```

---

## 📈 성능 튜닝

### 체크 간격 조정
```bash
# .env 파일 수정
nano /home/ubuntu/V-BIP/email_automation/.env

# 예: 10분으로 변경
EMAIL_CHECK_INTERVAL=10

# 재시작
sudo systemctl restart vbip-email-automation.service
```

### 메모리 제한 조정
```bash
# 서비스 파일 수정
sudo nano /etc/systemd/system/vbip-email-automation.service

# MemoryLimit=512M → 1G 로 변경
MemoryLimit=1G

# 적용
sudo systemctl daemon-reload
sudo systemctl restart vbip-email-automation.service
```

---

## 🎯 다음 단계 (Phase 3-B)

1. **AI 자동 진단**
   - GPT-4 기반 장애 원인 분석
   - 해결 방안 자동 제시
   - 과거 유사 사례 학습

2. **자동 복구 시스템**
   - Ansible 기반 원격 조치
   - 서비스 재시작 자동화
   - 설정 자동 수정

3. **예측 시스템**
   - 시계열 분석으로 장애 예측
   - 3-7일 사전 경고
   - 예방 조치 제안

---

## 📞 지원

문제 발생 시:
1. 로그 확인: `sudo journalctl -u vbip-email-automation.service -n 100`
2. 설정 재확인: `python3 config.py`
3. GitHub Issue 생성: https://github.com/thelab-bobkim/V-BIP/issues

---

**작성일**: 2026-02-16  
**작성자**: Genspark AI Assistant  
**문서 버전**: 1.0
