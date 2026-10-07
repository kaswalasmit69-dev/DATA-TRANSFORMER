CREATE DATABASE DataTransformer;

USE DataTransformer;

Create Customers Table


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2023-06-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2023-06-20'),
(3, 'David', 'Brown', 'david.brown@email.com', '2023-07-01'),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '2023-07-05');

SELECT * FROM Customers;
+------------+-----------+----------+-----------------------+------------------+
| CustomerID | FirstName | LastName | Email                 | RegistrationDate |
+------------+-----------+----------+-----------------------+------------------+
|          1 | John      | Doe      | john.doe@email.com    | 2023-06-15       |
|          2 | Jane      | Smith    | jane.smith@email.com  | 2023-06-20       |
|          3 | David     | Brown    | david.brown@email.com | 2023-07-01       |
|          4 | Emily     | Davis    | emily.davis@email.com | 2023-07-05       |
+------------+-----------+----------+-----------------------+------------------+
4 rows in set (0.181 sec)


Create Orders Table

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-07-10', 1200.00),
(104, 3, '2023-07-15', 750.00),
(105, 2, '2023-07-20', 300.00);

SELECT * FROM Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|     101 |          1 | 2023-07-01 |      150.50 |
|     102 |          2 | 2023-07-03 |      200.75 |
|     103 |          1 | 2023-07-10 |     1200.00 |
|     104 |          3 | 2023-07-15 |      750.00 |
|     105 |          2 | 2023-07-20 |      300.00 |
+---------+------------+------------+-------------+
5 rows in set (0.012 sec)

Create Employees Table

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees
(EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-05-15', 60000),
(2, 'Susan', 'Lee', 'HR', '2021-08-20', 50000),
(3, 'Robert', 'Wilson', 'IT', '2019-03-10', 80000),
(4, 'Lisa', 'Taylor', 'Finance', '2022-01-25', 45000);

SELECT * FROM Employees;
+------------+-----------+----------+------------+------------+----------+
| EmployeeID | FirstName | LastName | Department | HireDate   | Salary   |
+------------+-----------+----------+------------+------------+----------+
|          1 | Mark      | Johnson  | Sales      | 2020-05-15 | 60000.00 |
|          2 | Susan     | Lee      | HR         | 2021-08-20 | 50000.00 |
|          3 | Robert    | Wilson   | IT         | 2019-03-10 | 80000.00 |
|          4 | Lisa      | Taylor   | Finance    | 2022-01-25 | 45000.00 |
+------------+-----------+----------+------------+------------+----------+
4 rows in set (0.145 sec)


QUERY 1 — INNER JOIN
SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID;
+---------+------------+-------------+------------+-----------+----------+-----------------------+
| OrderID | OrderDate  | TotalAmount | CustomerID | FirstName | LastName | Email                 |
+---------+------------+-------------+------------+-----------+----------+-----------------------+
|     101 | 2023-07-01 |      150.50 |          1 | John      | Doe      | john.doe@email.com    |
|     102 | 2023-07-03 |      200.75 |          2 | Jane      | Smith    | jane.smith@email.com  |
|     103 | 2023-07-10 |     1200.00 |          1 | John      | Doe      | john.doe@email.com    |
|     104 | 2023-07-15 |      750.00 |          3 | David     | Brown    | david.brown@email.com |
|     105 | 2023-07-20 |      300.00 |          2 | Jane      | Smith    | jane.smith@email.com  |
+---------+------------+-------------+------------+-----------+----------+-----------------------+
5 rows in set (0.101 sec)

QUERY 2 — LEFT JOIN
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;
+------------+-----------+----------+---------+------------+-------------+
| CustomerID | FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|          1 | John      | Doe      |     103 | 2023-07-10 |     1200.00 |
|          1 | John      | Doe      |     101 | 2023-07-01 |      150.50 |
|          2 | Jane      | Smith    |     105 | 2023-07-20 |      300.00 |
|          2 | Jane      | Smith    |     102 | 2023-07-03 |      200.75 |
|          3 | David     | Brown    |     104 | 2023-07-15 |      750.00 |
|          4 | Emily     | Davis    |    NULL | NULL       |        NULL |
+------------+-----------+----------+---------+------------+-------------+
6 rows in set (0.071 sec)

QUERY 3 — RIGHT JOIN
SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;
+---------+------------+-------------+------------+-----------+----------+
| OrderID | OrderDate  | TotalAmount | CustomerID | FirstName | LastName |
+---------+------------+-------------+------------+-----------+----------+
|     101 | 2023-07-01 |      150.50 |          1 | John      | Doe      |
|     102 | 2023-07-03 |      200.75 |          2 | Jane      | Smith    |
|     103 | 2023-07-10 |     1200.00 |          1 | John      | Doe      |
|     104 | 2023-07-15 |      750.00 |          3 | David     | Brown    |
|     105 | 2023-07-20 |      300.00 |          2 | Jane      | Smith    |
+---------+------------+-------------+------------+-----------+----------+
5 rows in set (0.014 sec)

QUERY 4 — FULL OUTER JOIN
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID

UNION

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;
+------------+-----------+----------+---------+------------+-------------+
| CustomerID | FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|          1 | John      | Doe      |     103 | 2023-07-10 |     1200.00 |
|          1 | John      | Doe      |     101 | 2023-07-01 |      150.50 |
|          2 | Jane      | Smith    |     105 | 2023-07-20 |      300.00 |
|          2 | Jane      | Smith    |     102 | 2023-07-03 |      200.75 |
|          3 | David     | Brown    |     104 | 2023-07-15 |      750.00 |
|          4 | Emily     | Davis    |    NULL | NULL       |        NULL |
+------------+-----------+----------+---------+------------+-------------+
6 rows in set (0.071 sec)

QUERY 5 — SUBQUERY
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.TotalAmount
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM Orders
);
+------------+-----------+----------+---------+-------------+
| CustomerID | FirstName | LastName | OrderID | TotalAmount |
+------------+-----------+----------+---------+-------------+
|          1 | John      | Doe      |     103 |     1200.00 |
|          3 | David     | Brown    |     104 |      750.00 |
+------------+-----------+----------+---------+-------------+
2 rows in set (0.073 sec)

