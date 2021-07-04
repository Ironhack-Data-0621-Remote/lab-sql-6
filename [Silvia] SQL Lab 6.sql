USE sakila;

-- 1. Add the new films to the database.

--- Did this through data wizard as the code was giving error

select * from films_2020;

-- 2. Update information on `rental_duration`, `rental_rate`, and `replacement_cost`.
	-- ### Hint
	-- You might have to use the following commands to set bulk import option to `ON`:

show variables like 'local_infile';
set global local_infile = 1;

SET SQL_SAFE_UPDATES = 0;

UPDATE films_2020
SET rental_duration = 3, rental_rate = '2.99', replacement_cost = '8.99';

-- If bulk import gives an unexpected error, you can also use the `data_import_wizard` to insert data into the new table.
