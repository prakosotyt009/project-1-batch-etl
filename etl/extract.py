import pandas as pd
from pathlib import Path

DATA_PATH = Path("data/raw/transactions.csv")

def extract_data() -> pd.DataFrame:
    if not DATA_PATH.exists():
        raise FileNotFoundError("Raw data file not found")

    df = pd.read_csv(DATA_PATH)
    print(f"Extracted {len(df)} rows")
    return df
