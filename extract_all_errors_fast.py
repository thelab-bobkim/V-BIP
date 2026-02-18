#!/usr/bin/env python3
"""
NetBackup PDF에서 7,000개 이상 에러코드 추출
PyMuPDF (fitz) 사용 - pdfplumber보다 10배 빠름
"""

import fitz  # PyMuPDF
import re
import json
from datetime import datetime
from collections import defaultdict

def extract_error_codes_from_pdf(pdf_path):
    """PDF에서 에러코드 추출 (빠른 방법)"""
    error_codes = []
    
    print(f"📄 처리 중: {pdf_path}")
    doc = fitz.open(pdf_path)
    total_pages = len(doc)
    print(f"   총 {total_pages} 페이지")
    
    current_error = None
    
    for page_num in range(total_pages):
        if page_num % 50 == 0:
            print(f"   진행: {page_num}/{total_pages} 페이지...")
        
        page = doc[page_num]
        text = page.get_text()
        
        lines = text.split('\n')
        
        for line in lines:
            # NetBackup 에러코드 패턴: "Status Code: 1234"
            match = re.match(r'^Status [Cc]ode:\s*(\d+)', line.strip())
            if match:
                code = match.group(1)
                current_error = {
                    'code': code,
                    'page': page_num + 1,
                    'message': '',
                    'explanation': '',
                    'action': ''
                }
                error_codes.append(current_error)
            elif current_error and line.strip():
                # 에러 설명 수집
                if len(current_error['message']) < 200:
                    current_error['message'] += ' ' + line.strip()
    
    doc.close()
    return error_codes

def main():
    pdf_files = [
        "/home/user/uploaded_files/Netbackup102_RefGuide_StatusCodes_part1.pdf",
        "/home/user/uploaded_files/Netbackup102_RefGuide_StatusCodes_part2.pdf",
        "/home/user/uploaded_files/Netbackup102_RefGuide_StatusCodes_part3.pdf"
    ]
    
    all_errors = {}
    total_extracted = 0
    
    print("=" * 60)
    print("NetBackup PDF 에러코드 추출 시작")
    print("=" * 60)
    
    for pdf_path in pdf_files:
        errors = extract_error_codes_from_pdf(pdf_path)
        
        # 중복 제거
        for err in errors:
            code = err['code']
            if code not in all_errors:
                all_errors[code] = err
                total_extracted += 1
        
        print(f"   ✓ 추출: {len(errors)}개, 고유: {len(all_errors)}개")
    
    print("=" * 60)
    print(f"📊 최종 결과: {len(all_errors)}개 에러코드 추출")
    print("=" * 60)
    
    # JSON 저장
    output_file = "/home/user/V-BIP/extracted_all_error_codes.json"
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump({
            'extracted_at': datetime.now().isoformat(),
            'total_codes': len(all_errors),
            'error_codes': list(all_errors.values())
        }, f, indent=2, ensure_ascii=False)
    
    print(f"✅ 저장 완료: {output_file}")
    
    # 샘플 출력
    print(f"\n샘플 (처음 10개):")
    for i, (code, data) in enumerate(list(all_errors.items())[:10], 1):
        msg = data['message'][:60] + '...' if len(data['message']) > 60 else data['message']
        print(f"  {i}. Code {code}: {msg}")

if __name__ == "__main__":
    main()
