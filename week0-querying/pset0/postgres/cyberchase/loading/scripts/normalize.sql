drop table if exists episodes;

create table episodes(
    id serial primary key,
    season integer,
    episode_in_season integer,
    title varchar(500),
    topic varchar(500),
    air_date date,
    production_code text
);

insert into episodes(
    id,
    season,
    episode_in_season,
    title,
    topic,
    air_date,
    production_code
)
select
    import.master_episodes.id :: integer,
    import.master_episodes.season :: integer,
    import.master_episodes.episode_in_season :: integer,
    import.master_episodes.title,
    import.master_episodes.topic,
    import.master_episodes.air_date :: date,
    import.master_episodes.production_code
from import.master_episodes;
