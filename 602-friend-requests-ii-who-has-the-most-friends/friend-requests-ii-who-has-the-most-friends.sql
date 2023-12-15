# Write your MySQL query statement below
# 핵심 아이디어 : requester_id와 accepter_id를 위아래로 쭉 이어붙이고 count해서 가장 높은 것 선택

with n_of_friends as (
  select accepter_id as id
    from RequestAccepted
  union all
  select requester_id as id
    from RequestAccepted
)

select id
     , count(id) as num
  from n_of_friends
  group by id
  order by num desc
  limit 1
;