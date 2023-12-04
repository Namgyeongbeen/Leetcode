# Write your MySQL query statement below

select P.firstName, P.lastName, A.city, A.state
  from Person p
  left join Address A
  on P.personID = A.personID;