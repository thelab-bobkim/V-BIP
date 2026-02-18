#!/usr/bin/env python3
"""
V-BIP 2.3 AI 자동 분류 시스템
2,804개 NetBackup 에러코드를 AI로 자동 분류하고 DB에 적재
"""

import json
import os
import time
from datetime import datetime
from typing import Dict, List, Tuple
import openai
from openai import OpenAI

# OpenAI API 설정
client = OpenAI(api_key=os.getenv('OPENAI_API_KEY', 'sk-proj-dummy-key'))

# 분류 레벨 정의
CLASSIFICATION_LEVELS = {
    1: {
        "name": "AI 자동 해결",
        "description": "시스템이 자동으로 문제를 진단하고 해결할 수 있는 수준",
        "confidence_threshold": 85,
        "examples": [
            "서비스 재시작으로 해결 가능",
            "네트워크 연결 재설정",
            "임시 파일 정리",
            "권한 재설정",
            "프로세스 재시작"
        ]
    },
    2: {
        "name": "엔지니어 승인 필요",
        "description": "자동 해결이 가능하지만 엔지니어의 승인이 필요한 수준",
        "confidence_threshold": 60,
        "examples": [
            "설정 파일 수정",
            "데이터베이스 쿼리 실행",
            "백업 정책 변경",
            "사용자 권한 변경",
            "시스템 설정 변경"
        ]
    },
    3: {
        "name": "현장 지원 필요",
        "description": "물리적 장비 점검이나 복잡한 문제로 현장 엔지니어 지원이 필요한 수준",
        "confidence_threshold": 0,
        "examples": [
            "하드웨어 교체",
            "테이프 미디어 교체",
            "물리적 네트워크 케이블 점검",
            "서버실 환경 점검",
            "복잡한 아키텍처 재설계"
        ]
    }
}

def create_classification_prompt(error_code: str, message: str, explanation: str) -> str:
    """AI 분류를 위한 프롬프트 생성"""
    
    prompt = f"""You are an expert NetBackup engineer analyzing error codes for automatic classification.

Classify the following NetBackup error code into one of three levels:

**Error Code:** {error_code}
**Message:** {message}
**Explanation:** {explanation}

**Classification Levels:**
1. **Level 1 - AI Auto-Fix (자동 해결)**: Can be automatically resolved without human intervention
   - Service restart, network reconnection, temporary file cleanup, permission reset, process restart
   - Confidence threshold: ≥85%
   
2. **Level 2 - Engineer Approval Required (승인 필요)**: Can be resolved automatically but requires engineer approval
   - Configuration file changes, database queries, backup policy changes, user permission changes, system settings
   - Confidence threshold: 60-84%
   
3. **Level 3 - On-Site Support (현장 지원)**: Requires physical equipment inspection or complex problem-solving
   - Hardware replacement, tape media replacement, physical network cable inspection, server room environment checks, complex architecture redesign
   - Confidence threshold: <60%

**Return a JSON object with the following structure (NO markdown, NO explanation, ONLY valid JSON):**
{{
  "resolution_level": 1 or 2 or 3,
  "ai_confidence_score": 0-100,
  "classification_reason": "Korean explanation (50-200 characters)",
  "category": "one of: 네트워크, 서비스, 권한, 미디어, 하드웨어, 설정, 데이터베이스, 백업정책, 시스템리소스, 기타",
  "subcategory": "specific subcategory",
  "auto_fix_enabled": true or false,
  "auto_fix_script": "bash script or null",
  "estimated_resolution_time": minutes (integer),
  "severity_level": "Critical" or "High" or "Medium" or "Low"
}}

Analyze carefully and provide accurate classification based on the error's nature and resolution complexity."""
    
    return prompt

def classify_error_with_ai(error_code: str, message: str, explanation: str) -> Dict:
    """OpenAI API를 사용하여 에러코드 분류"""
    
    try:
        prompt = create_classification_prompt(error_code, message, explanation)
        
        response = client.chat.completions.create(
            model="gpt-4o-mini",  # 빠르고 저렴한 모델
            messages=[
                {"role": "system", "content": "You are a NetBackup expert. Return ONLY valid JSON, no markdown."},
                {"role": "user", "content": prompt}
            ],
            temperature=0.3,  # 일관성 있는 결과를 위해 낮은 temperature
            max_tokens=500
        )
        
        result_text = response.choices[0].message.content.strip()
        
        # Remove markdown code blocks if present
        if result_text.startswith("```json"):
            result_text = result_text[7:]
        if result_text.startswith("```"):
            result_text = result_text[3:]
        if result_text.endswith("```"):
            result_text = result_text[:-3]
        
        result_text = result_text.strip()
        
        classification = json.loads(result_text)
        
        # Validate and set defaults
        classification.setdefault('resolution_level', 2)
        classification.setdefault('ai_confidence_score', 70)
        classification.setdefault('classification_reason', '자동 분류 완료')
        classification.setdefault('category', '기타')
        classification.setdefault('subcategory', '일반')
        classification.setdefault('auto_fix_enabled', False)
        classification.setdefault('auto_fix_script', None)
        classification.setdefault('estimated_resolution_time', 30)
        classification.setdefault('severity_level', 'Medium')
        
        return classification
        
    except json.JSONDecodeError as e:
        print(f"⚠️  JSON 파싱 오류 (에러코드 {error_code}): {e}")
        return create_fallback_classification(error_code, message)
    except Exception as e:
        print(f"⚠️  분류 오류 (에러코드 {error_code}): {e}")
        return create_fallback_classification(error_code, message)

