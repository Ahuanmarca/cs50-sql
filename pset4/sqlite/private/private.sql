-- Cipher
-- | 14   | 98  | 4   |
-- | 114  | 3   | 5   |
-- | 618  | 72  | 9   |
-- | 630  | 7   | 3   |
-- | 932  | 12  | 5   |
-- | 2230 | 50  | 7   |
-- | 2346 | 44  | 10  |
-- | 3041 | 14  | 5   |

DROP TABLE IF EXISTS cipher;
CREATE TABLE cipher (
  sentence_id INTEGER,
  character_position INTEGER,
  phrase_length INTEGER
);
INSERT INTO cipher (sentence_id, character_position, phrase_length)
VALUES
  (14, 98, 4),
  (114, 3 ,5),
  (618, 72, 9),
  (630, 7, 3),
  (932, 12, 5),
  (2230, 50, 7),
  (2346, 44, 10),
  (3041, 14, 5);

DROP VIEW IF EXISTS message;
CREATE VIEW message AS
SELECT substr(
  sentences.sentence,
  cipher.character_position,
  cipher.phrase_length
) AS phrase
FROM cipher INNER JOIN sentences
ON cipher.sentence_id = sentences.id;

-- SELECT * FROM message;
