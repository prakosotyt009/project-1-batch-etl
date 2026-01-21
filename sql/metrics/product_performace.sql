SELECT
    product_id,
    SUM(net_amount) AS total_revenue,
    SUM(quantity) AS total_quantity,
    COUNT(transaction_id) AS total_transactions
FROM mart.fact_transactions
WHERE is_refund = FALSE
GROUP BY product_id
ORDER BY total_revenue DESC;
-- QUERY PRODUCT PERFORMANCE