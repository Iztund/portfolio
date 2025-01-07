-- using the freight to calculate the profitability of the sales and saving the result as .csv file 
SELECT
	orders.OrderID,
    cast(sum(orderdetails.UnitPrice * orderdetails.quantity) as DECIMAL(10,2)) AS TotalRevenue,
    orders.Freight,
    (cast(sum(orderdetails.UnitPrice * orderdetails.quantity) as DECIMAL(10,2))-orders.Freight) AS Profit
FROM orders
	JOIN
		orderdetails ON orders.OrderID = orderdetails.OrderID
GROUP BY orders.OrderID;