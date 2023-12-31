select
  -- print number with specific number of decimals
  printf ("%.2f", avg(entropy)) as "Hiroshige Average Entropy"
from
  views
where
  artist = "Hiroshige"