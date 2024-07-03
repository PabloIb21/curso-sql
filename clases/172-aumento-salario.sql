create or replace procedure controlled_raise(percentage numeric) as
$$
declare
	real_percentage numeric(8,2);
	total_employees int;
begin
	real_percentage = percentage / 100; --5% = 0.05
	
	-- Mantener el historico
	insert into raise_history(date, employee_id, base_salary, amount, percentage)
	select
	    current_date as "date",
	    employee_id,
	    salary,
	    max_raise(employee_id) * real_percentage as amount,
	    percentage
	from employees;
	
	-- Impactar la tabla de empleados
	update employees
		set salary = (max_raise(employee_id) * real_percentage) + salary;
	
	commit;
	
	select count(*) into total_employees from employees;

	raise notice 'Afectados % empleados', total_employees;
end;
$$ language plpgsql;

call controlled_raise(1);

select * from employees;
select * from raise_history;

select
    current_date as "date",
    employee_id,
    salary,
    max_raise(employee_id) * 0.05 as amount,
    5 as percentage
from
    employees;