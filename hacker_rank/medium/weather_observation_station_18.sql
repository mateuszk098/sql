-- https://www.hackerrank.com/challenges/weather-observation-station-18
SELECT
    CAST(
        ROUND(
            -- |c - a| + |d - b|
            ABS(MAX(lat_n) - MIN(lat_n)) + ABS(MAX(long_w) - MIN(long_w)),
            4
        ) AS DECIMAL(10, 4)
    )
FROM
    station