-- Overall Conversion Funnel
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT CASE 
        WHEN is_net = 1 THEN order_id 
    END) AS successful_orders,
    ROUND(
        COUNT(DISTINCT CASE 
            WHEN is_net = 1 THEN order_id 
        END) * 1.0 
        / COUNT(DISTINCT order_id),
        4
    ) AS conversion_rate
FROM order_detail
WHERE EXTRACT(YEAR FROM order_date) = 2024;

-- Monthly Conversion Funnel
SELECT
    TO_CHAR(DATE_TRUNC('month', order_date), 'FMMonth') AS month,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT CASE 
        WHEN is_net = 1 THEN order_id 
    END) AS successful_orders,
    ROUND(
        COUNT(DISTINCT CASE 
            WHEN is_net = 1 THEN order_id 
        END) * 1.0 
        / COUNT(DISTINCT order_id),
        4
    ) AS conversion_rate
FROM order_detail
WHERE EXTRACT(YEAR FROM order_date) = 2024
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);
