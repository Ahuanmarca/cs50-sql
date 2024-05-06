-- The app needs to send users a summary of their engagement.
-- Find the username of the most popular user, defined as the
-- user who has had the most messages sent to them. If two or 
-- more users have had the same number of messages sent to them, 
-- return the username that is first alphabetically.

-- Ensure your query uses the search_messages_by_to_user_id
-- index, which is defined as follows:

-- CREATE INDEX "search_messages_by_to_user_id"
-- ON "messages"("to_user_id");

SELECT
    users.username AS most_popular
    -- , count(messages.to_user_id) as received_messages
FROM users INNER JOIN messages
ON users.id = messages.to_user_id
GROUP BY messages.to_user_id
ORDER BY count(messages.to_user_id) DESC, users.username ASC
LIMIT 1
;

-- sqlite> .read 4.sql
-- +----------------------+
-- |     most_popular     |
-- +----------------------+
-- | charminghappiness484 |
-- +----------------------+
