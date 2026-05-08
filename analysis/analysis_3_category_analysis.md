# Product Category Analysis

## Business Question
Which product categories contribute the most to overall revenue in 2024?

---

## Approach
We aggregate total revenue and quantity sold by product category, then rank categories to identify which ones contribute the most to overall business performance.

---

## SQL Query

```sql
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
```

---

## Product Category Insight

The analysis reveals a clear distinction between high-value and high-volume product categories.

"Electronics" generates the highest revenue (6.0B) despite having relatively low sales volume (389 units), followed by "Gaming Gear" with 2.6B in revenue and only 359 units sold. This suggests that these categories consist primarily of high-priced products, making them the main drivers of overall revenue.

In contrast, categories such as "Fashion & Footwear" and "Food & Beverage" record the highest sales volumes, yet contribute significantly lower revenue compared to Electronics. This indicates that these categories are dominated by lower-priced products, resulting in lower revenue per transaction despite strong customer demand.

Additionally, categories like "Books & Stationery" and "Health & Wellness" show relatively high sales volume but contribute the lowest revenue, suggesting limited monetization despite consistent transaction activity.

Overall, the findings confirm that revenue is influenced more by product value than by sales volume alone. The business appears to rely on a combination of high-volume, low-price categories and low-volume, high-value categories.

From a strategic perspective, the company could improve performance by increasing revenue per transaction in high-volume categories through pricing optimization, bundling, or upselling strategies, while continuing to expand high-value categories such as Electronics and Gaming Gear.
