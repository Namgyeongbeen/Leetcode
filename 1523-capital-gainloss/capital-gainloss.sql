# Write your MySQL query statement below
# buy는 마이너스, sell은 플러스

with base_table as (
  select stock_name
       , case when operation = 'Buy' then -price
              when operation = 'Sell' then price
              end as price
    from Stocks
)

select stock_name
     , sum(price) as capital_gain_loss
  from base_table
  group by stock_name;