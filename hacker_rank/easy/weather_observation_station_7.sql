-- https://www.hackerrank.com/challenges/weather-observation-station-7
SELECT    DISTINCT city
FROM      station
WHERE     city LIKE '%[aeiou]'