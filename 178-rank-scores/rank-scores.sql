# Write your MySQL query statement below

# window 함수(O)
# select score
#      , dense_rank() over(order by score desc) as 'rank'
#   from Scores;

# window 함수(X)
select s1.score
     , count(distinct s2.score) +1 as 'rank'
  from Scores s1
  left join Scores s2
    on s1.score < s2.score
  group by s1.id
  order by s1.score desc;
  