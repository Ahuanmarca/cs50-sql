SELECT DISTINCT
  teams.name AS "Satchel Paige teams"
FROM
  players
  INNER JOIN performances
  INNER JOIN teams ON performances.player_id = players.id
  AND performances.team_id = teams.id
WHERE
  players.first_name = "Satchel"
  AND players.last_name = "Paige";