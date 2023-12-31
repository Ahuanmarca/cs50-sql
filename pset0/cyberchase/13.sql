select title, topic, air_date from episodes
where topic like "%data%"
or topic like "%logic%";