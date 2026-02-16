"""
V-BIP Phase 3-A: Excel Parser
Excel 첨부파일 파싱 및 데이터 추출
"""

import pandas as pd
import openpyxl
from datetime import datetime
from typing import List, Dict, Optional, Tuple
import logging
from pathlib import Path

from config import EXCEL_CONFIG, LOGGING_CONFIG


# 로깅 설정
logging.basicConfig(
    level=getattr(logging, LOGGING_CONFIG['level']),
    format=LOGGING_CONFIG['format']
)
logger = logging.getLogger(__name__)


class ExcelParser:
    """
    Excel 파일 파싱 클래스
    """
    
    def __init__(self):
        """초기화"""
        self.column_mapping = EXCEL_CONFIG['column_mapping']
        self.status_mapping = EXCEL_CONFIG['status_mapping']
        self.required_columns = EXCEL_CONFIG['required_columns']
    
    def parse_file(self, filepath: str) -> Tuple[List[Dict], List[str]]:
        """
        Excel 파일 파싱
        
        Args:
            filepath: Excel 파일 경로
        
        Returns:
            Tuple[List[Dict], List[str]]: (파싱된 데이터, 에러 메시지)
        """
        logger.info(f"📊 Excel 파싱 시작: {Path(filepath).name}")
        
        try:
            # 파일 확장자 확인
            ext = Path(filepath).suffix.lower()
            
            if ext == '.csv':
                df = pd.read_csv(filepath)
            elif ext in ['.xlsx', '.xls']:
                df = pd.read_excel(filepath, engine='openpyxl' if ext == '.xlsx' else None)
            else:
                return [], [f"지원하지 않는 파일 형식: {ext}"]
            
            # 데이터 검증 및 변환
            records, errors = self.process_dataframe(df)
            
            logger.info(f"✅ 파싱 완료: {len(records)}개 레코드, {len(errors)}개 에러")
            return records, errors
        
        except Exception as e:
            error_msg = f"Excel 파싱 실패: {e}"
            logger.error(f"❌ {error_msg}")
            return [], [error_msg]
    
    def process_dataframe(self, df: pd.DataFrame) -> Tuple[List[Dict], List[str]]:
        """
        DataFrame 처리 및 변환
        
        Args:
            df: pandas DataFrame
        
        Returns:
            Tuple[List[Dict], List[str]]: (변환된 레코드, 에러 메시지)
        """
        records = []
        errors = []
        
        # 빈 행 제거
        if EXCEL_CONFIG['skip_empty_rows']:
            df = df.dropna(how='all')
        
        # 최대 행 수 제한
        max_rows = EXCEL_CONFIG['max_rows_per_file']
        if len(df) > max_rows:
            errors.append(f"최대 행 수 초과: {len(df)} > {max_rows}, 처음 {max_rows}개만 처리")
            df = df.head(max_rows)
        
        # 컬럼명 표준화
        df_columns = df.columns.tolist()
        column_map = self.build_column_map(df_columns)
        
        if not column_map:
            errors.append("매핑 가능한 컬럼을 찾을 수 없습니다")
            return records, errors
        
        df = df.rename(columns=column_map)
        
        # 필수 컬럼 확인
        missing_columns = [col for col in self.required_columns if col not in df.columns]
        if missing_columns:
            errors.append(f"필수 컬럼 누락: {', '.join(missing_columns)}")
            return records, errors
        
        # 각 행 처리
        for idx, row in df.iterrows():
            try:
                record = self.process_row(row, idx)
                if record:
                    records.append(record)
            except Exception as e:
                errors.append(f"행 {idx+1} 처리 실패: {e}")
        
        return records, errors
    
    def build_column_map(self, columns: List[str]) -> Dict[str, str]:
        """
        컬럼 매핑 딕셔너리 생성
        
        Args:
            columns: Excel 컬럼명 리스트
        
        Returns:
            Dict[str, str]: 매핑 딕셔너리 (원본 컬럼명 → 표준 컬럼명)
        """
        column_map = {}
        
        for col in columns:
            # 정확히 일치하는 경우
            if col in self.column_mapping:
                column_map[col] = self.column_mapping[col]
            else:
                # 대소문자 무시하고 검색
                col_lower = col.lower().strip()
                for excel_col, db_col in self.column_mapping.items():
                    if excel_col.lower() == col_lower:
                        column_map[col] = db_col
                        break
        
        return column_map
    
    def process_row(self, row: pd.Series, row_index: int) -> Optional[Dict]:
        """
        개별 행 처리
        
        Args:
            row: pandas Series (행 데이터)
            row_index: 행 인덱스
        
        Returns:
            Optional[Dict]: 변환된 레코드 (유효하지 않으면 None)
        """
        record = {}
        
        # 고객사명 (필수)
        customer_name = self.clean_string(row.get('customer_name', ''))
        if not customer_name:
            logger.debug(f"행 {row_index+1}: 고객사명 없음, 건너뜀")
            return None
        
        record['customer_name'] = customer_name
        
        # 작업 유형
        record['job_type'] = self.clean_string(row.get('job_type', 'Full'))
        
        # 백업 서버
        record['backup_server'] = self.clean_string(row.get('backup_server', ''))
        
        # 상태 (필수, 표준화)
        status = self.clean_string(row.get('status', ''))
        record['status'] = self.standardize_status(status)
        if not record['status']:
            logger.debug(f"행 {row_index+1}: 상태 값 없음, 건너뜀")
            return None
        
        # 시작/종료 시간 (필수)
        record['start_time'] = self.parse_datetime(row.get('start_time'))
        record['end_time'] = self.parse_datetime(row.get('end_time'))
        
        if not record['start_time']:
            logger.debug(f"행 {row_index+1}: 시작 시간 없음, 건너뜀")
            return None
        
        # 소요 시간 (분)
        record['duration_minutes'] = self.parse_number(row.get('duration_minutes', 0))
        
        # 백업 크기 (GB)
        record['backup_size_gb'] = self.parse_number(row.get('backup_size_gb', 0))
        
        # 에러 코드 및 메시지 (실패/경고인 경우)
        if record['status'] in ['failure', 'warning']:
            record['error_code'] = self.clean_string(row.get('error_code', ''))
            record['error_message'] = self.clean_string(row.get('error_message', ''))
        else:
            record['error_code'] = None
            record['error_message'] = None
        
        # Policy Name, Job ID (선택)
        record['policy_name'] = self.clean_string(row.get('policy_name', ''))
        record['job_id'] = self.clean_string(row.get('job_id', ''))
        
        return record
    
    def standardize_status(self, status: str) -> Optional[str]:
        """
        상태 값 표준화
        
        Args:
            status: 원본 상태 값
        
        Returns:
            Optional[str]: 표준화된 상태 (success, failure, warning)
        """
        if not status:
            return None
        
        status = str(status).strip()
        
        # 매핑 테이블에서 검색
        if status in self.status_mapping:
            return self.status_mapping[status]
        
        # 대소문자 무시하고 검색
        status_lower = status.lower()
        for key, value in self.status_mapping.items():
            if key.lower() == status_lower:
                return value
        
        # 키워드 기반 추론
        if 'success' in status_lower or 'ok' in status_lower:
            return 'success'
        elif 'fail' in status_lower or 'error' in status_lower:
            return 'failure'
        elif 'warn' in status_lower or 'partial' in status_lower:
            return 'warning'
        
        logger.warning(f"알 수 없는 상태 값: {status}, 'failure'로 간주")
        return 'failure'
    
    def parse_datetime(self, value) -> Optional[str]:
        """
        날짜/시간 파싱
        
        Args:
            value: 날짜/시간 값
        
        Returns:
            Optional[str]: ISO 형식 문자열 (YYYY-MM-DD HH:MM:SS)
        """
        if pd.isna(value):
            return None
        
        try:
            # pandas Timestamp인 경우
            if isinstance(value, pd.Timestamp):
                return value.strftime('%Y-%m-%d %H:%M:%S')
            
            # datetime 객체인 경우
            if isinstance(value, datetime):
                return value.strftime('%Y-%m-%d %H:%M:%S')
            
            # 문자열인 경우 파싱 시도
            if isinstance(value, str):
                # 여러 형식 시도
                for fmt in ['%Y-%m-%d %H:%M:%S', '%Y-%m-%d', '%Y/%m/%d %H:%M:%S', 
                           '%Y/%m/%d', '%d-%m-%Y %H:%M:%S', '%d/%m/%Y %H:%M:%S']:
                    try:
                        dt = datetime.strptime(value.strip(), fmt)
                        return dt.strftime('%Y-%m-%d %H:%M:%S')
                    except:
                        continue
                
                # pandas로 파싱 시도
                try:
                    dt = pd.to_datetime(value)
                    return dt.strftime('%Y-%m-%d %H:%M:%S')
                except:
                    pass
            
            logger.warning(f"날짜/시간 파싱 실패: {value}")
            return None
        
        except Exception as e:
            logger.warning(f"날짜/시간 파싱 실패: {value}, {e}")
            return None
    
    def parse_number(self, value, default=0) -> float:
        """
        숫자 파싱
        
        Args:
            value: 숫자 값
            default: 기본값
        
        Returns:
            float: 파싱된 숫자
        """
        if pd.isna(value):
            return default
        
        try:
            # 문자열인 경우 쉼표 제거
            if isinstance(value, str):
                value = value.replace(',', '').strip()
            
            return float(value)
        except:
            return default
    
    def clean_string(self, value) -> str:
        """
        문자열 정리
        
        Args:
            value: 원본 값
        
        Returns:
            str: 정리된 문자열
        """
        if pd.isna(value):
            return ''
        
        return str(value).strip()


