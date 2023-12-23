# Write your MySQL query statement below
# 각 유저별 unique id를 출력하고, unique id가 없는 유저에게는 null을 출력.
select e2.unique_id
     , e1.name
  from Employees e1
  left join EmployeeUNI e2
    on e1.id = e2.id