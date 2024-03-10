SELECT
  schools.name as "Charter Schools",
  districts.name as "District"
FROM
  schools
  INNER JOIN districts ON districts.id = schools.district_id
WHERE
  schools.type = "Charter School";