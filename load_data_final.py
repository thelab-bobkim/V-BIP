
import json

import psycopg2

from datetime import datetime



print("=== V-BIP 2.3 데이터 로드 시작 ===\n")



# JSON 로드

with open('/app/data.json', 'r') as f:

    json_data = json.load(f)



errors = json_data['classified_errors']

print(f"로드된 에러코드: {len(errors)}개\n")



# DB 연결

conn = psycopg2.connect(

    host='postgres',

    port=5432,

    database='vbip',

    user='vbip_user',

    password='vbip-htkss15s5505'

)

cur = conn.cursor()

print("DB 연결 성공\n")



inserted = 0

for idx, err in enumerate(errors, 1):

    try:

        cur.execute('''

            INSERT INTO error_patterns (

                error_code, name, description, resolution_level,

                ai_confidence_score, classification_reason, is_ai_classified,

                auto_fix_script, auto_fix_enabled, last_updated

            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)

            ON CONFLICT (error_code) DO NOTHING

        ''', (

            err.get('code'),

            err.get('message', ''),

            err.get('explanation', ''),

            err.get('resolution_level', 2),

            err.get('ai_confidence_score', 50),

            err.get('classification_reason', ''),

            True,

            err.get('auto_fix_script', ''),

            err.get('auto_fix_enabled', False),

            datetime.now()

        ))

        inserted += 1

        

        if idx % 500 == 0:

            print(f"진행: {idx}/{len(errors)}")

            

    except Exception as e:

        print(f"Error {err.get('code')}: {e}")



conn.commit()



# 통계

cur.execute('SELECT COUNT(*) FROM error_patterns')

total = cur.fetchone()[0]



cur.execute('SELECT resolution_level, COUNT(*) FROM error_patterns GROUP BY resolution_level ORDER BY resolution_level')

levels = cur.fetchall()



cur.execute('SELECT COUNT(*) FROM error_patterns WHERE auto_fix_enabled = true')

auto_fix = cur.fetchone()[0]



print(f"\n{'='*60}")

print("데이터 로드 완료!")

print(f"{'='*60}")

print(f"삽입: {inserted:,}개")

print(f"총 레코드: {total:,}개")

print(f"자동수정: {auto_fix:,}개")

print(f"\n레벨별 분포:")

for level, count in levels:

    names = {1: 'AI 자동수정', 2: '엔지니어 승인', 3: '현장 지원'}

    pct = (count/total*100) if total > 0 else 0

    print(f"  Level {level} ({names.get(level, 'Unknown')}): {count:,}개 ({pct:.1f}%)")



print(f"{'='*60}\n")



cur.close()

conn.close()

