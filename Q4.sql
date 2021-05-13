SELECT ProductID, Color, Size, Weight
FROM SalesLT.Product
WHERE 
-- NO COLOR OR MULTIPLE COLOR
    Weight IS not NULL
    AND Size IS NULL
	AND (
		Color LIKE '%Multi%'
		OR Color IS NULL
		OR Color LIKE '%Colour%'
	)
-- ans: 3