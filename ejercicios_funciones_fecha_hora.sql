/*
 Ejercicios sobre funciones fecha y hora
*/
-- 1. Visualizar la fecha y hora actual, con 2 funciones diferentes
SELECT current_date() AS Fecha, current_time() AS Hora;

-- 2. Visualizar la fecha y hora con una sola función
SELECT NOW() AS 'Fecha y hora actual';

-- 3. Añade 25 minutos a la hora actual.
SELECT curtime() AS 'Hora Actual', addtime(curtime(), '00:25:00') AS 'más 25 min';

-- 4. Añade 24 horas a la fecha actual.
SELECT now() AS 'Fecha actual', addtime(now(), '24:00:00') AS 'Fecha actual más 24 horas';
-- Otra forma de resolver 
SELECT now() AS 'Fecha actual', adddate(now(), interval 24 hour) AS 'Fecha actual más 24 horas';
SELECT CURDATE() AS 'Fecha actual', DATE_ADD(CURDATE(), INTERVAL 24 HOUR) AS '24 horas mas';

-- 5. Vamos ahora a usar la tabla “rental”.
-- a. Visualizar rental_date, pero solo la parte de la fecha, quitando la hora
SELECT rental_date, date(rental_date) FROM sakila.rental;

-- b. Hacer la misma operación pero visualizando el nombre del mes, pero solo para Enero y Mayo de 2005
SELECT monthname(rental_date) FROM sakila.rental WHERE (month(rental_date) = 1 or month(rental_date) = 5) and year(rental_date) = 2005;

-- c. Visualizar el nombre del mes, pero traducido al español, usando CASE.
SELECT rental_date,
	CASE month(rental_date)
		WHEN 1 THEN 'Enero'
        WHEN 2 THEN 'Febrero'
        WHEN 3 THEN 'Marzo'
        WHEN 4 THEN 'Abril'
        WHEN 5 THEN 'Mayo'
        WHEN 6 THEN 'Junio'
        WHEN 7 THEN 'Julio'
        WHEN 8 THEN 'Agosto'
        WHEN 9 THEN 'Septiembre'
        WHEN 10 THEN 'Octubre'
        WHEN 11 THEN 'Noviembre'
        WHEN 12 THEN 'Diciembre'
	END AS 'Mes'
FROM sakila.rental;

-- d. Visualizar los alquileres que se hayan hecho los sábados y domingos del mes de mayo de 2005
SELECT rental_date, dayname(rental_date) AS 'Día', monthname(rental_date) AS 'Mes', year(rental_date) AS 'Año'
FROM sakila.rental WHERE dayname(rental_date) in ('Saturday', 'Sunday') and year(rental_date) = 2005;

-- e. Averiguar cuantos días llevas viviendo 
SELECT datediff(curdate(), '1987-11-29') AS 'Días vividos';

 /* 
 f. Si la devolución de una película, tiene que hacerse en 48 horas, 
 calcula cual sería la fecha de devolución prevista de los alquileres
*/
SELECT * FROM sakila.rental;
SELECT customer_id, rental_date, return_date, adddate(rental_date, interval 48 hour) AS 'Fecha de Devolución Prevista', 
datediff(return_date, adddate(rental_date, interval 48 hour)) AS 'Días en mora' FROM sakila.rental;

/*
 g. Poner el siguiente formato a la fecha y hora actual. Esto es un ejemplo,
 debe salir la fecha real o Fecha de factura: Friday, dia 06 del mes de
 January del año 2023
*/ 
SELECT date_format(now(), '%W, día %e del mes de %M del año %Y') AS 'Fecha de factura';
SELECT now();