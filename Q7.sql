/*
- CompanyName - Customer
- SalesOrderNumber - SalesOrderHeader
- SalesOrderDetailID - SalesOrderDetail
- Product Name - Product
- ProductModel Name - ProductModel
*/

SELECT 
	SalesLT.Product.Name, 
	SalesLT.ProductModel.Name, 
	SalesLT.ProductModel.ProductModelID,
	SalesLT.SalesOrderHeader.SalesOrderNumber
FROM SalesLT.Product
INNER JOIN SalesLT.ProductModel ON Product.ProductModelID = SalesLT.ProductModel.ProductModelID
INNER JOIN SalesLT.SalesOrderHeader ON SalesOrderDetail.ProductID = SalesLT.Product.ProductID
-- WHERE CONTAINS(SalesLT.ProductModel.Name, 'Tire')