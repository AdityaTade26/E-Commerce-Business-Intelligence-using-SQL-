#question 1- Products never sold
SELECT p.product_name
FROM product p
LEFT JOIN order_item oi
  ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

#question 2 - Products priced above category average
SELECT product_name, category, price
FROM product p
WHERE price >
    (SELECT AVG(price)
     FROM product
     WHERE category = p.category);

#question 3 - Revenue by product category
SELECT
    p.category,
    SUM(oi.quantity * oi.item_price) AS category_revenue
FROM order_item oi
JOIN product p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY category_revenue DESC;
