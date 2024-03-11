SELECT
  expenditures.per_pupil_expenditure AS "per pupil expenditure",
  districts.name AS "district"
FROM
  districts
  INNER JOIN expenditures ON districts.id = expenditures.district_id
WHERE
  districts.type = "Public School District"
ORDER BY
  expenditures.per_pupil_expenditure DESC
LIMIT
  10;