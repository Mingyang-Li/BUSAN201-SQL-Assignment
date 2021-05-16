/*
List all customers who have ordered less than $34,118.5356 worth of products across all their orders 
(excluding tax and freight, but including discounts). 
Customers who have not placed an order are considered to have ordered $0.00.

Use an order header's SubTotal to determine a customer's order amount. Treat SubTotal as including discounts.

Enter into Canvas the number of customers in the list found above.
*/

SELECT 
	SalesLT.SalesOrderHeader.CustomerID, 
	SUM(SalesLT.SalesOrderHeader.SubTotal) AS 'Total SubTotal'
	--SUM(SalesLT.SalesOrderHeader.TaxAmt) AS 'Total TaxAmt',
	--SUM(SalesLT.SalesOrderHeader.Freight) AS 'Total Freight'

FROM SalesLT.SalesOrderHeader

JOIN SalesLT.Customer
ON SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID

GROUP BY SalesLT.SalesOrderHeader.CustomerID
HAVING SUM(SalesLT.SalesOrderHeader.SubTotal)  < 34118.5356
ORDER BY SUM(SalesLT.SalesOrderHeader.SubTotal) DESC
--ANS: 25