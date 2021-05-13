SELECT ProductID, SellStartDate, DiscontinuedDate, SellEndDate
FROM SalesLT.Product
WHERE YEAR(SellStartDate) = 2005
	AND DiscontinuedDate IS NULL
	AND SellEndDate IS NULL
-- ans: 15