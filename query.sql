/* Query 1 Daily Revenue and Order Count */
/* This query calculates the total revenue and commission for each product for every customer type. 
The query ranks the products based on revenue, filters the top 3 products per customer type, 
and then joins the employee sales data to provide employee information associated with these sales. 
The result is sorted by customer type, product ranking, and total employee revenue.*/

WITH order_summary AS (SELECT o.Order_No, o.Customer_ID, o.Employee_ID, 
SUM (od.Product_Quantity * od.Product_Price) AS order_total, SUM(od.Product_Quantity * od.Product_Price * od.Product_Commission) AS order_commission, od.Product_ID
FROM Orders o
JOIN Order_Details od ON o.Order_No = od.Order_No
GROUP BY o.Order_No, o.Customer_ID, o.Employee_ID, od.Product_ID),
customer_order_summary AS (SELECT c.Customer_Type, os.Product_ID, SUM(os.order_total) AS total_revenue, SUM(os.order_commission) AS total_commission, ROW_NUMBER() OVER (PARTITION BY c.Customer_Type ORDER BY SUM(os.order_total) DESC) AS rank
FROM Customer c
JOIN order_summary os ON c.Customer_ID = os.Customer_ID
GROUP BY c.Customer_Type, os.Product_ID),
top_products AS (SELECT * FROM customer_order_summary
WHERE rank <= 3),
employee_sales AS (SELECT e.Employee_ID, e.Employee_Name, e.Employee_Type, SUM(os.order_total) AS total_employee_revenue, SUM(os.order_commission) AS total_employee_commission
FROM Employee e
JOIN order_summary os ON e.Employee_ID = os.Employee_ID
GROUP BY e.Employee_ID, e.Employee_Name, e.Employee_Type)
SELECT tp.Customer_Type, tp.Product_ID, p.Product_Name, tp.total_revenue, tp.total_commission, es.Employee_ID, es.Employee_Name, es.Employee_Type, es.total_employee_revenue, es.total_employee_commission
FROM top_products tp
JOIN Product p ON tp.Product_ID = p.Product_ID
JOIN order_summary os ON tp.Product_ID = os.Product_ID
JOIN employee_sales es ON os.Employee_ID = es.Employee_ID
ORDER BY tp.Customer_Type, tp.rank, es.total_employee_revenue DESC;

/* Query 2 Most Used Payment Methods */
/*  The query above displays the most commonly used payment method by customers, 
sorted by the number of orders and total sales amount. 
The total and average sales amounts are rounded to two decimal places for a more readable format. 
This query is useful for analyzing sales data based on payment methods, as it provides insights into customer behaviour and preferences. 
The information can be used to optimize their payment processing systems and to make informed decisions about pricing and promotional strategies involving payment methods.*/

SELECT
    o.Payment_Method,
    COUNT (*) AS Num_Orders,
    ROUND (SUM (od.Product_Quantity * od.Product_Price), 2) AS Total_Sales_Amount,
    ROUND (AVG (od.Product_Quantity * od.Product_Price), 2) AS Avg_Sales_Amount
FROM
    Orders o
    JOIN Order_Details od ON o.Order_No = od.Order_No
WHERE
    o.Order_Status = 'Completed'
GROUP BY
    o.Payment_Method
ORDER BY
    Num_Orders DESC,
    Total_Sales_Amount DESC;

/* Query 3 Top 3 Customers Made the Most Purchases within 3 Months */
/* This query can identify the top 3 customers who made the most purchases within the last three months. 
The information can be used to create targeted marketing campaigns to retain these high-value customers and encourage them to make more purchases in the future. */ 

SELECT * FROM
(SELECT orders.customer_id "ID", customer.customer_name, SUM(product_quantity * product_price) AS amount 
FROM order_details 
INNER JOIN orders 
ON order_details.order_no = orders.order_no
INNER JOIN customer
ON orders.customer_id = customer.customer_id
WHERE orders.payment_date BETWEEN SYSDATE - INTERVAL '3' MONTH AND SYSDATE AND orders.order_status = 'Completed'
GROUP BY orders.customer_id, customer.customer_name
ORDER BY amount DESC)
WHERE ROWNUM <= 3;

/* Query 4 Delivery Rate of a Delivery Crew in A Month */
/* The query above determines the number of delivered orders and the delivery rate of a delivery crew in one month by joining employee and delivery tables. 
The employee ID, employee name, number of orders and delivery rate were displayed. 
The query filters the results to only include the specific employee ID and employee name during a certain period. 
The total number of orders is calculated with 'Delivered' status and delivery date between the days in February 2023. 
Then, the delivery rate is calculated by dividing the total delivered orders by a specific delivery crew with total delivery, which uses the 'HIT' delivery service.
*/

SELECT e.employee_id, e.employee_name, COUNT(*) AS Number_Of_Orders,
	ROUND (SUM (CASE when d.delivery_status = 'Delivered' THEN 1 ELSE 0 END) / 
(SELECT COUNT (*) FROM delivery WHERE delivery_service = 'HIT'), 2) 
	AS Delivery_Rate
FROM employee e
INNER JOIN delivery d ON e.employee_id = d.employee_id
WHERE d.delivery_date BETWEEN '01-FEB-2023' AND '28-FEB-2023'	
GROUP BY e.employee_id, e.employee_name
ORDER BY delivery_rate DESC;

/* Query 5 Cumulative Sales of Each Day in February 2023 */
/*Common Table Expression is used to define daily_sales and cumulative_sales. daily_sales expression is used to calculate the daily sales in February 2023 
by joining the orders and order details tables. Orders with ‘completed’ status only will be included and grouped by order date. 
cumulative_sales expression is used to compute the cumulative sales for each day with the ‘SUM’ and ‘OVER’ functions. 
The rank is assigned to each day based on the sales using the ‘RANK’ function. 
Last, the columns selected were grouped by date and sales and arranged according to the date.
*/

WITH daily_sales AS (
SELECT o.order_date AS "DATE", SUM(od.product_quantity * od.product_price) AS SALES
	FROM orders o
	JOIN order_details od ON o.order_No = od.order_no
	WHERE o.order_status = 'Completed' 
	AND EXTRACT (YEAR FROM o.order_date) = 2023
AND EXTRACT (MONTH FROM o.order_date) = 2
	GROUP BY o.order_date),
cumulative_sales AS (
	SELECT "DATE", SALES, SUM (sales) OVER (ORDER BY "DATE") AS CUMULATIVE_SALES,
		RANK () OVER (ORDER BY SUM (sales) DESC) AS RANK
	FROM daily_sales
GROUP BY "DATE", SALES
ORDER BY "DATE" ASC)
SELECT "DATE", SALES, CUMULATIVE_SALES, RANK
FROM cumulative_sales;
