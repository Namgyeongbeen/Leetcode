# Write your MySQL query statement below
# customer 별 전체 first order 중 immediate order의 비율
# 모든 customer는 하나의 first order를 갖는다.
# immediate order는 order date와 pref delivery date가 같은 order
with base_table as (
select customer_id
     , min(order_date) as first_order
     , case when min(order_date) = min(customer_pref_delivery_date) then customer_pref_delivery_date 
       else null 
       end as immediate_order
from Delivery
group by customer_id
)

select round(100*count(immediate_order)/count(*), 2) as immediate_percentage
  from base_table;