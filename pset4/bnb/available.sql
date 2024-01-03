-- DROP VIEW IF EXISTS available;
CREATE VIEW available AS
SELECT
  listings.id,
  listings.property_type,
  listings.host_name,
  availabilities.date
FROM
  listings INNER JOIN availabilities
ON
  listings.id = availabilities.listing_id
WHERE
  availabilities.available="TRUE";