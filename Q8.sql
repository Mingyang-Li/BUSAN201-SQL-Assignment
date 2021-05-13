/*
- SalesOrderDetailID - SalesOrderDetail
- OrderQty - SalesOrderDetail
- UnitPrice - SalesOrderDetail
- LineTotal - SalesOrderDetail
- Name - Product
- Description - ProductDescription
*/

SELECT 
    SalesOrderDetailID,
    OrderQty,
    UnitPrice,
    LineTotal,
    Product.Name,
    ProductDescription.Description
FROM ...

