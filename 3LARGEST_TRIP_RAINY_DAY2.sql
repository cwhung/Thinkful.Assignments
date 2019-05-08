SELECT 
	temp2.trip_id,
	temp2.date,
	temp2.start_station,
	temp2.end_station,
	SQRT((temp2.start_lat-temp2.end_lat)^2+(temp2.start_long-temp2.end_long)^2) AS distance,
	w.events,
	temp2.zip_code

From
(
	WITH temp1
	AS(
	SELECT
		t.trip_id,
		TEXT(DATE(t.start_date)) AS date,
		t.start_station,
		t.zip_code,
		s.lat AS start_lat,
		s.long AS start_long,
		t.end_station 
	FROM
		trips t
	JOIN
		stations s
	ON
		t.start_station = s.name
	)

	SELECT
		y.trip_id,
		y.date,
		y.start_station,
		y.zip_code, 
		y.start_lat AS start_lat,
		y.start_long AS start_long,
		y.end_station,
		s.lat AS end_lat,
		s.long AS end_long
	FROM
		temp1 y
	JOIN
		stations s
	ON 
		y.end_station = s.name
) AS temp2

JOIN
	weather w
ON
	temp2.date = w.date AND	temp2.zip_code = w.zip
WHERE
	w.events LIKE '%Rain%'
ORDER BY distance DESC
LIMIT 3;