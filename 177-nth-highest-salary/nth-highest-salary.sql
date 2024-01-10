CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
       with salaries as(
              select id
                   , salary
                   , dense_rank() over(order by salary desc) as salary_rank
                from Employee)
        select distinct(salary) as getNthHighestSalary
          from salaries
          where salary_rank = N
  );
END

# -CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
# -BEGIN
# -  RETURN (
# -      # Write your MySQL query statement below.
# -
# -  );
# -END
