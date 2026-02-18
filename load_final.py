
# -*- coding: utf-8 -*-

import json

import psycopg2

from datetime import datetime



print("=== V-BIP 2.3 Data Loading Started ===\n")



with open('/app/data.json', 'r') as f:

    json_data = json.load(f)



errors = json_data['classified_errors']

print(f"Loaded {len(errors)} error codes\n")



conn = psycopg2.connect(

    host='postgres',

    port=5432,

    database='vbip',

    user='vbip_user',

    password='vbip-htkss15s5505'

)

cur = conn.cursor()

print("DB connected\n")



inserted = 0

failed = 0



for idx, err in enumerate(errors, 1):

    try:

        cur.execute('''

            INSERT INTO error_patterns (

                error_code, error_name, error_description, 

                resolution_level, ai_confidence_score, 

                classification_reason, is_ai_classified,

                auto_fix_script, auto_fix_enabled, 

                severity, last_updated

            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)

            ON CONFLICT (error_code) DO NOTHING

        ''', (

            str(err.get('code')),

            str(err.get('message', ''))[:200],

            str(err.get('explanation', ''))[:2000],

            int(err.get('resolution_level', 2)),

            float(err.get('ai_confidence_score', 50)),

            str(err.get('classification_reason', ''))[:500],

            True,

            str(err.get('auto_fix_script') or ''),

            bool(err.get('auto_fix_enabled', False)),

            str(err.get('severity_level', 'Medium'))[:20],

            datetime.now()

        ))

        conn.commit()

        inserted += 1

        

        if idx % 500 == 0:

            print(f"Progress: {idx}/{len(errors)} (Success: {inserted})")

            

    except Exception as e:

        conn.rollback()

        failed += 1

        if failed <= 3:

            print(f"Failed {err.get('code')}: {e}")



cur.execute('SELECT COUNT(*) FROM error_patterns')

total = cur.fetchone()[0]



cur.execute('SELECT resolution_level, COUNT(*) FROM error_patterns GROUP BY resolution_level ORDER BY resolution_level')

levels = cur.fetchall()



cur.execute('SELECT COUNT(*) FROM error_patterns WHERE auto_fix_enabled = true')

auto_fix = cur.fetchone()[0]



print(f"\n{'='*60}")

print("Data Loading Completed!")

print(f"{'='*60}")

print(f"Success: {inserted:,}")

print(f"Failed: {failed:,}")

print(f"Total records: {total:,}")

print(f"Auto-fix enabled: {auto_fix:,}")



print(f"\nDistribution by level:")

for level, count in levels:

    names = {1: 'AI Auto-fix', 2: 'Engineer Approval', 3: 'Field Support'}

    pct = (count/total*100) if total > 0 else 0

    print(f"  Level {level} ({names.get(level)}): {count:,} ({pct:.1f}%)")



print(f"{'='*60}\n")



cur.close()

conn.close()

