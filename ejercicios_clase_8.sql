-- Ejercicio 2

USE SAKILA;
SELECT ADDRESS, DISTRICT FROM ADDRESS;

-- 2. Seleccionar los campos ‘address’ y ‘district’ de la tabla ‘address’ donde el distrito sea Texas.
SELECT ADDRESS, DISTRICT FROM ADDRESS WHERE DISTRICT = "TEXAS";
SELECT ADDRESS, DISTRICT FROM sakila.address WHERE DISTRICT = "TEXAS";

-- 3. Seleccionar todas las columnas de la tabla ‘payment’ cuyo campo ‘amount’ sea mayor que 11.
SHOW TABLES;
select * from sakila.payment where amount > 11;

-- 4. Visualizar todos los actores de la tabla ‘actor’ cuyo ‘first_name’ sea Penelope.
-- Probar varias formas de escribir el nombre para comprobar si obtenemos
-- resultados diferentes.
SELECT * FROM ACTOR;
SELECT FIRST_NAME FROM ACTOR;
SELECT ACTOR_ID, FIRST_NAME, LAST_NAME  FROM ACTOR WHERE FIRST_NAME = "PENELOPE";
SELECT ACTOR_ID, FIRST_NAME, LAST_NAME FROM ACTOR WHERE FIRST_NAME = "Penelope";
SELECT ACTOR_ID, FIRST_NAME, LAST_NAME FROM ACTOR WHERE FIRST_NAME = "penelope";
SELECT ACTOR_ID, FIRST_NAME, LAST_NAME FROM ACTOR WHERE FIRST_NAME = "penElope";

-- 5. Repite el proceso anterior utilizando BINARY.
SELECT ACTOR_ID, FIRST_NAME, LAST_NAME  FROM ACTOR WHERE BINARY FIRST_NAME = "PENELOPE"; -- Encuentra 4 registros
SELECT ACTOR_ID, FIRST_NAME, LAST_NAME FROM ACTOR WHERE BINARY FIRST_NAME = "Penelope"; -- No encuentra registros
SELECT ACTOR_ID, FIRST_NAME, LAST_NAME FROM ACTOR WHERE BINARY FIRST_NAME = "penelope"; -- No encuentra registros
SELECT ACTOR_ID, FIRST_NAME, LAST_NAME FROM ACTOR WHERE BINARY FIRST_NAME = "penElope"; -- No encuentra registros

-- 6. Visualizar las columnas ‘first_name’ y ‘last_name’ de la tabla ‘customer’ de
-- aquellos clientes que estén inactivos (En otras palabras, que el campo ‘active’
-- sea igual a 0)
Select * from sakila.customer;
Select * from sakila.customer WHERE active = 0;

-- 7. Probar la consulta anterior cambiando el 0 por False. ¿Funciona?
Select first_name, last_name, active from customer WHERE active = false; -- El cero funciona igual que un false

-- 8. Piensa qué resultado deberían dar las siguientes querys:
 select first_name,last_name,active from customer where
 active;
 select first_name,last_name,active from customer where
 !active;
