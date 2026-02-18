#!/usr/bin/env python3
"""
V-BIP 2.3 키워드 기반 에러코드 자동 분류 시스템
OpenAI API 없이도 작동하는 규칙 기반 분류 (2,804개 전체 처리 가능)
"""

import json
import re
from datetime import datetime
from typing import Dict, List

# 분류 규칙 정의
CLASSIFICATION_RULES = {
    'Level 1': {
        'keywords': [
            # 네트워크 관련
            'connection', 'connect', 'reconnect', 'timeout', 'network', 'socket',
            'retry', 'failed to connect', 'connection refused', 'host',
            # 서비스 관련
            'restart', 'service', 'daemon', 'not running', 'not started',
            'bprdm', 'bpdbm', 'nbsl', 'nbemm', 'vnetd', 'pbx',
            # 프로세스 관련
            'process', 'pid', 'kill', 'hung', 'zombie',
            # 임시 파일
            'temp', 'temporary', 'cleanup', 'remove', 'delete',
            # 간단한 오류
            'retry successful', 'recoverable', 'transient'
        ],
        'confidence': 80,
        'category': '네트워크',
        'auto_fix_enabled': True
    },
    'Level 2': {
        'keywords': [
            # 설정 관련
            'configuration', 'config', 'setting', 'parameter', 'option',
            'policy', 'schedule', 'backup policy',
            # 권한 관련
            'permission', 'denied', 'access', 'authentication', 'authorization',
            'credential', 'login', 'password', 'certificate',
            # 데이터베이스
            'database', 'catalog', 'image', 'metadata',
            # 백업 정책
            'retention', 'expiration', 'schedule change'
        ],
        'confidence': 70,
        'category': '설정',
        'auto_fix_enabled': False
    },
    'Level 3': {
        'keywords': [
            # 하드웨어
            'hardware', 'device', 'tape', 'drive', 'media', 'robot',
            'library', 'mount', 'unmount', 'load', 'unload',
            # 물리적 오류
            'physical', 'replace', 'broken', 'damaged', 'faulty',
            # 복잡한 문제
            'architecture', 'design', 'infrastructure', 'capacity',
            'full', 'disk full', 'out of space', 'insufficient'
        ],
        'confidence': 65,
        'category': '하드웨어',
        'auto_fix_enabled': False
    }
}

# 카테고리 키워드
CATEGORY_KEYWORDS = {
    '네트워크': ['network', 'connection', 'socket', 'host', 'timeout', 'dns', 'firewall'],
    '서비스': ['service', 'daemon', 'process', 'restart', 'running', 'started'],
    '권한': ['permission', 'access', 'denied', 'authentication', 'credential', 'login'],
    '미디어': ['tape', 'media', 'drive', 'robot', 'library', 'mount'],
    '하드웨어': ['hardware', 'device', 'disk', 'storage', 'memory', 'cpu'],
    '설정': ['configuration', 'config', 'policy', 'schedule', 'setting', 'parameter'],
    '데이터베이스': ['database', 'catalog', 'image', 'metadata', 'nbdb'],
    '백업정책': ['backup', 'restore', 'archive', 'retention', 'expiration'],
    '시스템리소스': ['space', 'full', 'capacity', 'quota', 'resource', 'memory']
}

# 심각도 키워드
SEVERITY_KEYWORDS = {
    'Critical': ['critical', 'fatal', 'failed completely', 'unrecoverable', 'disaster'],
    'High': ['failed', 'error', 'failure', 'unable', 'cannot', 'denied'],
    'Medium': ['warning', 'partial', 'some', 'timeout', 'retry'],
    'Low': ['success', 'successful', 'completed', 'information', 'notice']
}

