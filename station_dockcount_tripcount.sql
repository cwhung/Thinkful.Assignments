WITH ride_count
AS(
SELECT 
	start_station,
	COUNT(*)
FROM 
	trips
GROUP by start_station
)
	
	
SELECT
	s.name,
	s.dockcount,
	r.count as trip_count
FROM 
	stations s
JOIN
	ride_count r
ON
	s.name = r.start_station
ORDER BY dockcount DESC
