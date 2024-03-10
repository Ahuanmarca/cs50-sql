SELECT
  -- players.first_name AS "first name",
  -- players.last_name AS "last name",
  -- performances.HR AS "home runs",
  -- performances.year AS "performance year",
  -- salaries.year AS "salary year",
  salaries.salary AS "salary"
FROM
  salaries INNER JOIN players INNER JOIN performances
ON
  salaries.player_id = players.id
  AND performances.player_id = players.id
WHERE
  performances.year = 2001
  AND salaries.year = 2001
ORDER BY
  performances.HR DESC
LIMIT
  1;