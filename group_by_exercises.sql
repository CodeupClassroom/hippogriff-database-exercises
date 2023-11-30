USE employees;

SELECT DISTINCT title FROM titles;

SELECT * FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e' GROUP BY last_name;

SELECT CONCAT(first_name, ' ',last_name) AS full_name FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e' GROUP BY full_name;

SELECT COUNT(last_name), last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%' GROUP BY last_name;

SELECT COUNT(*), gender FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') GROUP BY gender;