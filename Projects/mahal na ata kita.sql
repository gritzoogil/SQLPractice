CREATE DATABASE IF NOT EXISTS Guillermo_MidtermExam;

USE guillermo_midtermexam;

# Create tables
CREATE TABLE IF NOT EXISTS Customer (
	CustomerID VARCHAR(5) PRIMARY KEY,
    CustomerName VARCHAR(20),
    ShippingAddress VARCHAR(30),
    State VARCHAR(2)
);

CREATE TABLE IF NOT EXISTS Product (
	ProductID VARCHAR(5) PRIMARY KEY,
    ProductName VARCHAR(30),
    Price DECIMAL(6, 2)
);

CREATE TABLE IF NOT EXISTS Orders (
	OrderID VARCHAR(5) PRIMARY KEY,
    CustomerID VARCHAR(5),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

CREATE TABLE IF NOT EXISTS OrderLine (
	OrderID VARCHAR(5),
    ProductID VARCHAR(5),
    OrderedQuantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);

# Input Data
-- Customer
INSERT INTO Guillermo_MidtermExam.Customer (CustomerID, CustomerName, ShippingAddress, State)
VALUES
('C01', 'Drew Ruiz', '16 Ritter Ave', 'MI'),
('C02', 'Shaun Kim', '256 Murray St', 'VA'),
('C03', 'Jesse Cobb', '925 Daffodil Lane', 'VA'),
('C04', 'Clay Hall', '146 Brookview Drive', 'CA'),
('C05', 'Kelly Watts', '743 Simpson Ave', 'PA'),
('C06', 'Faith Wood', '33 Riverwood Drive', 'CA'),
('C07', 'Lila Hill', '294 Harry Place', 'FL'),
('C08', 'Rick Dunn', '73 Marigold Lane', 'VA'),
('C09', 'Kayla Fox', '557 Rosewood Lane', 'NY'),
('C10', 'Lillian Ball', '119 Frederick St', 'CA');

-- Product
INSERT INTO Guillermo_MidtermExam.Product (ProductID, ProductName, Price)
VALUES
('P101', 'Logitech Wireless Combo', '29.99'),
('P102', 'Logitech Advanced', '59.99'),
('P103', '4K High Speed HDMI Cable', '11.99'),
('P104', 'Apple Magic Mouse', '96.99'),
('P105', 'Logitech Webcam C925e', '99.99'),
('P106', 'Microsoft Surface Pen', '109.99'),
('P107', 'Microsoft Ergonomic Keyboard', '55.99'),
('P108', 'Apple Magic Trackpad', '156.99'),
('P109', 'Lenovo Essential Wired Combo', '35.99'),
('P110', 'Logitech Slim Wireless Combo', '49.99')
;

-- Orders
INSERT INTO Guillermo_MidtermExam.Orders (OrderID, CustomerID, OrderDate)
VALUES
('OR101', 'C03', '2023-01-15'),
('OR102', 'C07', '2023-01-30'),
('OR103', 'C01', '2023-01-30'),
('OR104', 'C03', '2023-02-25'),
('OR105', 'C08', '2023-03-12'),
('OR106', 'C03', '2023-03-20');

-- OrderLine
INSERT INTO Guillermo_MidtermExam.OrderLine (OrderID, ProductID, OrderedQuantity)
VALUES
('OR102', 'P108', '1'),
('OR102', 'P104', '1'),
('OR104', 'P110', '2'),
('OR106', 'P104', '1'),
('OR105', 'P101', '1');

# SQL Queries
-- Retrieve the records of the customers from the state of CA
SELECT *
FROM Guillermo_MidtermExam.customer
WHERE State = 'CA';

-- Retrieve the records of the products with the word Apple
SELECT *
FROM guillermo_midtermexam.Product
WHERE ProductName LIKE '%Apple%';

-- Create a view named CA Customers based on question number 1 *
CREATE VIEW `CA Customers` AS
SELECT *
FROM Guillermo_MidtermExam.customer
WHERE State = 'CA';

-- Add another column in the Customer table named City *
ALTER TABLE Customer
ADD City VARCHAR(10);

-- Count the number of customers from the state of VA
SELECT COUNT(*) AS VA_Customer_Count
FROM Guillermo_MidtermExam.Customer
WHERE State = 'VA';

-- Update the state of customer C01 to NY *
UPDATE Guillermo_MidtermExam.Customer
SET State = 'NY'
WHERE CustomerID = 'C01';

-- Retrieve the records of the products with prices greater than 99.99
SELECT *
FROM Product
WHERE Price > 99.99;

-- Delete the column 'City' in the Customer's table
ALTER TABLE Customer
DROP COLUMN City;

-- Using a single statement, retrieve the records of the customers from NY, FL, MI
SELECT *
FROM Customer
WHERE State IN ('NY', 'FL', 'MI');

-- Retrieve the records of the customers whose name has the second letter A
SELECT *
FROM Customer
WHERE CustomerName LIKE '_a%';