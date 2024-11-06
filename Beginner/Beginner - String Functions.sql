-- STRING FUNCTIONS
SELECT first_name, LENGTH(first_name) AS first_name_length
FROM employee_demographics
ORDER BY 2
;

SELECT first_name, UPPER(first_name) # or LOWER()
FROM parks_and_recreation.employee_demographics
;

SELECT TRIM('			boy				') AS trim;
SELECT LTRIM('			boy			') AS l_trim;
SELECT RTRIM('			boy			') AS r_trim;

SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM parks_and_recreation.employee_demographics
;

SELECT first_name, REPLACE(first_name, 'e', 'z')
FROM parks_and_recreation.employee_demographics
;

SELECT first_name, LOCATE('e', first_name)
FROM parks_and_recreation.employee_demographics
;

SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) AS full_name
FROM parks_and_recreation.employee_demographics
;