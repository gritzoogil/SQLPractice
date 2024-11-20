USE `Technical Test`;

CREATE TABLE customers (
	Customer_ID INT NOT NULL,
	`Name` VARCHAR(50) NOT NULL
);

CREATE TABLE `order` (
	Order_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    Total INT NOT NULL
);

INSERT INTO customers (Customer_ID, `Name`)
VALUES
(1, 'Jerry'),
(2, 'Josh'),
(3, 'Henry'),
(4, 'Molly'),
(5, 'Abe'),
(6, 'Sue');

SELECT *
FROM customers;

INSERT INTO `order` (Order_ID, Customer_ID, Total)
VALUES
(1, 1, 100),
(2, 1, 75),
(3, 3, 500),
(4, 4, 450),
(5, 2, 200),
(6, 1, 300);

SELECT *
FROM `order`;

-- Query that return the Customer ID, name of the customer, and the sum of their purchases.
SELECT c.Customer_ID, `Name`, SUM(total)
FROM customers AS c
JOIN `order` AS o
	ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, `Name`
ORDER BY c.Customer_ID;