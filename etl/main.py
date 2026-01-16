from extract import extract_data
from transform import transform_data

if __name__ == "__main__":
    df = extract_data()
    df = transform_data(df)
    print(df.head())

