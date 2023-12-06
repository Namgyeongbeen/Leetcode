-- cancellation rate = n of canceled requests / total n of requests
-- date : 13-10-01 ~ 13-10-03
-- round cancelation rate to 2 decimal points

# 내 코드. 틀림.
# SELECT t.request_at DAY
#      , ROUND((SELECT COUNT(CASE WHEN t.status LIKE '%cancel%' THEN t.status END)
#                 FROM Trips GROUP BY t.request_at)/COUNT(status), 1) "Cancellation Rate"
#   FROM Trips t
#   INNER JOIN Users u
#     ON  t.client_id = u.users_id
#     AND u.banned = 'No'
#   WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
#   GROUP BY t.request_at;

# 솔루션 코드 중 하나. 내것과 가장 유사하다.
SELECT request_at as Day, 
       ROUND(COUNT(CASE 
             WHEN status != 'completed' 
             THEN 1 
             ELSE NULL 
             END) / COUNT(*),2) AS "Cancellation Rate"
FROM Trips
INNER JOIN Users client ON client.users_id = Trips.client_id
INNER JOIN Users driver ON driver.users_id = Trips.driver_id
WHERE client.banned = 'No' AND driver.banned = 'No' AND request_at >= "2013-10-01" AND request_at <= "2013-10-03"
GROUP BY request_at