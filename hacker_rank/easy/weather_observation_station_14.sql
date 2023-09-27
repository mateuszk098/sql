-- https://www.hackerrank.com/challenges/weather-observation-station-14
SELECT    ROUND(lat_n, 4)
FROM      station
WHERE     lat_n < 137.2345
ORDER BY  lat_n DESC
LIMIT     1