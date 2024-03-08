select
    round(avg(weight), 1) as "Average Weight",
    round(avg(height), 1) as "Average Height"
from
    players
where
    debut > '1999-12-31'
limit
    10;
