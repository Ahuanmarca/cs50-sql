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
