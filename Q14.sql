/*
Q14
What is the total weight in kilograms of orders due in July 2017, or November 2017, or January 2017? 
Only include orders which used an unknown shipping method.

Enter into Canvas the total weight found above, rounded and padded to 2dp.

SalesOrderHeader{
	FK: SalesOrderID,
	Data: [
		DueDate
	]
}

SalesOrderDetail{
	PK: SalesOrderID,
	FK: ProductID,
	Data: [
		OrderQty
	]
}

Product {
	PK: ProductID,
	Data: [
		Weight
	]
}

Filter: ShipMethod LIKE '%Unknown%'
*/

SELECT
    /*
	SalesLT.SalesOrderHeader.SalesOrderID,
	ShipMethod,
	DueDate,
	*/
	ROUND(SUM(SalesLT.SalesOrderDetail.OrderQty * SalesLT.Product.Weight) / 1000, 2) AS 'TotalWeight'
FROM SalesLT.SalesOrderHeader

JOIN SalesLT.SalesOrderDetail
ON SalesLT.SalesOrderDetail.SalesOrderID = SalesLT.SalesOrderHeader.SalesOrderID

JOIN SalesLT.Product
ON SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID

WHERE 
	ShipMethod LIKE '%Unknown%'
	AND (
		YEAR(DueDate) = 2017
		AND (
			MONTH(DueDate) = 01
			OR MONTH(DueDate) = 07
			OR MONTH(DueDate) = 11
		)
	)
	AND Weight IS NOT NULL

--ORDER BY DueDate
--ans: 7025448.93
