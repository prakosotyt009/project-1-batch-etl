SELECT
    transaction_day,
    SUM(net_amount) AS total_revenue,
    COUNT(transaction_id) AS total_transactions
FROM mart.fact_transactions
WHERE is_refund = FALSE
GROUP BY transaction_day
ORDER BY transaction_day;
-- QUERY DAILY REVENUE