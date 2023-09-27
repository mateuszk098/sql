-- https://www.hackerrank.com/challenges/challenges/problem
WITH      NumChallenges AS (
          SELECT    H.hacker_id,
                    H.name,
                    COUNT(1) AS num_challenges
          FROM      Hackers AS H
          INNER     JOIN Challenges AS C ON H.hacker_id = C.hacker_id
          GROUP BY  H.hacker_id,
                    H.name
          )
SELECT    *
FROM      NumChallenges
WHERE     num_challenges IN (
          SELECT    MAX(num_challenges)
          FROM      NumChallenges
          ) OR       
          num_challenges NOT IN (
          SELECT    num_challenges
          FROM      NumChallenges
          GROUP BY  num_challenges
          HAVING    COUNT(DISTINCT name) > 1
          )
ORDER BY  num_challenges DESC,
          hacker_id ASC