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

INSERT INTO quotes (content, author) VALUES ('Why do astronauts use Linux? They can\'t open Windows in space', 'Javier Ruedas');