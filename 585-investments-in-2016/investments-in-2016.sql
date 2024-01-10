# Write your MySQL query statement below
with tiv as (
select tiv_2015
  from Insurance
  group by tiv_2015
  having count(*)> 1
), loc as (
  select lat
       , lon
    from Insurance
    group by lat, lon
    having count(*) = 1
)

select round(sum(tiv_2016), 2) as tiv_2016
  from Insurance i
  left join tiv t
    on i.tiv_2015 = t.tiv_2015
  left join loc l
    on i.lat = l.lat
    and i.lon = l.lon
  where t.tiv_2015 is not null
    and l.lat is not null;