use classicmodels;
-- problem 1 – Employee Bonus 
select employeeNumber AS EmployeeNumber, 
lastName AS Lastname,
firstName AS FirstName,
50000 AS Salary,
50000*0.1 AS Bonas,
50000+(50000*0.1) as Total
from employees;

-- Problem 2 – Product Price Increase 
select productName AS ProductName,
buyPrice AS BuyPrice,
buyPrice+500 AS NewBuyPrice
from products;

-- Problem 3 – Order Profit Estimate 
select productName AS ProductName,
buyPrice AS BuyPrice,
MSRP AS MSRP,
MSRP - buyPrice AS EstimatedProfit 
from products; 

-- Problem 4 – Premium Products
select  productName , buyPrice
from products
where buyPrice > 50;

-- problem 5 – Large Orders
select orderNumber, quantityOrdered
from orderdetails
where quantityOrdered >= 40;

-- Problem 6 – USA Customers
select customerName ,country
from customers
where country = 'USA';

-- Problem 7 – VIP Customers 
select customerName ,country
from customers
where country = 'USA' OR country = 'France';

-- Problem 8 – High Value Orders 
select orderNumber ,productCode ,orderLineNumber
from orderdetails
where quantityOrdered >30 AND priceEach >100;

-- Problem 9 – Exclude USA
select customerName ,country
from customers
where NOT country = 'USA';

-- Problem 10 – International Customers
select customerName ,country
from customers
where country IN ('USA','France','Germany');

-- Problem 11 – Selected Product Lines 
SELECT productName ,productLine
FROM products
WHERE productLine IN ('Motorcycles','Classic Cars','Planes');

SELECT * FROM employees;
-- Problem 12 – Selected Employees 
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE officeCode IN (1,4,7);

-- Problem 13 – Mid-Range Products 
SELECT productName, buyPrice
FROM products
WHERE buyPrice BETWEEN 30 AND 80;

-- Problem 14 – Medium Quantity Orders 
SELECT orderNumber,productCode, quantityOrdered
FROM orderdetails
WHERE quantityOrdered BETWEEN 20 AND 50;

-- Problem 15 – Office Codes
SELECT officeCode,city
FROM offices
WHERE officeCode BETWEEN 2 AND 5;

-- Problem 16 – Customer Search 
select customerName
from customers
where customerName like 'A%';

-- Problem 17 – Product Search 
select productCode, productName
from products
where productName like '%Ford%';

-- Problem 18 – Country Search 
select customerNumber, customerName
from customers
where country like '%land%';

-- Problem 19 – Product Name Pattern 
select * from products;
select productCode, productName
from products
where productName like '1969%';

-- Problem 20 – Employee Name Pattern
select firstName
from employees
where firstName like 'L%';

-- Problem 21 – Single Character Search 
select customerName
from customers
where customerName like 'A___';

