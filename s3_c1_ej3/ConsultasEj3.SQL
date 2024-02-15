-- Selecciona los usuarios, que son subscritores asociados.
SELECT * FROM subcriptor WHERE es_asociado IS TRUE;

SELECT u.* FROM usuarios AS u, subscritor AS s
  WHERE u.id_usuario = s.id_subscritor AND s.es_asociado IS TRUE;

--	Selecciona los usuarios, que son clientes a los que no les gusta el formato electrónico.
SELECT id_cliente FROM cliente WHERE gusta_electronico IS FALSE;

SELECT u.* FROM usuario AS u, cliente AS c
  WHERE u.id_usuario = s.id_cliente AND c.gusta_electronico IS FALSE;

--	Selecciona las colecciones iniciadas antes del 1970 y terminadas antes del 2000.
SELECT nombre_coleccion FROM coleccion WHERE ano_inicio < 1970 AND ano_fin <2000;

--	Selecciona el identificador de los subscritores que han iniciado la colección con nombre ‘Minerales del Mundo’ des del 1r número.
SELECT sc.id_subscritor FROM subscritor_coleccion AS sc 
  WHERE sc.nombre_coleccion = 'Minerales del Mundo' AND num_inicio = 1;

--	Selecciona la id de los usuarios que no tengan un email válido (suponiendo que un mail válido tiene que contener una @).
SELECT id_usuario FROM usuario WHERE email  NOT LIKE '%@%';

--	Muestra las id’s de los regalos que pesan menos de 100g o más de 500g (suponiendo que el atributo peso se guarda en gramos).
SELECT id_regalo FROM regalo WHERE peso < 100 AND peso > 500;

--	Selecciona las entregas de enero del 2019.
SELECT * FROM entrega WHERE MONTH (fecha_entrega) = 1 AND YEAR(fecha_entrega) = 2019;

--	Selecciona las entregas del 31 de Diciembre de 2018 o del 1 de Enero del 2019.
SELECT * FROM entrega WHERE fecha_entrega = '2018-12-31' OR fecha_entrega= '2019-01-01';