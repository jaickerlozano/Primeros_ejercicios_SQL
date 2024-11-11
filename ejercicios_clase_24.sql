/*
 PRÁCTICA 1
 Realiza las siguientes consultas en SQL.
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

-- 28. ¿Qué comercios distribuyen Windows?

select programa.codigo, programa.nombre, distribuye.cif, comercio.nombre
-- JOIN CON INNER JOIN
from programa inner join distribuye
on programa.codigo = distribuye.codigo
inner join comercio
on comercio.cif = distribuye.cif
where programa.nombre = 'Windows';

-- INNER JOIN CON WHERE / JOIN CON WHERE
select comercio.nombre from programa, distribuye, comercio
where programa.codigo = distribuye.codigo and comercio.cif = distribuye.cif and programa.nombre = 'Windows';

-- 29. Genera un listado de los programas y cantidades que se han distribuido a El Corte Inglés de Madrid.
select comercio.nombre, programa.nombre, distribuye.cantidad, comercio.ciudad
from programa, comercio, distribuye
where programa.codigo = distribuye.codigo and distribuye.cif = comercio.cif and comercio.nombre = 'El corte Inglés' and comercio.ciudad = 'Madrid';

-- 30. ¿Qué fabricante ha desarrollado Freddy Hardest?
select fabricante.nombre, programa.nombre
from fabricante, programa, desarrolla
where programa.codigo = desarrolla.codigo and desarrolla.id_fab = fabricante.id_fab and programa.nombre = 'Freddy Hardest';

-- 31. Selecciona el nombre de los programas que se registran por Internet.
select programa.nombre, registra.medio
from programa, registra
where programa.codigo = registra.codigo and registra.medio = 'Internet';

-- 32. Selecciona el nombre de las personas que se registran por Internet.
select cliente.nombre, registra.medio
from cliente, registra
where registra.dni = cliente.dni and registra.medio = 'Internet';

-- 33. ¿Qué medios ha utilizado para registrarse Pepe Pérez?
select cliente.nombre, registra.medio
from cliente, registra
where registra.dni = cliente.dni and cliente.nombre = 'Pepe Pérez';

-- 34. ¿Qué usuarios han optado por Internet como medio de registro?
select cliente.nombre, registra.medio
from cliente, registra
where registra.dni = cliente.dni and registra.medio = 'Internet';

-- 35. ¿Qué programas han recibido registros por tarjeta postal?
select programa.nombre, registra.medio
from programa, registra
where programa.codigo = registra.codigo and registra.medio = 'Tarjeta postal';

-- 36. ¿En qué localidades se han vendido productos que se han registrado por Internet?
select programa.nombre, comercio.ciudad, registra.medio
from programa, comercio, registra
where programa.codigo = registra.codigo and registra.cif = comercio.cif and registra.medio = 'Internet';

-- 37. Obtén un listado de los nombres de las personas que se han registrado por 
-- Internet, junto al nombre de los programas para los que ha efectuado el registro.
select cliente.nombre, programa.nombre, registra.medio
from cliente, registra, programa
where registra.dni = cliente.dni and programa.codigo = registra.codigo and registra.medio = 'Internet';

-- 38. Genera un listado en el que aparezca cada cliente junto al programa que ha 
-- registrado, el medio con el que lo ha hecho y el comercio en el que lo ha adquirido.
select cliente.nombre, programa.nombre, registra.medio, comercio.nombre
from cliente, programa, registra, comercio
where registra.dni=cliente.dni and programa.codigo=registra.codigo and comercio.cif=registra.cif;

-- 39. Genera un listado con las ciudades en las que se pueden obtener los productos de Oracle.
select distinct comercio.ciudad
from fabricante, comercio, distribuye, desarrolla
where fabricante.id_fab=desarrolla.id_fab and desarrolla.codigo=distribuye.codigo and distribuye.cif=comercio.cif and fabricante.nombre = 'Oracle';

-- 40. Obtén el nombre de los usuarios que han registrado Access XP.
select cliente.nombre
from cliente inner join programa inner join registra
on cliente.dni=registra.dni and registra.codigo=programa.codigo
where programa.nombre = 'Access' and programa.version = 'XP';

-- 41. Nombre de aquellos fabricantes cuyo país es el mismo que ʻOracleʼ. (Subconsulta).
select nombre from fabricante
where pais = (select pais from fabricante where nombre = 'Oracle');

-- 42. Nombre de aquellos clientes que tienen la misma edad que Pepe Pérez. (Subconsulta).
select * from cliente
where edad = (select edad from cliente where nombre = 'Pepe Pérez');

-- 43. Genera un listado con los comercios que tienen su sede en la misma ciudad que tiene el comercio ʻFNACʼ. (Subconsulta).
select * from comercio 
where ciudad in (select ciudad from comercio where nombre = 'FNAC');

-- 44. Nombre de aquellos clientes que han registrado un producto de la misma forma que el cliente ʻPepe Pérezʼ. (Subconsulta).
select nombre from cliente, registra 
where cliente.dni=registra.dni and medio in (select medio from registra, cliente where registra.dni=cliente.dni and cliente.nombre ='Pepe Pérez');

-- 45. Obtener el número de programas que hay en la tabla programas.
select count(*) as numero_programas from programa;

-- 46. Calcula el número de clientes cuya edad es mayor de 40 años.
select count(*) from cliente where edad > 40;

-- 47. Calcula el número de productos que ha vendido el establecimiento cuyo CIF es 1.
select cif, sum(cantidad)
from distribuye
where cif = 1
group by cif;

-- 48. Calcula la media de programas que se venden cuyo código es 7.
select codigo, avg(cantidad)
from distribuye
where codigo = 7
group by codigo;

-- 49. Calcula la mínima cantidad de programas de código 7 que se ha vendido
select min(cantidad) 
from distribuye 
where codigo = 7;

-- 50. Calcula la máxima cantidad de programas de código 7 que se ha vendido.
select max(cantidad) 
from distribuye 
where codigo = 7;

-- 51. ¿En cuántos establecimientos se vende el programa cuyo código es 7?
select count(comercio.nombre)
from distribuye, comercio
where comercio.cif=distribuye.cif and codigo = 7;

-- 52. Calcular el número de registros que se han realizado por Internet.
select count(registra.medio)
from registra
where medio= 'Internet';

-- 53. Obtener el número total de programas que se han vendido en ʻSevillaʼ.
select comercio.ciudad, count(distribuye.cantidad)
from comercio, distribuye
where comercio.cif = distribuye.cif and comercio.ciudad='Sevilla';

-- 54. Calcular el número total de programas que han desarrollado los fabricantes cuyo país es ʻEstados Unidosʼ.
select count(*) 
from fabricante, desarrolla
where fabricante.id_fab=desarrolla.id_fab and fabricante.pais='Estados Unidos';

-- 55. Visualiza el nombre de todos los clientes en mayúscula. En el resultado de la
-- consulta debe aparecer también la longitud de la cadena nombre.
select upper(nombre) as nombre_mayuscula, length(nombre) as caracteres from cliente;

-- 56. Con una consulta concatena los campos nombre y versión de la tabla PROGRAMA.
select concat(nombre,', versión: ',version) as nombre_version from programa;

select * from comercio;
select * from distribuye;
select *from registra;
select * from cliente;
select * from fabricante;
select * from programa;
select * from desarrolla;
