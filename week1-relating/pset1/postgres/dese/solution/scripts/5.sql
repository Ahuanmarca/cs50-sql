SELECT
  city,
  COUNT(type) as "Public Schools"
FROM
  schools
WHERE
  type = 'Public School'
GROUP BY city
HAVING COUNT(type) < 4
ORDER BY
  "Public Schools" DESC,
  city;