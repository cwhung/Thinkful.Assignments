SELECT
	neighbourhood,
	count(id),
	AVG(availability_365::integer) AS avail,
	AVG(reviews_per_month)
FROM
	sfo_listings
GROUP by neighbourhood
ORDER by avail
LIMIT 10


