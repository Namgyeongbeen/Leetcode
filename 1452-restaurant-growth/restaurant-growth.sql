# Write your MySQL query statement below

# 이동 평균을 계산하는 문제.
# 평균은 current day + 6 days before 로 계산하고, visited_on 기준 ascending 정렬, 결과는 소수점 아래 2자리까지만.

# 내 풀이. 15개 테스트 케이스 중 14개만 통과.
# with step1 as (
#   select visited_on
#        , sum(amount) as amount
#        , row_number() over(order by visited_on) as num
#     from Customer
#     group by visited_on
# ), step2 as(
#   select *
#        , sum(amount) over(order by visited_on rows between 6 preceding and 0 following) as sum
#        , round(avg(amount) over(order by visited_on rows between 6 preceding and 0 following), 2) as average_amount
#     from step1
# )

# select visited_on
#      , sum as amount
#      , average_amount
#   from step2
#   where num > 6

SELECT visited_on, amount, ROUND(amount/7, 2) average_amount
FROM (
    SELECT DISTINCT visited_on, 
    SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY   PRECEDING AND CURRENT ROW) amount, 
    MIN(visited_on) OVER() 1st_date 
    FROM Customer
) t
WHERE visited_on>= 1st_date+6;