# Write your MySQL query statement below
select employee_id
     , CASE WHEN COUNT(*) > 1 THEN MAX(CASE WHEN primary_flag = 'Y' THEN department_id END)
            when count(department_id) = 1 then department_id 
            end as department_id
  from Employee
  group by employee_id
  having department_id is not null;