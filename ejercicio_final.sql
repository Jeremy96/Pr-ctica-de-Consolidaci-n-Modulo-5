-- Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor
-- Customer
INSERT INTO customer (store_id, first_name, last_name, email, address_id, create_date, active)
VALUES (1, 'Jeremy', 'Morales', 'jeremy_morales@gmail.com', 5, CURRENT_DATE, 1);

UPDATE customer
SET email = 'email_de_prueba@gmail.com'
WHERE customer_id = 600;

-- En algunos casos no se puede eliminar, ya que customer esta asociado a otra tabla
DELETE FROM customer
WHERE customer_id = 600;

-- Staff
INSERT INTO staff (first_name, last_name, address_id, email, store_id, username, password)
VALUES ('Jeremy', 'Morales', 1, 'jeremy_morales@hotmail.com', 5, 'jeremy_morales', 'admin123');

UPDATE staff
SET email = 'email_de_prueba@gmail.com'
WHERE staff_id = 3;

DELETE FROM staff
WHERE staff_id = 3;

-- Actor
INSERT INTO actor (first_name, last_name)
VALUES ('Jeremy', 'Morales');

UPDATE actor
SET first_name = 'Patricio'
WHERE first_name = 'Jeremy';

DELETE FROM actor
WHERE actor_id = 201;

--Listar todas las “rental” con los datos del “customer” dado un año y mes.
SELECT rental.rental_id AS id_renta, rental.rental_date AS fecha_renta, customer.customer_id as id_cliente, customer.first_name AS nombre, customer.last_name AS apellido, customer.email as correo
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT(YEAR FROM rental.rental_date) = 2005 AND EXTRACT(MONTH FROM rental.rental_date) = 06;

--Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.
SELECT payment_id as numero, payment_date as fecha, amount as total
FROM payment;

--Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.
SELECT *
FROM film
WHERE release_year = 2006 AND rental_rate > 4.0;