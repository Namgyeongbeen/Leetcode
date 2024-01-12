# Write your MySQL query statement below

# p_id에 없는 id는 일단 leaf
# p_id가 null인 id는 root
# 그 외의 id는 inner
# if 구문 활용.

select distinct t1.id
     , if(t1.p_id is null, 'Root', if(t2.id is null, 'Leaf', 'Inner')) as type
  from Tree t1
  left join Tree t2
    on t1.id = t2.p_id;