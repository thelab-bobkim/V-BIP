# V-BIP Phase 3-B & 4: AI 자동 진단 및 복구 시스템
## Veritas NetBackup 자동 장애 처리

**개발 단계**: 설계  
**예상 완료**: Phase 3-B (AI 진단) 2주, Phase 4 (자동 복구) 4주

---

## 🎯 목표

### Phase 3-B: AI 자동 진단
```
장애 발생
  ↓
AI가 자동으로:
1. 에러 코드 분석
2. 과거 유사 사례 검색
3. 원인 추론 (가능성 순위)
4. 해결 방안 제시 (3가지)
5. 예상 소요 시간 제공
```

### Phase 4: 자동 복구
```
AI 진단 완료
  ↓
자동 복구 가능 여부 판단
  ├─ 간단 → 즉시 자동 실행
  ├─ 중간 → 엔지니어 승인 후 실행
  └─ 복잡 → 상세 가이드만 제공
  ↓
실행 결과 모니터링
  ├─ 성공 → Slack 알림
  └─ 실패 → 엔지니어 에스컬레이션
```

---

## 📚 AI 학습 데이터

### 1️⃣ **Veritas 공식 문서** (업로드 필요)

#### 우선순위 높음 ⭐⭐⭐
- [ ] **NetBackup Troubleshooting Guide** (PDF)
  - 에러 코드별 원인 및 해결 방법
  - 시스템별 트러블슈팅
  
- [ ] **Error Code Reference** (Excel/PDF)
  - 모든 에러 코드 정의
  - 에러 코드별 해결 절차
  
- [ ] **Admin Guide** (PDF)
  - 명령어 매뉴얼
  - 서비스 관리
  - 로그 분석

#### 우선순위 중간 ⭐⭐
- [ ] **Best Practices Guide**
  - 권장 설정
  - 성능 최적화
  
- [ ] **Release Notes**
  - 버전별 알려진 이슈
  - 패치 정보

#### 우선순위 낮음 ⭐
- [ ] **Installation Guide**
- [ ] **Upgrade Guide**

### 2️⃣ **The Lab 내부 자료** (축적 필요)

```
✅ 현재 있는 데이터 (290건):
- 고객사: 16개
- 장애 이력: 290건
- 기간: 2025-08 ~ 2026-02

📝 추가로 수집할 데이터:
- 엔지니어 조치 이력
- 해결 방법 기록
- 소요 시간 기록
- 원인 분석 메모
```

### 3️⃣ **외부 지식 베이스**

```
- Veritas Community 포럼
- Stack Overflow
- Reddit r/sysadmin
- 기술 블로그
```

---

## 🔧 자동 복구 가능한 장애 유형

### ✅ **Level 1: 완전 자동 (승인 불필요)**

#### 1. 서비스 재시작
```python
장애: Error 25 - NetBackup service not running
AI 진단: NetBackup 서비스 정지됨
AI 조치:
  1. SSH 접속
  2. /usr/openv/netbackup/bin/bpdown -f
  3. /usr/openv/netbackup/bin/bpup -f
  4. 서비스 상태 확인
  5. 결과 리포트

성공률: 95%
소요 시간: 2분
리스크: 낮음 (안전한 작업)
```

#### 2. 로그 파일 정리
```python
장애: Error 2 - Disk full
AI 진단: 로그 디스크 용량 부족
AI 조치:
  1. /usr/openv/netbackup/logs/ 확인
  2. 7일 이상 된 로그 압축
  3. 30일 이상 된 로그 삭제
  4. 디스크 용량 재확인

성공률: 98%
소요 시간: 5분
리스크: 낮음 (로그만 삭제)
```

#### 3. 네트워크 재연결
```python
장애: Error 54 - Cannot connect to client
AI 진단: 클라이언트 네트워크 연결 끊김
AI 조치:
  1. ping 테스트
  2. 클라이언트 서비스 상태 확인
  3. 필요시 서비스 재시작
  4. 백업 재시도

성공률: 85%
소요 시간: 3분
리스크: 낮음
```

### ⚠️ **Level 2: 반자동 (승인 필요)**

#### 4. 테이프 드라이브 재설정
```python
장애: Error 196 - Tape drive error
AI 진단: 테이프 드라이브 응답 없음
AI 조치 (승인 후):
  1. 드라이브 상태 확인
  2. 드라이브 리셋 (vmchange -res)
  3. 인벤토리 업데이트
  4. 드라이브 재스캔

성공률: 70%
소요 시간: 10분
리스크: 중간 (하드웨어 조작)

승인 방식:
  Slack에서 "승인" 버튼 클릭
  → AI가 자동 실행
  → 실시간 진행 상황 알림
```

