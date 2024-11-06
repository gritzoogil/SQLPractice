-- TEMPORARY TABLES

# first way to create temp table
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('Gil', 'Guillermo', 'Hell House LLC');

SELECT *
FROM temp_table;



# second way to create temp table
CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k
;