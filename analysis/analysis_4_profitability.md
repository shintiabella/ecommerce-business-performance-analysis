# Profitability Analysis

## Business Question
Which products generate the highest profit, and how does it compare to their revenue performance in 2024?

---

## Approach
We calculate total revenue and total cost (COGS) for each product, then derive profit by subtracting cost from revenue. This helps identify which products are truly profitable, not just high in sales.

---

## SQL Query

```sql
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
```

---

## Profitability Insight

The analysis shows that high-revenue products such as "Tablet" and "Smartphone" also rank among the most profitable products, indicating that these premium items are strong contributors to both revenue and profit.

However, profitability is not determined by revenue alone. For example, "Cushion" generates lower revenue than products such as "Printer" and "TV", yet delivers higher profit due to a stronger profit margin. This suggests that products with more efficient cost structures can outperform higher-revenue products in terms of profitability.

Additionally, products like "Golf Club" and "Sunscreen" stand out with the highest profit margins (36.3% and 32.3% respectively), despite not being top contributors in total revenue. These products represent high-efficiency items that generate strong profit relative to their sales value.

In contrast, products such as "Console" and "TV" show relatively lower profit margins, indicating that although they contribute substantial revenue, their profitability is less efficient due to higher costs.

Overall, the findings confirm that revenue alone is not sufficient to evaluate business performance. Profitability is strongly influenced by pricing strategy and cost efficiency.

From a strategic perspective, the company could improve overall profitability by expanding high-margin products while optimizing pricing or cost structures for lower-margin products.
