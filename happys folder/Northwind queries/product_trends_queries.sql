-- -- we get the sales trends by products over time by selecting the products,untiprice,ordersdate, total quantity
SELECT
	products.ProductName,
    orderdetails.UnitPrice,
    date_format(orders.OrderDate, '%d/%m/%Y') as orders_date,
    sum(orderdetails.Quantity) AS TotalQuantity,
    sum(orderdetails.UnitPrice * orderdetails.Quantity) AS Revenue
FROM
	orderdetails
JOIN
	orders ON orderdetails.OrderID = orders.OrderID
JOIN
	products ON orderdetails.ProductID = products.ProductID
GROUP BY
	products.ProductName,orderdetails.UnitPrice,orders.OrderDate
ORDER BY
	orders_date, Revenue ; -- then save the result as .csv