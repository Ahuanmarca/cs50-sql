SELECT
    schools.name AS "school",
    graduation_rates.graduated AS "graduation rate",
    expenditures.per_pupil_expenditure AS "per pupil expenditure"
FROM
    schools
    INNER JOIN graduation_rates
    ON schools.id = graduation_rates.school_id
    INNER JOIN districts
    ON districts.id = schools.district_id
    INNER JOIN expenditures
    ON expenditures.district_id = districts.id
ORDER BY "per pupil expenditure" DESC, "school" LIMIT 10;