def create_fallback_classification(error_code: str, message: str) -> Dict:
    """AI 분류 실패 시 폴백 분류"""
    
    # 간단한 키워드 기반 분류
    message_lower = message.lower()
    
    if any(kw in message_lower for kw in ['restart', 'reconnect', 'retry', 'timeout', 'connection']):
        level = 1
        confidence = 75
        reason = "네트워크 또는 서비스 재시작 관련 오류"
        category = "네트워크"
    elif any(kw in message_lower for kw in ['permission', 'denied', 'access', 'authentication']):
        level = 2
        confidence = 70
        reason = "권한 또는 접근 제어 관련 오류"
        category = "권한"
    elif any(kw in message_lower for kw in ['hardware', 'device', 'tape', 'drive', 'media']):
        level = 3
        confidence = 65
        reason = "하드웨어 또는 미디어 관련 오류"
        category = "하드웨어"
    else:
        level = 2
        confidence = 60
        reason = "일반적인 오류, 엔지니어 검토 필요"
        category = "기타"
    
    return {
        'resolution_level': level,
        'ai_confidence_score': confidence,
        'classification_reason': reason,
        'category': category,
        'subcategory': '일반',
        'auto_fix_enabled': False,
        'auto_fix_script': None,
        'estimated_resolution_time': 30,
        'severity_level': 'Medium'
    }

def classify_all_errors_batch(input_file: str, output_file: str, batch_size: int = 10):
    """모든 에러코드를 배치로 분류"""
    
    print("🚀 V-BIP 2.3 AI 에러코드 자동 분류 시작...")
    print(f"📂 입력 파일: {input_file}")
    print(f"💾 출력 파일: {output_file}")
    print(f"📦 배치 크기: {batch_size}\n")
    
    # Load error codes
    with open(input_file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    error_codes = data['error_codes']
    total_codes = len(error_codes)
    
    print(f"✅ {total_codes}개 에러코드 로드 완료\n")
    
    classified_errors = []
    
    # Statistics
    stats = {
        'total': total_codes,
        'level_1': 0,
        'level_2': 0,
        'level_3': 0,
        'auto_fix_enabled': 0,
        'avg_confidence': 0,
        'processing_time': 0
    }
    
    start_time = time.time()
    
    for idx, error in enumerate(error_codes, 1):
        code = error['code']
        message = error.get('message', '')
        explanation = error.get('explanation', '')
        
        print(f"[{idx}/{total_codes}] 분류 중: 에러코드 {code}...", end=' ')
        
        try:
            classification = classify_error_with_ai(code, message, explanation)
            
            # Merge classification with original error data
            classified_error = {
                **error,
                **classification,
                'classified_at': datetime.now().isoformat()
            }
            
            classified_errors.append(classified_error)
            
            # Update statistics
            level = classification['resolution_level']
            if level == 1:
                stats['level_1'] += 1
            elif level == 2:
                stats['level_2'] += 1
            elif level == 3:
                stats['level_3'] += 1
            
            if classification['auto_fix_enabled']:
                stats['auto_fix_enabled'] += 1
            
            stats['avg_confidence'] += classification['ai_confidence_score']
            
            print(f"✅ Level {level} (신뢰도 {classification['ai_confidence_score']}%)")
            
            # Rate limiting: 10 requests per minute for gpt-4o-mini
            if idx % batch_size == 0:
                print(f"\n⏸️  배치 {idx}/{total_codes} 완료, 60초 대기 중...\n")
                time.sleep(60)  # Wait 1 minute between batches
            else:
                time.sleep(1)  # Small delay between requests
            
        except KeyboardInterrupt:
            print("\n\n⚠️  사용자 중단. 현재까지 분류된 데이터 저장 중...")
            break
        except Exception as e:
            print(f"❌ 오류: {e}")
            continue
    
    # Calculate final statistics
    stats['processing_time'] = time.time() - start_time
    stats['avg_confidence'] = stats['avg_confidence'] / len(classified_errors) if classified_errors else 0
    
    # Save classified errors
    output_data = {
        'classified_at': datetime.now().isoformat(),
        'total_classified': len(classified_errors),
        'statistics': stats,
        'classified_errors': classified_errors
    }
    
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(output_data, f, ensure_ascii=False, indent=2)
    
    print(f"\n{'='*70}")
    print(f"✅ AI 자동 분류 완료!")
    print(f"{'='*70}")
    print(f"📊 통계:")
    print(f"  - 총 분류: {len(classified_errors)}/{total_codes}개")
    print(f"  - Level 1 (AI 자동 해결): {stats['level_1']}개 ({stats['level_1']/len(classified_errors)*100:.1f}%)")
    print(f"  - Level 2 (엔지니어 승인): {stats['level_2']}개 ({stats['level_2']/len(classified_errors)*100:.1f}%)")
    print(f"  - Level 3 (현장 지원): {stats['level_3']}개 ({stats['level_3']/len(classified_errors)*100:.1f}%)")
    print(f"  - 자동 수정 가능: {stats['auto_fix_enabled']}개 ({stats['auto_fix_enabled']/len(classified_errors)*100:.1f}%)")
    print(f"  - 평균 신뢰도: {stats['avg_confidence']:.1f}%")
    print(f"  - 처리 시간: {stats['processing_time']/60:.1f}분")
    print(f"{'='*70}\n")

if __name__ == '__main__':
    INPUT_FILE = '/home/user/V-BIP/extracted_all_error_codes.json'
    OUTPUT_FILE = '/home/user/V-BIP/classified_all_errors_ai.json'
    
    classify_all_errors_batch(INPUT_FILE, OUTPUT_FILE, batch_size=10)
