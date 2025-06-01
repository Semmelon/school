-- tables

create table personal
(
    id        int,
    svz       varchar2(40) not null unique,
    firstname varchar2(40) not null,
    lastname  varchar2(40) not null,
    birthdate date         not null,
    primary key (id)
);

create table customer
(
    id        int,
    svz       varchar2(40)   not null unique,
    firstname varchar2(40)   not null,
    lastname  varchar2(40)   not null,
    birthdate date           not null,
    money     decimal(10, 2) not null,
    primary key (id)
);

create table game
(
    id          int,
    bezeichnung varchar2(40)  not null,
    description varchar2(40),
    rules       varchar2(120) not null,
    primary key (id)
);

create table game_history
(
    id       int,
    customer int            not null,
    "table"  int            not null,
    time     timestamp      not null,
    payout   decimal(10, 2) not null,
    unique (customer, "table", time),
    primary key (id)
);

create table "table"
(
    id    int,
    place varchar2(40) not null,
    game  int          not null,
    primary key (id)
);

create table table_personal
(
    id         int,
    personal   int       not null,
    "table"    int       not null,
    "date"     date      not null,
    start_time timestamp not null,
    end_time   timestamp not null,
    unique (personal, "table", "date", start_time, end_time),
    primary key (id)
);

create table personal_contract_history
(
    id       int,
    personal int            not null,
    since    date           not null,
    till     date           not null,
    salary   decimal(10, 2) not null,
    unique (personal, since, salary),
    primary key (id)
);

CREATE TABLE log_table (
  log_id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  table_name    VARCHAR2(50),
  table_operation     VARCHAR2(10),
  description   VARCHAR2(4000),
  executed_by   VARCHAR2(100),
  executed_at   DATE DEFAULT SYSDATE
);


-- foreign keys
alter table game_history
    add foreign key (customer) references customer (id) on delete cascade
    add foreign key ("table") references "table" (id) on delete cascade;

alter table table_personal
    add foreign key ("table") references "table" (id) on delete cascade
    add foreign key (personal) references personal (id) on delete cascade;

alter table personal_contract_history
    add foreign key (personal) references personal (id) on delete cascade;

alter table "table"
    add foreign key (game) references game (id) on delete cascade;
