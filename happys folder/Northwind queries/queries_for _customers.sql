-- assessing the customers by revenue generation in descending order using the customerid, companyname
SELECT 
	customers.CustomerID,
    customers.CompanyName,
    cast(sum(orderdetails.UnitPrice * orderdetails.quantity) as DECIMAL(10,2)) AS TotalRevenue
FROM
	orderdetails
JOIN
	orders ON orderdetails.OrderID = orders.OrderID
JOIN 
	customers ON orders.CustomerID = customers.CustomerID
GROUP BY
	customers.CustomerID, customers.CompanyName
ORDER BY
	TotalRevenue DESC; -- then save the result as .csv
    