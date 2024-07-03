select * from employees;

with recursive bosses as (
	-- init
	select id, name, reports_to from employees where id = 1
	union 
	-- recursive
	select employees.id, employees.name, employees.reports_to from employees
		inner join bosses on bosses.id = employees.reports_to
)
select * from bosses;