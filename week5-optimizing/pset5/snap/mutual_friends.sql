-- Find mutual friends between two usernames
-- lovelytrust487 and exceptionalinspiration482

-- We must join the tables users and friends two times,
-- once for the user and once for it's friends

SELECT
    users_as_friends.username AS mutual_friends
FROM users AS users_as_friends
INNER JOIN friends
ON users_as_friends.id = friends.friend_id
INNER JOIN users AS users_as_users
ON users_as_users.id = friends.user_id
WHERE users_as_users.username = 'lovelytrust487'

INTERSECT

SELECT
    users_as_friends.username
FROM users AS users_as_friends
INNER JOIN friends
ON users_as_friends.id = friends.friend_id
INNER JOIN users AS users_as_users
ON users_as_users.id = friends.user_id
WHERE users_as_users.username = 'exceptionalinspiration482'
;

