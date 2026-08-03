use classicmodels;

-- Problem 1 – Highest Credit Customer 
SELECT customerName, creditLimit
FROM customers
WHERE creditLimit = (
    SELECT MAX(creditLimit)
    FROM customers
);


-- Problem 2 – Expensive Products
SELECT productName, buyPrice
FROM products
WHERE buyPrice > (
    SELECT AVG(buyPrice)
    FROM products
);

-- Problem 3 – Employees Managing Customers 
SELECT lastName, employeeNumber
FROM employees
WHERE employeeNumber in (
    SELECT salesRepEmployeeNumber
    FROM customers
);

-- Problem 4 – Multiple Row Subquery
SELECT customerName, country
FROM customers
WHERE country IN (
    SELECT country
    FROM customers
    GROUP BY country
    HAVING COUNT(*) > 1
);


-- Problem 5 – Correlated Subquery 
SELECT customerName, creditLimit
FROM customers c1
WHERE creditLimit > (
    SELECT AVG(creditLimit)
    FROM customers c2
    WHERE c2.country = c1.country
);

-- Problem 6 – Nested Subquery 
SELECT customerName , amount
FROM customers as c join payments as p on c.customerNumber = p.customerNumber
where amount = (
	select max(amount)
    from payments
);

-- Problem 7 – Student Table 
CREATE TABLE Stud(
studentID INT PRIMARY KEY,
Name VARCHAR(10) NOT NULL,
Email VARCHAR(50) UNIQUE,
AGE INT CHECK(AGE>=18)
);

-- Problem 8 – Modify Table 
ALTER TABLE Stud ADD COLUMN phone_number VARCHAR(10);

-- Problem 9 – Department Table 
CREATE TABLE departments (
DepartmentID INT,
DepartmentName VARCHAR(10),
Location VARCHAR(50)
);
ALTER TABLE departments RENAME COLUMN Location TO Dept_Location;

-- Problem 10 – Insert Records 
INSERT INTO Stud VALUES(1,'Lucky','lalithasingupurapu@.com',19,'9876543210');
INSERT INTO Stud VALUES(2,'lalli','lalithsingupurapu@.com',18,'098765');
INSERT INTO Stud VALUES(3,'likki','likkisingupurapu@.com',20,'098765');
INSERT INTO Stud VALUES(4,'pavan','pavansingupurapu@.com',19,'098765');
INSERT INTO Stud VALUES(5,'srinu','srinusingupurapu@.com',27,'098765');

-- Problem 11 – Update Records 
 UPDATE Stud set Email = 'luckysingupurapu@.com' where studentID =1;

-- Problem 12 – Delete Records 
DELETE FROM Stud WHERE studentID = 5;
SELECT *FROM Stud;

-- Problem 13 – Connect Python to MySQL 
-- DATABASE CONNECTION SUCCESSFUL

-- Problem 14 – Read SQL Data in Python
-- import mysql.connector as sql

-- conn = sql.connect(
--     host="localhost",
--     user="root",
--     password="",
--     database="classicmodels"
-- )
-- print("Connected Successfully!")
# SQL Query
-- query = """
-- SELECT customerName, country, creditLimit
-- FROM customers;
-- """
-- # Read SQL data into a Pandas DataFrame
-- df = pd.read_sql(query, conn)

-- # Display the first 10 records
-- print(df.head(10))

-- # Close the connection
-- conn.close()
-- Problem 15 – Product Report  
-- # SQL Query
-- query = """
-- SELECT productName, buyPrice, MSRP
-- FROM products;
-- """

-- # Read SQL data into a DataFrame
-- df = pd.read_sql(query, conn)

-- # Calculate Estimated Profit
-- df["Estimated Profit"] = df["MSRP"] - df["buyPrice"]

-- # Display the DataFrame
-- print(df)

-- # Close the connection
-- conn.close()