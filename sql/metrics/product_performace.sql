SELECT
    f.transaction_id,
    f.product_id,
    d.product_name,
    f.total_amount
FROM mart.fact_transactions f
JOIN mart.dim_product d
    ON f.product_id = d.product_id;