#### 5. 미디어 서버 재구성
```python
장애: Error 58 - Media server connection failed
AI 진단: 미디어 서버 연결 실패
AI 조치 (승인 후):
  1. 미디어 서버 ping 테스트
  2. NetBackup 서비스 상태 확인
  3. 방화벽 규칙 확인
  4. 연결 재설정

성공률: 75%
소요 시간: 15분
리스크: 중간
```

### 🚫 **Level 3: 수동 (가이드만 제공)**

#### 6. 데이터베이스 복구
```python
장애: Error 1 - Database error
AI 진단: NetBackup 카탈로그 손상
AI 제공:
  ✅ 상세 진단 리포트
  ✅ 단계별 복구 가이드
  ✅ 필요한 명령어 리스트
  ✅ 예상 소요 시간: 2시간
  ✅ 백업 데이터 위치
  
  ❌ 자동 실행 안 함 (위험)
  
엔지니어가 직접 실행:
  - 가이드를 보고 수동 조치
  - AI가 각 단계 검증 지원
```

---

## 🤖 AI 아키텍처

### 1️⃣ **지식 베이스 (Vector DB)**

```python
# 모든 Veritas 문서를 벡터화하여 저장
from pinecone import Pinecone

# 1. 문서 업로드 및 임베딩
documents = [
    "Error 58: 미디어 서버 연결 실패...",
    "해결 방법: 네트워크 확인 → 서비스 재시작...",
    # ... (수천 개의 문서)
]

# 2. 유사도 검색
query = "Error 58이 발생했습니다"
similar_cases = vector_db.search(query, top_k=5)

# 3. 가장 관련 있는 해결 방법 추출
solution = similar_cases[0]
```

### 2️⃣ **AI 진단 엔진 (GPT-4)**

```python
# AI에게 진단 요청
prompt = f"""
당신은 Veritas NetBackup 전문가입니다.

## 장애 정보
- 고객사: {customer_name}
- 에러 코드: {error_code}
- 에러 메시지: {error_message}
- 시작 시간: {start_time}
- 작업 유형: {job_type}

## 과거 유사 사례
{similar_cases}

## Veritas 공식 가이드
{official_guide}

다음 형식으로 분석해주세요:
1. 원인 분석 (가능성 높은 순서대로 3가지)
2. 각 원인별 해결 방안
3. 자동 복구 가능 여부
4. 예상 소요 시간
5. 리스크 평가
"""

diagnosis = gpt4.generate(prompt)
```

### 3️⃣ **자동 실행 엔진 (Ansible)**

```yaml
# Ansible Playbook
- name: Veritas NetBackup Service Restart
  hosts: "{{ customer_host }}"
  tasks:
    - name: Stop NetBackup
      shell: /usr/openv/netbackup/bin/bpdown -f
      
    - name: Wait 10 seconds
      pause:
        seconds: 10
        
    - name: Start NetBackup
      shell: /usr/openv/netbackup/bin/bpup -f
      
    - name: Verify services
      shell: /usr/openv/netbackup/bin/bpps -a
      register: service_status
      
    - name: Report result
      debug:
        msg: "{{ service_status.stdout }}"
```

### 4️⃣ **안전 장치 (Safety Checks)**

```python
class SafetyValidator:
    """위험한 작업 방지"""
    
    WHITELIST = [
        'bpup', 'bpdown',      # 서비스 시작/중지
        'bpps',                 # 상태 확인
        'vmchange -res',        # 테이프 리셋
        'bpclntcmd -clear',     # 클라이언트 캐시 클리어
    ]
    
    BLACKLIST = [
        'rm -rf',               # 파일 삭제
        'bpexpdate',            # 백업 만료
        'bpimage -cleanup',     # 이미지 삭제
        'DROP TABLE',           # DB 삭제
    ]
    
    def validate_command(self, command):
        # 화이트리스트에 있는지 확인
        if not any(cmd in command for cmd in self.WHITELIST):
            return False, "허용되지 않은 명령어"
            
        # 블랙리스트에 있는지 확인
        if any(cmd in command for cmd in self.BLACKLIST):
            return False, "위험한 명령어"
            
        return True, "안전"
```

---

## 📊 예상 성과

### 자동 해결 가능한 장애 비율

