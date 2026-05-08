# Product Performance Analysis

## Business Question
Which products generate the highest revenue and sales volume in 2024?

---

## Approach
We analyze product performance by aggregating total quantity sold and total revenue, then rank products to identify the top contributors.

---

## SQL Query

```sql
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
```

---

## Top Product Insight

The analysis reveals a clear distinction between high-volume and high-value products.

Items such as "Cushion" and "Foundation" dominate in terms of sales volume, with over 900–1000 units sold. However, despite their strong demand, their revenue contribution remains relatively low due to significantly lower average unit prices. This indicates that high sales volume alone does not guarantee strong revenue performance.

In contrast, products like "Tablet", "Smartphone", and "TV" generate the highest revenue while having relatively low sales volume. This suggests a premium pricing structure, where fewer units sold can still result in substantial revenue contribution.

These findings are consistent with the category-level analysis, where high-value categories such as Electronics drive revenue despite lower transaction volume, while high-volume categories contribute less in terms of total revenue.

It is also important to note that high revenue does not necessarily imply high profitability, as cost structures and margins may vary across products.

From a strategic perspective, the business could improve overall performance by increasing the sales of high-value products through targeted promotions or upselling strategies. At the same time, optimizing pricing, bundling, or cross-selling for high-volume products could help improve revenue per transaction without relying solely on increasing sales volume.
