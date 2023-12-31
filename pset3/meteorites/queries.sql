-- counter table
SELECT
  COUNT(*) AS rows,
  COUNT(DISTINCT name) AS names,
  COUNT(DISTINCT id) AS ids,
  COUNT(DISTINCT nametype) AS nametypes,
  COUNT(DISTINCT class) AS classes,
  COUNT(DISTINCT mass) AS masses,
  COUNT(DISTINCT discovery) AS discoveries,
  COUNT(DISTINCT year) AS years,
  COUNT(DISTINCT lat) AS lats,
  COUNT(DISTINCT long) AS longs
FROM
  import
WHERE
  nametype != "Relict";

-- empty values
SELECT
  COUNT(*) AS rows,
  (
    SELECT COUNT(*) FROM import
    WHERE name="" AND nametype != "Relict"
  ) AS "!name",
  (
    SELECT COUNT(*) FROM import
    WHERE id="" AND nametype != "Relict"
  ) AS "!id",
  (
    SELECT COUNT(*) FROM import
    WHERE nametype="" AND nametype != "Relict"
  ) AS "!nametype",
  (
    SELECT COUNT(*) FROM import
    WHERE class="" AND nametype != "Relict"
  ) AS "!class",
  (
    SELECT COUNT(*) FROM import
    WHERE mass="" AND nametype != "Relict"
  ) AS "!mass",
  (
    SELECT COUNT(*) FROM import
    WHERE discovery="" AND nametype != "Relict"
  ) AS "!discovery",
  (
    SELECT COUNT(*) FROM import
    WHERE year="" AND nametype != "Relict"
  ) AS "!year",
  (
    SELECT COUNT(*) FROM import
    WHERE lat="" AND nametype != "Relict"
  ) AS "!lat",
  (
    SELECT COUNT(*) FROM import
    WHERE long="" AND nametype != "Relict"
  ) AS "!long"
FROM
  import
WHERE
  nametype != "Relict";