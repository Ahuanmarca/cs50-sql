drop table if exists views;

create table views(
    id serial primary key,
    print_number integer,
    english_title varchar(500),
    japanese_title varchar(500),
    artist varchar(500),
    average_color varchar(500),
    brightness numeric(10, 2),
    contrast numeric(10,2),
    entropy numeric(10,2)
);

insert into views(
    id,
    print_number,
    english_title,
    japanese_title,
    artist,
    average_color,
    brightness,
    contrast,
    entropy
)
select
    import.master_views.id :: integer,
    import.master_views.print_number :: integer,
    import.master_views.english_title,
    import.master_views.japanese_title,
    import.master_views.artist,
    import.master_views.average_color,
    import.master_views.brightness :: numeric(10, 2),
    import.master_views.contrast :: numeric(10, 2),
    import.master_views.entropy :: numeric(10, 2)
from import.master_views;
