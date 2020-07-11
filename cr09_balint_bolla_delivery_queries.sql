--query1--
--How many rows are there in each table in the database?--

SELECT table_name, table_rows
   FROM INFORMATION_SCHEMA.TABLES
   WHERE TABLE_SCHEMA = 'cr09_balint_bolla_delivery';

--query2--
--Customers data with Customers address data--

SELECT * FROM `c_address`
INNER JOIN customer ON fk_c_address = address_id;

--query3--
--How many delivery are there which were sent from the customer to the company--

SELECT COUNT(Depo) FROM `locations` WHERE locations.Depo = "Depo";

--query4--
--How many deliveries were deposited in the last 2 days?--

SELECT `PS_id`, `deposited_timedate`, `received_timedate`, `fk_emp`
FROM `processing_system`
WHERE deposited_timedate BETWEEN '2020-07-08 00:00:00' AND '2020-07-10 23:59:59';

--query5--
--How many deliveries were picked up from the customers on 2020.07.08 and from which cities?--

SELECT locations.fk_l_type, l_type.PuP, processing_system.deposited_timedate
FROM locations
INNER JOIN l_type ON l_type.l_type_id = locations.fk_l_type
INNER JOIN employee ON employee.fk_location = location_id
INNER JOIN processing_system ON processing_system.fk_emp = employee.emp_id
WHERE processing_system.deposited_timedate BETWEEN '2020-07-08 00:00:00' AND '2020-07-08 23:59:59';

--query6--
--Who sent deliveries on 2020.07.08?--

SELECT customer.first_name, customer.last_name, processing_system.received_timedate
FROM customer
INNER JOIN transmit ON transmit.fk_customer = customer.customer_id
INNER JOIN packages ON packages.fk_transmit = transmit.transmit_id
INNER JOIN locations ON locations.fk_package = packages.package_id
INNER JOIN employee ON employee.fk_location = locations.location_id
INNER JOIN processing_system ON processing_system.fk_emp = employee.emp_id
WHERE processing_system.deposited_timedate BETWEEN '2020-07-08 00:00:00' AND '2020-07-08 23:59:59';
