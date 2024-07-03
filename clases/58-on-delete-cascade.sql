select
    *
from
    country
where
    code = 'AFG';

select
    *
from
    city
where
    countrycode = 'AFG';

select
    *
from
    countrylanguage
where
    countrycode = 'AFG';

delete from
    country
where
    code = 'AFG';