#question 1 - Customers with highest return value
SELECT
    c.customer_name,
    SUM(r.refund_amount) AS total_refund
FROM return_ r
JOIN orders o ON r.order_id = o.order_id
JOIN customer c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_refund DESC;

#question 2 - Payment method with highest failure rate
SELECT
    payment_method,
    ROUND(
        100.0 * COUNT(CASE WHEN payment_status = 'Failed' THEN 1 END) / COUNT(*),
        2
    ) AS failure_rate
FROM payments
GROUP BY payment_method
ORDER BY failure_rate DESC;

