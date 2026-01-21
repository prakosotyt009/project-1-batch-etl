import pandas as pd

def validate_metrics(df: pd.DataFrame) -> None:
    # 1. Row count check
    assert len(df) > 0, "❌ Data kosong setelah transform"

    # 2. Primary key uniqueness
    assert df["transaction_id"].is_unique, "❌ Duplicate transaction_id"

    # 3. Null check on critical columns
    critical_cols = [
        "transaction_id",
        "user_id",
        "transaction_date",
        "total_amount"
    ]
    assert df[critical_cols].isnull().sum().sum() == 0, "❌ Null di kolom critical"

    # 4. Business rules
    assert (
        (df["quantity"] >= 0) | (df["is_refund"])
    ).all(), "❌ Invalid negative quantity"
    
    # 5. Metric sanity check
    assert (df["price"] >= 0).all(), "❌ Price negatif"
    
    # 6. Metric sanity check (NET)
    calculated = df["quantity"] * df["price"]
    assert (df["net_amount"] == calculated).all(), "❌ net_amount mismatch"

    print("✅ Metric validation passed")
