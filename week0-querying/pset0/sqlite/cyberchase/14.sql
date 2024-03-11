-- Select episodes aired during holiday season
select
  title,
  air_date
from
  episodes
where
  strftime ("%m", air_date) = "12"
  or (
    strftime ("%m", air_date) = "11"
    and strftime ("d", air_date) > cast("22" as integer)
  )
order by air_date;