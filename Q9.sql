/*
Find all addresses in the UK which are not assigned to a customer. Order your result ascendingly by AddressID.

Steps:
1. AddressLine1 - Address (AddressID)
2. AddressLine2 - Address (AddressID)
3. AddressID - CustomerAddress (CustomerID, AddressID)

FIND: name of the city of the address in row 3.

JOIN steps:
Address (AddressID) => 
    CustomerAddress (CustomerID, AddressID) => 
        AddressID (CountryRegion)
*/

SELECT
    CountryRegion,
    AddressLine1,
    AddressLine2,
    City,
    Customer.CustomerID,
    CustomerAddress.AddressID
FROM SalesLT.Address

FULL OUTER JOIN SalesLT.CustomerAddress
ON Address.AddressID = CustomerAddress.AddressID

FULL OUTER JOIN SalesLT.Customer
ON Customer.CustomerID = CustomerAddress.CustomerID

WHERE 
    CountryRegion = 'United Kingdom'
    AND CustomerAddress.AddressID IS NULL
ORDER BY AddressID

-- AND: Maidenhead