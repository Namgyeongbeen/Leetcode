# Write your MySQL query statement below
select user_id
     , ifnull(round(confirmed/cnt, 2), 0) as confirmation_rate
  from (
    select s.user_id
         , count(c.time_stamp) as cnt
         , sum(case when c.action = 'confirmed' then 1 else 0 end) as confirmed
      from Signups s
      left join Confirmations c
        on s.user_id = c.user_id
      group by s.user_id
       ) as base_table;