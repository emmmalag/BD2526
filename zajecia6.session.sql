#5.1
SELECT OrderID, SUM(Quantity) as 'liczba produktów', SUM(UnitPrice) as kwota FROM northwind.`Order Details` GROUP BY OrderID ORDER BY kwota DESC LIMIT 1;

#5.2
SELECT ContactName, CustomerID FROM northwind.Customers WHERE CustomerID IN
    (SELECT CustomerID FROM northwind.Orders HAVING COUNT(DISTINCT OrderID) > 20)
GROUP BY ContactName; 

#5.3
SELECT CONCAT(ROUND((SELECT COUNT(ProductID) FROM northwind.Products WHERE Discontinued = 1)/(SELECT COUNT(ProductID) FROM northwind.Products)*100), '%') as procent FROM northwind.Products GROUP BY procent;
 
#5.4
SELECT Country, (SUM(CASE WHEN ContactName LIKE '%a' OR ContactName LIKE '%a ' THEN 1 ELSE 0 END))/(COUNT(*)) as odsetek 
FROM northwind.Customers WHERE Country IS NOT NULL GROUP BY Country ORDER BY odsetek DESC, Country ASC LIMIT 5;
