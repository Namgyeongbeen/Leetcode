# Write your MySQL query statement below


# 내 풀이
# 처음엔 2월 28일까지라고 했다가 4년에 한번 있는 2월 29일을 빼먹어서 틀렸었음.
# select p.product_name
#      , sum(o.unit) as unit
#   from Orders o
#   left join Products p
#     on o.product_id = p.product_id
#   where order_date between '2020-02-01' and '2020-02-29'
#   group by p.product_name
#   having sum(o.unit) >= 100;

# 이렇게 각 월에 며칠까지 있는지가 헷갈리는데, 시간 조건에 특정 연과 월이 있다면?
# 아래처럼 아예 연과 월을 조건으로 정해주는것이 좋음.
select p.product_name
     , sum(o.unit) as unit
  from Orders o
  left join Products p
    on o.product_id = p.product_id
  where year(o.order_date) = '2020'
    and month(o.order_date) = '2'
  group by p.product_name
  having sum(o.unit) >= 100;