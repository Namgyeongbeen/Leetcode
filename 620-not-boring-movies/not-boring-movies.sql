# Write your MySQL query statement below
WITH odd_id AS(
SELECT CASE WHEN id%2 != 0 THEN id END AS id
     , movie
     , description
     , rating
  FROM Cinema
)

select *
  FROM odd_id
  WHERE id IS NOT NULL
    AND description != 'boring'
  ORDER BY rating DESC;