CREATE VIEW sales.productSalesSummary AS
SELECT
    p.product_id,
    p.product_name,
    p.brand_id,
    p.category_id,
    p.model_year,
    p.list_price,
    SUM(oi.quantity) AS "Total Sales",
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS "Total Revenue"
FROM
    production.products p
JOIN
    sales.order_items oi ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.brand_id,
    p.category_id,
    p.model_year,
    p.list_price
GO
SELECT * FROM sales.productSalesSummary;
