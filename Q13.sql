/*
Q13
Attempt this question without using any joins.

Find all sales orders containing at least fifteen units. The units can be made up of different products.

Enter into Canvas the number of orders found above.

Steps:
1. count unites of each sale order
2. filter result of step 1: only show orders with 15 or more units
*/

SELECT 
	SalesLT.SalesOrderHeader.SalesOrderID,
	--SalesOrderNumber,
	SUM(SalesLT.SalesOrderDetail.OrderQty) AS 'SumUnits'
	--SalesLT.SalesOrderDetail.ProductID,
	--SalesLT.SalesOrderDetail.UnitPrice,
	--SalesLT.SalesOrderDetail.LineTotal
    --SalesLT.SalesOrderHeader.SalesOrderNumber
    --COUNT(SalesLT.SalesOrderHeader)
FROM SalesLT.SalesOrderHeader

JOIN SalesLT.SalesOrderDetail
ON SalesLT.SalesOrderDetail.SalesOrderID = SalesLT.SalesOrderHeader.SalesOrderID

GROUP BY SalesLT.SalesOrderHeader.SalesOrderID

HAVING SUM(SalesLT.SalesOrderDetail.OrderQty) >= 15

--ans: 49