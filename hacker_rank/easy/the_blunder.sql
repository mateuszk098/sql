-- https://www.hackerrank.com/challenges/the-blunder
SELECT    CAST(
          CEILING(AVG(CAST(salary AS FLOAT)) - AVG(CAST(REPLACE (CAST(salary AS VARCHAR), '0', '') AS FLOAT))) AS INT
          )
FROM      EMPLOYEES