SELECT AVG(TotalAmount) AS AverageAmount
FROM Orders;
+---------------+
| AverageAmount |
+---------------+
|    520.250000 |
+---------------+
1 row in set (0.029 sec)

QUERY 6 — SUBQUERY above average salary
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          1 | Mark      | Johnson  | Sales      | 60000.00 |
|          3 | Robert    | Wilson   | IT         | 80000.00 |
+------------+-----------+----------+------------+----------+
2 rows in set (0.015 sec)

QUERY 7 — Extract Year and Month from OrderDate
SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;
+---------+------------+-----------+------------+
| OrderID | OrderDate  | OrderYear | OrderMonth |
+---------+------------+-----------+------------+
|     101 | 2023-07-01 |      2023 |          7 |
|     102 | 2023-07-03 |      2023 |          7 |
|     103 | 2023-07-10 |      2023 |          7 |
|     104 | 2023-07-15 |      2023 |          7 |
|     105 | 2023-07-20 |      2023 |          7 |
+---------+------------+-----------+------------+
5 rows in set (0.180 sec)

QUERY 8 — Difference Between Order Date and Current Date
SELECT
    OrderID,
    OrderDate,
    CURDATE() AS CurrentDate,
    DATEDIFF(CURDATE(), OrderDate) AS DifferenceInDays
FROM Orders;
+---------+------------+-------------+------------------+
| OrderID | OrderDate  | CurrentDate | DifferenceInDays |
+---------+------------+-------------+------------------+
|     101 | 2023-07-01 | 2026-10-06  |             1193 |
|     102 | 2023-07-03 | 2026-10-06  |             1191 |
|     103 | 2023-07-10 | 2026-10-06  |             1184 |
|     104 | 2023-07-15 | 2026-10-06  |             1179 |
|     105 | 2023-07-20 | 2026-10-06  |             1174 |
+---------+------------+-------------+------------------+
5 rows in set (0.186 sec)

QUERY 9 — Format OrderDate
SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
FROM Orders;
+---------+------------+---------------+
| OrderID | OrderDate  | FormattedDate |
+---------+------------+---------------+
|     101 | 2023-07-01 | 01-Jul-2023   |
|     102 | 2023-07-03 | 03-Jul-2023   |
|     103 | 2023-07-10 | 10-Jul-2023   |
|     104 | 2023-07-15 | 15-Jul-2023   |
|     105 | 2023-07-20 | 20-Jul-2023   |
+---------+------------+---------------+
5 rows in set (0.163 sec)

QUERY 10 — Concatenate FirstName and LastName
SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;
+------------+-------------+
| CustomerID | FullName    |
+------------+-------------+
|          1 | John Doe    |
|          2 | Jane Smith  |
|          3 | David Brown |
|          4 | Emily Davis |
+------------+-------------+
4 rows in set (0.018 sec)

SELECT
    EmployeeID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;
+------------+---------------+
| EmployeeID | FullName      |
+------------+---------------+
|          1 | Mark Johnson  |
|          2 | Susan Lee     |
|          3 | Robert Wilson |
|          4 | Lisa Taylor   |
+------------+---------------+
4 rows in set (0.010 sec)

QUERY 11 — Replace Part of a String

SELECT
    CustomerID,
    FirstName,
    REPLACE(FirstName, 'John', 'Jonathan') AS NewFirstName
FROM Customers;
+------------+-----------+--------------+
| CustomerID | FirstName | NewFirstName |
+------------+-----------+--------------+
|          1 | John      | Jonathan     |
|          2 | Jane      | Jane         |
|          3 | David     | David        |
|          4 | Emily     | Emily        |
+------------+-----------+--------------+
4 rows in set (0.020 sec)
SELECT
    Email,
    REPLACE(Email, 'john', 'jonathan') AS NewEmail
