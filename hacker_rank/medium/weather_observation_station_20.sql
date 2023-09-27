-- https://www.hackerrank.com/challenges/weather-observation-station-20
SELECT    TOP 1 CAST(
          ROUND(
          PERCENTILE_CONT(0.5) WITHIN GROUP (
          ORDER BY  lat_n
          ) OVER (
          PARTITION BY ''
          ),
          4
          ) AS DECIMAL(12, 4)
          )
FROM      station