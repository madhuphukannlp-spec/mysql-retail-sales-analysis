-- Product category that  generate the highest revenue


SELECT 
    `Product category`, SUM(`Total Amount`) Total_Revenue
FROM
    retail_sales_dataset
GROUP BY `Product category`
ORDER BY Total_Revenue Desc
LIMIT 1;


-- Which Product category has lowest total revenue

select `Product category`, sum(`Total Amount`) Total_Revenue
from retail_sales_dataset
group by `Product category`
order by Total_Revenue ASC;



-- Which Product category has highest no of transaction

SELECT 
    `Product category`,
    COUNT(`Transaction ID`) Total_transaction
FROM
    retail_sales_dataset
GROUP BY `Product category`
ORDER BY Total_transaction
LIMIT 1;


-- What is the average transaction value for each product Category


SELECT 
    `product Category`,
    AVG(`Total Amount`) Average_Transaction_Value
FROM
    retail_sales_dataset
GROUP BY `product Category`
ORDER BY Average_Transaction_Value DESC;



-- Which product category has the highest average quantity per transection?

SELECT 
    `product category`, AVG(Quantity) Average_Quantity
FROM
    retail_sales_dataset
GROUP BY `product category`
ORDER BY Average_Quantity DESC
LIMIT 1;


-- Which Product Category has the highest total quantity sold?

SELECT 
    `Product Category`, SUM(Quantity) Total_quantity
FROM
    retail_sales_dataset
GROUP BY `product category`
ORDER BY Total_quantity DESC
LIMIT 1;


-- Which Product category has the highest number of unique customer

SELECT 
    `Product category`,
    COUNT(DISTINCT `Customer ID`) No_of_Unique_Customer
FROM
    retail_sales_dataset
GROUP BY `Product category`
ORDER BY No_of_Unique_Customer
LIMIT 1;


-- which product category has the highest total revenue in each month

WITH Month_Category_Revenue AS (
    SELECT
        `Product Category`,
        DATE_FORMAT(Date, '%Y-%b') AS sales_month,
        SUM(`Total Amount`) AS Total_revenue
    FROM retail_sales_dataset
    GROUP BY
        DATE_FORMAT(Date, '%Y-%b'),
        `Product Category`
),

Rank_Category AS (
    SELECT
        sales_month,
        `Product Category`,
        Total_revenue,
        RANK() OVER (
            PARTITION BY sales_month
            ORDER BY Total_revenue DESC
        ) AS Revenue_Rank
    FROM Month_Category_Revenue
)

SELECT
    sales_month,
    `Product Category`,
    Total_revenue
FROM Rank_Category
WHERE Revenue_Rank = 1
ORDER BY sales_month DESC;






