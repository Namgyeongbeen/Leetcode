# Write your MySQL query statement below
# join 쓰는 문제

SELECT c.name Customers
    FROM Customers c
    LEFT JOIN Orders o
        on c.id = o.customerid
    where o.customerid is null;