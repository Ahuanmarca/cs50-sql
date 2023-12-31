WITH
  dollars_per_hit AS (
    SELECT
      players.id AS id,
      players.first_name AS first_name,
      players.last_name AS last_name,
      salaries.salary / performances.H AS dollars_per_hit
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
      dollars_per_hit ASC,
      players.first_name,
      players.last_name
    LIMIT
      10
  ),
  dollars_per_scored AS (
    SELECT
      players.id AS id,
      players.first_name AS first_name,
      players.last_name AS last_name,
      salaries.salary / performances.RBI AS dollars_per_scored
    FROM
      players
      INNER JOIN salaries
      INNER JOIN performances ON players.id = salaries.player_id
      AND players.id = performances.player_id
    WHERE
      performances.RBI > 0
      AND salaries.year = 2001
      AND salaries.year = performances.year
    ORDER BY
      dollars_per_scored ASC,
      players.first_name,
      players.last_name
    LIMIT
      10
  )
SELECT
  -- id,
  first_name,
  last_name
FROM
  dollars_per_hit
INTERSECT
SELECT
  -- id,
  first_name,
  last_name
FROM
  dollars_per_scored
ORDER BY
  last_name;