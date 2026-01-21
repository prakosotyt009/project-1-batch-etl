CREATE TABLE IF NOT EXISTS mart.fact_transactions (
    transaction_id     BIGINT PRIMARY KEY,
    user_id            BIGINT,
    product_id         TEXT,
    quantity           INTEGER,
    price              NUMERIC,
    total_amount       NUMERIC,
    net_amount         NUMERIC,
    transaction_date   DATE,
    transaction_day    DATE,
    ingestion_date     DATE,
    is_refund          BOOLEAN,
    is_zero_quantity   BOOLEAN,
    is_late            BOOLEAN,
    created_at         TIMESTAMP DEFAULT now()
);
