select
  first_name || " " || last_name as "Full Name",
  birth_city
from
  players
where
  birth_country != "USA"
order by
  birth_year,
  first_name,
  last_name;