/* 
Ejercicios sobre funciones para strings y sobre funciones numéricas
*/
-- 1. Enla tabla empleados, visualizar los siguientes datos:
USE SAKILA;
-- a. Visualizar los nombres de los empleados que tengan más de 10 letras
SELECT actor_id, first_name, length(first_name) AS Cantidad_letras FROM sakila.actor WHERE (LENGTH(first_name)>10);

-- b. Visualizar el nombre y apellido de los empleados que tengan la misma longitud
SELECT actor_id, first_name, last_name FROM sakila.actor WHERE length(first_name) = length(last_name);

-- c. Visualizar el nombre y los apellidos en un único campo
SELECT actor_id, CONCAT(first_name, ' ', last_name) AS nombre_apellido FROM sakila.actor;

-- d. Visualizar las iniciales del nombre y los apellidos. Por ejemplo: Yolanda López Guillén debe aparecer como Y.L.G
SELECT actor_id, first_name, last_name, concat(substr(first_name, 1, 1), '.', substr(last_name, 1, 1), '.') as Iniciales FROM sakila.actor;

-- e. Visualizar el nombre de los empleados que tengan una ‘a’ sin usar LIKE. Utiliza la función LOCATE.
SELECT actor_id, first_name FROM sakila.actor WHERE LOCATE('A', first_name);
-- Con esta siguiente query, se hallan solo los nombres que comienzan por la 'A'. 
SELECT actor_id, first_name, substr(first_name, 1, 1) AS Inicial FROM sakila.actor WHERE LOCATE('A',substr(first_name, 1, 1));

-- f. Visualiza el nombre y la última letra del nombre
SELECT first_name, substr(first_name, length(first_name), length(first_name)) AS Ultima_letra FROM sakila.actor;
-- Esta es otra forma de hacer el ejercicio.
SELECT first_name, substr(first_name, -1) as Ultima_letra FROM sakila.actor;

-- g. Visualiza el nombre y la última letra del nombre, pero sólo si esta última letra es una vocal
SELECT first_name, substr(first_name, -1) AS Ultima_letra FROM sakila.actor WHERE substr(first_name, -1) IN ('A','E','I','O','U');

-- h. Extraer del correo del empleado solo una parte del nombre. Elimina lo que hay desde el ‘@’ hasta el final.
SELECT email, substr(email, 1, locate('@', email)-1) AS Nombre_correo FROM sakila.staff;

-- 2. También en la tabla empleados, visualiza los siguientes datos:
-- a. Visualizar el salario y decir si es impar o par.
SELECT amount,
	CASE 
		WHEN amount % 2 = 0 THEN 'Par'
        ELSE 'Impar'
	END AS 'Tipo'
FROM sakila.payment;
-- Como la tabla salario no existe, lo hare visualizando el actor_id y decir si es par o impar
SELECT actor_id,
	CASE
		WHEN MOD(actor_id, 2) = 0 THEN 'Par'
        ELSE 'Impar'
	END AS 'Tipo'
FROM sakila.actor;


-- 3. En la tabla payment:
-- a. Visualiza el numero entero inferior y el posterior de la columna amount.

SELECT payment_id, amount, ceil(amount) AS Entero_superior FROM sakila.payment;
SELECT payment_id, amount, floor(amount) AS Entero_inferior FROM sakila.payment;
SELECT payment_id, amount, ceil(amount) AS Superior, floor(amount) AS Inferior FROM sakila.payment;