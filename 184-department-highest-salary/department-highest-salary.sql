# Write your MySQL query statement below
SELECT d.name Department, e.name Employee, e.salary Salary
    FROM Employee e
    inner JOIN Department d ON e.departmentId = d.id
    WHERE (d.id, e.salary) IN
        (SELECT departmentId, MAX(salary)
        FROM Employee
        GROUP BY departmentId);