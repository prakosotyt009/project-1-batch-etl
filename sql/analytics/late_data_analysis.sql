SELECT
    is_late,
    COUNT(*) AS total_rows,
    SUM(total_amount) AS revenue
FROM mart.fact_transactions
GROUP BY is_late;
