SELECT
    u.user_id,
    u.user_segment,
    SUM(f.total_amount) AS total_spent,
    COUNT(DISTINCT f.transaction_id) AS total_transactions
FROM mart.fact_transactions f
JOIN mart.dim_user u
    ON f.user_id = u.user_id
GROUP BY u.user_id, u.user_segment
ORDER BY total_spent DESC;
