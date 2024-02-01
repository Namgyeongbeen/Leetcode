# Write your MySQL query statement below

# 이 쿼리는 카테고리별 계좌 수가 0인 경우는 포함하지 않으므로 부족한 풀이다.
-- with base_table as(
--   select account_id
--        , case when income < 20000 then 'Low Salary'
--               when income between 20000 and 50000 then 'Average Salary'
--               when income > 50000 then 'High Salary'
--               end as category
--     from Accounts
-- )

-- select category
--      , count(category) as accounts_count
--   from base_table
--   group by category;


# 아래처럼 작성해야 카테고리 별 계좌 수가 0인 경우도 포함할 수 있다.
select 'Low Salary' as category
     , sum(if(income < 20000, 1, 0)) as accounts_count
  from Accounts
union all
select 'Average Salary' as category
     , sum(if(income between 20000 and 50000, 1, 0)) as accounts_count
  from Accounts
union all
select 'High Salary' as category
     , sum(if(income > 50000, 1, 0)) as accounts_count
  from Accounts;