# Write your MySQL query statement below

# Output을 보면 Rank가 아닌 Dense rank를 써야 함을 알 수 있음.
# 물론 다른 방법도 많을 것...

with salary_rank as (
  select d.name as Department
       , e.name as Employee
       , e.salary as Salary
       , dense_rank() over(partition by d.id order by e.salary desc) as ranking
    from Employee e
    left join Department d
      on e.departmentId = d.id
)
select Department
     , Employee
    , Salary
  from salary_rank
  where ranking <= 3