select
  count(english_title) as "Prints by Hokusai that include 'Fuji' in the english title"
from
  views
where
  artist = 'Hokusai'
  and english_title like '%Fuji%';