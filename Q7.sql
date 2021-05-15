/*
- CompanyName - Customer
- SalesOrderNumber - SalesOrderHeader
- SalesOrderDetailID - SalesOrderDetail
- Product Name - Product
- ProductModel Name - ProductModel

Order of joins:
1. Header
2. Customer
3. Detail
4. Product
5. Product model
*/

SELECT 
	SalesOrderHeader.SalesOrderID, 
	SalesOrderHeader.SalesOrderNumber,
	SalesOrderDetail.ProductID,		
	Customer.CompanyName,
	Product.Name as ProductName,
	ProductModel.Name as ProductModel
FROM SalesLT.SalesOrderHeader

INNER JOIN SalesLT.SalesOrderDetail
ON SalesLT.SalesOrderHeader.SalesOrderID = SalesLT.SalesOrderDetail.SalesOrderID

INNER JOIN SalesLT.Customer
ON SalesLT.SalesOrderHeader.CustomerID = SalesLT.Customer.CustomerID

INNER JOIN SalesLT.Product
ON SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID

INNER JOIN SalesLT.ProductModel
ON SalesLT.Product.ProductModelID = SalesLT.ProductModel.ProductModelID

WHERE SalesLT.Product.Name LIKE '%Tire'

ORDER BY SalesOrderHeader.SalesOrderID

--ans: SO80009
