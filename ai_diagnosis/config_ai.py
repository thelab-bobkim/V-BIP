"""
V-BIP Phase 3-B: AI Diagnosis System Configuration
AI 진단 시스템 설정
"""

import os
from typing import Dict, List
from dotenv import load_dotenv

load_dotenv()

class AIConfig:
    """AI 진단 시스템 설정"""
    
    # ============================================
    # OpenAI Configuration
    # ============================================
    OPENAI_API_KEY = os.getenv('OPENAI_API_KEY', '')
    OPENAI_MODEL = os.getenv('OPENAI_MODEL', 'gpt-4-turbo-preview')
    OPENAI_TEMPERATURE = float(os.getenv('OPENAI_TEMPERATURE', '0.3'))
    OPENAI_MAX_TOKENS = int(os.getenv('OPENAI_MAX_TOKENS', '2000'))
    
    # ============================================
    # Vector Database Configuration
    # ============================================
    # Option 1: Pinecone (Cloud)
    USE_PINECONE = os.getenv('USE_PINECONE', 'false').lower() == 'true'
    PINECONE_API_KEY = os.getenv('PINECONE_API_KEY', '')
    PINECONE_ENVIRONMENT = os.getenv('PINECONE_ENVIRONMENT', 'us-east-1-aws')
    PINECONE_INDEX_NAME = os.getenv('PINECONE_INDEX_NAME', 'vbip-netbackup-kb')
    
    # Option 2: ChromaDB (Local, Default)
    CHROMA_PERSIST_DIR = os.getenv('CHROMA_PERSIST_DIR', './chroma_db')
    CHROMA_COLLECTION_NAME = os.getenv('CHROMA_COLLECTION_NAME', 'netbackup_troubleshooting')
    
    # ============================================
    # Embedding Configuration
    # ============================================
    EMBEDDING_MODEL = os.getenv('EMBEDDING_MODEL', 'text-embedding-3-large')
    EMBEDDING_DIMENSION = int(os.getenv('EMBEDDING_DIMENSION', '3072'))
    
    # ============================================
    # Knowledge Base Configuration
    # ============================================
    KNOWLEDGE_BASE_DIR = os.getenv('KNOWLEDGE_BASE_DIR', './knowledge_base')
    PDF_DOCS = [
        'NetBackup_Appliance_Troubleshooting_Guide_511.pdf',
        'NetBackup 52xx and 5330 Appliance Admin Guide_311.pdf'
    ]
    
    # ============================================
    # Document Processing Configuration
    # ============================================
    CHUNK_SIZE = int(os.getenv('CHUNK_SIZE', '1000'))
    CHUNK_OVERLAP = int(os.getenv('CHUNK_OVERLAP', '200'))
    
    # ============================================
    # Diagnosis Configuration
    # ============================================
    TOP_K_RESULTS = int(os.getenv('TOP_K_RESULTS', '5'))
    SIMILARITY_THRESHOLD = float(os.getenv('SIMILARITY_THRESHOLD', '0.7'))
    
    # ============================================
    # Automation Level Thresholds
    # ============================================
    AUTOMATION_LEVELS = {
        'LEVEL_1': {
            'name': '완전 자동',
            'description': '승인 없이 자동 실행',
            'confidence_threshold': 0.9,
            'risk_score_max': 3,
            'estimated_time_max': 5  # minutes
        },
        'LEVEL_2': {
            'name': '승인 후 자동',
            'description': 'Slack 승인 후 실행',
            'confidence_threshold': 0.75,
            'risk_score_max': 6,
            'estimated_time_max': 20
        },
        'LEVEL_3': {
            'name': '가이드 제공',
            'description': '단계별 가이드만 제공',
            'confidence_threshold': 0.5,
            'risk_score_max': 10,
            'estimated_time_max': 60
        }
    }
    
    # ============================================
    # Error Code Mapping (From Troubleshooting Guide)
    # ============================================
    ERROR_CODE_MAP = {
        '13': {
            'name': 'File read failed',
            'category': 'File I/O',
            'common_causes': [
                'Network connection lost',
                'File permissions issue',
                'Socket read timeout'
            ],
            'automation_level': 'LEVEL_1',
            'typical_solutions': [
                'Restart nbpem service',
                'Check network connectivity',
                'Verify file permissions'
            ]
        },
        '48': {
            'name': 'Client host name not found',
            'category': 'Network/DNS',
            'common_causes': [
                'DNS resolution failure',
                'Host not in DNS',
                'Network unreachable'
            ],
            'automation_level': 'LEVEL_2',
            'typical_solutions': [
                'Verify DNS configuration',
                'Check /etc/hosts',
                'Test network connectivity (NBDNA)'
            ]
        },
        '83': {
            'name': 'Media open error',
            'category': 'Media/Storage',
            'common_causes': [
                'Drive not ready',
                'Media not loaded',
                'Hardware failure'
            ],
            'automation_level': 'LEVEL_2',
            'typical_solutions': [
                'Check drive status',
                'Rescan storage devices',
                'Verify media is loaded'
            ]
        },
        '84': {
            'name': 'Media write error',
            'category': 'Media/Storage',
            'common_causes': [
                'Drive write failure',
                'Media full or damaged',
                'Hardware malfunction'
            ],
            'automation_level': 'LEVEL_2',
            'typical_solutions': [
                'Check drive health',
                'Verify media capacity',
                'Reset tape drive'
            ]
        },
        '89': {
            'name': 'Shared memory segment error',
            'category': 'System/Memory',
            'common_causes': [
                'Shared memory full',
                'IPC resource exhaustion',
                'Process crash residue'
            ],
            'automation_level': 'LEVEL_1',
            'typical_solutions': [
                'Clean shared memory (ipcrm)',
                'Restart NetBackup services',
                'Check system resources'
            ]
        },
        '213': {
            'name': 'No storage units available',
            'category': 'Configuration',
            'common_causes': [
                'All storage units busy',
                'Storage unit misconfigured',
                'Resource allocation issue'
            ],
            'automation_level': 'LEVEL_2',
            'typical_solutions': [
                'Check storage unit status',
                'Reconfigure storage pools',
                'Verify resource allocation'
            ]
        },
        '242': {
            'name': 'Duplicate entry',
            'category': 'Catalog/Database',
            'common_causes': [
                'Catalog corruption',
                'Database inconsistency',
                'Duplicate backup image'
            ],
            'automation_level': 'LEVEL_1',
            'typical_solutions': [
                'Run catalog consistency check',
                'Clean duplicate entries (bpexpdate)',
                'Verify catalog integrity'
            ]
        },
        '1500': {
            'name': 'Invalid storage unit',
            'category': 'Configuration',
            'common_causes': [
                'Storage unit not properly configured',
                'Path or device invalid',
                'Configuration mismatch'
            ],
            'automation_level': 'LEVEL_3',
            'typical_solutions': [
                'Reconfigure storage unit',
                'Verify device paths',
                'Check configuration consistency'
            ]
        }
    }
    
    # ============================================
    # Commands Library
    # ============================================
    NETBACKUP_COMMANDS = {
        'status_check': [
            'bpps -a',  # Check all processes
            'bpserviceinfo',  # Service status
            'support-script ShowHealth'  # Hardware health
        ],
        'service_control': [
            'bpdown -f -v',  # Stop services
            'bpup -f -v',  # Start services
            'systemctl restart netbackup'  # Restart via systemd
        ],
        'diagnostic': [
            'bperror -problems -hoursago 24',  # Recent errors
            'bptestbpcd -client <hostname>',  # Test client connectivity
            'NBDNA -problem_report'  # Network diagnostic
        ],
        'storage': [
            'vmquery -a',  # Query all media
            'vmchange -res',  # Reset robot
            'bpstulist -U'  # List storage units
        ],
        'catalog': [
            'bpdbm -consistency',  # Check catalog consistency
            'bpexpdate -recalculate',  # Recalculate expiration
            'bpimmediatecopy -cleanup'  # Clean catalog
        ]
    }
    
    # ============================================
    # Log File Locations
    # ============================================
    LOG_PATHS = {
        'daemon': '/usr/openv/netbackup/logs/*/',
        'admin': '/usr/openv/netbackup/logs/admin/',
        'bpbrm': '/usr/openv/netbackup/logs/bpbrm/',
        'bpdbm': '/usr/openv/netbackup/logs/bpdbm/',
        'system': '/var/log/messages',
        'boot': '/var/log/boot.log'
    }
    
    # ============================================
    # Prompt Templates
    # ============================================
    DIAGNOSIS_PROMPT_TEMPLATE = """
당신은 Veritas NetBackup 전문가입니다. 다음 장애를 분석하고 해결 방안을 제시하세요.

## 장애 정보
- 에러 코드: {error_code}
- 에러 메시지: {error_message}
- 고객사: {customer_name}
- 발생 시간: {occurrence_time}
- 백업 정책: {backup_policy}

## 관련 지식베이스
{knowledge_base_context}

## 분석 요청 사항
1. **원인 분석**: 가능한 원인을 우선순위별로 나열
2. **해결 방안**: 구체적인 조치 단계
3. **필요 명령어**: 실행할 NetBackup 명령어
4. **예상 소요 시간**: 조치 완료까지 예상 시간
5. **자동화 레벨**: LEVEL_1/LEVEL_2/LEVEL_3 중 선택
6. **위험도**: 1-10점 (1=안전, 10=위험)
7. **신뢰도**: 0.0-1.0 (진단의 확신 정도)

응답은 반드시 JSON 형식으로 작성하세요.
"""

    RECOVERY_PROMPT_TEMPLATE = """
다음 진단 결과를 바탕으로 자동 복구 스크립트를 생성하세요.

## 진단 결과
{diagnosis_result}

## 생성 요청 사항
1. **실행 가능한 Bash 스크립트**
2. **각 단계에 대한 한글 설명 주석**
3. **에러 핸들링 포함**
4. **실행 결과 검증 로직**
5. **롤백 절차**

스크립트는 NetBackup 5.x Appliance 환경에서 실행 가능해야 합니다.
"""

    @classmethod
    def validate(cls) -> bool:
        """설정 유효성 검증"""
        errors = []
        
        if not cls.OPENAI_API_KEY:
            errors.append("OPENAI_API_KEY가 설정되지 않았습니다.")
        
        if cls.USE_PINECONE and not cls.PINECONE_API_KEY:
            errors.append("USE_PINECONE=true이지만 PINECONE_API_KEY가 없습니다.")
        
        if errors:
            print("❌ 설정 오류:")
            for error in errors:
                print(f"  - {error}")
            return False
        
        print("✅ 설정 검증 완료")
        return True

    @classmethod
    def print_config(cls):
        """현재 설정 출력"""
        print("=" * 60)
        print("V-BIP Phase 3-B AI Diagnosis Configuration")
        print("=" * 60)
        print(f"OpenAI Model: {cls.OPENAI_MODEL}")
        print(f"Temperature: {cls.OPENAI_TEMPERATURE}")
        print(f"Vector DB: {'Pinecone' if cls.USE_PINECONE else 'ChromaDB (Local)'}")
        print(f"Embedding Model: {cls.EMBEDDING_MODEL}")
        print(f"Knowledge Base: {len(cls.PDF_DOCS)} documents")
        print(f"Error Codes Mapped: {len(cls.ERROR_CODE_MAP)}")
        print("=" * 60)


if __name__ == "__main__":
    # 설정 테스트
    AIConfig.print_config()
    AIConfig.validate()
