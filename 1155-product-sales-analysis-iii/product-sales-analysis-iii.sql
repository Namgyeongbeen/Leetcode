# Write your MySQL query statement below
with base_table as(
select product_id
     , min(year)
  from Sales
  group by product_id
)

select product_id
     , year as first_year
     , quantity
     , price
  from Sales
  where (product_id, year) in (
    select product_id
         , min(year)
      from Sales
      group by product_id
      );