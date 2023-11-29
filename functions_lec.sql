USE employees;

SELECT first_name, last_name FROM employees WHERE first_name = 'Maya' LIMIT 50;

SELECT CONCAT(first_name, ' ', last_name) FROM employees WHERE first_name = 'Maya' LIMIT 50;

SELECT CONCAT(first_name, ' ', last_name) AS name FROM employees WHERE first_name = 'Maya' LIMIT 50;

DESCRIBE employees;

SELECT CONCAT(month(birth_date), ' ', DAY(birth_date)) AS birthday, hire_date FROM employees ORDER BY hire_date DESC LIMIT 50;

SELECT DATEDIFF(hire_date, CURDATE()) / 365, hire_date FROM employees WHERE first_name = 'Maya' ORDER BY DATEDIFF(hire_date, CURDATE());

SELECT COUNT(*) FROM employees;

SELECT gender, COUNT(*) FROM employees GROUP BY gender;

SELECT last_name, COUNT(last_name) AS quantity FROM employees GROUP BY last_name;

USE codeup_test_db;

SELECT AVG(sales) FROM albums;

SELECT artist, AVG(sales) FROM albums GROUP BY artist ORDER BY AVG(sales) DESC;

SELECT artist, TRUNCATE(AVG(sales), 2) AS average_sales FROM albums GROUP BY artist ORDER BY average_sales DESC;

USE employees;

SELECT TRUNCATE(MAX(DATEDIFF(hire_date, birth_date)/365), 2) FROM employees;
SELECT TRUNCATE(MIN(DATEDIFF(hire_date, birth_date)/365), 2) FROM employees;
