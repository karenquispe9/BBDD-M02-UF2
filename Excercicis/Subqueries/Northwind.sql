--1- Per tal d'identificar els productes que no s'estàn venent gaire i comparar-los amb els que sí que s'estàn venent, necessitem un llistat 
--amb l'informació dels productes dels quals se n'han venut menys de 1000 unitats i també dels que se n'han venut més de 2000.
SELECT 
    ProductName, 
    (SELECT SUM(Quantity) 
    FROM OrderDetails 
    WHERE ProductID = Products.ProductID) as TotalUnitsSold
FROM Products
HAVING TotalUnitsSold < 1000 OR TotalUnitsSold > 2000;

--2- Volem saber els treballadors que han generat més orders que el treballador número 7.
SELECT EmployeeID 
FROM Orders 
GROUP BY EmployeeID 
HAVING COUNT(OrderID) > 
 (SELECT COUNT(OrderID) 
   FROM Orders 
   WHERE EmployeeID = 7)
;


--3- Volem saber si s'han servir més orders amb el shipper "Speedy Express" o amb el shipper "Federal Shipping".
SELECT ShipperName, COUNT(OrderID) AS NumberOfOrders 
 FROM Orders 
 JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID 
 WHERE ShipperName IN ('Speedy Express', 'Federal Shipping') 
 GROUP BY ShipperName
;


--4- Les orders amb més de productes diferents.
SELECT OrderID, COUNT(ProductID) as NumProducts
FROM OrderDetails
GROUP BY OrderID
HAVING COUNT(ProductID) > (SELECT AVG(OrderCount) 
     FROM (SELECT OrderID, COUNT(ProductID) as OrderCount 
     FROM OrderDetails GROUP BY OrderID) as OrderCounts);


--5- Els empleats amb menys orders procesades.
SELECT EmployeeID, COUNT(OrderID) AS NumberOfOrders 
FROM Orders 
GROUP BY EmployeeID 
ORDER BY NumberOfOrders ASC;


--6- Lesorders amb clients de New York y/o Suppliers de New York.
SELECT OrderID 
FROM Orders 
WHERE CustomerID IN 
 (SELECT CustomerID 
 FROM Customers 
 WHERE City = 'New York') OR 
SupplierID IN 
 (SELECT SupplierID 
 FROM Suppliers 
 WHERE City = 'New York');


--7- La categoria amb més i la categoria amb menys productes.
SELECT CategoryName, COUNT(ProductID) AS NumberOfProducts 
FROM Products 
JOIN Categories ON Products.CategoryID = Categories.CategoryID 
GROUP BY CategoryName 
ORDER BY NumberOfProducts DESC, NumberOfProducts ASC;


--8- Busca quines son els territoris dels empleats que han estudiat psicologia (es pot fer sense subconsultes).
SELECT TerritoryDescription 
FROM EmployeeTerritories 
JOIN Employees ON EmployeeTerritories.EmployeeID = Employees.EmployeeID 
WHERE Notes 
LIKE '%psicologia%';


--9- Busca els productes de preu inferior a 15 i que pertànyen a la categoria que té el màxim de productes.
SELECT ProductName 
FROM Products 
WHERE UnitPrice < 15 
AND CategoryID = (SELECT CategoryID 
 FROM Categories 
 JOIN Products ON Categories.CategoryID = Products.CategoryID 
 GROUP BY CategoryID 
 ORDER BY COUNT(ProductID) DESC LIMIT 1);


--10- Conta quantes ordres diferents existeixen sobre productes amb el màxim de descompte.
SELECT COUNT(DISTINCT OrderID) 
FROM Order_Details
WHERE Discount = (SELECT MAX(Discount)
 FROM Order_Details);


--11- Dona el nom dels productes que pertànyen a la categoria del qual el promig del preu dels seus productes és superior a 50.
SELECT ProductName 
FROM Products 
WHERE CategoryID IN 
 (SELECT CategoryID 
 FROM Categories 
 JOIN Products ON Categories.CategoryID = Products.CategoryID 
 GROUP BY CategoryID 
 HAVING AVG(UnitPrice) > 50);

--12- Retorna el nom de l'empleat que ha fet més orders de tots.
SELECT FirstName, LastName 
FROM Employees 
WHERE EmployeeID = (SELECT EmployeeID 
 FROM Orders 
 GROUP BY EmployeeID 
 ORDER BY COUNT(OrderID) DESC LIMIT 1);


