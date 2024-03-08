-- Select the date of the first episode aired every year
select
  -- air_date,
  title as "First episode aired every year",
  strftime ("%Y", min(air_date)) as Year,
  strftime ("%m", air_date) || "-" || strftime ("%d", air_date) as Date
from
  episodes
group by
  strftime ("%Y", air_date);