/*
*** QUESTION 20 (TWENTY) ***
Find how many units of each product have been ordered as at 11:59:59pm, 31st July 2017. 
Only include products available for sale as at 11:59:59pm, 31st July 2017. 
Products available for sale are those which have begun to sell, and are not yet ended or discontinued. 
Dates are provided in the SellStartDate, SellEndDate, and DiscontinuedDate columns.

From the resulting list, enter into Canvas how many unique ProductNumbers have exceeded 39 units.
*/

SELECT 
	--SalesLT.SalesOrderHeader.OrderDate,
	--SalesLT.SalesOrderHeader.SalesOrderID,
    --SalesLT.SalesOrderDetail.ProductID,
	--SalesLT.Product.SellStartDate,
	--SalesLT.Product.SellEndDate,
	--SalesLT.Product.DiscontinuedDate
	SUM(SalesLT.SalesOrderDetail.OrderQty) AS 'Sum of units ordered'
FROM SalesLT.SalesOrderHeader

JOIN SalesLT.SalesOrderDetail
ON SalesLT.SalesOrderDetail.SalesOrderID = SalesLT.SalesOrderHeader.SalesOrderID

JOIN SalesLT.Product
ON SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID

WHERE 
	SalesLT.SalesOrderHeader.OrderDate <'2017-07-31 23:59:59.000' -- order date before end of 31/07/2017
    --AND SalesLT.Product.SellStartDate <'2017-07-31 23:59:59.000' -- product avail for sale before end of 31/07/2017
	--AND SalesLT.Product.SellStartDate IS NOT NULL
	AND (SalesLT.Product.SellEndDate > '2017-07-31 23:59:59.000' OR SalesLT.Product.SellEndDate IS NULL)
	AND (SalesLT.Product.DiscontinuedDate > '2017-07-31 23:59:59.000' OR SalesLT.Product.DiscontinuedDate IS NULL)
GROUP BY SalesLT.Product.ProductID
HAVING SUM(SalesLT.SalesOrderDetail.OrderQty) > 39
--ANS: 31