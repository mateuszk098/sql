-- https://www.hackerrank.com/challenges/full-score/problem
WITH      FullChallengesHackers AS (
          SELECT    S.hacker_id,
                    COUNT(S.challenge_id) AS num_max_score_for_challenge
          FROM      Submissions AS S
          INNER     JOIN (
                    SELECT    C.challenge_id,
                              D.score AS max_challenge_score
                    FROM      Challenges AS C
                    INNER     JOIN Difficulty AS D ON C.difficulty_level = D.difficulty_level
                    ) AS CD ON S.challenge_id = CD.challenge_id
          WHERE     S.score = CD.max_challenge_score
          GROUP BY  S.hacker_id
          HAVING    COUNT(S.challenge_id) > 1
          )
SELECT    FCH.hacker_id,
          H.name
FROM      FullChallengesHackers AS FCH
INNER     JOIN Hackers AS H ON FCH.hacker_id = H.hacker_id
ORDER BY  FCH.num_max_score_for_challenge DESC,
          FCH.hacker_id ASC