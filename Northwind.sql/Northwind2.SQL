GROUP BY + HAVING

-- 1. Retorna un recompte de quants distribuidors (shippers) hi ha.
SELECT COUNT(ShipperID), CompanyName FROM Shippers
GROUP BY CompanyName;
-- 2. Calcula quants proveïdors (suppliers) hi ha per ciutat.
SELECT COUNT(SupplierID), City FROM Suppliers
GROUP BY City;

-- 3. Calcula quants productes són distribuits pel shipper número 3.
SELECT SUM(ProductID), supplierID, productName FROM Products
GROUP BY SupplierID;
correct:
SELECT  COUNT(ProductID) AS num_prod FROM orders AS o, OrderDetails AS od
WHERE o.OrderID = od.OrderID AS ShipVia = 3;

-- 4. Crea un informe amb el nom del distribuidor, nom del proveidor, nom de la categoria i el recompte de productes que coincideixen.
SELECT ProductID, supplierID AS Distribuidor, ProductName AS proveidor, CategoryID AS Categoria
FROM products GROUP BY ProductID;

-- 5. Mostra un informe amb el nom dels clients (customers.companyname) que han rebut més de tres paquets(condicio, operacio) provinents del shipper número 3.
SELECT CostumersID AS Nom_Client, ShipVia 
FROM orders  WHERE ShipVia >= 3 GROUP BY ShipVia;
taula: costumers y orders

-- 6. Mostra un recompte de les ordres que ha rebut cada customer ordenant pel recompte de forma descendent.
SELECT OrderID AS ordres, CostumerID AS costumer 
FROM orders ORDER BY ordres DESC;
-- 7. Mostra un recompte de clients (customers) per codi postal sempre i quant n'hi hagi més d'un al mateix codi postal.
SELECT
-- 8. Compta quants territoris diferents hi ha per cada regió. Mostra RegionDescription i el recompte.
SELECT r.RegionDescription, COUNT(t.territoriID)
FROM region AS r.territories AS t
WHERE r.regionID = t.regionID
GROUP BY  r.regionID;

-- 9. Calcula la mitjana de comandes (orders) servides per cada shipper. 
SELECT COUNT(O.orderID)/(SELECT COUNT(o.OrderID)FROM orders AS o2) *  
-- 10. Compta quants empleats hi ha per cada territori. Mostra TerritoryDescription i el recompte.

-- 11. Compta quants empleats hi ha per cada regió. Mostra RegionDescription i el recompte.

-- 12. Retorna només el nom de la regió (region.description) que té més empleats.

-- 13. Retorna el recompte de productes per categoria.

-- 14. Calcula quants productes pot servir cada distribuïdor. Mostra el CompanyName i el recompte de productes.

-- 15. Calcula quants empleats hi ha per Ciutat contractats a partir de l'any 1993.