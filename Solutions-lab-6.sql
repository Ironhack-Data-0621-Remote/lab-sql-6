-- In this activity we are going to do some database maintenance. 
-- In the current database we only have information on movies for the year 2006. 
-- Now we have received the film catalog for 2020 as well. 
-- For this new data we will create another table and bulk insert all the data there. 
-- Code to create a new table has been provided below.
USE sakila;

DROP TABLE IF EXISTS films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6) DEFAULT NULL,
  `rental_rate` decimal(4,2) DEFAULT NULL,
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;


-- We have just one item for each film, and all will be placed in the new table. 

-- 1. Add the new films to the database.

SHOW VARIABLES LIKE 'local_infile'; -- why do me need this?
SET GLOBAL local_infile = 1;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM films_2020;
LOAD DATA LOCAL INFILE './films_2020.csv' 
INTO TABLE films_2020
FIELDS TERMINATED BY ',';

-- code gives me error:
-- SQL 2068. LOAD DATA LOCAL INFILE file request rejected due to restrictions on access

-- import via data wizard doesn't work either: row import failed with error: ("Incorrect interger value:" for column 'rental_duration' at row 1", 1366)
-- data import only worked when creating a new table with data wizard, not with existing table!


-- 2. Update information on `rental_duration`, `rental_rate`, and `replacement_cost`.

-- For 2020, the rental duration will be 3 days, with an offer price of `2.99€` and a replacement cost of `8.99€`
-- (these are all fixed values for all movies for this year). 

-- changing column type 
ALTER TABLE films_2020 
ALTER COLUMN rental_duration INT(6); -- why does this not work? error code 1064: error in the SQL syntax

UPDATE films_2020
SET rental_duration = 3;

UPDATE films_2020
SET rental_rate = 2.99;

UPDATE films_2020
SET replacement_cost = 8.99;

SELECT * FROM films_2020;

