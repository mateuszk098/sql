-- https://www.hackerrank.com/challenges/the-report/problem
SELECT
    CASE
        WHEN G.Grade >= 8 THEN S.Name
        ELSE "NULL"
    END,
    G.Grade,
    S.Marks
FROM
    Students AS S
    INNER JOIN Grades AS G ON S.Marks BETWEEN G.Min_Mark
    AND G.Max_Mark
ORDER BY
    G.Grade DESC,
    S.Name ASC,
    S.Marks ASC