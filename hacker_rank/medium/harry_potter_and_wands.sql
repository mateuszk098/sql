-- https://www.hackerrank.com/challenges/harry-potter-and-wands/problem
WITH      CTE AS (
          SELECT    W.id,
                    WP.age,
                    W.coins_needed,
                    W.power,
                    RANK() OVER (
                    PARTITION BY WP.age,
                              W.power
                    ORDER BY  W.coins_needed ASC
                    ) AS wand_rank
          FROM      Wands AS W
          INNER     JOIN Wands_Property AS WP ON W.code = WP.code
          WHERE     WP.is_evil = 0
          )
SELECT    id,
          age,
          coins_needed,
          power
FROM      CTE
WHERE     wand_rank = 1
ORDER BY  power DESC,
          age DESC