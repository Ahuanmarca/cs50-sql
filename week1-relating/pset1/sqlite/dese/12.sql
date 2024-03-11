-- 12.sql
-- A parent asks you for advice on finding the best public school districts
-- in Massachusetts. In 12.sql, write a SQL query to find public school
-- districts with above-average per-pupil expenditures and an above-average
-- percentage of teachers rated “exemplary”. Your query should return the
-- districts’ names, along with their per-pupil expenditures and percentage
-- of teachers rated exemplary. Sort the results first by the percentage of
-- teachers rated exemplary (high to low), then by the per-pupil expenditure
-- (high to low).
-- Districts with above average per pupil expenditure
SELECT
  expenditures.per_pupil_expenditure AS "per pupil expenditure",
  staff_evaluations.exemplary AS "exemplary teachers percentage",
  districts.name AS "district"
FROM
  districts
  INNER JOIN expenditures
  INNER JOIN staff_evaluations
  ON districts.id = expenditures.district_id
  AND staff_evaluations.district_id = districts.id
WHERE
  districts.type = "Public School District"
  AND expenditures.per_pupil_expenditure > (
    SELECT
      AVG(per_pupil_expenditure)
    FROM
      expenditures
  )
  AND staff_evaluations.exemplary > (
    SELECT
      AVG(exemplary)
    FROM
      staff_evaluations
  )
ORDER BY
  "exemplary teachers percentage" DESC,
  "per pupil expenditure" DESC;