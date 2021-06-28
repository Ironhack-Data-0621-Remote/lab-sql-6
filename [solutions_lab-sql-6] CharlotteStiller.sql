USE sakila;
SELECT * FROM film LIMIT 10; 

drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

-- 1. Add the new films to the database.

-- csv added via import wizard

SELECT * FROM films_2020 LIMIT 20; 


-- 2. Update information on `rental_duration`, `rental_rate`, and `replacement_cost`.

 UPDATE films_2020
 SET rental_duration = 3
 WHERE rental_duration = '';
 
 UPDATE films_2020
 SET rental_rate = 2.99
 WHERE rental_rate = '';

 UPDATE films_2020
 SET replacement_cost = 8.99
 WHERE replacement_cost = '';
 
SELECT * FROM films_2020 LIMIT 20; 
