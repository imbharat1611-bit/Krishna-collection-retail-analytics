-- ==========================================
-- Krishna Collection Retail Analytics
-- File: 04_joins.sql
-- Author: Bharat Motwani
-- ==========================================

USE KrishnaCollection;
GO

------------------------------------------------
-- Query 1
-- Display every sale with product details
------------------------------------------------

SELECT
    s.Invoice_ID,
    s.Product_ID,
    p.Brand,
    p.Category,
    p.Selling_Price,
    s.Quantity,
    s.Revenue
FROM Sales s
INNER JOIN Products p
ON s.Product_ID = p.Product_ID;

------------------------------------------------
-- Query 2
-- Display every sale with customer details
------------------------------------------------

SELECT
    s.Invoice_ID,
    c.Customer_Name,
    c.City,
    s.Revenue
FROM Sales s
INNER JOIN Customers c
ON s.Customer_ID = c.Customer_ID;

------------------------------------------------
-- Query 3
-- Complete Sales Report
------------------------------------------------

SELECT
    s.Invoice_ID,
    c.Customer_Name,
    c.City,
    p.Brand,
    p.Category,
    s.Quantity,
    s.Revenue,
    s.Profit
FROM Sales s
INNER JOIN Customers c
ON s.Customer_ID = c.Customer_ID
INNER JOIN Products p
ON s.Product_ID = p.Product_ID;

------------------------------------------------
-- Query 4
-- Revenue by Brand
------------------------------------------------

SELECT
    p.Brand,
    SUM(s.Revenue) AS Total_Revenue
FROM Sales s
INNER JOIN Products p
ON s.Product_ID = p.Product_ID
GROUP BY p.Brand
ORDER BY Total_Revenue DESC;

------------------------------------------------
-- Query 5
-- Revenue by Category
------------------------------------------------

SELECT
    p.Category,
    SUM(s.Revenue) AS Total_Revenue
FROM Sales s
INNER JOIN Products p
ON s.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Revenue DESC;

------------------------------------------------
-- Query 6
-- Top 10 Customers by Revenue
------------------------------------------------

SELECT TOP 10
    c.Customer_Name,
    SUM(s.Revenue) AS Total_Spent
FROM Sales s
INNER JOIN Customers c
ON s.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Spent DESC;

------------------------------------------------
-- Query 7
-- Top 10 Selling Products
------------------------------------------------

SELECT TOP 10
    p.Brand,
    p.Category,
    SUM(s.Quantity) AS Units_Sold
FROM Sales s
INNER JOIN Products p
ON s.Product_ID = p.Product_ID
GROUP BY
    p.Brand,
    p.Category
ORDER BY Units_Sold DESC;

------------------------------------------------
-- Query 8
-- Revenue by City
------------------------------------------------

SELECT
    c.City,
    SUM(s.Revenue) AS Total_Revenue
FROM Sales s
INNER JOIN Customers c
ON s.Customer_ID = c.Customer_ID
GROUP BY c.City
ORDER BY Total_Revenue DESC;

------------------------------------------------
-- Query 9
-- Average Revenue per Order by City
------------------------------------------------

SELECT
    c.City,
    AVG(s.Revenue) AS Average_Order_Value
FROM Sales s
INNER JOIN Customers c
ON s.Customer_ID = c.Customer_ID
GROUP BY c.City
ORDER BY Average_Order_Value DESC;

------------------------------------------------
-- Query 10
-- Number of Sales by Brand
------------------------------------------------

SELECT
    p.Brand,
    COUNT(s.Invoice_ID) AS Number_of_Sales
FROM Sales s
INNER JOIN Products p
ON s.Product_ID = p.Product_ID
GROUP BY p.Brand
ORDER BY Number_of_Sales DESC;