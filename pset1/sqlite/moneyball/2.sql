SELECT
  salaries.year,
  salaries.salary
FROM
  salaries
  INNER JOIN players ON salaries.player_id = players.id
WHERE
  players.first_name = "Cal"
  AND players.last_name LIKE "Ripken%"
ORDER BY
  salaries.year DESC;
