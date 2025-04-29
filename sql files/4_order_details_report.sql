-- Detailed order + payment report
.output order_details_report.csv
SELECT o.order_id,
       o.customer_id,
       o.order_date,
       o.order_amount,
       o.order_status,
       p.payment_date,
       p.payment_amount,
       p.payment_method,
       p.payment_status
FROM customer_orders o
LEFT JOIN payments p ON o.order_id = p.order_id;