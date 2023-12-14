# Write your MySQL query statement below
-- quality : The average of the ratio between query rating and its position.
-- poor query percentage : The percentage of all queries with rating less than 3.
-- Both quality and poor_query_percentage should be rounded to 2 decimal places.

select query_name
     , round(avg(rating/position), 2) as quality
     , round(sum(case when rating < 3 then 1 else 0 end)/count(*) * 100, 2) as poor_query_percentage
  from queries
  group by query_name
  having query_name is not null