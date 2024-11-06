-- UNIONS (DISTINCT, ALL)
SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics
UNION ALL
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary
;


SELECT first_name, last_name, 'Old Male' AS Label
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'male'
UNION
SELECT first_name, last_name, 'Old Female' AS Label
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'female'
UNION
SELECT first_name, last_name, 'Highly Paid' AS Label
from parks_and_recreation.employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;