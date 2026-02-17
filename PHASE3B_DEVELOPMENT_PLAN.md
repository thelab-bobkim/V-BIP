# V-BIP Phase 3-B: AI 자동 진단 개발 계획
## NetBackup Troubleshooting Guide 기반

**시작일**: 2026-02-16  
**예상 완료**: 2주  
**상태**: 개발 준비 완료 ✅

---

## 📚 학습 자료

### 확보 완료 ✅
- [x] NetBackup Appliance Troubleshooting Guide 5.1.1
  - 파일: NetBackup_Appliance_Troubleshooting_Guide_511.pdf
  - 크기: 780KB
  - 주요 내용: 에러 코드, 해결 절차, 명령어, 로그

### 추가 수집 예정 🔄
- [ ] 김인석 부장 조치 이력
- [ ] 엔지니어 경험 노하우
- [ ] 고객사별 특이사항

---

## 🎯 개발 목표

### AI가 할 수 있는 것
```
✅ 에러 코드 자동 분석
✅ 원인 추론 (가능성 순위)
✅ 해결 방안 제시 (3가지)
✅ 과거 유사 사례 검색
✅ 예상 소요 시간 제공
✅ 자동화 가능 여부 판단
```

### 예시 시나리오
```
입력:
  고객사: 서울우유본사
  에러 코드: 83
  에러 메시지: media open error
  작업 유형: Full Backup

AI 출력:
┌─────────────────────────────────────┐
│ 🤖 AI 진단 결과                      │
│                                     │
│ 에러: 83 - Media Open Error         │
│                                     │
│ 원인 (가능성 순):                    │
│ 1. 테이프 드라이브 응답 없음 (60%)   │
│ 2. 미디어 서버 연결 끊김 (25%)       │
│ 3. 장치 권한 문제 (15%)             │
│                                     │
│ 권장 해결 방법:                      │
│ 1단계: 드라이브 상태 확인            │
│   명령어: vmchange -res -rt hcart   │
│                                     │
│ 2단계: 미디어 서버 연결 확인          │
│   명령어: bptestbpcd -client server  │
│                                     │
│ 3단계: 서비스 재시작                 │
│   명령어: bpdown -f && bpup -f      │
│                                     │
│ 자동화: Level 2 (승인 필요)          │
│ 예상 소요: 10분                      │
│ 성공률: 75%                         │
│                                     │
│ 과거 사례: 28건 (19건 성공)          │
└─────────────────────────────────────┘
```

---

## 🛠️ 기술 스택

### AI 엔진
```python
# OpenAI GPT-4
model: gpt-4-turbo-preview
temperature: 0.3  # 정확성 우선
max_tokens: 2000

# Vector Database
provider: Pinecone
embedding_model: text-embedding-3-large
dimension: 3072
```

### 지식 베이스 구축
```python
# 1. PDF 파싱
from pypdf import PdfReader

reader = PdfReader("NetBackup_Troubleshooting_Guide.pdf")
pages = [page.extract_text() for page in reader.pages]

# 2. 청크 분할 (섹션별)
chunks = [
    {
        "content": "Error 83: media open error...",
        "metadata": {
            "type": "error_code",
            "code": 83,
            "chapter": 5,
            "page": 145
        }
    },
    # ... 수백 개의 청크
]

# 3. 임베딩 생성
from openai import OpenAI
client = OpenAI()

embeddings = []
for chunk in chunks:
    response = client.embeddings.create(
        model="text-embedding-3-large",
        input=chunk["content"]
    )
    embeddings.append(response.data[0].embedding)

# 4. Vector DB 저장
import pinecone

index = pinecone.Index("vbip-knowledge-base")
index.upsert(vectors=zip(ids, embeddings, metadatas))
```

### 진단 로직
```python
async def diagnose_failure(error_code, error_message, customer, context):
    """AI 자동 진단"""
    
    # 1. 유사 사례 검색
    similar_cases = await search_similar_cases(
        error_code=error_code,
        error_message=error_message
    )
    
    # 2. 공식 가이드 검색
    official_guide = await search_knowledge_base(
        query=f"Error {error_code} {error_message}"
    )
    
    # 3. 과거 이력 검색
    past_incidents = await db.get_past_incidents(
        error_code=error_code,
        customer=customer
    )
    
    # 4. GPT-4 진단
    prompt = f"""
    당신은 Veritas NetBackup 전문 엔지니어입니다.
    
    ## 장애 정보
    - 고객사: {customer}
    - 에러 코드: {error_code}
    - 에러 메시지: {error_message}
    - 컨텍스트: {context}
    
    ## Veritas 공식 가이드
    {official_guide}
    
    ## 과거 유사 사례 ({len(similar_cases)}건)
    {similar_cases}
    
    ## 이 고객사 과거 이력 ({len(past_incidents)}건)
    {past_incidents}
    
    다음 형식으로 한글로 답변해주세요:
    
    1. 원인 분석 (가능성 높은 순서대로 3가지, 확률 포함)
    2. 각 원인별 해결 방안 (구체적 명령어 포함)
    3. 자동화 레벨 (Level 1/2/3)
    4. 예상 소요 시간
    5. 예상 성공률 (과거 데이터 기반)
    6. 주의사항
    """
    
    response = await openai.ChatCompletion.create(
        model="gpt-4-turbo-preview",
        messages=[
            {"role": "system", "content": "Veritas NetBackup 전문가"},
            {"role": "user", "content": prompt}
        ],
        temperature=0.3
    )
    
    diagnosis = response.choices[0].message.content
    
    # 5. 구조화
    return parse_diagnosis(diagnosis)
```

