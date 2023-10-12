-- Step 1: Create roles/groups for security in the database
USE Northwind;
GO

-- Create SalesRole
CREATE ROLE SalesRole;
GO

-- Create HRRole
CREATE ROLE HRRole;
GO

-- Create CEORole
CREATE ROLE CEORole;
GO

-- Step 2: Modify access for those roles/groups
-- Grant SalesRole the ability to view Orders and Customers table
GRANT SELECT ON dbo.Orders TO SalesRole;
GRANT SELECT ON dbo.Customers TO SalesRole;
GO

-- Grant HRRole the ability to view Employee table
GRANT SELECT ON dbo.Employees TO HRRole;
GO

-- Grant CEORole the ability to view Orders, Customers, and Employee tables
GRANT SELECT ON dbo.Orders TO CEORole;
GRANT SELECT ON dbo.Customers TO CEORole;
GRANT SELECT ON dbo.Employees TO CEORole;
GO

-- Step 3: Create three new database users
CREATE LOGIN User_CEO WITH PASSWORD = 'User_CEO'; 
CREATE LOGIN User_HR WITH PASSWORD = 'User_HR';  
CREATE LOGIN User_Sales WITH PASSWORD = 'User_Sales';  
GO

-- Step 4: Add each user to the appropriate role/group
USE Northwind;
GO

-- Add User_CEO to CEORole
CREATE USER User_CEO FOR LOGIN User_CEO;
ALTER ROLE CEORole ADD MEMBER User_CEO;
GO

-- Add User_HR to HRRole
CREATE USER User_HR FOR LOGIN User_HR;
ALTER ROLE HRRole ADD MEMBER User_HR;
GO

-- Add User_Sales to SalesRole
CREATE USER User_Sales FOR LOGIN User_Sales;
ALTER ROLE SalesRole ADD MEMBER User_Sales;
GO

