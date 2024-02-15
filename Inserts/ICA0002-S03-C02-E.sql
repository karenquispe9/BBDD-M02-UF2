EJERCICIO1

--Haz dos inserciones como mínimo en todas las tablas de la base de datos usando el método mutli-insert.
INSERT INTO temporada VALUES 
(4, 02-05-2020, 10-09-2020), 
(6, 11-10-2020, 25-12-2021);

INSERT INTO federacion VALUES 
('Galleta', 08-03-2021, 'Juan'), 
('Brocoli', 03-08-2021);

INSERT INTO competicion VALUES 
('Race', 'Televisa'), 
('Tace', 'telecinco');

INSERT INTO equipo VALUES 
('Azul', 'Sevilla', 'Oscar', NULL), 
('Rojo', 'Malaga', 'Teodoro', NULL);

INSERT INTO Clasificacion VALUES 
(4, 'Race', 'Azul', 3), 
(6, 'Tace', 'Rojo', 6);

--Actualiza la posición de todos los clasificados a 0 para las temporadas con año 2019 en la fecha de inicio.
UPDATE clasificacion AS c, temporada AS t 
 SET posicion = 0
 WHERE t.id_temporada = c.id_temporada
 AND YEAR(fecha_inicio) = 2019;

--Actualiza la fecha de creación de una federación que has creado a la fecha del día de hoy.
UPDATE Federacion
 SET fecha_creacion = CURRENT_DATE()
 WHERE nombre_federacion = 'Federacion Espanyola de Futbol';

--Borra el valor nombre_TV de la competición ‘Champions’.
UPDATE competicion
 SET nombre_TV = NULL
 WHERE nombre_competicion = 'Champions';

--Borra todas las clasificaciones.
DELETE FROM clasificacion;


EJERCICIO2

--Haz una inserción como mínimo en todas las tablas de la base de datos (excepto equipo donde harás dos) usando la inserción indirecta. 
INSERT INTO persona (num_ss, nombre, apellido1, apellido2) VALUES+
(1, 'Alejandro', 'Hernández', 'Hernández');


INSERT INTO arbitro (num_ss_arbitro, num_colegiado, ano_inicio, profesion) VALUES
(1, 1234, 2000, 'CarpinterO');

INSERT INTO equipo (nombre, ano_fundacion, presupuesto, presidente, entrenador, direccion) VALUES

--Actualiza el dorsal a 1 y ubicación a ‘Portero’ para el jugador que has creado.

--Actualiza el valor del presidente de un equipo que has creado con el valor de su entrenador.

--Actualiza el presupuesto del equipo en +1 millón del equipo con el primer equipo encontrado ordenados de la A a la Z por su nombre.

--Borra el equipo que se encuentre primero ordenándolos de la Z a la A por su nombre.


EJERCICIO3


--Haz una inserción como mínimo en todas las tablas de la base de datos usando una inserción directa.

--Actualiza el atributo es_asociado del subscritor añadido a FALSE.

--Borra los regalos con un peso mayor a 5000g (suponemos que el peso está en gramos).

--Borra el numero de la tarjeta del usuario añadido.

--Borra las compras de entregas de los clientes.

