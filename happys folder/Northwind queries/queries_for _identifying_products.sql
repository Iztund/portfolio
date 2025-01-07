-- I renamed the `order details` as orderdetails table for easier use

-- We select the products,category, Totalrevenue(sum(orderdetails.UnitPrice * orderdetails.Quantity) to get 
-- products contributing to the revenue generation
SELECT 
  products.ProductName,
  categories.CategoryName,
  sum(orderdetails.UnitPrice * orderdetails.Quantity) AS Revenue
FROM 
	orderdetails
JOIN
		products ON orderdetails.ProductID = products.ProductID
JOIN
	categories ON products.CategoryID = categories.CategoryID
GROUP BY
	products.ProductName, categories.CategoryName,orderdetails.UnitPrice
ORDER BY
Revenue ASC; -- then save the result as .csv 