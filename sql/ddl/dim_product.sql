CREATE TABLE IF NOT EXISTS mart.dim_product (
    product_id TEXT PRIMARY KEY,
    product_name TEXT,
    product_category TEXT,
    is_active BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
