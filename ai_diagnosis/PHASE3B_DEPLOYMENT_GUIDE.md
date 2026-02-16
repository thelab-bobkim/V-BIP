# V-BIP Phase 3-B: AI 진단 시스템 배포 가이드

## 📋 목차
1. [시스템 개요](#시스템-개요)
2. [사전 준비](#사전-준비)
3. [설치 단계](#설치-단계)
4. [지식 베이스 구축](#지식-베이스-구축)
5. [테스트](#테스트)
6. [프로덕션 배포](#프로덕션-배포)
7. [문제 해결](#문제-해결)

---

## 🎯 시스템 개요

### Phase 3-B가 하는 일
```
백업 장애 발생
    ↓
Phase 3-A: 이메일 수신 + Excel 파싱
    ↓
Phase 3-B: AI가 원인 분석 + 해결 방안 제시 ✨ NEW!
    ↓
자동화 레벨 결정:
  - LEVEL 1: 완전 자동 (승인 없이 즉시 실행)
  - LEVEL 2: 승인 후 자동 (Slack 버튼 클릭)
  - LEVEL 3: 가이드 제공 (엔지니어 수동 조치)
    ↓
Slack 알림 + 자동 복구 (Phase 4)
```

### 주요 기능
- ✅ **AI 기반 원인 분석**: GPT-4가 Veritas 매뉴얼 기반 진단
- ✅ **자동화 레벨 결정**: 신뢰도/위험도 기반 자동 판단
- ✅ **지식 베이스 검색**: Vector DB로 관련 문서 자동 검색
- ✅ **Phase 3-A 통합**: 기존 이메일 모니터와 seamless 연동

---

## 📦 사전 준비

### 1. OpenAI API 키 발급
```bash
# https://platform.openai.com/api-keys 접속
# "Create new secret key" 클릭
# 생성된 키 복사 (sk-proj-... 형태)
```

**비용 예상:**
- GPT-4-turbo: $0.01 / 1K tokens (입력), $0.03 / 1K tokens (출력)
- text-embedding-3-large: $0.00013 / 1K tokens
- **월 예상 비용**: 약 $30-50 (일 20건 장애 기준)

### 2. PDF 문서 준비
다음 파일들을 `ai_diagnosis/knowledge_base/` 디렉토리에 배치:
- `NetBackup_Appliance_Troubleshooting_Guide_511.pdf` ✅ (이미 업로드됨)
- `NetBackup_52xx_5330_Admin_Guide_311.pdf` ✅ (이미 업로드됨)

### 3. 시스템 요구사항
- **Python**: 3.9 이상
- **메모리**: 최소 4GB (Vector DB용)
- **디스크**: 5GB 여유 공간 (지식 베이스용)
- **네트워크**: OpenAI API 접근 가능

---

## 🚀 설치 단계

### Step 1: 코드 배포

```bash
# GitHub에서 최신 코드 pull
cd ~/V-BIP
git pull origin main

# 또는 새로 클론
git clone https://github.com/thelab-bobkim/V-BIP.git
cd V-BIP
```

### Step 2: Python 가상환경 생성

```bash
cd ai_diagnosis

# 가상환경 생성
python3 -m venv venv_phase3b

# 가상환경 활성화
source venv_phase3b/bin/activate

# pip 업그레이드
pip install --upgrade pip
```

### Step 3: 라이브러리 설치

```bash
# Phase 3-B 라이브러리 설치
pip install -r requirements_phase3b.txt

# 설치 확인
python -c "import openai; import langchain; print('✅ 설치 성공')"
```

**설치 시간**: 약 5-10분

### Step 4: 환경 변수 설정

```bash
# .env 파일 생성
cp .env.example .env

# .env 파일 편집
nano .env
```

**필수 설정 항목:**
```env
# OpenAI (필수!)
OPENAI_API_KEY=sk-proj-your-actual-key-here

# Vector DB (기본값 사용 가능)
USE_PINECONE=false
CHROMA_PERSIST_DIR=./chroma_db

# Phase 3-A 연동 (이미 설정되어 있다면 복사)
DB_HOST=localhost
DB_NAME=veritas_monitor
VERITAS_EMAIL=your-email@gmail.com
SLACK_WEBHOOK_URL=https://hooks.slack.com/services/...
```

**설정 검증:**
```bash
python config_ai.py
```

출력 예시:
```
============================================================
V-BIP Phase 3-B AI Diagnosis Configuration
============================================================
OpenAI Model: gpt-4-turbo-preview
Temperature: 0.3
Vector DB: ChromaDB (Local)
Embedding Model: text-embedding-3-large
Knowledge Base: 2 documents
Error Codes Mapped: 8
============================================================
✅ 설정 검증 완료
```

---

## 📚 지식 베이스 구축

### Step 1: PDF 파일 배치

```bash
# knowledge_base 디렉토리 생성
mkdir -p knowledge_base

# PDF 파일 복사 (예시)
cp /path/to/NetBackup_Appliance_Troubleshooting_Guide_511.pdf knowledge_base/
cp /path/to/NetBackup_52xx_5330_Admin_Guide_311.pdf knowledge_base/
```

### Step 2: 지식 베이스 구축 실행

```bash
# Vector DB 구축 (10-20분 소요)
python knowledge_builder.py
```

**진행 상황:**
```
====================================================================
🚀 지식 베이스 구축 시작
====================================================================
📄 PDF 처리 중: NetBackup_Appliance_Troubleshooting_Guide_511.pdf
   총 780 페이지
   진행: 50/780 페이지
   ...
✅ 750 페이지 추출 완료

📄 PDF 처리 중: NetBackup_52xx_5330_Admin_Guide_311.pdf
   총 450 페이지
   ...
✅ 430 페이지 추출 완료

📊 전체 추출: 1180 페이지

📝 문서 청킹 중...
✅ 4520 청크 생성 완료

🔨 Vector Store 구축 중...
   총 4520 텍스트 임베딩 생성 중...
✅ Vector Store 구축 완료
   저장 위치: ./chroma_db

📊 통계 저장: ./chroma_db/kb_statistics.json
   - PDF: 2개
   - 페이지: 1180개
   - 청크: 4520개
   - 평균 청크 크기: 980 문자

====================================================================
✅ 지식 베이스 구축 완료!
====================================================================
```

### Step 3: 검색 테스트

```bash
# 지식 베이스 검색 테스트가 자동 실행됩니다
```

출력 예시:
```
🔍 검색 테스트: 'Error code 83 media open error'

결과 1:
  출처: NetBackup_Appliance_Troubleshooting_Guide_511.pdf
  페이지: 245
  내용 (앞 200자): Error 83: Media open error
  This error indicates that the tape drive failed to open the media...
```

---

## 🧪 테스트

### Step 1: AI 진단 엔진 단독 테스트

```bash
# 진단 엔진 테스트
python diagnosis_engine.py
```

**예상 출력:**
```
====================================================================
테스트 케이스 1
====================================================================

====================================================================
🔍 AI 진단 시작
====================================================================
✅ 에러 코드 추출: 83
📚 지식 베이스 검색 중...
   찾은 관련 문서: 5개
🤖 AI 분석 중...
✅ 진단 완료!
   자동화 레벨: LEVEL_2
   신뢰도: 0.85

📄 진단 결과 (JSON):
{
  "원인_분석": [
    "테이프 드라이브가 준비되지 않음",
    "미디어가 로드되지 않음",
    "하드웨어 장애 가능성"
  ],
  "해결_방안": [
    "드라이브 상태 확인 (vmquery -a)",
    "스토리지 장치 재스캔 (vmchange -res)",
    "미디어 로드 상태 확인"
  ],
  "필요_명령어": [
    "vmquery -a",
    "vmchange -res",
    "bpstulist -U"
  ],
  "예상_소요_시간": "10-20분",
  "자동화_레벨": "LEVEL_2",
  "위험도": 4,
  "신뢰도": 0.85,
  "automation_level": "LEVEL_2",
  "metadata": {
    "error_code": "83",
    "customer_name": "서울우유본사",
    "diagnosis_time": "2026-02-16T11:45:00"
  }
}

📱 Slack 메시지:
🔍 **AI 진단 결과**

**고객사:** 서울우유본사
**에러 코드:** 83
**발생 시간:** 2026-02-15 01:00:00

**📊 진단 정보**
• 신뢰도: 0.85 / 1.0
• 위험도: 4 / 10
• 예상 소요 시간: 10-20분
• 자동화 레벨: LEVEL_2 - 승인 후 자동

**🔎 원인 분석**
1. 테이프 드라이브가 준비되지 않음
2. 미디어가 로드되지 않음
3. 하드웨어 장애 가능성

**💡 해결 방안**
1. 드라이브 상태 확인 (vmquery -a)
2. 스토리지 장치 재스캔 (vmchange -res)
3. 미디어 로드 상태 확인

⚠️ **승인 후 자동 복구를 진행합니다.**
```

### Step 2: Phase 3-A 통합 테스트

```bash
# 통합 모니터 테스트 (1회 실행)
python integrated_monitor.py --test
```

**예상 출력:**
```
====================================================================
🚀 V-BIP Phase 3-A + 3-B 통합 시스템 시작
====================================================================
✅ AI 진단 엔진 활성화
AI 진단: 활성화 ✅

🧪 테스트 모드 - 1회 실행
📧 이메일 체크 시작...
📬 새 이메일 1개 발견

[처리 중] backup_report_20260216.xlsx
   파싱: 3건
   
   [1/3] 서울우유본사 - 실패
   🔍 AI 진단 시작: 서울우유본사
   ✅ 진단 완료: LEVEL_2 레벨
   💾 진단 결과 저장 완료 (Backup ID: 1001)
   📱 Slack 알림 전송 완료
   
   [2/3] 동국제약 - 성공
   (AI 진단 스킵)
   
   [3/3] KG모빌리티 - 경고
   🔍 AI 진단 시작: KG모빌리티
   ✅ 진단 완료: LEVEL_1 레벨
   💾 진단 결과 저장 완료 (Backup ID: 1002)
   🤖 자동 복구 시작...
   📱 Slack 알림 전송 완료

✅ 이메일 처리 완료
```

---

## 🚀 프로덕션 배포

### Step 1: Systemd 서비스 등록

```bash
# 서비스 파일 생성
sudo nano /etc/systemd/system/vbip-ai-monitor.service
```

**서비스 파일 내용:**
```ini
[Unit]
Description=V-BIP AI Integrated Monitor (Phase 3-A + 3-B)
After=network.target postgresql.service

[Service]
Type=simple
User=ubuntu
WorkingDirectory=/home/ubuntu/V-BIP/ai_diagnosis
Environment="PATH=/home/ubuntu/V-BIP/ai_diagnosis/venv_phase3b/bin"
ExecStart=/home/ubuntu/V-BIP/ai_diagnosis/venv_phase3b/bin/python integrated_monitor.py --interval 300

# 리소스 제한
MemoryLimit=2G
CPUQuota=50%

# 자동 재시작
Restart=always
RestartSec=10

# 로그
StandardOutput=append:/var/log/vbip-ai-monitor.log
StandardError=append:/var/log/vbip-ai-monitor-error.log

[Install]
WantedBy=multi-user.target
```

### Step 2: 서비스 시작

```bash
# 서비스 등록
sudo systemctl daemon-reload
sudo systemctl enable vbip-ai-monitor

# 서비스 시작
sudo systemctl start vbip-ai-monitor

# 상태 확인
sudo systemctl status vbip-ai-monitor
```

**정상 실행 시:**
```
● vbip-ai-monitor.service - V-BIP AI Integrated Monitor
   Loaded: loaded (/etc/systemd/system/vbip-ai-monitor.service)
   Active: active (running) since Sat 2026-02-16 12:00:00 UTC
   ...
```

### Step 3: 로그 모니터링

```bash
# 실시간 로그 확인
sudo tail -f /var/log/vbip-ai-monitor.log

# 에러 로그 확인
sudo tail -f /var/log/vbip-ai-monitor-error.log

# 최근 100줄
sudo tail -100 /var/log/vbip-ai-monitor.log
```

---

## 🔧 문제 해결

### 문제 1: OpenAI API 키 에러
```
❌ 설정 오류:
  - OPENAI_API_KEY가 설정되지 않았습니다.
```

**해결:**
```bash
# .env 파일 확인
cat .env | grep OPENAI_API_KEY

# 키가 없거나 잘못되었다면 재설정
nano .env
# OPENAI_API_KEY=sk-proj-your-actual-key
```

### 문제 2: Vector Store 로드 실패
```
❌ Vector Store 로드 실패: ...
기존 Vector Store가 없습니다.
```

**해결:**
```bash
# 지식 베이스 재구축
python knowledge_builder.py

# chroma_db 디렉토리 확인
ls -la chroma_db/
```

### 문제 3: PDF 파일 없음
```
❌ PDF 파일을 찾을 수 없습니다.
```

**해결:**
```bash
# PDF 파일 확인
ls -la knowledge_base/

# 파일이 없다면 복사
cp /path/to/NetBackup*.pdf knowledge_base/
```

### 문제 4: 메모리 부족
```
MemoryError: Unable to allocate ...
```

**해결:**
1. **청크 크기 줄이기** (.env):
   ```env
   CHUNK_SIZE=500
   TOP_K_RESULTS=3
   ```

2. **Swap 메모리 추가**:
   ```bash
   sudo fallocate -l 2G /swapfile
   sudo chmod 600 /swapfile
   sudo mkswap /swapfile
   sudo swapon /swapfile
   ```

3. **서버 업그레이드** (권장):
   - 현재: 2GB → 최소 4GB

### 문제 5: OpenAI API 비용 과다
**모니터링:**
```bash
# https://platform.openai.com/usage 접속
# 일일 사용량 확인
```

**비용 절감 방법:**
1. 모델 변경 (.env):
   ```env
   OPENAI_MODEL=gpt-3.5-turbo  # $0.001/1K tokens
   ```

2. 실패 건만 AI 진단 (기본 설정)

3. 캐싱 활용 (동일 에러 반복 시)

---

## 📊 성능 지표

### 지식 베이스 통계
```bash
cat chroma_db/kb_statistics.json
```

### AI 진단 성능 (예상)
- **평균 응답 시간**: 5-10초
- **정확도**: 80-85% (초기)
- **자동화 가능 비율**: 70-75%

### 비용 (월 기준, 일 20건 장애)
- AI 진단: $30-40
- Embedding (초기): $10-15 (1회만)
- **총**: $40-55/월

---

## 🎉 완료!

### 다음 단계
1. ✅ **Phase 3-B 완료**: AI 진단 시스템 가동
2. ⏳ **Phase 4 대기**: 자동 복구 시스템 개발
3. 📊 **데이터 수집**: 실제 진단 케이스 수집 → AI 학습 개선

### 지원
- **GitHub**: https://github.com/thelab-bobkim/V-BIP
- **문의**: 개발팀

---

**작성일**: 2026-02-16  
**버전**: Phase 3-B v1.0  
**작성자**: V-BIP Development Team
