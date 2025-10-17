 --Create Tables with SQL
-- Create Database
CREATE DATABASE CarRentalManagementSystem;
GO

USE CarRentalManagementSystem;
GO

-- 1. Customer Table
CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255)
);
SELECT * FROM Customer;

-- 2. Car Table
CREATE TABLE Car (
    CarID INT IDENTITY(1,1) PRIMARY KEY,
    CarModel VARCHAR(100) NOT NULL,
    Manufacturer VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Color VARCHAR(30),
    RentalRate DECIMAL(10,2) NOT NULL,
    Availability BIT DEFAULT 1
);
SELECT * FROM Car;

-- 3. Location Table
CREATE TABLE Location (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    LocationName VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(15)
);
SELECT * FROM Location;

-- 4. Rental Table
CREATE TABLE Rental (
    RentalID INT IDENTITY(1,1) PRIMARY KEY,
    CarID INT NOT NULL,
    CustomerID INT NOT NULL,
    RentalStartDate DATE NOT NULL,
    RentalEndDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CarID) REFERENCES Car(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
SELECT * FROM Rental;

-- 5. Payment Table
CREATE TABLE Payment (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    RentalID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    FOREIGN KEY (RentalID) REFERENCES Rental(RentalID)
);
SELECT * FROM Payment;

-- 6. Insurance Table
CREATE TABLE Insurance (
    InsuranceID INT IDENTITY(1,1) PRIMARY KEY,
    CarID INT NOT NULL UNIQUE,
    InsuranceProvider VARCHAR(100) NOT NULL,
    PolicyNumber VARCHAR(50) UNIQUE NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
);
SELECT * FROM Insurance;

-- 7. Reservation Table
CREATE TABLE Reservation (
    ReservationID INT IDENTITY(1,1) PRIMARY KEY,
    CarID INT NOT NULL,
    CustomerID INT NOT NULL,
    ReservationDate DATE NOT NULL,
    PickupDate DATE NOT NULL,
    ReturnDate DATE NOT NULL,
    FOREIGN KEY (CarID) REFERENCES Car(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
SELECT * FROM Reservation;

-- 8. Maintenance Table
CREATE TABLE Maintenance (
    MaintenanceID INT IDENTITY(1,1) PRIMARY KEY,
    CarID INT NOT NULL,
    MaintenanceDate DATE NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
);
SELECT * FROM Maintenance;


--Insert Sample Data
-- Insert sample data into Customer table
INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber, Address) VALUES
('Duncan', 'Ochieng', 'duncan@email.com', '0712345421', 'Siaya'),
('Mwaniki', 'Tiffany', 'tyf@email.com', '0189765489', 'Nairobi'),
('Max', 'Millan', 'max@email.com', '0799782276', 'Eldoret'),
('Isac', 'Miles', 'miles@email.com', '0767096782', 'Mombasa'),
('Asha', 'Debora', 'deb@email.com', '0756978923', 'Nakuru');
SELECT * FROM Customer;

-- Insert sample data into Car table
INSERT INTO Car (CarModel, Manufacturer, Year, Color, RentalRate, Availability) VALUES
('Camry', 'Toyota', 2022, 'Silver', 45.00, 1),
('Civic', 'Honda', 2023, 'Blue', 40.00, 1),
('Model 3', 'Tesla', 2023, 'White', 80.00, 0),
('Accord', 'Honda', 2022, 'Black', 50.00, 1),
('Rogue', 'Nissan', 2023, 'Red', 55.00, 1);
SELECT * FROM Car;

-- Insert sample data into Location table
INSERT INTO Location (LocationName, Address, ContactNumber) VALUES
('Nairobi', '123 Nairobi, NY', '111-222-3333'),
('Kisumu', '456 Kisumu', '111-222-3334'),
('Nakuru', '789 Nakuru', '111-222-3335'),
('Mombasa', '321 Mombasa', '111-222-3336'),
('Meru', '654 Meru', '111-222-3337');
SELECT * FROM Location;

-- Insert sample data into Rental table
INSERT INTO Rental (CarID, CustomerID, RentalStartDate, RentalEndDate, TotalAmount) VALUES
(1, 1, '2024-01-15', '2024-01-20', 225.00),
(2, 2, '2024-01-16', '2024-01-19', 120.00),
(3, 3, '2024-01-17', '2024-01-22', 400.00),
(4, 4, '2024-01-18', '2024-01-21', 150.00),
(5, 5, '2024-01-19', '2024-01-25', 330.00);
SELECT * FROM Rental;

-- Insert sample data into Payment table
INSERT INTO Payment (RentalID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2024-01-20', 5000, 'Credit Card'),
(2, '2024-01-19', 10000, 'Debit Card'),
(3, '2024-01-22', 15000, 'Credit Card'),
(4, '2024-01-21', 20000, 'Cash'),
(5, '2024-01-25', 10000, 'Credit Card');
SELECT * FROM Payment;

-- Insert sample data into Insurance table
INSERT INTO Insurance (CarID, InsuranceProvider, PolicyNumber, StartDate, EndDate) VALUES
(1, 'Britam', 'GCI123456', '2024-01-01', '2024-12-31'),
(2, 'Direct Line', 'SF789012', '2024-01-01', '2024-12-31'),
(3, 'Jubilee', 'PRO345678', '2024-01-01', '2024-12-31'),
(4, 'Allstate', 'ALL901234', '2024-01-01', '2024-12-31'),
(5, 'State farm', 'LM567890', '2024-01-01', '2024-12-31');
SELECT * FROM Insurance;

-- Insert sample data into Reservation table
INSERT INTO Reservation (CarID, CustomerID, ReservationDate, PickupDate, ReturnDate) VALUES
(1, 2, '2024-02-01', '2024-02-10', '2024-02-15'),
(2, 3, '2024-02-02', '2024-02-11', '2024-02-16'),
(3, 4, '2024-02-03', '2024-02-12', '2024-02-17'),
(4, 5, '2024-02-04', '2024-02-13', '2024-02-18'),
(5, 1, '2024-02-05', '2024-02-14', '2024-02-19');
SELECT * FROM Reservation;

-- Insert sample data into Maintenance table
INSERT INTO Maintenance (CarID, MaintenanceDate, Description, Cost) VALUES
(1, '2024-01-10', 'Oil change and tire rotation', 75.00),
(2, '2024-01-11', 'Brake pad replacement', 200.00),
(3, '2024-01-12', 'Battery check and software update', 150.00),
(4, '2024-01-13', 'Air filter replacement', 50.00),
(5, '2024-01-14', 'Windshield wiper replacement', 40.00);
SELECT * FROM Maintenance;

--CRUD OPERATIONS
-- CREATE: Insert new customer
INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber, Address) 
VALUES ('Jennifer', 'Lee', 'lee@email.com', '0711983478', 'Nairobi');
SELECT * FROM Customer;

-- READ: Select all available cars
SELECT * FROM Car WHERE Availability = 1;

-- UPDATE: Update car rental rate
UPDATE Car SET RentalRate = 48.00 WHERE CarID = 1;

-- UPDATE: Mark a car as unavailable after rental
UPDATE Car SET Availability = 0 WHERE CarID = 3;

-- DELETE: Remove a reservation
DELETE FROM Reservation WHERE ReservationID = 5;


--ADVANCED QUERIES
-- Filtering and sorting:
SELECT r.RentalID, c.FirstName, c.LastName, car.CarModel, r.TotalAmount
FROM Rental r
JOIN Customer c ON r.CustomerID = c.CustomerID
JOIN Car car ON r.CarID = car.CarID
WHERE r.TotalAmount > 200
ORDER BY r.TotalAmount DESC;

-- JOIN query: Get rental details with customer and car information
SELECT 
    r.RentalID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    car.CarModel,
    car.Manufacturer,
    r.RentalStartDate,
    r.RentalEndDate,
    r.TotalAmount,
    p.PaymentMethod
FROM Rental r
JOIN Customer c ON r.CustomerID = c.CustomerID
JOIN Car car ON r.CarID = car.CarID
JOIN Payment p ON r.RentalID = p.RentalID;

-- Subquery: Find customers who have rented Tesla cars
SELECT FirstName, LastName, Email
FROM Customer
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM Rental 
    WHERE CarID IN (
        SELECT CarID 
        FROM Car 
        WHERE Manufacturer = 'Tesla'
    )
);

-- Aggregate query: Get total revenue by car manufacturer
SELECT 
    Manufacturer,
    COUNT(r.RentalID) AS TotalRentals,
    SUM(r.TotalAmount) AS TotalRevenue
FROM Car c
LEFT JOIN Rental r ON c.CarID = r.CarID
GROUP BY Manufacturer
ORDER BY TotalRevenue DESC;

-- User Defined Function: Calculate rental duration in days
CREATE FUNCTION dbo.CalculateRentalDuration(@StartDate DATE, @EndDate DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(DAY, @StartDate, @EndDate);
END;
GO

-- Use the UDF in a query
SELECT 
    RentalID,
    RentalStartDate,
    RentalEndDate,
    dbo.CalculateRentalDuration(RentalStartDate, RentalEndDate) AS RentalDays,
    TotalAmount
FROM Rental;

-- Complex query: Get maintenance history with car details
SELECT 
    c.CarModel,
    c.Manufacturer,
    m.MaintenanceDate,
    m.Description,
    m.Cost
FROM Maintenance m
JOIN Car c ON m.CarID = c.CarID
ORDER BY m.MaintenanceDate DESC;

-- Update with join: Increase rental rate for all Honda cars by 10%
UPDATE Car 
SET RentalRate = RentalRate * 1.10 
WHERE Manufacturer = 'Honda';

-- Delete with subquery: Remove rentals that are over 1 year old
DELETE FROM Payment 
WHERE RentalID IN (
    SELECT RentalID 
    FROM Rental 
    WHERE RentalStartDate < DATEADD(YEAR, -1, GETDATE())
);

DELETE FROM Rental 
WHERE RentalStartDate < DATEADD(YEAR, -1, GETDATE());