CREATE DATABASE IF NOT EXISTS fraud_db;
USE fraud_db;

DROP VIEW IF EXISTS Fraud_Report;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS customer_profiles;

CREATE TABLE customer_profiles (
    CustomerID VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE transactions (
    TransactionID VARCHAR(20) PRIMARY KEY,
    CustomerID VARCHAR(20),
    Amount DECIMAL(10,2),
    Category VARCHAR(50),
    IsFraud INT,
    FOREIGN KEY (CustomerID) REFERENCES customer_profiles(CustomerID)
);

INSERT INTO customer_profiles VALUES 
('C001', 'Sonali', 'Mumbai'), 
('C002', 'Rahul', 'Delhi'), 
('C003', 'Amit', 'Bangalore');

INSERT INTO transactions VALUES 
('T101', 'C001', 500, 'Electronics', 0), 
('T102', 'C002', 15000, 'Luxury', 1), 
('T103', 'C001', 200, 'Groceries', 0), 
('T104', 'C003', 12000, 'Electronics', 1);

CREATE VIEW Fraud_Report AS
SELECT 
    c.Name, 
    c.City, 
    t.Amount, 
    t.Category 
FROM transactions t
JOIN customer_profiles c ON t.CustomerID = c.CustomerID
WHERE t.IsFraud = 1;

SELECT * FROM Fraud_Report;