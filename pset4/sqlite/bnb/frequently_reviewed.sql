-- DROP VIEW IF EXISTS frequently_reviewed;
CREATE VIEW frequently_reviewed AS
SELECT
  listings.id AS id,
  listings.property_type AS property_type,
  listings.host_name AS host_name,
  COUNT(*) AS reviews
FROM
  listings INNER JOIN reviews
ON
  listings.id = reviews.listing_id
GROUP BY
  reviews.listing_id
ORDER BY
  reviews DESC,
  property_type,
  host_name
LIMIT
  100;