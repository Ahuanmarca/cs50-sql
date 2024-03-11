SELECT
  districts.name as "District",
  expenditures.pupils
FROM
  districts
  INNER JOIN expenditures ON districts.id = expenditures.district_id;