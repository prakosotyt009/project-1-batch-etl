SELECT
    COUNT(*) AS zero_quantity_txn
FROM mart.fact_transactions
WHERE is_zero_quantity = TRUE;

SELECT
    COUNT(*) AS refund_txn
FROM mart.fact_transactions
WHERE is_refund = TRUE;
