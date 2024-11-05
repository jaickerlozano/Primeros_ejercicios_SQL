-- 1) Entrar en la base de datos world
USE WORLD;

-- 2) Estudiar la estructura de la table country

SELECT * FROM COUNTRY;

-- 3) Escribir una query para recuperar todas las columnas y filas de la tabla

SELECT * FROM COUNTRY;

-- 4) Escribir una query para visualizar solo los nombres de los países

SELECT NAME FROM COUNTRY;

-- 5) Escribir una Query para visualizar el nombre, el continente y la población de cada país.

SELECT NAME, CONTINENT, POPULATION FROM COUNTRY;

-- 6) Cambiar la cabecera de cada columna de la consulta anterior traduciendo el nombre al español.

SELECT NAME AS NOMBRE, CONTINENT AS CONTINENTE, POPULATION AS POBLACION FROM COUNTRY;

-- 7) Utilizando la columna IndepYear (Año de la independencia), averiguar cuántos años
 -- lleva un país siendo independiente.
-- a) En esta consulta debemos visualizar: el nombre del país, el año de la independencia y el número de años transcurridos.
-- b) El nombre de la columna en la que hagamos el cálculo deberá llamarse “Años_Transcurridos”.
SELECT NAME, INDEPYEAR FROM COUNTRY;
SELECT NAME AS Nombre, INDEPYEAR AS Año_Independencia, (2024 - INDEPYEAR) AS Años_Transcurridos FROM COUNTRY;

-- 8) Visualizar los continentes sin que aparezcan repetidos.
SELECT distinct CONTINENT FROM COUNTRY;

-- 9) Visualizar los 5 primeros países.
SELECT NAME FROM COUNTRY LIMIT 5;