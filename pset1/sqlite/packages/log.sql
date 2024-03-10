
-- *** The Lost Letter ***

-- I need the id of the package so I can find it in the scans table.
-- I join the addresses table with the packages table to find all the packages sent from Anneke's address.

SELECT * FROM packages
  INNER JOIN addresses
  ON packages.from_address_id = addresses.id
  WHERE addresses.address = "900 Somerville Avenue"
  LIMIT 10;

-- Result:
-- +------+-----------------------+-----------------+---------------+-----+-----------------------+-------------+
-- |  id  |       contents        | from_address_id | to_address_id | id  |        address        |    type     |
-- +------+-----------------------+-----------------+---------------+-----+-----------------------+-------------+
-- | 384  | Congratulatory letter | 432             | 854           | 432 | 900 Somerville Avenue | Residential |
-- | 2437 | String                | 432             | 484           | 432 | 900 Somerville Avenue | Residential |
-- | 3529 | Letter opener         | 432             | 585           | 432 | 900 Somerville Avenue | Residential |
-- | 5436 | Whiteboard            | 432             | 4984          | 432 | 900 Somerville Avenue | Residential |
-- +------+-----------------------+-----------------+---------------+-----+-----------------------+-------------+

-- The previous result has 4 rows, so I need to refine the search. I can use the contents column.
-- I can also select fewer columns and rename them for more clarity.

SELECT packages.id AS "id", packages.contents AS "Description", addresses.address AS "From"
  FROM packages INNER JOIN addresses
  ON packages.from_address_id = addresses.id
  WHERE addresses.address = "900 Somerville Avenue"
  AND packages.contents = "Congratulatory letter"
  LIMIT 10;

-- Result:
-- +-----+-----------------------+-----------------------+
-- | id  |      Description      |         From          |
-- +-----+-----------------------+-----------------------+
-- | 384 | Congratulatory letter | 900 Somerville Avenue |
-- +-----+-----------------------+-----------------------+

-- Great! I got the package and it's id.
-- I need to use the id to find the scan, then the scan to find the destination address.
-- I will select address from addresses and action from scans to get more information.
-- I will use an INNER JOIN to join the scans and the addresses tables.

SELECT addresses.address AS "Lost Letter", scans.action
  FROM addresses INNER JOIN scans
  ON addresses.id = scans.address_id
  WHERE scans.package_id = 384;

-- Result:
-- +-----------------------+--------+
-- |      Lost Letter      | action |
-- +-----------------------+--------+
-- | 900 Somerville Avenue | Pick   |
-- | 2 Finnigan Street     | Drop   |
-- +-----------------------+--------+

-- Whoops! The address_id on the scans table points to either picks or drops, so I get 2 rows from the same package.
-- I can filter with action. I'm looking fot the "Drop" site.
-- I also need to select the address type.
-- I can also nest the whole first query so I don't need to hardcode the package id.

SELECT addresses.address AS "Delivered To", 
  addresses.type AS "Address Type", scans.action
  FROM addresses INNER JOIN scans
  ON addresses.id = scans.address_id
  WHERE scans.action = "Drop"
  and scans.package_id = (
    SELECT packages.id
      FROM packages INNER JOIN addresses
      ON packages.from_address_id = addresses.id
      WHERE addresses.address = "900 Somerville Avenue"
      AND packages.contents = "Congratulatory letter"
  );

-- Result:
-- +-------------------+--------------+--------+
-- |   Delivered To    | Address Type | action |
-- +-------------------+--------------+--------+
-- | 2 Finnigan Street | Residential  | Drop   |
-- +-------------------+--------------+--------+

-- *** The Devious Delivery ***

-- I need to find a package where the contents include the word "duck" and the address is null

SELECT * FROM packages
  WHERE contents LIKE "%duck%"
  AND from_address_id IS NULL;

-- Result:
-- +------+---------------+-----------------+---------------+
-- |  id  |   contents    | from_address_id | to_address_id |
-- +------+---------------+-----------------+---------------+
-- | 5098 | Duck debugger |                 | 50            |
-- +------+---------------+-----------------+---------------+

-- I found the package and it's contents.
-- I can't trust the to_address_id on this table because the package was lost,
-- so I need to reach the address through the scans table

SELECT packages.contents as "Contents", 
  addresses.address as "Delivered to", 
  addresses.type as "Address Type"
  FROM packages INNER JOIN scans INNER JOIN addresses
  ON scans.package_id = packages.id
  AND scans.address_id = addresses.id
  WHERE packages.from_address_id IS NULL
  AND packages.contents LIKE "%duck%"
  AND scans.action = "Drop";

-- Result:
-- +---------------+------------------+----------------+
-- |   Contents    |   Delivered to   |  Address Type  |
-- +---------------+------------------+----------------+
-- | Duck debugger | 7 Humboldt Place | Police Station |
-- +---------------+------------------+----------------+


-- *** The Forgotten Gift ***

