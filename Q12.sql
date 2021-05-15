/*
Q12
Find all sales orders containing more than 9 different products.
Enter into Canvas the number of orders found above.

Steps:
SalesOrderDetail (ProductID)

*/

SELECT 
	SalesLT.SalesOrderDetail.SalesOrderID,
	COUNT(DISTINCT SalesLT.SalesOrderDetail.ProductID) AS 'UniqueProductCount'

FROM SalesLT.SalesOrderDetail

GROUP BY SalesLT.SalesOrderDetail.SalesOrderID

HAVING COUNT(DISTINCT SalesLT.SalesOrderDetail.ProductID) > 9

--ans: 40