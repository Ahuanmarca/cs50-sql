-- 1.sql
-- Find student's historical course enrollments, basde on their ID:
SELECT
    "courses"."title",
    "courses"."semester"
FROM
    "enrollments"
    JOIN "courses" ON "enrollments"."course_id" = "courses"."id"
    JOIN "students" ON "enrollments"."student_id" = "students"."id"
WHERE
    "students"."id" = 3;
