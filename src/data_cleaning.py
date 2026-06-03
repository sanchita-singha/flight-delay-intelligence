import pandas as pd
import numpy as np

# Load dataset
df = pd.read_csv("data/raw/flights_data.csv")

# Replace -1 values with NaN
df.replace(-1, np.nan, inplace=True)
df.replace("-1", np.nan, inplace=True)

# Remove duplicates
df.drop_duplicates(inplace=True)

# Convert date column
df['Used Date'] = pd.to_datetime(df['Used Date'], format='mixed')

# Numeric columns
numeric_cols = [
    'Departure Delay',
    'Arrival Delay',
    'Distance',
    'Passenger Load Factor',
    'Airline Rating',
    'Airport Rating',
    'Market Share',
    'OTP Index',
    'weather__hourly__windspeedKmph',
    'weather__hourly__precipMM',
    'weather__hourly__humidity'
]

# Fill numeric nulls with median
df[numeric_cols] = df[numeric_cols].fillna(df[numeric_cols].median())

# Categorical columns
categorical_cols = [
    'Airline',
    'From',
    'To',
    'Status',
    'Category',
    'weather__hourly__weatherDesc__value'
]

# Fill categorical nulls with mode
for col in categorical_cols:
    df[col] = df[col].fillna(df[col].mode()[0])

# Fill DEP and ARR columns
df[['DEP', 'ARR']] = df[['DEP', 'ARR']].fillna(
    df[['DEP', 'ARR']].median()
)

# Save cleaned dataset
df.to_csv("data/cleaned/cleaned_flights.csv", index=False)

print("Data cleaning completed successfully.")