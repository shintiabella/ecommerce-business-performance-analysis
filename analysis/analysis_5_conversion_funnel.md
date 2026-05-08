# Conversion Funnel Analysis

## Business Question
How efficient is the order conversion process, and what percentage of orders are successfully completed in 2024?

---

## Approach
We analyze the conversion funnel by comparing total orders with successfully completed transactions using the `is_net` flag.

The conversion rate is calculated as the proportion of completed (net) orders to total orders. This approach ensures that cancelled or returned transactions are excluded, providing a more accurate measure of true business performance.

Additionally, the analysis is extended to a monthly level to identify trends, fluctuations, and potential inefficiencies in the conversion process over time.

---

## SQL Query

```sql
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
```

---

## Funnel Insight

The conversion funnel analysis shows that the business maintained strong operational performance throughout 2024, achieving 4,024 successful transactions out of 4,639 total orders, with an overall conversion rate of 86.74%. This indicates that most customers successfully completed their transactions, reflecting an efficient order completion process.

Monthly conversion rates remained relatively stable, consistently ranging between 84% and 91% throughout the year. February recorded the highest conversion rate at 90.78%, suggesting highly efficient transaction completion despite lower order volume.

Interestingly, December generated both the highest order volume and highest revenue, but also recorded the lowest conversion rate at 84.34%. This suggests that while customer demand increased significantly during the year-end peak season, the number of cancelled or incomplete transactions also rose. A similar decline in conversion rate was observed in August.

Overall, the findings indicate that the business operates efficiently under normal conditions, but conversion performance tends to weaken during high-demand periods. Improving operational readiness, payment success rates, and order fulfillment efficiency during peak seasons could help maximize revenue realization and overall business performance.
