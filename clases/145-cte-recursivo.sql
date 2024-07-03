select 5;

-- nombre de la tabla en memoria
-- campos que vamos a tener
with recursive countdown(val) as (
	-- initialization => el primer nivel, o valores iniciales
	-- values(5)
		select 5 as val
	union 
	-- query recursive
	select val - 1 from countdown where val > 1
)
-- select de los campos
select * from countdown;