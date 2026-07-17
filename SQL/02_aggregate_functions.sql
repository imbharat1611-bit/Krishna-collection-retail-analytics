-- ==========================================
-- Krishna Collection Retail Analytics
-- File: 02_aggregate_functions.sql
-- Author: Bharat Motwani
-- ==========================================

USE KrishnaCollection;
GO
-- Total number of products

SELECT COUNT(*) AS Total_Products
FROM Products;
SELECT SUM(Stock) AS Total_Stock
FROM Products;
SELECT AVG(Selling_Price) AS Average_Selling_Price
FROM Products;
-- Highest selling price

SELECT MAX(Selling_Price) AS Highest_Selling_Price
FROM Products;
-- Lowest selling price

SELECT MIN(Selling_Price) AS Lowest_Selling_Price
FROM Products;
-- Average selling price by brand

SELECT
    Brand,
    AVG(Selling_Price) AS Average_Selling_Price
FROM Products
GROUP BY Brand
ORDER BY Average_Selling_Price DESC;
-- Total stock by brand

SELECT
    Brand,
    SUM(Stock) AS Total_Stock
FROM Products
GROUP BY Brand
ORDER BY Total_Stock DESC;
-- Number of products by category

SELECT
    Category,
    COUNT(*) AS Total_Products
FROM Products
GROUP BY Category
ORDER BY Total_Products DESC;
-- Average selling price by category

SELECT
    Category,
    AVG(Selling_Price) AS Average_Selling_Price
FROM Products
GROUP BY Category
ORDER BY Average_Selling_Price DESC;
-- Total inventory value

SELECT
    SUM(CAST(Cost_Price AS BIGINT) * Stock) AS Total_Inventory_Value
FROM Products;