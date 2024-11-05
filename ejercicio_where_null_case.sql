show databases;

USE	sakila;

/*
 1. Extrae la dirección (address) y dirección2 (address2) donde la dirección2 sea
 nula de la tabla es address
*/

select address, address2 from sakila.address where address2 is null;
		
/*
2. Extrae el rental_id, rental_date y return_date para aquellos alquileres que ya
 tienen fecha de devolución de la tabla rental
*/

select rental_id, rental_date, return_date from sakila.rental where rental_date is not null;

/*
 3. Vamos a usar la tabla “category”. Con un case vamos a traducir alguna de las
 categorías, no hace falta todas.
*/

select distinct name from sakila.category;

select name,
	CASE name
		when 'Action' then 'Acción'
        when 'Animation' then 'Animación'
        when 'Comedy' then 'Comedia'
        when 'Horror' then 'Terror'
        when 'Sport' then 'Deportes'
        else 'Otra categoría'
	END AS 'Categorías'
from sakila.category;

/* 
 4. Vamos a usar la tabla payment y la columna amount según las siguientes
 condiciones:
 a. amount<= 0.99 'Barato'
 b. amount entre 1 y 4.99 'Medio'
 c. amount >= 4.99 'Caro'
 d. Para cualquier otra cosa ponemos 'Otros valores
*/
select amount from sakila.payment;

select rental_id, amount,
	CASE 
		when amount <= 0.99 then 'Barato'
		when amount between 1 and 4.99 then 'Medio'
		when amount >= 4.99 then 'Caro'
		else 'Otros valores'
    END AS 'Precios'
from sakila.payment;
