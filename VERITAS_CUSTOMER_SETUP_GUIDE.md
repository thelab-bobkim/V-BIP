# Veritas NetBackup 고객사 이메일 알림 설정 가이드
## V-BIP 자동 모니터링 연동

**대상**: V-BIP 서비스 고객사  
**목적**: Veritas NetBackup 장애를 자동으로 V-BIP 시스템으로 전송  
**소요 시간**: 약 15분

---

## 📋 사전 준비

### 필수 정보
- [ ] Veritas NetBackup Master Server 접속 권한
- [ ] SMTP 서버 정보 (회사 메일 서버 또는 Gmail)
- [ ] V-BIP 모니터링 이메일 주소: **vbip-monitor@thelab.com**

### 권장 사항
- NetBackup 버전: 8.0 이상
- 관리자 권한 계정
- 백업 서버 인터넷 연결 (SMTP 발송용)

---

## 🚀 설정 방법

### **옵션 A: GUI 설정 (권장 - 쉬움)**

#### 1단계: NetBackup Admin Console 접속
```
NetBackup Admin Console 실행
→ Master Server 연결
→ 로그인
```

#### 2단계: Email 설정
```
메뉴: NetBackup Management → Host Properties → Master Server
→ "Global Attributes" 탭
→ "Email Server" 섹션
```

**설정 값**:
| 항목 | 값 | 비고 |
|------|-----|------|
| **Email Server** | smtp.gmail.com | 회사 SMTP 서버 사용 가능 |
| **Port** | 587 | TLS 사용 시 |
| **From Address** | backup@고객사명.com | 고객사 이메일 |
| **Authentication** | ✅ 사용 | Gmail 사용 시 필수 |
| **Username** | backup@고객사명.com | SMTP 인증 계정 |
| **Password** | ••••••••••• | 앱 비밀번호 권장 |

#### 3단계: 장애 알림 설정
```
메뉴: NetBackup Management → Reports → Email Notification
→ "Add New Notification"
```

**설정 값**:
| 항목 | 값 |
|------|-----|
| **Notification Name** | V-BIP 장애 알림 |
| **Trigger** | ✅ Job Failed |
| **Recipients** | vbip-monitor@thelab.com |
| **Format** | Excel (.xlsx) |
| **Include Details** | ✅ Error Code<br>✅ Error Message<br>✅ Job Log<br>✅ Policy Name<br>✅ Client Name |
| **Schedule** | Immediately (즉시) |

#### 4단계: 일일 요약 리포트 설정 (선택)
```
메뉴: NetBackup Management → Reports → Scheduled Reports
→ "Add Schedule"
```

**설정 값**:
| 항목 | 값 |
|------|-----|
| **Report Type** | All Jobs Report |
| **Schedule** | Daily at 09:00 AM |
| **Recipients** | vbip-monitor@thelab.com |
| **Format** | Excel (.xlsx) |
| **Include** | ✅ Failed Jobs<br>✅ Warning Jobs<br>✅ Success Jobs (선택) |

#### 5단계: 테스트
```
1. "Send Test Email" 버튼 클릭
2. vbip-monitor@thelab.com에서 수신 확인
3. Slack #vbip-alerts 채널에서 알림 확인
```

---

### **옵션 B: CLI 설정 (고급 사용자)**

#### 1단계: Master Server SSH 접속
```bash
ssh admin@netbackup-master.company.com
```

#### 2단계: SMTP 설정
```bash
# SMTP 서버 설정
/usr/openv/netbackup/bin/admincmd/bpsetconfig << EOF
EMAIL_SERVER = smtp.gmail.com
EMAIL_PORT = 587
EMAIL_FROM = backup@고객사명.com
EMAIL_AUTH_USER = backup@고객사명.com
EMAIL_AUTH_PASSWORD = your-app-password
EOF

# 설정 확인
/usr/openv/netbackup/bin/admincmd/bpgetconfig | grep EMAIL
```

