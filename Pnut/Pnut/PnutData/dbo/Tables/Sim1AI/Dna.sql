﻿CREATE TABLE [dbo].[Dna]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	[Generation] INT NOT NULL,
	[Value] DECIMAL(9,6) NOT NULL,
	[CreatedOn] DATETIME NOT NULL,
)
