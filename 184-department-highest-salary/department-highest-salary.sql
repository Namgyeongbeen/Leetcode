# Write your MySQL query statement below

# 1. 부서별 max salary 출력하는 쿼리문을 서브쿼리로 만듦.
# 2. employee 테이블에서 부서별 max salary의 쌍과 일치하는 데이터만 추출. 
with max_salary as (
  select departmentId
       , max(salary) as salary
    from Employee
    group by departmentId
)

select d.name as Department
     , e.name as Employee
     , e.salary as Salary
  from Employee e
  left join Department d
    on e.departmentId = d.id
  where (e.departmentId, e.salary) in (select * from max_salary)