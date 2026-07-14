/* Existing Relationship Diagram (ERD) was created by rightclicking on 
Database Diagrams in the Object Explorer and clicking on New Database 
Diagram to create the database diagram "Adventurework ERD".*/

--1. List all customers?--
--Purpose: Retreives all customer records from the customer table.--

SELECT * FROM [SalesLT].[Customer];

--2. Find customers from specific cities?--
--Purpose: Retrieves selected cities where customers are located--

SELECT 
    C.CustomerID, 
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, 
    A.City 
FROM SalesLT.Customer C
JOIN [SalesLT].[Address] A
    ON C.CustomerID = A.AddressID
WHERE City IN ('toronto', 'Richmond', 'Calgary', 'Montreal');

--3. Display products costing more than $1000?--
--Purpose: Retreives the ListPrice  as ProductCost greater than $1000--

SELECT
    ProductID, 
    [Name], 
    ProductNumber,
ListPrice AS ProductCost 
FROM [SalesLT].[Product]
WHERE ListPrice > 1000
ORDER BY ProductCost ASC;

--4.Count customers by city?--
--Purpose: Display the number of customers per city? 

SELECT
    A.City, 
COUNT(C.CustomerID) AS NumberOfCustomers
FROM SalesLT.Customer C
JOIN [SalesLT].[Address] A
    ON C.CustomerID = A.AddressID
GROUP BY A.City
ORDER BY NumberOfCustomers DESC;

--5. Find total revenue by product?--
--Purpose: Calculate the sum of money in dollars generated from each product during sales.-- 

SELECT
    P.ProductID, 
    P.[Name],
    P.ProductNumber, 
CAST(SUM(SOD.LineTotal) AS DECIMAL(18, 2)) AS TotalRevenue
FROM [SalesLT].[Product] P
JOIN [SalesLT].[SalesOrderDetail] SOD
    ON P.ProductID = SOD.ProductID
GROUP BY 
    P.ProductID, 
    P.[Name], 
    ProductNumber
ORDER BY TotalRevenue DESC;

--6. Show top 10 customers by spending?--
--Purpose: Calculate the total sum of money in dollars spent per customer in purchasing.--

SELECT TOP 10 
    C.CustomerID,
    CONCAT(C.FirstName,' ', C.LastName) AS CustomerName,
    CAST(SUM(SOH.TotalDue) AS DECIMAL(18, 2)) AS TotalExpenditure
FROM [SalesLT].[Customer] C
JOIN [SalesLT].[SalesOrderHeader] SOH
    ON C.CustomerID = SOH.CustomerID
GROUP BY
    C.CustomerID, 
    C.FirstName, 
    C.LastName
ORDER BY TotalExpenditure DESC

--7. List orders placed after a given date?--
--Purpose: Display list of orders after a parfticular date--

SELECT SalesOrderID, 
    CustomerID, 
    OrderDate
FROM [SalesLT].[SalesOrderHeader]
WHERE OrderDate > '2004-06-01'
ORDER BY OrderDate ASC;

--8. Find products never ordered?--
--Purpose: Display products that were not ordered during sales--

SELECT
    P.ProductID,
    P.[Name],
    P.ProductNumber,
    P.ListPrice
FROM SalesLT.[Product] P
LEFT JOIN SalesLT.SalesOrderDetail SOD
    ON P.ProductID = SOD.ProductID
WHERE SOD.ProductID IS NULL
ORDER BY P.[Name];

--9. Show average order value per customer?--
-- Purpose: Calculates the average amount each customer spends per order.--

SELECT 
    C.CustomerID, 
    CONCAT(C.FirstName, ' ', C.lastName) AS CustomerName,
    CAST (AVG(SOH.TotalDue) AS DECIMAL(18, 2)) AS AverageOrderValue
FROM [SalesLT].[Customer] C
JOIN [SalesLT].[SalesOrderHeader] SOH
    ON C.CustomerID = SOH.CustomerID
GROUP BY 
    C.CustomerID,
    C.FirstName,
    C.LastName
ORDER BY AverageOrderValue DESC;

--10.List products in each category?--
--Purpose: Display the list of product by name and category.--

SELECT
    PC.Name AS CategoryName,
    P.ProductID,
    P.Name AS ProductName
FROM SalesLT.[Product] P
JOIN SalesLT.ProductCategory PC
    ON P.ProductCategoryID = PC.ProductCategoryID
ORDER BY
    PC.Name,
    P.Name;
