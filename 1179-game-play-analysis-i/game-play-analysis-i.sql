# Write your MySQL query statement below
SELECT player_id
     , min(date(event_date)) first_login
 FROM ACTIVITY
 GROUP BY player_id;