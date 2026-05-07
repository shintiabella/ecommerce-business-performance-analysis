SELECT
    pd.product AS product_name,
    SUM(od.quantity) AS total_quantity,
    SUM(od.after_discount) AS revenue,
    SUM(od.after_discount) / SUM(od.quantity) AS avg_price
FROM order_detail od
JOIN product_detail pd
    ON od.sku_id = pd.sku_id
WHERE od.is_valid = 1
  AND EXTRACT(YEAR FROM od.order_date) = 2024
GROUP BY pd.product
ORDER BY revenue DESC
LIMIT 10;
