-- regions with declining growth rate 
SELECT a.Country, a.Day,
		a.Revenue, b.Revenue AS PrevRevenue
	FROM(
    SELECT orders.ShipCountry AS Country, DATE(orders.OrderDate) AS Day,
		sum(orderdetails.UnitPrice * orderdetails.Quantity) AS Revenue
        FROM orders
        JOIN orderdetails ON orders.OrderID = orderdetails.OrderID
        GROUP BY orders.ShipCountry,Day) a
        LEFT JOIN (
			SELECT orders.ShipCountry AS Country, DATE(orders.OrderDate) AS Day,
		sum(orderdetails.UnitPrice * orderdetails.Quantity) AS Revenue
        FROM orders
        JOIN orderdetails ON orders.OrderID = orderdetails.OrderID
        GROUP BY orders.ShipCountry,Day) b
        ON a.Country = b.Country AND a.Day =date_add(b.Day, INTERVAL 1 Day)
        WHERE a.Revenue < b.Revenue
        ORDER BY a.Country, a.Day;   