
-- Cohort Analysis: Customer Retention SQL (for Excel Visualization)
-- This query assigns each customer to a cohort based on their first purchase month,
-- then tracks how many of them made repeat purchases in subsequent months.

WITH customer_first_order AS (
    SELECT customer_id,
           MIN(DATE(order_date)) AS first_order_date
    FROM customer_orders
    GROUP BY customer_id
),
orders_with_cohort AS (
    SELECT co.customer_id,
           co.order_date,
           cfo.first_order_date,
           strftime('%Y-%m', cfo.first_order_date) AS cohort_month,
           strftime('%Y-%m', co.order_date) AS order_month
    FROM customer_orders co
    JOIN customer_first_order cfo ON co.customer_id = cfo.customer_id
),
cohort_analysis AS (
    SELECT cohort_month,
           order_month,
           COUNT(DISTINCT customer_id) AS num_customers
    FROM orders_with_cohort
    GROUP BY cohort_month, order_month
    ORDER BY cohort_month, order_month
)
SELECT * FROM cohort_analysis;
