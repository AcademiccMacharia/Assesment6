--Query to find the top 5 customers who have placed the most orders


SELECT TOP 5
    c.customer_id,
    c.first_name + ' ' + c.last_name AS customer_name,
    COUNT(*) AS total_orders
FROM
    sales.customers c
JOIN
    sales.orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    total_orders DESC;
GO
