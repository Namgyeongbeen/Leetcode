# Write your MySQL query statement below

# having절에 쓰일 수 있는 컬럼은 group by 절에 쓰인 컬럼이거나 그렇지 않다면 집계함수가 적용된 컬럼이다.

select p.product_id
     , p.product_name
  from Sales s
  join Product p
    on p.product_id = s.product_id
  group by p.product_id
  having min(s.sale_date) >= '2019-01-01' and max(s.sale_date) <='2019-03-31';