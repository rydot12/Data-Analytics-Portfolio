USE [LocalLibrary]
GO

/****** Object:  View [dbo].[vm_Books]    Script Date: 10/23/2025 8:30:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vm_Books] AS
SELECT BookID, Title, Genre, PublishedYear, AuthorID
FROM Books;
GO


