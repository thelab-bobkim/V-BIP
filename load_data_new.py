
#!/usr/bin/env python3

# -*- coding: utf-8 -*-

import json

import psycopg2



DB_CONFIG = {

    'host': 'localhost',

    'port': 5432,

    'database': 'vbip',

    'user': 'vbip_user',

    'password': 'vbip-htkss15s&'

}



def main():

    print("Data loading started...")

    

    with open('classified_all_errors_keyword.json', 'r', encoding='utf-8') as f:

        errors = json.load(f)

    

    print(f"Loaded {len(errors)} error codes")

    

    print("Connecting to database...")

    conn = psycopg2.connect(**DB_CONFIG)

    cur = conn.cursor()

    print("Connected successfully")

    

    print("Inserting data...")

    inserted = 0

    updated = 0

    

    for err in errors:

        try:

            cur.execute("""

                INSERT INTO error_patterns (

                    error_code, error_name, error_description,

                    resolution_level, ai_confidence_score,

                    classification_reason, is_ai_classified,

                    auto_fix_script, auto_fix_enabled

                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)

                ON CONFLICT (error_code) 

                DO UPDATE SET

                    error_name = EXCLUDED.error_name,

                    resolution_level = EXCLUDED.resolution_level,

                    ai_confidence_score = EXCLUDED.ai_confidence_score

            """, (

                err['error_code'],

                err.get('error_name', f"Error {err['error_code']}"),

                err.get('error_message', '') + '\n' + err.get('explanation', ''),

                err['classification']['level'],

                err['classification']['confidence'],

                err['classification']['reason'],

                True,

                err['classification'].get('auto_fix_script', ''),

                err['classification'].get('auto_fix_possible', False)

            ))

            

            if cur.rowcount == 1:

                inserted += 1

            else:

                updated += 1

                

        except Exception as e:

            print(f"Error {err['error_code']}: {e}")

    

    conn.commit()

    print(f"\nCompleted!")

    print(f"  - New: {inserted}")

    print(f"  - Updated: {updated}")

    

    cur.execute("SELECT COUNT(*) FROM error_patterns")

    total = cur.fetchone()[0]

    print(f"\nTotal error codes: {total}")

    

    cur.execute("""

        SELECT resolution_level, COUNT(*) 

        FROM error_patterns 

        GROUP BY resolution_level 

        ORDER BY resolution_level

    """)

    for row in cur.fetchall():

        print(f"  - Level {row[0]}: {row[1]} codes")

    

    cur.close()

    conn.close()

    print("\nSuccess!")



if __name__ == '__main__':

    main()

