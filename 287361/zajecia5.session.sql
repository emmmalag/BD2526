#4.1
SELECT GROUP_CONCAT(last_name) as 'Aktorzy o dwuliterowych imionach' FROM actor WHERE LENGTH(first_name) = 2;

#4.2
SELECT title, INSERT(description, LOCATE('A', description), 1, '') as description FROM film 
WHERE description NOT LIKE '%BORING%' 
ORDER BY INSERT(description, LOCATE('A', description), 1, '');

#4.3
SELECT customer_id, CONCAT(COUNT(customer_id)*0.5, '$') as 'Dopłata' FROM rental 
WHERE rental_date BETWEEN '2005-07-01 00:00:00' AND '2005-08-31 23:59:59'
AND return_date >= '2005-08-31 23:59:59' 
GROUP BY customer_id;

#4.4
SELECT city_id, GROUP_CONCAT(DISTINCT district SEPARATOR ' oraz ') as Dystrykty 
FROM address GROUP BY city_id HAVING COUNT(DISTINCT district) > 1
ORDER BY  city_id DESC;

#4.5
SELECT staff_id, amount as kwota, SUM(amount) as zarobek FROM payment
GROUP BY staff_id, amount
ORDER BY zarobek DESC;

#4.6
SELECT SEC_TO_TIME(TIMESTAMPDIFF(SECOND, rental_date, return_date)) as msec FROM rental
WHERE return_date IS NOT NULL
ORDER BY msec DESC LIMIT 1;

SELECT SEC_TO_TIME(TIMESTAMPDIFF(SECOND, rental_date, return_date)) as msec FROM rental
WHERE return_date IS NOT NULL
ORDER BY msec ASC LIMIT 1;

#4.7
SELECT customer_id, AVG(TIMESTAMPDIFF(SECOND, rental_date, return_date)) as czas
FROM rental GROUP BY customer_id ORDER BY czas DESC LIMIT 1;

#4.8
SELECT customer_id, SUM(TIMESTAMPDIFF(SECOND, rental_date, return_date)) as czas
FROM rental GROUP BY customer_id ORDER BY czas DESC LIMIT 1;