USE employees;

SHOW INDEXES FROM employees;

SHOW INDEXES FROM salaries;

SELECT emp_no, salary FROM salaries WHERE salary BETWEEN 60000 AND 62000;


# to create an index
# ALTER TABLE table_name ADD INDEX index_name (column_name);
ALTER TABLE salaries ADD INDEX salary_index (salary);

DROP INDEX salary_index ON salaries;

# syntax for unique index
# ALTER TABLE table_name ADD UNIQUE (column_names);

USE codeup_test_db;

SHOW TABLES;

SHOW CREATE TABLE quotes;

CREATE TABLE `quotes` (
                          `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                          `author` varchar(75) NOT NULL,
                          `content` varchar(500) NOT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE quotes ADD UNIQUE (content);

INSERT INTO quotes (content, author) VALUES ('Why do astronauts use Linux? They can\'t open Windows in space', 'THE Ryan Murray');

# This won't work now. Javier can't steal Ryan's joke
INSERT INTO quotes (content, author) VALUES ('Why do astronauts use Linux? They can\'t open Windows in space', 'Javier Ruedas');

USE employees;

SHOW TABLES;

DESCRIBE employees;

DESCRIBE titles;

DESCRIBE salaries;

DESCRIBE departments;

DESCRIBE dept_emp;

DESCRIBE dept_manager;

USE codeup_test_db;

SHOW INDEXES FROM albums;

DROP INDEX artist ON albums;

ALTER TABLE albums ADD UNIQUE unique_artist_and_album_combo (artist, name);

INSERT INTO albums (artist, name) VALUES ('Adele', '21');

USE employees;

SELECT employees.last_name, salaries.salary FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no LIMIT 100;

USE join_test_db;

SELECT users.name AS user, roles.name AS role FROM users JOIN roles ON roles.id = users.role_id;

# Here, users is the "left" table -- meaning, on the left hand of the JOIN
# MySQL takes ALL the rows from the left table
# and matches them to rows on the right table

SELECT users.name AS user, roles.name AS role FROM users LEFT JOIN roles ON roles.id = users.role_id;

# RIGHT JOIN version

SELECT users.name AS user, roles.name AS role FROM roles RIGHT JOIN users ON roles.id = users.role_id;

USE codeup_test_db;

SELECT first_name, albums.name FROM persons JOIN preferences ON persons.id = preferences.person_id JOIN albums ON preferences.album_id = albums.id;

USE employees;

SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS name, salary FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no WHERE salaries.to_date LIKE '9%' LIMIT 200;

# department managers' birth days : subqueries style
SELECT CONCAT(first_name, ' ', last_name), birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no FROM dept_manager
    );

# department managers' birth days : join style
SELECT CONCAT(first_name, ' ', last_name), birth_date
FROM employees JOIN dept_manager on employees.emp_no = dept_manager.emp_no;


