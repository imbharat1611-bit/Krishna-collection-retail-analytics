-- ==========================================
-- Krishna Collection Retail Analytics
-- File: 05_subqueries.sql
-- Author: Bharat Motwani
-- ==========================================

USE KrishnaCollection;
GO

------------------------------------------------
-- Query 1
-- Products priced above average selling price
------------------------------------------------

SELECT *
FROM Products
WHERE Selling_Price >
(
    SELECT AVG(Selling_Price)
    FROM Products
);

------------------------------------------------
-- Query 2
-- Customers who spent more than average revenue
------------------------------------------------

SELECT
    c.Customer_Name,
    SUM(s.Revenue) AS Total_Spent
FROM Customers c
INNER JOIN Sales s
ON c.Customer_ID = s.Customer_ID
GROUP BY c.Customer_Name
HAVING SUM(s.Revenue) >
(
    SELECT AVG(Revenue)
    FROM Sales
);

------------------------------------------------
-- Query 3
-- Product(s) with the highest selling price
------------------------------------------------

SELECT *
FROM Products
WHERE Selling_Price =
(
    SELECT MAX(Selling_Price)
    FROM Products
);

------------------------------------------------
-- Query 4
-- Customer(s) with highest total spending
------------------------------------------------

SELECT
    c.Customer_Name,
    SUM(s.Revenue) AS Total_Spent
FROM Customers c
INNER JOIN Sales s
ON c.Customer_ID = s.Customer_ID
GROUP BY c.Customer_Name
HAVING SUM(s.Revenue) =
(
    SELECT MAX(Customer_Total)
    FROM
    (
        SELECT SUM(Revenue) AS Customer_Total
        FROM Sales
        GROUP BY Customer_ID
    ) AS Spending
);

------------------------------------------------
-- Query 5
-- Products that have never been sold
------------------------------------------------

SELECT *
FROM Products
WHERE Product_ID NOT IN
(
    SELECT Product_ID
    FROM Sales
);

------------------------------------------------
-- Query 6
-- Customers who made at least one purchase
------------------------------------------------

SELECT *
FROM Customers
WHERE Customer_ID IN
(
    SELECT Customer_ID
    FROM Sales
);

------------------------------------------------
-- Query 7
-- Products costing more than the average cost price
------------------------------------------------

SELECT *
FROM Products
WHERE Cost_Price >
(
    SELECT AVG(Cost_Price)
    FROM Products
);

------------------------------------------------
-- Query 8
-- Sales with revenue greater than average revenue
------------------------------------------------

SELECT *
FROM Sales
WHERE Revenue >
(
    SELECT AVG(Revenue)
    FROM Sales
);

------------------------------------------------
-- Query 9
-- Brands having revenue above average brand revenue
------------------------------------------------

SELECT
    p.Brand,
    SUM(s.Revenue) AS Total_Revenue
FROM Products p
INNER JOIN Sales s
ON p.Product_ID = s.Product_ID
GROUP BY p.Brand
HAVING SUM(s.Revenue) >
(
    SELECT AVG(Brand_Revenue)
    FROM
    (
        SELECT SUM(s.Revenue) AS Brand_Revenue
        FROM Products p
        INNER JOIN Sales s
        ON p.Product_ID = s.Product_ID
        GROUP BY p.Brand
    ) AS BrandData
);

------------------------------------------------
-- Query 10
-- Products with stock lower than average stock
------------------------------------------------

SELECT *
FROM Products
WHERE Stock <
(
    SELECT AVG(Stock)
    FROM Products
);