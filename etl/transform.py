import pandas as pd
from datetime import date

def transform_data(df: pd.DataFrame) -> pd.DataFrame:
    print("Start transform")

    # 1. Normalize column names
    df.columns = [c.lower().strip() for c in df.columns]

    # 2. Drop exact duplicate rows
    df = df.drop_duplicates()

    # 3. Convert numeric columns
    df["quantity"] = pd.to_numeric(df["quantity"], errors="coerce")
    df["price"] = pd.to_numeric(df["price"], errors="coerce")

    # 4. Convert date (mixed formats)
    df["transaction_date"] = pd.to_datetime(
        df["transaction_date"],
        format="mixed",
        dayfirst=True,
        errors="coerce"
    )

    # print("DEBUG DATE PARSING")
    # print(df[["transaction_id", "transaction_date"]])
    # 5. Drop rows with critical nulls
    df = df.dropna(subset=["transaction_id", "user_id", "transaction_date"])

    # 6. Business metric
    df["total_amount"] = df["quantity"] * df["price"]
    df["total_amount"] = df["total_amount"].fillna(0)

    # 7. Deduplicate by business key
    df = df.sort_values("transaction_date")
    df = df.drop_duplicates(subset=["transaction_id"], keep="last")

    # 8. Transaction day
    df["transaction_day"] = df["transaction_date"].dt.date
    
    # 9. Refund handling
    df["is_refund"] = df["quantity"] < 0

    # Net amount (boleh negatif)
    df["net_amount"] = df["quantity"] * df["price"]
    df["is_zero_quantity"] = df["quantity"] == 0
    
    # 10. Ingestion metadata
    df["ingestion_date"] = pd.to_datetime(date.today())
    df["is_late"] = df["transaction_date"] < df["ingestion_date"]                                                

    

    print("Transform completed")
    return df
