CREATE DATABASE BankingManagementSystem;
USE BankingManagementSystem;

-- 1.Branches

CREATE TABLE Branches
(
    BranchID INT PRIMARY KEY auto_increment,
    BankName varchar(100),
    BranchName VARCHAR(100) NOT NULL,
    IFSCCode VARCHAR(20) UNIQUE NOT NULL,
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Pincode VARCHAR(10),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    status varchar(150)
);
-- imported the branch records

-- 2.AccountTypes

CREATE TABLE AccountTypes
(
    AccountTypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL,
    MinimumBalance DECIMAL(12,2),
    InterestRate DECIMAL(5,2)
);
INSERT INTO AccountTypes (TypeName, MinimumBalance, InterestRate)
VALUES
('Savings Account', 1000.00, 3.50),
('Current Account', 5000.00, 0.00),
('Salary Account', 0.00, 3.00),
('Student Account', 0.00, 2.75),
('Senior Citizen Savings', 1000.00, 7.25),
('Fixed Deposit', 10000.00, 6.80),
('Recurring Deposit', 500.00, 6.25),
('NRI Savings', 1000.00, 4.00),
('NRE Account', 1000.00, 4.25),
('NRO Account', 1000.00, 3.75),
('Joint Savings Account', 1000.00, 3.50),
('Business Current Account', 10000.00, 0.00),
('Corporate Current Account', 25000.00, 0.00),
('Women Savings Account', 500.00, 3.75),
('Kids Savings Account', 0.00, 3.25),
('Premium Savings Account', 50000.00, 4.50),
('Pension Account', 0.00, 3.50),
('Zero Balance Account', 0.00, 2.50),
('Digital Savings Account', 1000.00, 3.75),
('Privilege Account', 100000.00, 5.00);

-- 3.IFSC_Details

CREATE TABLE IFSC_Details (
    IFSCID INT AUTO_INCREMENT PRIMARY KEY,
    BranchID INT,
    IFSCCode VARCHAR(20) UNIQUE,
    BankName VARCHAR(100),
    MICRCode VARCHAR(20),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID),
	FOREIGN KEY (IFSCCode) REFERENCES Branches(IFSCCode)
);
-- imported the record of IFSC_Details

-- 4. Customers

