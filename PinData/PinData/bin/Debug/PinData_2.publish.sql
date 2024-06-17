﻿/*
Deployment script for PinData

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "PinData"
:setvar DefaultFilePrefix "PinData"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[IpAddress]...';


GO
ALTER TABLE [dbo].[IpAddress] DROP CONSTRAINT [DF__IpAddress__LastI__49C3F6B7];


GO
PRINT N'Altering Table [dbo].[IpAddress]...';


GO
ALTER TABLE [dbo].[IpAddress] ALTER COLUMN [LastIpAddress] NVARCHAR (50) NOT NULL;


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[IpAddress]...';


GO
ALTER TABLE [dbo].[IpAddress]
    ADD DEFAULT '' FOR [LastIpAddress];


GO
PRINT N'Refreshing Procedure [dbo].[GetPreviousIp]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[GetPreviousIp]';


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


Declare @tasks table
(
	[Name] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(50) NOT NULL,
	[Status] NVARCHAR(50) NOT NULL
)

insert into @tasks
(
	[Name],
	[Description],
	[Status]
)
Values
('Go for run','To self running', 'Todo'),
('Learn vue','To join pilot team', 'InProgress'),
('Write a blog post','To share my knowledge', 'Done'),
('Cook dinner','To feed my family', 'Todo'),
('Read a book','To relax and learn', 'InProgress'),
('Clean the house','To make it tidy', 'Done')

Merge [dbo].[Tasks] as T
using @tasks as S
on T.[Name] = S.[Name]
and T.[Description] = S.[Description]
WHEN NOT MATCHED BY TARGET THEN
	INSERT
	(	
		[Name],
		[Description],
		[Status]
	)
	VALUES
	(
		S.[Name],
		S.[Description],
		S.[Status]
	);
GO

GO
PRINT N'Update complete.';


GO
