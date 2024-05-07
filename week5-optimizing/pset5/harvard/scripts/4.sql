-- 4.sql
-- Find all computer science courses taught in Spring 2024:
SELECT
    "courses"."id",
    "courses"."department",
    "courses"."number",
    "courses"."title"
FROM
    "courses"
WHERE
    "courses"."department" = 'Computer Science'
    AND "courses"."semester" = 'Spring 2024'
;
