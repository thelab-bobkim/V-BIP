"""
V-BIP Phase 3-A: Email Monitor
이메일 자동 모니터링 및 첨부파일 다운로드
"""
from trigger_ai_diagnosis import trigger_ai_diagnosis

import imaplib
import email
from email.header import decode_header
import os
import time
import logging
from datetime import datetime, timedelta
from typing import List, Dict, Tuple, Optional
from pathlib import Path

from config import EMAIL_CONFIG, LOGGING_CONFIG


# 로깅 설정
logging.basicConfig(
    level=getattr(logging, LOGGING_CONFIG['level']),
    format=LOGGING_CONFIG['format']
)
logger = logging.getLogger(__name__)


class EmailMonitor:
    """
    Veritas 장애 메일 모니터링 클래스
    """
    
    def __init__(self):
        """초기화"""
        self.imap_server = EMAIL_CONFIG['imap_server']
        self.imap_port = EMAIL_CONFIG['imap_port']
        self.email = EMAIL_CONFIG['email']
        self.password = EMAIL_CONFIG['password']
        self.mailbox = EMAIL_CONFIG['mailbox']
        self.attachment_folder = EMAIL_CONFIG['attachment_folder']
        
        # 첨부파일 폴더 생성
        Path(self.attachment_folder).mkdir(parents=True, exist_ok=True)
        
        self.connection = None
        self.last_check_time = None
    
    def connect(self) -> bool:
        """
        IMAP 서버 연결
        
        Returns:
            bool: 연결 성공 여부
        """
        try:
            logger.info(f"IMAP 서버 연결 시도: {self.imap_server}:{self.imap_port}")
            self.connection = imaplib.IMAP4_SSL(self.imap_server, self.imap_port)
            self.connection.login(self.email, self.password)
            logger.info("✅ IMAP 연결 성공")
            return True
        except Exception as e:
            logger.error(f"❌ IMAP 연결 실패: {e}")
            return False
    
    def disconnect(self):
        """IMAP 서버 연결 해제"""
        if self.connection:
            try:
                self.connection.logout()
                logger.info("IMAP 연결 해제됨")
            except:
                pass
    
    def is_veritas_email(self, sender: str, subject: str) -> bool:
        """
        Veritas 관련 이메일인지 확인
        
        Args:
            sender: 발신자 이메일
            subject: 제목
        
        Returns:
            bool: Veritas 이메일 여부
        """
        sender_lower = sender.lower()
        subject_lower = subject.lower()
        
        # 발신자 필터
        for keyword in EMAIL_CONFIG['sender_filter']:
            if keyword.lower() in sender_lower:
                return True
        
        # 제목 키워드 필터
        for keyword in EMAIL_CONFIG['subject_keywords']:
            if keyword.lower() in subject_lower:
                return True
        
        return False
    
    def decode_mime_words(self, s: str) -> str:
        """
        MIME 인코딩된 문자열 디코드
        
        Args:
            s: MIME 문자열
        
        Returns:
            str: 디코드된 문자열
        """
        try:
            decoded_parts = []
            for word, encoding in decode_header(s):
                if isinstance(word, bytes):
                    decoded_parts.append(word.decode(encoding or 'utf-8', errors='ignore'))
                else:
                    decoded_parts.append(word)
            return ''.join(decoded_parts)
        except Exception as e:
            logger.warning(f"디코드 실패: {e}, 원본 반환")
            return str(s)
    
    def download_attachment(self, part, filename: str) -> Optional[str]:
        """
        첨부파일 다운로드
        
        Args:
            part: 이메일 파트
            filename: 파일명
        
        Returns:
            Optional[str]: 저장된 파일 경로 (실패 시 None)
        """
        try:
            # 파일 확장자 확인
            ext = os.path.splitext(filename)[1].lower()
            if ext not in EMAIL_CONFIG['allowed_extensions']:
                logger.debug(f"허용되지 않은 파일 형식: {filename}")
                return None
            
            # 파일 크기 확인
            payload = part.get_payload(decode=True)
            size_mb = len(payload) / (1024 * 1024)
            if size_mb > EMAIL_CONFIG['max_attachment_size_mb']:
                logger.warning(f"파일 크기 초과: {filename} ({size_mb:.2f}MB)")
                return None
            
            # 파일명 정리 (타임스탬프 추가)
            timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
            safe_filename = f"{timestamp}_{filename}"
            filepath = os.path.join(self.attachment_folder, safe_filename)
            
            # 파일 저장
            with open(filepath, 'wb') as f:
                f.write(payload)
            
            logger.info(f"✅ 첨부파일 다운로드: {safe_filename} ({size_mb:.2f}MB)")
            return filepath
        
        except Exception as e:
            logger.error(f"❌ 첨부파일 다운로드 실패: {filename}, {e}")
            return None
    
    def fetch_new_emails(self, since_minutes: int = None) -> List[Dict]:
        """
        새 이메일 가져오기
        
        Args:
            since_minutes: 몇 분 전부터 검색할지 (None이면 전체)
        
        Returns:
            List[Dict]: 이메일 정보 리스트
        """
        if not self.connection:
            if not self.connect():
                return []
        
        try:
            # 메일박스 선택
            self.connection.select(self.mailbox)
            
            # 검색 조건 설정
            if since_minutes:
                since_date = (datetime.now() - timedelta(minutes=since_minutes)).strftime('%d-%b-%Y')
                search_criteria = f'(SINCE {since_date})'
            else:
                search_criteria = 'ALL'
            
            # 이메일 검색
            status, messages = self.connection.search(None, search_criteria)
            if status != 'OK':
                logger.error("이메일 검색 실패")
                return []
            
            email_ids = messages[0].split()
            logger.info(f"검색된 이메일: {len(email_ids)}개")
            
            # 이메일 처리
            emails = []
            for email_id in email_ids[-50:]:  # 최근 50개만 처리
                email_data = self.process_email(email_id)
                if email_data:
                    emails.append(email_data)
            
            return emails
        
        except Exception as e:
            logger.error(f"이메일 가져오기 실패: {e}")
            return []
    
    def process_email(self, email_id: bytes) -> Optional[Dict]:
        """
        개별 이메일 처리
        
        Args:
            email_id: 이메일 ID
        
        Returns:
            Optional[Dict]: 이메일 정보 (Veritas 이메일이 아니면 None)
        """
        try:
            # 이메일 가져오기
            status, msg_data = self.connection.fetch(email_id, '(RFC822)')
            if status != 'OK':
                return None
            
            # 이메일 파싱
            raw_email = msg_data[0][1]
            msg = email.message_from_bytes(raw_email)
            
            # 발신자, 제목 추출
            sender = self.decode_mime_words(msg.get('From', ''))
            subject = self.decode_mime_words(msg.get('Subject', ''))
            date_str = msg.get('Date', '')
            
            # Veritas 이메일인지 확인
            if not self.is_veritas_email(sender, subject):
                return None
            
            logger.info(f"📧 Veritas 이메일 발견: {subject}")
            
            # 첨부파일 처리
            attachments = []
            if msg.is_multipart():
                for part in msg.walk():
                    content_disposition = str(part.get('Content-Disposition', ''))
                    
                    if 'attachment' in content_disposition:
                        filename = part.get_filename()
                        if filename:
                            filename = self.decode_mime_words(filename)
                            filepath = self.download_attachment(part, filename)
                            if filepath:
                                attachments.append(filepath)
            
            return {
                'email_id': email_id.decode(),
                'sender': sender,
                'subject': subject,
                'date': date_str,
                'attachments': attachments,
                'received_at': datetime.now().isoformat()
            }
        
        except Exception as e:
            logger.error(f"이메일 처리 실패: {e}")
            return None
    
    def mark_as_read(self, email_id: str):
        """
        이메일을 읽음으로 표시
        
        Args:
            email_id: 이메일 ID
        """
        try:
            self.connection.store(email_id.encode(), '+FLAGS', '\\Seen')
        except Exception as e:
            logger.error(f"이메일 읽음 표시 실패: {e}")
    
    def cleanup_old_attachments(self, days: int = 7):
        """
        오래된 첨부파일 삭제
        
        Args:
            days: 며칠 이전 파일 삭제
        """
        try:
            cutoff_time = time.time() - (days * 86400)
            deleted_count = 0
            
            for filename in os.listdir(self.attachment_folder):
                filepath = os.path.join(self.attachment_folder, filename)
                if os.path.isfile(filepath):
                    if os.path.getmtime(filepath) < cutoff_time:
                        os.remove(filepath)
                        deleted_count += 1
            
            if deleted_count > 0:
                logger.info(f"🗑️ 오래된 첨부파일 {deleted_count}개 삭제")
        
        except Exception as e:
            logger.error(f"첨부파일 정리 실패: {e}")


def test_email_monitor():
    """테스트 함수"""
    print("=" * 60)
    print("Email Monitor 테스트")
    print("=" * 60)
    
    monitor = EmailMonitor()
    
    # 연결 테스트
    if monitor.connect():
        print("✅ 연결 성공\n")
        
        # 최근 이메일 가져오기 (지난 24시간)
        print("최근 24시간 이메일 검색 중...")
        emails = monitor.fetch_new_emails(since_minutes=24*60)
        
        print(f"\n발견된 Veritas 이메일: {len(emails)}개\n")
        
        for idx, email_data in enumerate(emails, 1):
            print(f"{idx}. 제목: {email_data['subject']}")
            print(f"   발신자: {email_data['sender']}")
            print(f"   첨부파일: {len(email_data['attachments'])}개")
            if email_data['attachments']:
                for att in email_data['attachments']:
                    print(f"     - {os.path.basename(att)}")
            print()
        
        monitor.disconnect()
    else:
        print("❌ 연결 실패")
    
    print("=" * 60)


if __name__ == '__main__':
    test_email_monitor()
