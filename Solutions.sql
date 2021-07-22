-- lab-sql-6
USE Sakila;
-- added new films via import as code did not work

SELECT * FROM sakila.films_2020;

-- Update information on rental_duration, rental_rate, and replacement_cost.

show variables like 'local_infile';
set global local_infile = 1;

UPDATE sakila.films_2020
SET rental_duration = '3', rental_rate = '2.99', replacement_cost = '8.99';

SELECT * FROM sakila.films_2020;