def test_excel_parser():
    """테스트 함수"""
    print("=" * 60)
    print("Excel Parser 테스트")
    print("=" * 60)
    
    # 샘플 데이터 생성
    sample_data = {
        '고객사명': ['서울우유본사', '동국제약', 'KG모빌리티'],
        '작업유형': ['Full', 'Incremental', 'Differential'],
        '상태': ['실패', '성공', '경고'],
        '시작시간': ['2026-02-15 01:00:00', '2026-02-15 02:00:00', '2026-02-15 03:00:00'],
        '종료시간': ['2026-02-15 02:30:00', '2026-02-15 02:15:00', '2026-02-15 03:45:00'],
        '소요시간(분)': [90, 15, 45],
        '백업크기(GB)': [150.5, 80.2, 120.8],
        '에러코드': ['58', '', '196'],
        '에러메시지': ['미디어 서버 연결 실패', '', '테이프 드라이브 오류']
    }
    
    df = pd.DataFrame(sample_data)
    
    # 임시 파일 저장
    test_file = '/tmp/test_backup_data.xlsx'
    df.to_excel(test_file, index=False, engine='openpyxl')
    
    # 파싱
    parser = ExcelParser()
    records, errors = parser.parse_file(test_file)
    
    print(f"\n파싱 결과: {len(records)}개 레코드")
    print(f"에러: {len(errors)}개\n")
    
    if errors:
        print("에러 목록:")
        for error in errors:
            print(f"  - {error}")
        print()
    
    for idx, record in enumerate(records, 1):
        print(f"{idx}. 고객사: {record['customer_name']}")
        print(f"   상태: {record['status']}")
        print(f"   시작: {record['start_time']}")
        print(f"   소요: {record['duration_minutes']}분")
        if record['error_code']:
            print(f"   에러: [{record['error_code']}] {record['error_message']}")
        print()
    
    # 임시 파일 삭제
    import os
    os.remove(test_file)
    
    print("=" * 60)


if __name__ == '__main__':
    test_excel_parser()
