-- Create a view with authors and books
DROP VIEW IF EXISTS longlist;
CREATE VIEW longlist AS
SELECT
    authors.name AS "author",
    books.title AS "book"
FROM
    authors
    INNER JOIN authored
    INNER JOIN books
ON
    authors.id = authored.author_id
    AND authored.book_id = books.id;

-- Query the created view like any table
SELECT * from longlist WHERE author = "Fernanda Melchor";

-- +------------------+------------------+
-- |      author      |       book       |
-- +------------------+------------------+
-- | Fernanda Melchor | Paradais         |
-- | Fernanda Melchor | Hurricane Season |
-- +------------------+------------------+

-- Average group ratings view
DROP VIEW IF EXISTS average_book_ratings; 
CREATE VIEW average_book_ratings AS
SELECT
    book_id AS id,
    title AS book,
    year,
    ROUND(AVG(rating), 2) AS rating
FROM
    ratings JOIN books
ON
    ratings.book_id = books.id
GROUP BY
    book_id;

-- Query the average_book_ratings view
SELECT * FROM average_book_ratings LIMIT 5;

-- +----+---------------------------------------+------+--------+
-- | id |                 book                  | year | rating |
-- +----+---------------------------------------+------+--------+
-- | 1  | Boulder                               | 2023 | 3.77   |
-- | 2  | Whale                                 | 2023 | 3.97   |
-- | 3  | The Gospel According to the New World | 2023 | 3.04   |
-- | 4  | Standing Heavy                        | 2023 | 3.57   |
-- | 5  | Time Shelter                          | 2023 | 4.06   |
-- +----+---------------------------------------+------+--------+

WITH average_book_ratings AS (
    SELECT book_id, title, year, ROUND(AVG(rating), 2) AS rating
    FROM ratings
    JOIN books ON ratings.book_id = books.id
    GROUP BY book_id
)
SELECT year, ROUND(AVG(rating), 2) AS rating
FROM average_book_ratings
GROUP BY year;

-- Add deleted column to collections

-- Create current collections view

-- Delete something from a view (from the real table)
CREATE TRIGGER delete
INSTEAD OF DELETE ON current_collections
FOR EACH ROW
BEGIN
    UPDATE collection SET deleted = 1
    WHERE id = OLD.id;
END;


-- Conditionals!
CREATE TRIGGER insert_when_exists
INSTEAD OF INSERT ON current_collections
FOR EACH ROW
WHEN NEW.accession_number IN (
    SELECT accession_number FROM collections
)
BEGIN
    UPDATE collections SET deleted = 0
    WHERE accession_number = NEW.accession_number
END;
