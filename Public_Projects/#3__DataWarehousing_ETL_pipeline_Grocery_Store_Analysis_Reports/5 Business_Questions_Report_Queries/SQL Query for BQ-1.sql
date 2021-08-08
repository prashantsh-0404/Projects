
# SQL Query for BQ-1

WITH TAB AS (SELECT TOP (100) PERCENT STORE DIM.Store Number, TIME DIM.Year, TIME DIM.Week Number, CATEGORY DIM.Category Name, SUM(CategorySales FACT.Sales) AS Total Sales FROM CATEGORY DIM INNER JOIN CategorySales FACT ON CATEGORY DIM.Category ID = CategorySales FACT.Category ID INNER JOIN STORE DIM ON CategorySales FACT.Store ID = STORE DIM.Store ID INNER JOIN TIME_ DIM ON CategorySales FACT.T,me ID = TIME DIM.T1me ID GROUP BY CATEGORY DIM.Category Name, TIME DIM.Year, STORE DIM.Store Number, TIME DIM.Week Number HAVING (CATEGORY DIM.Category Name = 
N.FROZEN. OR = N.FISH. OR = N'MEAT' OR 
CATEGORY DIM.Category Name 
CATEGORY DIM.Category Name 
CATEGORY DIM.Category Name = N'DAIRY') AND (TIME DIM.Year = 1997) AND (STORE DIM.Store Number = 2) ORDER BY TIME DIM.Week Number) SELECT b.Store Number, b.Year, b.Week Number, b.Category Name, b.Total Sales, f In IFNULL(CONVERT(varchar(20), 100 * (b.Total Sales - a.Total Sales) / a.Total Sales), ..) 1 AS [%Change] FROM TAB AS b LEFT OUTER JOIN TAB AS a ON b.Week Number = a.Week Number 1 AND b.Category Name = a.Category Name ORDER BY b.Week Number 