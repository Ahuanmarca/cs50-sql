select
  birth_city as City,
  birth_state as State,
  birth_country as Country
from
  players
where
  first_name = 'Jackie'
  and last_name = 'Robinson';
