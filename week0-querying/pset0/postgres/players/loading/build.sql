drop table if exists import.master_players cascade;
drop schema if exists import cascade;

create schema import;
create table import.master_players(
    id text,
    first_name text,
    last_name text,
    bats text,
    throws text,
    weight text,
    height text,
    debut text,
    final_game text,
    birth_year text,
    birth_month text,
    birth_day text,
    birth_city text,
    birth_state text,
    birth_country text
);

COPY import.master_players FROM '/Users/renzobelon/Desktop/repositories/cs50-sql-postgres/pset0/players/loading/data/players.csv' WITH DELIMITER ',' HEADER CSV;
drop table if exists players;

create table players(
    id serial primary key,
    first_name varchar(255),
    last_name varchar(255),
    bats char,
    throws char,
    weight integer,
    height integer,
    debut date,
    final_game date,
    birth_year integer,
    birth_month integer,
    birth_day integer,
    birth_city varchar(255),
    birth_state varchar(255),
    birth_country varchar(255)
);

insert into players(
    id,
    first_name,
    last_name,
    bats,
    throws,
    weight,
    height,
    debut,
    final_game,
    birth_year,
    birth_month,
    birth_day,
    birth_city,
    birth_state,
    birth_country
)
select
    import.master_players.id :: integer,
    import.master_players.first_name,
    import.master_players.last_name,
    import.master_players.bats :: char,
    import.master_players.throws :: char,
    import.master_players.weight :: integer,
    import.master_players.height :: integer,
    import.master_players.debut :: date,
    import.master_players.final_game :: date,
    import.master_players.birth_year :: integer,
    import.master_players.birth_month :: integer,
    import.master_players.birth_day :: integer,
    import.master_players.birth_city,
    import.master_players.birth_state,
    import.master_players.birth_country
from import.master_players;
