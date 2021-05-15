/*
How many units of products categorised as components have been ordered? 
Only include units that have been or will be shipped to the Canadian province of Quebec.

Products belonging to sub-categories (a.k.a. child categories) of a parent category are considered products of that parent category. 
E.g. products which belong to sub-categories of "Bikes" (such as "Road Bikes" and "Mountain Bikes") are also considered "bike" products.

SalesOrderHeader {
    FK: [SalesOrderID],
    Data: [ShipToAddressID]
}

Address

SalesOrderDetail {
    PK: SalesOrderID,
    FK: [ProductID]
}

Product {
    PK: ProductID,
    FK: [ProductCategoryID]
}

ProductCategory {
    PK: ProductCategoryID,
    Data: [Name]
}
*/

SELECT 
	SUM(SalesLT.SalesOrderDetail.OrderQty) AS 'Total Units Ship to Quebec'
	/*
    SalesLT.SalesOrderHeader.SalesOrderID,
    SalesLT.SalesOrderHeader.ShipToAddressID,
	SalesLT.Address.StateProvince,
	SalesLT.Address.CountryRegion,
    SalesLT.SalesOrderDetail.ProductID,
	SalesLT.SalesOrderDetail.OrderQty,
    SalesLT.Product.ProductID,
    SalesLT.ProductCategory.ProductCategoryID,
    SalesLT.ProductCategory.Name AS 'Category'
	*/

FROM SalesLT.SalesOrderHeader

JOIN SalesLT.SalesOrderDetail
ON SalesLT.SalesOrderDetail.SalesOrderID = SalesLT.SalesOrderHeader.SalesOrderID

JOIN SalesLT.Address
ON SalesLT.Address.AddressID = SalesLT.SalesOrderHeader.ShipToAddressID

JOIN SalesLT.Product
ON SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID

JOIN SalesLT.ProductCategory
ON SalesLT.ProductCategory.ProductCategoryID = SalesLT.Product.ProductCategoryID

WHERE 
	SalesLT.ProductCategory.ParentProductCategoryID = 2
	AND SalesLT.Address.CountryRegion LIKE '%Canada%'
	AND SalesLT.Address.StateProvince LIKE '%Quebec%'

--ans: 108