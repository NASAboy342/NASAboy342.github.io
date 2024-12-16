﻿CREATE TABLE [dbo].[ScenarioTask]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	[ScenarioId] INT NOT NULL,
	[Title] VARCHAR(255) NOT NULL DEFAULT '',
	[Description] VARCHAR(MAX) NOT NULL DEFAULT '',
	[Priority] INT NOT NULL DEFAULT 0,
	[Status] NVARCHAR(100) NOT NULL DEFAULT 'Todo',
	[AssignedTo] NVARCHAR(MAX) NOT NULL DEFAULT '[]',
	[CreatedOn] DATETIME NOT NULL,
	[ModifiedOn] DATETIME NOT NULL,
	[CreatedBy] NVARCHAR(200) NOT NULL DEFAULT '',
	[ModifiedBy] NVARCHAR(200) NOT NULL DEFAULT ''
)