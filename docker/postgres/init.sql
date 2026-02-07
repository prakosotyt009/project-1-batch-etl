-- =========================
-- SCHEMA
-- =========================
CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS mart;

CREATE TABLE IF NOT EXISTS mart.dim_date (
    date_id DATE PRIMARY KEY,
    day INT,
    month INT,
    year INT,
    day_of_week INT,
    day_name TEXT,
    is_weekend BOOLEAN
);

CREATE TABLE IF NOT EXISTS mart.dim_user (
    user_id INT PRIMARY KEY,
    user_segment VARCHAR(50),
    is_active BOOLEAN,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mart.dim_product (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name TEXT,
    product_category VARCHAR(50),
    is_active BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================
-- STAGING TABLE
-- =========================
CREATE TABLE IF NOT EXISTS staging.stg_transactions (
    transaction_id BIGINT,
    user_id BIGINT,
    product_id TEXT,
    quantity INTEGER,
    price NUMERIC(12,2),
    transaction_date DATE
);

-- =========================
-- FACT TABLE
-- =========================
CREATE TABLE IF NOT EXISTS mart.fact_transactions (
    transaction_id BIGINT PRIMARY KEY,
    user_id BIGINT,
    product_id TEXT,
    quantity INTEGER,
    price NUMERIC(12,2),
    total_amount NUMERIC(14,2),
    net_amount NUMERIC(14,2),
    transaction_date DATE,
    transaction_day DATE,
    ingestion_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_refund BOOLEAN,
    is_zero_quantity BOOLEAN,
    is_late BOOLEAN,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
