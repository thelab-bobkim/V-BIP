"""
V-BIP Phase 3-A: Database Manager
데이터베이스 저장 및 관리
"""

import psycopg2
from psycopg2.extras import execute_batch
from typing import List, Dict, Optional, Tuple
import logging
from datetime import datetime

from config import DB_CONFIG, LOGGING_CONFIG


# 로깅 설정
logging.basicConfig(
    level=getattr(logging, LOGGING_CONFIG['level']),
    format=LOGGING_CONFIG['format']
)
logger = logging.getLogger(__name__)


class DatabaseManager:
    """
    데이터베이스 관리 클래스
    """
    
    def __init__(self):
        """초기화"""
        self.conn = None
        self.cursor = None
    
    def connect(self) -> bool:
        """
        데이터베이스 연결
        
        Returns:
            bool: 연결 성공 여부
        """
        try:
            logger.info(f"DB 연결 시도: {DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}")
            self.conn = psycopg2.connect(
                host=DB_CONFIG['host'],
                port=DB_CONFIG['port'],
                database=DB_CONFIG['database'],
                user=DB_CONFIG['user'],
                password=DB_CONFIG['password']
            )
            self.cursor = self.conn.cursor()
            logger.info("✅ DB 연결 성공")
            return True
        except Exception as e:
            logger.error(f"❌ DB 연결 실패: {e}")
            return False
    
    def disconnect(self):
        """데이터베이스 연결 해제"""
        if self.cursor:
            self.cursor.close()
        if self.conn:
            self.conn.close()
        logger.info("DB 연결 해제됨")
    
    def get_customer_id(self, customer_name: str) -> Optional[int]:
        """
        고객사 ID 조회 (없으면 생성)
        
        Args:
            customer_name: 고객사명
        
        Returns:
            Optional[int]: 고객사 ID
        """
        try:
            # 먼저 조회
            query = "SELECT customer_id FROM customers WHERE name = %s"
            self.cursor.execute(query, (customer_name,))
            result = self.cursor.fetchone()
            
            if result:
                return result[0]
            
            # 없으면 새로 생성
            logger.info(f"새 고객사 등록: {customer_name}")
            insert_query = """
                INSERT INTO customers (name, tier, device_count, engineer_id, created_at)
                VALUES (%s, 'Standard', 0, 1, NOW())
                RETURNING customer_id
            """
            self.cursor.execute(insert_query, (customer_name,))
            self.conn.commit()
            
            return self.cursor.fetchone()[0]
        
        except Exception as e:
            logger.error(f"고객사 ID 조회/생성 실패: {customer_name}, {e}")
            self.conn.rollback()
            return None
    
    def check_duplicate(self, customer_id: int, start_time: str, job_type: str) -> bool:
        """
        중복 작업 확인
        
        Args:
            customer_id: 고객사 ID
            start_time: 시작 시간
            job_type: 작업 유형
        
        Returns:
            bool: 중복 여부 (True: 중복, False: 신규)
        """
        try:
            query = """
                SELECT COUNT(*) FROM backup_jobs
                WHERE customer_id = %s AND start_time = %s AND job_type = %s
            """
            self.cursor.execute(query, (customer_id, start_time, job_type))
            count = self.cursor.fetchone()[0]
            return count > 0
        except Exception as e:
            logger.error(f"중복 확인 실패: {e}")
            return False
    
    def insert_backup_job(self, record: Dict) -> bool:
        """
        백업 작업 데이터 삽입
        
        Args:
            record: 백업 작업 레코드
        
        Returns:
            bool: 삽입 성공 여부
        """
        try:
            # 고객사 ID 조회/생성
            customer_id = self.get_customer_id(record['customer_name'])
            if not customer_id:
                return False
            
            # 중복 확인
            if self.check_duplicate(customer_id, record['start_time'], record['job_type']):
                logger.debug(f"중복 작업 건너뜀: {record['customer_name']} @ {record['start_time']}")
                return True  # 중복은 에러가 아님
            
            # 데이터 삽입
            query = """
                INSERT INTO backup_jobs (
                    customer_id, job_type, backup_server, status,
                    start_time, end_time, duration_minutes, backup_size_gb,
                    error_code, error_message, policy_name, job_id, created_at
                ) VALUES (
                    %s, %s, %s, %s,
                    %s, %s, %s, %s,
                    %s, %s, %s, %s, NOW()
                )
            """
            
            values = (
                customer_id,
                record['job_type'],
                record['backup_server'],
                record['status'],
                record['start_time'],
                record['end_time'],
                record['duration_minutes'],
                record['backup_size_gb'],
                record['error_code'],
                record['error_message'],
                record['policy_name'],
                record['job_id']
            )
            
            self.cursor.execute(query, values)
            self.conn.commit()
            
            logger.info(f"✅ 작업 저장: {record['customer_name']} - {record['status']} @ {record['start_time']}")
            return True
        
        except Exception as e:
            logger.error(f"❌ 작업 저장 실패: {e}")
            self.conn.rollback()
            return False
    
    def insert_batch(self, records: List[Dict]) -> Tuple[int, int]:
        """
        배치 삽입
        
        Args:
            records: 레코드 리스트
        
        Returns:
            Tuple[int, int]: (성공 개수, 실패 개수)
        """
        success_count = 0
        failure_count = 0
        
        for record in records:
            if self.insert_backup_job(record):
                success_count += 1
            else:
                failure_count += 1
        
        return success_count, failure_count
    
    def get_recent_failures(self, days: int = 7, limit: int = 10) -> List[Dict]:
        """
        최근 장애 목록 조회
        
        Args:
            days: 며칠 전부터
            limit: 최대 개수
        
        Returns:
            List[Dict]: 장애 목록
        """
        try:
            query = """
                SELECT 
                    c.name AS customer_name,
                    bj.status,
                    bj.error_code,
                    bj.error_message,
                    bj.start_time,
                    bj.job_type
                FROM backup_jobs bj
                JOIN customers c ON bj.customer_id = c.customer_id
                WHERE bj.status IN ('failure', 'warning')
                  AND bj.start_time >= NOW() - INTERVAL '%s days'
                ORDER BY bj.start_time DESC
                LIMIT %s
            """
            
            self.cursor.execute(query, (days, limit))
            rows = self.cursor.fetchall()
            
            failures = []
            for row in rows:
                failures.append({
                    'customer_name': row[0],
                    'status': row[1],
                    'error_code': row[2],
                    'error_message': row[3],
                    'start_time': row[4].isoformat() if row[4] else None,
                    'job_type': row[5]
                })
            
            return failures
        
        except Exception as e:
            logger.error(f"최근 장애 조회 실패: {e}")
            return []
    
    def get_statistics(self, days: int = 30) -> Dict:
        """
        통계 정보 조회
        
        Args:
            days: 며칠 전부터
        
        Returns:
            Dict: 통계 정보
        """
        try:
            query = """
                SELECT 
                    COUNT(*) FILTER (WHERE status = 'success') AS success_count,
                    COUNT(*) FILTER (WHERE status = 'failure') AS failure_count,
                    COUNT(*) FILTER (WHERE status = 'warning') AS warning_count,
                    COUNT(DISTINCT customer_id) AS customer_count
                FROM backup_jobs
                WHERE start_time >= NOW() - INTERVAL '%s days'
            """
            
            self.cursor.execute(query, (days,))
            row = self.cursor.fetchone()
            
            return {
                'success_count': row[0] or 0,
                'failure_count': row[1] or 0,
                'warning_count': row[2] or 0,
                'customer_count': row[3] or 0,
                'period_days': days
            }
        
        except Exception as e:
            logger.error(f"통계 조회 실패: {e}")
            return {
                'success_count': 0,
                'failure_count': 0,
                'warning_count': 0,
                'customer_count': 0,
                'period_days': days
            }
    
    def log_email_processing(self, email_id: str, subject: str, 
                            attachments_count: int, records_inserted: int,
                            status: str, error_message: str = None):
        """
        이메일 처리 로그 저장
        
        Args:
            email_id: 이메일 ID
            subject: 제목
            attachments_count: 첨부파일 개수
            records_inserted: 삽입된 레코드 수
            status: 처리 상태 (success, partial, failure)
            error_message: 에러 메시지 (옵션)
        """
        try:
            # email_processing_log 테이블이 없으면 생성
            create_table_query = """
                CREATE TABLE IF NOT EXISTS email_processing_log (
                    log_id SERIAL PRIMARY KEY,
                    email_id VARCHAR(255),
                    subject TEXT,
                    attachments_count INTEGER,
                    records_inserted INTEGER,
                    status VARCHAR(50),
                    error_message TEXT,
                    processed_at TIMESTAMP DEFAULT NOW()
                )
            """
            self.cursor.execute(create_table_query)
            
            # 로그 삽입
            insert_query = """
                INSERT INTO email_processing_log (
                    email_id, subject, attachments_count, 
                    records_inserted, status, error_message
                ) VALUES (%s, %s, %s, %s, %s, %s)
            """
            
            self.cursor.execute(insert_query, (
                email_id, subject, attachments_count,
                records_inserted, status, error_message
            ))
            self.conn.commit()
        
        except Exception as e:
            logger.error(f"이메일 처리 로그 저장 실패: {e}")
            self.conn.rollback()