#### 3단계: 장애 알림 설정
```bash
# 장애 발생 시 즉시 이메일 전송
/usr/openv/netbackup/bin/admincmd/bpnotify \
  -add \
  -name "VBIP_Failure_Alert" \
  -trigger JOB_FAILED \
  -recipient vbip-monitor@thelab.com \
  -format xlsx \
  -include_details

# 확인
/usr/openv/netbackup/bin/admincmd/bpnotify -list
```

#### 4단계: 일일 리포트 스케줄
```bash
# 매일 오전 9시 전체 작업 리포트
/usr/openv/netbackup/bin/admincmd/bpreport \
  -create_schedule \
  -name "VBIP_Daily_Report" \
  -type all_jobs \
  -time "09:00" \
  -email vbip-monitor@thelab.com \
  -format xlsx

# 스케줄 확인
/usr/openv/netbackup/bin/admincmd/bpreport -list_schedules
```

#### 5단계: 테스트 이메일 전송
```bash
# 테스트 메일 발송
/usr/openv/netbackup/bin/admincmd/bpmail \
  -to vbip-monitor@thelab.com \
  -subject "Veritas NetBackup 테스트 - 고객사명" \
  -body "V-BIP 연동 테스트입니다."

# 로그 확인
tail -f /usr/openv/netbackup/logs/admin/email.log
```

---

## 📊 Excel 리포트 포맷

### 필수 컬럼 (V-BIP 파싱용)

| 컬럼명 (한글) | 컬럼명 (영문) | 필수 |
|-------------|-------------|------|
| 고객사명 | Client Name | ✅ |
| 작업유형 | Job Type | ✅ |
| 상태 | Status | ✅ |
| 시작시간 | Start Time | ✅ |
| 종료시간 | End Time | ⚪ |
| 소요시간(분) | Duration (Minutes) | ⚪ |
| 백업크기(GB) | Backup Size (GB) | ⚪ |
| 에러코드 | Error Code | ⚪ |
| 에러메시지 | Error Message | ⚪ |

### 샘플 Excel 형식

```
| 고객사명    | 작업유형 | 상태 | 시작시간           | 에러코드 | 에러메시지              |
|-----------|--------|------|-------------------|---------|----------------------|
| 서울우유   | Full   | 실패  | 2026-02-16 01:00  | 58      | 미디어 서버 연결 실패    |
| 동국제약   | Inc    | 성공  | 2026-02-16 02:00  | -       | -                    |
```

---

## 🔒 보안 설정 (Gmail 사용 시)

### Gmail 앱 비밀번호 생성

```
1. https://myaccount.google.com 접속
2. "보안" → "2단계 인증" 활성화
3. "앱 비밀번호" 생성
4. 앱: "메일", 기기: "기타(사용자 지정)"
5. 이름: "Veritas NetBackup - 고객사명"
6. 생성된 16자리 비밀번호 복사
7. NetBackup EMAIL_AUTH_PASSWORD에 입력
```

**⚠️ 주의**: 일반 Gmail 비밀번호가 아닌 **앱 비밀번호**를 사용해야 합니다!

---

## 🧪 테스트 체크리스트

### 1단계: 이메일 발송 테스트
```bash
# CLI 테스트
/usr/openv/netbackup/bin/admincmd/bpmail \
  -to vbip-monitor@thelab.com \
  -subject "Test" \
  -body "Test email"
```
- [ ] vbip-monitor@thelab.com 수신 확인

### 2단계: 장애 시뮬레이션
```bash
# 의도적으로 실패하는 백업 작업 실행
/usr/openv/netbackup/bin/admincmd/bpbackup \
  -p test_policy \
  -s test_schedule \
  -h invalid_client
```
- [ ] 장애 이메일 자동 발송 확인
- [ ] Excel 첨부파일 포함 확인

### 3단계: V-BIP 시스템 확인
- [ ] Slack #vbip-alerts 알림 수신 (5분 이내)
- [ ] V-BIP Dashboard에 데이터 표시
- [ ] 고객사명, 에러 정보 정확히 파싱됨

---

## 📞 문제 해결

