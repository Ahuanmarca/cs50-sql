drop table if exists import.master_districts cascade;
drop table if exists import.master_expenditures cascade;
drop table if exists import.master_graduation_rates cascade;
drop table if exists import.master_schools cascade;
drop table if exists import.master_staff_evaluations cascade;
drop schema if exists import cascade;
create schema import;

create table if not exists import.master_districts(
    id text,
    name text,
    type text,
    city text,
    state text,
    zip text
);

create table if not exists import.master_expenditures(
    id text,
    district_id text,
    pupils text,
    per_pupil_expenditure text
);

create table if not exists import.master_graduation_rates(
    id text,
    school_id text,
    graduated text,
    dropped text,
    excluded text
);

create table if not exists import.master_schools(
    id text,
    district_id text,
    name text,
    type text,
    city text,
    state text,
    zip text
);

create table if not exists import.master_staff_evaluations(
    id text,
    district_id text,
    evaluated text,
    exemplary text,
    proficient text,
    needs_improvement text,
    unsatisfactory text
);
COPY import.master_districts FROM '/Users/renzobelon/Desktop/repositories/cs50-sql/pset1/postgres/dese/loading/data/districts.csv' WITH DELIMITER ',' HEADER CSV;
COPY import.master_expenditures FROM '/Users/renzobelon/Desktop/repositories/cs50-sql/pset1/postgres/dese/loading/data/expenditures.csv' WITH DELIMITER ',' HEADER CSV;
COPY import.master_schools FROM '/Users/renzobelon/Desktop/repositories/cs50-sql/pset1/postgres/dese/loading/data/schools.csv' WITH DELIMITER ',' HEADER CSV;
COPY import.master_graduation_rates FROM '/Users/renzobelon/Desktop/repositories/cs50-sql/pset1/postgres/dese/loading/data/graduation_rates.csv' WITH DELIMITER ',' HEADER CSV;
COPY import.master_staff_evaluations FROM '/Users/renzobelon/Desktop/repositories/cs50-sql/pset1/postgres/dese/loading/data/staff_evaluations.csv' WITH DELIMITER ',' HEADER CSV;
drop table if exists expenditures;
drop table if exists graduation_rates;
drop table if exists schools;
drop table if exists staff_evaluations;
drop table if exists districts;

create table districts(
    id serial primary key,
    name varchar(255),
    type varchar(255),
    city varchar(255),
    state varchar(55),
    zip varchar(55)
);

insert into districts(
    id,
    name,
    type,
    city,
    state,
    zip
)
select
    import.master_districts.id :: integer,
    import.master_districts.name,
    import.master_districts.type,
    import.master_districts.city,
    import.master_districts.state,
    import.master_districts.zip
from import.master_districts;

create table expenditures(
    id serial primary key,
    district_id integer references districts(id),
    pupils integer,
    per_pupil_expenditure numeric(10, 2)
);

insert into expenditures(
    id,
    district_id,
    pupils,
    per_pupil_expenditure
)
select
    import.master_expenditures.id :: integer,
    import.master_expenditures.district_id :: integer,
    import.master_expenditures.pupils :: integer,
    import.master_expenditures.per_pupil_expenditure :: numeric(10, 2)
from import.master_expenditures;

create table schools(
    id serial primary key,
    district_id integer references districts(id),
    name varchar(255),
    type varchar(255),
    city varchar(255),
    state varchar(55),
    zip varchar(55)
);

insert into schools(
    id,
    district_id,
    name,
    type,
    city,
    state,
    zip
)
select
    import.master_schools.id :: integer,
    import.master_schools.district_id :: integer,
    import.master_schools.name,
    import.master_schools.type,
    import.master_schools.city,
    import.master_schools.state,
    import.master_schools.zip
from import.master_schools;

create table graduation_rates(
    id serial primary key,
    school_id integer references schools(id),
    graduated numeric(10, 2),
    dropped numeric(10, 2),
    excluded numeric(10, 2)
);

insert into graduation_rates(
    id,
    school_id,
    graduated,
    dropped,
    excluded
)
select
    import.master_graduation_rates.id :: integer,
    import.master_graduation_rates.school_id :: integer,
    import.master_graduation_rates.graduated :: numeric(10, 2),
    import.master_graduation_rates.dropped :: numeric(10, 2),
    import.master_graduation_rates.excluded :: numeric(10, 2)
from import.master_graduation_rates;

create table staff_evaluations(
    id serial primary key,
    district_id integer references districts(id),
    evaluated numeric(10, 2),
    exemplary numeric(10, 2),
    proficient numeric(10, 2),
    needs_improvement numeric(10, 2),
    unsatisfactory numeric(10, 2)
);

insert into staff_evaluations(
    id,
    district_id,
    evaluated,
    exemplary,
    proficient,
    needs_improvement,
    unsatisfactory
)
select
    import.master_staff_evaluations.id :: integer,
    import.master_staff_evaluations.district_id :: numeric(10, 2), 
    import.master_staff_evaluations.evaluated :: numeric(10, 2),
    import.master_staff_evaluations.exemplary :: numeric(10, 2),
    import.master_staff_evaluations.proficient :: numeric(10, 2),
    import.master_staff_evaluations.needs_improvement :: numeric(10, 2),
    import.master_staff_evaluations.unsatisfactory :: numeric(10, 2)
from import.master_staff_evaluations;