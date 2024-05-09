USE master;  
GO
IF DB_ID ( N'CustomerDB' ) IS NOT NULL
DROP DATABASE CustomerDB;
GO
CREATE DATABASE CustomerDB;  
GO
use CustomerDB;
IF OBJECT_ID(N'dbo.Customers', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Customers];  
GO
CREATE TABLE Customers (Customer_Id INT PRIMARY KEY IDENTITY (1, 1),Customer_Name nchar(150) );
INSERT INTO Customers ([Customer_Name]) VALUES ('John DoeZ');
INSERT INTO Customers ([Customer_Name]) VALUES ('Matthias DesmoulinsZ');
INSERT INTO Customers ([Customer_Name]) VALUES ('Jean Marc AubryZ');
BEGIN TRANSACTION;
UPDATE Customers SET Customer_Name = SUBSTRING(Customer_Name , 1, LEN(Customer_Name)-1);
COMMIT;