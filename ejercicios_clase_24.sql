/*
 PRÁCTICA 1
 Realiza las siguientes consultas en SQL.
 28. ¿Qué comercios distribuyen Windows?
 29. Genera un listado de los programas y cantidades que se han distribuido a El
 Corte Inglés de Madrid.
 30. ¿Qué fabricante ha desarrollado Freddy Hardest?
 31. Selecciona el nombre de los programas que se registran por Internet.
 32. Selecciona el nombre de las personas que se registran por Internet.
 33. ¿Qué medios ha utilizado para registrarse Pepe Pérez?
 34. ¿Qué usuarios han optado por Internet como medio de registro?
 35. ¿Qué programas han recibido registros por tarjeta postal?
 36. ¿En qué localidades se han vendido productos que se han registrado por
 Internet?
 37. Obtén un listado de los nombres de las personas que se han registrado por
 Internet, junto al nombre de los programas para los que ha efectuado el
 registro.
 38. Genera un listado en el que aparezca cada cliente junto al programa que ha
 registrado, el medio con el que lo ha hecho y el comercio en el que lo ha
 adquirido.
 39. Genera un listado con las ciudades en las que se pueden obtener los
 productos de Oracle.
 40. Obtén el nombre de los usuarios que han registrado Access XP.
 41. Nombre de aquellos fabricantes cuyo país es el mismo que ʻOracleʼ.
 (Subconsulta).
 42. Nombre de aquellos clientes que tienen la misma edad que Pepe Pérez.
 (Subconsulta).
 43. Genera un listado con los comercios que tienen su sede en la misma ciudad
 que tiene el comercio ʻFNACʼ. (Subconsulta).
*/
--  1. Averigua el DNI de todos los clientes.
SELECT * FROM cliente;

-- 2. Consulta todos los datos de todos los programas.
SELECT * FROM programa;

-- 3. Obtén un listado con los nombres de todos los programas.
SELECT nombre FROM programa;

-- 4. Genera una lista con todos los comercios.
SELECT * FROM comercio;

-- 5. Genera una lista de las ciudades con establecimientos donde se venden
-- programas, sin que aparezcan valores duplicados (utiliza DISTINCT).
SELECT DISTINCT ciudad FROM comercio;

-- 6. Obtén una lista con los nombres de programas, sin que aparezcan valores
-- duplicados (utiliza DISTINCT).
SELECT DISTINCT nombre FROM programa;

-- 7. Obtén el DNI más 4 de todos los clientes.
SELECT dni+4, nombre, edad FROM cliente;

-- 8. Haz un listado con los códigos de los programas multiplicados por 7.
SELECT codigo*7, nombre, version FROM programa;

-- 9. ¿Cuáles son los programas cuyo código es inferior o igual a 10?
SELECT * FROM programa WHERE codigo <= 10;

-- 10.¿Cuál es el programa cuyo código es 11?
SELECT * FROM programa WHERE codigo = 11;

-- 11. ¿Qué fabricantes son de Estados Unidos?
SELECT * FROM fabricante WHERE pais = 'Estados Unidos';

-- 12. ¿Cuáles son los fabricantes no españoles? Utilizar el operador IN.
SELECT * FROM fabricante WHERE pais NOT IN ('España');

-- 13. Obtén un listado con los códigos de las distintas versiones de Windows.
SELECT * FROM programa WHERE nombre IN ('Windows');

-- 14. ¿En qué ciudades comercializa programas El Corte Inglés
SELECT * FROM comercio WHERE nombre IN ('El Corte Inglés');

-- 15. ¿Qué otros comercios hay, además de El Corte Inglés? Utilizar el operador IN.
SELECT * FROM comercio WHERE nombre NOT IN ('El Corte Inglés');

-- 16. Genera una lista con los códigos de las distintas versiones de Windows y
-- Access. Utilizar el operador IN.
SELECT * FROM programa WHERE nombre IN ('Windows','Access');

/* 17. Obtén un listado que incluya los nombres de los clientes de edades
 comprendidas entre 10 y 25 y de los mayores de 50 años. Da una solución
 con BETWEEN y otra sin BETWEEN.*/

-- Solución con BETWEEN
SELECT * FROM cliente WHERE edad BETWEEN 10 and 25 or edad > 50;

-- Solución sin BETWEEN 
SELECT * FROM cliente WHERE edad >= 10 and edad <=25;

-- 18. Saca un listado con los comercios de Sevilla y Madrid. No se admiten valores duplicados.
SELECT DISTINCT nombre FROM comercio WHERE ciudad IN ('Sevilla', 'Madrid');

-- 19. ¿Qué clientes terminan su nombre en la letra “o”?
SELECT * FROM cliente WHERE nombre LIKE "%o";

-- 20. ¿Qué clientes terminan su nombre en la letra “o” y, además, son mayores de 30 años?
select * from cliente where nombre like "%o" and edad > 30;

-- 21. Obtén un listado en el que aparezcan los programas cuya versión finalice por
-- una letra i, o cuyo nombre comience por una A o por una W.
select * from programa where version like "%i" or nombre like "A%" or nombre like "W%";

-- 22. Obtén un listado en el que aparezcan los programas cuya versión finalice por
-- una letra i, o cuyo nombre comience por una A y termine por una S.
select * from programa where version like "%i" or (nombre like "A%" and nombre like "%s");

-- 23. Obtén un listado en el que aparezcan los programas cuya versión finalice por
-- una letra i, y cuyo nombre no comience por una A.
select * from programa where version like "%i" and nombre not like "A%";

-- 24. Obtén una lista de empresas por orden alfabético ascendente.
select * from fabricante order by nombre asc;

-- 25. Genera un listado de empresas por orden alfabético descendente.
select * from fabricante order by nombre desc;

-- 26. Obtén un listado de programas por orden de versión
select * from programa order by version;

-- 27. Genera un listado de los programas que desarrolla Oracle.
select fabricante.nombre, programa.nombre
from fabricante, programa, desarrolla
where fabricante.id_fab = desarrolla.id_fab and desarrolla.codigo=programa.codigo and fabricante.nombre = 'Oracle';