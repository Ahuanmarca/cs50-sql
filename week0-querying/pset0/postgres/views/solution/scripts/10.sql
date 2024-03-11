select
  japanese_title as "Japanese Title",
  english_title as "Translation",
  artist
from
  views
where
  entropy > 0.5
  and artist = 'Hiroshige'
order by
  brightness desc
limit
  5;
