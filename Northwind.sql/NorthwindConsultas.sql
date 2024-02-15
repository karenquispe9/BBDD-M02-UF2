--1. Fes una query en SQL que mostri totes les columnes de tots els productes per
pantalla. És a dir retorna totes les columnes i totes les files de la taula Products.
SELECT * FROM products;

--2. Mostra només la columna descripció de la taula Categories.
SELECT Description FROM categories

--3. Retorna la informació de tots els clients per pantalla usant la taula Customers.
SELECT * FROM customers;

--4. Mostra ara les columnes CategoryName i Description de la taula Categories.
SELECT CategoryName, Description FROM categories;

--5. Mostra ara només la columna descripció de la taula Categories i només per la
fila on CategoryName = “Grains/Cereals”.
SELECT Description FROM Categories WHERE CategoryName = 'Grains/Cereals'

--6. Desenvolupa una consulta que retorni tota la informació relativa a tots els
productes de la taula Products que tenen categoria = 1.
SELECT * FROM products WHERE categoryid = 1;

--7. Retorna el ProductID del producte que té “Filo Mix” per nom.
SELECT productid FROM products WHERE productname = 'Filo Mix'; 

--8. Mostra tota la info de tots els productes del SupplierID número 3. Usa la taula
Products.
SELECT * FROM `products` WHERE suppliersid = 3;

--9. Retorna tots els productes de la categoria 2 que tenen un preu > 20.
SELECT * FROM products WHERE categoryid = 2 AND UnitPrice >20;

--10.Fes una query que retorni les dades de tots els clients alemanys.
SELECT * FROM customers WHERE country = 'Germany';

--11.Retorna el nom i la data de naixement de l’empleat Steven Buchanan usant la
taula Employees.
SELECT FirstName, BirthDate FROM employees WHERE LastName LIKE 'Buchanan';

--12.Volem un llistat dels noms de tots els proveïdors japonesos. Usa la taula
Suppliers.
SELECT CompanyName FROM suppliers WHERE country LIKE 'Japan';

--13.Volem ara un llistat de les persones de contacte dels proveïdors britànics i el seu telèfon. Usa la taula Suppliers.
SELECT ContactName, Phone, Country FROM Suppliers WHERE country LIKE 'UK';

--14.Troba el nom de l’empresa d’enviaments que té el telèfon = (503) 555-3199. Usa
la taula Shippers.
SELECT CompanyName FROM Shippers WHERE phone = '(503) 555-3199';

--15.Mostra el preu i el pes del ProductID = 69.
SELECT UnitPrice, QuantityPerUnit FROM products WHERE ProductID = '69';

--16.Retorna un llistat de tota la informació de tots els clients ordenats pel país de
procedència alfabèticament.
SELECT * FROM Customers ORDER BY country ASC;            
ASC- ORDENA ALFABETICAMENTE LA COLUMNA SELECCIONADA  


--17.Fes el recompte de quants productes hi ha de la categoria 2 que tenen un preu > 20.
SELECT COUTN (ProductID) 
FROM products 
WHERE Category = 2 AND UnitPrice > 20;

--18.Fes una query que retorni la xifra del producte més car de la taula Products.
SELECT MAX(UnitPrice) FROM products 

SELECT MAX(UnitPrice) FROM products 
ORDER BY UnitPrice DESC LIMIT 1;

--19.Retorna el preu mig de la taula Products.
SELECT  AVG(UnitPrice) FROM products;

--20.Mostra la data de la primera l’ordre creada. Usa la taula Orders.
SELECT MIN(orderDate) AS primera_orden_creada
FROM Orders;


--21.Mostra el preu de la Order 10255 (Price x quantitat de tots els productes).
SELECT SUM UnitPrice* AS precio_total
FROM OrderDetails od
WHERE Orders o ON od.orderNumber = o.orderNumber
AND o.orderNumber = 10255;


--22.Mostra el numero de productes de cada Order.
SELECT COUNT(ProductID), orderID
FROM OrderDetails
GROUP BY orderID;


--23.Mostra el numero de productes de cada Order sempre que siguin mes de 3.
SELECT COUNT(ProductID), orderID  FROM OrderDetails
GROUP BY orderID
HAVING COUNT(productID) > 3;

--24.Mostra els suppliers de les Ciutats que comencen per B que tenen productes amb un preu major a 50.
SELECT * FROM Suppliers AS s, Products AS p
WHERE s.SupplierID = p.SupplierID
 LIKE 'B%' AND UnitPrice > 50;


--25.Mostra els clients d’un país amb més de 7 lletres.
SELECT * FROM Customers
WHERE LENGTH(Country) > 7;


--26.Mostra les ordres d’avui.
SELECT * FROM Orders
WHERE OrderDate = CURRENT_DATE();


--27.Mostra les ordres de febrer del 1997 del empleat 2.
SELECT * FROM Orders
WHERE YEAR(orderDate) = 1997
  AND MONTH(orderDate) = 2
  AND employeeID = 2;


--28.Mostra la mitja de ordres per any.
SELECT YEAR(orderDate) AS anio, AVG(1) AS mitja_ordres_per_any
FROM Orders
GROUP BY YEAR(orderDate);


--29.Mostra el seu preu del producte més barat i el més car (2 Selects separats).
SELECT COUNT(*)
/ (SELECT COUNT(DISTINCT YEAR (OrderDate)) FROM Orders)
GROUP BY productName;

SELECT productName, MAX(price) AS precio_mas_alto
FROM Products
GROUP BY productName;
clase:
SELECT MAX(UnitPrice) FROM Products
SELECT MIN(UnitPrice) FROM Products

SELECT CONCAT('Preu Max: ', MAX(UnitPrice) AS )
(SELECT CONCAT ('Preu Min: ', MIN(UnitPrice)) FROM Products);

--30.Les ID’s de les Ordres de 4 productes diferents o més indicant també el nom del client.
SELECT CompanyName, ContactName, o.orderID
FROM OrderDetails AS od, Orders AS o, Customers AS c
WHERE od.OrderID = o.OrderID
  AND o.Customers = c.CustomersID
    GROUP BY o.OrderID
    HAVING COUNT(ProductID) >= 4;


--31.Mostra l’ordre amb més quantitat de productes.
SELECT o.*
FROM OrderDetails AS od, orders AS o
    WHERE od.orderID = od.orderID
    GROUP BY o.orderID
) AS subconsulta
ORDER BY cantidad_productos DESC
LIMIT 1;
+


--32.Mostra l’empleat més gran i el més petit (2 Selects separats).
SELECT * FROM Employees
ORDER BY birthDate ASC LIMIT 1;

SELECT * FROM Employees
ORDER BY birthDate DESC LIMIT 1;

--33.Retorna l’adreça, ciutat, codi postal i país de tots els clients (tot junts amb un camp).
SELECT
    CONCAT(Address, ', ', City, ', ', PostalCode, ', ', country) AS direccion_completa
FROM Customers;
