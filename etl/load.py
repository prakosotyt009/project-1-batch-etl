import psycopg2
import pandas as pd
from psycopg2.extras import execute_batch
import os
def load_to_postgres(df: pd.DataFrame):
    conn = psycopg2.connect(
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT"),
        dbname=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )
    cur = conn.cursor()

    sql = """
    INSERT INTO mart.fact_transactions (
        transaction_id, user_id, product_id,
        quantity, price, total_amount, net_amount,
        transaction_date, transaction_day,
        ingestion_date,
        is_refund, is_zero_quantity, is_late
    )
    VALUES (
        %(transaction_id)s, %(user_id)s, %(product_id)s,
        %(quantity)s, %(price)s, %(total_amount)s, %(net_amount)s,
        %(transaction_date)s, %(transaction_day)s,
        %(ingestion_date)s,
        %(is_refund)s, %(is_zero_quantity)s, %(is_late)s
    )
    ON CONFLICT (transaction_id)
    DO UPDATE SET
        user_id = EXCLUDED.user_id,
        product_id = EXCLUDED.product_id,
        quantity = EXCLUDED.quantity,
        price = EXCLUDED.price,
        total_amount = EXCLUDED.total_amount,
        net_amount = EXCLUDED.net_amount,
        transaction_date = EXCLUDED.transaction_date,
        transaction_day = EXCLUDED.transaction_day,
        ingestion_date = EXCLUDED.ingestion_date,
        is_refund = EXCLUDED.is_refund,
        is_zero_quantity = EXCLUDED.is_zero_quantity,
        is_late = EXCLUDED.is_late;
    """

    execute_batch(cur, sql, df.to_dict("records"))
    conn.commit()
    cur.close()
    conn.close()

    print("✅ Loaded to PostgreSQL")
