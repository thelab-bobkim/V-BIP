-- ============================================================
-- V-BIP 2.3 AI 자동 문제 해결 시스템 스키마 확장
-- error_patterns 테이블에 AI 분류 기능 추가
-- ============================================================

-- error_patterns 테이블 확장
ALTER TABLE error_patterns 
ADD COLUMN IF NOT EXISTS resolution_level INTEGER CHECK (resolution_level IN (1, 2, 3)),
ADD COLUMN IF NOT EXISTS ai_confidence_score DECIMAL(5,2) CHECK (ai_confidence_score BETWEEN 0 AND 100),
ADD COLUMN IF NOT EXISTS classification_reason TEXT,
ADD COLUMN IF NOT EXISTS is_ai_classified BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS ai_model_version VARCHAR(20),
ADD COLUMN IF NOT EXISTS last_ai_analysis_at TIMESTAMP;

COMMENT ON COLUMN error_patterns.resolution_level IS '1: AI 자동 해결, 2: 엔지니어 승인 필요, 3: 온사이트 지원 필요';
COMMENT ON COLUMN error_patterns.ai_confidence_score IS 'AI 분류 신뢰도 점수 (0-100%)';
COMMENT ON COLUMN error_patterns.classification_reason IS 'AI 분류 근거 설명';

-- incidents 테이블 추가 (실시간 장애 추적)
CREATE TABLE IF NOT EXISTS incidents (
    incident_id SERIAL PRIMARY KEY,
    incident_number VARCHAR(50) UNIQUE NOT NULL,
    customer_id INTEGER NOT NULL,
    job_id INTEGER,
    error_code VARCHAR(50),
    
    -- 상태
    status VARCHAR(20) DEFAULT 'open' CHECK (status IN ('open', 'in_progress', 'pending_approval', 'resolved', 'escalated', 'closed')),
    resolution_level INTEGER CHECK (resolution_level IN (1, 2, 3)),
    
    -- AI 분석
    ai_analyzed BOOLEAN DEFAULT FALSE,
    ai_recommended_action TEXT,
    ai_confidence DECIMAL(5,2),
    ai_auto_fix_attempted BOOLEAN DEFAULT FALSE,
    ai_auto_fix_success BOOLEAN,
    
    -- 엔지니어 정보
    assigned_engineer_id INTEGER,
    engineer_notes TEXT,
    approval_status VARCHAR(20) DEFAULT 'pending' CHECK (approval_status IN ('pending', 'approved', 'rejected')),
    approval_notes TEXT,
    approved_by VARCHAR(100),
    approved_at TIMESTAMP,
    
    -- 타임스탬프
    detected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    assigned_at TIMESTAMP,
    resolved_at TIMESTAMP,
    closed_at TIMESTAMP,
    sla_deadline TIMESTAMP,
    sla_violated BOOLEAN DEFAULT FALSE,
    
    -- 해결 정보
    resolution_method VARCHAR(20), -- 'ai_auto', 'engineer_manual', 'hybrid'
    resolution_time_minutes INTEGER,
    customer_satisfaction INTEGER CHECK (customer_satisfaction BETWEEN 1 AND 5),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES backup_jobs(job_id) ON DELETE SET NULL,
    FOREIGN KEY (assigned_engineer_id) REFERENCES engineers(engineer_id) ON DELETE SET NULL
);

-- AI 학습 데이터 테이블
CREATE TABLE IF NOT EXISTS ai_training_data (
    training_id SERIAL PRIMARY KEY,
    error_code VARCHAR(50) NOT NULL,
    incident_id INTEGER,
    
    -- 입력 특징
    error_context JSONB,
    system_info JSONB,
    
    -- 출력 레이블
    actual_resolution_level INTEGER NOT NULL CHECK (actual_resolution_level IN (1, 2, 3)),
    resolution_success BOOLEAN,
    resolution_time_minutes INTEGER,
    
    -- 피드백
    engineer_id INTEGER,
    engineer_feedback TEXT,
    feedback_score INTEGER CHECK (feedback_score BETWEEN 1 AND 5),
    
    -- 메타데이터
    training_source VARCHAR(50) DEFAULT 'manual', -- 'manual', 'automated', 'imported'
    is_validated BOOLEAN DEFAULT FALSE,
    validated_by VARCHAR(100),
    validated_at TIMESTAMP,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (incident_id) REFERENCES incidents(incident_id) ON DELETE SET NULL,
    FOREIGN KEY (engineer_id) REFERENCES engineers(engineer_id) ON DELETE SET NULL
);

-- AI 모델 버전 관리
CREATE TABLE IF NOT EXISTS ai_models (
    model_id SERIAL PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    model_version VARCHAR(20) NOT NULL,
    model_type VARCHAR(50) DEFAULT 'classification', -- 'classification', 'prediction', 'nlp'
    
    -- 성능 지표
    accuracy DECIMAL(5,2),
    precision_score DECIMAL(5,2),
    recall_score DECIMAL(5,2),
    f1_score DECIMAL(5,2),
    
    -- 학습 정보
    training_dataset_size INTEGER,
    training_duration_minutes INTEGER,
    hyperparameters JSONB,
    feature_importance JSONB,
    
    -- 상태
    is_active BOOLEAN DEFAULT FALSE,
    deployment_status VARCHAR(20) DEFAULT 'training' CHECK (deployment_status IN ('training', 'testing', 'production', 'deprecated')),
    
    -- 타임스탬프
    trained_at TIMESTAMP,
    deployed_at TIMESTAMP,
    deprecated_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(model_name, model_version)
);

