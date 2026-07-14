/*Section1:Database Superstore created;
go to Databases, rightclick and click New Database
to create Superstore database.*/

/*Section2:New query created by right clicking on Superstore
database and clicking on New Query.Latter named by right 
clicking on it and renaming to Superstore*/

--Section 3:Create Tables--

/*Importing the Orders data from excel in csv format,
data cleaned from excel, blank rows for ProductBaseMargin has a
total count of 63, no duplicate records, no excel errors and all
dates are valid.*/
-- Update Orders table to 2 decimal places.--
UPDATE Orders
SET
	Sales = ROUND(Sales, 2),
	Discount = ROUND(Discount, 2),
	Profit = ROUND(Profit, 2),
	Unit_Price = ROUND(Unit_Price, 2),
	Shipping_Cost = ROUND(Shipping_Cost, 2),
	Product_Base_Margin = ROUND(Product_Base_Margin, 2);
ALTER TABLE Orders
ALTER COLUMN Unit_Price DECIMAL(18, 2);

SELECT * FROM Orders;

--Table Customer Name--
SELECT * FROM [Customer Name];

--Table Returns--
SELECT * FROM [Returns];

--Table Users--

--Insert values into Users table--
INSERT INTO Users(Region, Manager) VALUES
('Central',	'Chris'),
('East',	'Erin'),
('South',	'Sam'),
('Central',  'Pat'),
('West',	'William'),
('West',	'Pat'),
('East',	'Pat'),
('South',	'Pat');
SELECT * FROM Users;

--Section 4: Exploring the data by running simple queries.--
SELECT COUNT(*) FROM Orders;
SELECT 
	Row_ID, 
	Product_Category, 
	Product_Container, 
	Product_Name,
	Product_Sub_Category 
FROM Orders;
SELECT 
	MIN(Sales) AS MinSales, 
	MAX(Sales) AS MaxSales 
FROM Orders; 
SELECT * FROM Orders 
	WHERE Product_Container = 'Jumbo Box';
SELECT COUNT(*) FROM Orders 
	WHERE Product_Container = 'Jumbo Box';

--Section 5: Generate 10 business questions and write query for each.--

--1. Which product generated the highest sales?--
SELECT 
	TOP 10 Product_Name,
	SUM(Sales) AS TotalSales FROM Orders
GROUP BY Product_Name
ORDER BY TotalSales DESC;

--2. Which region generated the most revenue?--
SELECT 
	TOP 1 Region,
	SUM(Sales) AS TotalRevenue FROM Orders
GROUP BY Region
ORDER BY TotalRevenue DESC;

--3. Which customer spent the most money?--
SELECT 
	TOP 1 Customer_Name,
	SUM(Sales) AS TotalExpenditure FROM Orders
GROUP BY Customer_Name
ORDER BY TotalExpenditure DESC;

--4. Which category has the highest profit?--
SELECT 
	TOP 1 Product_Category,
	SUM(Profit) AS TotalProfit FROM Orders
GROUP BY Product_Category
ORDER BY TotalProfit DESC;

--5. Which sub-category performs best?--
SELECT 
	TOP 1 Product_Sub_Category,
	SUM(Profit) AS BestProfit 
FROM Orders
GROUP BY Product_Sub_Category
ORDER BY BestProfit DESC;

--6. Which month has the highest sales?--
SELECT 
	TOP 1 YEAR(Order_Date) AS SalesYear, 
	DATENAME(MONTH, Order_Date) AS Month,
	SUM(Sales) AS HighestSales 
FROM Orders
GROUP BY
	YEAR(Order_Date),  
	DATENAME(MONTH, Order_Date)
ORDER BY HighestSales DESC;

--7. Which month has the lowest sales?--
SELECT 
	TOP 1 YEAR(Order_Date) AS SalesYear, 
	DATENAME(MONTH, Order_Date) AS Month,
	SUM(Sales) AS LowestSales 
FROM Orders
GROUP BY 
	YEAR(Order_Date), 
	DATENAME(MONTH, Order_Date)
ORDER BY LowestSales ASC;	

SELECT * FROM Orders;

--8. Which Manager is in charge of the Central Region?--
SELECT 
	Region, 
	Manager 
FROM Users
WHERE Region = 'Central';

--9. Which state generated the highest profit?--
SELECT 
	TOP 1 Province,
	CAST(SUM(Profit) AS DECIMAL(18, 2)) AS TotalProfit 
FROM Orders
GROUP BY Province
ORDER BY TotalProfit DESC;

--10.Which shipping mode is used most often?--
SELECT 
TOP 1  Ship_Mode,
	COUNT(*) AS UsageCount 
FROM Orders
GROUP BY Ship_Mode
ORDER BY UsageCount DESC;

--Section 6: Interpretation notes on queries written for the generated questions.--

/* 1. The query identified the product "Global Troy" with the highest cummulative
	  sales of $275,941.52.This product is the best selling item and contributes 
	  significantly to the company's revenue.

   2. The query identified the West region by summing all sales within the region.
      The cummulative total revenue of the region is $3,597,549.33.This indicates 
	  the region with the strongest sales performance.

   3. The query identified the customer "Emily Phan" with the highest total
	  expenditure, $117,124.43.This customer contributed the largest share of
	  revenue, making them a key customer for the business.
	   
   4. The query calculated the total profit for each product category and identified 
	  the category "Tecnology" with the highest profitabilty, $886,313.52.The category
	  delivers the greatest financial return to the business.

   5. The query identified the sub-category "Telephones and Communication" with the
	  the highest total profit, $316,951.62.The sub-category demonstrates the strongest
	  overall financial performance among all product categories.

   6. The query determined the specific month(January) and year(2009) in which the company 
      recorded its highest sales($516,302.97).This information helps identify seasonal
	  sales trends and peak business periods.

   7. The query determined the specific month(June) and year(2011) in which the company
      recorded its lowest sales($197,740.85).This information helps identify minimum sales
	  and bottom business period.

   8. The query identified the managers "Chris and Pat" responsible for overseeing operations
	  in the central regions.This provides insight into regional management responsibility.

   9. The query identified the state "Ontario" with the highest total profit, $346,868.54. This
      state represents the most profitable market and may be prioritized for future business 
	  expansion and investment.

   10.The query counted the number of orders processed through each shipping mode and identified
	  the most frequently used option(Regular Air).This reflects the shipping preference of
	  customers and can assist in logistics planning and operational decision-making.*/



















