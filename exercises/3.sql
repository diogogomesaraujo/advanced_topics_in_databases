WITH districts_rank(
    district_id,
    district_name,
    municipality_code,
    municipality_name,
    mandates,
    rank_in_district,
    dense_rank_in_district
    ) AS (
        SELECT district.id AS district_id,
               district.name AS district_name,
               m.code AS municipality_code,
               m.name AS municipality_name,
               m.mandates AS mandates,
               RANK() OVER (PARTITION BY m.district ORDER BY m.mandates DESC) AS rank_in_district,
               DENSE_RANK() OVER (PARTITION BY m.district ORDER BY m.mandates DESC) AS dense_rank_in_district
        FROM teste.public.district
            LEFT JOIN public.municipality m ON district.id = m.district
        ORDER BY district_id, mandates DESC, municipality_name
)
SELECT * FROM districts_rank;