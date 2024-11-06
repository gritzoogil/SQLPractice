-- GROUP BY
SELECT gender # has to match the GROUP BY
FROM parks_and_recreation.employee_demographics
GROUP BY gender # has to match the SELECT
;

SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

SELECT occupation
FROM parks_and_recreation.employee_salary
GROUP BY occupation
;

SELECT occupation, salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation, salary
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

-- ORDER BY
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY birth_date DESC
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY 5, 4 # not recommended
;