-- 자동 해결 실행 로그 확장
ALTER TABLE auto_recovery_logs
ADD COLUMN IF NOT EXISTS incident_id INTEGER,
ADD COLUMN IF NOT EXISTS resolution_level INTEGER,
ADD COLUMN IF NOT EXISTS approval_required BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS approved_by VARCHAR(100),
ADD COLUMN IF NOT EXISTS verification_result TEXT,
ADD CONSTRAINT fk_auto_recovery_incident 
    FOREIGN KEY (incident_id) REFERENCES incidents(incident_id) ON DELETE CASCADE;

-- 인덱스 추가 (성능 최적화)
CREATE INDEX IF NOT EXISTS idx_error_patterns_resolution_level ON error_patterns(resolution_level);
CREATE INDEX IF NOT EXISTS idx_error_patterns_ai_confidence ON error_patterns(ai_confidence_score);
CREATE INDEX IF NOT EXISTS idx_error_patterns_auto_fix ON error_patterns(auto_fix_enabled);

CREATE INDEX IF NOT EXISTS idx_incidents_status ON incidents(status);
CREATE INDEX IF NOT EXISTS idx_incidents_customer ON incidents(customer_id);
CREATE INDEX IF NOT EXISTS idx_incidents_error_code ON incidents(error_code);
CREATE INDEX IF NOT EXISTS idx_incidents_detected_at ON incidents(detected_at DESC);
CREATE INDEX IF NOT EXISTS idx_incidents_sla_deadline ON incidents(sla_deadline) WHERE status IN ('open', 'in_progress');

CREATE INDEX IF NOT EXISTS idx_ai_training_data_error_code ON ai_training_data(error_code);
CREATE INDEX IF NOT EXISTS idx_ai_training_data_validated ON ai_training_data(is_validated, validated_at);

CREATE INDEX IF NOT EXISTS idx_ai_models_active ON ai_models(is_active, deployment_status);

-- 뷰 생성
CREATE OR REPLACE VIEW v_ai_auto_resolvable_errors AS
SELECT 
    ep.error_code,
    ep.error_name,
    ep.error_description,
    ep.resolution_level,
    ep.ai_confidence_score,
    ep.auto_fix_enabled,
    ep.auto_fix_script,
    ep.occurrence_frequency,
    ep.success_rate_percent,
    COUNT(DISTINCT atd.training_id) as training_samples,
    AVG(atd.resolution_time_minutes) as avg_resolution_time
FROM error_patterns ep
LEFT JOIN ai_training_data atd ON ep.error_code = atd.error_code
WHERE ep.resolution_level = 1
  AND ep.ai_confidence_score >= 85
  AND ep.auto_fix_enabled = TRUE
GROUP BY ep.pattern_id;

-- 엔지니어 승인 대기 인시던트 뷰
CREATE OR REPLACE VIEW v_pending_approval_incidents AS
SELECT 
    i.incident_number,
    i.incident_id,
    c.customer_name,
    i.error_code,
    ep.error_name,
    i.ai_recommended_action,
    i.ai_confidence,
    i.detected_at,
    i.sla_deadline,
    EXTRACT(EPOCH FROM (i.sla_deadline - CURRENT_TIMESTAMP))/3600 as hours_until_sla_breach,
    e.name as assigned_engineer_name
FROM incidents i
JOIN customers c ON i.customer_id = c.customer_id
LEFT JOIN error_patterns ep ON i.error_code = ep.error_code
LEFT JOIN engineers e ON i.assigned_engineer_id = e.engineer_id
WHERE i.status = 'pending_approval'
  AND i.approval_status = 'pending'
ORDER BY i.sla_deadline ASC;

-- AI 성능 대시보드 뷰
CREATE OR REPLACE VIEW v_ai_performance_dashboard AS
SELECT 
    DATE(i.created_at) as date,
    i.resolution_method,
    COUNT(*) as total_incidents,
    COUNT(CASE WHEN i.status = 'resolved' THEN 1 END) as resolved_count,
    ROUND(AVG(CASE WHEN i.status = 'resolved' THEN 100.0 ELSE 0 END), 2) as resolution_rate,
    ROUND(AVG(i.resolution_time_minutes), 2) as avg_resolution_time,
    ROUND(AVG(i.customer_satisfaction), 2) as avg_satisfaction,
    COUNT(CASE WHEN i.ai_auto_fix_success THEN 1 END) as ai_auto_fix_success_count,
    COUNT(CASE WHEN i.sla_violated THEN 1 END) as sla_violations
FROM incidents i
WHERE i.created_at >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY DATE(i.created_at), i.resolution_method
ORDER BY date DESC;

-- 시스템 설정 추가
INSERT INTO system_config (config_key, config_value, description) VALUES
    ('ai_auto_resolve_threshold', '85', 'AI 자동 해결을 위한 최소 신뢰도 점수 (%)'),
    ('engineer_approval_threshold', '60', '엔지니어 승인이 필요한 최소 신뢰도 점수 (%)'),
    ('onsite_support_threshold', '59', '온사이트 지원이 필요한 최대 신뢰도 점수 (%)'),
    ('max_auto_retry', '3', 'AI 자동 해결 최대 재시도 횟수'),
    ('sla_level1_hours', '1', 'Level 1 SLA (시간)'),
    ('sla_level2_hours', '4', 'Level 2 SLA (시간)'),
    ('sla_level3_hours', '24', 'Level 3 SLA (시간)'),
    ('enable_ai_learning', 'true', 'AI 자동 학습 활성화'),
    ('min_training_samples', '50', '모델 학습을 위한 최소 샘플 수'),
    ('model_retrain_interval_days', '7', '모델 재학습 주기 (일)')
ON CONFLICT (config_key) DO NOTHING;

-- 완료 메시지
SELECT 'V-BIP 2.3 AI 자동 문제 해결 시스템 스키마 확장 완료!' as message;
