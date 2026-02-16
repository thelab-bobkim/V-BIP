"""
V-BIP Phase 3-B: AI Diagnosis Engine
AI 기반 NetBackup 장애 진단 엔진
"""

import json
import re
from typing import Dict, List, Any, Optional
from datetime import datetime

try:
    from openai import OpenAI
    from langchain_community.vectorstores import Chroma
    from langchain_openai import OpenAIEmbeddings
    from loguru import logger
except ImportError as e:
    print(f"⚠️ 필요한 라이브러리를 설치하세요: {e}")

from config_ai import AIConfig


class DiagnosisEngine:
    """AI 기반 장애 진단 엔진"""
    
    def __init__(self, vectorstore_path: Optional[str] = None):
        """
        Args:
            vectorstore_path: Vector Store 경로 (None이면 기본값 사용)
        """
        self.config = AIConfig
        self.client = OpenAI(api_key=self.config.OPENAI_API_KEY)
        
        # Vector Store 로드
        self.embeddings = OpenAIEmbeddings(
            model=self.config.EMBEDDING_MODEL,
            openai_api_key=self.config.OPENAI_API_KEY
        )
        
        persist_dir = vectorstore_path or self.config.CHROMA_PERSIST_DIR
        self.vectorstore = Chroma(
            collection_name=self.config.CHROMA_COLLECTION_NAME,
            embedding_function=self.embeddings,
            persist_directory=persist_dir
        )
        
        logger.info("✅ DiagnosisEngine 초기화 완료")
    
    def extract_error_code(self, error_message: str) -> Optional[str]:
        """
        에러 메시지에서 에러 코드 추출
        
        Args:
            error_message: 에러 메시지
            
        Returns:
            에러 코드 (추출 실패 시 None)
        """
        # 패턴: "Error 84", "error code 13", "status 48" 등
        patterns = [
            r'error\s+(\d+)',
            r'code\s+(\d+)',
            r'status\s+(\d+)',
            r'exit\s+status\s+(\d+)'
        ]
        
        for pattern in patterns:
            match = re.search(pattern, error_message, re.IGNORECASE)
            if match:
                return match.group(1)
        
        return None
    
    def get_error_code_info(self, error_code: str) -> Optional[Dict[str, Any]]:
        """
        에러 코드 정보 조회
        
        Args:
            error_code: 에러 코드
            
        Returns:
            에러 코드 정보 (없으면 None)
        """
        return self.config.ERROR_CODE_MAP.get(error_code)
    
    def search_knowledge_base(self, query: str, k: int = None) -> List[Dict[str, Any]]:
        """
        지식 베이스 검색
        
        Args:
            query: 검색 쿼리
            k: 결과 개수 (None이면 config 기본값)
            
        Returns:
            검색 결과 리스트
        """
        k = k or self.config.TOP_K_RESULTS
        
        try:
            results = self.vectorstore.similarity_search_with_score(query, k=k)
            
            formatted_results = []
            for doc, score in results:
                # Score를 similarity로 변환 (낮을수록 유사)
                similarity = 1.0 - min(score, 1.0)
                
                if similarity >= self.config.SIMILARITY_THRESHOLD:
                    formatted_results.append({
                        'content': doc.page_content,
                        'metadata': doc.metadata,
                        'similarity': round(similarity, 3)
                    })
            
            return formatted_results
            
        except Exception as e:
            logger.error(f"지식 베이스 검색 실패: {e}")
            return []
    
    def build_diagnosis_prompt(
        self,
        error_code: str,
        error_message: str,
        customer_name: str,
        occurrence_time: str,
        backup_policy: str,
        knowledge_context: List[Dict[str, Any]]
    ) -> str:
        """
        진단 프롬프트 생성
        
        Args:
            error_code: 에러 코드
            error_message: 에러 메시지
            customer_name: 고객사명
            occurrence_time: 발생 시간
            backup_policy: 백업 정책
            knowledge_context: 지식 베이스 검색 결과
            
        Returns:
            완성된 프롬프트
        """
        # 지식 베이스 컨텍스트 포맷팅
        kb_text = "\n\n".join([
            f"**참고 문서 {idx+1}** (유사도: {item['similarity']})\n"
            f"출처: {item['metadata'].get('source', 'Unknown')} (페이지 {item['metadata'].get('page', 'N/A')})\n"
            f"{item['content'][:500]}..."
            for idx, item in enumerate(knowledge_context[:3])
        ])
        
        if not kb_text:
            kb_text = "관련 문서를 찾지 못했습니다."
        
        # 에러 코드 정보 추가
        error_info = self.get_error_code_info(error_code)
        if error_info:
            kb_text = f"**에러 코드 {error_code} 정보**\n" \
                     f"이름: {error_info['name']}\n" \
                     f"카테고리: {error_info['category']}\n" \
                     f"일반적인 원인:\n" + \
                     "\n".join([f"  - {cause}" for cause in error_info['common_causes']]) + \
                     f"\n\n일반적인 해결 방법:\n" + \
                     "\n".join([f"  - {sol}" for sol in error_info['typical_solutions']]) + \
                     f"\n\n{kb_text}"
        
        prompt = self.config.DIAGNOSIS_PROMPT_TEMPLATE.format(
            error_code=error_code,
            error_message=error_message,
            customer_name=customer_name,
            occurrence_time=occurrence_time,
            backup_policy=backup_policy,
            knowledge_base_context=kb_text
        )
        
        return prompt
    
    def diagnose(
        self,
        error_code: Optional[str],
        error_message: str,
        customer_name: str = "Unknown",
        occurrence_time: Optional[str] = None,
        backup_policy: str = "Unknown"
    ) -> Dict[str, Any]:
        """
        장애 진단 수행
        
        Args:
            error_code: 에러 코드 (없으면 메시지에서 추출 시도)
            error_message: 에러 메시지
            customer_name: 고객사명
            occurrence_time: 발생 시간
            backup_policy: 백업 정책
            
        Returns:
            진단 결과 (JSON)
        """
        logger.info("=" * 60)
        logger.info("🔍 AI 진단 시작")
        logger.info("=" * 60)
        
        # 1. 에러 코드 추출
        if not error_code:
            error_code = self.extract_error_code(error_message)
            if error_code:
                logger.info(f"✅ 에러 코드 추출: {error_code}")
            else:
                logger.warning("⚠️ 에러 코드를 찾을 수 없습니다.")
                error_code = "Unknown"
        
        # 2. 지식 베이스 검색
        search_query = f"Error {error_code} {error_message}"
        logger.info(f"📚 지식 베이스 검색 중...")
        knowledge_context = self.search_knowledge_base(search_query)
        logger.info(f"   찾은 관련 문서: {len(knowledge_context)}개")
        
        # 3. 프롬프트 생성
        if not occurrence_time:
            occurrence_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        prompt = self.build_diagnosis_prompt(
            error_code=error_code,
            error_message=error_message,
            customer_name=customer_name,
            occurrence_time=occurrence_time,
            backup_policy=backup_policy,
            knowledge_context=knowledge_context
        )
        
        # 4. AI 진단 실행
        logger.info("🤖 AI 분석 중...")
        try:
            response = self.client.chat.completions.create(
                model=self.config.OPENAI_MODEL,
                messages=[
                    {
                        "role": "system",
                        "content": "당신은 Veritas NetBackup 전문가입니다. 장애를 분석하고 해결 방안을 JSON 형식으로 제공합니다."
                    },
                    {
                        "role": "user",
                        "content": prompt
                    }
                ],
                temperature=self.config.OPENAI_TEMPERATURE,
                max_tokens=self.config.OPENAI_MAX_TOKENS,
                response_format={"type": "json_object"}
            )
            
            diagnosis_text = response.choices[0].message.content
            diagnosis_result = json.loads(diagnosis_text)
            
            # 5. 결과 후처리
            diagnosis_result['metadata'] = {
                'error_code': error_code,
                'customer_name': customer_name,
                'occurrence_time': occurrence_time,
                'diagnosis_time': datetime.now().isoformat(),
                'model': self.config.OPENAI_MODEL,
                'knowledge_sources': len(knowledge_context)
            }
            
            # 자동화 레벨 결정
            automation_level = self._determine_automation_level(diagnosis_result)
            diagnosis_result['automation_level'] = automation_level
            
            logger.success("✅ 진단 완료!")
            logger.info(f"   자동화 레벨: {automation_level}")
            logger.info(f"   신뢰도: {diagnosis_result.get('신뢰도', 'N/A')}")
            
            return diagnosis_result
            
        except Exception as e:
            logger.error(f"❌ AI 진단 실패: {e}")
            return self._create_fallback_diagnosis(error_code, error_message)
    
    def _determine_automation_level(self, diagnosis: Dict[str, Any]) -> str:
        """
        진단 결과로부터 자동화 레벨 결정
        
        Args:
            diagnosis: 진단 결과
            
        Returns:
            'LEVEL_1', 'LEVEL_2', 'LEVEL_3' 중 하나
        """
        confidence = diagnosis.get('신뢰도', 0.0)
        risk_score = diagnosis.get('위험도', 10)
        
        # AI가 제시한 레벨 우선 사용
        if '자동화_레벨' in diagnosis or 'automation_level' in diagnosis:
            suggested_level = diagnosis.get('자동화_레벨') or diagnosis.get('automation_level')
            if suggested_level in ['LEVEL_1', 'LEVEL_2', 'LEVEL_3']:
                return suggested_level
        
        # 규칙 기반 결정
        for level_name, level_config in self.config.AUTOMATION_LEVELS.items():
            if (confidence >= level_config['confidence_threshold'] and
                risk_score <= level_config['risk_score_max']):
                return level_name
        
        # 기본값
        return 'LEVEL_3'
    
    def _create_fallback_diagnosis(self, error_code: str, error_message: str) -> Dict[str, Any]:
        """AI 진단 실패 시 기본 진단 결과 생성"""
        error_info = self.get_error_code_info(error_code)
        
        if error_info:
            return {
                '원인_분석': error_info['common_causes'],
                '해결_방안': error_info['typical_solutions'],
                '자동화_레벨': error_info['automation_level'],
                '신뢰도': 0.6,
                '위험도': 5,
                '예상_소요_시간': '10-30분',
                'metadata': {
                    'error_code': error_code,
                    'fallback': True,
                    'source': 'error_code_map'
                }
            }
        else:
            return {
                '원인_분석': ['알 수 없는 에러입니다.'],
                '해결_방안': [
                    'NetBackup 로그 확인',
                    '고객사 담당자와 상황 공유',
                    'Veritas 기술 지원 문의'
                ],
                '자동화_레벨': 'LEVEL_3',
                '신뢰도': 0.3,
                '위험도': 8,
                '예상_소요_시간': '60분 이상',
                'metadata': {
                    'error_code': error_code,
                    'fallback': True,
                    'unknown_error': True
                }
            }
    
    def format_diagnosis_for_slack(self, diagnosis: Dict[str, Any]) -> str:
        """Slack 알림용 진단 결과 포맷팅"""
        metadata = diagnosis.get('metadata', {})
        automation_level = diagnosis.get('automation_level', 'LEVEL_3')
        level_config = self.config.AUTOMATION_LEVELS.get(automation_level, {})
        
        message = f"""
🔍 **AI 진단 결과**

**고객사:** {metadata.get('customer_name', 'Unknown')}
**에러 코드:** {metadata.get('error_code', 'Unknown')}
**발생 시간:** {metadata.get('occurrence_time', 'Unknown')}

**📊 진단 정보**
• 신뢰도: {diagnosis.get('신뢰도', 'N/A')} / 1.0
• 위험도: {diagnosis.get('위험도', 'N/A')} / 10
• 예상 소요 시간: {diagnosis.get('예상_소요_시간', 'N/A')}
• 자동화 레벨: {automation_level} - {level_config.get('name', 'Unknown')}

**🔎 원인 분석**
"""
        
        causes = diagnosis.get('원인_분석', [])
        for idx, cause in enumerate(causes[:3], 1):
            message += f"{idx}. {cause}\n"
        
        message += "\n**💡 해결 방안**\n"
        solutions = diagnosis.get('해결_방안', [])
        for idx, solution in enumerate(solutions[:3], 1):
            message += f"{idx}. {solution}\n"
        
        if automation_level == 'LEVEL_1':
            message += "\n✅ **자동 복구를 시작합니다.**"
        elif automation_level == 'LEVEL_2':
            message += "\n⚠️ **승인 후 자동 복구를 진행합니다.**"
        else:
            message += "\n📋 **엔지니어 조치가 필요합니다.**"
        
        return message.strip()


