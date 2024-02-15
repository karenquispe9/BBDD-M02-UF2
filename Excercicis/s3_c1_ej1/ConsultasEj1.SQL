--Selecciona el identificador de las temporadas que han empezado entre el 2010 y el 2015.
SELECT id_temporada FROM temporada WHERE YEAR (fecha_inicio>) BETWEEN 2010 AND 2015;

--Selecciona las temporadas que no han terminado (suponiendo que una temporada que no ha terminado tendrá el valor de ese atributo a NULL).
SELECT id_temporada FROM temporada WHERE fecha_fin = 'NULL';

--Selecciona el nombre de las competiciones con un nombre de televisión de más de 5 letras.
SELECT nombre_competicion FROM competicion WHERE nombre_tv LIKE '_ _ _ _ _'; 

--Selecciona el nombre de las competiciones con un nombre de televisión que empiece con el texto ‘SKY’.
SELECT nombre_competicion FROM competicion WHERE nombre_tv LIKE 'SKY%';

--Selecciona las ciudades donde tenemos equipos, evitando tener resultados repetidos.
SELECT DISTINCT  (ciudad) FROM equipo;

--Selecciona el nombre del equipo y su ciudad que ha quedado en 1º lugar, en la competición ‘La Liga’ en la temporada con identificador 3.
SELECT  nombre_equipo, ciudad FROM clasificacion WHERE posicion = '1' AND nombre_competicion LIKE  'La Liga' AND id_temporada = 3;

--Selecciona el nombre de los equipos de Madrid, Barcelona o Sevilla
SELECT nombre_equipo FROM equipo WHERE ciudad IN ('Madrid' OR 'Barcelona' OR 'Sevilla');

--Muestra los equipos que han quedado entre los tres primeros clasificados en la competición ‘Champions’ en la temporada con id 5.
SELECT pk_nombre_equipo 
FROM clasificacion 
WHERE posicion < 3 AND nombre_competicion ='Champions'AND id_temporada = 5;

