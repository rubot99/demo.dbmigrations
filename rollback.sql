/* Using connection string Server=GPS-0193\SQLEXPRESS01;Database=Demo1;Integrated Security=True; */
/* 8: InsertSeedData reverting =============================================== */

/* FluentMigrator.Expressions.DeleteDataExpression */
DELETE FROM [Company].[JobTitles] WHERE 1 = 1
GO
DELETE FROM [dbo].[VersionInfo] WHERE [Version] = 8
GO
/* 8: InsertSeedData reverted */
/* 7: AddJobTitleJoinTable reverting ========================================= */

/* DeleteTable EmployeeJobTitles */
DROP TABLE [Company].[EmployeeJobTitles]
GO
DELETE FROM [dbo].[VersionInfo] WHERE [Version] = 7
GO
/* 7: AddJobTitleJoinTable reverted */
/* 6: UpdateAddressTable reverting =========================================== */

/* DeleteColumn Addresses HouseNo */
DECLARE @default sysname, @sql nvarchar(max);

-- get name of default constraint
SELECT @default = name
FROM sys.default_constraints
WHERE parent_object_id = object_id('[Company].[Addresses]')
AND type = 'D'
AND parent_column_id = (
SELECT column_id
FROM sys.columns
WHERE object_id = object_id('[Company].[Addresses]')
AND name = 'HouseNo'
);

-- create alter table command to drop constraint as string and run it
SET @sql = N'ALTER TABLE [Company].[Addresses] DROP CONSTRAINT ' + QUOTENAME(@default);
EXEC sp_executesql @sql;

-- now we can finally drop column
ALTER TABLE [Company].[Addresses] DROP COLUMN [HouseNo];

GO
DELETE FROM [dbo].[VersionInfo] WHERE [Version] = 6
GO
/* 6: UpdateAddressTable reverted */
/* 5: AddJobTitleTable reverting ============================================= */

/* DeleteTable JobTitles */
DROP TABLE [Company].[JobTitles]
GO
DELETE FROM [dbo].[VersionInfo] WHERE [Version] = 5
GO
/* 5: AddJobTitleTable reverted */
/* 4: AddAddressTable reverting ============================================== */

/* DeleteTable Addresses */
DROP TABLE [Company].[Addresses]
GO
DELETE FROM [dbo].[VersionInfo] WHERE [Version] = 4
GO
/* 4: AddAddressTable reverted */
/* 3: AddEmployeeTable reverting ============================================= */

/* DeleteTable Employees */
DROP TABLE [Company].[Employees]
GO
DELETE FROM [dbo].[VersionInfo] WHERE [Version] = 3
GO
/* 3: AddEmployeeTable reverted */
/* 2: AddDepartmentTable reverting =========================================== */

/* DeleteTable Departments */
DROP TABLE [Company].[Departments]
GO
DELETE FROM [dbo].[VersionInfo] WHERE [Version] = 2
GO
/* 2: AddDepartmentTable reverted */
/* 1: AddSchema reverting ==================================================== */

/* DeleteSchema Company */
DROP SCHEMA [Company]
GO
DELETE FROM [dbo].[VersionInfo] WHERE [Version] = 1
GO
/* 1: AddSchema reverted */
/* Task completed. */
