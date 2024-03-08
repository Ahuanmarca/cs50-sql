select
  -- print number with specific number of decimals
  round(avg(entropy), 2) as "Hiroshige Average Entropy"
from
  views
where
  artist = 'Hiroshige'
