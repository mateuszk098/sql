WITH      CTE1 AS (
          SELECT    start_date,
                    end_date,
                    DATEADD (
                    DAY,
                    - ROW_NUMBER() OVER (
                    ORDER BY  end_date
                    ),
                    end_date
                    ) AS first_date
          FROM      projects
          ),
          CTE2 AS (
          SELECT    DISTINCT FIRST_VALUE (start_date) OVER (
                    PARTITION BY first_date
                    ORDER BY  first_date ASC
                    ) AS first_value,
                    LAST_VALUE (end_date) OVER (
                    PARTITION BY first_date
                    ORDER BY  first_date ASC
                    ) AS last_value
          FROM      CTE1
          )
SELECT    *
FROM      CTE2
ORDER BY  DATEDIFF (DAY, first_value, last_value) ASC,
          first_value