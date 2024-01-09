# Write your MySQL query statement below
select employee_id
     , case when (mod(employee_id, 2) != 0) and (name not like 'M%') then salary else 0 end as bonus
  from Employees
  order by employee_id;