CREATE TABLE Customers
(
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    DOB DATE,
    Gender ENUM('Male','Female','Other'),
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Pincode VARCHAR(10),
    KYCStatus ENUM('Pending','Verified') DEFAULT 'Pending',
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- imported the records of customers

-- 5.Employees

CREATE TABLE Employees
(
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    BranchID INT,
    FullName VARCHAR(100) NOT NULL,
    Designation VARCHAR(50),
    Salary DECIMAL(12,2),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    HireDate DATE,
    Status ENUM('Active','Inactive'),

    FOREIGN KEY (BranchID)
    REFERENCES Branches(BranchID)
);
-- imported the records of employees

-- 6.Accounts

CREATE TABLE Accounts
(
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    BranchID INT,
    AccountTypeID INT,
    AccountNumber VARCHAR(20) UNIQUE,
    Balance DECIMAL(15,2),
    OpenDate DATE,
    Status ENUM('Active','Closed','Blocked'),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (BranchID)
        REFERENCES Branches(BranchID),

    FOREIGN KEY (AccountTypeID)
        REFERENCES AccountTypes(AccountTypeID)
);
-- imported the records of Accounts
select count(*) from  Nominees 
t
-- 7.Nominees

CREATE TABLE Nominees
(
    NomineeID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    NomineeName VARCHAR(100),
    Relationship VARCHAR(30),
    DOB DATE,
    Phone VARCHAR(15),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
); 
-- imported the records of Nominees

-- 8.Cards

CREATE TABLE Cards
(
    CardID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT,
    CardNumber BIGINT UNIQUE,
    CardType ENUM('Debit','Credit'),
    IssueDate DATE,
    ExpiryDate DATE,
    Status ENUM('Active','Blocked','Expired'),

    FOREIGN KEY (AccountID)
    REFERENCES Accounts(AccountID)
);
-- imported the records of Cards

-- 9.Beneficiaries

CREATE TABLE Beneficiaries
(
    BeneficiaryID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT,
    BeneficiaryName VARCHAR(100),
    BankName VARCHAR(100),
    AccountNumber BIGINT,
    IFSCCode VARCHAR(20),
    RelationshipType VARCHAR(50),
    AddedDate DATE,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
-- imported the records of Beneficiaries

-- 10.FixedDeposits

CREATE TABLE FixedDeposits
(
    FDID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT,
    Amount DECIMAL(15,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    MaturityDate DATE,
    Status ENUM('Active','Closed'),

    FOREIGN KEY (AccountID)
    REFERENCES Accounts(AccountID)
);
-- imported the records of FixedDeposits

-- 11.Loans

CREATE TABLE Loans
(
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    LoanType ENUM('Home Loan','Personal Loan','Education Loan','Vehicle Loan','Gold Loan'),
    LoanAmount DECIMAL(15,2),
    InterestRate DECIMAL(5,2),
    LoanTerm INT,
    StartDate DATE,
    EndDate DATE,
    Status ENUM('Approved','Pending','Rejected','Closed'),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);
-- imported the records of Loans

-- 12.LoanPayments

CREATE TABLE LoanPayments
(
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    LoanID INT,
    PaymentDate DATE,
    Amount DECIMAL(15,2),
    PaymentMode ENUM('Cash','UPI','Net Banking','Cheque'),
    Status ENUM('Success','Failed','Pending'),

    FOREIGN KEY (LoanID)
        REFERENCES Loans(LoanID)
);
-- imported the records of LoanPayments

-- 13.ATMMachines

CREATE TABLE ATMMachines
(
    ATMID INT AUTO_INCREMENT PRIMARY KEY,
    BranchID INT,
    ATMCode VARCHAR(30) UNIQUE,
    Location VARCHAR(200),
    CashAvailable DECIMAL(15,2),
    Status ENUM('Working','Out of Service'),

    FOREIGN KEY (BranchID)
        REFERENCES Branches(BranchID)
);
-- imported the records of ATMMachines

-- 14.ATMTransactions

CREATE TABLE ATMTransactions
(
    ATMTransactionID INT AUTO_INCREMENT PRIMARY KEY,
    ATMID INT,
    AccountID INT,
    TransactionType ENUM('Withdrawal','Deposit','Balance Enquiry'),
    Amount DECIMAL(15,2),
    TransactionDate DATETIME,
    Status ENUM('Success','Failed'),

    FOREIGN KEY (ATMID)
        REFERENCES ATMMachines(ATMID),

    FOREIGN KEY (AccountID)
        REFERENCES Accounts(AccountID)
);
-- imported the records of ATMTransactions

-- 15.InternetBanking

CREATE TABLE InternetBanking
(
    InternetBankingID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT,
    Username VARCHAR(50) UNIQUE,
    PasswordHash VARCHAR(255),
    LastLogin DATETIME,
    Status ENUM('Active','Blocked'),

    FOREIGN KEY (AccountID)
        REFERENCES Accounts(AccountID)
);
-- imported the records of InternetBanking

-- 16.Transactions

CREATE TABLE Transactions
(
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT,
    TransactionType ENUM('Deposit','Withdrawal','Transfer'),
    Amount DECIMAL(15,2),
    TransactionDate DATETIME,
    BalanceAfterTransaction DECIMAL(15,2),
    Status ENUM('Success','Failed','Pending'),

    FOREIGN KEY (AccountID)
        REFERENCES Accounts(AccountID)
);
-- imported the records of Transactions

-- 17.CustomerSupport

CREATE TABLE CustomerSupport
(
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    IssueType VARCHAR(100),
    Description TEXT,
    CreatedDate DATETIME,
    Status ENUM('Open','In Progress','Closed'),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);
-- imported the records of CustomerSupport

-- 18.AuditLog
CREATE TABLE AuditLog
(
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    TransactionID INT,
    ActionPerformed VARCHAR(100),
    ActionDate DATETIME,
    PerformedBy VARCHAR(100),

    FOREIGN KEY (TransactionID)
        REFERENCES Transactions(TransactionID)
);
 -- imported the records of AuditLog
 
 -- Basics level of Query

-- 1.Find all customers whose KYC status is Verified. 
SELECT * FROM Customers
WHERE KYCStatus = 'Verified';

-- 2.Retrieve all accounts with a balance greater than ₹1,00,000
SELECT * FROM Accounts
WHERE Balance > 100000;

-- 3.Find the total number of customers in each city
SELECT City,COUNT(CustomerID) AS TotalCustomers
FROM Customers GROUP BY City;

-- 4.Display all employees working in each branch.
SELECT B.BranchName,E.EmployeeID,E.EmployeeName,E.Designation
FROM Employees E
INNER JOIN Branches B
ON E.BranchID = B.BranchID;

-- 5.Find the total number of accounts available in each branch.
SELECT BranchID,COUNT(AccountID) AS TotalAccounts
FROM Accounts
GROUP BY BranchID;

-- 6.Retrieve customers who do not have any nominee.
SELECT *
FROM Customers
WHERE CustomerID NOT IN
(
    SELECT CustomerID
    FROM Nominees
);

-- 7.Find all loans where the loan amount exceeds ₹10,00,000
SELECT * FROM Loans
WHERE LoanAmount > 1000000;

-- 8. Display the top 10 highest account balances
SELECT * FROM Accounts
ORDER BY Balance DESC
LIMIT 10;

-- 9. Find the total number of ATM machines available in each branch.
SELECT BranchID,COUNT(ATMID) AS TotalATMs
FROM ATMMachines GROUP BY BranchID;

-- 10. Retrieve all transactions with Status = 'Failed'.
SELECT * FROM Transactions
WHERE Status = 'Failed';

-- 11. Find the average account balance grouped by account type.
SELECT AccountTypeID,AVG(Balance) AS AverageBalance
FROM Accounts
GROUP BY AccountTypeID;

-- 12. Retrieve employees having more than 10 years of experience.
SELECT * FROM Employees
WHERE Experience > 10;

-- 13. Find the total number of transactions performed by each account.
SELECT AccountID,COUNT(TransactionID) AS TotalTransactions
FROM Transactions
GROUP BY AccountID;

-- 14.Display all fixed deposits with an amount greater than ₹5,00,000.
SELECT * FROM FixedDeposits
WHERE DepositAmount > 500000;

-- 15. Find all customers having more than one bank account.
SELECT CustomerID,COUNT(AccountID) AS TotalAccounts
FROM Accounts
GROUP BY CustomerID
HAVING COUNT(AccountID) > 1;

-- 16. Retrieve branches having more than 20 employees.
SELECT BranchID,COUNT(EmployeeID) AS TotalEmployees
FROM Employees
GROUP BY BranchID HAVING COUNT(EmployeeID) > 20;

-- 17. Find all customer support tickets with Status = 'Open'.
SELECT * FROM CustomerSupport
WHERE Status = 'Open';

-- 18. Display the latest 20 transactions based on TransactionDate.
SELECT * FROM Transactions
ORDER BY TransactionDate DESC LIMIT 20;

-- 19. Find the total revenue generated through loan payments.
SELECT SUM(EMIAmount) AS TotalRevenue
FROM LoanPayments;

-- 20. Retrieve the count of accounts opened month-wise.
SELECT MONTH(OpenDate) AS Month,COUNT(AccountID) AS TotalAccounts
FROM Accounts GROUP BY MONTH(OpenDate)
ORDER BY Month;
 ------------------------------------------------------------------------------------------------
 -- Intermediate Level
 
 -- 1. Display customer name, account number, branch name, and account balance.
SELECT c.CustomerID,CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,a.AccountNumber,b.BranchName,a.Balance
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
JOIN Branches b ON a.BranchID = b.BranchID;

-- 2. Retrieve all employees along with their respective branch names
SELECT e.EmployeeID,e.EmployeeName,b.BranchName
FROM Employees e
JOIN Branches b ON e.BranchID = b.BranchID;

-- 3. Find customers who have taken loans greater than ₹5,00,000
SELECT c.CustomerID,CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,l.LoanAmount
FROM Customers c
JOIN Loans l ON c.CustomerID = l.CustomerID
WHERE l.LoanAmount > 500000;

-- 4. Display all ATM transactions along with ATM code and branch name.
 SELECT at.ATMTransactionID,atm.ATMCode,b.BranchName,at.Amount,at.TransactionDate
FROM ATMTransactions at
JOIN ATMMachines atm ON at.ATMID = atm.ATMID
JOIN Branches b ON atm.BranchID = b.BranchID;

-- 5. Find the total account balance available in each branch.
SELECT b.BranchName,SUM(a.Balance) AS TotalBalance
FROM Accounts a
JOIN Branches ON a.BranchID = b.BranchID
GROUP BY b.BranchName;

-- 6. Retrieve customers who have opened a Fixed Deposit.
SELECT c.CustomerID,CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,fd.DepositAmount
FROM Customers c
JOIN FixedDeposits fd ON c.CustomerID = fd.CustomerID;

-- 7. Display customer names along with their debit/credit card details.
SELECT CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,cd.CardNumber,cd.CardType,cd.ExpiryDate
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID;

-- 8. Find all successful transactions along with customer names.
SELECT CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,t.TransactionID,t.Amount,t.TransactionDate
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
JOIN Transactions t ON a.AccountID = t.AccountID
WHERE t.Status='Successful';

-- 9. Display the total loan amount issued by each branch.
SELECT b.BranchName,SUM(l.LoanAmount) AS TotalLoan
FROM Loans l
JOIN Employees e ON l.EmployeeID = e.EmployeeID
JOIN Branches b ON e.BranchID = b.BranchID
GROUP BY b.BranchName;

-- 10. Find the Top 5 customers having the highest account balance.
SELECT CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,a.Balance
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
ORDER BY a.Balance DESC LIMIT 5;

-- 11. Retrieve customers who have both Loan and Fixed Deposit.
SELECT DISTINCT CONCAT(c.FirstName,' ',c.LastName) AS CustomerName
FROM Customers c
JOIN Loans l ON c.CustomerID = l.CustomerID
JOIN FixedDeposits fd ON c.CustomerID = fd.CustomerID;

-- 12. Display the total number of transactions performed by each customer.
SELECT CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,COUNT(t.TransactionID) AS TotalTransactions
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
JOIN Transactions t ON a.AccountID = t.AccountID
GROUP BY c.CustomerID,c.FirstName,c.LastName;

-- 13. Find employees who have approved more than 5 loans.
SELECT e.EmployeeName,COUNT(l.LoanID) AS TotalLoans
FROM Employees e
JOIN Loans l ON e.EmployeeID = l.EmployeeID
GROUP BY e.EmployeeID,e.EmployeeName HAVING COUNT(l.LoanID) > 5;

-- 14. Display account type along with the total number of accounts.
SELECT at.TypeName,COUNT(a.AccountID) AS TotalAccounts
FROM AccountTypes at
JOIN Accounts a ON at.AccountTypeID = a.AccountTypeID
GROUP BY at.TypeName;

-- 15. Find the total amount paid for each loan.
SELECT LoanID,SUM(EMIAmount) AS TotalPaid
FROM LoanPayments
GROUP BY LoanID;

-- 16. Display employee names along with the number of customer support tickets handled.
SELECT e.EmployeeName,COUNT(cs.TicketID) AS TotalTickets
FROM Employees e
JOIN CustomerSupport cs ON e.EmployeeID = cs.EmployeeID
GROUP BY e.EmployeeID,e.EmployeeName;

-- 17. Find customers whose account balance is below the minimum balance of their account type.
SELECT CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,a.Balance,at.MinBalance
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
JOIN AccountTypes at ON a.AccountTypeID = at.AccountTypeID
WHERE a.Balance < at.MinBalance;

-- 18. Display all blocked debit/credit cards with customer details.
SELECT CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,cd.CardNumber,cd.CardType,cd.Status
FROM Customers c
JOIN Cards cd
ON c.CustomerID = cd.CustomerID
WHERE cd.Status='Blocked';

-- 19. Retrieve branches having more than 50 accounts.
SELECT b.BranchName,COUNT(a.AccountID) AS TotalAccounts
FROM Branches b
JOIN Accounts a ON b.BranchID = a.BranchID
GROUP BY b.BranchID,b.BranchName
HAVING COUNT(a.AccountID) > 50;

-- 20. Display the total amount invested in Fixed Deposits branch-wise.
SELECT b.BranchName,SUM(fd.DepositAmount) AS TotalInvestment
FROM FixedDeposits fd
JOIN Customers c ON fd.CustomerID = c.CustomerID
JOIN Accounts a ON c.CustomerID = a.CustomerID
JOIN Branches b ON a.BranchID = b.BranchID
GROUP BY b.BranchName;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Advance Level

-- 1. Detect suspicious transactions where the transaction amount exceeds the available account balance.
SELECT t.TransactionID,
    t.AccountID,
    t.Amount AS TransactionAmount,
    a.Balance AS AvailableBalance,
    t.TransactionDate
FROM Transactions t
JOIN Accounts a
ON t.AccountID = a.AccountID
WHERE t.Amount > a.Balance;

-- 2. Find customers who withdraw money more than 3 times within the same day.
SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    DATE(t.TransactionDate) AS TransactionDay,
    COUNT(t.TransactionID) AS WithdrawalCount
FROM Customers c
JOIN Accounts a
ON c.CustomerID = a.CustomerID
JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE t.TransactionType = 'Withdrawal'
GROUP BY
    c.CustomerID,
    CustomerName,
    DATE(t.TransactionDate)
HAVING COUNT(t.TransactionID) > 3;

-- 3. Detect duplicate beneficiaries having the same Account Number and IFSC Code for the same customer.
SELECT
    CustomerID,
    BeneficiaryAccountNumber,
    IFSCCode,
    COUNT(*) AS DuplicateCount
FROM Beneficiaries
GROUP BY
    CustomerID,
    BeneficiaryAccountNumber,
    IFSCCode
HAVING COUNT(*) > 1;

-- 4.Find customers whose balance is greater than the average balance
SELECT c.CustomerID,
       CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,
       a.Balance
FROM Customers c
JOIN Accounts a
ON c.CustomerID = a.CustomerID
WHERE a.Balance >
(
    SELECT AVG(Balance)
    FROM Accounts
);

-- 5.Find the second highest account balance.
SELECT MAX(Balance) AS SecondHighestBalance
FROM Accounts
WHERE Balance <
(
    SELECT MAX(Balance)
    FROM Accounts
);

-- 6.Find branches having deposits greater than the average deposit.
SELECT BranchID,
       SUM(Balance) AS TotalDeposit
FROM Accounts
GROUP BY BranchID
HAVING SUM(Balance) >
(
    SELECT AVG(TotalDeposit)
    FROM
    (
        SELECT SUM(Balance) AS TotalDeposit
        FROM Accounts
        GROUP BY BranchID
    ) A
);

-- 7.Rank customers by account balance.
SELECT CustomerID,
       Balance,
       RANK() OVER(ORDER BY Balance DESC) AS RankNo
FROM Accounts;

-- 8. Top 3 customers from every branch.
SELECT *
FROM
(
SELECT
CustomerID,
BranchID,
Balance,
ROW_NUMBER() OVER
(
PARTITION BY BranchID
ORDER BY Balance DESC
) RN
FROM Accounts
) X
WHERE RN<=3;

-- 9. Running balance.
SELECT
AccountID,
TransactionDate,
Amount,
SUM(Amount)
OVER
(
PARTITION BY AccountID
ORDER BY TransactionDate
) RunningBalance
FROM Transactions;

-- 10.Monthly loan report using CTE.
WITH LoanSummary AS
(
SELECT
MONTH(LoanDate) MonthNo,
SUM(LoanAmount) TotalLoan
FROM Loans
GROUP BY MONTH(LoanDate)
)

SELECT *
FROM LoanSummary;
