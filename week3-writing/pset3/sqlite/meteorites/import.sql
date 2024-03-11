DROP TABLE IF EXISTS meteorites_temp;
DROP TABLE IF EXISTS meteorites;

CREATE TABLE meteorites_temp (
  name TEXT,
  id INTEGER,
  nametype TEXT,
  class TEXT,
  mass REAL,
  discovery TEXT,
  year DATE,
  lat REAL,
  long REAL
);

.import --csv meteorites.csv meteorites_temp
DELETE FROM meteorites_temp WHERE nametype = "Relict";
UPDATE meteorites_temp SET year=NULL WHERE year="";

CREATE TABLE meteorites (
  id INTEGER,
  name TEXT,
  class TEXT,
  mass REAL,
  discovery TEXT,
  year DATE,
  lat REAL,
  long REAL,
  PRIMARY KEY(id)
);

INSERT INTO meteorites(
  name,
  class,
  mass,
  discovery,
  year,
  lat,
  long
)
SELECT
  name,
  class,
  ROUND(NULLIF(mass, ""), 2),
  NULLIF(discovery, ""),
  year,
  ROUND(NULLIF(lat, ""), 2),
  ROUND(NULLIF(long, ""), 2)
FROM
  meteorites_temp
ORDER BY
  year ASC,
  name
;

DROP TABLE meteorites_temp;