-- Find id of the package sent from "109 Tileston Street" to "728 Maple Place"
-- There may be several packages sent from/to those addresses
-- I can find them joining "packages" with "addresses"

SELECT packages.id AS "id", packages.contents AS "contents"
  FROM packages INNER JOIN addresses
  ON packages.from_address_id = addresses.id
  WHERE addresses.address = "109 Tileston Street"
  AND packages.to_address_id = (
    SELECT addresses.id
    FROM addresses INNER JOIN packages
    ON addresses.id = packages.to_address_id
    WHERE addresses.address = "728 Maple Place"
  );

-- Result
-- +------+----------+
-- |  id  | contents |
-- +------+----------+
-- | 9523 | Flowers  |
-- +------+----------+

-- Luckly there's only one package.
-- We need to find the driver that has the package
-- We can do that by joining "drivers" with "scans"

SELECT drivers.name
  FROM drivers INNER JOIN scans
  ON scans.driver_id = drivers.id
  WHERE package_id = 9523;

-- Result
-- +--------+
-- |  name  |
-- +--------+
-- | Maegan |
-- | Maegan |
-- | Mikel  |
-- +--------+

-- Uh oh! What's going on? Looks like more than one driver can be involved in a delivery, so...
-- I will select more columns to get more information about the scans

SELECT drivers.name AS "Driver", 
scans.address_id AS "Address id", 
scans.action AS "Action", 
scans.timestamp AS "Timestamp"
  FROM drivers INNER JOIN scans
  ON scans.driver_id = drivers.id
  WHERE scans.package_id = 9523
  ORDER BY scans.timestamp;

-- Resutl
-- +--------+------------+--------+----------------------------+
-- | Driver | Address id | Action |         Timestamp          |
-- +--------+------------+--------+----------------------------+
-- | Maegan | 9873       | Pick   | 2023-08-16 21:41:43.219831 |
-- | Maegan | 7432       | Drop   | 2023-08-17 03:31:36.856889 |
-- | Mikel  | 7432       | Pick   | 2023-08-23 19:41:47.913410 |
-- +--------+------------+--------+----------------------------+

-- I think the package went to the wrong address and was picked up again by another driver.
-- So the package is now in possession of Mikel.
-- I could nest the queries to avoid hardcoding the address is.

SELECT drivers.name AS "Driver", 
scans.address_id AS "Address id", 
scans.action AS "Action", 
scans.timestamp AS "Timestamp"
  FROM drivers INNER JOIN scans
  ON scans.driver_id = drivers.id
  WHERE scans.package_id = (
    SELECT packages.id
      FROM packages INNER JOIN addresses
      ON packages.from_address_id = addresses.id
      WHERE addresses.address = "109 Tileston Street"
      AND packages.to_address_id = (
        SELECT addresses.id
          FROM addresses INNER JOIN packages
          ON addresses.id = packages.to_address_id
          WHERE addresses.address = "728 Maple Place"
    )
  )
  ORDER BY scans.timestamp;

-- Result:
-- +--------+------------+--------+----------------------------+
-- | Driver | Address id | Action |         Timestamp          |
-- +--------+------------+--------+----------------------------+
-- | Maegan | 9873       | Pick   | 2023-08-16 21:41:43.219831 |
-- | Maegan | 7432       | Drop   | 2023-08-17 03:31:36.856889 |
-- | Mikel  | 7432       | Pick   | 2023-08-23 19:41:47.913410 |
-- +--------+------------+--------+----------------------------+

-- I already got the answers, but in separate queries.
-- How to get them in just one query?

SELECT
  drivers.name AS "Driver", 
  packages.contents AS "Contents",
  addresses.address AS "Address",
  scans.action AS "Action",
  date(scans.timestamp) AS "Date"
FROM
  packages INNER JOIN drivers INNER JOIN addresses INNER JOIN scans
ON
  scans.package_id = packages.id AND
  scans.driver_id = drivers.id AND
  scans.address_id = addresses.id
  WHERE scans.package_id = (
    SELECT packages.id
      FROM packages INNER JOIN addresses
      ON packages.from_address_id = addresses.id
      WHERE addresses.address = "109 Tileston Street"
      AND packages.to_address_id = (
        SELECT addresses.id
          FROM addresses INNER JOIN packages
          ON addresses.id = packages.to_address_id
          WHERE addresses.address = "728 Maple Place"
      )
    )
  ORDER BY "Date" ASC;

-- Result:
-- +--------+----------+------------------------+--------+------------+
-- | Driver | Contents |        Address         | Action |    Date    |
-- +--------+----------+------------------------+--------+------------+
-- | Maegan | Flowers  | 109 Tileston Street    | Pick   | 2023-08-16 |
-- | Maegan | Flowers  | 950 Brannon Harris Way | Drop   | 2023-08-17 |
-- | Mikel  | Flowers  | 950 Brannon Harris Way | Pick   | 2023-08-23 |
-- +--------+----------+------------------------+--------+------------+
