--7- Mostra els idiomes que es parlen en el país amb més superfície de terreny. (subquery)
SELECT cl.language FROM countrylanguage AS cl, country AS c 
 WHERE cl.CountryCode = c.Code 
 AND (SELECT MAX(c.SurfaceArea) FROM country AS c);

 --11- El districte amb més ciutats (subquery)
SELECT c.District FROM city AS c, countrylanguage AS cl
WHERE c.CountryCode = cl.CountryCode
AND (SELECT MAX(c.District) FROM country AS c)
ORDER BY c.District ASC AND LIMIT 1 ;

--14- La suma de població per continent (group by).
SELECT c1.Continent, 
       (SELECT SUM(c2.Population) 
        FROM Country c2 
        WHERE c2.Continent = c1.Continent) as TotalPoblacio
FROM Country as c1
GROUP BY c1.Continent;