def test_database_manager():
    """테스트 함수"""
    print("=" * 60)
    print("Database Manager 테스트")
    print("=" * 60)
    
    db = DatabaseManager()
    
    # 연결 테스트
    if db.connect():
        print("✅ DB 연결 성공\n")
        
        # 샘플 데이터 삽입
        sample_record = {
            'customer_name': '테스트고객사',
            'job_type': 'Full',
            'backup_server': 'NBU-01',
            'status': 'failure',
            'start_time': '2026-02-16 01:00:00',
            'end_time': '2026-02-16 02:30:00',
            'duration_minutes': 90,
            'backup_size_gb': 150.5,
            'error_code': '58',
            'error_message': '테스트 에러 메시지',
            'policy_name': 'Daily_Full_Backup',
            'job_id': 'TEST12345'
        }
        
        print("샘플 데이터 삽입...")
        if db.insert_backup_job(sample_record):
            print("✅ 삽입 성공\n")
        
        # 통계 조회
        print("통계 조회 (최근 30일)...")
        stats = db.get_statistics(30)
        print(f"  성공: {stats['success_count']}개")
        print(f"  실패: {stats['failure_count']}개")
        print(f"  경고: {stats['warning_count']}개")
        print(f"  고객사: {stats['customer_count']}개\n")
        
        # 최근 장애 조회
        print("최근 장애 목록 (최근 7일)...")
        failures = db.get_recent_failures(7, 5)
        for idx, failure in enumerate(failures, 1):
            print(f"  {idx}. {failure['customer_name']} - [{failure['error_code']}] {failure['error_message']}")
        
        db.disconnect()
    else:
        print("❌ DB 연결 실패")
    
    print("=" * 60)


if __name__ == '__main__':
    test_database_manager()
