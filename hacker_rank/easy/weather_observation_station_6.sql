-- https://www.hackerrank.com/challenges/weather-observation-station-6
SELECT
    DISTINCT city
FROM
    station
WHERE
    city LIKE '[aeiou]%'