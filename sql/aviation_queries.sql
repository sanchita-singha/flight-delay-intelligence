CREATE DATABASE flight_delay_db;

USE flight_delay_db;

SHOW TABLES;

SELECT * FROM flights LIMIT 5;

USE flight_delay_db;


-- Average Arrival Delay by Airline
SELECT 
    Airline,
    AVG(`Arrival Delay`) AS avg_arrival_delay
FROM flights
GROUP BY Airline
ORDER BY avg_arrival_delay DESC;


-- Most Problematic Routes
SELECT 
    CONCAT(`From`, '-', `To`) AS Route,
    AVG(`Total Delay`) AS avg_total_delay
FROM flights
GROUP BY Route
ORDER BY avg_total_delay DESC
LIMIT 10;


-- Busiest Source Airports
SELECT 
    `From`,
    COUNT(*) AS total_flights
FROM flights
GROUP BY `From`
ORDER BY total_flights DESC;


-- Best Airlines by OTP
SELECT 
    Airline,
    AVG(`OTP Index`) AS avg_otp
FROM flights
GROUP BY Airline
ORDER BY avg_otp DESC;


-- Average Delay By Month
SELECT
    Month,
    AVG(`Total Delay`) AS avg_total_delay
FROM flights
GROUP BY Month
ORDER BY avg_total_delay DESC;


-- Peak Hour Congestion
SELECT
    `Peak Hour`,
    COUNT(*) AS total_flights
FROM flights
GROUP BY `Peak Hour`
ORDER BY total_flights DESC;


-- Weather Impact on Arrival Delay
SELECT
    AVG(weather__hourly__humidity) AS avg_humidity,
    AVG(weather__hourly__windspeedKmph) AS avg_wind_speed,
    AVG(weather__hourly__precipMM) AS avg_precipitation,
    AVG(`Arrival Delay`) AS avg_arrival_delay
FROM flights;


-- Airlines with Highest Passenger Load
SELECT
    Airline,
    AVG(`Passenger Load Factor`) AS avg_load
FROM flights
GROUP BY Airline
ORDER BY avg_load DESC;


-- Delay Severity Distribution
SELECT
    `Delay Category`,
    COUNT(*) AS total_flights
FROM flights
GROUP BY `Delay Category`
ORDER BY total_flights DESC;


-- Average Delay by Weekday
SELECT
    Weekday,
    AVG(`Total Delay`) AS avg_total_delay
FROM flights
GROUP BY Weekday
ORDER BY avg_total_delay DESC;


-- Flights with Extreme Delays
SELECT
    Airline,
    `From`,
    `To`,
    `Total Delay`
FROM flights
WHERE `Total Delay` > 500
ORDER BY `Total Delay` DESC;


-- Monthly Flight Traffic
SELECT
    Month,
    COUNT(*) AS total_flights
FROM flights
GROUP BY Month
ORDER BY Month;


-- Airline Ranking by Average Delay
SELECT
    Airline,
    AVG(`Total Delay`) AS avg_delay,
    RANK() OVER (
        ORDER BY AVG(`Total Delay`) ASC
    ) AS airline_rank
FROM flights
GROUP BY Airline;

-- SELECT * FROM flights LIMIT 5;
