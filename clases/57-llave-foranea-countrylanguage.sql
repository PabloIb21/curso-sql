ALTER TABLE
    countrylanguage
ADD
    CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country(code);

select
    *
from
    country
where
    code = 'AFG';

delete from
    country
where
    code = 'AFG';
