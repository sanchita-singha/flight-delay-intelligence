import pandas as pd
from sqlalchemy import create_engine

# MySQL connection
engine = create_engine(
    "mysql+pymysql://root:Soumyasanchita%402006@localhost/flight_delay_db"
)

# Load cleaned dataset
df = pd.read_csv("C:\\Users\\sanch\\OneDrive\\Desktop\\flight-delay-intelligence\\data\\cleaned\\featured_flights.csv")

# Upload dataset to MySQL
df.to_sql(
    "flights",
    con=engine,
    if_exists="replace",
    index=False
)

print("Dataset uploaded successfully to MySQL!")
