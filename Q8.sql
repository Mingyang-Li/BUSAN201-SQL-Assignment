/*
- SalesOrderDetailID - SalesOrderDetail
- OrderQty - SalesOrderDetail
- UnitPrice - SalesOrderDetail
- LineTotal - SalesOrderDetail
- Name - Product
- Description - 
    Product (ProductModelID) => 
        ProductModel (ProductModelProductDescriptionID) => 
            ProductModelProductDescription (ProductDescriptionID) => 
                ProductDescription.Description
*/

SELECT 
    SalesOrderDetailID,
    OrderQty,
    UnitPrice,
	UnitPriceDiscount,
    LineTotal,
    Product.Name as ProductName,
	Culture,
    ProductDescription.Description
FROM SalesLT.SalesOrderDetail

JOIN SalesLT.Product
ON SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID 

JOIN SalesLT.ProductModel 
ON Product.ProductModelID = ProductModel.ProductModelID

JOIN SalesLT.ProductModelProductDescription
ON ProductModelProductDescription.ProductModelID = Product.ProductModelID

JOIN SalesLT.ProductDescription
ON ProductModelProductDescription.ProductDescriptionID = ProductDescription.ProductDescriptionID

WHERE 
    UnitPriceDiscount = 0.00 -- without discounts
    AND Culture = 'en'
ORDER BY SalesOrderDetailID 

--ans: Serious back-country riding. Perfect for all levels of competition. Uses the same HL Frame as the Mountain-100.