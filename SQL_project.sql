
-- display first and last name column
SELECT first_name, last_name
FROM actor;
-- combining those two columns into one 
ALTER TABLE actor
  ADD Actor_Name VARCHAR(50);

SELECT CONCAT(first_name,  ' ', last_name) AS ' Actor Name'
FROM actor;

-- querry Joe

SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name = 'Joe';

SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name like '%GEN%';

SELECT first_name, last_name, actor_id
FROM actor
WHERE last_name like '%LI%'
ORDER BY last_name, first_name;

SELECT country_id,  country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

ALTER TABLE actor
ADD COLUMN  description BLOB;

ALTER TABLE actor
DROP COLUMN description;
-- List the last names of actors and count those last names
SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name;

SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

UPDATE actor 
SET first_name= 'HARPO'
WHERE first_name='GROUCHO' AND last_name='WILLIAMS';

UPDATE actor 
SET first_name= 'GROUCHO'
WHERE first_name='HARPO' AND last_name='WILLIAMS';

SHOW CREATE TABLE address; -- then just copy paste

SELECT staff.first_name, staff.last_name, address.address
FROM staff LEFT JOIN address ON staff.address_id = address.address_id;

SELECT staff.first_name, staff.last_name, SUM(payment.amount) AS 'Sales'
FROM staff LEFT JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name;

SELECT film.title, COUNT(film_actor.actor_id) AS 'Number of Actors'
FROM film
INNER JOIN film_actor ON
film_actor.film_id = film.film_id
GROUP BY film.title;

SELECT film_id, COUNT(*) AS 'Stock number'
FROM film
GROUP BY film_id;

SELECT film.title, COUNT(inventory.film_id) AS 'stock count'
FROM film
INNER JOIN inventory ON
inventory.film_id = film.film_id
WHERE film.title = "Hunchback Impossible"
GROUP BY film.title; -- there are 6 copies

SELECT title 
FROM film
WHERE (title LIKE 'K%' OR title LIKE'Q%') AND (Language_id IN(
	SELECT language_id
		FROM language WHERE name = "English"));
        
SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
 SELECT actor_id
 FROM film_actor
 WHERE film_id IN
 (
  SELECT film_id
  FROM film
  WHERE title = 'Alone Trip'
 )
);

SELECT customer.first_name, customer.last_name, customer.email 
FROM customer
INNER JOIN address ON
address.address_id = customer.address_id
INNER JOIN city ON
address.city_id = city.city_id
Inner JOIN Country ON
country.country_id = city.country_id
WHERE country.country = "Canada"
GROUP BY customer.email;

SELECT film.title
FROM film
INNER JOIN film_category ON
film.film_id = film_category.film_id
INNER JOIN category ON
category.category_id = film_category.category_id
WHERE category.name = "Family"
GROUP BY film.title;



