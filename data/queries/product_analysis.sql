Question 1 — Products Never Sold
-- Business Question:
-- Which products have never been sold?

-- Why this matters:
-- Helps identify unsold or dead inventory
-- Useful for inventory optimization and pricing strategy

-- Logic:
-- LEFT JOIN keeps all products
-- Products with NULL product_id in order_items were never sold

SELECT
    p.product_name
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

Question 2 — Products Priced Above Category Average
-- Business Question:
-- Which products are priced above the average price of their category?

-- Why this matters:
-- Identifies premium-priced products within each category
-- Useful for pricing and competitive analysis

-- Logic:
-- Calculate average price per category using a correlated subquery
-- Select products whose price exceeds their category average

SELECT
    p.product_name,
    p.category,
    p.price
FROM products p
WHERE p.price >
    (
        SELECT AVG(price)
        FROM products
        WHERE category = p.category
    );

Question 3 — Revenue by Product Category
-- Business Question:
-- How much revenue does each product category generate?

-- Why this matters:
-- Helps identify high-performing and low-performing categories
-- Supports inventory planning and marketing focus

-- Logic:
-- Revenue is calculated at the order-item level
-- Join order_items with products and orders
-- Include only delivered orders to ensure valid revenue

SELECT
    p.category,
    SUM(oi.quantity * oi.item_price) AS category_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY category_revenue DESC;
