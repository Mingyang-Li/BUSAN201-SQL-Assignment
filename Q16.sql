/*Q16
A sub-query is needed to answer this question. See the notes in the assignment specification document.

Write a query to return the following result set:
Columns:
- ProductCategoryID
- ProductCategoryName
- ParentProductCategoryID (NULL if the category has no parent)
- ParentSubCatCount: the number of subcategories the parent has; NULL or 0 if the category has no parent

Rows:
- All Product Categories with ID greater than 1000

Enter into Canvas the "answerToSubmit" value produced by this query:
SELECT SUM(ProductCategoryID + LEN(ProductCategoryName) + ParentProductCategoryID + ParentSubCatCount) AS answerToSubmit
FROM (
--paste your query's code here (this is the query you write which uses a sub-query).
) 
*/

SELECT
	SalesLT.ProductCategory.ProductCategoryID,
	SalesLT.ProductCategory.Name,
	SalesLT.ProductCategory.ParentProductCategoryID,
	COUNT(SalesLT.ProductCategory.Name)	AS 'ParentSubCatCount'
FROM SalesLT.ProductCategory
LEFT JOIN SalesLT.Product 
ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID
WHERE SalesLT.ProductCategory.ProductCategoryID >= 1000
GROUP BY SalesLT.ProductCategory.ProductCategoryID, SalesLT.ProductCategory.Name,	SalesLT.ProductCategory.ParentProductCategoryID