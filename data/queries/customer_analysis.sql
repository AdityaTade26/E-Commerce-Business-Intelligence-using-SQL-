#question 1- How many customers have never placed an order?
Select Count(*) As Customers_With_no_orders
from customer c
left join orders o 
	ON c.customer_id=o.customer_id
Where o.order_id is Null;

#question 2-Percentage of repeat customers (>1 order)
WITH customer_orders AS (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT
    ROUND(
        100.0 * COUNT(CASE WHEN order_count > 1 THEN 1 END) / COUNT(*),
        2
    ) AS repeat_customer_percentage
FROM customer_orders;

#question️ 3- Top 5 customers by total revenue
SELECT
    c.customer_name,
    SUM(oi.quantity * oi.item_price) AS total_revenue
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_item oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_name
ORDER BY total_revenue DESC
LIMIT 5;

#Question 4 - Customers spending above average customer spend
WITH customer_spend AS (
    SELECT
        o.customer_id,
        SUM(oi.quantity * oi.item_price) AS total_spend
    FROM orders o
    JOIN order_item oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.customer_id
)
SELECT c.customer_name, cs.total_spend
FROM customer_spend cs
JOIN customer c ON cs.customer_id = c.customer_id
WHERE cs.total_spend >
      (SELECT AVG(total_spend) FROM customer_spend);
      
