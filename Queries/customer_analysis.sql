
Question 1 — Customers Who Have Never Placed an Order
-- Business Question:
-- How many customers have never placed an order?

-- Why this matters:
-- Helps identify inactive users and measure customer conversion gap
-- Useful for retention and marketing strategies

-- Logic:
-- LEFT JOIN ensures all customers are included
-- Customers with NULL order_id have never placed an order

SELECT
    COUNT(*) AS customers_with_no_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

Question 2 — Percentage of Repeat Customers (> 1 Order)
-- Business Question:
-- What percentage of customers are repeat buyers (placed more than one order)?

-- Why this matters:
-- Indicates customer retention and long-term revenue potential

-- Logic:
-- Count number of orders per customer
-- Identify customers with more than one order
-- Calculate percentage of repeat customers

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT
    ROUND(
        100.0 * COUNT(CASE WHEN order_count > 1 THEN 1 END) / COUNT(*),
        2
    ) AS repeat_customer_percentage
FROM customer_orders;

 Question 3 — Top 5 Customers by Total Revenue
-- Business Question:
-- Who are the top 5 customers by total revenue?

-- Why this matters:
-- Helps identify high-value customers for loyalty and targeted campaigns

-- Logic:
-- Revenue is calculated at the order-item level
-- Join customers, orders, and order_items
-- Consider only delivered orders to avoid inflated revenue

SELECT
    c.customer_name,
    SUM(oi.quantity * oi.item_price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_name
ORDER BY total_revenue DESC
LIMIT 5;

Question 4 — Customers Spending Above Average Customer Spend
-- Business Question:
-- Which customers have spent more than the average customer spend?

-- Why this matters:
-- Identifies high-value customers contributing above-average revenue

-- Logic:
-- First calculate total spend per customer
-- Compute average spend across all customers
-- Filter customers whose spend exceeds the average

WITH customer_spend AS (
    SELECT
        o.customer_id,
        SUM(oi.quantity * oi.item_price) AS total_spend
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.customer_id
)
SELECT
    c.customer_name,
    cs.total_spend
FROM customer_spend cs
JOIN customers c
    ON cs.customer_id = c.customer_id
WHERE cs.total_spend >
      (SELECT AVG(total_spend) FROM customer_spend);

