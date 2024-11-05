/*
Ejercicios sobre JOINS
*/

-- 1. Extrae el continente, el país y el nombre de la ciudad de las tablas correspondientes de la base de datos world.
select * from country;
select *  from city;

-- INNER JOIN CON WHERE / JOIN CON WHERE
select country.continent, country.name, city.Name
from country, city
where city.CountryCode = country.Code;

-- JOIN CON INNER JOIN
select country.Continent, country.name, city.name
from country inner join city
on city.CountryCode = country.Code;

-- INNER JOIN
select nombre_continente, nombre_pais, nombre_ciudad
from(
	select continent as nombre_continente, name as nombre_pais, code
    from world.country) country
    
    INNER JOIN
    
    (select name as nombre_ciudad, countrycode
    from world.city) city
    
on city.CountryCode = country.Code;

-- 2. Extrae el identificador de cada película, el título y también el identificador de la
-- categoría asociado a esa película. Usa la base de datos sakila.
select * from film;
select * from film_category;

select id_pelicula, titulo, id_categoria
from(
	select film_id as id_pelicula, title as titulo, film_id
    from sakila.film) film
    
    INNER JOIN
    
    (select category_id as id_categoria, film_id
    from sakila.film_category) film_category
    
on film.film_id = film_category.film_id;

select film.film_id, film.title, film_category.category_id
from film, film_category
where film.film_id = film_category.film_id;  

select film.film_id, film.title, film_category.category_id
from film inner join film_category
on film.film_id = film_category.film_id;

-- 3. Extrae la misma información que en el ejercicio anterior, pero además, extrae el
-- nombre de la categoría.
select * from film;
select * from film_category;
select * from category;

-- INNER JOIN CON WHERE / JOIN CON WHERE
select film.film_id, film.title, film_category.category_id, category.name
from film, film_category, category
where film.film_id = film_category.film_id and film_category.category_id = category.category_id; 

-- JOIN CON INNER JOIN
select film.film_id, film.title, film_category.category_id, category.name
from film INNER JOIN film_category
on film.film_id = film_category.film_id 
INNER JOIN category
on film_category.category_id = category.category_id;

-- INNER JOIN
select id_pelicula, titulo, id_categoria, nombre_categoria
from(
	select film_id as id_pelicula, title as titulo
    from sakila.film) film
    
    INNER JOIN
    
    (select category_id as id_categoria, film_id
    from sakila.film_category) film_category
    
on film.id_pelicula = film_category.film_id 

    INNER JOIN

	(select name as nombre_categoria, category_id
	from sakila.category) category
    
on film_category.id_categoria = category.category_id;

-- 4. Escribe el enunciado de unos cuantos posibles ejercicios para proponerlos y
-- corregirlos en la siguiente sesión.

