SELECT
    user_id,
    SUM(net_amount) AS total_spent,
    COUNT(transaction_id) AS total_transactions,
    MAX(transaction_date) AS last_transaction_date
FROM mart.fact_transactions
WHERE is_refund = FALSE
GROUP BY user_id
ORDER BY total_spent DESC;
-- QUERY USER PERFORMANCE