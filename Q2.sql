SELECT ProductID, Weight
FROM SalesLT.Product
WHERE Weight IS not NULL AND Weight > 1500 AND ListPrice >= 846.44
-- ans: 40