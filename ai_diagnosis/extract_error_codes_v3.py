
"""

NetBackup 에러 코드 표 추출 (최종 버전)

"""

import re

import json

from pathlib import Path

from collections import defaultdict

from loguru import logger

import pdfplumber





def extract_from_table_page(text: str, page_num: int) -> list:

    """표 형식에서 에러 코드 추출"""

    error_codes = []

    

    # 줄 단위로 분리

    lines = text.split('\n')

    

    for i, line in enumerate(lines):

        # 패턴 1: "숫자 설명 텍스트" 형식

        match1 = re.match(r'^(\d{1,4})\s+([a-zA-Z].*)', line.strip())

        if match1:

            code = match1.group(1)

            description = match1.group(2).strip()

            

            # 다음 줄도 설명의 일부일 수 있음

            if i + 1 < len(lines):

                next_line = lines[i + 1].strip()

                if next_line and not re.match(r'^\d', next_line):

                    description += ' ' + next_line

            

            error_codes.append({

                'code': code,

                'description': description[:300],

                'page': page_num

            })

        

        # 패턴 2: "statuscode 숫자" 형식

        match2 = re.search(r'(?:statuscode|statuscode)\s+(\d{1,4})', line, re.IGNORECASE)

        if match2:

            code = match2.group(1)

            # 같은 줄에서 설명 추출

            desc_part = line[match2.end():].strip()

            

            error_codes.append({

                'code': code,

                'description': desc_part[:300],

                'page': page_num

            })

    

    return error_codes





def main():

    kb_dir = Path(__file__).parent / 'knowledge_base'

    

    pdf_files = {

        'troubleshooting': kb_dir / 'NetBackup_Appliance_Troubleshooting_Guide_511.pdf',

        'admin': kb_dir / 'NetBackup 52xx and 5330 Appliance Admin Guide_311.pdf'

    }

    

    all_error_codes = defaultdict(lambda: {

        'code': None,

        'descriptions': [],

        'pages': [],

        'sources': []

    })

    

    for doc_type, pdf_path in pdf_files.items():

        if not pdf_path.exists():

            logger.warning(f"PDF 없음: {pdf_path}")

            continue

        

        logger.info(f"PDF 처리: {pdf_path.name}")

        

        with pdfplumber.open(pdf_path) as pdf:

            for page_num, page in enumerate(pdf.pages, 1):

                text = page.extract_text()

                if not text:

                    continue

                

                # "status code" 또는 "error" 키워드가 있는 페이지만 처리

                if any(kw in text.lower() for kw in ['status code', 'error code', 'statuscode']):

                    codes = extract_from_table_page(text, page_num)

                    

                    for item in codes:

                        code = item['code']

                        all_error_codes[code]['code'] = code

                        all_error_codes[code]['descriptions'].append(item['description'])

                        all_error_codes[code]['pages'].append(page_num)

                        all_error_codes[code]['sources'].append(pdf_path.name)

    

    # 중복 제거 및 정리

    final_codes = {}

    for code, info in all_error_codes.items():

        try:

            code_num = int(code)

            if 1 <= code_num <= 5000:

                final_codes[code] = {

                    'code': code,

                    'descriptions': list(set(info['descriptions'])),

                    'pages': sorted(set(info['pages'])),

                    'sources': list(set(info['sources']))

                }

        except ValueError:

            continue

    

    # 저장

    output_file = Path(__file__).parent / 'extracted_error_codes.json'

    

    with open(output_file, 'w', encoding='utf-8') as f:

        json.dump(final_codes, f, ensure_ascii=False, indent=2)

    

    logger.success(f"추출 완료: {len(final_codes)}개")

    

    # 요약

    print("\n" + "=" * 70)

    print(f"추출된 에러 코드: {len(final_codes)}개")

    print("=" * 70)

    

    sorted_codes = sorted(final_codes.items(), key=lambda x: int(x[0]))

    

    print("\n처음 20개:")

    for code, info in sorted_codes[:20]:

        print(f"\n코드 {code}:")

        print(f"  페이지: {info['pages']}")

        print(f"  출처: {', '.join(info['sources'])}")

        if info['descriptions']:

            print(f"  설명: {info['descriptions'][0][:100]}...")

    

    if len(sorted_codes) > 20:

        print(f"\n... 외 {len(sorted_codes) - 20}개")

    

    # 현재 config에 없는 새로운 코드 확인

    current_codes = {'13', '25', '83', '2074', '2820', '227', '6', '41'}

    new_codes = set(final_codes.keys()) - current_codes

    

    print(f"\n새로 발견된 코드: {len(new_codes)}개")

    if new_codes:

        print(f"샘플: {', '.join(sorted(new_codes, key=int)[:10])}")

    

    return final_codes





if __name__ == "__main__":

    logger.info("표 기반 에러 코드 추출")

    codes = main()

    logger.success(f"완료! {len(codes)}개")

