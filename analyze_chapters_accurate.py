#!/usr/bin/env python3
"""
V-BIP 2.3 정확한 챕터별 에러코드 분류
PDF 실제 내용 기반으로 챕터 분류
"""

import json
from collections import defaultdict

# NetBackup 10.2 Reference Guide 실제 챕터별 범위
# (PDF 분석 및 Veritas 공식 문서 기준)
CHAPTER_MAPPING = {
    'Chapter 1: NetBackup status codes': {
        'ranges': [(0, 999)],
        'description': 'NetBackup 기본 상태 코드 (0-999)'
    },
    'Chapter 2: Media Manager status codes': {
        'ranges': [(1000, 1999)],
        'description': 'Media Manager 미디어 및 테이프 관리 (1000-1999)'
    },
    'Chapter 3: Media and Device Management status codes': {
        'ranges': [(2000, 4999)],
        'description': '장치 구성 및 관리 상태 코드 (2000-4999)'
    },
    'Chapter 4: NetBackup Java/Web services status codes': {
        'ranges': [(5000, 5899), (5950, 5999)],  # KMS 제외
        'description': 'Java 및 웹 서비스 상태 코드 (5000-5899, 5950-5999)'
    },
    'Chapter 4: NetBackup KMS status codes': {
        'ranges': [(5900, 5949)],
        'description': 'Key Management Service 상태 코드 (5900-5949)'
    },
    'Chapter 5: NetBackup Cloud status codes': {
        'ranges': [(6000, 6999)],
        'description': '클라우드 백업 상태 코드 (6000-6999)'
    },
    'Chapter 6: Database and Application Agent status codes': {
        'ranges': [(7000, 7999)],
        'description': '데이터베이스 및 애플리케이션 에이전트 (7000-7999)'
    },
    'Chapter 7: NetBackup Deduplication status codes': {
        'ranges': [(8000, 8999)],
        'description': '중복 제거 상태 코드 (8000-8999)'
    },
    'Chapter 8: NetBackup Replication and Disaster Recovery': {
        'ranges': [(9000, 9999)],
        'description': '복제 및 재해 복구 상태 코드 (9000-9999)'
    }
}

def get_chapter(error_code_str: str) -> str:
    """에러코드로 챕터 결정"""
    try:
        code = int(error_code_str)
    except ValueError:
        return 'Unknown'
    
    for chapter, info in CHAPTER_MAPPING.items():
        for start, end in info['ranges']:
            if start <= code <= end:
                return chapter
    
    return 'Other'

