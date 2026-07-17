-- ==========================================
-- Krishna Collection Retail Analytics
-- File: 03_groupby_having.sql
-- Author: Bharat Motwani
-- ==========================================

USE KrishnaCollection;
GO

------------------------------------------------
-- Query 1
-- Brands having more than 30 products
------------------------------------------------

SELECT
    Brand,
    COUNT(*) AS Total_Products
FROM Products
GROUP BY Brand
HAVING COUNT(*) > 15
ORDER BY Total_Products DESC;

------------------------------------------------
-- Query 2
-- Categories having more than 40 products
------------------------------------------------

SELECT
    Category,
    COUNT(*) AS Total_Products
FROM Products
GROUP BY Category
HAVING COUNT(*) > 15
ORDER BY Total_Products DESC;

------------------------------------------------
-- Query 3
-- Brands having total stock greater than 1000
------------------------------------------------

SELECT
    Brand,
    SUM(Stock) AS Total_Stock
FROM Products
GROUP BY Brand
HAVING SUM(Stock) > 800
ORDER BY Total_Stock DESC;

------------------------------------------------
-- Query 4
-- Categories with average selling price above 1500
------------------------------------------------

SELECT
    Category,
    AVG(Selling_Price) AS Average_Selling_Price
FROM Products
GROUP BY Category
HAVING AVG(Selling_Price) > 1000
ORDER BY Average_Selling_Price DESC;

------------------------------------------------
-- Query 5
-- Brands whose average selling price is above 2000
------------------------------------------------

SELECT
    Brand,
    AVG(Selling_Price) AS Average_Selling_Price
FROM Products
GROUP BY Brand
HAVING AVG(Selling_Price) > 2000
ORDER BY Average_Selling_Price DESC;

------------------------------------------------
-- Query 6
-- Categories having total stock less than 800
------------------------------------------------

SELECT
    Category,
    SUM(Stock) AS Total_Stock
FROM Products
GROUP BY Category
HAVING SUM(Stock) < 800
ORDER BY Total_Stock;

------------------------------------------------
-- Query 7
-- Brands having maximum selling price greater than 3000
------------------------------------------------

SELECT
    Brand,
    MAX(Selling_Price) AS Highest_Price
FROM Products
GROUP BY Brand
HAVING MAX(Selling_Price) > 2000
ORDER BY Highest_Price DESC;

------------------------------------------------
-- Query 8
-- Categories having minimum selling price below 500
------------------------------------------------

SELECT
    Category,
    MIN(Selling_Price) AS Lowest_Price
FROM Products
GROUP BY Category
HAVING MIN(Selling_Price) < 500
ORDER BY Lowest_Price;

------------------------------------------------
-- Query 9
-- Brands having inventory value greater than 500000
------------------------------------------------

SELECT
    Brand,
    SUM(CAST(Cost_Price AS BIGINT) * Stock) AS Inventory_Value
FROM Products
GROUP BY Brand
HAVING SUM(CAST(Cost_Price AS BIGINT) * Stock) > 500000
ORDER BY Inventory_Value DESC;

------------------------------------------------
-- Query 10
-- Categories having more than 20 products
-- and average selling price above 1000
------------------------------------------------

SELECT
    Category,
    COUNT(*) AS Total_Products,
    AVG(Selling_Price) AS Average_Selling_Price
FROM Products
GROUP BY Category
HAVING COUNT(*) > 20
   AND AVG(Selling_Price) > 1000
ORDER BY Average_Selling_Price DESC;
