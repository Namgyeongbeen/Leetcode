# Write your MySQL query statement below
select activity_date as day
     , count(distinct user_id) as active_users
  from Activity
  group by day
  having activity_date between date_add('2019-07-27', interval -29 day) and '2019-07-27';