# Write your MySQL query statement below

# window 함수(O)
# select score
#      , dense_rank() over(order by score desc) as 'rank'
#   from Scores;

# window 함수(X)
SELECT S1.score
     , COUNT(DISTINCT S2.score) AS 'rank'
  FROM Scores S1
  LEFT JOIN Scores S2
    ON S2.score >= S1.score
  GROUP BY S1.id
  ORDER BY S1.score DESC;