def main():
    """테스트 실행"""
    
    # 설정 검증
    if not AIConfig.validate():
        return
    
    # 진단 엔진 초기화
    try:
        engine = DiagnosisEngine()
    except Exception as e:
        logger.error(f"❌ 진단 엔진 초기화 실패: {e}")
        logger.info("먼저 knowledge_builder.py를 실행하여 지식 베이스를 구축하세요.")
        return
    
    # 테스트 케이스
    test_cases = [
        {
            'error_code': '83',
            'error_message': 'Media open error on tape drive /dev/nst0',
            'customer_name': '서울우유본사',
            'backup_policy': 'Daily_Full_Backup'
        },
        {
            'error_code': None,  # 메시지에서 추출 테스트
            'error_message': 'Backup failed with error 13: File read failed',
            'customer_name': '동국제약',
            'backup_policy': 'Incremental_Backup'
        }
    ]
    
    for idx, test_case in enumerate(test_cases, 1):
        logger.info(f"\n{'=' * 60}")
        logger.info(f"테스트 케이스 {idx}")
        logger.info(f"{'=' * 60}\n")
        
        result = engine.diagnose(**test_case)
        
        print("\n📄 진단 결과 (JSON):")
        print(json.dumps(result, indent=2, ensure_ascii=False))
        
        print("\n📱 Slack 메시지:")
        print(engine.format_diagnosis_for_slack(result))
        
        print("\n")


if __name__ == "__main__":
    main()
