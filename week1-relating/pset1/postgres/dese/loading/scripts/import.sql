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
