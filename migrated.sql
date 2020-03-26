/* Using connection string Server=GPS-0193\SQLEXPRESS01;Database=Demo1;Integrated Security=True; */
/* VersionMigration migrating ================================================ */

/* Beginning Transaction */
BEGIN TRANSACTION
GO
/* CreateTable VersionInfo */
CREATE TABLE [dbo].[VersionInfo] ([Version] BIGINT NOT NULL)
GO
/* Committing Transaction */
COMMIT TRANSACTION
GO
/* VersionMigration migrated */
/* VersionUniqueMigration migrating ========================================== */

/* Beginning Transaction */
BEGIN TRANSACTION
GO
/* CreateIndex VersionInfo (Version) */
CREATE UNIQUE CLUSTERED INDEX [UC_Version] ON [dbo].[VersionInfo] ([Version] ASC)
GO
/* AlterTable VersionInfo */
/* No SQL statement executed. */
/* CreateColumn VersionInfo AppliedOn DateTime */
ALTER TABLE [dbo].[VersionInfo] ADD [AppliedOn] DATETIME
GO
/* Committing Transaction */
COMMIT TRANSACTION
GO
/* VersionUniqueMigration migrated */
/* VersionDescriptionMigration migrating ===================================== */

/* Beginning Transaction */
BEGIN TRANSACTION
GO
/* AlterTable VersionInfo */
/* No SQL statement executed. */
/* CreateColumn VersionInfo Description String */
ALTER TABLE [dbo].[VersionInfo] ADD [Description] NVARCHAR(1024)
GO
/* Committing Transaction */
COMMIT TRANSACTION
GO
/* VersionDescriptionMigration migrated */
/* 1: AddSchema migrating ==================================================== */

/* Beginning Transaction */
BEGIN TRANSACTION
GO
/* CreateSchema Company */
CREATE SCHEMA [Company]
GO
INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (1, '2020-03-19T11:00:41', N'AddSchema')
GO
/* Committing Transaction */
COMMIT TRANSACTION
GO
/* 1: AddSchema migrated */
/* 2: AddDepartmentTable migrating =========================================== */

/* Beginning Transaction */
BEGIN TRANSACTION
GO
/* CreateTable Departments */
CREATE TABLE [Company].[Departments] ([Id] BIGINT NOT NULL IDENTITY(1,1), [Name] NVARCHAR(255) NOT NULL, [Created] DATETIME NOT NULL CONSTRAINT [DF_Departments_Created] DEFAULT '2020-03-19T11:00:41', CONSTRAINT [PK_Departments] PRIMARY KEY ([Id]))
GO
/* CreateIndex Departments (Name) */
CREATE INDEX [ix_Name] ON [Company].[Departments] ([Name] ASC)
GO
INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (2, '2020-03-19T11:00:41', N'AddDepartmentTable')
GO
/* Committing Transaction */
COMMIT TRANSACTION
GO
/* 2: AddDepartmentTable migrated */
/* 3: AddEmployeeTable migrating ============================================= */

/* Beginning Transaction */
BEGIN TRANSACTION
GO
/* CreateTable Employees */
CREATE TABLE [Company].[Employees] ([Id] BIGINT NOT NULL IDENTITY(1,1), [Firstname] NVARCHAR(255) NOT NULL, [Lastname] NVARCHAR(255) NOT NULL, [DepartmentId] BIGINT NOT NULL, [Created] DATETIME NOT NULL CONSTRAINT [DF_Employees_Created] DEFAULT '2020-03-19T11:00:41', CONSTRAINT [PK_Employees] PRIMARY KEY ([Id]))
GO
/* CreateForeignKey fk_Employees_DepartmentId_Departments_Id Employees(DepartmentId) Departments(Id) */
ALTER TABLE [Company].[Employees] ADD CONSTRAINT [fk_Employees_DepartmentId_Departments_Id] FOREIGN KEY ([DepartmentId]) REFERENCES [Company].[Departments] ([Id])
GO
INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (3, '2020-03-19T11:00:41', N'AddEmployeeTable')
GO
/* Committing Transaction */
COMMIT TRANSACTION
GO
/* 3: AddEmployeeTable migrated */
/* 4: AddAddressTable migrating ============================================== */

