select
    city,
    count(type) as "Public Schools"
from
    schools
where
    type = 'Public School'
group by
    city
order by
    "Public Schools" desc,
    city
limit
    10;