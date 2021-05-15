/*
Calculate the number of addresses in each city. 
Assume city names are unique across countries. 
Sort your result descendingly by the address count. 
If there are multiple cities with the same count then order those cities alphabetically.
Enter into Canvas the row number of "Eureka".
*/

SELECT 
	City,
	COUNT(AddressID) AS 'Number of Address'
FROM SalesLT.Address

GROUP BY SalesLT.Address.City

ORDER BY 
	COUNT(AddressID) DESC, 
	City
--ans: 111