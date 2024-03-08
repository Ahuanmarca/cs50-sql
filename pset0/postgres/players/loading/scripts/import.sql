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

