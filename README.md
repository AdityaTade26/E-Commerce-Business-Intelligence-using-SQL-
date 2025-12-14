# E-Commerce-Business-Intelligence-using-SQL-

---

E-Commerce Business Intelligence using SQL

## Project Overview

This project demonstrates an end-to-end **Business Intelligence analysis** on a realistic e-commerce dataset using **SQL**. The goal is to transform raw transactional data into **accurate, decision-ready insights** related to customer behavior, revenue performance, product effectiveness, payment reliability, and returns.

The project emphasizes **correct data-grain handling, safe multi-table joins, and real-world business logic**, making it representative of how SQL is used in real analytics roles.

---
## Project Objective

To analyze a real-world e-commerce dataset using SQL and deliver reliable business insights by applying correct data-grain logic, validated joins, and real operational scenarios such as cancelled orders, failed payments, and product returns.

---

Dataset Description

The dataset is modeled to resemble production-level e-commerce systems and includes the following tables:

* Customers – Customer profile and segmentation information
* Orders – Order-level transaction events
* Order Items – Line-item product details (source of revenue)
* Products– Product catalog and category information
* Payments – Payment attempts and methods, including failures
* Returns – Returned items and refund values

The dataset intentionally includes **edge cases** such as customers with no orders, unsold products, cancelled/returned orders, and failed payments to reflect real-world data complexity.

---

##  Analytical Approach

The analysis follows a **business-first and accuracy-focused approach**:

* Identified and validated the **grain of each table** before querying
* Calculated revenue strictly from **order_items** to avoid duplication
* Used **LEFT JOINs** where required to preserve inactive entities
* Applied business rules to exclude cancelled orders and adjust for returns
* Ensured all KPIs are **explainable, reliable, and decision-ready**

---

##  Business Questions Answered

* How many customers have never placed an order?
* What percentage of customers are repeat buyers?
* Who are the top revenue-generating customers?
* Which product categories contribute most to revenue?
* Which products have never been sold?
* What is the impact of returns on net revenue?
* Which payment methods have the highest failure rates?
* How does revenue trend over time (MoM analysis)?

---

##  SQL Concepts & Techniques Used

* INNER JOIN & LEFT JOIN
* GROUP BY & HAVING
* Subqueries & Common Table Expressions (CTEs)
* Window Functions (RANK, LAG, running totals)
* NULL handling and edge-case management

---

 Project Structure

```
ecommerce-sql-business-intelligence/
│
├── data/
│   └── schema.sql
│
├── queries/
│   ├── customer_analysis.sql
│   ├── revenue_analysis.sql
│   ├── product_analysis.sql
│   ├── payment_returns_analysis.sql
│
└── README.md
```

---
 Key Learnings

* Revenue calculations must respect **data grain** to avoid inflated KPIs
* Incorrect joins can silently distort business metrics
* Real-world data requires handling incomplete and imperfect records
* SQL is most effective when aligned with business decision-making

---
## Conclusion
This project showcases the practical application of SQL for **business intelligence and data analytics**, focusing on correctness, reliability, and real-world relevance rather than just query writing.

---
## Feedback
Open to feedback, suggestions, and discussions.
Always looking to improve analytical thinking and real-world data skills.


Just tell me 👍
