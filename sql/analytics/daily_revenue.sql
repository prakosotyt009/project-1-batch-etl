SELECT
    d.date_id,
    d.day_name,
    SUM(f.total_amount) AS daily_revenue,
    COUNT(DISTINCT f.transaction_id) AS total_transactions
FROM mart.fact_transactions f
JOIN mart.dim_date d
    ON f.transaction_day = d.date_id
GROUP BY d.date_id, d.day_name
ORDER BY d.date_id;
