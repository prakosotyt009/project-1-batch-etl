CREATE TABLE IF NOT EXISTS mart.dim_user (
    user_id INTEGER PRIMARY KEY,
    user_segment TEXT,
    is_active BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
