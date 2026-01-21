SELECT
    d.day_name,
    SUM(f.net_amount) AS total_revenue
	-- COUNT(transaction_id) AS total_transactions
FROM mart.fact_transactions f
JOIN mart.dim_date d
    ON f.transaction_date = d.date_id
WHERE f.is_refund = FALSE
GROUP BY d.day_name
ORDER BY total_revenue DESC;
