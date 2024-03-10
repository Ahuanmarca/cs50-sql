SELECT
  players.first_name AS "first name",
  players.last_name AS "last name",
  -- salaries.salary AS "salary",
  -- performances.H AS "hits",
  salaries.salary / performances.H AS "dollars per hit"
FROM
  players
  INNER JOIN salaries
  INNER JOIN performances ON players.id = salaries.player_id
  AND players.id = performances.player_id
WHERE
  performances.H > 0
  AND salaries.year = 2001
  AND salaries.year = performances.year
ORDER BY
  "dollars per hit" ASC,
  players.first_name,
  players.last_name
LIMIT 10;