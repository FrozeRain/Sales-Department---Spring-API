create sequence hibernate_sequence start with 1 increment by 1;
create table clients
(
    id     bigint not null,
    name   varchar(255) not null ,
    number varchar(255),
    primary key (id)
);
create table orders
(
    id     bigint not null,
    date   date not null ,
    value  float,
    client bigint not null ,
);
create table users
(
    id       bigint  not null,
    active   boolean not null,
    password varchar(255) not null ,
    username varchar(255) not null ,
    primary key (id)
);
create table users_role
(
    user_id bigint not null,
    roles   varchar(255)
);
alter table orders
    add constraint orders_clients_fk foreign key (client) references clients on DELETE cascade ;
alter table users_role
    add constraint roles_users_fk foreign key (user_id) references users on DELETE cascade ;