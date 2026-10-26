# mysql-retail-sales-analysis
Project Overview
This project analyzes retail sales data using MySQL to understand sales performance, purchasing patterns, product-category performance, and customer spending. The goal is to turn transaction-level data into useful business insights that can support data-driven decisions.
Objectives
- Understand overall retail sales performance.
- Analyze sales trends over time.
- Compare revenue across product categories.
- Identify high-spending customers.
- Rank customers and compare their spending.
- Calculate customer revenue contribution.
- Segment customers by spending level.
- Explore how age groups and gender contribute to sales.
- Use SQL aggregation, subqueries, CTEs, and window functions to answer business questions.
Dataset
File: retail_sales_dataset.csv

The dataset is expected to include fields such as:
- Transaction ID
- Date
- Customer ID
- Gender
- Age
- Product Category
- Quantity
- Price per Unit
- Total Amount
Column names may need to be adjusted to match the exact schema imported into MySQL.
Tools and Technologies
- MySQL — querying and analysis
- SQL — filtering, aggregation, grouping, subqueries, CTEs, and window functions
- GitHub — project documentation and version control
Analysis Performed
1. Basic Sales Analysis
- Calculate total sales and key summary metrics.
- Review transaction counts and sales amounts.
- Identify high-value transactions.
2. Time-Based Analysis
- Analyze sales by date and time period.
- Compare revenue across different periods.
- Identify periods with relatively high or low sales.
3. Product Category Analysis
- Calculate revenue by product category.
- Compare category performance.
- Rank categories based on revenue.
4. Customer Analysis
- Find the top 10 customers by total spending.
- Calculate total and average spending per customer.
- Count distinct product categories purchased by each customer.
- Rank customers by spending using DENSE_RANK().
- Calculate each customer's percentage contribution to total revenue.
- Classify customers into High, Medium, and Low spending groups.
- Compare top-spending customers across gender groups.
- Calculate revenue contribution by age group.
- Find top customers within each product category.
- Explore Pareto analysis to understand how customer spending contributes to total revenue.
SQL Concepts Used
- SELECT, WHERE, ORDER BY, LIMIT
- Aggregate functions: SUM(), AVG(), COUNT()
- GROUP BY and HAVING
- Conditional logic: CASE, IF()
- Subqueries and Common Table Expressions (WITH)
- Window functions: DENSE_RANK(), CUME_DIST(), and other ranking functions
- Percentage contribution calculations
- Revenue ranking and customer segmentation
Example Business Questions
1. Which customers have the highest total spending?
2. Which product categories generate the most revenue?
3. What is the average transaction amount per customer?
4. Which customers purchase from more than one product category?
5. What percentage of total revenue does each customer contribute?
6. Which customers belong to the high-spending segment?
7. Which age group contributes the most revenue?
8. Who are the top five customers within each product category?
9. How concentrated is revenue among the highest-spending customers?
Key Findings
- Top customer
- Best-performing category
- Highest-revenue age group
- Customer spending pattern
- Revenue concentration

Business Recommendations
Recommendations should be based on the results you observe. Possible actions to investigate include:
- Develop targeted promotions for high-spending customers.
- Review category-level performance when planning inventory and marketing.
- Tailor campaigns to customer segments where the data shows meaningful differences.
- Investigate whether revenue is concentrated among a small group of customers.
- Collect additional transaction history if repeat purchasing and customer retention are important business goals.
Limitations
- If each customer appears only once, the dataset cannot establish repeat-purchase behaviour or customer retention.
- The dataset does not appear to include profit, cost, or discount information, so revenue should not be described as profit.
- Findings describe this dataset and may not generalize to all retail businesses.
- Validate missing values, data types, duplicate records, and column names before finalizing the analysis.
How to Run
1. Download or clone this repository.
2. Import retail_sales_dataset.csv into MySQL.
3. Confirm the table and column names.
4. Open the SQL scripts in MySQL Workbench or another MySQL client.
5. Run the queries and review the outputs.
6. Add verified results and business insights to the Key Findings section.
Suggested Repository Structure
retail-sales-sql-analysis/
├── README.md
├── data/
│   └── retail_sales_dataset.csv
└── sql/
    ├── 01_basic_sales_analysis.sql
    ├── 02_time_based_analysis.sql
    ├── 03_category_analysis.sql
    └── 04_customer_analysis.sql
Author
Madhujya T.Phukan

Aspiring Data Analyst | SQL | MySQL | Data Analysis
Project Purpose
This project demonstrates practical SQL skills by answering retail business questions with structured queries, aggregations, and customer-level analysis.
