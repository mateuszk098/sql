-- https://www.hackerrank.com/challenges/earnings-of-employees
SELECT    TOP 1 months * salary AS earnings,
          COUNT(1)
FROM      employee
GROUP BY  months * salary
ORDER BY  months * salary DESC