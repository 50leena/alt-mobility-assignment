-- Total revenue from delivered orders
SELECT SUM(order_amount) AS total_revenue
FROM customer_orders
WHERE order_status = 'delivered';

-- Monthly revenue trend for delivered orders
SELECT 
    strftime('%Y-%m', order_date) AS order_month,
    SUM(order_amount) AS monthly_revenue
FROM customer_orders
WHERE order_status = 'delivered' 
GROUP BY order_month
ORDER BY order_month;