use classicmodels;

-- Problem 1 – Total Sales
select * from payments;
select sum(customerNumber) as totalsum
-- group by customerNumber
from payments;

-- Problem 2 – Customer Statistics 
-- select count(customerName),max(creditLimit),min(creditLimit),avg(creditLimit)
-- from customers;
SELECT
    COUNT(customerName) AS TotalCustomers,
    MAX(creditLimit) AS HighestCreditLimit,
    MIN(creditLimit) AS LowestCreditLimit,
    AVG(creditLimit) AS AverageCreditLimit
FROM customers;

-- Problem 3 – Product Price Analysis 
SELECT
    MAX(buyPrice) AS HighestbuyPrice,
    MIN(buyPrice) AS LowestbuyPrice,
    AVG(buyPrice) AS AveragebuyPrice
FROM products;

-- Problem 4 – Customers by Country 
select count(customerNumber), country
from customers
group by country;

-- Problem 5 – Employees by Office
 select count(employeeNumber) as emp_count,officeCode
 from employees
 group by officeCode;
 
--  Problem 6 – Products by Product Line 
 select count(productName),productLine
 from products
 group by productLine; 
 
--  Problem 7 – Highest Credit Customers 
SELECT customerName, creditLimit
FROM customers
ORDER BY creditLimit DESC;

-- Problem 8 –  Cheapest Products 
SELECT productName, buyPrice
FROM products
ORDER BY buyPrice ASC;

-- Problem 9 –  Employees Alphabetically 
SELECT lastName, firstName
FROM employees
ORDER BY lastName ,firstName ASC;

-- Problem 10 – Top Customers 
SELECT customerName, creditLimit
FROM customers
ORDER BY creditLimit DESC
limit 0,5;

-- Problem 11 – Lowest Price Products 
SELECT productName, buyPrice
FROM products
ORDER BY buyPrice ASC
limit 10;

-- Problem 12 –  Recent Orders 
SELECT orderNumber, orderDate
FROM orders
ORDER BY orderNumber DESC
limit 7;

-- Problem 13 – Countries with Many Customers 

SELECT
    country,
    COUNT(*) AS TotalCustomers
FROM customers
GROUP BY country
HAVING COUNT(*) > 5;

-- Problem 14 – Product Lines 
select productLine , count(productName)
from products
group by productLine
having count(productName)>10;

-- Problem 15 – Busy Offices 
select officeCode, count(*)
from  employees
group by officeCode
having count(*)>2

-- Problem 16 – Customer Orders
SELECT
    c.customerName,
    o.orderNumber,
    o.orderDate
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber;

-- Problem 17 – Employee Offices 
SELECT
    c.firstName,
    o.city,
    o.country
FROM employees AS c
INNER JOIN offices AS o
ON c.officeCode = o.officeCode;

SELECT
    c.firstName,
    o.city,
    o.country
FROM employees AS c
left JOIN offices AS o
ON c.officeCode = o.officeCode;


-- Problem 18 – Customer Report 
SELECT
    c.customerName,
    o.orderNumber
FROM customers AS c
LEFT JOIN orders AS o
ON c.customerNumber = o.customerNumber;

-- Problem 19 –  Employee Report 
SELECT
    e.firstName AS EmployeeName,
    c.customerName AS CustomerName
FROM employees AS e
LEFT JOIN customers AS c
ON e.employeeNumber = c.salesRepEmployeeNumber;


-- Problem 20 – Office Report 

SELECT
    o.city AS OfficeCity,
    e.firstName AS EmployeeName
FROM offices AS o
LEFT JOIN employees AS e
ON o.officeCode = e.officeCode;


-- Problem 21 – Customer & Orders 
SELECT
    c.customerName,
    o.orderNumber
FROM customers AS c
LEFT JOIN orders AS o
ON c.customerNumber = o.customerNumber

UNION

SELECT
    c.customerName,
    o.orderNumber
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customerNumber = o.customerNumber;


-- Problem 22 – Student Table 

CREATE TABLE students (
    Stu_ID INT PRIMARY KEY,
    Name VARCHAR(10) NOT NULL,
    Email VARCHAR(20) UNIQUE,
    Age INT CHECK (Age >= 18)
);

-- Problem 23 – Courses Table
CREATE TABLE courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50) UNIQUE,
    Duration VARCHAR(20) NOT NULL
);

-- Problem 24 – Enrollments Table 

CREATE TABLE enrollments (
    Stu_ID INT,
    Course_ID INT,
    Enrollment_Date DATE,

    PRIMARY KEY (Stu_ID, Course_ID),

    FOREIGN KEY (Stu_ID)
    REFERENCES students(Stu_ID),

    FOREIGN KEY (Course_ID)
    REFERENCES courses(Course_ID)
);

-- Mini Challenge 
 
-- The Manager needs a dashboard report. 
-- Write SQL queries to display: 

-- • Top 5 customers by credit limit  
SELECT customerName, creditLimit
FROM customers
ORDER BY creditLimit DESC
LIMIT 5;

-- • Number of customers in each country  
SELECT country, COUNT(*) AS TotalCustomers
FROM customers
GROUP BY country;

-- • Product lines with more than 10 products 
SELECT productLine, COUNT(*) AS TotalProducts
FROM products
GROUP BY productLine
HAVING COUNT(*) > 10; 

-- • Customer name with their order number 
SELECT c.customerName, o.orderNumber
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber; 

-- • Employees with office city  
SELECT e.firstName AS EmployeeName,
       o.city AS OfficeCity
FROM employees AS e
INNER JOIN offices AS o
ON e.officeCode = o.officeCode;

-- • Average product price  
SELECT AVG(buyPrice) AS AverageProductPrice
FROM products;

-- • Highest payment received  
SELECT MAX(amount) AS HighestPayment
FROM payments;

-- • Total number of products
SELECT COUNT(*) AS TotalProducts
FROM products;





