-- CTEs (common table expression)

# CTE example
WITH CTE_Example AS
(
SELECT gender, 
AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_Example
;


# Subquery example
SELECT AVG(avg_sal)
FROM (
SELECT gender, 
AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery
;