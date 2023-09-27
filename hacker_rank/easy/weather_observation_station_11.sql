-- https://www.hackerrank.com/challenges/weather-observation-station-11
SELECT    DISTINCT city
FROM      station
WHERE     city LIKE '[^aeiou]%' OR       
          city LIKE '%[^aeiou]'