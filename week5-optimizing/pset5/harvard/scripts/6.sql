-- 6.sql
-- Find how many courses in each requirement a student has satisfied:
SELECT
    "requirements"."name",
    COUNT(*) AS "courses"
FROM
    "requirements"
    JOIN "satisfies" ON "requirements"."id" = "satisfies"."requirement_id"
WHERE
    "satisfies"."course_id" IN (
        SELECT
            "course_id"
        FROM
            "enrollments"
        WHERE
            "enrollments"."student_id" = 8
    )
GROUP BY
    "requirements"."name";
