#!/usr/bin/env python3
"""
V-BIP 2.3 AI 진단 엔진 (경량화 버전)
OpenAI API 없이도 작동하는 키워드 기반 + 규칙 기반 진단
"""

import re
from typing import Dict, List, Any, Optional, Tuple
from datetime import datetime
import psycopg2
from psycopg2.extras import RealDictCursor

# 데이터베이스 연결 설정
DB_CONFIG = {
    'host': 'localhost',
    'port': 5432,
    'database': 'vbip',
    'user': 'vbip_user',
    'password': 'vbip_password_2024'
}

class LightweightDiagnosisEngine:
    """경량화 AI 진단 엔진 (OpenAI 불필요)"""
    
    def __init__(self):
        """초기화"""
        self.auto_fix_keywords = [
            'restart', 'retry', 'refresh', 'clear cache', 'reconnect',
            'temporary', 'transient', 'timeout', 'network glitch',
            'file lock', 'permission', 'disk space', 'memory',
            'socket', 'connection', 'service', 'process'
        ]
        
        self.engineer_keywords = [
            'configuration', 'policy', 'settings', 'database',
            'credentials', 'authentication', 'certificate', 'license',
            'media server', 'storage', 'backup window', 'schedule',
            'pool', 'allocation', 'quota', 'threshold'
        ]
        
        self.onsite_keywords = [
            'hardware', 'tape', 'robot', 'physical', 'drive',
            'fibre channel', 'san', 'appliance', 'replacement',
            'failed device', 'critical', 'disaster recovery',
            'corrupted', 'damaged', 'incompatible'
        ]
        
        print("✅ LightweightDiagnosisEngine 초기화 완료")
    
    def get_db_connection(self):
        """데이터베이스 연결"""
        return psycopg2.connect(**DB_CONFIG, cursor_factory=RealDictCursor)
    
    def extract_error_code(self, error_message: str) -> Optional[str]:
        """
        에러 메시지에서 에러 코드 추출
        
        Args:
            error_message: 에러 메시지
            
        Returns:
            에러 코드 (추출 실패 시 None)
        """
        patterns = [
            r'error\s+code\s+(\d+)',
            r'error\s+(\d+)',
            r'code\s+(\d+)',
            r'status\s+code\s+(\d+)',
            r'exit\s+status\s+(\d+)',
            r'NBU\s+(\d+)'
        ]
        
        for pattern in patterns:
            match = re.search(pattern, error_message, re.IGNORECASE)
            if match:
                return match.group(1)
        
        return None
    
    def classify_error(self, error_code: str, error_message: str, error_description: str = "") -> Dict[str, Any]:
        """
        에러 자동 분류
        
        Args:
            error_code: 에러 코드
            error_message: 에러 메시지
            error_description: 에러 설명 (선택)
            
        Returns:
            분류 결과
        """
        # 데이터베이스에서 기존 분류 확인
        conn = self.get_db_connection()
        cur = conn.cursor()
        
        cur.execute("""
            SELECT 
                error_code, error_name, resolution_level,
                ai_confidence_score, classification_reason,
                auto_fix_enabled, auto_fix_script
            FROM error_patterns
            WHERE error_code = %s
        """, (error_code,))
        
        existing = cur.fetchone()
        cur.close()
        conn.close()
        
        if existing:
            return {
                'error_code': existing['error_code'],
                'error_name': existing['error_name'],
                'resolution_level': existing['resolution_level'],
                'ai_confidence_score': float(existing['ai_confidence_score']) if existing['ai_confidence_score'] else 0,
                'classification_reason': existing['classification_reason'],
                'auto_fix_enabled': existing['auto_fix_enabled'],
                'auto_fix_script': existing['auto_fix_script'],
                'source': 'database'
            }
        
        # 키워드 기반 분류
        combined_text = f"{error_message} {error_description}".lower()
        
        auto_score = sum(1 for kw in self.auto_fix_keywords if kw in combined_text)
        engineer_score = sum(1 for kw in self.engineer_keywords if kw in combined_text)
        onsite_score = sum(1 for kw in self.onsite_keywords if kw in combined_text)
        
        # 점수 기반 분류
        scores = {1: auto_score, 2: engineer_score, 3: onsite_score}
        resolution_level = max(scores, key=scores.get)
        
        # 신뢰도 계산
        max_score = max(auto_score, engineer_score, onsite_score)
        if max_score == 0:
            confidence = 50.0  # 키워드 없으면 중간값
            resolution_level = 2  # 기본값: 엔지니어 승인
        else:
            confidence = min(60 + max_score * 8, 95)
        
        # 분류 근거
        reasons = {
            1: f"자동 해결 키워드 {auto_score}개 감지: 자동 재시도 가능",
            2: f"엔지니어 확인 키워드 {engineer_score}개 감지: 설정 변경 필요",
            3: f"온사이트 키워드 {onsite_score}개 감지: 현장 점검 필요"
        }
        
        if max_score == 0:
            reason = "키워드 매칭 없음: 엔지니어 검토 권장"
        else:
            reason = reasons[resolution_level]
        
        return {
            'error_code': error_code,
            'error_name': 'Unknown',
            'resolution_level': resolution_level,
            'ai_confidence_score': confidence,
            'classification_reason': reason,
            'auto_fix_enabled': False,
            'auto_fix_script': None,
            'source': 'ai_classification',
            'keyword_scores': {
                'auto_fix': auto_score,
                'engineer': engineer_score,
                'onsite': onsite_score
            }
        }
    
    def diagnose(self, error_log: str) -> Dict[str, Any]:
        """
        에러 로그 진단
        
        Args:
            error_log: 에러 로그 텍스트
            
        Returns:
            진단 결과
        """
        # 에러 코드 추출
        error_code = self.extract_error_code(error_log)
        
        if not error_code:
            return {
                'success': False,
                'message': '에러 코드를 찾을 수 없습니다',
                'error_log': error_log[:200]
            }
        
        # 에러 분류
        classification = self.classify_error(error_code, error_log, error_log)
        
        # 권장 조치 생성
        recommended_actions = self._generate_recommended_actions(classification)
        
        # 진단 결과
        return {
            'success': True,
            'error_code': error_code,
            'classification': classification,
            'recommended_actions': recommended_actions,
            'diagnosis_time': datetime.now().isoformat(),
            'can_auto_fix': classification['resolution_level'] == 1 and classification['ai_confidence_score'] >= 85
        }
    
    def _generate_recommended_actions(self, classification: Dict[str, Any]) -> List[str]:
        """권장 조치 생성"""
        level = classification['resolution_level']
        
        actions = {
            1: [
                "1. 서비스 재시작 시도",
                "2. 네트워크 연결 확인",
                "3. 시스템 리소스 확인 (CPU, 메모리, 디스크)",
                "4. 로그 파일 확인",
                "5. 자동 복구 스크립트 실행 가능"
            ],
            2: [
                "1. 에러 로그 상세 분석",
                "2. 설정 파일 검토",
                "3. 권한 및 인증 정보 확인",
                "4. 백업 정책 및 스케줄 검토",
                "5. 엔지니어 승인 후 설정 변경"
            ],
            3: [
                "1. 하드웨어 상태 점검",
                "2. 물리적 연결 확인 (케이블, 포트)",
                "3. 미디어/테이프 상태 확인",
                "4. 스토리지 디바이스 진단",
                "5. 온사이트 엔지니어 방문 필요"
            ]
        }
        
        return actions.get(level, ["엔지니어 검토 필요"])
    
    def get_similar_cases(self, error_code: str, limit: int = 5) -> List[Dict[str, Any]]:
        """
        유사한 이전 사례 조회
        
        Args:
            error_code: 에러 코드
            limit: 최대 결과 수
            
        Returns:
            유사 사례 리스트
        """
        conn = self.get_db_connection()
        cur = conn.cursor()
        
        cur.execute("""
            SELECT 
                i.incident_number,
                i.status,
                i.resolution_method,
                i.resolution_time_minutes,
                i.ai_auto_fix_success,
                i.detected_at,
                i.resolved_at,
                c.customer_name
            FROM incidents i
            LEFT JOIN customers c ON i.customer_id = c.customer_id
            WHERE i.error_code = %s
              AND i.status IN ('resolved', 'closed')
            ORDER BY i.detected_at DESC
            LIMIT %s
        """, (error_code, limit))
        
        cases = cur.fetchall()
        cur.close()
        conn.close()
        
        return cases
    
    def save_classification(self, error_code: str, classification: Dict[str, Any]) -> bool:
        """
        분류 결과를 데이터베이스에 저장
        
        Args:
            error_code: 에러 코드
            classification: 분류 결과
            
        Returns:
            성공 여부
        """
        try:
            conn = self.get_db_connection()
            cur = conn.cursor()
            
            cur.execute("""
                UPDATE error_patterns
                SET 
                    resolution_level = %s,
                    ai_confidence_score = %s,
                    classification_reason = %s,
                    is_ai_classified = TRUE,
                    last_ai_analysis_at = CURRENT_TIMESTAMP
                WHERE error_code = %s
            """, (
                classification['resolution_level'],
                classification['ai_confidence_score'],
                classification['classification_reason'],
                error_code
            ))
            
            conn.commit()
            cur.close()
            conn.close()
            return True
        except Exception as e:
            print(f"❌ 분류 저장 실패: {e}")
            return False


# 싱글톤 인스턴스
_engine = None

def get_diagnosis_engine():
    """진단 엔진 싱글톤"""
    global _engine
    if _engine is None:
        _engine = LightweightDiagnosisEngine()
    return _engine


if __name__ == "__main__":
    # 테스트
    engine = LightweightDiagnosisEngine()
    
    # 테스트 1: 에러 코드 84
    test_log = "NetBackup error 84: Media Manager is not running on the server"
    result = engine.diagnose(test_log)
    
    print("=" * 60)
    print("진단 결과:")
    print(f"  에러 코드: {result['error_code']}")
    print(f"  분류 레벨: Level {result['classification']['resolution_level']}")
    print(f"  신뢰도: {result['classification']['ai_confidence_score']}%")
    print(f"  자동 수정 가능: {result['can_auto_fix']}")
    print(f"  권장 조치:")
    for action in result['recommended_actions']:
        print(f"    {action}")
    print("=" * 60)
