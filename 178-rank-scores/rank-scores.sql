# Write your MySQL query statement below

# window 함수(O)
# select score
#      , dense_rank() over(order by score desc) as 'rank'
#   from Scores;

# window 함수(X)
SELECT S1.score
     , (SELECT COUNT(DISTINCT score)
          FROM Scores S2
          WHERE S2.score > S1.score) + 1 AS 'rank'
  FROM Scores S1
  ORDER BY S1.score DESC;
