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
