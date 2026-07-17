-- ==========================================
-- Krishna Collection Retail Analytics
-- File: 01_basic_queries.sql
-- Author: Bharat Motwani
-- ==========================================

USE KrishnaCollection;
GO

------------------------------------------------
-- 1. Show all products
------------------------------------------------
SELECT *
FROM Products;

------------------------------------------------
-- 2. Show Men's products
------------------------------------------------
SELECT *
FROM Products
WHERE Gender = 'Men';

------------------------------------------------
-- 3. Show Kids' products
------------------------------------------------
SELECT *
FROM Products
WHERE Gender = 'Kids';

------------------------------------------------
-- 4. Show first 10 products
------------------------------------------------
SELECT TOP 10 *
FROM Products;

------------------------------------------------
-- 5. Show unique brands
------------------------------------------------
SELECT DISTINCT Brand
FROM Products;

------------------------------------------------
-- 6. Count products by brand
------------------------------------------------
SELECT Brand,
       COUNT(*) AS Total_Products
FROM Products
GROUP BY Brand
ORDER BY Total_Products DESC;

------------------------------------------------
-- 7. Count products by category
------------------------------------------------
SELECT Category,
       COUNT(*) AS Total_Products
FROM Products
GROUP BY Category
ORDER BY Total_Products DESC;

------------------------------------------------
-- 8. Products with Selling Price greater than 2000
------------------------------------------------
SELECT *
FROM Products
WHERE Selling_Price > 2000;

------------------------------------------------
-- 9. Products with low stock
------------------------------------------------
SELECT *
FROM Products
WHERE Stock < 20;

------------------------------------------------
-- 10. Highest priced product
------------------------------------------------
SELECT TOP 1 *
FROM Products
ORDER BY Selling_Price DESC;