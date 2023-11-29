USE employees;

SELECT first_name, last_name FROM employees WHERE first_name = 'Maya' LIMIT 50;

SELECT CONCAT(first_name, ' ', last_name) FROM employees WHERE first_name = 'Maya' LIMIT 50;

SELECT CONCAT(first_name, ' ', last_name) AS name FROM employees WHERE first_name = 'Maya' LIMIT 50;

DESCRIBE employees;

SELECT CONCAT(month(birth_date), ' ', DAY(birth_date)) AS birthday, hire_date FROM employees ORDER BY hire_date DESC LIMIT 50;

SELECT DATEDIFF(hire_date, CURDATE()) / 365, hire_date FROM employees WHERE first_name = 'Maya' ORDER BY DATEDIFF(hire_date, CURDATE());