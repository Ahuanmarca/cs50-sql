drop table if exists import.master_views cascade;
drop schema if exists import cascade;

create schema if not exists import;
create table import.master_views(
    id text,
    print_number text,
    english_title text,
    japanese_title text,
    artist text,
    average_color text,
    brightness text,
    contrast text,
    entropy text
);

