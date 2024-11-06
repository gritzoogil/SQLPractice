-- STORED PROCEDURES
USE `parks_and_recreation`;
DROP PROCEDURE IF EXISTS `large_salaries()`;
CREATE PROCEDURE large_salaries()
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000
;
CALL large_salaries();

USE `parks_and_recreation`;
DROP PROCEDURE IF EXISTS `large_salaries3()`;
DELIMITER $$
CREATE PROCEDURE large_salaries3(employee_id_param INT)
BEGIN
	SELECT *
	FROM parks_and_recreation.employee_salary
    WHERE employee_id = employee_id_param
    ;
END $$
DELIMITER ;
CALL large_salaries3(1);

