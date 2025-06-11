CREATE DATABASE Pizza_Sales;

USE Pizza_Sales
GO



/* 1. KPIs */


	/* (a) Total Revenue */

	SELECT ROUND(SUM(total_price), 2) AS Total_Revenue
	FROM pizza_sales;

	/* (b) Average Order Value */

	SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS Avg_Order_Value
	FROM pizza_sales;

	/* (c) Total Pizzas Sold */

	SELECT SUM(quantity) AS Total_Pizzas_Sold
	FROM pizza_sales;

	/* (d) Total Orders */

	SELECT COUNT(DISTINCT order_id) AS Total_Orders
	FROM pizza_sales;

	/* (e) Average Pizzas per Order */

	SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Avg_Order_Value
	FROM pizza_sales;



/* 2. Daily Trend for Total Orders */

SELECT
	DATENAME(WEEKDAY, order_date) AS Order_Day,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM
	pizza_sales
GROUP BY
	DATENAME(WEEKDAY, order_date);



/* 3. Monthly Trend for Total Orders */

SELECT
	DATENAME(MONTH, order_date) AS Month_Name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM
	pizza_sales
GROUP BY
	DATENAME(MONTH, order_date);



/* 4. Percentage of Sales by Pizza Category */

SELECT
	pizza_category AS Pizza_Category,
	ROUND((SUM(total_price) / SUM(SUM(total_price)) OVER()) * 100.0, 2) AS Percentage_Sales
FROM
	pizza_sales
GROUP BY
	pizza_category
ORDER BY
	Percentage_Sales DESC;



/* 5. Percentage of Sales by Pizza Size */

SELECT
	pizza_size AS Pizza_Size,
	ROUND((SUM(total_price) / SUM(SUM(total_price)) OVER()) * 100.0, 2) AS Percentage_Sales
FROM
	pizza_sales
GROUP BY
	pizza_size
ORDER BY
	Percentage_Sales DESC;



/* 6. Total Pizza Sold by Pizza Category */

SELECT 
    pizza_category AS Pizza_Category,
    SUM(quantity) AS Total_Pizzas_Sold
FROM 
    pizza_sales
GROUP BY 
    pizza_category
ORDER BY 
    Total_Pizzas_Sold DESC;



/* 7. Top 5 Pizzas by Revenue */

SELECT
	TOP 5 pizza_name AS Pizza_Name,
	ROUND(SUM(total_price), 2) AS Total_Revenue
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	Total_Revenue DESC;



/* 8. Bottom 5 Pizzas by Revenue */

SELECT
	TOP 5 pizza_name AS Pizza_Name,
	ROUND(SUM(total_price), 2) AS Total_Revenue
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	Total_Revenue ASC;



/* 9. Top 5 Pizzas by Quantity */

SELECT
	TOP 5 pizza_name AS Pizza_Name,
	SUM(quantity) AS Total_Pizza_Sold
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	Total_Pizza_Sold DESC;



/* 10. Bottom 5 Pizzas by Quantity */

SELECT
	TOP 5 pizza_name AS Pizza_Name,
	SUM(quantity) AS Total_Pizza_Sold
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	Total_Pizza_Sold ASC;



/* 11. Top 5 Pizzas by Total Orders */

SELECT
	TOP 5 pizza_name AS Pizza_Name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	Total_Orders DESC;



/* 12. Bottom 5 Pizzas by Total Orders */

SELECT
	TOP 5 pizza_name AS Pizza_Name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM
	pizza_sales
GROUP BY
	pizza_name
ORDER BY
	Total_Orders ASC;