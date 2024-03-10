.schema
-- CREATE TABLE IF NOT EXISTS "listings" (
--     "id" INTEGER,
--     "property_type" TEXT,
--     "host_name" TEXT,
--     "accommodates" INTEGER,
--     "bedrooms" INTEGER,
--     "description" TEXT,
--     PRIMARY KEY("id")
-- );
-- CREATE TABLE IF NOT EXISTS "availabilities" (
--     "id" INTEGER,
--     "listing_id" INTEGER,
--     "date" NUMERIC,
--     "available" INTEGER,
--     "price" NUMERIC,
--     PRIMARY KEY("id"),
--     FOREIGN KEY("listing_id") REFERENCES "listings"("id")
-- );
-- CREATE TABLE IF NOT EXISTS "reviews" (
--     "id" INTEGER,
--     "listing_id" INTEGER,
--     "date" NUMERIC,
--     "reviewer_name" TEXT,
--     "comments" TEXT,
--     PRIMARY KEY("id"),
--     FOREIGN KEY("listing_id") REFERENCES "listings"("id")
-- );

-- TAKING A LOOK AT THE DATA...

select * from listings limit 1;
-- +------+--------------------+-----------+--------------+----------+--------------------------------------------------------------+
-- |  id  |   property_type    | host_name | accommodates | bedrooms |                         description                          |
-- +------+--------------------+-----------+--------------+----------+--------------------------------------------------------------+
-- | 3781 | Entire rental unit | Frank     | 2            | 1        | Fully separate apartment in a two apartment building. Space  |
-- |      |                    |           |              |          | is perfect for an individual or a couple. There is a full ba |
-- |      |                    |           |              |          | th, bedroom with queen bed, small sitting area with TV and a |
-- |      |                    |           |              |          |  fully equipped kitchen with dining area. Walk or bus to sub |
-- |      |                    |           |              |          | way.<br /><br /><b>The space</b><br />This is a totally sepa |
-- |      |                    |           |              |          | rate apartment located on the first floor of a 3 story build |
-- |      |                    |           |              |          | ing. Apartment has one bedroom with queen sized bed plus ful |
-- |      |                    |           |              |          | l eat-in kitchen,sitting room and full bath with tub/shower. |
-- |      |                    |           |              |          |  Free off street parking for one car. SORRY NO SNOW REMOVAL  |
-- |      |                    |           |              |          | SERVICE FOR CAR.  Free wi-fi <br /><br />10 minute walk/5 mi |
-- |      |                    |           |              |          | nute bus (3 doors away) to subway station--next stop is Aqua |
-- |      |                    |           |              |          | rium/Faneuil Hall in central Boston. <br /><br />Guests who  |
-- |      |                    |           |              |          | have stayed in our apartment have used it as a home base to  |
-- |      |                    |           |              |          | explore Boston and surroundings. Others during extended stay |
-- |      |                    |           |              |          | s at the apartment have commuted to  Massachusetts General H |
-- |      |                    |           |              |          | ospital (MGH) and Massachusetts Institute of Technology (MIT |
-- |      |                    |           |              |          | ).  <br /><br />The harbor and harbor wa                     |
-- +------+--------------------+-----------+--------------+----------+--------------------------------------------------------------+

select * from availabilities limit 5;
-- +----+------------+------------+-----------+-------+
-- | id | listing_id |    date    | available | price |
-- +----+------------+------------+-----------+-------+
-- | 1  | 3781       | 2023-06-22 | FALSE     | 120   |
-- | 2  | 3781       | 2023-06-23 | FALSE     | 120   |
-- | 3  | 3781       | 2023-06-24 | FALSE     | 120   |
-- | 4  | 3781       | 2023-06-25 | FALSE     | 120   |
-- | 5  | 3781       | 2023-06-26 | FALSE     | 120   |
-- +----+------------+------------+-----------+-------+

select * from reviews limit 2;
-- +------+------------+------------+---------------+--------------------------------------------------------------+
-- |  id  | listing_id |    date    | reviewer_name |                           comments                           |
-- +------+------------+------------+---------------+--------------------------------------------------------------+
-- | 1021 | 5506       | 2009-03-21 | Jenny         | Terry's Hotel Alterntv in Boston was a perfect place to stay |
-- |      |            |            |               |  for myself and my partner.  We mixed our trip with business |
-- |      |            |            |               |  and pleasure and found the room perfectly appointed for our |
-- |      |            |            |               |  needs and affordable.  A great stay!                        |
-- +------+------------+------------+---------------+--------------------------------------------------------------+
-- | 1953 | 5506       | 2009-05-01 | Clint         | Warm and accommodating host. Beautiful and well appointed ro |
-- |      |            |            |               | om.                                                          |
-- +------+------------+------------+---------------+--------------------------------------------------------------+

