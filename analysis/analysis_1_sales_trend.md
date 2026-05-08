# Sales Trend Analysis

## Business Question
How does revenue perform each month in 2024?

---

## Approach
We analyze monthly revenue performance by aggregating total `after_discount` transactions and total completed orders in 2024. The analysis is grouped by month to identify sales trends, seasonality patterns, and fluctuations in business performance throughout the year.

---

## SQL Query

```sql
SELECT 
    TO_CHAR(DATE_TRUNC('month', order_date), 'FMMonth') AS month,
    SUM(after_discount) AS revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM order_detail
WHERE EXTRACT(YEAR FROM order_date) = 2024
  AND is_valid = 1
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);
```

---

## Sales Trend Insight

Revenue performance throughout 2024 shows a fluctuating trend with significant peaks in May and December. December generated the highest revenue and order volume, indicating a strong seasonal effect likely driven by year-end campaigns, promotions, and increased consumer spending.

In contrast, revenue declined noticeably during July and August, suggesting a temporary slowdown in purchasing activity during the mid-year period.

Overall, revenue trends generally align with total order volume, indicating that transaction activity plays a major role in business performance. However, as observed in later product and category analyses, revenue is also strongly influenced by product value, not solely by sales volume.

These findings suggest that the business relies heavily on peak-season performance, particularly during the end of the year. From a strategic perspective, the company could improve revenue stability by strengthening promotional activity during slower periods while continuing to maximize high-demand seasonal opportunities.
