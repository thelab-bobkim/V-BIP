#!/usr/bin/env python3
"""
V-BIP 2.3 챕터별 에러코드 분류 분석
2,804개 에러코드를 챕터별로 분류하고 통계 생성
"""

import json
import re
from collections import defaultdict

# 챕터별 에러코드 범위 정의 (NetBackup 10.2 Reference Guide 기준)
CHAPTER_RANGES = {
    'Chapter 1: NetBackup status codes': {
        'range': [(0, 999)],
        'description': 'NetBackup 기본 상태 코드'
    },
    'Chapter 1: NetBackup KMS status codes': {
        'range': [(5900, 5999)],
        'description': 'NetBackup KMS (Key Management Service) 상태 코드'
    },
    'Chapter 2: Media Manager status codes': {
        'range': [(1, 9999)],  # 일반적으로 1-999 범위이지만 중복 확인 필요
        'description': 'Media Manager 상태 코드',
        'keywords': ['media', 'tape', 'drive', 'mount', 'robot']
    },
    'Chapter 3: Device configuration status codes': {
        'range': [(10000, 10999)],
        'description': '장치 구성 상태 코드'
    },
    'Chapter 4: Device management status codes': {
        'range': [(11000, 11999)],
        'description': '장치 관리 상태 코드'
    },
    'Chapter 5: Robotic status codes': {
        'range': [(100, 999)],
        'description': '로봇 상태 코드 (Media Manager 서브셋)',
        'keywords': ['robot', 'library', 'slot', 'arm']
    },
    'Chapter 6: Robotic error codes': {
        'range': [(12000, 12999)],
        'description': '로봇 에러 코드'
    },
    'Chapter 7: Security services status codes': {
        'range': [(100, 199)],
        'description': '보안 서비스 상태 코드',
        'keywords': ['security', 'authentication', 'certificate', 'ssl', 'tls']
    },
    'Chapter 8: NetBackup alert notification status codes': {
        'range': [(13000, 13999)],
        'description': 'NetBackup 알림 상태 코드'
    },
    'Chapter 9: Shared Storage Option status codes': {
        'range': [(14000, 14999)],
        'description': '공유 스토리지 옵션 상태 코드'
    },
    'Chapter 10: Snapshot Client status codes': {
        'range': [(15000, 15999)],
        'description': '스냅샷 클라이언트 상태 코드'
    }
}

def classify_by_chapter(error_code_str: str, error_message: str = '', error_description: str = '') -> str:
    """에러코드를 챕터별로 분류"""
    
    try:
        # 에러코드를 정수로 변환
        error_num = int(error_code_str)
    except ValueError:
        return 'Unknown'
    
    # 텍스트를 소문자로 변환 (키워드 검색용)
    text = f"{error_message} {error_description}".lower()
    
    # 챕터별 범위 및 키워드 확인
    for chapter, info in CHAPTER_RANGES.items():
        # 1. 범위 체크
        for start, end in info['range']:
            if start <= error_num <= end:
                # 2. 키워드가 있으면 추가 확인
                if 'keywords' in info:
                    if any(kw in text for kw in info['keywords']):
                        return chapter
                else:
                    return chapter
    
    # 특수 케이스 처리
    if 5900 <= error_num <= 5999:
        return 'Chapter 1: NetBackup KMS status codes'
    elif 100 <= error_num <= 199 and any(kw in text for kw in ['security', 'auth', 'certificate']):
        return 'Chapter 7: Security services status codes'
    elif error_num < 1000:
        return 'Chapter 1: NetBackup status codes'
    elif 10000 <= error_num <= 10999:
        return 'Chapter 3: Device configuration status codes'
    elif 11000 <= error_num <= 11999:
        return 'Chapter 4: Device management status codes'
    elif 12000 <= error_num <= 12999:
        return 'Chapter 6: Robotic error codes'
    elif 13000 <= error_num <= 13999:
        return 'Chapter 8: NetBackup alert notification status codes'
    elif 14000 <= error_num <= 14999:
        return 'Chapter 9: Shared Storage Option status codes'
    elif 15000 <= error_num <= 15999:
        return 'Chapter 10: Snapshot Client status codes'
    
    return 'Other'

