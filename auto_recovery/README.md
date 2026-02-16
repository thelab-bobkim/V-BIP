# V-BIP Phase 4: 자동 복구 시스템 🤖

NetBackup 장애를 AI가 진단하고 **자동으로 원격 복구**하는 시스템입니다.

## ✨ 주요 기능

### 1. AI 기반 복구 스크립트 생성
- **GPT-4 Turbo**가 안전한 Bash 스크립트 자동 생성
- 사전 정의된 Playbook 활용 (8개 에러 코드)
- 안전성 검증: 블랙리스트/화이트리스트 체크

### 2. 원격 자동 실행
- **SSH (Paramiko)** 기반 원격 접속
- 고객사 NetBackup 서버에 직접 명령어 실행
- 실시간 로그 수집 & 모니터링

### 3. 3단계 자동화 레벨
| 레벨 | 실행 방식 | 설명 |
|------|----------|------|
| **LEVEL_1** | 즉시 자동 실행 | 승인 없이 즉시 복구 (위험도 낮음) |
| **LEVEL_2** | Slack 승인 후 실행 | 버튼 클릭으로 승인 (중간 위험도) |
| **LEVEL_3** | 가이드만 제공 | 엔지니어 수동 조치 (높은 위험도) |

### 4. 안전 장치
- ✅ **사전 백업**: 설정 파일 자동 백업
- ✅ **안전성 검증**: 위험 명령어 차단 (rm -rf, mkfs 등)
- ✅ **롤백 기능**: 실패 시 자동 복원
- ✅ **실행 시간 제한**: Timeout으로 무한 루프 방지
- ✅ **로그 기록**: 모든 작업 추적 가능

---

## 📦 구성 요소

```
auto_recovery/
├── config_recovery.py        # 설정 (SSH, 안전성, Playbook)
├── script_generator.py       # AI 스크립트 생성기
├── remote_executor.py        # SSH 원격 실행 엔진
├── recovery_manager.py       # 통합 복구 관리자
├── requirements_phase4.txt   # Python 의존성
└── README.md                 # 이 파일
```

---

## 🚀 빠른 시작

### 1. 설치
```bash
cd auto_recovery

# 가상환경 생성
python3 -m venv venv_phase4
source venv_phase4/bin/activate

# 라이브러리 설치
pip install -r requirements_phase4.txt
```

### 2. 환경 설정
```bash
# .env 파일 생성
cp .env.example .env
nano .env
```

**필수 설정:**
```env
# OpenAI (Phase 3-B와 공유)
OPENAI_API_KEY=sk-proj-your-key-here

# SSH 설정
SSH_KEY_PATH=~/.ssh/id_rsa

# Slack (알림용)
SLACK_WEBHOOK_URL=https://hooks.slack.com/services/...

# Database (Phase 3-A와 공유)
DB_HOST=localhost
DB_NAME=veritas_monitor
DB_PASSWORD=your_password
```

### 3. 고객사 서버 등록
`config_recovery.py` 파일에서 고객사 서버 정보 추가:

```python
CUSTOMER_SERVERS = {
    '서울우유본사': {
        'host': '192.168.1.100',
        'port': 22,
        'username': 'netbackup_admin',
        'auth_method': 'key'  # or 'password'
    },
    # ... 추가 고객사
}
```

### 4. SSH 키 설정
```bash
# SSH 키 생성 (없다면)
ssh-keygen -t rsa -b 4096 -f ~/.ssh/vbip_recovery

# 고객사 서버에 공개키 배포
ssh-copy-id -i ~/.ssh/vbip_recovery.pub netbackup_admin@192.168.1.100

# 연결 테스트
ssh -i ~/.ssh/vbip_recovery netbackup_admin@192.168.1.100
```

### 5. 테스트 실행
```bash
# 개별 모듈 테스트
python script_generator.py    # 스크립트 생성 테스트
python remote_executor.py      # SSH 실행 테스트
python recovery_manager.py     # 통합 테스트
```

---

## 📊 사용 예시

### Phase 3-B 진단 → Phase 4 자동 복구 흐름

```python
from recovery_manager import AutoRecoveryManager

# Phase 3-B 진단 결과 (예시)
diagnosis = {
    'error_code': '89',
    '원인_분석': ['Shared memory 오류'],
    '해결_방안': ['ipcrm -a', 'NetBackup 재시작'],
    'automation_level': 'LEVEL_1',
    '신뢰도': 0.92,
    'metadata': {
        'error_code': '89',
        'customer_name': '서울우유본사'
    }
}

# 자동 복구 실행
manager = AutoRecoveryManager()
result = manager.process_diagnosis(
    diagnosis=diagnosis,
    customer_name='서울우유본사',
    auto_approve_level1=True  # LEVEL_1 자동 승인
)

# 결과 확인
print(f"상태: {result['status']}")
print(f"복구 ID: {result['recovery_id']}")
```

**출력:**
```
🚀 자동 복구 프로세스 시작
고객사: 서울우유본사
에러 코드: 89
자동화 레벨: LEVEL_1

🛠️ Step 1: 복구 스크립트 생성
✅ 안전성 검증 통과

⚡ Step 2: 복구 실행
🔐 SSH 연결: 192.168.1.100
💾 Step 3: 백업 생성
⚡ Step 4: 스크립트 실행
🔍 Step 5: 결과 검증
✅ 복구 성공!

상태: success
복구 ID: REC-1708086420
```

---

## 🛠️ 기술 스택

### Core
- **Python 3.9+**: 메인 언어
- **OpenAI GPT-4 Turbo**: 스크립트 생성
- **Paramiko**: SSH 클라이언트
- **Loguru**: 로깅

