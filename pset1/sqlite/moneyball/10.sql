SELECT
  players.first_name AS "first name",
  players.last_name AS "last name",
  salaries.salary AS "salary",
  performances.HR AS "home runs",
  -- performances.year AS "performance year",
  salaries.year AS "salary year"
FROM
  players
  INNER JOIN salaries
  INNER JOIN performances ON players.id = salaries.player_id
  AND players.id = performances.player_id
WHERE
  performances.year = salaries.year
ORDER BY
  players.id ASC,
  salaries.year DESC,
  performances.HR DESC,
  salaries.salary DESC;