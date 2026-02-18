
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



# 테이블 구조 확인

cur.execute("""

    SELECT column_name, data_type 

    FROM information_schema.columns 

    WHERE table_name = 'error_patterns'

    ORDER BY ordinal_position

""")

columns = cur.fetchall()

print("테이블 컬럼:")

for col, dtype in columns:

    print(f"  - {col}: {dtype}")

print()



inserted = 0

failed = 0



for idx, err in enumerate(errors, 1):

    try:

        # error_code만 필수, 나머지는 NULL 허용으로 가정

        cur.execute('''

            INSERT INTO error_patterns (

                error_code, description, resolution_level,

                ai_confidence_score, classification_reason, is_ai_classified,

                auto_fix_script, auto_fix_enabled, last_updated

            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)

            ON CONFLICT (error_code) DO NOTHING

        ''', (

            str(err.get('code')),

            (str(err.get('message', '')) + ' ' + str(err.get('explanation', '')))[:2000],

            int(err.get('resolution_level', 2)),

            float(err.get('ai_confidence_score', 50)),

            str(err.get('classification_reason', ''))[:500],

            True,

            str(err.get('auto_fix_script') or ''),

            bool(err.get('auto_fix_enabled', False)),

            datetime.now()

        ))

        conn.commit()

        inserted += 1

        

        if idx % 500 == 0:

            print(f"진행: {idx}/{len(errors)} (성공: {inserted})")

            

    except Exception as e:

        conn.rollback()

        failed += 1

        if failed <= 3:

            print(f"Failed code {err.get('code')}: {e}")



# 통계

cur.execute('SELECT COUNT(*) FROM error_patterns')

total = cur.fetchone()[0]



cur.execute('SELECT resolution_level, COUNT(*) FROM error_patterns GROUP BY resolution_level ORDER BY resolution_level')

levels = cur.fetchall()



print(f"\n{'='*60}")

print("데이터 로드 완료!")

print(f"{'='*60}")

print(f"성공: {inserted:,}개")

print(f"실패: {failed:,}개")

print(f"총 레코드: {total:,}개")



print(f"\n레벨별 분포:")

for level, count in levels:

    names = {1: 'AI 자동수정', 2: '엔지니어 승인', 3: '현장 지원'}

    pct = (count/total*100) if total > 0 else 0

    print(f"  Level {level} ({names.get(level)}): {count:,}개 ({pct:.1f}%)")



print(f"{'='*60}\n")



cur.close()

conn.close()

