create or replace procedure user_login(user_name varchar, user_password varchar)
as $$
declare
	was_found boolean;
begin
	select count(*) into was_found from "user"
		where username = user_name and 
		password = crypt(user_password, password);
		
	if (was_found = false) then
		insert into session_failed(username, "when") values(user_name, now());
		commit;
		raise exception 'Usuario y contraseña no son correctos';
	end if;
	
	update "user" set last_login = now() where username = user_name;
	raise notice 'Usuario encontrado %', was_found;
end;
$$ language plpgsql;

call user_login('pablo', 'pablo123');