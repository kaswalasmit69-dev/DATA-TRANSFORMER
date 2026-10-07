# 🚀 DATA TRANSFORMER
## SQL Database & Data Transformation Project

<p align="center">

### 🗄️ Transforming Raw Data into Meaningful Information with SQL

**👨‍💻 Student:** Sumit  
**👨‍🏫 Guided By:** Girish Sir  
**🎓 Course:** Data Analysis  
**📚 Academic Level:** B.Tech Final Year  
**💻 Technology:** MySQL / SQL

</p>

---

## 🌟 Project Overview

**Data Transformer** is a practical SQL project created to demonstrate how structured data can be stored, connected, transformed, cleaned, analyzed, ranked, and categorized using SQL.

The project creates a database named `DataTransformer` and works with three major entities:

- 1 **Customers**
- 2 **Orders**
- 3 **Employees**

The project moves from basic database creation to advanced SQL concepts such as:

- JOIN operations
- Subqueries
- Date functions
- String functions
- Data cleaning
- Window functions
- Running totals
- Ranking
- CASE expressions
- Business-style categorization

> **Project idea:** Raw data → SQL transformation → meaningful information → analysis

---

## 👨‍💻 Student & Project Guide

| Information | Details |
|---|---|
| 👨‍💻 Student | **Sumit** |
| 👨‍🏫 Guide | **Girish Sir** |
| 🎓 Course | **Data Analysis** |
| 📚 Academic Level | **B.Tech Final Year** |
| 🗄️ Database | **DataTransformer** |
| 📄 SQL File | **Data-Transformer.sql** |

---

## 🖼️ Database Overview

The SQL project begins by creating and selecting the `DataTransformer` database.

```sql
CREATE DATABASE DataTransformer;
USE DataTransformer;
```

---

# 🎯 Project Objectives

The main objectives of this project are:

1. Create a relational SQL database.
2. Create tables with appropriate columns and data types.
3. Insert sample customer, order, and employee records.
4. Understand primary-key and foreign-key relationships.
5. Combine data using different JOIN operations.
6. Use subqueries for analytical comparisons.
7. Extract and format date information.
8. Transform and clean string data.
9. Calculate running totals using window functions.
10. Rank records according to numerical values.
11. Categorize data using `CASE`.
12. Build practical SQL and data-analysis skills.

---

# 🛠️ Technologies Used

| Technology | Usage |
|---|---|
| 🗄️ SQL | Database queries and transformations |
| 🐬 MySQL | Database execution |
| 💻 MySQL Workbench / MySQL Terminal | Running SQL commands |
| 📊 Data Analysis | Interpretation of transformed data |
| 📝 Markdown | Project documentation |

---

# 🗂️ Database Architecture

```text
                    ┌───────────────────────┐
                    │    DATA TRANSFORMER   │
                    │       DATABASE        │
                    └───────────┬───────────┘
                                │
             ┌──────────────────┼──────────────────┐
             │                  │                  │
             ▼                  ▼                  ▼
      ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
      │  Customers  │    │   Orders    │    │ Employees   │
      ├─────────────┤    ├─────────────┤    ├─────────────┤
      │ CustomerID  │◄───│ CustomerID  │    │ EmployeeID  │
      │ FirstName   │    │ OrderID     │    │ FirstName   │
      │ LastName    │    │ OrderDate   │    │ LastName    │
      │ Email       │    │ TotalAmount │    │ Department   │
      │ RegisterDate│    └─────────────┘    │ HireDate    │
      └─────────────┘                       │ Salary      │
                                            └─────────────┘
```

---

# 👥 Customers Table

The Customers table stores customer master information.

### Columns

| Column | Type | Purpose |
|---|---|---|
| CustomerID | INT | Unique customer identifier |
| FirstName | VARCHAR(50) | Customer first name |
| LastName | VARCHAR(50) | Customer last name |
| Email | VARCHAR(100) | Customer email |
| RegistrationDate | DATE | Registration date |

### Customer Data

---

# 🛒 Orders Table

The Orders table stores transaction information.

### Columns

| Column | Type | Purpose |
|---|---|---|
| OrderID | INT | Unique order identifier |
| CustomerID | INT | Related customer |
| OrderDate | DATE | Date of order |
| TotalAmount | DECIMAL(10,2) | Order value |

### Order Data

The `CustomerID` column connects an order with a customer.

```text
Customers.CustomerID
          │
          │
          ▼
Orders.CustomerID
```

---

# 👨‍💼 Employees Table

The Employees table stores employee information.

### Columns

| Column | Type | Purpose |
|---|---|---|
| EmployeeID | INT | Unique employee identifier |
| FirstName | VARCHAR(50) | First name |
| LastName | VARCHAR(50) | Last name |
| Department | VARCHAR(50) | Department |
| HireDate | DATE | Hiring date |
| Salary | DECIMAL(10,2) | Salary |

