select
  count(title) as "Nr. of episodes aired from 2018 to 2023"
from
  episodes
where
  air_date between "2018-01-01" and "2023-12-31";