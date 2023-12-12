# Write your MySQL query statement below
# actor, director_id로 group by 해서 행 수가 3 이상인 것 출력하면 될 듯.

select actor_id
     , director_id
  from ActorDirector
  group by actor_id, director_id
  having count(*) >= 3;