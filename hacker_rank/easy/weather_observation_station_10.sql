-- https://www.hackerrank.com/challenges/weather-observation-station-10
SELECT    DISTINCT city
FROM      station
WHERE     city LIKE '%[^aeiou]'