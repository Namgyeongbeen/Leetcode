# Write your MySQL query statement below
with base_table as (
  select *
    from Employees
    union
  select *
    from Salaries
    order by employee_id
)

select employee_id
  from base_table
  group by employee_id
  having count(*) = 1
  order by employee_id;