### Employee Data

---

# 🔗 Relationship Between Tables

The most important relationship is:

```text
             CUSTOMER
                │
                │ CustomerID
                │
                ▼
              ORDER
```

One customer can have multiple orders.

For example:

```text
John Doe
  │
  ├── Order 101 → 150.50
  └── Order 103 → 1200.00
```

Jane Smith also has multiple orders:

```text
Jane Smith
  │
  ├── Order 102 → 200.75
  └── Order 105 → 300.00
```

---

# 🤝 JOIN Operations

JOINs are used to combine information stored in different tables.

The project demonstrates:

```text
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN concept
```

## JOIN Analysis

---

## 🔵 INNER JOIN

The INNER JOIN returns records that have matching values in both tables.

```sql
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
```

### Why use INNER JOIN?

It is useful when we only want records where a relationship exists.

Example:

```text
John Doe → Order 101
John Doe → Order 103
Jane Smith → Order 102
Jane Smith → Order 105
David Brown → Order 104
```

---

# 🟢 LEFT JOIN

LEFT JOIN keeps every record from the left table.

```sql
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;
```

This is especially useful for finding customers who have no orders.

### Example

```text
Emily Davis
     │
     ▼
No Order
     │
     ▼
NULL order information
```

This makes LEFT JOIN useful for identifying inactive customers.

---

# 🟠 RIGHT JOIN

RIGHT JOIN keeps every record from the right-side table.

```sql
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;
```

It can be used to ensure all order records remain visible while customer information is matched where available.

---

# 🟣 FULL OUTER JOIN Concept

The project demonstrates the FULL OUTER JOIN concept by combining:

```sql
LEFT JOIN
UNION
RIGHT JOIN
```

This provides a combined view of both sides.

---

# 🔎 Subqueries

A subquery is a query written inside another query.

This project uses subqueries for comparison with average values.

---

## 💰 Average Order Amount

The average order amount is calculated using:

```sql
SELECT AVG(TotalAmount)
FROM Orders;
```

The project output gives:

```text
Average Order Amount = 520.25
```

Orders greater than the average are:

| Order | Amount |
|---:|---:|
| 103 | 1200.00 |
| 104 | 750.00 |

---

## 👨‍💼 Employees Above Average Salary

The project also checks which employees have salaries above the average salary.

```sql
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
```

The result identifies:

- Mark Johnson — 60000
- Robert Wilson — 80000

This is a practical example of using SQL for employee salary analysis.

---

# 📅 Date Functions

The project demonstrates several SQL date functions.

## YEAR()

```sql
YEAR(OrderDate)
```

Extracts the year from an order date.

Example:

```text
2023-07-10 → 2023
```

## MONTH()

```sql
MONTH(OrderDate)
```

Example:

```text
2023-07-10 → 7
```

## DATEDIFF()

```sql
DATEDIFF(CURDATE(), OrderDate)
```

Calculates the difference between two dates in days.

## DATE_FORMAT()

```sql
DATE_FORMAT(OrderDate, '%d-%b-%Y')
```

Example:

```text
2023-07-01 → 01-Jul-2023
```

---

# 🔤 String Functions

String functions are used for transforming text.

The project demonstrates:

```text
CONCAT()
REPLACE()
UPPER()
LOWER()
TRIM()
```
---

## 👤 CONCAT()

Combines first name and last name.

```sql
CONCAT(FirstName, ' ', LastName)
```

Example:

```text
John + Doe
    ↓
John Doe
```

---

## 🔄 REPLACE()

Replaces part of a string.

```sql
REPLACE(FirstName, 'John', 'Jonathan')
```

Example:

```text
John → Jonathan
```

The project also demonstrates replacing text within email addresses.

---

## 🔠 UPPER()

Converts text to uppercase.

```sql
UPPER(FirstName)
```

Example:

```text
John → JOHN
```

---

## 🔡 LOWER()

Converts text to lowercase.

```sql
LOWER(LastName)
```

Example:

```text
Doe → doe
```

---

## 🧹 TRIM()

Removes unwanted spaces from text.

```sql
TRIM(Email)
```

The project also updates the email field using the cleaned value:

```sql
UPDATE Customers
SET Email = TRIM(Email);
```

---

# 📊 Window Functions

Window functions allow calculations across rows while keeping individual rows visible.

This project demonstrates:

```text
SUM() OVER()
RANK() OVER()
```

---

# 📈 Running Total

The project calculates a running total of orders:

```sql
SUM(TotalAmount) OVER (
    ORDER BY OrderDate
) AS RunningTotal
```

### Running Total

