WITH list_districts(id, name, municipalities_count, municipalities_with_more_that_10_mandates) AS (
    SELECT teste.public.district.id AS id,
           teste.public.district.name AS name,
           COUNT(m) AS municipalities_count,
           COUNT(m) FILTER (WHERE m.mandates > 10) AS municipalities_with_more_that_10_mandates
    FROM district LEFT JOIN
               public.municipality m ON district.id = m.district
    GROUP BY teste.public.district.id
)
SELECT *  FROM list_districts ORDER BY id;