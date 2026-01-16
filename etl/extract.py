import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
DATA_PATH = BASE_DIR / "data" / "raw" / "transactions.csv"

def extract_data():
    if not DATA_PATH.exists():
        raise FileNotFoundError(f"Raw data file not found: {DATA_PATH}")

    df = pd.read_csv(
        DATA_PATH,
        sep=",",
        quotechar='"',
        engine="python"
    )

    print(f"Extracted {len(df)} rows")
    print(df.shape)
    return df
