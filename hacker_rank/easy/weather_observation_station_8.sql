-- https://www.hackerrank.com/challenges/weather-observation-station-8
SELECT    DISTINCT city
FROM      station
WHERE     city LIKE '[aeiou]%[aeiou]'