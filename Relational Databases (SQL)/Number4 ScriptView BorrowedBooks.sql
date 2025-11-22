USE [LocalLibrary]
GO

/****** Object:  View [dbo].[vm_Members]    Script Date: 10/23/2025 8:31:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vm_Members] AS
SELECT MemberID, FirstName, LastName, Email
FROM Members;
GO


