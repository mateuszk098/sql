WITH      SymmetricPairs AS (
          SELECT    x,
                    y,
                    ROW_NUMBER() OVER (
                    PARTITION BY (
                              CASE
                                        WHEN x <= y THEN CONCAT (x, y)
                                        ELSE CONCAT (y, x)
                              END
                              )
                    ORDER BY  x DESC
                    ) AS pair_number
          FROM      Functions
          )
SELECT    x,
          y
FROM      SymmetricPairs
WHERE     pair_number = 2
ORDER BY  x ASC