```
현재 290건 장애 분석:

Level 1 (완전 자동):
- 서비스 정지: 45건 (15.5%)
- 로그 디스크 부족: 12건 (4.1%)
- 네트워크 타임아웃: 38건 (13.1%)
소계: 95건 (32.8%) → 완전 자동 해결 가능

Level 2 (반자동):
- 테이프 오류: 28건 (9.7%)
- 미디어 서버 오류: 52건 (17.9%)
- 클라이언트 오류: 31건 (10.7%)
소계: 111건 (38.3%) → 승인 후 자동 해결

Level 3 (수동, AI 가이드):
- 카탈로그 오류: 15건 (5.2%)
- 하드웨어 장애: 23건 (7.9%)
- 기타 복잡한 장애: 46건 (15.9%)
소계: 84건 (29.0%) → 엔지니어 직접 조치

✅ 자동 해결 가능: 71.1% (206/290건)
⚠️ 수동 조치 필요: 29.0% (84/290건)
```

### ROI 계산

```
현재 (Phase 3-A):
- 장애 인지 시간: 5분
- 엔지니어 출동: 20회/월
- 평균 대응 시간: 4시간/건
- 월 비용: 400만원

Phase 4 도입 후:
- 장애 인지 시간: 5분 (동일)
- 자동 해결: 14건/월 (71%)
- 엔지니어 출동: 6회/월 (29%)
- 평균 대응 시간: 0.5시간/건 (자동)
- 월 비용: 90만원

절감 효과:
- 엔지니어 시간: 80시간 → 24시간 (70% 절감)
- 비용: 400만원 → 90만원 (77.5% 절감)
- 연간 절감: 3,720만원
```

---

## 🛠️ 개발 계획

### Phase 3-B: AI 진단 (2주)

**Week 1: 지식 베이스 구축**
```
1. Veritas 문서 수집 및 정리
2. Vector DB 구축 (Pinecone/Weaviate)
3. 문서 임베딩 및 인덱싱
4. 유사도 검색 테스트
```

**Week 2: AI 진단 모듈 개발**
```
1. GPT-4 진단 프롬프트 작성
2. 과거 사례 학습 로직
3. 해결 방안 생성 알고리즘
4. Slack 리포트 포맷 개발
```

### Phase 4: 자동 복구 (4주)

**Week 1: Ansible 플레이북 개발**
```
1. Level 1 자동 복구 플레이북 (5개)
2. SSH 연결 관리
3. 에러 핸들링
```

**Week 2: 안전 장치 구현**
```
1. 화이트리스트/블랙리스트
2. 승인 시스템 (Slack 버튼)
3. 롤백 메커니즘
4. 로깅 및 감사
```

**Week 3: Level 2 반자동 복구**
```
1. 승인 워크플로우
2. 실시간 진행 상황 알림
3. 실패 시 에스컬레이션
```

**Week 4: 테스트 및 최적화**
```
1. 각 장애 시나리오 테스트
2. 성공률 측정
3. 성능 최적화
4. 문서화
```

---

## 📝 필요한 작업

### 1️⃣ **지금 당장 (사용자)**

- [ ] Veritas 트러블슈팅 가이드 업로드
  - PDF/Word/Excel 모두 가능
  - 여러 파일 가능
  - 내부 문서도 가능

### 2️⃣ **개발 시작 전 (The Lab)**

- [ ] 서버 스펙 확인 (AI 모델 실행용)
  - GPU: 필요 없음 (API 사용)
  - CPU: 4코어 이상
  - 메모리: 8GB 이상
  - 디스크: 추가 20GB (Vector DB)

- [ ] 외부 API 계정
  - OpenAI API (GPT-4): $20/월
  - Pinecone (Vector DB): Free tier 가능

### 3️⃣ **운영 중 (지속적)**

- [ ] 조치 이력 기록
  - 각 장애별 해결 방법
  - 소요 시간
  - 엔지니어 메모

---

## 🎯 다음 단계

### 옵션 A: 지금 바로 시작
```
1. Veritas 가이드 업로드
2. Phase 3-B 개발 시작 (2주)
3. Phase 4 개발 (4주)
4. 총 6주 후 완성
```

### 옵션 B: Phase 3-A 안정화 후
```
1. 서버 업그레이드 완료
2. Phase 3-A 배포 및 테스트
3. 1개월 안정화 기간
4. Phase 3-B/4 개발 시작
```

---

## 💡 추천 방식

**단계적 접근**:
```
1. Phase 3-A 먼저 완성 (이메일 자동화)
   └─ 서버 업그레이드 → 배포 → 안정화
   
2. 데이터 수집 (1개월)
   └─ 장애 패턴 분석
   └─ 엔지니어 조치 이력 기록
   
3. Phase 3-B 개발 (AI 진단)
   └─ Veritas 가이드 학습
   └─ 진단 정확도 검증
   
4. Phase 4 개발 (자동 복구)
   └─ 간단한 장애부터 시작
   └─ 점진적 확대
```

---

**작성일**: 2026-02-16  
**작성자**: Genspark AI Assistant  
**상태**: 설계 완료, 개발 대기
