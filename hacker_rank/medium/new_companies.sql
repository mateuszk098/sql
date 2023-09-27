-- https://www.hackerrank.com/challenges/the-company
SELECT
    C.company_code,
    C.founder,
    COUNT(DISTINCT LM.lead_manager_code),
    COUNT(DISTINCT SM.senior_manager_code),
    COUNT(DISTINCT M.manager_code),
    COUNT(DISTINCT E.employee_code)
FROM
    company AS C
    LEFT JOIN lead_manager AS LM ON C.company_code = LM.company_code
    LEFT JOIN senior_manager AS SM ON C.company_code = SM.company_code
    LEFT JOIN manager AS M ON C.company_code = M.company_code
    LEFT JOIN employee AS E ON C.company_code = E.company_code
GROUP BY
    C.company_code,
    C.founder
ORDER BY
    C.company_code ASC