def analyze_by_real_chapters():
    """실제 챕터 구조 기반 분석"""
    
    print("=" * 80)
    print("📚 V-BIP 2.3 챕터별 에러코드 정확 분류")
    print("=" * 80)
    print()
    
    # Load classified errors
    with open('/home/user/V-BIP/classified_all_errors_keyword.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    errors = data['classified_errors']
    total = len(errors)
    
    # 챕터별 분류
    chapter_stats = defaultdict(list)
    
    for error in errors:
        code = error['code']
        chapter = get_chapter(code)
        chapter_stats[chapter].append({
            'code': code,
            'message': error.get('message', ''),
            'resolution_level': error.get('resolution_level', 2),
            'ai_confidence': error.get('ai_confidence_score', 0),
            'auto_fix': error.get('auto_fix_enabled', False)
        })
    
    # 챕터 순서대로 정렬
    chapter_order = [
        'Chapter 1: NetBackup status codes',
        'Chapter 2: Media Manager status codes',
        'Chapter 3: Media and Device Management status codes',
        'Chapter 4: NetBackup Java/Web services status codes',
        'Chapter 4: NetBackup KMS status codes',
        'Chapter 5: NetBackup Cloud status codes',
        'Chapter 6: Database and Application Agent status codes',
        'Chapter 7: NetBackup Deduplication status codes',
        'Chapter 8: NetBackup Replication and Disaster Recovery',
        'Other',
        'Unknown'
    ]
    
    # 결과 출력
    print(f"✅ 총 분석 에러코드: {total:,}개\n")
    print("=" * 80)
    print("📊 챕터별 상세 분포")
    print("=" * 80)
    print()
    
    summary_data = []
    
    for idx, chapter in enumerate(chapter_order, 1):
        if chapter not in chapter_stats:
            continue
        
        error_list = chapter_stats[chapter]
        count = len(error_list)
        percentage = (count / total) * 100
        
        # Level별 통계
        level_1 = sum(1 for e in error_list if e['resolution_level'] == 1)
        level_2 = sum(1 for e in error_list if e['resolution_level'] == 2)
        level_3 = sum(1 for e in error_list if e['resolution_level'] == 3)
        auto_fix_count = sum(1 for e in error_list if e['auto_fix'])
        avg_confidence = sum(e['ai_confidence'] for e in error_list) / count if count > 0 else 0
        
        # 에러코드 범위
        codes = sorted([int(e['code']) for e in error_list if e['code'].isdigit()])
        code_range = f"{codes[0]}-{codes[-1]}" if codes else "N/A"
        
        print(f"{idx}. {chapter}")
        print(f"   📌 에러코드 범위: {code_range}")
        print(f"   📊 총 개수: {count:,}개 ({percentage:.1f}%)")
        print(f"   🎯 평균 신뢰도: {avg_confidence:.1f}%")
        print(f"   🤖 자동 수정 가능: {auto_fix_count}개 ({auto_fix_count/count*100:.1f}%)")
        print(f"   📈 Level 분포:")
        print(f"      - Level 1 (AI 자동 해결): {level_1}개 ({level_1/count*100:.1f}%)")
        print(f"      - Level 2 (엔지니어 승인): {level_2}개 ({level_2/count*100:.1f}%)")
        print(f"      - Level 3 (현장 지원): {level_3}개 ({level_3/count*100:.1f}%)")
        
        # 샘플 에러코드 (처음 5개)
        sample_codes = [e['code'] for e in sorted(error_list, key=lambda x: int(x['code']) if x['code'].isdigit() else 0)[:5]]
        print(f"   🔢 샘플 코드: {', '.join(sample_codes)}")
        print()
        
        summary_data.append({
            'chapter': chapter,
            'range': code_range,
            'count': count,
            'percentage': percentage,
            'level_1': level_1,
            'level_2': level_2,
            'level_3': level_3,
            'auto_fix': auto_fix_count,
            'avg_confidence': avg_confidence
        })
    
    # 요약 테이블
    print("=" * 80)
    print("📋 요약 테이블 (Excel 복사용)")
    print("=" * 80)
    print()
    print("챕터명,에러코드범위,개수,비율(%),Level1,Level2,Level3,자동수정,평균신뢰도")
    
    for item in summary_data:
        print(f'"{item["chapter"]}","{item["range"]}",'
              f'{item["count"]},{item["percentage"]:.1f},'
              f'{item["level_1"]},{item["level_2"]},{item["level_3"]},'
              f'{item["auto_fix"]},{item["avg_confidence"]:.1f}')
    
    print()
    print("=" * 80)
    print("📊 전체 요약")
    print("=" * 80)
    print()
    print(f"✅ 총 에러코드: {total:,}개")
    print(f"📚 챕터 개수: {len([c for c in chapter_stats if c != 'Unknown'])}개")
    print(f"🤖 전체 자동 수정 가능: {sum(item['auto_fix'] for item in summary_data):,}개 "
          f"({sum(item['auto_fix'] for item in summary_data)/total*100:.1f}%)")
    print(f"🎯 전체 평균 신뢰도: {sum(item['avg_confidence']*item['count'] for item in summary_data)/total:.1f}%")
    print()
    
    # JSON 저장
    output = {
        'total_errors': total,
        'analysis_date': '2026-02-18',
        'chapters': summary_data
    }
    
    with open('/home/user/V-BIP/chapter_analysis_accurate.json', 'w', encoding='utf-8') as f:
        json.dump(output, f, ensure_ascii=False, indent=2)
    
    print("💾 상세 분석 결과 저장: /home/user/V-BIP/chapter_analysis_accurate.json")
    print("=" * 80)

if __name__ == '__main__':
    analyze_by_real_chapters()
