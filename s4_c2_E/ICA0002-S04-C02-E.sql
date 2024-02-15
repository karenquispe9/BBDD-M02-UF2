EJERCICIO1

--Selecciona el nombre del equipo y su ciudad que ha quedado en 1º lugar, en la competición ‘La Liga’ en la temporada con identificador 3.
SELECT e.nombre_equipo, e.ciudad, c.posicion, c.nombre_competicion, c.id_temporada 
 FROM (Equipo AS e JOIN Clasificacion AS c  
 WHERE e.nombre_equipo = c.nombre_equipo) 
 AND c.posicion = 3 
 AND c.nombre_competicion LIKE 'La Liga' 
 AND c.id_temporada = 3;

--Muestra los equipos que han quedado entre los tres primeros clasificados en la competición ‘Champions’ en la temporada con id 5.
SELECT e.nombre_equipo, c.posicion
 FROM Equipo AS e Clasificacion AS c 
 WHERE e.nombre_equipo=c.nombre_equipo 
 AND c.posicion BETWEEN 1 AND 3 
 AND c.nombre_competicion LIKE 'Champions' 
 AND c.id_temporada = 5
 GROUP BY e.nombre_equipo;

--Muestra eL nombre de los equipos junto con el nombre de sus federaciones, aunque alguno de ellos no tenga federación.
SELECT nombre_equipo, nombre_federacion FROM Equipo
 WHERE nombre_federacion NOT NULL OR NULL
 GROUP BY nombre_equipo;

--Muestra en nombre de los equipos junto con el nombre de sus federaciones, aunque alguno de ellos no tenga federación, así como también las federaciones sin equipos.
SELECT e.nombre_equipo, f.nombre_federacion 
 FROM Equipo AS e JOIN Federacion AS f 
 WHERE f.nombre_federacion = e.nombre_federacion
 AND e.nombre_equipo IS NOT NULL OR NULL
 AND e.nombre_federacion IS NOT NULL OR NULL;



EJERCICIO2

--Muestra el nombre y apellido de los jugadores ordenados por el apellido de forma ascendente y por el nombre de forma descendente.
SELECT p.nombre, p.apellido1 
 FROM  Persona AS p, Jugador AS jugador
 WHERE p.num_ss = j.num_ss_jugador
 AND p.apellido1 ASC
 AND p.nombre DESC;

--Selecciona el nombre y apellido de los jugadores con el dorsal 1 y su ubicación sea ‘Portero’ o con el dorsal 9 y su ubicación sea ‘Delantero’.
SELECT p.nombre, p.apellido1, j.dorsal, j.ubicacion 
 FROM Persona AS p JOIN Jugador AS j
 WHERE j.dorsal = 1 OR 9 
 AND j.ubicacion LIKE 'Portero' OR 'Delantero';

--Muestra en num_ss_jugador de los jugadores junto con el nombre de sus equipos, aunque alguno de ellos no tenga equipo.
SELECT j.num_ss_jugador, j.nombre_equipo
 FROM Jugador AS j
 WHERE j.nombre_equipo IS NOT NULL OR NULL;

--Muestra en num_ss_jugador de los jugadores junto con el nombre de sus equipos, aunque alguno de ellos no tenga equipo, así como también los equipos sin jugadores.
SELECT j.num_ss_jugador, j.nombre_equipo
 FROM Juagadores AS j 
 WHERE j.nombre_equipo IS NOT NULL OR NULL
 ...;


EJERCICIO3

--Selecciona las entregas con más de dos regalos.
SELECT e.fecha_entrega, e.nombre_coleccion, r.id_regalo, r.nombre_coleccion
 FROM Entrega AS e JOIN Regalo AS r 
 WHERE e.fecha_entrega = r.fecha_entrega
 AND r.nombre_coleccion > 2;

--Selecciona las colecciones donde el peso total de sus regalos sea superior a 5000g.
SELECT r.nombre_coleccion,

--Selecciona los usuarios, que son subscritores asociados.
SELECT u.id_usuario, s.es_asociado
 FROM Usuario AS u JOIN Subscriptos AS s 
 WHERE s.es_asociado = TRUE;

--Selecciona los usuarios, que son clientes a los que no les gusta el formato electrónico
