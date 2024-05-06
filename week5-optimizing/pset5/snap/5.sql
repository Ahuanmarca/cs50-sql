-- For any two users, the app needs to quickly show a list of the
-- friends they have in common. Given two usernames, lovelytrust487
-- and exceptionalinspiration482, find the user IDs of their mutual
-- friends. A mutual friend is a user that both lovelytrust487 and
-- exceptionalinspiration482 count among their friends.

-- Ensure your query uses the index automatically created on
-- primary key columns of the friends table. This index is called
-- sqlite_autoindex_friends_1.

-- Pseudocode:
-- Select friends from lovelytrust487
-- Intersect
-- Select friends from exceptionalinspiration482

-- EXPLAIN QUERY PLAN
SELECT
    users_as_friends.id AS "mutual friends"
FROM users AS users_as_friends
INNER JOIN friends
ON users_as_friends.id = friends.friend_id
INNER JOIN users AS users_as_users
ON users_as_users.id = friends.user_id
WHERE users_as_users.username = 'lovelytrust487'

INTERSECT

SELECT
    users_as_friends.id
FROM users AS users_as_friends
INNER JOIN friends
ON users_as_friends.id = friends.friend_id
INNER JOIN users AS users_as_users
ON users_as_users.id = friends.user_id
WHERE users_as_users.username = 'exceptionalinspiration482'
;

-- EXPLAIN QUERY PLAN
-- ...
-- QUERY PLAN
-- `--COMPOUND QUERY
--    |--LEFT-MOST SUBQUERY
--    |  |--SEARCH users_as_users USING COVERING INDEX sqlite_autoindex_users_1 (username=?)
--    |  |--SEARCH friends USING COVERING INDEX sqlite_autoindex_friends_1 (user_id=?)
--    |  `--SEARCH users_as_friends USING INTEGER PRIMARY KEY (rowid=?)
--    `--INTERSECT USING TEMP B-TREE
--       |--SEARCH users_as_users USING COVERING INDEX sqlite_autoindex_users_1 (username=?)
--       |--SEARCH friends USING COVERING INDEX sqlite_autoindex_friends_1 (user_id=?)
--       `--SEARCH users_as_friends USING INTEGER PRIMARY KEY (rowid=?)