-- INNER JOIN, GROUP BY, HAVING
-- Display author names, book titles and ratings from books that have an average ratig of 4 or more.
SELECT
    name as "author",
    title as "book",
    ROUND(AVG(rating), 2) AS "rating"
FROM
    authors INNER JOIN authored
    INNER JOIN books
    INNER JOIN ratings
ON
    authors.id = authored.author_id
    AND books.id = authored.book_id
    AND ratings.book_id = books.id
GROUP BY title
HAVING ROUND(AVG(rating), 2) >= 4
ORDER BY "author";

-- UNION, AS
SELECT 'author' AS 'profession', name
FROM authors
UNION
SELECT 'translator' AS 'profession', name
FROM translators;