-- QUERY TO GET A SENSE OF HOW MUCH DATA EXISTS IN THE TABLES
select
  (select count(*) from listings) as listings,
  (select count(*) from availabilities) as availabilities,
  (select count(*) from reviews) as reviews;
-- +----------+----------------+---------+
-- | listings | availabilities | reviews |
-- +----------+----------------+---------+
-- | 3973     | 766906         | 174512  |
-- +----------+----------------+---------+

-- 'listings' TABLE STATISTICS
select
  count(*) as rows,
  count(distinct property_type) as property_types,
  count(distinct host_name) as host_names,
  round(avg(accommodates)) as avg_accommodations,
  round(avg(bedrooms), 2) as avg_beedroms,
  (
    select count(*) from (
      select * from listings
      where description is null
    )
  ) as no_description
from listings;
-- +------+----------------+------------+--------------------+--------------+----------------+
-- | rows | property_types | host_names | avg_accommodations | avg_beedroms | no_description |
-- +------+----------------+------------+--------------------+--------------+----------------+
-- | 3973 | 40             | 922        | 3.0                | 1.79         | 19             |
-- +------+----------------+------------+--------------------+--------------+----------------+

-- 'availabilities' TABLE STATISTICS
select
  count(*) as rows,
  count(distinct listing_id) as listings,
  (select count(*) from availabilities where available="TRUE") as available,
  (select count(*) from availabilities where available="FALSE") as non_available,
  max(price) as max_price,
  (select min(price) from availabilities where price != 0) as "min_price (non zero)",
  (select count(*) from availabilities where price = 0) as "price = 0",
  round(avg(price), 2) as avg_price
from availabilities;
-- +--------+----------+-----------+---------------+-----------+----------------------+-----------+-----------+
-- |  rows  | listings | available | non_available | max_price | min_price (non zero) | price = 0 | avg_price |
-- +--------+----------+-----------+---------------+-----------+----------------------+-----------+-----------+
-- | 766906 | 3973     | 405201    | 361705        | 10000     | 20                   | 193       | 245.56    |
-- +--------+----------+-----------+---------------+-----------+----------------------+-----------+-----------+

-- 'reviews' TABLE STATISTICS
select
  count(*) as rows,
  count(distinct listing_id) as listings,
  (select count(*) from reviews where date is null) as null_date,
  count(distinct reviewer_name) as reviewer_names,
  (select count(*) from reviews where reviewer_name is null) as null_reviewer_name,
  (select count(*) from reviews where comments is null) as null_comments
from reviews;
-- +--------+----------+-----------+----------------+--------------------+---------------+
-- |  rows  | listings | null_date | reviewer_names | null_reviewer_name | null_comments |
-- +--------+----------+-----------+----------------+--------------------+---------------+
-- | 174512 | 2911     | 0         | 28521          | 1                  | 53            |
-- +--------+----------+-----------+----------------+--------------------+---------------+

-- There's one review with the reviewer_name missing.
select * from reviews where reviewer_name is null;
-- +-----------+------------+------------+---------------+----------------------------------------------+
-- |    id     | listing_id |    date    | reviewer_name |                   comments                   |
-- +-----------+------------+------------+---------------+----------------------------------------------+
-- | 424952679 | 11357756   | 2019-03-17 |               | Overall a good location for short-term stay. |
-- +-----------+------------+------------+---------------+----------------------------------------------+

-- There are some reviews with the comments missing.
select * from reviews where comments is null limit 10;
-- +-----------+------------+------------+-------------------+----------+
-- |    id     | listing_id |    date    |   reviewer_name   | comments |
-- +-----------+------------+------------+-------------------+----------+
-- | 84265295  | 1810172    | 2016-07-06 | Luis              |          |
-- | 154679450 | 15819226   | 2017-05-25 | Oleksandr         |          |
-- | 206016168 | 19364110   | 2017-10-23 | Veronica          |          |
-- | 226610933 | 7513605    | 2018-01-11 | Lillian (Aka Ann) |          |
-- | 253482151 | 7728499    | 2018-04-14 | Amelia            |          |
-- | 261461592 | 4863108    | 2018-05-06 | Shanna            |          |
-- | 277569006 | 3969526    | 2018-06-16 | Nan               |          |
-- | 307036753 | 1472520    | 2018-08-13 | Conor             |          |
-- | 444882516 | 24749244   | 2019-04-28 | Jonathan          |          |
-- | 468102519 | 9834727    | 2019-06-11 | Jennifer          |          |
-- +-----------+------------+------------+-------------------+----------+