| Order | Amount | Running Total |
|---:|---:|---:|
| 101 | 150.50 | 150.50 |
| 102 | 200.75 | 351.25 |
| 103 | 1200.00 | 1551.25 |
| 104 | 750.00 | 2301.25 |
| 105 | 300.00 | 2601.25 |

### Final Total

```text
2601.25
```

This demonstrates how SQL can calculate cumulative business values.

---

# 🏆 Ranking Orders

The project ranks orders from highest amount to lowest amount.

```sql
RANK() OVER (
    ORDER BY TotalAmount DESC
)
```

### Ranking

| Rank | Order | Amount |
|---:|---:|---:|
| 🥇 1 | 103 | 1200.00 |
| 🥈 2 | 104 | 750.00 |
| 🥉 3 | 105 | 300.00 |
| 4 | 102 | 200.75 |
| 5 | 101 | 150.50 |

This helps identify the highest-value transactions.

---

# 🏷️ CASE Statements

The project uses `CASE` to implement business rules.
---

## 💸 Order Discount Categorization

```sql
CASE
    WHEN TotalAmount > 1000 THEN '10% Discount'
    WHEN TotalAmount > 500 THEN '5% Discount'
    ELSE 'No Discount'
END
```

### Business Rule

```text
             Order Amount
                  │
        ┌─────────┼─────────┐
        │         │         │
      >1000      >500      Else
        │         │         │
        ▼         ▼         ▼
       10%        5%       None
```

---

## 👨‍💼 Salary Categorization

```sql
CASE
    WHEN Salary >= 70000 THEN 'High'
    WHEN Salary >= 50000 THEN 'Medium'
    ELSE 'Low'
END
```

### Categories

| Salary | Category |
|---:|---|
| 80000 | High |
| 60000 | Medium |
| 50000 | Medium |
| 45000 | Low |

---

# 🧠 SQL Concepts Learned

This project provides practical experience with:

### Database Concepts
- Database creation
- Table creation
- Primary keys
- Foreign keys
- Relationships

### Query Concepts
- SELECT
- INSERT
- UPDATE
- WHERE
- UNION

### JOIN Concepts
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN concept

### Analytical Concepts
- AVG()
- Subqueries
- Running totals
- Ranking

### Date Concepts
- YEAR()
- MONTH()
- DATEDIFF()
- DATE_FORMAT()

### String Concepts
- CONCAT()
- REPLACE()
- UPPER()
- LOWER()
- TRIM()

### Conditional Concepts
- CASE
- Business-rule categorization

---

# 📋 Query Map

| Query | Concept |
|---|---|
| Query 1 | INNER JOIN |
| Query 2 | LEFT JOIN |
| Query 3 | RIGHT JOIN |
| Query 4 | FULL OUTER JOIN concept |
| Query 5 | Subquery — above-average orders |
| Query 6 | Subquery — above-average salary |
| Query 7 | YEAR() and MONTH() |
| Query 8 | DATEDIFF() |
| Query 9 | DATE_FORMAT() |
| Query 10 | CONCAT() |
| Query 11 | REPLACE() |
| Query 12 | UPPER() and LOWER() |
| Query 13 | TRIM() and UPDATE |
| Query 14 | Running Total |
| Query 15 | RANK() |
| Query 16 | CASE — Discount |
| Query 17 | CASE — Salary Category |

---

# 📁 Project Structure

```text
Data-Transformer/
│
├── Data-Transformer.sql
├── README.md
│
└── readme_images/
    ├── 01_database.png
    ├── 02_customers.png
    ├── 03_orders.png
    ├── 04_employees.png
    ├── 05_joins.png
    ├── 06_subqueries.png
    ├── 07_date_string.png
    ├── 08_window_functions.png
    └── 09_case.png
```

---

# ▶️ How to Run

## Step 1 — Install MySQL

Install MySQL Server and MySQL Workbench.

## Step 2 — Open MySQL Workbench

Connect to your MySQL server.

## Step 3 — Open SQL File

Open:

```text
Data-Transformer.sql
```

## Step 4 — Create Database

Run:

```sql
CREATE DATABASE DataTransformer;
USE DataTransformer;
```

## Step 5 — Create Tables

Execute the table creation queries.

## Step 6 — Insert Data

Execute the INSERT queries.

## Step 7 — Run Analysis Queries

Run the queries one by one and observe the outputs.

---

# 📈 Project Data Flow

```text
                 RAW DATA
                    │
                    ▼
          ┌─────────────────┐
          │     MySQL       │
          │    Database     │
          └────────┬────────┘
                   │
                   ▼
             SQL QUERIES
                   │
       ┌───────────┼───────────┐
       ▼           ▼           ▼
     JOINs      Subqueries   Functions
       │           │           │
       └───────────┼───────────┘
                   ▼
          DATA TRANSFORMATION
                   │
                   ▼
             DATA ANALYSIS
                   │
                   ▼
         MEANINGFUL INFORMATION
```

