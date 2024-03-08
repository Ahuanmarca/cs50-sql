select
  count(english_title)
from
  views
where
  artist = "Hiroshige"
  and english_title like "%Eastern Capital%";