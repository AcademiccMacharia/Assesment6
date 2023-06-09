--Query to retrieve the list of orders along with the customer name and staff name for each order.

SELECT
	d.product_name AS "Orders",
	b.first_name + ' ' + b.last_name AS "Customer Name",
	c.first_name + ' ' + c.last_name AS "Staff Name"
FROM sales.orders a
	INNER JOIN sales.customers b
		ON a.customer_id=b.customer_id
	INNER JOIN sales.staffs c
		ON a.staff_id=c.staff_id
	INNER JOIN production.products d
		ON a.order_id=d.product_id;
