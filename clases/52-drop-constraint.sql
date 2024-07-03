SELECT
	*
FROM
	country
WHERE
	code = 'HND';

ALTER TABLE country
	ADD CHECK (surfacearea >= 0);

SELECT DISTINCT
	continent
FROM
	country;

ALTER TABLE country
	ADD CHECK ((continent = 'Asia'::text)
			or(continent = 'South America'::text)
				or(continent = 'North America'::text)
					or(continent = 'Oceania'::text)
						or(continent = 'Antarctica'::text)
							or(continent = 'Africa'::text)
								or(continent = 'Europe'::text)
									or(continent = 'Central America'::text));

ALTER TABLE country DROP CONSTRAINT "country_continent_check7";