### Integration
- **Phase 3-A**: 이메일 모니터 + Excel 파싱
- **Phase 3-B**: AI 진단 엔진
- **PostgreSQL**: 복구 히스토리 저장
- **Slack**: 알림 + Interactive 버튼

---

## 🔒 보안

### 1. SSH 키 관리
```bash
# 키 권한 설정
chmod 600 ~/.ssh/vbip_recovery
chmod 644 ~/.ssh/vbip_recovery.pub

# 키 암호화 (선택)
ssh-keygen -p -f ~/.ssh/vbip_recovery
```

### 2. 최소 권한 원칙
고객사 서버에 전용 계정 생성:
```bash
# 고객사 서버에서 실행
sudo useradd -m -s /bin/bash vbip_recovery
sudo usermod -aG netbackup vbip_recovery

# sudoers 제한적 권한 부여
echo "vbip_recovery ALL=(ALL) NOPASSWD: /usr/openv/netbackup/bin/*" | sudo tee -a /etc/sudoers.d/vbip
```

### 3. 감사 로그
모든 복구 작업은 DB에 기록:
- 누가 (recovery_id)
- 언제 (timestamp)
- 무엇을 (script_content)
- 어디서 (customer_name, host)
- 왜 (diagnosis_result)
- 어떻게 (execution_log)

---

## 📈 예상 효과

### ROI 분석 (Phase 3-B → Phase 4)
| 항목 | Phase 3-B | Phase 4 | 개선 |
|------|-----------|---------|------|
| 자동 진단 | ✅ (75%) | ✅ (75%) | - |
| 자동 복구 | ❌ | ✅ (75%) | +75% |
| 평균 복구 시간 | 4시간 | 10분 | **-97.5%** |
| 월 엔지니어 출동 | 5건 | 1.25건 | **-75%** |
| 월 인건비 | 70만원 | 17.5만원 | **-75%** |
| AI 운영비 | 5만원 | 7만원 | +2만원 |
| **순 절감** | - | - | **-50.5만원/월** |

**연간 추가 절감액: 606만원** (~$4,600)

**Phase 3-B + Phase 4 총 절감:**
- 월: 325만원 (Phase 3-B) + 50.5만원 (Phase 4) = **375.5만원**
- 연: **45,060,000원** (~$34,600)

---

## 🧪 테스트 시나리오

### 시나리오 1: LEVEL_1 자동 복구 (Error 89)
```python
# 진단 결과
diagnosis = {
    'error_code': '89',
    'automation_level': 'LEVEL_1',
    '신뢰도': 0.92,
    '위험도': 2
}

# 자동 실행 (승인 불필요)
manager.process_diagnosis(diagnosis, '서울우유본사', auto_approve_level1=True)

# 예상 결과: 2-5분 내 자동 복구 완료
```

### 시나리오 2: LEVEL_2 승인 후 복구 (Error 83)
```python
diagnosis = {
    'error_code': '83',
    'automation_level': 'LEVEL_2',
    '신뢰도': 0.85,
    '위험도': 4
}

# Slack 승인 대기 → 엔지니어 클릭 → 자동 실행
manager.process_diagnosis(diagnosis, '동국제약')

# 예상 결과: 승인 후 10-20분 내 복구 완료
```

### 시나리오 3: 롤백 테스트
```python
# 의도적으로 실패하도록 스크립트 생성
# → 백업으로부터 자동 롤백
# → 상태: 'rolled_back'
```

---

## 🐛 문제 해결

### 1. SSH 연결 실패
```bash
# SSH 키 권한 확인
ls -la ~/.ssh/vbip_recovery

# 연결 테스트
ssh -v -i ~/.ssh/vbip_recovery user@host

# 방화벽 확인
telnet host 22
```

### 2. 스크립트 안전성 검증 실패
```
❌ 안전하지 않은 스크립트 감지!
위반 사항: ['금지된 명령어 발견: rm -rf']
```
→ `config_recovery.py`에서 `BLACKLIST_COMMANDS` 확인

### 3. Timeout
```
❌ 실행 실패: Timeout
```
→ `.env`에서 `SCRIPT_TIMEOUT` 증가:
```env
SCRIPT_TIMEOUT_LEVEL1=600  # 10분
```

---

## 📚 추가 문서

- **Phase 3-A**: 이메일 모니터 → [../email_automation/README.md](../email_automation/README.md)
- **Phase 3-B**: AI 진단 → [../ai_diagnosis/README.md](../ai_diagnosis/README.md)
- **배포 가이드**: PHASE4_DEPLOYMENT_GUIDE.md (작성 예정)

---

## 🚧 로드맵

### ✅ Phase 4-A (현재)
- [x] AI 스크립트 생성기
- [x] 원격 SSH 실행
- [x] 안전성 검증
- [x] 백업 & 롤백
- [ ] Slack Interactive 버튼 (구현 중)

### ⏳ Phase 4-B (다음)
- [ ] 복구 결과 자동 검증 (AI 기반)
- [ ] 다단계 롤백 (체크포인트)
- [ ] 실시간 진행 상황 Slack 업데이트

### 🔮 미래
- [ ] 예측적 자동 복구 (장애 발생 전 예방)
- [ ] 멀티 서버 동시 복구
- [ ] A/B 테스트 (복구 방법 비교)

---

## 📞 지원

- **GitHub**: https://github.com/thelab-bobkim/V-BIP
- **이슈**: GitHub Issues

---

**작성일**: 2026-02-16  
**버전**: Phase 4 v1.0  
**다음 단계**: Slack Interactive 버튼 구현
