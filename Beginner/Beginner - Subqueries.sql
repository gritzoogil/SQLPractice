-- SUBQUERIES

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE employee_id IN 
				(SELECT employee_id
					FROM parks_and_recreation.employee_salary
                    WHERE dept_id = 1)
;


SELECT first_name, salary,
(SELECT AVG(salary) 
FROM parks_and_recreation.employee_salary)  AS avg_salary
FROM parks_and_recreation.employee_salary
;

SELECT AVG(Max_age) AS avg_max_age, AVG(Min_age) AS avg_min_age, AVG(Count) AS avg_count
FROM 
(SELECT gender, AVG(age), MAX(age) AS Max_age, MIN(age) AS Min_age, COUNT(age) AS Count
FROM parks_and_recreation.employee_demographics
GROUP BY gender) AS Agg_table
;