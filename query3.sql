--Stored procedure that accepts a customer ID and returns the total number of orders placed by that customer

CREATE PROCEDURE GetTotalOrdersByCustomer( 
     @CustomerID INT) 
 AS 
 BEGIN 
     SELECT c.customer_id as customer_id, c.first_name as Name, COUNT(*) AS order_count 
     FROM sales.orders o 
         INNER JOIN sales.customers c 
         ON o.customer_id = c.customer_id 
     WHERE o.customer_id = @CustomerID 
         GROUP BY c.customer_id, c.first_name; 
 END; 
 GO
 EXEC GetTotalOrdersByCustomer 100;
