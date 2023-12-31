select
  -- debut,
  printf ("%.1f", avg(weight)) as "Average Weight",
  printf ("%.1f", avg(height)) as "Average Height"
from
  players
where
  debut > "1999-12-31"
limit
  10;