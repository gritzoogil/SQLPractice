-- JOINS
SELECT *
FROM parks_and_recreation.employee_demographics
;

SELECT *
FROM parks_and_recreation.employee_salary
;

-- INNER JOIN
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, age, occupation
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- RIGHT OUTER JOIN
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
RIGHT JOIN parks_and_recreation.employee_salary AS sal # return missing values from right to left as null
	ON dem.employee_id = sal.employee_id
;

-- LEFT OUTER JOIN
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
LEFT JOIN parks_and_recreation.employee_salary AS sal # doesnt return values from right if it doesnt have any match from left
	ON dem.employee_id = sal.employee_id
;

-- SELF JOIN
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_employee,
emp2.last_name AS last_name_employee
FROM parks_and_recreation.employee_salary AS emp1
JOIN parks_and_recreation.employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

-- JOINING MULTIPLE TABLES TOGETHER
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_and_recreation.parks_departments AS pd
	ON sal.dept_id = pd.department_id
;

SELECT *
FROM parks_and_recreation.parks_departments
;