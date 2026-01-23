SELECT
    d.is_weekend,
    SUM(f.total_amount) AS total_revenue,
    COUNT(DISTINCT f.transaction_id) AS total_transactions
FROM mart.fact_transactions f
JOIN mart.dim_date d
    ON f.transaction_day = d.date_id
GROUP BY d.is_weekend;
