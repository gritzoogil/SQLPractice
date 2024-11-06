-- LIMIT
SELECT *
FROM parks_and_recreation.employee_demographics
LIMIT 3
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC
LIMIT 2, 1 # start at position 2, then take the next 1 row
;

-- ALIASING
SELECT gender, AVG(age) AS avg_age # 'AS' is not required
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40
;