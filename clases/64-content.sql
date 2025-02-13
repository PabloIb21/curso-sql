SELECT DISTINCT
    continent
FROM
    country
ORDER BY
	continent
ASC;

INSERT INTO
    continent (name)
SELECT
    DISTINCT continent
FROM
    country
ORDER BY
    continent ASC;

SELECT * FROM continent;