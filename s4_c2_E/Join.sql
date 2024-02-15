EJERCICIO 01
--Selecciona el nombre del equipo y su ciudad que ha quedado en 1º lugar, en la competición ‘La Liga’ en la temporada con identificador 3.
SELECT 
clasificacion: * 
equipo:ciudad

SELECT e.nombre_equipo, e.ciudad FROM (equipo AS e JOIN clasificacion AS c ON e.nombre_equipo = c.nombre_equipo)
    WHERE posicion = 1 AND nombre_competicion = 'La Liga' AND id_temporada = 3;

--Muestra los equipos que han quedado entre los tres primeros clasificados en la competición ‘Champions’ en la temporada con id 5.


SELECT e.* FROM (equipo AS e JOIN clasificacion AS c ON e.nombre_equipo = c.nombre_equipo)
    WHERE posicion <= 3 AND nombre_competicion = 'Champions' AND id_temporada = 5;

--Muestra en nombre de los equipos junto con el nombre de sus federaciones, aunque alguno de ellos no tenga federación.
 

SELECT e.nombre_equipo, f.nombre_federacion
  FROM (equipo AS e LEFT JOIN federacion AS f ON e.nombre_federacion = f.nombre_federacion);

--Muestra en nombre de los equipos junto con el nombre de sus federaciones, aunque alguno de ellos no tenga federación, así como también las federaciones sin equipos.


(SELECT e.nombre_equipo, f.nombre_federacion
  FROM (equipo AS e LEFT JOIN federacion AS f ON e.nombre_federacion = f.nombre_federacion))
UNION
(SELECT e.nombre_equipo, f.nombre_federacion
  FROM (equipo AS e RIGHT JOIN federacion AS f ON e.nombre_federacion = f.nombre_federacion));



