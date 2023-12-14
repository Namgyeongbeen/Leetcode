# Write your MySQL query statement below
# fraction : count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

# player별 first_login 날짜가 player별 event_date에서 하루를 뺀 날짜와 같아야 함.

select round(count(distinct player_id)/(select count(distinct player_id) from activity), 2) as fraction
  from activity
  where (player_id, date_add(event_date, interval -1 day))
    in (
      select player_id
          , min(event_date)
        from Activity
        group by player_id
  );