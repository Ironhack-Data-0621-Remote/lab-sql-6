-- In this activity we are going to do some database maintenance. 
-- In the current database we only have information on movies for the year 2006. 
-- Now we have received the film catalog for 2020 as well. 
-- For this new data we will create another table and bulk insert all the data there. 
-- Code to create a new table has been provided below.

-- drop table if exists films_2020;
-- CREATE TABLE `films_2020` (
  -- `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
 --  `title` varchar(255) NOT NULL,
  -- `description` text,
  -- `release_year` year(4) DEFAULT NULL,
  -- `language_id` tinyint(3) unsigned NOT NULL,
  -- `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  -- `rental_duration` int(6),
  -- `rental_rate` decimal(4,2),
  -- `length` smallint(5) unsigned DEFAULT NULL,
  -- `replacement_cost` decimal(5,2) DEFAULT NULL,
  -- `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  -- PRIMARY KEY (`film_id`),
  -- CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;


-- We have just one item for each film, and all will be placed in the new table. 
-- For 2020, the rental duration will be 3 days, with an offer price of `2.99€` and a replacement cost of `8.99€`
	-- (these are all fixed values for all movies for this year). 
-- The catalog is in a CSV file named **films_2020.csv** that can be found at `files_for_lab` folder.


-- 1. Add the new films to the database.
-- 2. Update information on `rental_duration`, `rental_rate`, and `replacement_cost`.
	-- ### Hint
	-- You might have to use the following commands to set bulk import option to `ON`:
-- show variables like 'local_infile';
-- global local_infile = 1;

-- sHOW VARIABLES LIKE "secure_file_priv";

-- LOAD DATA LOCAL
-- INFILE 'C:\Users\diebl\lab\lab-sql-6\films_2020.csv'
-- INTO TABLE films_2020;

-- select user,File_priv from mysql.user;

-- If bulk import gives an unexpected error, you can also use the `data_import_wizard` to insert data into the new table.

-- -- I used data wizard to create a new table and upload the CSV file. 
SELECT* FROM Films_2020
LIMIT 10;

-- Filling rental_duration, rental_rate and replacement_cost columns with data
UPDATE films_2020
SET rental_duration = 3, rental_rate = 2.99, replacement_cost = 8.99;

 -- Defining the PK and FKs as well as the columns 
 
-- I tried to use ALTER MODIFY on all columns 
-- to define them but it did not work. So I did it column by column, but it isn't efficient.
-- Is there a procedure to define all the columns as well as the PK and FKs all in once ?
 -- Here is what I tried :
 
 ALTER TABLE films_2020 MODIFY
film_id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
description text,
Release year (4) DEFAULT NULL,
language_id tinyint(3) unsigned NOT NULL,
original_language_id tinyint(3) unsigned DEFAULT NULL,
rental_duration int(6),
rental_rate decimal(4,2),
length smallint(5) unsigned DEFAULT NULL,
replacement_cost decimal(5,2) DEFAULT NULL,
rating enum('G','PG','PG-13','R','NC-17') DEFAULT NULL
PRIMARY KEY (`film_id`),
CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

 -- Eventually, I did it step by step :

ALTER TABLE films_2020 ADD
CONSTRAINT pk_films_2020 PRIMARY KEY(film_id);
ALTER TABLE films_2020 ADD
FOREIGN KEY (original_language_id)
REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE films_2020
MODIFY film_id smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE films_2020
MODIFY title varchar(255) NOT NULL;
ALTER TABLE films_2020
MODIFY description text;
ALTER TABLE films_2020
MODIFY language_id tinyint (3) unsigned NOT NULL;
ALTER TABLE films_2020
MODIFY original_language_id tinyint (3) unsigned DEFAULT NULL;
ALTER TABLE films_2020
MODIFY rental_duration int(6);
ALTER TABLE films_2020
MODIFY rental_rate decimal(4,2);
ALTER TABLE films_2020
MODIFY length smallint(5) unsigned DEFAULT NULL;
ALTER TABLE films_2020
MODIFY replacement_cost decimal(5,2) DEFAULT NULL;
ALTER TABLE films_2020
MODIFY rating enum('G','PG','PG-13','R','NC-17') DEFAULT NULL;


