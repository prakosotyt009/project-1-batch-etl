from etl.extract import extract_data
from etl.transform import transform_data
from etl.metrics import daily_revenue, product_performance, user_activity
from etl.validate import validate_metrics
from etl.load import load_to_postgres

if __name__ == "__main__":
    df = extract_data()
    df = transform_data(df)
    
    validate_metrics(df)
    load_to_postgres(df)
    
    print("\nDAILY REVENUE")
    print(daily_revenue(df))

    print("\nPRODUCT PERFORMANCE")
    print(product_performance(df))

    print("\nUSER ACTIVITY")
    print(user_activity(df))
    print(df.head())