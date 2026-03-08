WITH district_totals_and_shares(
    district_id_and_name,
    municipality_code_and_name,
    mandates,
    district_total_mandates,
    mandates_share
    ) AS (
        SELECT (teste.public.district.id, teste.public.district.name),
               (m.code, m.name),
               m.mandates,
               SUM(m.mandates) OVER (PARTITION BY teste.public.district.id),
               m.mandates / SUM(m.mandates) OVER (PARTITION BY teste.public.district.id)
        FROM teste.public.district LEFT JOIN public.municipality m ON district.id = m.district
)
SELECT * FROM district_totals_and_shares;