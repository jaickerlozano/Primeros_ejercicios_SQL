/*
2. De las tablas ALMACENES y CAJAS:
*/

-- a. Obtener todos los almacenes
SELECT * FROM almacenes;

-- b. Obtener todas las cajas con valor superior a 250
SELECT * FROM cajas WHERE Valor > 250;

-- c. Obtener los distintos tipos de contenidos de las cajas
SELECT DISTINCT Contenido FROM cajas;

-- d. Obtener el valor medio de las cajas
SELECT AVG(Valor) AS 'Valor promedio' FROM cajas;

-- e. Obtener el valor medio de las cajas de cada almacén
SELECT Almacen, AVG(Valor) AS 'Valor promedio'
FROM cajas
GROUP BY Almacen;

SELECT a.Lugar, AVG(c.valor) AS 'Valor promedio' 
FROM cajas AS c INNER JOIN almacenes AS a
ON c.Almacen = a.Codigo
GROUP BY c.Almacen;

-- f. Obtener el número de referencia de la caja junto con el lugar en el que se encuentra
SELECT c.NumReferencia, a.Lugar
FROM almacenes AS a INNER JOIN cajas AS c
ON c.Almacen = a.Codigo;

-- g. Obtener el número de cajas que hay en cada almacén
SELECT Almacen, COUNT(*) AS Numero_Cajas 
FROM cajas
GROUP BY Almacen;

-- Con esta query podemos verificar si existen más almacenes en los que no hayan cajas
SELECT a.Lugar, COUNT(NumReferencia)
FROM almacenes AS a LEFT JOIN cajas AS c
ON c.Almacen = a.Codigo
GROUP BY a.Lugar;

-- h. Obtener los números de referencia de las cajas que están en el Almacén N
SELECT a.Lugar, c.NumReferencia
FROM almacenes AS a INNER JOIN cajas AS c
ON c.Almacen = a.Codigo
WHERE a.Lugar = 'Almacén N';

-- También se puede hacer con una LEFT JOIN
SELECT NumReferencia
FROM almacenes LEFT JOIN cajas
ON Codigo = Almacen
WHERE Lugar = 'Almacén N';