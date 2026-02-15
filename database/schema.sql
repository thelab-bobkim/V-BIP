-- ============================================
-- V-BIP (Veritas Backup Intelligence Platform)
-- Database Schema v1.0
-- ============================================

-- 1. 엔지니어 마스터 테이블
CREATE TABLE IF NOT EXISTS engineers (
    engineer_id SERIAL PRIMARY KEY,
    employee_code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(50),
    specialization TEXT[], -- ARRAY type for PostgreSQL
    skill_level VARCHAR(20) DEFAULT 'Senior', -- 'Junior', 'Senior', 'Expert'
    max_concurrent_tickets INTEGER DEFAULT 5,
    current_workload INTEGER DEFAULT 0,
    status VARCHAR(20) DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. 고객사 마스터 테이블
CREATE TABLE IF NOT EXISTS customers (
    customer_id SERIAL PRIMARY KEY,
    customer_code VARCHAR(50) UNIQUE NOT NULL,
    customer_name VARCHAR(200) NOT NULL,
    business_number VARCHAR(20),
    address TEXT,
    contact_person VARCHAR(100),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(50),
    site_type VARCHAR(20) DEFAULT 'Hybrid', -- 'Remote', 'Onsite', 'Hybrid'
    access_method VARCHAR(20), -- 'VPN', 'TeamViewer', 'OnSite'
    veritas_version VARCHAR(50),
    veritas_license_expiry DATE,
    server_count INTEGER DEFAULT 0,
    total_backup_size_gb DECIMAL(15,2),
    contract_tier VARCHAR(20) DEFAULT 'Silver', -- 'Gold', 'Silver', 'Bronze'
    monthly_fee DECIMAL(12,2),
    sla_response_hours INTEGER DEFAULT 8, -- 4, 8, 24
    sla_resolution_hours INTEGER DEFAULT 24,
    primary_engineer_id INTEGER,
    secondary_engineer_id INTEGER,
    portal_access_enabled BOOLEAN DEFAULT FALSE,
    portal_username VARCHAR(100),
    portal_password_hash VARCHAR(255),
    notes TEXT,
    status VARCHAR(20) DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. 에러 패턴 및 트러블슈팅 가이드
CREATE TABLE IF NOT EXISTS error_patterns (
    pattern_id SERIAL PRIMARY KEY,
    error_code VARCHAR(50) UNIQUE NOT NULL,
    error_type VARCHAR(100),
    error_name VARCHAR(200),
    error_description TEXT,
    symptom TEXT,
    root_cause TEXT,
    troubleshooting_steps TEXT,
    auto_fix_script TEXT,
    auto_fix_enabled BOOLEAN DEFAULT FALSE,
    manual_steps_required BOOLEAN DEFAULT TRUE,
    prevention_tips TEXT,
    related_kb_articles TEXT,
    severity VARCHAR(20) DEFAULT 'Medium', -- 'Critical', 'High', 'Medium', 'Low'
    avg_resolution_minutes INTEGER,
    occurrence_frequency INTEGER DEFAULT 0,
    success_rate_percent DECIMAL(5,2),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. 백업 작업 로그
CREATE TABLE IF NOT EXISTS backup_jobs (
    job_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    server_name VARCHAR(100),
    policy_name VARCHAR(200),
    job_name VARCHAR(200),
    backup_type VARCHAR(50) DEFAULT 'Full', -- 'Full', 'Incremental', 'Differential'
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    duration_minutes INTEGER,
    status VARCHAR(20) DEFAULT 'Running', -- 'Success', 'Failed', 'Warning', 'Running'
    exit_code INTEGER,
    error_code VARCHAR(50),
    error_message TEXT,
    bytes_written BIGINT,
    files_backed_up INTEGER,
    log_source VARCHAR(50) DEFAULT 'Email', -- 'Email', 'WebUpload', 'Agent'
    uploaded_by VARCHAR(100),
    uploaded_at TIMESTAMP,
    raw_log_file_path TEXT,
    parsed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. 티켓 시스템
CREATE TABLE IF NOT EXISTS tickets (
    ticket_id SERIAL PRIMARY KEY,
    ticket_number VARCHAR(50) UNIQUE NOT NULL,
    customer_id INTEGER NOT NULL,
    job_id INTEGER,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    severity VARCHAR(20) DEFAULT 'Medium', -- 'Critical', 'High', 'Medium', 'Low'
    status VARCHAR(20) DEFAULT 'Open', -- 'Open', 'InProgress', 'Resolved', 'Closed'
    assigned_engineer_id INTEGER,
    created_by VARCHAR(100) DEFAULT 'System',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    assigned_at TIMESTAMP,
    first_response_at TIMESTAMP,
    resolved_at TIMESTAMP,
    closed_at TIMESTAMP,
    sla_deadline TIMESTAMP,
    sla_violated BOOLEAN DEFAULT FALSE,
    resolution_notes TEXT,
    customer_feedback INTEGER -- 1-5 rating
);

-- 6. 알림 히스토리
CREATE TABLE IF NOT EXISTS alert_history (
    alert_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    job_id INTEGER,
    ticket_id INTEGER,
    alert_type VARCHAR(50) DEFAULT 'Email', -- 'Email', 'Slack', 'SMS', 'Portal'
    recipient VARCHAR(200),
    subject VARCHAR(255),
    message TEXT,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    delivery_status VARCHAR(20) DEFAULT 'Sent', -- 'Sent', 'Failed', 'Pending'
    read_at TIMESTAMP
);

-- 7. 로그 업로드 히스토리
CREATE TABLE IF NOT EXISTS log_uploads (
    upload_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    upload_method VARCHAR(20) DEFAULT 'Email', -- 'Email', 'WebUpload', 'Agent'
    file_name VARCHAR(255),
    file_size_kb INTEGER,
    uploader_email VARCHAR(100),
    upload_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    parsing_status VARCHAR(20) DEFAULT 'Success', -- 'Success', 'Failed', 'Partial'
    jobs_extracted INTEGER DEFAULT 0,
    errors_found INTEGER DEFAULT 0,
    processing_time_seconds DECIMAL(10,2),
    error_message TEXT
);

-- 8. 자동 복구 실행 로그
CREATE TABLE IF NOT EXISTS auto_recovery_logs (
    recovery_id SERIAL PRIMARY KEY,
    job_id INTEGER,
    error_code VARCHAR(50),
    script_executed TEXT,
    execution_start TIMESTAMP,
    execution_end TIMESTAMP,
    exit_code INTEGER,
    output_log TEXT,
    success BOOLEAN DEFAULT FALSE,
    retry_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 9. 월간 리포트 생성 히스토리
CREATE TABLE IF NOT EXISTS monthly_reports (
    report_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    report_month DATE,
    total_backup_jobs INTEGER,
    successful_jobs INTEGER,
    failed_jobs INTEGER,
    success_rate_percent DECIMAL(5,2),
    total_data_backed_up_gb DECIMAL(15,2),
    incidents_count INTEGER,
    avg_resolution_minutes DECIMAL(10,2),
    sla_compliance_percent DECIMAL(5,2),
    report_file_path TEXT,
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sent_to_customer_at TIMESTAMP
);

-- 10. 시스템 설정
CREATE TABLE IF NOT EXISTS system_config (
    config_key VARCHAR(100) PRIMARY KEY,
    config_value TEXT,
    description TEXT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 인덱스 생성 (성능 최적화)
CREATE INDEX IF NOT EXISTS idx_backup_jobs_customer_time ON backup_jobs(customer_id, start_time DESC);
CREATE INDEX IF NOT EXISTS idx_backup_jobs_status_time ON backup_jobs(status, start_time DESC);
CREATE INDEX IF NOT EXISTS idx_backup_jobs_error_code ON backup_jobs(error_code);
CREATE INDEX IF NOT EXISTS idx_tickets_customer_status ON tickets(customer_id, status);
CREATE INDEX IF NOT EXISTS idx_tickets_engineer_status ON tickets(assigned_engineer_id, status);
CREATE INDEX IF NOT EXISTS idx_tickets_sla ON tickets(sla_deadline, status);
CREATE INDEX IF NOT EXISTS idx_alert_history_customer_sent ON alert_history(customer_id, sent_at DESC);
CREATE INDEX IF NOT EXISTS idx_log_uploads_customer_upload ON log_uploads(customer_id, upload_timestamp DESC);

-- Foreign Key 제약 조건 추가 (참조 무결성)
ALTER TABLE customers ADD CONSTRAINT fk_customers_primary_engineer 
    FOREIGN KEY (primary_engineer_id) REFERENCES engineers(engineer_id) ON DELETE SET NULL;

ALTER TABLE customers ADD CONSTRAINT fk_customers_secondary_engineer 
    FOREIGN KEY (secondary_engineer_id) REFERENCES engineers(engineer_id) ON DELETE SET NULL;

ALTER TABLE backup_jobs ADD CONSTRAINT fk_backup_jobs_customer 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

ALTER TABLE tickets ADD CONSTRAINT fk_tickets_customer 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

ALTER TABLE tickets ADD CONSTRAINT fk_tickets_job 
    FOREIGN KEY (job_id) REFERENCES backup_jobs(job_id) ON DELETE SET NULL;

ALTER TABLE tickets ADD CONSTRAINT fk_tickets_engineer 
    FOREIGN KEY (assigned_engineer_id) REFERENCES engineers(engineer_id) ON DELETE SET NULL;

ALTER TABLE alert_history ADD CONSTRAINT fk_alert_history_customer 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

ALTER TABLE alert_history ADD CONSTRAINT fk_alert_history_job 
    FOREIGN KEY (job_id) REFERENCES backup_jobs(job_id) ON DELETE CASCADE;

ALTER TABLE alert_history ADD CONSTRAINT fk_alert_history_ticket 
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id) ON DELETE CASCADE;

ALTER TABLE log_uploads ADD CONSTRAINT fk_log_uploads_customer 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

ALTER TABLE auto_recovery_logs ADD CONSTRAINT fk_auto_recovery_logs_job 
    FOREIGN KEY (job_id) REFERENCES backup_jobs(job_id) ON DELETE CASCADE;

ALTER TABLE monthly_reports ADD CONSTRAINT fk_monthly_reports_customer 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;
