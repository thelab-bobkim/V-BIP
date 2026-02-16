"""
V-BIP Phase 3-B: Knowledge Base Builder
PDF 문서에서 Vector Database 구축
"""

import os
import json
from typing import List, Dict, Any
from pathlib import Path
import hashlib

try:
    import pdfplumber
    from langchain.text_splitter import RecursiveCharacterTextSplitter
    from langchain_community.vectorstores import Chroma
    from langchain_openai import OpenAIEmbeddings
    from loguru import logger
except ImportError as e:
    print(f"⚠️ 필요한 라이브러리를 설치하세요: {e}")
    print("pip install -r requirements_phase3b.txt")

from config_ai import AIConfig


class KnowledgeBaseBuilder:
    """NetBackup 지식 베이스 구축"""
    
    def __init__(self):
        self.config = AIConfig
        self.embeddings = None
        self.vectorstore = None
        self.documents = []
        
        # 디렉토리 생성
        os.makedirs(self.config.KNOWLEDGE_BASE_DIR, exist_ok=True)
        os.makedirs(self.config.CHROMA_PERSIST_DIR, exist_ok=True)
        
        logger.info("KnowledgeBaseBuilder 초기화 완료")
    
    def extract_text_from_pdf(self, pdf_path: str) -> List[Dict[str, Any]]:
        """
        PDF에서 텍스트 추출
        
        Args:
            pdf_path: PDF 파일 경로
            
        Returns:
            List of documents with metadata
        """
        logger.info(f"📄 PDF 처리 중: {pdf_path}")
        documents = []
        
        try:
            with pdfplumber.open(pdf_path) as pdf:
                total_pages = len(pdf.pages)
                logger.info(f"   총 {total_pages} 페이지")
                
                for page_num, page in enumerate(pdf.pages, 1):
                    text = page.extract_text()
                    
                    if text and len(text.strip()) > 50:
                        doc = {
                            'content': text,
                            'metadata': {
                                'source': os.path.basename(pdf_path),
                                'page': page_num,
                                'total_pages': total_pages,
                                'doc_type': 'troubleshooting_guide' if 'troubleshooting' in pdf_path.lower() else 'admin_guide'
                            }
                        }
                        documents.append(doc)
                    
                    if page_num % 50 == 0:
                        logger.info(f"   진행: {page_num}/{total_pages} 페이지")
                
                logger.success(f"✅ {len(documents)} 페이지 추출 완료")
                
        except Exception as e:
            logger.error(f"❌ PDF 처리 실패: {e}")
            raise
        
        return documents
    
    def chunk_documents(self, documents: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """
        문서를 작은 청크로 분할
        
        Args:
            documents: 원본 문서 리스트
            
        Returns:
            Chunked documents with metadata
        """
        logger.info("📝 문서 청킹 중...")
        
        text_splitter = RecursiveCharacterTextSplitter(
            chunk_size=self.config.CHUNK_SIZE,
            chunk_overlap=self.config.CHUNK_OVERLAP,
            separators=["\n\n", "\n", ". ", " ", ""]
        )
        
        chunked_docs = []
        
        for doc in documents:
            chunks = text_splitter.split_text(doc['content'])
            
            for idx, chunk in enumerate(chunks):
                chunked_doc = {
                    'content': chunk,
                    'metadata': {
                        **doc['metadata'],
                        'chunk_id': idx,
                        'total_chunks': len(chunks),
                        'chunk_hash': hashlib.md5(chunk.encode()).hexdigest()
                    }
                }
                chunked_docs.append(chunked_doc)
        
        logger.success(f"✅ {len(chunked_docs)} 청크 생성 완료")
        return chunked_docs
    
    def build_vector_store(self, documents: List[Dict[str, Any]]):
        """
        Vector Store 구축 (ChromaDB)
        
        Args:
            documents: 청크된 문서 리스트
        """
        logger.info("🔨 Vector Store 구축 중...")
        
        try:
            # OpenAI Embeddings 초기화
            self.embeddings = OpenAIEmbeddings(
                model=self.config.EMBEDDING_MODEL,
                openai_api_key=self.config.OPENAI_API_KEY
            )
            
            # 문서 준비
            texts = [doc['content'] for doc in documents]
            metadatas = [doc['metadata'] for doc in documents]
            
            logger.info(f"   총 {len(texts)} 텍스트 임베딩 생성 중...")
            
            # ChromaDB Vector Store 생성
            self.vectorstore = Chroma.from_texts(
                texts=texts,
                embedding=self.embeddings,
                metadatas=metadatas,
                collection_name=self.config.CHROMA_COLLECTION_NAME,
                persist_directory=self.config.CHROMA_PERSIST_DIR
            )
            
            logger.success("✅ Vector Store 구축 완료")
            logger.info(f"   저장 위치: {self.config.CHROMA_PERSIST_DIR}")
            
        except Exception as e:
            logger.error(f"❌ Vector Store 구축 실패: {e}")
            raise
    
    def build_from_pdfs(self, pdf_paths: List[str]):
        """
        PDF 파일들로부터 전체 지식 베이스 구축
        
        Args:
            pdf_paths: PDF 파일 경로 리스트
        """
        logger.info("=" * 60)
        logger.info("🚀 지식 베이스 구축 시작")
        logger.info("=" * 60)
        
        all_documents = []
        
        # 1. PDF 텍스트 추출
        for pdf_path in pdf_paths:
            if not os.path.exists(pdf_path):
                logger.warning(f"⚠️ 파일 없음: {pdf_path}")
                continue
            
            docs = self.extract_text_from_pdf(pdf_path)
            all_documents.extend(docs)
        
        logger.info(f"📊 전체 추출: {len(all_documents)} 페이지")
        
        # 2. 문서 청킹
        chunked_docs = self.chunk_documents(all_documents)
        
        # 3. Vector Store 구축
        self.build_vector_store(chunked_docs)
        
        # 4. 통계 저장
        self.save_statistics(pdf_paths, all_documents, chunked_docs)
        
        logger.info("=" * 60)
        logger.success("✅ 지식 베이스 구축 완료!")
        logger.info("=" * 60)
    
    def save_statistics(self, pdf_paths: List[str], documents: List[Dict], chunks: List[Dict]):
        """지식 베이스 통계 저장"""
        stats = {
            'build_date': str(Path.ctime(Path.cwd())),
            'total_pdfs': len(pdf_paths),
            'pdf_files': [os.path.basename(p) for p in pdf_paths],
            'total_pages': len(documents),
            'total_chunks': len(chunks),
            'avg_chunk_size': sum(len(c['content']) for c in chunks) / len(chunks) if chunks else 0,
            'embedding_model': self.config.EMBEDDING_MODEL,
            'chunk_size': self.config.CHUNK_SIZE,
            'chunk_overlap': self.config.CHUNK_OVERLAP
        }
        
        stats_path = os.path.join(self.config.CHROMA_PERSIST_DIR, 'kb_statistics.json')
        with open(stats_path, 'w', encoding='utf-8') as f:
            json.dump(stats, f, indent=2, ensure_ascii=False)
        
        logger.info(f"📊 통계 저장: {stats_path}")
        logger.info(f"   - PDF: {stats['total_pdfs']}개")
        logger.info(f"   - 페이지: {stats['total_pages']}개")
        logger.info(f"   - 청크: {stats['total_chunks']}개")
        logger.info(f"   - 평균 청크 크기: {stats['avg_chunk_size']:.0f} 문자")
    
    def test_search(self, query: str, k: int = 3):
        """지식 베이스 검색 테스트"""
        if not self.vectorstore:
            logger.error("Vector Store가 로드되지 않았습니다.")
            return
        
        logger.info(f"🔍 검색 테스트: '{query}'")
        results = self.vectorstore.similarity_search(query, k=k)
        
        for idx, result in enumerate(results, 1):
            logger.info(f"\n결과 {idx}:")
            logger.info(f"  출처: {result.metadata.get('source', 'Unknown')}")
            logger.info(f"  페이지: {result.metadata.get('page', 'N/A')}")
            logger.info(f"  내용 (앞 200자): {result.page_content[:200]}...")
    
    @classmethod
    def load_existing(cls):
        """기존 Vector Store 로드"""
        instance = cls()
        
        if not os.path.exists(AIConfig.CHROMA_PERSIST_DIR):
            logger.warning("기존 Vector Store가 없습니다. 먼저 build_from_pdfs()를 실행하세요.")
            return None
        
        try:
            instance.embeddings = OpenAIEmbeddings(
                model=AIConfig.EMBEDDING_MODEL,
                openai_api_key=AIConfig.OPENAI_API_KEY
            )
            
            instance.vectorstore = Chroma(
                collection_name=AIConfig.CHROMA_COLLECTION_NAME,
                embedding_function=instance.embeddings,
                persist_directory=AIConfig.CHROMA_PERSIST_DIR
            )
            
            logger.success("✅ 기존 Vector Store 로드 완료")
            return instance
            
        except Exception as e:
            logger.error(f"❌ Vector Store 로드 실패: {e}")
            return None


def main():
    """메인 실행 함수"""
    
    # 1. 설정 검증
    if not AIConfig.validate():
        return
    
    AIConfig.print_config()
    
    # 2. 지식 베이스 빌더 초기화
    builder = KnowledgeBaseBuilder()
    
    # 3. PDF 파일 경로 확인
    kb_dir = AIConfig.KNOWLEDGE_BASE_DIR
    pdf_files = [
        os.path.join(kb_dir, pdf_name)
        for pdf_name in AIConfig.PDF_DOCS
    ]
    
    # 파일 존재 확인
    existing_files = [f for f in pdf_files if os.path.exists(f)]
    
    if not existing_files:
        logger.error(f"❌ PDF 파일을 찾을 수 없습니다.")
        logger.info(f"다음 위치에 PDF를 배치하세요: {kb_dir}")
        logger.info(f"필요한 파일:")
        for pdf in AIConfig.PDF_DOCS:
            logger.info(f"  - {pdf}")
        return
    
    # 4. 지식 베이스 구축
    builder.build_from_pdfs(existing_files)
    
    # 5. 검색 테스트
    logger.info("\n🧪 검색 테스트 시작...")
    test_queries = [
        "Error code 83 media open error",
        "How to restart NetBackup services",
        "Shared memory segment error solution"
    ]
    
    for query in test_queries:
        builder.test_search(query, k=2)
        print()


if __name__ == "__main__":
    main()
