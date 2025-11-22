USE [LocalLibrary]
GO

/****** Object:  View [dbo].[vm_Authors]    Script Date: 10/23/2025 8:30:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vm_Authors] AS
SELECT AuthorID, FirstName, LastName FROM Authors;
GO


