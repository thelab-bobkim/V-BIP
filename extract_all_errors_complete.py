#!/usr/bin/env python3
"""
NetBackup PDF에서 7,000개 에러코드 완전 추출
정확한 패턴: "NetBackup status code: X"
"""

import fitz  # PyMuPDF
import re
import json
from datetime import datetime

def extract_all_error_codes(pdf_files):
    """모든 PDF에서 에러코드 추출"""
    all_errors = {}
    
    for pdf_path in pdf_files:
        filename = pdf_path.split('/')[-1]
        print(f"\n📄 처리: {filename}")
        
        doc = fitz.open(pdf_path)
        total_pages = len(doc)
        print(f"   총 {total_pages} 페이지")
        
        current_error = None
        
        for page_num in range(total_pages):
            if page_num % 100 == 0 and page_num > 0:
                print(f"   진행: {page_num}/{total_pages} ({len(all_errors)}개 추출)")
            
            page = doc[page_num]
            text = page.get_text()
            lines = text.split('\n')
            
            for i, line in enumerate(lines):
                # 패턴 1: "NetBackup status code: 123"
                match = re.search(r'NetBackup status code:\s*(\d+)', line, re.IGNORECASE)
                if match:
                    code = match.group(1)
                    
                    if code not in all_errors:
                        current_error = {
                            'code': code,
                            'page': page_num + 1,
                            'source_file': filename,
                            'message': '',
                            'explanation': '',
                            'raw_text': []
                        }
                        all_errors[code] = current_error
                    else:
                        current_error = all_errors[code]
                
                # Message 수집
                elif current_error and re.match(r'^Message:', line.strip(), re.IGNORECASE):
                    msg = line.replace('Message:', '').strip()
                    if msg:
                        current_error['message'] = msg
                
                # Explanation 수집
                elif current_error and re.match(r'^Explanation:', line.strip(), re.IGNORECASE):
                    expl = line.replace('Explanation:', '').strip()
                    if expl:
                        current_error['explanation'] = expl
                
                # 추가 텍스트 수집 (최대 5줄)
                elif current_error and line.strip() and len(current_error['raw_text']) < 5:
                    current_error['raw_text'].append(line.strip())
        
        doc.close()
        print(f"   ✅ 완료: 현재 총 {len(all_errors)}개")
    
    return all_errors

def main():
    pdf_files = [
        "/home/user/uploaded_files/Netbackup102_RefGuide_StatusCodes_part1.pdf",
        "/home/user/uploaded_files/Netbackup102_RefGuide_StatusCodes_part2.pdf",
        "/home/user/uploaded_files/Netbackup102_RefGuide_StatusCodes_part3.pdf"
    ]
    
    print("=" * 70)
    print("NetBackup PDF 전체 에러코드 추출 시작")
    print("=" * 70)
    
    all_errors = extract_all_error_codes(pdf_files)
    
    print("\n" + "=" * 70)
    print(f"📊 최종 결과: {len(all_errors)}개 에러코드 추출 완료!")
    print("=" * 70)
    
    # JSON 저장
    output_file = "/home/user/V-BIP/extracted_all_error_codes.json"
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump({
            'extracted_at': datetime.now().isoformat(),
            'total_codes': len(all_errors),
            'error_codes': list(all_errors.values())
        }, f, indent=2, ensure_ascii=False)
    
    print(f"\n✅ 저장: {output_file}")
    
    # 통계
    codes_with_message = sum(1 for e in all_errors.values() if e['message'])
    codes_with_explanation = sum(1 for e in all_errors.values() if e['explanation'])
    
    print(f"\n📈 통계:")
    print(f"  • 총 에러코드: {len(all_errors)}개")
    print(f"  • Message 있음: {codes_with_message}개")
    print(f"  • Explanation 있음: {codes_with_explanation}개")
    
    # 샘플 출력
    print(f"\n🔍 샘플 (처음 15개):")
    for i, (code, data) in enumerate(sorted(all_errors.items(), key=lambda x: int(x[0]))[:15], 1):
        msg = data['message'][:60] + '...' if len(data['message']) > 60 else data['message']
        print(f"  {i}. Code {code}: {msg or '(메시지 없음)'}")
    
    return all_errors

if __name__ == "__main__":
    errors = main()
