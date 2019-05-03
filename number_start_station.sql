-- How many trips started at each station?
SELECT
    start_station, count(*)
From
    trips
Group by start_station



