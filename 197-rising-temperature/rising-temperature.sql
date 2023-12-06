# Write your MySQL query statement below
SELECT w1.id
    FROM Weather w1
    JOIN Weather w2
        ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
    WHERE w1.temperature > w2.temperature;


# 기준일 온도 > 기준 - 1 일 온도

# w1                     w2
# id   date   temp       id   date  temp
# 1    1/1    10  ??     1    1/1   10
# 2    1/2    25  10     2    1/2   25
# 3    1/3    20  25     3    1/3   20
# 4    1/4    30  30     4    1/4   30