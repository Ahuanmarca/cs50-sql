-- 3.sql
-- Sort courses by most- to least-enrolled in Fall 2023:
SELECT
    "courses"."id",
    "courses"."department",
    "courses"."number",
    "courses"."title",
    COUNT(*) AS "enrollment"
FROM
    "courses"
    JOIN "enrollments" ON "enrollments"."course_id" = "courses"."id"
WHERE
    "courses"."semester" = 'Fall 2023'
GROUP BY
    "courses"."id"
ORDER BY
    "enrollment" DESC
LIMIT 10
;