---

# 🎓 Learning Outcomes

After completing this project, I learned how to:

- Create and manage SQL databases.
- Design relational tables.
- Use primary and foreign keys.
- Connect tables using JOINs.
- Write nested queries.
- Calculate averages.
- Compare records with calculated values.
- Work with dates.
- Format dates.
- Clean text data.
- Modify strings.
- Calculate running totals.
- Rank records.
- Apply business rules using CASE.
- Analyze customer, order, and employee data.

---

# 💡 Real-World Applications

The concepts used in this project can be applied to many real-world systems.

### 🛒 E-Commerce

Orders can be joined with customers and ranked by value.

### 🏦 Banking

Transactions can be categorized and analyzed.

### 👨‍💼 Human Resources

Employee salaries can be compared and categorized.

### 📊 Business Analytics

Running totals and rankings can help identify business performance.

### 📦 Sales Analysis

Orders above average can be identified for further investigation.

---

# 🚀 Future Improvements

The project can be expanded with:

```text
📦 Products Table
🧾 Order Details Table
💳 Payments Table
🏷️ Product Categories
📊 SQL Views
⚙️ Stored Procedures
🔔 Triggers
🧠 CTEs
📈 Advanced Window Functions
🐍 Python + SQL Integration
🐼 Pandas Data Analysis
📊 Power BI Dashboard
📈 Interactive Business Dashboard
```

A future version could connect the SQL database with Python and Power BI to create a complete data-analysis pipeline.

---

# 🌟 Project Highlights

```text
╔══════════════════════════════════════════════════════╗
║                  DATA TRANSFORMER                   ║
╠══════════════════════════════════════════════════════╣
║                                                      ║
║  👥 Customer Data                                    ║
║  🛒 Order Data                                       ║
║  👨‍💼 Employee Data                                   ║
║                                                      ║
║  🔗 JOIN Operations                                  ║
║  🔎 Subqueries                                       ║
║  📅 Date Functions                                   ║
║  🔤 String Functions                                 ║
║  📊 Window Functions                                 ║
║  🏆 Ranking                                          ║
║  💰 Discount Categorization                          ║
║  👨‍💼 Salary Categorization                           ║
║                                                      ║
╚══════════════════════════════════════════════════════╝
```

---

# 🙏 Acknowledgement

I would like to sincerely thank **Girish Sir** for his valuable guidance, support, and encouragement during this project.

This project gave me practical experience in SQL and helped me understand how database queries can be used for real-world data analysis.

I am grateful for the opportunity to learn, practice, and implement these concepts through the **Data Transformer** project.

---

# 👨‍💻 About the Developer

## Sumit

I am **Sumit**, a B.Tech final-year student learning and developing skills in **Data Analysis, SQL, Python, and related technologies**.

The **Data Transformer** project is part of my practical learning journey in data analysis.

My goal is to continue improving my technical knowledge by building practical projects and applying classroom concepts to real-world datasets.

---

# 🏁 Conclusion

The **Data Transformer** project demonstrates that SQL is much more than a language for storing and retrieving records.

With SQL, we can:

```text
CREATE
   ↓
STORE
   ↓
CONNECT
   ↓
TRANSFORM
   ↓
CLEAN
   ↓
ANALYZE
   ↓
RANK
   ↓
CATEGORIZE
   ↓
UNDERSTAND
```

This project combines fundamental and advanced SQL techniques into one practical database exercise.

It provides a strong foundation for further learning in **Data Analysis, Data Science, Business Intelligence, and Database Management**.

---

<p align="center">

# 🚀 Keep Learning • Keep Building • Keep Analyzing

### Made with ❤️ by **Sumit**

### Guided by **Girish Sir**

**B.Tech Final Year | Data Analysis**

</p>

---

## ⭐ Project Summary

| Category | Details |
|---|---|
| 👨‍💻 Developer | **Sumit** |
| 👨‍🏫 Guide | **Girish Sir** |
| 🎓 Course | **Data Analysis** |
| 🗄️ Database | **DataTransformer** |
| 🐬 DBMS | **MySQL** |
| 📄 Main File | **Data-Transformer.sql** |
| 📊 Main Tables | **Customers, Orders, Employees** |
| 🔗 JOINs | **INNER, LEFT, RIGHT, FULL JOIN concept** |
| 🔎 Subqueries | **Average-based analysis** |
| 📅 Date Functions | **YEAR, MONTH, DATEDIFF, DATE_FORMAT** |
| 🔤 String Functions | **CONCAT, REPLACE, UPPER, LOWER, TRIM** |
| 📈 Window Functions | **SUM OVER, RANK OVER** |
| 🏷️ Conditional Logic | **CASE** |
| 🚀 Project Type | **SQL Data Transformation & Analysis** |
