call user_login('Pablo', 'pablo123');

create or replace trigger create_session_trigger after update on "user"
for each row when (OLD.last_login is distinct from NEW.last_login) execute procedure create_session_log();

create or replace function create_session_log()
returns trigger as $$
begin
	insert into "session" (user_id, last_login) values(NEW.id, now());
	
	return new;
end;
$$ language plpgsql;