---

## 📅 개발 일정

### Week 1: 지식 베이스 구축

**Day 1-2: PDF 파싱 및 전처리**
```bash
□ PDF 파일 로드
□ 텍스트 추출
□ 섹션별 분리 (에러 코드, 해결 절차 등)
□ 메타데이터 추가
```

**Day 3-4: Vector DB 구축**
```bash
□ Pinecone 계정 생성
□ 임베딩 생성
□ 벡터 저장
□ 검색 테스트
```

**Day 5: 과거 데이터 통합**
```bash
□ 290건 장애 이력 분석
□ 패턴 추출
□ 성공률 계산
```

### Week 2: AI 진단 모듈 개발

**Day 6-7: 프롬프트 엔지니어링**
```bash
□ 진단 프롬프트 작성
□ 다양한 시나리오 테스트
□ 응답 품질 검증
```

**Day 8-9: 통합 및 테스트**
```bash
□ email_automation 모듈 통합
□ AI 진단 API 개발
□ Slack 리포트 포맷
```

**Day 10: 문서화 및 배포 준비**
```bash
□ 사용자 가이드 작성
□ API 문서 작성
□ 배포 스크립트 작성
```

---

## 🧪 테스트 계획

### 1. 정확도 테스트
```python
# 과거 290건 장애로 테스트
test_cases = get_past_incidents(limit=290)

correct = 0
for case in test_cases:
    ai_diagnosis = diagnose_failure(case)
    actual_solution = case.solution
    
    if ai_diagnosis.top_solution == actual_solution:
        correct += 1

accuracy = correct / len(test_cases)
print(f"정확도: {accuracy * 100}%")
# 목표: 80% 이상
```

### 2. 응답 시간 테스트
```python
import time

start = time.time()
diagnosis = await diagnose_failure(...)
end = time.time()

response_time = end - start
print(f"응답 시간: {response_time}초")
# 목표: 10초 이내
```

### 3. 비용 테스트
```python
# GPT-4 API 비용
tokens_used = response.usage.total_tokens
cost = (tokens_used / 1000) * 0.03  # $0.03 per 1K tokens

print(f"진단당 비용: ${cost}")
# 목표: $0.10 이하
```

---

## 📊 예상 성과

### 정확도 목표
```
Tier 1 (간단한 장애): 90% 정확도
  - 서비스 정지 (Error 25)
  - 로그 디스크 부족 (Error 2)

Tier 2 (중간 장애): 80% 정확도
  - 미디어 에러 (Error 83, 84)
  - 네트워크 타임아웃 (Error 54)

Tier 3 (복잡한 장애): 70% 정확도
  - 카탈로그 손상 (Error 1)
  - 하드웨어 장애
  
전체 평균: 80% 이상
```

### 속도 목표
```
단순 진단: < 5초
복합 진단: < 10초
상세 분석: < 30초
```

### 비용 목표
```
진단당 비용: $0.05 ~ $0.10
월 예상 비용: $20 ~ $40 (20건/월 × $1~2)
```

---

## 🔐 보안 고려사항

### 데이터 보호
```
✅ 고객사 정보 익명화
✅ 로그 데이터 암호화
✅ API 키 안전 저장
✅ 접근 권한 제한
```

### 개인정보 처리
```
✅ 호스트명 마스킹
✅ IP 주소 제거
✅ 계정 정보 제외
```

---

## 📝 다음 단계

### 즉시 시작 가능 ✅
```
1. Pinecone 계정 생성
2. OpenAI API 키 발급
3. PDF 파싱 스크립트 작성
4. Vector DB 구축 시작
```

### 병렬 작업
```
- 서버 업그레이드 (사용자)
- Phase 3-A 안정화 준비
- Phase 3-B 개발 (샌드박스)
```

---

**작성일**: 2026-02-16  
**작성자**: Genspark AI Assistant  
**상태**: 개발 준비 완료 ✅
