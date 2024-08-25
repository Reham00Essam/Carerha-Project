--Identify the total number of invoices, unique customers, and product categories

-- Total number of invoices
SELECT COUNT(DISTINCT ORDERNUMBER) AS Total_Invoices
FROM sales_data_sample;

-- Total number of unique customers
SELECT COUNT(DISTINCT CUSTOMERNAME) AS Unique_Customers
FROM sales_data_sample;

-- Total number of product categories (PRODUCTLINE as the category)
SELECT COUNT(DISTINCT PRODUCTLINE) AS Product_Categories
FROM sales_data_sample;


-----------------------------------------------------------------------------
--Calculate basic summary statistics for key metrics

-- Total sales amount
SELECT SUM(SALES) AS Total_Sales_Amount
FROM sales_data_sample;

-- Average order value
SELECT AVG(TotalAmount) AS Average_Order_Value
FROM (
    SELECT ORDERNUMBER, SUM(SALES) AS TotalAmount
    FROM sales_data_sample
    GROUP BY ORDERNUMBER
);

-- Most frequently purchased items
SELECT PRODUCTCODE, COUNT(QUANTITYORDERED) AS Frequency
FROM sales_data_sample
GROUP BY PRODUCTCODE
ORDER BY Frequency DESC
LIMIT 10;

--------------------------------------------------------
--Explore purchase patterns by country

-- Total sales by country
SELECT COUNTRY, SUM(SALES) AS Total_Sales
FROM sales_data_sample
GROUP BY COUNTRY
ORDER BY Total_Sales DESC;

-- Number of invoices by country
SELECT COUNTRY, COUNT(DISTINCT ORDERNUMBER) AS Number_Of_Invoices
FROM sales_data_sample
GROUP BY COUNTRY
ORDER BY Number_Of_Invoices DESC;

-- Number of unique customers by country
SELECT COUNTRY, COUNT(DISTINCT CUSTOMERNAME) AS Unique_Customers
FROM sales_data_sample
GROUP BY COUNTRY
ORDER BY Unique_Customers DESC;

