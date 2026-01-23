SELECT
    p.product_id,
    p.product_name,
    SUM(f.total_amount) AS total_revenue,
    SUM(f.quantity) AS total_quantity
FROM mart.fact_transactions f
JOIN mart.dim_product p
    ON f.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;
