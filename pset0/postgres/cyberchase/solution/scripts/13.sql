select title, topic, air_date from episodes
where topic ilike '%data%'
or topic ilike '%logic%';