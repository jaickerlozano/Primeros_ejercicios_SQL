/*
 PRÁCTICA 1
 Realiza las siguientes consultas en SQL.
 11. ¿Qué fabricantes son de Estados Unidos?
 12. ¿Cuáles son los fabricantes no españoles? Utilizar el operador IN.
 13. Obtén un listado con los códigos de las distintas versiones de Windows.
 14. ¿En qué ciudades comercializa programas El Corte Inglés
 15. ¿Qué otros comercios hay, además de El Corte Inglés? Utilizar el operador
 IN.
 16. Genera una lista con los códigos de las distintas versiones de Windows y
 Access. Utilizar el operador IN.
 17. Obtén un listado que incluya los nombres de los clientes de edades
 comprendidas entre 10 y 25 y de los mayores de 50 años. Da una solución
 con BETWEEN yotra sin BETWEEN.
 18. Saca un listado con los comercios de Sevilla y Madrid. No se admiten
 valores duplicados.
 19. ¿Qué clientes terminan su nombre en la letra “o”?
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