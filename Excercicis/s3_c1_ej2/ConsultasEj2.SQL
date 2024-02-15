--  Selecciona el nombre y apellido de los árbitros.
SELECT  num_ss_arbitro FROM arbitro ;

--  Muestra el nombre de los equipos fundados antes del 1950 que tengan entrenador en la actualidad (suponiendo que si hay un valor válido en entrenador es que actualmente tienen entrenador)
SELECT nombre_equipo FROM equipo WHERE ano_fundacion < 1950 AND entrenador IS NOT NULL;

--  Selecciona el nombre y apellido de los jugadores con el dorsal 1 y su ubicación sea ‘Portero’ o con el dorsal 9 y su ubicación sea ‘Delantero’.
SELECT nombre, apellido1  FROM jugador WHERE dorsal = '1' OR '9' AND ubicacion LIKE 'Portero' OR 'Delantero';

--	Muestra el nombre, apellido y apellido2 en un único campo, separado por espacios de las personas que tengan una letra ‘c’ en su nombre. 
SELECT CONCAT (nombre,'', apellido,'', apellido2) FROM persona AS P WHERE nombre LIKE '%c%'

--	Muestra los partidos jugados durante un mes de Febrero (de cualquier año).
SELECT nombre_equipo FROM equipo WHERE MONTH (Fecha) = 2;

--	Muestra los partidos jugados hoy.
SELECT * FROM partido  WHERE fecha = CURRENT_DATE(); O ('2023/12/11');

--	Muestra los árbitros que han iniciado entre el 2000 y el 2005 que sean ´Técnico Informático’ de profesión.
SELECT * FROM arbitro WHERE ano_inicio BETWEEN 2000 AND 2005 AND profesion LIKE '%Tecnico Informatico%';

--	Muestra el nombre de los equipos y su presupuesto, reduciendo este último en 100.000 euros.
SELECT nombre_equipo, presupuesto-100000 AS presupuesto_reducido FROM equipo; 
