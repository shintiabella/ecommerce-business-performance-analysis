SELECT
    pd.product AS product_name,
    SUM(od.quantity) AS total_quantity,
    SUM(od.after_discount) AS revenue,
    SUM(od.quantity * pd.cogs) AS total_cost,
    SUM(od.after_discount) - SUM(od.quantity * pd.cogs) AS profit,
    ROUND(
        (SUM(od.after_discount) - SUM(od.quantity * pd.cogs)) * 1.0
        / SUM(od.after_discount),
        4
    ) AS profit_margin
FROM order_detail od 
JOIN product_detail pd
    ON od.sku_id = pd.sku_id
WHERE 
    EXTRACT(YEAR FROM od.order_date) = 2024
    AND od.is_valid = 1
GROUP BY pd.product
ORDER BY profit DESC
LIMIT 10;
