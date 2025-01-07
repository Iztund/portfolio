-- sales perfomance grouped by region by using shipcountry from orders table
SELECT
	orders.ShipCountry,
    cast(sum(orderdetails.UnitPrice * orderdetails.quantity) as DECIMAL(10,2)) AS Tot_Rev_per_region
FROM
	orders
JOIN
	orderdetails ON orders.OrderID = orderdetails.OrderID
 GROUP BY
	orders.ShipCountry
ORDER BY Tot_Rev_per_region desc;
-- then save the result as .csv