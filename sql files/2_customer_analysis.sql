-- Customer segmentation based on total order amount
.output customer_segments.csv
SELECT customer_id,
       CASE
         WHEN SUM(order_amount) >= 500 THEN 'High Value'
         WHEN SUM(order_amount) BETWEEN 100 AND 499 THEN 'Medium Value'
         ELSE 'Low Value'
       END AS customer_segment
FROM customer_orders
GROUP BY customer_id;

-- Cohort analysis: number of customers ordering again by cohort
.output customer_cohort.csv
SELECT 
    MIN(strftime('%Y-%m', order_date)) AS cohort_month,
    strftime('%Y-%m', order_date) AS order_month,
    COUNT(DISTINCT customer_id) AS num_customers
FROM customer_orders
GROUP BY cohort_month, order_month;