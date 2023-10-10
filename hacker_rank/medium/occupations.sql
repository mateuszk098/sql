WITH      RANKS AS (
          SELECT    Occupation,
                    Name,
                    RANK() OVER (
                    PARTITION BY Occupation
                    ORDER BY  Name
                    ) AS Rank
          FROM      OCCUPATIONS
          )
SELECT    MIN(
          CASE
                    WHEN R.Occupation = "Doctor" THEN R.Name
          END
          ),
          MIN(
          CASE
                    WHEN R.Occupation = "Professor" THEN R.Name
          END
          ),
          MIN(
          CASE
                    WHEN R.Occupation = "Singer" THEN R.Name
          END
          ),
          MIN(
          CASE
                    WHEN R.Occupation = "Actor" THEN R.Name
          END
          )
FROM      RANKS AS R
GROUP BY  R.Rank