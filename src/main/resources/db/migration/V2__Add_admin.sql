insert into users (id, username, password, active) values ( 1, 'admin', '$2a$08$Tz5aQ6A6vlYkiXkzPfOdM.8P.yh/DlKLzQxkh0pW53WV9ZnOdYXY6', true );

insert into users_role (user_id, roles) values ( 1, 'USER' ), ( 1, 'ADMIN');