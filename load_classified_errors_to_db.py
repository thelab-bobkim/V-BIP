#!/usr/bin/env python3
"""
V-BIP 2.3 분류된 에러코드 PostgreSQL DB 적재
2,804개 에러코드를 error_codes 테이블에 일괄 삽입
"""

import json
import psycopg2
from datetime import datetime

# Database connection
DB_CONFIG = {
    'dbname': 'vbip',
    'user': 'vbip_user',
    'password': 'vbip_password_2024',
    'host': 'localhost',
    'port': 5432
}

def load_classified_errors_to_db(json_file: str):
    """분류된 에러코드를 DB에 적재"""
    
    print("🚀 V-BIP 2.3 분류 에러코드 DB 적재 시작...")
    print(f"📂 입력 파일: {json_file}\n")
    
    # Load classified errors
    with open(json_file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    classified_errors = data['classified_errors']
    total_errors = len(classified_errors)
    
    print(f"✅ {total_errors}개 분류 에러코드 로드 완료\n")
    
    # Connect to database
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor()
    
    print("📦 DB 연결 성공\n")
    
    # Truncate existing error_codes (선택사항)
    # cur.execute("TRUNCATE TABLE error_codes CASCADE;")
    # print("🗑️  기존 error_codes 테이블 초기화\n")
    
    # Insert errors into error_patterns table
    insert_query = """
    INSERT INTO error_patterns (
        error_code, error_type, error_name, error_description, 
        symptom, root_cause, troubleshooting_steps, 
        auto_fix_script, auto_fix_enabled, 
        severity, avg_resolution_minutes, 
        occurrence_frequency, success_rate_percent, 
        resolution_level, ai_confidence_score, 
        classification_reason, is_ai_classified, ai_model_version,
        created_at, last_updated
    ) VALUES (
        %s, %s, %s, %s, 
        %s, %s, %s, 
        %s, %s, 
        %s, %s, 
        %s, %s, 
        %s, %s, 
        %s, %s, %s,
        %s, %s
    )
    ON CONFLICT (error_code) DO UPDATE SET
        error_name = EXCLUDED.error_name,
        error_description = EXCLUDED.error_description,
        severity = EXCLUDED.severity,
        resolution_level = EXCLUDED.resolution_level,
        ai_confidence_score = EXCLUDED.ai_confidence_score,
        classification_reason = EXCLUDED.classification_reason,
        auto_fix_enabled = EXCLUDED.auto_fix_enabled,
        auto_fix_script = EXCLUDED.auto_fix_script,
        is_ai_classified = EXCLUDED.is_ai_classified,
        last_updated = NOW()
    """
    
    inserted_count = 0
    updated_count = 0
    
    for idx, error in enumerate(classified_errors, 1):
        try:
            code = error['code']
            message = error.get('message', '')[:200]  # error_name 최대 200자
            explanation = error.get('explanation', '')  # error_description (TEXT)
            
            severity = error.get('severity_level', 'Medium')
            resolution_level = error.get('resolution_level', 2)
            confidence = error.get('ai_confidence_score', 70)
            reason = error.get('classification_reason', '')
            
            auto_fix = error.get('auto_fix_enabled', False)
            auto_fix_script = error.get('auto_fix_script', None)
            
            resolution_time = error.get('estimated_resolution_time', 30)
            
            # Check if error code already exists
            cur.execute("SELECT error_code FROM error_patterns WHERE error_code = %s", (code,))
            exists = cur.fetchone() is not None
            
            # Insert into error_patterns table
            cur.execute(insert_query, (
                code, 'NetBackup', message, explanation,
                message, reason, explanation,
                auto_fix_script, auto_fix,
                severity, resolution_time,
                0, 0.0,  # occurrence_frequency, success_rate
                resolution_level, float(confidence),
                reason, True, 'keyword-v1',
                datetime.now(), datetime.now()
            ))
            
            if exists:
                updated_count += 1
            else:
                inserted_count += 1
            
            if idx % 500 == 0:
                print(f"[{idx}/{total_errors}] 진행 중... (신규: {inserted_count}, 업데이트: {updated_count})")
                conn.commit()  # Commit every 500 rows
            
        except Exception as e:
            print(f"⚠️  에러코드 {code} 삽입 실패: {e}")
            continue
    
    # Final commit
    conn.commit()
    
    print(f"\n{'='*70}")
    print(f"✅ DB 적재 완료!")
    print(f"{'='*70}")
    print(f"📊 통계:")
    print(f"  - 총 처리: {total_errors}개")
    print(f"  - 신규 삽입: {inserted_count}개")
    print(f"  - 업데이트: {updated_count}개")
    print(f"{'='*70}\n")
    
    # Verify insertion
    cur.execute("SELECT COUNT(*) FROM error_patterns")
    total_in_db = cur.fetchone()[0]
    
    cur.execute("SELECT resolution_level, COUNT(*) FROM error_patterns GROUP BY resolution_level ORDER BY resolution_level")
    level_stats = cur.fetchall()
    
    print(f"📊 DB 검증:")
    print(f"  - 전체 에러코드: {total_in_db}개")
    for level, count in level_stats:
        print(f"  - Level {level}: {count}개 ({count/total_in_db*100:.1f}%)")
    
    cur.close()
    conn.close()
    
    print(f"\n✅ DB 적재 및 검증 완료!")

if __name__ == '__main__':
    JSON_FILE = '/home/user/V-BIP/classified_all_errors_keyword.json'
    load_classified_errors_to_db(JSON_FILE)
