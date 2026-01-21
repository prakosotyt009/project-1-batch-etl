import pandas as pd

def daily_revenue(df: pd.DataFrame) -> pd.DataFrame:
    return (
        df
        .groupby("transaction_day")
        .agg(
            total_revenue=("total_amount", "sum"),
            total_transactions=("transaction_id", "count")
        )
        .reset_index()
    )


def product_performance(df: pd.DataFrame) -> pd.DataFrame:
    return (
        df
        .groupby("product_id")
        .agg(
            total_revenue=("total_amount", "sum"),
            total_quantity=("quantity", "sum"),
            total_transactions=("transaction_id", "count")
        )
        .reset_index()
    )


def user_activity(df: pd.DataFrame) -> pd.DataFrame:
    return (
        df
        .groupby("user_id")
        .agg(
            total_spent=("total_amount", "sum"),
            total_transactions=("transaction_id", "count")
        )
        .reset_index()
    )
