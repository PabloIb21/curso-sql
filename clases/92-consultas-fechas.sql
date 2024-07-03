select
    *
from
    employees
where
    hire_date > '1998-02-05'
order by
    hire_date desc;

select
    max(hire_date) as mas_nuevo,
    min(hire_date) as primer_empleado
from
    employees;

select
    *
from
    employees
where
    hire_date between '1999-01-01'
    and '2001-01-01'
order by
    hire_date desc;