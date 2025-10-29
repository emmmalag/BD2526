#2.1
SELECT title FROM film ORDER BY title DESC LIMIT 3, 1;

#2.2
SELECT COUNT(*) FROM film WHERE description LIKE 'MAN %';
SELECT COUNT(*) FROM film WHERE description LIKE ' MAN ';

#2.3
SELECT COUNT(*) FROM film WHERE (description LIKE '% SUMO %') AND (title NOT LIKE '%A%') AND (film_id > length);

#2.4
SELECT * FROM film WHERE (description LIKE '%DOG%') AND (title LIKE '%WOLVES%');





#2.8
SELECT title FROM film WHERE ((description LIKE '%DOG%') OR (description LIKE '%CAT%')) AND (rating LIKE 'G');

#2.9
SELECT title FROM film WHERE 
((description LIKE '%DOG%') OR (description LIKE '%CAT%')) 
AND (rating LIKE 'G') 
AND (replacement_cost = 27.99) 
AND ((special_features LIKE '%Behind the Scenes%') 
AND (special_features NOT LIKE '%Deleted Scenes%'));

#2.10
SELECT COUNT(inventory_id) FROM inventory WHERE film_id IN
    (SELECT film_id FROM film WHERE 
    ((description LIKE '%DOG%') OR (description LIKE '%CAT%')) 
    AND (rating LIKE 'G') AND (replacement_cost = 27.99) 
    AND ((special_features LIKE '%Behind the Scenes%') 
    AND (special_features NOT LIKE '%Deleted Scenes%')))
    
    AND store_id LIKE '1';

SELECT COUNT(inventory_id) FROM inventory WHERE film_id IN
    (SELECT film_id FROM film WHERE 
    ((description LIKE '%DOG%') OR (description LIKE '%CAT%')) 
    AND (rating LIKE 'G') AND (replacement_cost = 27.99) 
    AND ((special_features LIKE '%Behind the Scenes%') 
    AND (special_features NOT LIKE '%Deleted Scenes%')))
    
    AND store_id LIKE '2';

SELECT DISTINCT store_id FROM inventory WHERE film_id IN
    (SELECT film_id FROM film WHERE 
    ((description LIKE '%DOG%') OR (description LIKE '%CAT%')) 
    AND (rating LIKE 'G') AND (replacement_cost = 27.99) 
    AND ((special_features LIKE '%Behind the Scenes%') 
    AND (special_features NOT LIKE '%Deleted Scenes%')));

#2.11

SELECT inventory_id FROM inventory WHERE film_id IN
    (SELECT film_id FROM film WHERE 
    ((description LIKE '%DOG%') OR (description LIKE '%CAT%')) 
    AND (rating LIKE 'G') AND (replacement_cost = 27.99) 
    AND ((special_features LIKE '%Behind the Scenes%') 
    AND (special_features NOT LIKE '%Deleted Scenes%')))
    
    AND store_id LIKE '2';

SELECT customer_id FROM rental WHERE inventory_id IN
    (SELECT inventory_id FROM inventory WHERE film_id IN
    (SELECT film_id FROM film WHERE 
    ((description LIKE '%DOG%') OR (description LIKE '%CAT%')) 
    AND (rating LIKE 'G') AND (replacement_cost = 27.99) 
    AND ((special_features LIKE '%Behind the Scenes%') 
    AND (special_features NOT LIKE '%Deleted Scenes%')))
    
    AND store_id LIKE '2'
    );

SELECT first_name, last_name FROM customer WHERE customer_id IN
    (SELECT customer_id FROM rental WHERE inventory_id IN
    (SELECT inventory_id FROM inventory WHERE film_id IN
    (SELECT film_id FROM film WHERE 
    ((description LIKE '%DOG%') OR (description LIKE '%CAT%')) 
    AND (rating LIKE 'G') AND (replacement_cost = 27.99) 
    AND ((special_features LIKE '%Behind the Scenes%') 
    AND (special_features NOT LIKE '%Deleted Scenes%')))
    
    AND store_id LIKE '2'
    ));

SELECT return_date FROM rental WHERE inventory_id IN
    (SELECT inventory_id FROM inventory WHERE film_id IN
    (SELECT film_id FROM film WHERE 
    ((description LIKE '%DOG%') OR (description LIKE '%CAT%')) 
    AND (rating LIKE 'G') AND (replacement_cost = 27.99) 
    AND ((special_features LIKE '%Behind the Scenes%') 
    AND (special_features NOT LIKE '%Deleted Scenes%')))
    
    AND store_id LIKE '2');

#2.12

 SELECT first_name, last_name, active FROM customer WHERE customer_id IN
    (SELECT customer_id FROM rental WHERE inventory_id IN
    (SELECT inventory_id FROM inventory WHERE film_id IN
    (SELECT film_id FROM film WHERE 
    ((description LIKE '%DOG%') OR (description LIKE '%CAT%')) 
    AND (rating LIKE 'G') AND (replacement_cost = 27.99) 
    AND ((special_features LIKE '%Behind the Scenes%') 
    AND (special_features NOT LIKE '%Deleted Scenes%')))
    
    AND store_id LIKE '2'
    ));

#2.13

SELECT phone FROM address WHERE address_id IN
    (SELECT address_id FROM customer WHERE customer_id IN
        (SELECT customer_id FROM rental WHERE inventory_id IN
    (SELECT inventory_id FROM inventory WHERE film_id IN
    (SELECT film_id FROM film WHERE 
    ((description LIKE '%DOG%') OR (description LIKE '%CAT%')) 
    AND (rating LIKE 'G') AND (replacement_cost = 27.99) 
    AND ((special_features LIKE '%Behind the Scenes%') 
    AND (special_features NOT LIKE '%Deleted Scenes%')))
    
    AND store_id LIKE '2'
    AND active LIKE '1'
    )));

#2.14

SELECT COUNT(film_id) FROM film_actor WHERE actor_id IN
(SELECT DISTINCT last_name FROM actor WHERE first_name LIKE '%PENELOPE%');
 

