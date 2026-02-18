#!/usr/bin/env python3
"""
샘플 100개 에러코드 AI 분류 (빠른 검증용)
"""

import json
import sys

# Import main classifier
sys.path.append('/home/user/V-BIP')
from classify_all_errors_ai import classify_error_with_ai, create_fallback_classification
import time
from datetime import datetime

def classify_sample_100(input_file: str, output_file: str, sample_size: int = 100):
    """샘플 100개 에러코드 분류"""
    
    print(f"🚀 샘플 {sample_size}개 에러코드 AI 분류 시작...\n")
    
    # Load error codes
    with open(input_file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    error_codes = data['error_codes'][:sample_size]  # 처음 100개만
    
    print(f"✅ {len(error_codes)}개 에러코드 로드 완료\n")
    
    classified_errors = []
    stats = {
        'total': len(error_codes),
        'level_1': 0,
        'level_2': 0,
        'level_3': 0,
        'auto_fix_enabled': 0,
        'avg_confidence': 0
    }
    
    for idx, error in enumerate(error_codes, 1):
        code = error['code']
        message = error.get('message', '')
        explanation = error.get('explanation', '')
        
        print(f"[{idx}/{len(error_codes)}] 분류 중: 에러코드 {code}...", end=' ')
        
        try:
            classification = classify_error_with_ai(code, message, explanation)
            
            classified_error = {
                **error,
                **classification,
                'classified_at': datetime.now().isoformat()
            }
            
            classified_errors.append(classified_error)
            
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
            
            time.sleep(2)  # 2초 대기 (분당 30개 속도)
            
        except Exception as e:
            print(f"❌ 오류: {e}")
            continue
    
    # Calculate statistics
    stats['avg_confidence'] = stats['avg_confidence'] / len(classified_errors) if classified_errors else 0
    
    # Save results
    output_data = {
        'classified_at': datetime.now().isoformat(),
        'total_classified': len(classified_errors),
        'statistics': stats,
        'classified_errors': classified_errors
    }
    
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(output_data, f, ensure_ascii=False, indent=2)
    
    print(f"\n{'='*70}")
    print(f"✅ 샘플 분류 완료!")
    print(f"{'='*70}")
    print(f"📊 통계:")
    print(f"  - 총 분류: {len(classified_errors)}개")
    print(f"  - Level 1 (AI 자동 해결): {stats['level_1']}개 ({stats['level_1']/len(classified_errors)*100:.1f}%)")
    print(f"  - Level 2 (엔지니어 승인): {stats['level_2']}개 ({stats['level_2']/len(classified_errors)*100:.1f}%)")
    print(f"  - Level 3 (현장 지원): {stats['level_3']}개 ({stats['level_3']/len(classified_errors)*100:.1f}%)")
    print(f"  - 자동 수정 가능: {stats['auto_fix_enabled']}개 ({stats['auto_fix_enabled']/len(classified_errors)*100:.1f}%)")
    print(f"  - 평균 신뢰도: {stats['avg_confidence']:.1f}%")
    print(f"{'='*70}\n")

if __name__ == '__main__':
    INPUT_FILE = '/home/user/V-BIP/extracted_all_error_codes.json'
    OUTPUT_FILE = '/home/user/V-BIP/classified_sample_100.json'
    
    classify_sample_100(INPUT_FILE, OUTPUT_FILE, sample_size=100)
