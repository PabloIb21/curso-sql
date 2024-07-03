(
    select
        count(*) as Total,
        b.name
    from
        country a
        inner join continent b on a.continent = b.code
    where
        b.name not like '%America%'
    group by
        b.name
    order by
        total asc
)
UNION
    (
        select
            count(*) as total,
            'America'
        from
            country a
            inner join continent b on a.continent = b.code
        where
            b."name" like '%America%'
    )
order by
    total asc;

(
	SELECT
		count(*) AS Total,
		b.name
	FROM
		country a
		INNER JOIN continent b ON a.continent = b.code
	WHERE
		b.code NOT in(4, 6, 8)
	GROUP BY
		b.name)
UNION (
	SELECT
		count(*) AS total,
		'America'
	FROM
		country a
		INNER JOIN continent b ON a.continent = b.code
	WHERE
		b.code in(4, 6, 8))
ORDER BY
	total ASC;