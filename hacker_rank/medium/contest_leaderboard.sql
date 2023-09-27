-- https://www.hackerrank.com/challenges/contest-leaderboard/problem
WITH      MaxScores AS (
          SELECT    hacker_id,
                    challenge_id,
                    MAX(score) AS max_score
          FROM      Submissions
          WHERE     score > 0
          GROUP BY  hacker_id,
                    challenge_id
          )
SELECT    H.hacker_id,
          H.name,
          SUM(MS.max_score) AS total_score
FROM      Hackers AS H
INNER     JOIN MaxScores AS MS ON H.hacker_id = MS.hacker_id
GROUP BY  H.hacker_id,
          H.name
ORDER BY  total_score DESC,
          H.hacker_id ASC