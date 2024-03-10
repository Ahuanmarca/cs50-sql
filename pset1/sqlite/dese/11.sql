SELECT
  schools.name AS "school",
  graduation_rates.graduated AS "graduation rates",
  expenditures.per_pupil_expenditure AS "per pupil expenditure"
FROM
  schools
  INNER JOIN graduation_rates
  INNER JOIN districts
  INNER JOIN expenditures ON schools.id = graduation_rates.school_id
  AND districts.id = schools.district_id
  AND expenditures.district_id = districts.id
ORDER BY
  "per pupil expenditure" DESC, "school";