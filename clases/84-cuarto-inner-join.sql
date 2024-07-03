select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

select distinct
    d.name, c."name" as continent
from
    countrylanguage a
    inner join country b on a.countrycode = b.code
    inner join continent c on b.continent = c.code
    inner join "language" d on d.code = a.languagecode
where
    a.isofficial = true;