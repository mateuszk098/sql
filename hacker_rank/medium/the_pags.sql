-- https://www.hackerrank.com/challenges/the-pads
SELECT
    CASE
        occupation
        WHEN 'Doctor' THEN CONCAT(name, '(D)')
        WHEN 'Professor' THEN CONCAT(name, '(P)')
        WHEN 'Singer' THEN CONCAT(name, '(S)')
        WHEN 'Actor' THEN CONCAT(name, '(A)')
        ELSE 'NULL'
    END AS name_postfix
FROM
    occupations
ORDER BY
    name_postfix ASC
SELECT
    CONCAT(
        'There are a total of ',
        COUNT(occupation),
        ' ',
        LOWER(occupation),
        's.'
    )
FROM
    occupations
GROUP BY
    occupation
ORDER BY
    COUNT(occupation) ASC