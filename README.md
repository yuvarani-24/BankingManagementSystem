## 🏦 Banking Management System - MySQL Database Project

 ## 📌 Project Overview

The **Banking Management System** is a relational database project developed using **MySQL** to manage and automate core banking operations. 

This project focuses on designing a structured and efficient database system that handles customer information, account management, transactions, loans, ATM services, internet banking, and employee operations.

The database is designed using proper **relational database concepts** with Primary Keys, Foreign Keys, Constraints, Normalization, and SQL operations to maintain data integrity and consistency.

---

## 🎯 Project Objectives

- Design a complete banking database system.
- Manage customer and account information efficiently.
- Maintain transaction history and banking activities.
- Handle loan processing and repayment details.
- Manage ATM and internet banking operations.
- Apply advanced SQL concepts for data analysis and management.

---

# 🛠️ Technologies Used

| Technology | Description |
|------------|-------------|
| MySQL | Database Management System |
| MySQL Workbench | Database Design & Query Execution |
| SQL | Database Query Language |
| ER Diagram | Database Relationship Design |

---

# 🗄️ Database Architecture

The database consists of **18 interconnected tables** representing different banking modules.

## 📂 Database Tables

### 🏢 Branch Management
- Branches
- IFSC_Details

### 👤 Customer Management
- Customers
- Nominees
- CustomerSupport

### 💳 Account Management
- Accounts
- AccountTypes
- Cards
- Beneficiaries
- FixedDeposits

### 💰 Loan Management
- Loans
- LoanPayments

### 🏧 ATM & Digital Banking
- ATMMachines
- ATMTransactions
- InternetBanking

### 💸 Transaction Management
- Transactions
- AuditLog

### 👨‍💼 Employee Management
- Employees

---

# 🔗 Entity Relationship Design (ER Diagram)

The database follows a relational model with proper relationships between entities.

### Key Relationships:

- One **Branch** can manage multiple Employees, Accounts, and ATMs.
- One **Customer** can have multiple Accounts.
- One **Account Type** can be associated with multiple Accounts.
- One **Account** can have multiple Transactions, Cards, Beneficiaries, and Fixed Deposits.
- One **Customer** can apply for multiple Loans.
- One **Loan** can have multiple Loan Payments.
- One **Transaction** can have multiple Audit Records.

### ER Diagram

![Banking Management System ER Diagram](ER_Diagram.png)

---

# 📊 Dataset Information

- The database contains realistic banking sample data for testing and analysis.
- Some tables contain more than **5,000 records** to simulate real-world banking scenarios.
- Large datasets help to test SQL queries, joins, aggregations, and database performance.

Example:
- Customers table: 5,000+ records
- Accounts table: 5,000+ records
- Transactions table: Large transaction history
- Other tables contain relevant banking records

---

# ✨ Key Features

## 👥 Customer Management
✔ Store customer personal details  
✔ Maintain KYC verification status  
✔ Manage nominee information  

## 🏦 Account Management
✔ Create different account types  
✔ Track account balance  
✔ Maintain account status  

## 💸 Transaction Management
✔ Deposit transactions  
✔ Withdrawal transactions  
✔ Transfer transactions  
✔ Transaction history tracking  

## 💰 Loan Management
✔ Manage different loan categories  
✔ Track loan approval status  
✔ Maintain loan repayment details  

## 🏧 ATM Management
✔ Store ATM machine details  
✔ Track ATM transactions  
✔ Monitor ATM availability  

## 🌐 Internet Banking
✔ Manage online banking users  
✔ Track login information  

## 👨‍💼 Employee Management
✔ Maintain employee details  
✔ Assign employees to branches  

---

# 🧠 SQL Concepts Implemented

The project demonstrates practical implementation of:

- Database Creation
- Table Creation
- Primary Key & Foreign Key Constraints
- Data Integrity Constraints
- Normalization
- INSERT, UPDATE, DELETE Operations
- Complex SELECT Queries
- Joins
  - INNER JOIN
  - LEFT JOIN
  - RIGHT JOIN
- Aggregate Functions
- GROUP BY & HAVING
- Subqueries
- Views
- Stored Procedures
- Triggers
- Transactions
- TCL Commands
- ACID Properties

---

# 📁 Project Structure

```
Banking-Management-System/
│
├── BankingManagementSystem.sql
│
├── ER_Diagram.png
│
└── README.md
```

---

# 🚀 How to Run the Project

### Step 1: Install MySQL

Install:
- MySQL Server
- MySQL Workbench

### Step 2: Create Database

```sql
CREATE DATABASE BankingManagementSystem;
```

### Step 3: Select Database

```sql
USE BankingManagementSystem;
```

### Step 4: Execute SQL File

Run:

```
BankingManagementSystem.sql
```

The tables, relationships, and sample records will be created automatically.

---

# 📈 Sample Analysis Performed

The database supports queries such as:

- Find customers with high account balances.
- Analyze transaction history.
- Identify loan details and payment status.
- Generate branch-wise customer reports.
- Analyze ATM transactions.
- Track customer support activities.

---

# 🔮 Future Enhancements

- Develop a web-based banking application.
- Integrate frontend and backend technologies.
- Add secure authentication system.
- Create banking analytics dashboard using Power BI.
- Implement real-time transaction monitoring.

---

# 👩‍💻 Author

**Yuvarani**  
B.Tech Information Technology  

**Skills:** MySQL | SQL | Database Design | Data Analysis

---

⭐ If you find this project useful, feel free to explore and contribute.
