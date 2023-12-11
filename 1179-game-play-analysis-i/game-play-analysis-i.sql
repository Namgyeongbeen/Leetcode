# Write your MySQL query statement below

# window함수 안 쓰고 풀기
# SELECT player_id
#      , min(date(event_date)) first_login
#  FROM ACTIVITY
#  GROUP BY player_id;

# window함수 쓰고 풀기
select player_id
     , case when 1st = 1 then event_date end first_login
  from (
  select player_id
      , row_number () over(partition by player_id order by event_date) AS 1st
      , event_date
    from activity
    order by player_id
  ) login_date
  where case when 1st = 1 then 1st end is not null;