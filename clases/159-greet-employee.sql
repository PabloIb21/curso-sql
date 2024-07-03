select greet_employee('Pablo');

select first_name, greet_employee(first_name) from employees;

create or replace function greet_employee(employee_name varchar)
returns varchar
as $$
-- declare
begin 
	return 'Hola ' || employee_name;
end;
$$
language plpgsql;
