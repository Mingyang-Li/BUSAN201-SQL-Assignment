/*
Q10
Find all customers who have ever ordered products categorised as any of the following four categories:
1. Bike Stands
2. Tires and Tubes
3. Vests
4. Wheels
Enter into Canvas the number of unique (different) customers found in the list above.

Join steps:
SalesOrderHeader (CustomerID) => 
    Customer => CustomerID (now, count unique)
    SalesOrderDetail (ProductID) => 
        Product (ProductCategoryID) => 
            ProductCategory => ProductCategory.Name
*/
SELECT 
    COUNT(Customer.CustomerID) AS [Unique Customers]
    --SalesLT.SalesOrderDetail.ProductID,
    --SalesLT.ProductCategory.Name

FROM SalesLT.SalesOrderHeader

FULL OUTER JOIN SalesLT.Customer
ON SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID

FULL OUTER JOIN SalesLT.SalesOrderDetail
ON SalesLT.SalesOrderDetail.SalesOrderID = SalesLT.SalesOrderHeader.SalesOrderID

FULL OUTER JOIN SalesLT.Product
ON SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID

FULL OUTER JOIN SalesLT.ProductCategory
ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID

WHERE 
	SalesLT.ProductCategory.Name LIKE '%Bike Stands%'
	OR SalesLT.ProductCategory.Name LIKE '%Tires and Tubes%'
	OR SalesLT.ProductCategory.Name LIKE '%Vests%'
	OR SalesLT.ProductCategory.Name LIKE '%Wheels%'

--ans: 102