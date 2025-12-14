Question 1 — Customers with Highest Return Value
-- Business Question:
-- Which customers have the highest total return (refund) value?

-- Why this matters:
-- Helps identify customers with high return behavior
-- Useful for risk analysis, policy review, and operational cost control

-- Logic:
-- Aggregate refund amounts at the customer level
-- Join returns with orders to map refunds to customers
-- Rank customers by total refund value

SELECT
    c.customer_name,
    SUM(r.refund_amount) AS total_refund
FROM returns r
JOIN orders o
    ON r.order_id = o.order_id
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_refund DESC;

Question 2 — Payment Method with Highest Failure Rate
-- Business Question:
-- Which payment method has the highest failure rate?

-- Why this matters:
-- Helps identify unreliable payment methods
-- Supports decisions on payment optimization and user experience improvements

-- Logic:
-- Count total payment attempts per payment method
-- Calculate percentage of failed transactions
-- Compare failure rates across payment methods

SELECT
    payment_method,
    ROUND(
        100.0 * COUNT(CASE WHEN payment_status = 'Failed' THEN 1 END) / COUNT(*),
        2
    ) AS failure_rate
FROM payments
GROUP BY payment_method
ORDER BY failure_rate DESC;
