-- cancellation rate = n of canceled requests / total n of requests
-- date : 13-10-01 ~ 13-10-03
-- round cancelation rate to 2 decimal points

select t.request_at as Day
     , round(sum(case when t.status LIKE '%cancel%' then 1 else 0 end)/count(t.request_at), 2) as "Cancellation Rate"
  from Trips t
  inner join users c
    on t.client_id = c.users_id
  inner join users d
    on t.driver_id = d.users_id
  where t.request_at between '2013-10-01' and '2013-10-03'
    and c.banned = 'No'
    and d.banned = 'No'
  group by t.request_at;