SELECT 
    TO_CHAR(DATE_TRUNC('month', order_date), 'FMMonth') AS month,
    SUM(after_discount) AS revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM order_detail
WHERE EXTRACT(YEAR FROM order_date) = 2024
  AND is_valid = 1
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);
