
WITH 
CTE1
AS(
	SELECT
		station_id,
		(CASE WHEN docks_available=0 then 1 ELSE 0 END) station_full,
		COUNT(*) as station_count
	FROM
		status
	GROUP BY station_id, station_full
	ORDER BY station_id 
),
CTE2
AS(
	SELECT
		station_id,
		station_count AS station_full
	FROM 
		CTE1
	WHERE 
		station_full = 1
),
CTE3
AS(
	SELECT 
		station_id,
		station_count AS station_not_full
	FROM 
		CTE1
	WHERE
		station_full = 0
)
SELECT 
	CTE2.station_id,
	CTE2.station_full,
	CTE3.station_not_full,
	CTE2.station_full::decimal/(CTE2.station_full+CTE3.station_not_full) AS full_rate
FROM
	CTE2
JOIN
	CTE3
ON
	CTE2.station_id=CTE3.station_id
ORDER by full_rate DESC 
	
	



