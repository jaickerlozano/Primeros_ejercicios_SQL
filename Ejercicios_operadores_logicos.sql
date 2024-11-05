/*
 1. Enla tabla country de la bases de datos world, extraer los siguientes datos:
*/
USE world;
-- a. Países cuyo continente es Asia y la poblacion supera los 20.000.000
select Name, Continent, Population from world.country where (Continent = 'Asia' and Population >= 20000000);
-- Otra forma de resolver usando el NOT
select Name, Continent, Population from world.country where (Continent = 'Asia' and not Population < 20000000);

-- b. Países que pertenecen a Asia o a África
select Name, Continent from world.country where (Continent = 'Asia' or Continent = 'Africa');

-- c. Países que empiecen por B y que pertenezcan a África
select Name, Continent from world.country where (Name like 'B%' and Continent = 'Africa');

-- d. Países que pertenezcan a Europa y cuya expectativa de vida esté entre 75 y 85 años
select Name, Continent, LifeExpectancy from world.country where (Continent = 'Europe' and LifeExpectancy between 75 and 85);
-- Otra forma de resolver utilizando solo operadores lógicos
select Name, Continent, LifeExpectancy from world.country where (Continent = 'Europe' and (LifeExpectancy > 75 and LifeExpectancy < 85));

-- e. Países cuyo gobierno sea República o Monarquía
select Name, GovernmentForm from world.country 
where GovernmentForm like '%Republic%' or GovernmentForm like '%Monarchy%';

-- f. Países de África que se independizaron después de los 50 y cuyo gobierno sea república
select Name, Continent, IndepYear, GovernmentForm from world.country
	where (Continent = 'Africa' and IndepYear > 1950 and GovernmentForm like '%Republic%');
-- Otra forma de resolver usando el NOT
select Name, Continent, IndepYear, GovernmentForm from world.country
	where (Continent = 'Africa' and NOT IndepYear <= 1950 and GovernmentForm like '%Republic%');
    
/*
 2. En la base de datos sakila, buscar dónde se encuentran (en qué tabla) y extraer los
 siguientes datos:
*/
USE sakila;
-- a. Todos los actores cuyo nombre no es ‘Tom’ o ‘John’
select actor_id, first_name, last_name from sakila.actor 
	where (not first_name = 'Tom' and not first_name = 'John');
    
-- b. Películas que no están en inglés y que tienen una clasificación ‘PG’
select * from sakila.film;
select distinct language_id from sakila.film;
select title, language_id, rating from sakila.film where (not language_id = 1 and rating = 'PG');

-- c. Películas que son clasificadas como ‘PG’ o ‘G’
select film_id, title, rating from sakila.film where (rating = 'PG' or rating = 'G');
-- Otra forma de resolver utilizando in
select film_id, title, rating from sakila.film where rating in ('PG', 'G');

-- d. Alquileres que ocurrieron antes de ‘2005-05-15’ o después de ‘2006-01-01’
select * from rental;
select rental_id, rental_date from sakila.rental 
	where (rental_date < '2005-05-15' or rental_date > '2006-01-01');
    
-- e. Clientes que tienen un nombre que comienza con ‘A’ y que están en ‘Canada’

-- Con esta query hallamos el código de Canada (country_id)... El country_id es 20 el cúal usaremos en la siguiente query
select * from sakila.country where country = 'Canada';

-- Con esta query compuesta hallamos el cógido de las ciudades (city:id) ubicadas en Canada
-- Los códigos de city_id ubicadas en Canada deben ser (179, 196, 300, 313, 383, 430, 565)
select * from sakila.city where country_id = (select country_id from sakila.country where country = 'Canada');

-- Con esta query compuesta hallamos los códigos de la direcciones asociadas (address_id) a las ciudades ubicadas en Canada
-- Las address_id que están asociados a las ciudades en Canada son (481,468,1,3,193,415,441)
select * from sakila.address where city_id 
	in (select city_id  from sakila.city where country_id = (select country_id from sakila.country where country = 'Canada'));

-- Con esta query compuesta hallamos los clientes que tienen direccion en Canada
-- Los customer_id de los clientes que viven en alguna ciudad de Canada son (476,463,189,410,436)
select * from sakila.customer where address_id 
	in (select address_id from sakila.address where city_id 
		in (select city_id  from sakila.city where country_id = (select country_id from sakila.country where country = 'Canada')));

-- Con esta última query compuesta hallamos las personas que vivan en Canada y su nombre comience con 'A'
/* P.D.: Como no existe ninguna persona que su nombre comience con A y viva en Canada en la base de datos, 
he decicido probar con nombres que comiencen con 'D' para verificar que mis querys funcionan correctamente.

Con esta query se puede hallar de forma automática los clientes que su nombres comiencen con una letra 
específica y que vivan en un determinado país. Solo se tendría que cambiar el país y/o la letra inicial
del nombre que deseemos buscar.
*/
select * from sakila.customer where address_id 
	in (select address_id from sakila.address where city_id 
		in (select city_id  from sakila.city where country_id = (select country_id from sakila.country where country = 'Canada')))
	and first_name like 'D%';
