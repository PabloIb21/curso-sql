SELECT
    code, name
FROM
    continent
where
    name like '%America%'
UNION
SELECT
    code, name
FROM
    continent
where
    code in (3, 5)
ORDER BY
    name ASC;