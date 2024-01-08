# Write your MySQL query statement below
SELECT employee_id,
       CASE WHEN COUNT(*) > 1 THEN MAX(CASE WHEN primary_flag = 'Y' THEN department_id END)
            ELSE MAX(department_id) 
       END AS department_id
  FROM Employee
  GROUP BY employee_id
  having department_id is not null;