def classify_error_keyword_based(error_code: str, message: str, explanation: str) -> Dict:
    """키워드 기반 에러코드 분류"""
    
    # 소문자로 변환
    text = f"{message} {explanation}".lower()
    
    # 분류 레벨 결정
    level = 2  # 기본값
    confidence = 60
    category = '기타'
    auto_fix = False
    
    # Level 1 체크 (AI 자동 해결)
    level1_matches = sum(1 for kw in CLASSIFICATION_RULES['Level 1']['keywords'] if kw in text)
    
    # Level 2 체크 (엔지니어 승인)
    level2_matches = sum(1 for kw in CLASSIFICATION_RULES['Level 2']['keywords'] if kw in text)
    
    # Level 3 체크 (현장 지원)
    level3_matches = sum(1 for kw in CLASSIFICATION_RULES['Level 3']['keywords'] if kw in text)
    
    # 가장 많이 매칭된 레벨 선택
    max_matches = max(level1_matches, level2_matches, level3_matches)
    
    if max_matches == level1_matches and level1_matches > 0:
        level = 1
        confidence = min(80 + level1_matches * 2, 95)
        category = '네트워크'
        auto_fix = True
    elif max_matches == level3_matches and level3_matches > 0:
        level = 3
        confidence = min(65 + level3_matches * 2, 85)
        category = '하드웨어'
        auto_fix = False
    else:
        level = 2
        confidence = min(70 + level2_matches * 2, 85)
        category = '설정'
        auto_fix = False
    
    # 카테고리 결정
    for cat, keywords in CATEGORY_KEYWORDS.items():
        cat_matches = sum(1 for kw in keywords if kw in text)
        if cat_matches > 0:
            category = cat
            break
    
    # 심각도 결정
    severity = 'Medium'
    for sev, keywords in SEVERITY_KEYWORDS.items():
        if any(kw in text for kw in keywords):
            severity = sev
            break
    
    # 분류 이유 생성
    reason_map = {
        1: f"네트워크 또는 서비스 관련 오류로 자동 재시작 가능 (매칭: {level1_matches}개 키워드)",
        2: f"설정 또는 권한 관련 오류로 엔지니어 검토 필요 (매칭: {level2_matches}개 키워드)",
        3: f"하드웨어 또는 물리적 오류로 현장 지원 필요 (매칭: {level3_matches}개 키워드)"
    }
    
    reason = reason_map.get(level, "일반적인 오류")
    
    # 자동 수정 스크립트 (Level 1만)
    auto_fix_script = None
    if level == 1:
        if 'service' in text or 'daemon' in text:
            auto_fix_script = "systemctl restart netbackup || /usr/openv/netbackup/bin/bp.start_all"
        elif 'connection' in text or 'network' in text:
            auto_fix_script = "ping -c 3 $TARGET_HOST && nc -zv $TARGET_HOST 13782"
        elif 'timeout' in text:
            auto_fix_script = "# Retry operation with increased timeout"
    
    # 예상 해결 시간 (Level에 따라)
    resolution_time = {1: 15, 2: 60, 3: 240}.get(level, 30)
    
    return {
        'resolution_level': level,
        'ai_confidence_score': confidence,
        'classification_reason': reason,
        'category': category,
        'subcategory': '일반',
        'auto_fix_enabled': auto_fix,
        'auto_fix_script': auto_fix_script,
        'estimated_resolution_time': resolution_time,
        'severity_level': severity
    }

def classify_all_errors(input_file: str, output_file: str):
    """모든 에러코드 분류"""
    
    print("🚀 V-BIP 2.3 키워드 기반 에러코드 자동 분류 시작...")
    print(f"📂 입력 파일: {input_file}")
    print(f"💾 출력 파일: {output_file}\n")
    
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
        'avg_confidence': 0
    }
    
    for idx, error in enumerate(error_codes, 1):
        code = error['code']
        message = error.get('message', '')
        explanation = error.get('explanation', '')
        
        if idx % 100 == 0:
            print(f"[{idx}/{total_codes}] 진행 중...")
        
        classification = classify_error_keyword_based(code, message, explanation)
        
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
    
    # Calculate final statistics
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
    print(f"✅ 키워드 기반 자동 분류 완료!")
    print(f"{'='*70}")
    print(f"📊 통계:")
    print(f"  - 총 분류: {len(classified_errors)}개")
    print(f"  - Level 1 (AI 자동 해결): {stats['level_1']}개 ({stats['level_1']/len(classified_errors)*100:.1f}%)")
    print(f"  - Level 2 (엔지니어 승인): {stats['level_2']}개 ({stats['level_2']/len(classified_errors)*100:.1f}%)")
    print(f"  - Level 3 (현장 지원): {stats['level_3']}개 ({stats['level_3']/len(classified_errors)*100:.1f}%)")
    print(f"  - 자동 수정 가능: {stats['auto_fix_enabled']}개 ({stats['auto_fix_enabled']/len(classified_errors)*100:.1f}%)")
    print(f"  - 평균 신뢰도: {stats['avg_confidence']:.1f}%")
    print(f"{'='*70}\n")
    
    return output_data

if __name__ == '__main__':
    INPUT_FILE = '/home/user/V-BIP/extracted_all_error_codes.json'
    OUTPUT_FILE = '/home/user/V-BIP/classified_all_errors_keyword.json'
    
    classify_all_errors(INPUT_FILE, OUTPUT_FILE)
