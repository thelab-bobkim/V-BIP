
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

conn.autocommit = False  # 트랜잭션 관리

cur = conn.cursor()

print("DB 연결 성공\n")



inserted = 0

failed = 0

failed_codes = []



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

            str(err.get('code')),  # 문자열로 변환

            str(err.get('message', ''))[:500],  # 길이 제한

            str(err.get('explanation', ''))[:1000],

            int(err.get('resolution_level', 2)),

            float(err.get('ai_confidence_score', 50)),

            str(err.get('classification_reason', ''))[:500],

            True,

            str(err.get('auto_fix_script') or ''),

            bool(err.get('auto_fix_enabled', False)),

            datetime.now()

        ))

        conn.commit()  # 각 INSERT 후 커밋

        inserted += 1

        

        if idx % 500 == 0:

            print(f"진행: {idx}/{len(errors)} (성공: {inserted}, 실패: {failed})")

            

    except Exception as e:

        conn.rollback()  # 에러 시 롤백

        failed += 1

        failed_codes.append(err.get('code'))

        if failed <= 5:  # 처음 5개만 출력

            print(f"Failed code {err.get('code')}: {str(e)[:100]}")



# 최종 통계

cur.execute('SELECT COUNT(*) FROM error_patterns')

total = cur.fetchone()[0]



cur.execute('SELECT resolution_level, COUNT(*) FROM error_patterns GROUP BY resolution_level ORDER BY resolution_level')

levels = cur.fetchall()



cur.execute('SELECT COUNT(*) FROM error_patterns WHERE auto_fix_enabled = true')

auto_fix = cur.fetchone()[0]



print(f"\n{'='*60}")

print("데이터 로드 완료!")

print(f"{'='*60}")

print(f"성공: {inserted:,}개")

print(f"실패: {failed:,}개")

print(f"총 레코드: {total:,}개")

print(f"자동수정: {auto_fix:,}개")



if failed > 0:

    print(f"\n실패한 코드 예시 (최대 10개): {failed_codes[:10]}")



print(f"\n레벨별 분포:")

for level, count in levels:

    names = {1: 'AI 자동수정', 2: '엔지니어 승인', 3: '현장 지원'}

    pct = (count/total*100) if total > 0 else 0

    print(f"  Level {level} ({names.get(level, 'Unknown')}): {count:,}개 ({pct:.1f}%)")



print(f"{'='*60}\n")



cur.close()

conn.close()

