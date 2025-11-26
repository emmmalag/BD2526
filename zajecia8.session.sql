#6.1
SELECT staff.staff_id, staff.first_name, staff.last_name, staff.email, address.address, address.phone 
FROM staff INNER JOIN address ON staff.address_id=address.address_id;

#6.2
SELECT city.city, country.country FROM city INNER JOIN country ON city.country_id=country.country_id;

#6.3
SELECT address.address, city.city, country.country FROM city 
INNER JOIN country ON city.country_id=country.country_id
INNER JOIN address ON city.city_id=address.city_id;

#6.4
SELECT staff.staff_id, staff.first_name, staff.last_name, staff.email, address.address, city.city, country.country, address.phone 
FROM staff INNER JOIN address ON staff.address_id=address.address_id
INNER JOIN city ON address.city_id=city.city_id
INNER JOIN country ON city.country_id=country.country_id 
;

#6.5
SELECT inventory.store_id, rental.staff_id, COUNT(rental.rental_id) FROM rental 
INNER JOIN inventory ON rental.inventory_id=inventory.inventory_id
GROUP BY inventory.store_id, rental.staff_id;

#6.6
SELECT actor.first_name, actor.last_name, GROUP_CONCAT(film.title) FROM actor
INNER JOIN film_actor ON actor.actor_id=film_actor.actor_id
INNER JOIN film ON film_actor.film_id=film.film_id
GROUP BY actor.first_name, actor.last_name;


#6.7
SELECT actor.first_name, actor.last_name FROM actor 
INNER JOIN film_actor ON actor.actor_id=film_actor.actor_id
INNER JOIN film ON film.film_id=film_actor.film_id
WHERE film.title LIKE '%BLOOD%';

#6.8
SELECT customer.first_name, customer.last_name, customer.email, address.phone, address.address, city.city, 
country.country, staff.last_name 
FROM customer
INNER JOIN address ON customer.address_id=address.address_id
INNER JOIN city ON address.city_id=city.city_id
INNER JOIN country ON city.country_id=country.country_id
INNER JOIN staff ON customer.store_id=staff.store_id

WHERE customer.first_name LIKE 'CAROLYN' AND customer.last_name LIKE 'PEREZ'

;