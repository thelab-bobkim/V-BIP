# V-BIP Phase 3-B: AI 진단 시스템 🤖

NetBackup 장애를 AI가 자동으로 분석하고 해결 방안을 제시하는 시스템입니다.

## ✨ 주요 기능

### 1. AI 기반 장애 진단
- **GPT-4 Turbo** 기반 원인 분석
- Veritas 공식 매뉴얼 지식 베이스 활용
- 실시간 유사 사례 검색

### 2. 자동화 레벨 결정
| 레벨 | 이름 | 설명 | 예상 비율 |
|------|------|------|----------|
| **LEVEL 1** | 완전 자동 | 승인 없이 즉시 실행 | ~35% |
| **LEVEL 2** | 승인 후 자동 | Slack 버튼 클릭 후 실행 | ~40% |
| **LEVEL 3** | 가이드 제공 | 엔지니어 수동 조치 | ~25% |

### 3. Phase 3-A 통합
```
이메일 수신 (Phase 3-A)
    ↓
Excel 파싱 (Phase 3-A)
    ↓
AI 진단 (Phase 3-B) ✨ NEW!
    ↓
Slack 알림 + 자동 복구 (Phase 4, 예정)
```

---

## 📦 구성 요소

### 핵심 모듈
```
ai_diagnosis/
├── config_ai.py              # AI 설정
├── knowledge_builder.py      # 지식 베이스 구축
├── diagnosis_engine.py       # AI 진단 엔진
├── integrated_monitor.py     # Phase 3-A 통합 모니터
├── requirements_phase3b.txt  # Python 의존성
├── .env.example              # 환경 변수 템플릿
├── PHASE3B_DEPLOYMENT_GUIDE.md  # 배포 가이드
└── README.md                 # 이 파일
```

### 지식 베이스
```
knowledge_base/
├── NetBackup_Appliance_Troubleshooting_Guide_511.pdf
└── NetBackup_52xx_5330_Admin_Guide_311.pdf
```

### Vector Database
```
chroma_db/                    # ChromaDB (로컬)
├── [임베딩 데이터]
└── kb_statistics.json        # 통계
```

---

## 🚀 빠른 시작

### 1. 설치
```bash
cd ai_diagnosis

# 가상환경 생성
python3 -m venv venv_phase3b
source venv_phase3b/bin/activate

# 라이브러리 설치
pip install -r requirements_phase3b.txt
```

### 2. 환경 설정
```bash
# .env 파일 생성
cp .env.example .env
nano .env
```

**필수 설정:**
```env
OPENAI_API_KEY=sk-proj-your-key-here
```

### 3. 지식 베이스 구축
```bash
# PDF 파일 배치
mkdir -p knowledge_base
cp /path/to/NetBackup*.pdf knowledge_base/

# Vector DB 구축 (10-20분 소요)
python knowledge_builder.py
```

### 4. 테스트
```bash
# AI 진단 엔진 테스트
python diagnosis_engine.py

# 통합 시스템 테스트
python integrated_monitor.py --test
```

### 5. 프로덕션 실행
```bash
# 무한 루프 (5분 간격)
python integrated_monitor.py --interval 300
```

---

## 📊 진단 예시

### 입력
```json
{
  "error_code": "83",
  "error_message": "Media open error on tape drive",
  "customer_name": "서울우유본사",
  "occurrence_time": "2026-02-15 01:00:00"
}
```

### 출력
```json
{
  "원인_분석": [
    "테이프 드라이브가 준비되지 않음",
    "미디어가 로드되지 않음",
    "하드웨어 장애 가능성"
  ],
  "해결_방안": [
    "드라이브 상태 확인 (vmquery -a)",
    "스토리지 장치 재스캔 (vmchange -res)"
  ],
  "필요_명령어": [
    "vmquery -a",
    "vmchange -res",
    "bpstulist -U"
  ],
  "예상_소요_시간": "10-20분",
  "자동화_레벨": "LEVEL_2",
  "위험도": 4,
  "신뢰도": 0.85
}
```

---

## 🛠️ 기술 스택

### AI & ML
- **OpenAI GPT-4 Turbo**: 진단 생성
- **text-embedding-3-large**: 문서 임베딩
- **LangChain**: RAG (Retrieval-Augmented Generation)

### Vector Database
- **ChromaDB**: 로컬 벡터 DB (개발/테스트)
- **Pinecone**: 클라우드 벡터 DB (프로덕션, 선택)

### Document Processing
- **pdfplumber**: PDF 텍스트 추출
- **PyPDF2**: PDF 메타데이터

### Integration
- **Phase 3-A**: 이메일 모니터 + Excel 파서
- **PostgreSQL**: 진단 결과 저장
- **Slack**: 알림

---

## 💰 비용 예상

### OpenAI API (월간, 일 20건 기준)
- GPT-4 Turbo: $0.01/1K tokens (입력), $0.03/1K tokens (출력)
- Embedding: $0.00013/1K tokens
- **월 총액**: $30-50

### 절감 팁
1. `gpt-3.5-turbo` 사용 시 90% 절감
2. 실패 건만 AI 진단 (기본)
3. 캐싱 활용

---

## 📈 성능

### 초기 예상 (학습 전)
- **정확도**: 80-85%
- **응답 시간**: 5-10초
- **자동화 가능 비율**: 70-75%

### 목표 (6개월 후)
- **정확도**: 90-95%
- **응답 시간**: 3-5초
- **자동화 가능 비율**: 85%+

---

## 🔒 보안

### API 키 관리
```bash
# .env 파일은 절대 Git에 커밋 금지
echo ".env" >> .gitignore
```

### 데이터 보호
- 고객사 정보는 로컬 DB에만 저장
- OpenAI로 전송 데이터: 에러 코드, 메시지만
- 개인정보 (IP, 계정 등) 제외

---

## 🐛 문제 해결

### 1. OpenAI API 키 오류
```bash
python config_ai.py  # 설정 검증
```

### 2. Vector Store 로드 실패
```bash
python knowledge_builder.py  # 재구축
```

### 3. 메모리 부족
```env
# .env에서 설정 조정
CHUNK_SIZE=500
TOP_K_RESULTS=3
```

자세한 내용은 [PHASE3B_DEPLOYMENT_GUIDE.md](./PHASE3B_DEPLOYMENT_GUIDE.md) 참조

---

## 🚧 로드맵

### ✅ Phase 3-B (현재)
- [x] AI 진단 엔진
- [x] 지식 베이스 구축
- [x] Phase 3-A 통합
- [ ] 실전 데이터 수집 → 학습

### ⏳ Phase 4 (다음)
- [ ] 자동 복구 스크립트 생성
- [ ] Slack Interactive 버튼
- [ ] 복구 결과 검증
- [ ] 롤백 기능

### 🔮 미래
- [ ] 예측적 장애 감지
- [ ] 자동 용량 계획
- [ ] 다국어 지원

---

## 📞 지원

- **GitHub**: https://github.com/thelab-bobkim/V-BIP
- **문서**: [PHASE3B_DEPLOYMENT_GUIDE.md](./PHASE3B_DEPLOYMENT_GUIDE.md)
- **이슈**: GitHub Issues

---

## 📜 라이선스

Proprietary - TheLab Inc.

---

**작성일**: 2026-02-16  
**버전**: Phase 3-B v1.0  
**다음 단계**: 실전 배포 → 데이터 수집 → AI 학습 개선
