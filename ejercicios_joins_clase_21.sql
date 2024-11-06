/*
1. De las tablas FABRICANTES y ARTÍCULOS:
*/
-- a. Obtener los nombres de los productos de la tienda.
SELECT Codigo, Nombre FROM articulos;

-- b. Obtener nombres y precios de los artículos.
SELECT Codigo, Nombre, Precio FROM articulos;

-- c. Obtener el nombre de los artículos cuyo precio sea menor o igual a 20 €.
SELECT Codigo, Nombre, Precio FROM articulos 
WHERE Precio <= 20;

-- d. Obtener todos los datos de los artículos cuyo precio esté entre los 60€ y los 120€.
SELECT * FROM articulos 
WHERE Precio BETWEEN 60 AND 120;

-- e. Calcular el precio medio de todos los productos.
SELECT AVG(Precio) AS Precio_Medio FROM articulos;

-- f. Calcular el precio medio de los productos del fabricante 3.
SELECT fabricantes.Nombre, AVG(Precio) AS Precio_Medio 
FROM articulos INNER JOIN fabricantes
ON fabricantes.Codigo = articulos.Fabricante
WHERE fabricantes.Nombre = 'Fabricante 3';

-- g. Calcular el número de artículos cuyo precio sea menor o igual a 160€.
SELECT COUNT(*) AS Numero_articulos FROM articulos
WHERE Precio <=160;

-- h. Obtener un listado completo de artículos en el que aparezca el nombre del artículo y
-- el nombre del fabricante
SELECT f.Nombre AS Nombre_Fabricante, a.Nombre AS Nombre_Articulo
FROM articulos AS a INNER JOIN fabricantes AS f
ON a.Fabricante = f.Codigo;

-- i. Obtener el precio medio de los productos de cada fabricante
SELECT Fabricante, AVG(Precio) AS Precio_Medio 
FROM articulos
GROUP BY Fabricante;

-- j. Obtener el precio medio de los productos de cada fabricante mostrando además el
-- nombre del fabricante
SELECT f.Nombre, AVG(a.Precio) AS Precio_Medio
FROM articulos AS a INNER JOIN fabricantes AS f
ON a.Fabricante = f.Codigo
GROUP BY f.Nombre;

-- k. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio
-- sea mayor o igual a 100€
SELECT f.Nombre, AVG(a.Precio) AS Precio_Medio
FROM articulos AS a INNER JOIN fabricantes AS f
ON a.Fabricante = f.Codigo
GROUP BY f.Nombre
HAVING Precio_Medio >= 100;

-- l. Obtener el nombre y el precio del artículo más barato
SELECT Nombre, Precio 
FROM articulos
ORDER BY Precio ASC
LIMIT 1;