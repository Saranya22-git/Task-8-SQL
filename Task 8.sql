CREATE DATABASE BankDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    balance DECIMAL(10,2) DEFAULT 0.00,
    account_type ENUM('SAVINGS', 'CURRENT') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

DELIMITER $$

CREATE PROCEDURE DepositMoney (
    IN acc_id INT,
    IN amount DECIMAL(10,2)
)
BEGIN
    IF amount <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Deposit amount must be positive';
    ELSE
        UPDATE Accounts
        SET balance = balance + amount
        WHERE account_id = acc_id;
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION GetBalance(acc_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE acc_balance DECIMAL(10,2);

    SELECT balance INTO acc_balance
    FROM Accounts
    WHERE account_id = acc_id;

    RETURN acc_balance;
END$$

DELIMITER ;

-- Insert sample data
INSERT INTO Customers (name, email) VALUES ('Saranya', 'saranya@example.com');
INSERT INTO Accounts (customer_id, balance, account_type) VALUES (1, 1000.00, 'SAVINGS');

-- Call stored procedure
CALL DepositMoney(1, 500.00);

-- Call function
SELECT GetBalance(1) AS CurrentBalance;