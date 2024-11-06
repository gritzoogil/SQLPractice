-- WINDOW FUNCTIONS (PARTITION BY)

# group by example
SELECT gender, AVG(salary) AS avg_salary
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

# windows function
SELECT dem.first_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


# windows function
SELECT dem.employee_id, dem.first_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_total
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY sal.salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY sal.salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY sal.salary DESC) AS dense_rank_num
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;