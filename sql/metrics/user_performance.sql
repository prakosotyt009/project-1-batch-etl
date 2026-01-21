SELECT
    f.transaction_id,
    f.user_id,
    u.user_segment,
    f.total_amount
FROM mart.fact_transactions f
JOIN mart.dim_user u
    ON f.user_id = u.user_id;
