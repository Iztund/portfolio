-- inactive customers (no orders in the last year )
SELECT
	customers.CustomerID,
    customers.CompanyName
FROM
	customers
    WHERE
     customers.CustomerID NOT IN(
		SELECT DISTINCT CustomerID
        FROM orders
        WHERE OrderDate >= date_sub(curdate(), interval 1 year)); -- then save the result as .csv

