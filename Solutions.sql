-- In this activity we are going to do some database maintenance. 
-- In the current database we only have information on movies for the year 2006. 
-- Now we have received the film catalog for 2020 as well. 
-- For this new data we will create another table and bulk insert all the data there. 
-- Code to create a new table has been provided below.




-- We have just one item for each film, and all will be placed in the new table. 
-- For 2020, the rental duration will be 3 days, with an offer price of `2.99€` and a replacement cost of `8.99€`
	-- (these are all fixed values for all movies for this year). 
-- The catalog is in a CSV file named **films_2020.csv** that can be found at `files_for_lab` folder.

-- 1. Add the new films to the database.
select * from sakila.films_2020;


-- 2. Update information on `rental_duration`, `rental_rate`, and `replacement_cost`.
	-- ### Hint
	-- You might have to use the following commands to set bulk import option to `ON`:

		show variables like 'local_infile';
		set global local_infile = 1;
        
update sakila.films_2020
set rental_duration = 3, rental_rate = 2.99, replacement_cost = 8.99;
select * from sakila.films_2020;
-- If bulk import gives an unexpected error, you can also use the `data_import_wizard` to insert data into the new table.
