-- In this activity we are going to do some database maintenance. 
-- In the current database we only have information on movies for the year 2006. 
-- Now we have received the film catalog for 2020 as well. 
-- For this new data we will create another table and bulk insert all the data there. 
-- Code to create a new table has been provided below.
use sakila;

-- We have just one item for each film, and all will be placed in the new table. 
-- For 2020, the rental duration will be 3 days, with an offer price of `2.99€` and a replacement cost of `8.99€`
	-- (these are all fixed values for all movies for this year). 
-- The catalog is in a CSV file named **films_2020.csv** that can be found at `files_for_lab` folder.


-- 1. Add the new films to the database.
-- I added the file via data wizard. 
select * from films__2020;

-- 2. Update information on `rental_duration`, `rental_rate`, and `replacement_cost`.
update films__2020 
set rental_duration = 3, rental_rate = 2.99, replacement_cost = 8.99;

