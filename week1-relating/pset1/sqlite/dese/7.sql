SELECT
  schools.name
FROM
  schools
  INNER JOIN districts ON districts.id = schools.district_id
WHERE
  districts.name = "Cambridge";