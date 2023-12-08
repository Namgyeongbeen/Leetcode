# Write your MySQL query statement below
# WITH base_table AS (
#   SELECT order_number
#       , customer_number
#       , COUNT(customer_number) n_of_order
#     FROM Orders
#     GROUP BY customer_number
#     ORDER BY n_of_order DESC
# )
# SELECT customer_number
#   FROM base_table
#   LIMIT 1;

SELECT customer_number
  FROM Orders
  GROUP BY customer_number
  ORDER BY COUNT(customer_number) DESC
  LIMIT 1;