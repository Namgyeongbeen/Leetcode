# Write your MySQL query statement below

# 틀린 쿼리
# select customer_id
#   from customer
#   group by customer_id
#   having count(customer_id) = (select count(distinct product_key) from product);

# 위와 같이 쿼리를 짜면, 한 고객이 같은 제품을 여러 개 사는 경우도 여러 제품을 사는 것으로 카운팅하기 때문.


# 정답 쿼리
select customer_id
  from customer
  group by customer_id
  having count(distinct customer_id, product_key) = (select count(distinct product_key) from product);
