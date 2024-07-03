with recursive multiplication_table(base, val, result) as (
    -- init
    select
        5 as base,
        1 as val,
        5 as result -- recursiva
    union
    select
        5 as base,
        val + 1,
        (val + 1) * base
    from
        multiplication_table
    where
        val < 20
)
select
    *
from
    multiplication_table;

select
    5 as base,
    2 as val,
    5 * 2 as result;