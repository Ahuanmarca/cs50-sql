select
  english_title as "Print with the highest brightness",
  artist
from
  views
order by
  brightness desc
limit
  1;