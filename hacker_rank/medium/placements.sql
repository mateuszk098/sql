-- https://www.hackerrank.com/challenges/placements/
WITH      CTE AS (
          SELECT    S.name,
                    P.salary,
                    F.friend_id
          FROM      students AS S
          LEFT JOIN packages AS P ON S.id = P.id
          LEFT JOIN friends AS F ON S.id = F.id
          )
SELECT    CTE.name
FROM      CTE
LEFT JOIN packages AS P ON CTE.friend_id = P.id
WHERE     CTE.salary < P.salary
ORDER BY  P.salary ASC