### ❌ 이메일이 발송되지 않음
```bash
# 1. 로그 확인
tail -f /usr/openv/netbackup/logs/admin/email.log

# 2. SMTP 설정 확인
/usr/openv/netbackup/bin/admincmd/bpgetconfig | grep EMAIL

# 3. 네트워크 확인
telnet smtp.gmail.com 587

# 4. 방화벽 확인
sudo iptables -L | grep 587
```

**일반적인 원인**:
- SMTP 서버 주소 오류
- 포트 차단 (방화벽)
- 인증 정보 오류 (Gmail 앱 비밀번호)
- 2단계 인증 미활성화 (Gmail)

### ❌ 이메일은 발송되지만 V-BIP에서 처리 안 됨
```bash
# V-BIP 서버에서 확인
sudo journalctl -u vbip-email-automation -f
```

**일반적인 원인**:
- 제목에 Veritas 키워드 없음 → config.py 확인
- Excel 형식 불일치 → 컬럼명 확인
- 첨부파일 크기 초과 (50MB) → 압축 또는 분할

### ❌ Excel 파싱 오류
- 컬럼명이 표준 형식과 다름 → `excel_parser.py`의 `column_mapping` 확인
- 날짜 형식 오류 → ISO 형식 권장 (YYYY-MM-DD HH:MM:SS)
- 상태 값 인식 안 됨 → "실패/성공/경고" 또는 "Failure/Success/Warning" 사용

---

## 📊 설정 완료 후 운영

### 자동으로 처리되는 것
✅ 매일 또는 장애 발생 시 이메일 자동 발송  
✅ V-BIP 시스템이 5분마다 자동 체크  
✅ Excel 자동 파싱 및 DB 저장  
✅ Slack 즉시 알림  
✅ Dashboard 자동 업데이트  

### 고객사가 할 일
⚪ 없음! 모든 것이 자동입니다.

### 엔지니어(김인석 부장)가 할 일
⚪ Slack 알림 확인  
⚪ Dashboard에서 상황 모니터링  
⚪ 필요시 원격 또는 현장 조치  

---

## 📋 고객사 설정 요청 템플릿

### 이메일 템플릿

```
제목: [V-BIP] Veritas NetBackup 자동 모니터링 연동 요청

안녕하세요, [고객사명] 담당자님

The Lab의 김인석입니다.

더 빠른 장애 대응을 위해 Veritas NetBackup 자동 모니터링 시스템을 구축했습니다.
고객사의 백업 서버에서 간단한 설정만으로 자동 모니터링이 가능합니다.

■ 설정 내용
- Veritas NetBackup 이메일 알림 설정
- 장애 발생 시 자동 리포트 전송
- 소요 시간: 약 15분

■ 효과
- 장애 인지 시간: 24시간 → 5분 (99.7% 단축)
- 실시간 Slack 알림
- 자동 데이터 분석 및 Dashboard 제공

■ 필요 정보
1. Veritas NetBackup Master Server 접속 정보
2. 회사 SMTP 서버 정보 (또는 Gmail 사용)

첨부된 설정 가이드를 참고해주시거나,
원격 지원을 원하시면 연락 주십시오.

감사합니다.

---
김인석 부장
The Lab
이메일: kim@thelab.com
전화: 010-XXXX-XXXX
```

---

## 🎯 추가 기능 (Phase 3-B)

설정 완료 후 사용 가능한 기능:

✅ **현재 (Phase 3-A)**
- 이메일 자동 수신 및 파싱
- Slack 실시간 알림
- Dashboard 자동 업데이트

🚧 **곧 출시 (Phase 3-B)**
- 🤖 AI 자동 진단 (GPT-4 기반)
- 📊 장애 원인 분석
- 💡 해결 방안 자동 제시
- 🔮 유사 사례 학습

🚧 **계획 중 (Phase 4)**
- 🔧 자동 복구 시스템
- 🔄 서비스 자동 재시작
- ⚙️ 설정 자동 수정

---

**작성일**: 2026-02-16  
**작성자**: The Lab 김인석 부장  
**문서 버전**: 1.0  
**문의**: vbip-support@thelab.com
