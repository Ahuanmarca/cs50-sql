select
  -- min(contrast) as "Minimum Contrast",
  max(contrast) as "Maximum Contrast"
from
  views
where
  artist = 'Hokusai';