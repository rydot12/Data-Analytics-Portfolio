USE [LocalLibrary]
GO

/****** Object:  View [dbo].[vw_BooksWithAuthors]    Script Date: 10/23/2025 8:38:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_BooksWithAuthors] AS
SELECT
	b.BookID,
	b.Title,
	b.Genre,
	b.PublishedYear,
	a.FirstName AS AuthorFirstName,
	a.LastName AS AuthorLastName
FROM Books b
JOIN Authors a
	ON b.AuthorID = a.AuthorID;
GO


