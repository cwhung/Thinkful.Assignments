-- convert price to number
WITH CTE1
AS(
	SELECT 
		calender_date,
		TO_NUMBER(price,'L9G999g999.99') AS price,
		available
	FROM 
		sfo_calendar
)

-- find the median price by month and the availability
SELECT
	--date_part('week', calender_date::date) AS weekly,
	EXTRACT(month from calender_date) AS month,
	-- Use median instead of AVG
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER by price) AS median,
	MAX(price),
	MIN(price),
	count(*)
	
FROM
  	CTE1
WHERE
	available = 't'

GROUP by month
ORDER by median ASC



