-- Create a table 'rainy' to find all rain days
WITH rainy
AS (
SELECT
	date
FROM
	weather
WHERE
	events LIKE '%Rain%'
GROUP by date	
),

-- Second table to join rainy days to trips
trip_d
AS(
SELECT
	TEXT(DATE(t.start_date)) AS trip_date,
	t.trip_id,
	t.duration,
	t.start_station,
	t.bike_id
FROM	
	trips t
JOIN
	rainy r
ON
	TEXT(DATE(t.start_date))=r.date
ORDER by t.duration DESC
)

-- Find the max duration in each day
SELECT
	trip_date,
	MAX(t1.duration) AS max_duration
From 
	trip_d t1
GROUP by trip_date
ORDER by max_duration DESC
	
	