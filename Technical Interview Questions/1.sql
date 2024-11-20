CREATE DATABASE `Technical Test`;
USE `Technical Test`;

CREATE TABLE employees (
	Employee_ID INT NOT NULL,
    Emp_Name VARCHAR(50) NOT NULL
);

CREATE TABLE employees_test (
	Test_Date DATE NOT NULL,
    Employee_ID INT NOT NULL
);

INSERT INTO employees (Employee_ID, Emp_Name)
VALUES
(1, 'Josh'),
(2, 'Sally'),
(3, 'Kevin'),
(4, 'Rob'),
(5, 'Amanda'),
(6, 'Kelly');

SELECT *
FROM employees;

INSERT INTO employees_test (Test_Date, Employee_ID)
VALUES
('2022-01-01', 1),
('2022-02-02', 2),
('2022-03-03', 3),
('2022-04-04', 4);

SELECT *
FROM employees_test;

-- Query that returns a list of names who have not scheduled their tests yet.
SELECT Employee_ID, Emp_Name
FROM employees
WHERE Employee_ID NOT IN
	(SELECT Employee_ID
	FROM employees_test);