def analyze_chapters():
    """챕터별 에러코드 분포 분석"""
    
    print("=" * 80)
    print("📊 V-BIP 2.3 챕터별 에러코드 분류 분석")
    print("=" * 80)
    print()
    
    # Load classified errors
    with open('/home/user/V-BIP/classified_all_errors_keyword.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    errors = data['classified_errors']
    total = len(errors)
    
    print(f"✅ 총 에러코드: {total}개\n")
    
    # 챕터별 분류
    chapter_stats = defaultdict(list)
    
    for error in errors:
        code = error['code']
        message = error.get('message', '')
        description = error.get('explanation', '')
        
        chapter = classify_by_chapter(code, message, description)
        chapter_stats[chapter].append({
            'code': code,
            'message': message,
            'resolution_level': error.get('resolution_level', 2)
        })
    
    # 챕터별 통계 출력
    print("=" * 80)
    print("📚 챕터별 에러코드 분포")
    print("=" * 80)
    print()
    
    # 챕터 순서대로 정렬
    sorted_chapters = sorted(chapter_stats.items(), key=lambda x: (
        '0' if 'Chapter 1' in x[0] else 
        '1' if 'Chapter 2' in x[0] else
        '2' if 'Chapter 3' in x[0] else
        '3' if 'Chapter 4' in x[0] else
        '4' if 'Chapter 5' in x[0] else
        '5' if 'Chapter 6' in x[0] else
        '6' if 'Chapter 7' in x[0] else
        '7' if 'Chapter 8' in x[0] else
        '8' if 'Chapter 9' in x[0] else
        '9' if 'Chapter 10' in x[0] else 'Z'
    ))
    
    for idx, (chapter, error_list) in enumerate(sorted_chapters, 1):
        count = len(error_list)
        percentage = (count / total) * 100
        
        # Level별 분류
        level_1 = sum(1 for e in error_list if e['resolution_level'] == 1)
        level_2 = sum(1 for e in error_list if e['resolution_level'] == 2)
        level_3 = sum(1 for e in error_list if e['resolution_level'] == 3)
        
        print(f"{idx}. {chapter}")
        print(f"   - 총 에러코드: {count}개 ({percentage:.1f}%)")
        print(f"   - Level 1 (자동): {level_1}개, Level 2 (승인): {level_2}개, Level 3 (현장): {level_3}개")
        
        # 샘플 에러코드 5개 출력
        sample_codes = sorted([e['code'] for e in error_list[:5]], key=lambda x: int(x) if x.isdigit() else 0)
        print(f"   - 샘플 코드: {', '.join(sample_codes)}")
        print()
    
    # 전체 요약
    print("=" * 80)
    print("📊 요약 통계")
    print("=" * 80)
    print()
    print(f"총 에러코드: {total}개")
    print(f"총 챕터: {len(chapter_stats)}개")
    print()
    
    # CSV 형식으로 출력
    print("=" * 80)
    print("📄 CSV 형식 (엑셀 복사용)")
    print("=" * 80)
    print()
    print("챕터,에러코드 수,비율(%),Level 1,Level 2,Level 3")
    
    for chapter, error_list in sorted_chapters:
        count = len(error_list)
        percentage = (count / total) * 100
        level_1 = sum(1 for e in error_list if e['resolution_level'] == 1)
        level_2 = sum(1 for e in error_list if e['resolution_level'] == 2)
        level_3 = sum(1 for e in error_list if e['resolution_level'] == 3)
        
        print(f'"{chapter}",{count},{percentage:.1f},{level_1},{level_2},{level_3}')
    
    # 상세 챕터별 에러코드 리스트 저장
    output = {
        'total_errors': total,
        'total_chapters': len(chapter_stats),
        'chapters': {}
    }
    
    for chapter, error_list in sorted_chapters:
        output['chapters'][chapter] = {
            'count': len(error_list),
            'percentage': round((len(error_list) / total) * 100, 2),
            'level_1': sum(1 for e in error_list if e['resolution_level'] == 1),
            'level_2': sum(1 for e in error_list if e['resolution_level'] == 2),
            'level_3': sum(1 for e in error_list if e['resolution_level'] == 3),
            'error_codes': sorted([e['code'] for e in error_list], key=lambda x: int(x) if x.isdigit() else 0)[:20]  # 처음 20개만
        }
    
    with open('/home/user/V-BIP/chapter_analysis.json', 'w', encoding='utf-8') as f:
        json.dump(output, f, ensure_ascii=False, indent=2)
    
    print()
    print("=" * 80)
    print("✅ 분석 완료! 상세 결과: /home/user/V-BIP/chapter_analysis.json")
    print("=" * 80)

if __name__ == '__main__':
    analyze_chapters()
