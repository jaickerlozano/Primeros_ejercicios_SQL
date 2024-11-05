USE SAKILA;

Show tables from sakila;

SELECT * FROM sakila.fechas;

/*1. Ejercicios con BETWEEN
 a. Extrae el nombre y la duración de las películas que duran entre 120 y 130
 horas. Utiliza la tabla film
 b. Extrae de la tabla rent, el ‘rental_id’ y el ‘rental_date’ de los alquileres de
 febrero de 2006
 c. Extrae de la tabla actor el ‘first_name’ de los actores cuyo primer nombre
 comience entre B y C*/
-- 1.a)
select * from sakila.film;
select title, length from sakila.film WHERE length BETWEEN 120 and 130;
-- 1.b)
select * from rental;
select rental_id, rental_date from sakila.rental where rental_date BETWEEN '2006-02-01' and '2006-02-28';
-- 2.c)
select * from sakila.actor;
select first_name from sakila.actor WHERE first_name BETWEEN "B" and "D";

/*2. Ejercicios con LIKE
 a. Averigua los actores cuyo nombre comience en B y termine en A
 b. Extrae los apellidos de los clientes cuyo apellido empiece por MA
 c. Extrae los nombres y apellidos de los clientes cuyos apellidos tengan TH en
 cualquier parte
 d. Extrae los apellidos que tengan una A como segunda letra y una E como
 cuarta letra*/
 -- 2.a)
select * from actor;
select actor_id, first_name from sakila.actor where first_name like 'B%A';
-- 2.b)
select * from customer;
select last_name from sakila.customer where last_name like 'MA%';
-- 2.c)
select first_name, last_name from sakila.customer where last_name like '%TH%';
-- 2.d)
select last_name from sakila.customer where last_name like '_A_E%';

/*3. Ejercicios con IN
 a. Extrae el nombre y los apellidos de los actores cuyo nombre sea: ‘sara’,
 ‘fred’, ‘ed’ y ‘helen’
 b. Extrae el ‘title’ y el ‘rental_date’ de la tabla film, cuyo ‘rental_date’ sea 2.99 o
 4.99
 c. Extrae el título y las características especiales de las películas que sean
 ‘Deleted scenes’ o ‘Comedy’
 d. Extrae el nombre de la ciudad cuyo país es el 87 o el 60*/
-- 3.a)
select * from sakila.actor;
select first_name, last_name from sakila.actor where first_name in ('SARA', 'FRED', 'ED', 'HELEN');
-- 3.b)
select * from film;
select title, rental_rate from sakila.film where rental_rate in (2.99, 4.99);
-- 3.c)
select * from sakila.category;
select category_id from category where name in ('Comedy');
select * from film_category;
select film_id from sakila.film_category where category_id in (5);
select * from film;
select film_id from sakila.film where special_features like '%Deleted Scene%';
select title, special_features from sakila.film where film_id in (select film_id from film_category where category_id in (select category_id from category where name in ('Comedy')) or special_features like '%Deleted Scene%');

-- 3.c) Esta resolución corresponde a la búsqueda de Deleted Scene y Commentaries en film y no Comedy como lo dice el enunciado. En la clase sale corregido por la profe.
-- Esta solución es para el ejercicio corregido en clase. El anterior lo hice buscando Comedy y Deleted Scenes.
select title, special_features from sakila.film where special_features in ('Deleted Scenes' , 'Commentaries');

-- 3.d)
select * from sakila.city;
select city, country_id from sakila.city where country_id in (87, 60);
