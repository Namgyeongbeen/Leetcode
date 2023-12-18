# Write your MySQL query statement below
# 한번 두번 세번 LEAD. 했을 때 그 값이 첫번째 값과 같다면 3번 연속으로 나타난 것이 됨.
# 그런 숫자들만 모으면 될 듯.

# with consecutive_num as (
#   select id
#       , num 
#       , lead(num, 1) over(order by id) 1_next_num
#       , lead(num, 2) over(order by id) 2_next_num
#     from logs
# )
# select distinct num AS ConsecutiveNums
#   from consecutive_num
#   where num = 1_next_num
#     and 1_next_num = 2_next_num;

# window 함수 없이 풀기
select distinct l1.num as ConsecutiveNums
  from Logs l1
  join Logs l2
    on l1.id = l2.id+1
  join Logs l3
    on l2.id = l3.id+1
  where l1.num = l2.num
    and l2.num = l3.num