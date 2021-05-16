/*
Q16
For each sales order, compute the cost of freight per unit (across all its products). 
Sort your result by the computed cost descendingly.

Enter into Canvas the cost found above for the order in row 53, padded and rounded to 2dp.
*/

SELECT 
    SalesLT.SalesOrderHeader.SalesOrderID,
    --SalesLT.SalesOrderDetail.ProductID,
    --SalesLT.SalesOrderHeader.Freight AS 'Total Freight Cost',
    SUM(SalesLT.SalesOrderDetail.OrderQty) AS 'Unites per order'
	--SalesLT.SalesOrderHeader.Freight / SUM(SalesLT.SalesOrderDetail.OrderQty) AS 'Average Freight per unit'

FROM SalesLT.SalesOrderHeader

JOIN SalesLT.SalesOrderDetail
ON SalesLT.SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID

GROUP BY SalesLT.SalesOrderHeader.SalesOrderID