/* Beginning Transaction */
BEGIN TRANSACTION
GO
/* CreateTable Addresses */
CREATE TABLE [Company].[Addresses] ([Id] BIGINT NOT NULL IDENTITY(1,1), [Street] NVARCHAR(255) NOT NULL, [Town] NVARCHAR(255) NOT NULL, [Postcode] NVARCHAR(255) NOT NULL, [EmployeeId] BIGINT NOT NULL, [Created] DATETIME NOT NULL CONSTRAINT [DF_Addresses_Created] DEFAULT '2020-03-19T11:00:41', CONSTRAINT [PK_Addresses] PRIMARY KEY ([Id]))
GO
/* CreateForeignKey fk_Addresses_EmployeeId_Employee_Id Addresses(EmployeeId) Employees(Id) */
ALTER TABLE [Company].[Addresses] ADD CONSTRAINT [fk_Addresses_EmployeeId_Employee_Id] FOREIGN KEY ([EmployeeId]) REFERENCES [Company].[Employees] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (4, '2020-03-19T11:00:41', N'AddAddressTable')
GO
/* Committing Transaction */
COMMIT TRANSACTION
GO
/* 4: AddAddressTable migrated */
/* 5: AddJobTitleTable migrating ============================================= */

/* Beginning Transaction */
BEGIN TRANSACTION
GO
/* CreateTable JobTitles */
CREATE TABLE [Company].[JobTitles] ([Id] BIGINT NOT NULL IDENTITY(1,1), [Title] NVARCHAR(255) NOT NULL, [Created] DATETIME NOT NULL CONSTRAINT [DF_JobTitles_Created] DEFAULT '2020-03-19T11:00:41', CONSTRAINT [PK_JobTitles] PRIMARY KEY ([Id]))
GO
INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (5, '2020-03-19T11:00:41', N'AddJobTitleTable')
GO
/* Committing Transaction */
COMMIT TRANSACTION
GO
/* 5: AddJobTitleTable migrated */
/* 6: UpdateAddressTable migrating =========================================== */

/* Beginning Transaction */
BEGIN TRANSACTION
GO
/* CreateColumn Addresses HouseNo String */
ALTER TABLE [Company].[Addresses] ADD [HouseNo] NVARCHAR(255)
GO
INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (6, '2020-03-19T11:00:41', N'UpdateAddressTable')
GO
/* Committing Transaction */
COMMIT TRANSACTION
GO
/* 6: UpdateAddressTable migrated */
/* 7: AddJobTitleJoinTable migrating ========================================= */

/* Beginning Transaction */
BEGIN TRANSACTION
GO
/* CreateTable EmployeeJobTitles */
CREATE TABLE [Company].[EmployeeJobTitles] ([EmployeeId] BIGINT NOT NULL, [JobTitleId] BIGINT NOT NULL)
GO
INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (7, '2020-03-19T11:00:41', N'AddJobTitleJoinTable')
GO
/* Committing Transaction */
COMMIT TRANSACTION
GO
/* 7: AddJobTitleJoinTable migrated */
/* 8: InsertSeedData migrating =============================================== */

/* Beginning Transaction */
BEGIN TRANSACTION
GO
INSERT INTO [Company].[JobTitles] ([Title]) VALUES (N'Manager'); INSERT INTO [Company].[JobTitles] ([Title]) VALUES (N'QA'); INSERT INTO [Company].[JobTitles] ([Title]) VALUES (N'Developer'); INSERT INTO [Company].[JobTitles] ([Title]) VALUES (N'Dba')
GO
/* -> 1 Insert operations completed in 00:00:00.0039891 taking an average of 00:00:00.0039891 */
INSERT INTO [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (8, '2020-03-19T11:00:41', N'InsertSeedData')
GO
/* Committing Transaction */
COMMIT TRANSACTION
GO
/* 8: InsertSeedData migrated */
/* Task completed. */
