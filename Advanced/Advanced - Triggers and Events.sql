-- TRIGGER
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON parks_and_recreation.employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO parks_and_recreation.employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Gil', 'Guillermo', 'Janitor', 1000000, NULL);
SELECT *
FROM employee_salary;
SELECT *
FROM employee_demographics;

-- EVENTS
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE 
    FROM parks_and_recreation.employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;
SELECT *
FROM employee_demographics;

SHOW VARIABLES LIKE 'event%'; # if not working