--1- Mostra totes les regions del planeta i el nombre d'idiomes que es parlen a cada una d'elles ordenat alfabèticament pel nom de la regió. (group by i join)
SELECT c.Region,  COUNT(cl.Language) AS num_lang FROM country c, countrylanguage AS cl
  WHERE c.Code = cl.CountryCode
    GROUP BY c.Region
    ORDER BY c.region ASC;

--2- Mostrar el districte de la ciutat amb més població. (subquery)
SELECT c1.District, c1.Name FROM city as c1
  WHERE c1.Population = (SELECT MAX(c2.population) FROM city AS c2);

--3- Mostrar codi, nom i continent del país de mida més petita. (subquery)
SELECT c1.code, c1.name, c1.continent FROM country AS c1
  WHERE c1.SurfaceArea = (SELECT MIN(c2.SurfaceArea) FROM country AS c2);

--4- Calcula l'idioma més parlat a cada país. Mostra nom de país i idioma ordenat per país i idioma. (group by i join entre countrylanguage i country)
SELECT c.name, cl.language FROM country AS c, countrylanguage AS cl
WHERE c.code = cl.CountryCode
   AND cl.Percentage = (SELECT MAX(c2.Percentage) FROM countrylanguage AS c2
   WHERE c2.CountryCode = cl.CountryCode)
GROUP BY c.Code
ORDER BY c.name, cl.Language;

--5- Mostra el nom del país on hi ha la ciutat amb menys població. (subquery)
    --opcio1:
SELECT c.name FROM country AS c, city AS ci WHERE
  c.code = ci.CountryCode AND ci.population =
    (SELECT MIN(ci2.population) FROM city AS ci2);

    --opcio2:
    SELECT c.name FROM country AS c, city AS ci WHERE c.code = ci.CountryCode
  AND ci.population <= ALL (SELECT ci2.population FROM city AS ci2);

--6- Mostra el nom (o noms) del país (o països) on es parlen el més idiomes. (group by per tal de contar el nombre d'idiomes diferents que es parlen per país i subquery per trobar el nom del país)
 SELECT c.name FROM country AS c, cl.language FROM countrylanguage AS cl WHERE c.code = cl.CountryCode
 AND (SELECT COUNT(c.name FROM country WHERE MAX(Percentage)))
 GROUP BY cl.language;


--7- Mostra els idiomes que es parlen en el país amb més superfície de terreny. (subquery)
SELECT cl.language 
FROM countrylanguage AS cl, country AS c 
 WHERE cl.CountryCode = c.Code 
 AND (SELECT MAX(c.SurfaceArea) 
  FROM country AS c);

--8- Mostra el districte de ciutat on es parlen més idiomes. (subquery)
SELECT ci.District 
 FROM city AS ci, countrylanguage AS cl 
 WHERE ci.CountryCode = cl.CountryCode
 AND (SELECT MAX(cl.language) FROM countrylanguage AS cl)
 ORDER BY ci.District ASC LIMIT 1;

--9- Mostra el nom del país (o països) on es parlen més idiomes oficials. (subquery i join)
SELECT c.Name, cl.languague FROM
 (country AS c JOIN countrylanguage AS cl ON c.CODE)
 WHERE c.Code = cl.CountryCode

--10- Mostra el nom de totes les ciutats del país (o països) que es va independitzar fa més temps. (subquery)


--11- El districte amb més ciutats (subquery)
SELECT 

--12- Els paisos on totes les seves ciutats (de la nostra BBDD) tinguin mes de 200.000 habitants.


--13- Totes les ciutats del Carib (tot i que e spot fer sense subconsulta, pensa una forma de fer-ho amb subquerys).

--14- La suma de població per continent (group by).

--15- La ciutat més gran d'Europa.

--16- El continent amb més població i el seu número.
SELECT c1.Continent, SUM(c1.Population) as TotalPoblacio
FROM Country as c1
GROUP BY c1.Continent
HAVING SUM(c1.Population) = (SELECT SUM(c2.Population)
    FROM Country c2
    GROUP BY c2.Continent
    ORDER BY SUM(c2.Population)
    LIMIT 1)
ORDER BY TotalPoblacio;

--17- El continent amb més ciutats  i el seu número.

--18- La regió amb un AVG d'habitants per país més gran.