-- indexes.sql file start

-- Index for 1.sql
CREATE INDEX IF NOT EXISTS "enrollments_student_id_index"
ON "enrollments" ("student_id");

-- Index for 2.sql
CREATE INDEX IF NOT EXISTS "courses_index"
ON "courses" ("semester", "number", "department", "title");
CREATE INDEX IF NOT EXISTS "enrollments_course_id_index"
ON "enrollments" ("course_id");

-- Index for 3.sql
-- Update "courses_index" so "semester" is the first column

-- Index for 4.sql
-- Add "title" to "courses_index" so it becomes a covering index

-- Index for 5.sql
CREATE INDEX IF NOT EXISTS "satisfies_course_id_index"
ON "satisfies" ("course_id");

-- Index for 6.sql
-- No changes

-- Index for 7.sql
-- No changes
