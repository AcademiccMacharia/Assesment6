--View that returns the total quantity and sales amount for each product.

CREATE VIEW sales.product_sales AS
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS "Total Quantity", SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS "Sales Amount"
FROM production.products p
JOIN sales.order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;
GO
SELECT * FROM sales.product_sales;
GO
