select
  -- birth_country,
  first_name,
  last_name
from
  players
where
  birth_country != "USA"
order by
  first_name,
  last_name;