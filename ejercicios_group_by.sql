use conquerblocks;

/* Ejercicios sobre agrupaciones (PARTE I)
*/
 -- 1. Obtener el importe total de ventas de cada departamento.
 select departamento, sum(importe) as 'Total ventas' from contabilidad 
 group by departamento;
 
 -- 2. Obtener el importe total de gastos de cada departamento.
 select * from contabilidad where departamento like '%Gastos%';
 
 select departamento, sum(importe)
 from contabilidad
 where cuenta_contable in ('4200', '4300', '4400', '6300')
 group by departamento;
 
 -- 3. Obtener el número de registros de cada tipo de cuenta contable.
 select cuenta_contable, count(id) from contabilidad
 group by cuenta_contable; 
 -- Otra forma de hacer
 select cuenta_contable, count(*) as Numero_Registros from contabilidad
 group by cuenta_contable; 
 
 -- 4. Obtener el importe total de ventas de cada mes.
 select departamento, month(fecha) as Mes, sum(importe) as Importe_Total from contabilidad
 where departamento = 'Ventas'
 group by month(fecha);
 
 -- 5. Obtener el importe total de ventas de cada departamento y mes.
 select departamento, month(fecha) as Mes, sum(importe) as Importe_Total from contabilidad
 group by departamento, month(fecha);
 
 -- 6. Obtener el número de registros de cada tipo de cuenta contable y mes.
 select cuenta_contable, month(fecha) as Mes, count(*) as Numero_Registros from contabilidad
 group by cuenta_contable, month(fecha)
 order by month(fecha), cuenta_contable;
 
 -- 7. Obtener el importe total de ventas de cada departamento y mes, 
 -- ordenado por importe de mayor a menor.
 select departamento, month(fecha) as Mes, sum(importe) as Importe_Total from contabilidad
 group by departamento, month(fecha)
 order by month(fecha), sum(importe) desc;
 
 -- 8. Obtener el número de registros de cada tipo de cuenta contable y mes, ordenados por mes de mayor a menor.
 select cuenta_contable, month(fecha) as Mes, count(*) as Numero_Registros from contabilidad
 group by month(fecha), cuenta_contable
 order by month(fecha), count(*) desc;
 
 /* Ejercicios sobre agrupaciones (PARTE II)
 */
use world;
-- 9. Encuentra la cantidad de países en cada continente
select continent as Continente, count(name) as 'numero_paises' from world.country
group by continent;

-- 10. Encuentra el número total de ciudades en cada país
select CountryCode as 'Codigo Pais', count(name) 'numero_ciudades' 
from city
group by CountryCode;

-- Una forma de hacerlo utilizando JOIN
select country.name as Pais, count(city.name) as 'Cantidad de ciudades'
from country, city
where country.code = city.CountryCode
group by country.name;

-- 11. Encuentra los continentes cuya población total es superior a 100 millones
select continent, sum(Population) as 'Poblacion_Total' 
from country
group by continent 
having sum(Population) > 100000000;

-- 12. Encuentra la cantidad de idiomas oficiales en cada país
select CountryCode, count(*) as OfficialLanguage
from countrylanguage
where IsOfficial = 'T'
group by CountryCode;

-- 13. Encuentra los continentes donde la expectativa de vida promedio es inferior a 70 años
select Continent, avg(LifeExpectancy) as PromedioVida
from country
group by continent having avg(LifeExpectancy) < 70;

-- 14. Encuentra el número total de hablantes de cada idioma en todo el mundo
select * from countrylanguage;
select language, sum(Percentage)/100 As TotalPercentage
from countrylanguage
group by Language
order by TotalPercentage Desc;

-- 15. Encuentra los continentes donde ningún país tiene una población superior a 200 millones
select continent, max(Population) as MaxPopulation
from country
group by continent 
having Maxpopulation <= 200000000;

-- 16. Encuentra los continentes donde la cantidad de países con una expectativa de
-- vida superior a 80 años sea igual o mayor a 3
select continent, count(name) as numero_paises
from country
where LifeExpectancy > 80
group by continent
having numero_paises >=3;

-- 17. Encuentra el promedio de la expectativa de vida en cada continente,
-- excluyendo aquellos donde el promedio sea inferior a 70 años
select continent, avg(LifeExpectancy) as AVGLifeExpectancy
from country
group by Continent
having AVGLifeExpectancy >= 70;