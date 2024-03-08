-- 
-- CREATING IMPORT SCHEMA
-- Schema created in it's own namespace, not in the public schema
-- Will contain all values from master_plan.csv as strings

drop table if exists import.master_episodes cascade;
drop schema if exists import cascade;

create schema if not exists import;
create table import.master_episodes(
  id text,
  season text,
  episode_in_season text,
  title text,
  topic text,
  air_date text,
  production_code text
);

-- Append to build.sql after this file
-- COPY import.master_episodes FROM $(CSV) WITH DELIMITER ',' HEADER CSV;
COPY import.master_episodes FROM '/Users/renzobelon/Desktop/repositories/cs50-sql-postgres/pset0/cyberchase/data/cyberchase.csv' WITH DELIMITER ',' HEADER CSV;
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
