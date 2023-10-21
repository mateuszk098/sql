WITH      Total_Submissions AS (
          SELECT    Colleges.contest_id,
                    SUM(Submission_Stats.total_submissions) AS total_submissions_sum,
                    SUM(Submission_Stats.total_accepted_submissions) AS total_accepted_submissions_sum
          FROM      Colleges
          INNER     JOIN Challenges ON Challenges.college_id = Colleges.college_id
          INNER     JOIN Submission_Stats ON Submission_Stats.challenge_id = Challenges.challenge_id
          GROUP BY  Colleges.contest_id
          ),
          Total_Views AS (
          SELECT    Colleges.contest_id,
                    SUM(View_Stats.total_views) AS total_views_sum,
                    SUM(View_Stats.total_unique_views) AS total_unique_views_sum
          FROM      Colleges
          INNER     JOIN Challenges ON Challenges.college_id = Colleges.college_id
          INNER     JOIN View_Stats ON View_Stats.challenge_id = Challenges.challenge_id
          GROUP BY  Colleges.contest_id
          )
SELECT    Contests.contest_id,
          Contests.hacker_id,
          Contests.name,
          Total_Submissions.total_submissions_sum,
          Total_Submissions.total_accepted_submissions_sum,
          Total_Views.total_views_sum,
          Total_Views.total_unique_views_sum
FROM      Contests
INNER     JOIN Total_Submissions ON Total_Submissions.contest_id = Contests.contest_id
INNER     JOIN Total_Views ON Total_Views.contest_id = Contests.contest_id
WHERE     Total_Submissions.total_submissions_sum > 0 AND      
          Total_Submissions.total_accepted_submissions_sum > 0 AND      
          Total_Views.total_views_sum > 0 AND      
          Total_Views.total_unique_views_sum > 0
ORDER BY  Contests.contest_id