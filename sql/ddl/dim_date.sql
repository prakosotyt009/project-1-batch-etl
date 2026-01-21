CREATE TABLE mart.dim_date (
    date_id DATE PRIMARY KEY,
    day INT,
    month INT,
    year INT,
    day_of_week INT,
    day_name TEXT,
    is_weekend BOOLEAN
);
