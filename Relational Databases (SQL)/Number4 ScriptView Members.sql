USE [LocalLibrary]
GO

/****** Object:  View [dbo].[vm_BorrowedBooks]    Script Date: 10/23/2025 8:31:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vm_BorrowedBooks] AS
SELECT BorrowID, MemberID, BookID, BorrowDate, ReturnDate
FROM BorrowedBooks;
GO


