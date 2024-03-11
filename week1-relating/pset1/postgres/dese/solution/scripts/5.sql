select
    city,
    count(*) as public_schools
from
    schools
where
    type = 'Public School'
group by
    city
having
    count(*) < 4
order by
    public_schools DESC,
    city;
