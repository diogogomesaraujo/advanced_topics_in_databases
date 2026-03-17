WITH RECURSIVE lst_nums(n) AS (
    SELECT 0
    UNION ALL
    SELECT n + 1
    FROM lst_nums
    WHERE n < 10
)
SELECT n FROM lst_nums;