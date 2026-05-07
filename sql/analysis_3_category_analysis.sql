SELECT
    pd.category,
    SUM(od.quantity) AS total_quantity,
    SUM(od.after_discount) AS revenue
FROM order_detail od
JOIN product_detail pd
    ON od.sku_id = pd.sku_id
WHERE od.is_valid = 1
  AND EXTRACT(YEAR FROM od.order_date) = 2024
GROUP BY pd.category
ORDER BY revenue DESC;
