SELECT
  city,
  count(type) as "Public Schools"
from
  schools
where
  type = 'Public School'
GROUP BY
  city
ORDER BY
  "Public Schools" DESC,
  city
LIMIT
  10;