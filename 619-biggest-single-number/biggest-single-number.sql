# Write your MySQL query statement below
WITH base_table AS (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
)

SELECT MAX(num) AS NUM 
  FROM base_table;