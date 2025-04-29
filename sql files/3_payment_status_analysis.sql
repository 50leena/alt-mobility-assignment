-- Payment status distribution
.output payment_status_analysis.csv
SELECT payment_status, COUNT(*) AS status_count
FROM payments
GROUP BY payment_status;

-- Payment method success rate
.output payment_success_rate.csv
SELECT payment_method,
       SUM(CASE WHEN payment_status = 'completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS success_rate
FROM payments
GROUP BY payment_method;