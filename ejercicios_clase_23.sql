/*
 3. De las tablas DIRECTORES y DESPACHOS:
 e. Mostrar los nombres y apellidos de los directores junto con los de su jefe
*/
-- a. Mostrar el DNI, el nombre y los apellidos de todos los directores:
SELECT NombreCompleto, DNI FROM directores;

-- b. Mostrar los datos de los directores que no tienen jefes
SELECT NombreCompleto, DNI FROM directores WHERE DNIJefe IS NULL;

-- c. Mostrar el nombre y apellidos de cada director, junto con la capacidad del despacho
-- en el que se encuentra
SELECT * FROM DIRECTORES;
SELECT * FROM DESPACHOS;
SELECT dir.NombreCompleto, des.Capacidad
FROM directores AS dir INNER JOIN despachos AS des
ON dir.Despacho = des.Codigo;

-- d. Mostrar el número de directores en cada despacho
-- Esta query está mala porque no se estaría tomando en cuenta los despachos que no tienen directores
SELECT Despacho, COUNT(*) AS Numero_Directores
FROM directores
GROUP BY Despacho
ORDER BY Despacho;
-- Esta query si obtiene el número de directores en cada despacho incluyendo aquellos despachos que no tengan directores
SELECT Codigo, COUNT(DNI)
FROM despachos LEFT JOIN directores
ON Codigo = Despacho
GROUP BY Codigo;

-- e. Mostrar los nombres y apellidos de los directores junto con los de su jefe

/*
 4. De las tablas CIENTIFICOS, ASIGNADO_A y PROYECTO:
*/
-- a. Saca una relación completa de los científicos asignados a cada proyecto. Muestra el
-- DNI, el nombre del científico, el identificador del proyecto y el nombre del proyecto
SELECT * FROM cientificos;
SELECT * FROM asignado_a;
SELECT * FROM proyecto;

SELECT NombreApellidos, DNI, ID, Nombre AS Nombre_Proyecto
FROM cientificos INNER JOIN asignado_a
ON DNI = Cientifico
INNER JOIN proyecto
ON Proyecto = ID
ORDER BY ID;

-- b. Obtener el número de proyectos al que está asignado cada científico. Mostrar el
-- nombre y el DNI
-- Con esta query obtengo el número de proyectos que está asignado cada cientifico
-- De esta forma lo realicé yo y me da el mismo resultado que la profesora, aunque me compliqué la vida yo solo cruzando las tres tablas
-- Pero obtengo el resultado.
SELECT NombreApellidos, DNI, COUNT(Proyecto) AS Numero_Proyectos
FROM cientificos LEFT JOIN asignado_a
ON Cientifico = DNI
INNER JOIN proyecto
ON Proyecto = ID
GROUP BY Cientifico;
-- De esta forma lo hizo la profesora, mucho más corto y optimizado.
SELECT NombreApellidos, DNI, COUNT(Proyecto) AS Numero_Proyectos
FROM cientificos LEFT JOIN asignado_a
ON Cientifico = DNI
GROUP BY NombreApellidos, DNI;

-- c. Obtener el número de científicos asignados a cada proyecto. Mostrar el identificador
-- del proyecto y el nombre del proyecto
SELECT ID, Nombre, COUNT(Proyecto) AS Numero_Cientificos
FROM proyecto LEFT JOIN asignado_a
ON ID = Proyecto
LEFT JOIN cientificos
ON Cientifico = DNI
GROUP BY ID;

-- Se puede hacer de esta otra forma
SELECT ID, Nombre, COUNT(Proyecto) AS Numero_Cientificos
FROM proyecto LEFT JOIN asignado_a
ON ID = Proyecto
GROUP BY ID, Nombre;


-- d. Mostrar el número de horas de dedicación de cada científico
SELECT NombreApellidos, DNI, COUNT(Proyecto) AS Numero_Proyectos, SUM(Horas) AS Horas_Dedicadas
FROM cientificos LEFT JOIN asignado_a
ON DNI = Cientifico
INNER JOIN proyecto
ON Proyecto = ID
GROUP BY Cientifico;