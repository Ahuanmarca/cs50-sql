-- 7.sql
-- Search for a course by title and semester:
SELECT
    "department",
    "number",
    "title"
FROM
    "courses"
WHERE
    "title" LIKE "History%"
    AND "semester" = 'Fall 2023';
