/*
*** QUESTION 15 (FIFTEEN) ***
For all orders placed in 2017, calculate the revenue received for each product-colour (according to the Color column). 
Revenue is determined by using the product unit prices in the order, and it includes any applied discounts. 
Treat unknown (NULL) and "No Colour" as the same colour; treat "Multi" as its own colour. Sort your result by revenue descendingly.

Enter into Canvas the sum of the revenue amounts in rows 5 to 7 (inclusive), rounded and padded to 2dp.

SalesOrderHeader{
    FK: [SalesOrderID]
    Data: [OrderDate]
}

SalesOrderDetail {
    PK: SalesOrderID,
    FK: [ProductID],
    Data: [LineTotal]
}

Product {
    PK: ProductID,
    FK: [],
    Data: [Color]
}
*/

SELECT 
	--OrderDate,
    --SalesLT.SalesOrderHeader.SalesOrderID,
    --SalesLT.SalesOrderDetail.ProductID,
	--SalesLT.SalesOrderDetail.LineTotal AS 'TotalRevOfThisColor'
	SalesLT.Product.Color,
    SUM(SalesLT.SalesOrderDetail.LineTotal) AS 'Total Revenue of This Color'

FROM SalesLT.SalesOrderHeader

INNER JOIN SalesLT.SalesOrderDetail
ON SalesLT.SalesOrderDetail.SalesOrderID = SalesLT.SalesOrderHeader.SalesOrderID

INNER JOIN SalesLT.Product
ON SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID

WHERE YEAR(OrderDate) = 2017

GROUP BY SalesLT.Product.Color

ORDER BY SUM(SalesLT.SalesOrderDetail.LineTotal)  DESC

/*
WHERE 
    SalesLT.Product.Color IS NULL
    OR SalesLT.Product.Color LIKE '%No Colour%'
*/