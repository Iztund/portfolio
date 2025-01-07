 -- delivery_time by using the orderdate,shippeddate and getting the average delivery time using the AVG function and saving it as .csv
SELECT
	orders.CustomerID,
    count(orderdetails.OrderID) as TotalOrders,
	orders.ShipCountry,
	date_format(orders.OrderDate,'%Y/%m/%d') as order_date,
    date_format(orders.ShippedDate,'%Y/%m/%d') as shipped_date,
    datediff(orders.ShippedDate, orders.OrderDate) AS DeliveryTime
FROM
	Orderdetails
    JOIN orders ON orderdetails.OrderID = orders.OrderID
WHERE
	orders.ShippedDate IS NOT NULL
   AND  orders.OrderDate IS NOT NULL
    AND  orders.ShipCountry IS NOT NULL
GROUP BY orders.CustomerID, orders.OrderDate,shipped_date, orders.ShipCountry,DeliveryTime ORDER BY DeliveryTime DESC;
