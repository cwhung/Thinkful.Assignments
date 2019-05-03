-- What is the average trip duration, by end station?
SELECT
    AVG(duration), end_station
From
    trips
Group by end_station





