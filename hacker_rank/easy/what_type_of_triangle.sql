-- https://www.hackerrank.com/challenges/what-type-of-triangle
SELECT    CASE
                    WHEN (
                    a = b AND      
                    a = c
                    ) THEN 'Equilateral'
                    WHEN (
                    (
                    a = b AND      
                    a + b > c
                    ) OR       
                    (
                    a = c AND      
                    a + c > b
                    ) OR       
                    (
                    b = c AND      
                    b + c > a
                    )
                    ) THEN 'Isosceles'
                    WHEN (
                    (
                    a <> b AND      
                    a <> c
                    ) AND      
                    (
                    a + b > c AND      
                    a + c > b AND      
                    b + c > a
                    )
                    ) THEN 'Scalene'
                    ELSE 'Not A Triangle'
          END
FROM      triangles