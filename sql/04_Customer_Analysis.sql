use Retail_Sales;
select * from retail_sales_dataset;

-- Find the top 10 customers based on their total spending.

SELECT 
    `Customer ID`, SUM(`Total Amount`) Total_Amount
FROM
    retail_sales_dataset
GROUP BY `Customer ID`
ORDER BY Total_Amount DESC
LIMIT 10;


-- Calculate the average transaction amount for each customer.

SELECT 
    AVG(`Total Amount`) Average_Transection
FROM
    retail_sales_dataset;
    

-- Count the number of transactions made by each customer.

SELECT 
    COUNT(`Customer ID`)
FROM
    retail_sales_dataset
GROUP BY `Customer ID`;

-- Find the customer who purchased the highest total quantity of products.

SELECT 
    `Customer ID`, MAX(Quantity) Highest_quantity
FROM
    retail_sales_dataset
GROUP BY `Customer ID`
ORDER BY Highest_quantity DESC
LIMIT 1;

-- Identify customers whose total spending is greater than the average customer spending.

SELECT 
    `Customer ID`, SUM(`Total Amount`) Total_spending
FROM
    retail_sales_dataset
GROUP BY `Customer ID`
HAVING Total_spending > (SELECT 
        AVG(`Total Amount`) Average_Transection
    FROM
        retail_sales_dataset)
ORDER BY Total_spending DESC;

-- Find customers who have purchased more than one product category.

SELECT 
    `Customer ID`,
    COUNT(DISTINCT `Product Category`) No_Of_product
FROM
    retail_sales_dataset
GROUP BY `Customer ID`
HAVING No_Of_product > 1;

-- Calculate the average transaction amount for each customer, and display only customers whose average transaction amount is greater than ₹1,000.

SELECT 
    `Customer ID`,
    AVG(`Total Amount`) Average_Transection_Amount
FROM
    retail_sales_dataset
GROUP BY `Customer ID`
HAVING Average_Transection_Amount > 1000;


-- Rank all customers based on their total spending, from highest to lowest.

with Total_spanding as ( Select `Customer ID` , sum(`Total Amount`) Total_Span
from retail_sales_dataset
group by `Customer ID`)
select `Customer ID`, Dense_Rank() over( order by Total_Span Desc) as Total_spanding_Rank
from Total_spanding;

-- Calculate each customer's percentage contribution to total revenue.

SELECT
    `Customer ID`,
    SUM(`Total Amount`) AS Total_Revenue,
    SUM(`Total Amount`) * 100.0 /
        (SELECT SUM(`Total Amount`)
         FROM retail_sales_dataset) AS Par_Contribution
FROM retail_sales_dataset
GROUP BY `Customer ID`;

-- Identify customers whose total spending falls within the top 25% of customers.

WITH Customer_Spending AS (
    SELECT
        `Customer ID`,
        SUM(`Total Amount`) AS Total_Spending
    FROM retail_sales_dataset
    GROUP BY `Customer ID`
),
Customer_Ranking AS (
    SELECT
        `Customer ID`,
        Total_Spending,
        CUME_DIST() OVER (
            ORDER BY Total_Spending DESC
        ) AS Spending_Distribution
    FROM Customer_Spending
)
SELECT
    `Customer ID`,
    Total_Spending
FROM Customer_Ranking
WHERE Spending_Distribution <= 0.25;


-- Segment customers into High, Medium, and Low Spending groups based on their total spending.

SELECT 
    `Customer Id`,
    SUM(`Total Amount`) Total_Spanding,
    IF(SUM(`Total Amount`) >= 1500,
        'High',
        IF(SUM(`Total Amount`) >= 800,
            'Medium',
            'Low')) AS Customer_Categorize
FROM
    retail_sales_dataset
GROUP BY `Customer Id`;

-- Find the highest-spending customer in each gender group

WITH Customer_Spending AS (
    SELECT
        `Customer ID`,
        Gender,
        SUM(`Total Amount`) AS Total_Spending
    FROM retail_sales_dataset
    GROUP BY `Customer ID`, Gender
),
Customer_Ranking AS (
    SELECT
        `Customer ID`,
        Gender,
        Total_Spending,
        DENSE_RANK() OVER (
            PARTITION BY Gender
            ORDER BY Total_Spending DESC
        ) AS Ranking
    FROM Customer_Spending
)
SELECT *
FROM Customer_Ranking
WHERE Ranking = 1;


-- Find which age group contributes the most revenue, and calculate its percentage contribution to total revenue.

WITH Age_Group_Revenue AS (
    SELECT
        CASE
            WHEN Age BETWEEN 18 AND 25 THEN '18-25'
            WHEN Age BETWEEN 26 AND 35 THEN '26-35'
            WHEN Age BETWEEN 36 AND 45 THEN '36-45'
            WHEN Age BETWEEN 46 AND 55 THEN '46-55'
            WHEN Age >= 56 THEN '56+'
            ELSE 'Other'
        END AS Age_Group,
        SUM(`Total Amount`) AS Total_Revenue
    FROM retail_sales_dataset
    GROUP BY Age_Group
),
Revenue_Contribution AS (
    SELECT
        Age_Group,
        Total_Revenue,
        Total_Revenue * 100.0 /
            (SELECT SUM(`Total Amount`)
             FROM retail_sales_dataset) AS Revenue_Percentage
    FROM Age_Group_Revenue
)
SELECT
    Age_Group,
    Total_Revenue,
    ROUND(Revenue_Percentage, 2) AS Revenue_Percentage
FROM Revenue_Contribution
ORDER BY Total_Revenue DESC
LIMIT 1;

-- Find the top 5 customers in each product category based on their total spending within that category.

WITH Customer_Category_Spending AS (
    SELECT
        `Product Category`,
        `Customer ID`,
        SUM(`Total Amount`) AS Total_Spending
    FROM retail_sales_dataset
    GROUP BY `Product Category`, `Customer ID`
),
Ranked_Customers AS (
    SELECT
        `Product Category`,
        `Customer ID`,
        Total_Spending,
        DENSE_RANK() OVER (
            PARTITION BY `Product Category`
            ORDER BY Total_Spending DESC
        ) AS Spending_Rank
    FROM Customer_Category_Spending
)
SELECT
    `Product Category`,
    `Customer ID`,
    Total_Spending,
    Spending_Rank
FROM Ranked_Customers
WHERE Spending_Rank <= 5
ORDER BY `Product Category`, Spending_Rank;