-- https://www.hackerrank.com/challenges/weather-observation-station-19
SELECT    CAST(
          POWER(POWER(MAX(lat_n) - MIN(lat_n), 2) + POWER(MAX(long_w) - MIN(long_w), 2), 0.5) AS DECIMAL(10, 4)
          )
FROM      station