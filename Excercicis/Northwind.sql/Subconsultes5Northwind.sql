--1- Per tal d'identificar els productes que no s'estàn venent gaire i comparar-los amb els que sí que s'estàn venent, necessitem un llistat 
--amb l'informació dels productes dels quals se n'han venut menys de 1000 unitats i també dels que se n'han venut més de 2000.
SELECT 
    ProductName, 
    (SELECT SUM(Quantity) 
    FROM OrderDetails 
    WHERE ProductID = Products.ProductID) as TotalVendido
FROM Products
HAVING TotalVendido < 1000 OR TotalVendido > 2000;

--4- Les orders amb més de productes diferents.
SELECT OrderID, COUNT(ProductID) as NumProducts
FROM OrderDetails
GROUP BY OrderID
HAVING COUNT(ProductID) > (SELECT AVG(OrderCount) 
     FROM (SELECT OrderID, COUNT(ProductID) as OrderCount 
     FROM OrderDetails GROUP BY OrderID) as OrderCounts);
                                 
--5- Els empleats amb menys orders procesades.
SELECT EmployeeID, LastName, FirstName, 
 (SELECT COUNT(*) 
   FROM Orders 
   WHERE employees.EmployeeID = Orders.EmployeeID) as NumOrders
FROM employees
ORDER BY NumOrders ASC
LIMIT 1;
--6- Lesorders amb clients de New York y/o Suppliers de New York.

--7- La categoria amb més i la categoria amb menys productes.
SELECT CategoryName, COUNT(ProductID) AS NumberOfProducts 
FROM Products 
JOIN Categories 
ON Products.CategoryID = Categories.CategoryID 
GROUP BY CategoryName 
ORDER BY NumberOfProducts DESC, NumberOfProducts ASC;


--12- Retorna el nom de l'empleat que ha fet més orders de tots.
SELECT * 
FROM Employees 
WHERE EmployeeID = 
 (SELECT EmployeeID 
    FROM Orders 
    GROUP BY EmployeeID 
    ORDER BY COUNT(OrderID) DESC LIMIT 1)
;
