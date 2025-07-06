# 🗂️Stored Procedures and Functions
A basic banking system using SQL with sample data, a stored procedure, and a user-defined function.
## 📋**Procedures**
🔹A Stored Procedure in SQL is a set of SQL statements saved in the database with a name, so you can run it (or "call" it) whenever needed — like a function in programming.
#### **Syntax**
```sql
DELIMITER //
CREATE PROCEDURE procedure_name()
BEGIN
SELECT column_name1, column_name2
FROM table_name
WHERE condition;
END //
DELIMITER ;
```
📋Executing Stored Procedure
#### **Syntax**
```sql
CALL procedure_name();
```
📋Drop Procedure
#### **Syntax**
```sql
DROP PROCEDURE procedure_name;
```
✅ Function: GetBalance
Returns the current balance of a given account.
# ⛏️Tools
🔹 MySQL Workbench

# **Happy Learning! 🎓**
