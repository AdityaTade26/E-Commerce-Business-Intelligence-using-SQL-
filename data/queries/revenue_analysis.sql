#question 1- Average Order Value (AOV)
WITH order_value AS (
    SELECT
        o.order_id,
        SUM(oi.quantity * oi.item_price) AS order_revenue
    FROM orders o
    JOIN order_item oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.order_id
)
SELECT ROUND(AVG(order_revenue), 2) AS avg_order_value
FROM order_value;

#question 2 - Revenue by product category
SELECT
    p.category,
    SUM(oi.quantity * oi.item_price) AS category_revenue
FROM order_item oi
JOIN product p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY category_revenue DESC;

#question 3 Category-wise revenue contribution (%)
WITH category_revenue AS (
    SELECT
        p.category,
        SUM(oi.quantity * oi.item_price) AS revenue
    FROM order_item oi
    JOIN product p ON oi.product_id = p.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY p.category
)
SELECT
    category,
    revenue,
    ROUND(100.0 * revenue / SUM(revenue) OVER (), 2) AS revenue_percentage
FROM category_revenue;

# question 4 - Monthly revenue trend
SELECT
    date_format('month', o.order_date) AS month,
    SUM(oi.quantity * oi.item_price) AS monthly_revenue
FROM orders o
JOIN order_item oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY month
ORDER BY month;

# Question 5 - Month-over-Month revenue growth
WITH monthly_revenue AS (
    SELECT
        DATE_format('month', o.order_date) AS month,
        SUM(oi.quantity * oi.item_price) AS revenue
    FROM orders o
    JOIN order_item oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY month
)
SELECT
    month,
    revenue,
    revenue - LAG(revenue) OVER (ORDER BY month) AS mom_growth
FROM monthly_revenue;

