-- What was the hottest day in our data set? Where was that?
SELECT
    date, zip, maxtemperaturef
FROM
    weather
Order by maxtemperaturef DESC
Limit 1



