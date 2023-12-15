# Write your MySQL query statement below

-- where절에 집계함수(sum, count, avg, max, min, ...)를 쓸 수는 없다.
-- having절에 써야 함.

select e2.name
  from employee e1
  join employee e2
    on e1.managerId = e2.id
  group by e2.id
  having count(e2.id) >= 5;