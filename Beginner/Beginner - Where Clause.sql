-- Where -- Claus
SELECT *
FROM employee_salary
WHERE first_name = 'Leslie'
;

SELECT *
FROM employee_salary
WHERE salary >= 50000
;

SELECT *
FROM employee_demographics
WHERE gender != 'Male'
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;

-- AND OR NOT -- Logical Operators
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'Female'
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'Female'
;

SELECT * 
FROM employee_demographics
WHERE (age > 44) OR gender = 'female'
;

-- LIKE Statement (%,_)
# % is any characters
# _ is number of characters
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%'
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__%'
;