FROM Customers;
+-----------------------+------------------------+
| Email                 | NewEmail               |
+-----------------------+------------------------+
| john.doe@email.com    | jonathan.doe@email.com |
| jane.smith@email.com  | jane.smith@email.com   |
| david.brown@email.com | david.brown@email.com  |
| emily.davis@email.com | emily.davis@email.com  |
+-----------------------+------------------------+
4 rows in set (0.014 sec)

QUERY 12 — Uppercase FirstName and Lowercase LastName
SELECT
    CustomerID,
    UPPER(FirstName) AS UpperFirstName,
    LOWER(LastName) AS LowerLastName
FROM Customers;
+------------+----------------+---------------+
| CustomerID | UpperFirstName | LowerLastName |
+------------+----------------+---------------+
|          1 | JOHN           | doe           |
|          2 | JANE           | smith         |
|          3 | DAVID          | brown         |
|          4 | EMILY          | davis         |
+------------+----------------+---------------+
4 rows in set (0.164 sec)

QUERY 13 — Trim Extra Spaces from Email

SELECT
    CustomerID,
    Email,
    TRIM(Email) AS CleanEmail
FROM Customers;
+------------+-----------------------+-----------------------+
| CustomerID | Email                 | CleanEmail            |
+------------+-----------------------+-----------------------+
|          1 | john.doe@email.com    | john.doe@email.com    |
|          2 | jane.smith@email.com  | jane.smith@email.com  |
|          3 | david.brown@email.com | david.brown@email.com |
|          4 | emily.davis@email.com | emily.davis@email.com |
+------------+-----------------------+-----------------------+
4 rows in set (0.150 sec)

UPDATE Customers
SET Email = TRIM(Email);

SELECT * FROM Customers;
+------------+-----------+----------+-----------------------+------------------+
| CustomerID | FirstName | LastName | Email                 | RegistrationDate |
+------------+-----------+----------+-----------------------+------------------+
|          1 | John      | Doe      | john.doe@email.com    | 2023-06-15       |
|          2 | Jane      | Smith    | jane.smith@email.com  | 2023-06-20       |
|          3 | David     | Brown    | david.brown@email.com | 2023-07-01       |
|          4 | Emily     | Davis    | emily.davis@email.com | 2023-07-05       |
+------------+-----------+----------+-----------------------+------------------+
4 rows in set (0.011 sec)

QUERY 14 — Running Total of TotalAmount
SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate
    ) AS RunningTotal
FROM Orders;
+---------+------------+-------------+--------------+
| OrderID | OrderDate  | TotalAmount | RunningTotal |
+---------+------------+-------------+--------------+
|     101 | 2023-07-01 |      150.50 |       150.50 |
|     102 | 2023-07-03 |      200.75 |       351.25 |
|     103 | 2023-07-10 |     1200.00 |      1551.25 |
|     104 | 2023-07-15 |      750.00 |      2301.25 |
|     105 | 2023-07-20 |      300.00 |      2601.25 |
+---------+------------+-------------+--------------+
5 rows in set (0.217 sec)

QUERY 15 — Rank Orders Using RANK()
SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM Orders;	
+---------+------------+-------------+-----------+
| OrderID | OrderDate  | TotalAmount | OrderRank |
+---------+------------+-------------+-----------+
|     103 | 2023-07-10 |     1200.00 |         1 |
|     104 | 2023-07-15 |      750.00 |         2 |
|     105 | 2023-07-20 |      300.00 |         3 |
|     102 | 2023-07-03 |      200.75 |         4 |
|     101 | 2023-07-01 |      150.50 |         5 |
+---------+------------+-------------+-----------+
5 rows in set (0.078 sec)

QUERY 16 — Assign Discount Using CASE
SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN '10% Discount'
        WHEN TotalAmount > 500 THEN '5% Discount'
        ELSE 'No Discount'
    END AS Discount
FROM Orders;
+---------+-------------+--------------+
| OrderID | TotalAmount | Discount     |
+---------+-------------+--------------+
|     101 |      150.50 | No Discount  |
|     102 |      200.75 | No Discount  |
|     103 |     1200.00 | 10% Discount |
|     104 |      750.00 | 5% Discount  |
|     105 |      300.00 | No Discount  |
+---------+-------------+--------------+
5 rows in set (0.154 sec)

QUERY 17 — Categorize Employee Salary
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CASE
        WHEN Salary >= 70000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;
+------------+-----------+----------+----------+----------------+
| EmployeeID | FirstName | LastName | Salary   | SalaryCategory |
+------------+-----------+----------+----------+----------------+
|          1 | Mark      | Johnson  | 60000.00 | Medium         |
|          2 | Susan     | Lee      | 50000.00 | Medium         |
|          3 | Robert    | Wilson   | 80000.00 | High           |
|          4 | Lisa      | Taylor   | 45000.00 | Low            |
+------------+-----------+----------+----------+----------------+
4 rows in set (0.171 sec)



