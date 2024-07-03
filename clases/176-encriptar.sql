create extension pgcrypto;

insert into
    "user" (username, password)
values('Pablo', crypt('pablo123', gen_salt('bf')));

select
    count(*)
from
    "user"
where
    username = 'Pablo'
    and password = crypt('pablo123', password);