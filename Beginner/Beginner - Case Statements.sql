-- CASE STATEMENTS

SELECT first_name, last_name, age,
CASE 
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN 'Really Old'
END AS Age_Bracket
FROM parks_and_recreation.employee_demographics
;

-- Pay increase and bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% Bonus

SELECT first_name,
last_name,
dept_id,
salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary + (salary * 0.07)
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.10
END AS Bonus
FROM parks_and_recreation.employee_salary
;

SELECT *
FROM parks_and_recreation.employee_salary;
SELECT *
FROM parks_and_recreation.parks_departments;