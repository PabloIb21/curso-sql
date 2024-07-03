select
    country_id,
    country_name,
    region_name
from
    countries
    inner join regions on countries.region_id = regions.region_id;
    
create or replace function country_region() 
	returns table (id character(2), name varchar(40), region varchar(25))
	as $$
begin
	return query 
	select country_id, country_name, region_name from countries
    inner join regions on countries.region_id = regions.region_id;
end;
$$ language plpgsql;

select * from country_region();