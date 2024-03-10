SELECT
  -- salaries.salary AS "salary",
  players.first_name AS "first name",
  players.last_name AS "last name"
FROM
  players
  INNER JOIN salaries ON players.id = salaries.player_id
WHERE
  salaries.salary = (
    SELECT
      salary
    FROM
      salaries
    ORDER BY
      salary DESC
    LIMIT
      1
  )
ORDER BY
  salaries.salary DESC;