-- Part A:
--1. 
Select p.BusinessEntityID, p.LastName, p.FirstName 
FROM AdventureWorks2022.Person.Person as p;

--2. 
Select p.BusinessEntityID, p.LastName, p.FirstName 
FROM AdventureWorks2022.Person.Person as p 
ORDER BY p.LastName;

--3. 
Select p.BusinessEntityID, p.LastName, p.FirstName, e.EmailAddress AS Email
FROM AdventureWorks2022.Person.Person as p
LEFT JOIN AdventureWorks2022.Person.EmailAddress AS E 
	ON p.BusinessEntityID = e.BusinessEntityID
ORDER BY p.LastName;

--4. 
SELECT p.BusinessEntityID, p.LastName, p.FirstName, e.EmailAddress AS Email, pp.PhoneNumber, pnt.Name AS PhoneType
FROM AdventureWorks2022.Person.Person AS p
LEFT JOIN AdventureWorks2022.Person.EmailAddress AS e
	ON p.BusinessEntityID = e.BusinessEntityID
LEFT JOIN AdventureWorks2022.Person.PersonPhone AS pp
	ON p.BusinessEntityID = pp.BusinessEntityID
LEFT JOIN AdventureWorks2022.Person.PhoneNumberType AS pnt
	ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID
ORDER BY p.LastName;

--5. 
USE AdventureWorks2022;
GO
Select p.BusinessEntityID, p.LastName, p.FirstName, e.EmailAddress AS Email, pp.PhoneNumber AS PhoneNumber, pnt.Name AS PhoneType,
bea.AddressID AS AddressID, a.AddressLine1 AS AddressLine1, a.City AS City, a.StateProvinceID AS StateProvinceID, a.PostalCode AS PostalCode
FROM Person.Person AS p
LEFT JOIN Person.EmailAddress AS e
	ON p.BusinessEntityID = e.BusinessEntityID
LEFT JOIN Person.PersonPhone AS pp
	ON p.BusinessEntityID = pp.BusinessEntityID
LEFT JOIN person.PhoneNumberType AS pnt
	ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID
LEFT JOIN person.BusinessEntityAddress AS bea
	ON p.BusinessEntityID = bea.BusinessEntityID
LEFT JOIN Person.Address AS a
	ON bea.AddressID = a.AddressID
ORDER BY p.LastName;

--6. 
USE AdventureWorks2022;
GO
Select p.BusinessEntityID, p.LastName, p.FirstName, e.EmailAddress AS Email, pp.PhoneNumber AS PhoneNumber, pnt.Name AS PhoneType,
bea.AddressID AS AddressID, a.AddressLine1 AS AddressLine1, a.City AS City, a.StateProvinceID AS StateProvinceID, sp.StateProvinceCode, sp.CountryRegionCode,
sp.Name AS StateName, a.PostalCode AS PostalCode
FROM Person.Person AS p
LEFT JOIN Person.EmailAddress AS e
	ON p.BusinessEntityID = e.BusinessEntityID
LEFT JOIN Person.PersonPhone AS pp
	ON p.BusinessEntityID = pp.BusinessEntityID
LEFT JOIN person.PhoneNumberType AS pnt
	ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID
LEFT JOIN person.BusinessEntityAddress AS bea
	ON p.BusinessEntityID = bea.BusinessEntityID
LEFT JOIN Person.Address AS a
	ON bea.AddressID = a.AddressID
LEFT JOIN person.StateProvince AS sp
	ON a.StateProvinceID = sp.StateProvinceID
ORDER BY p.LastName;

-- Part B:
--1. 
USE AdventureWorks2022;
GO
SELECT d.GroupName, 
	COUNT(d.DepartmentID) AS DepartmentCount
FROM HumanResources.Department as d
GROUP BY d.GroupName
ORDER BY d.GroupName;

--2. 
USE AdventureWorks2022;
GO
SELECT DISTINCT psc.ProductSubcategoryID,
	psc.Name AS SubcategoryName
FROM Production.ProductSubcategory AS psc
ORDER BY psc.Name;

--3. 
USE AdventureWorks2022;
GO
SELECT 
	psc.ProductSubcategoryID,
	psc.Name As SubcategoryName,
	COUNT(p.ProductID) AS ProductCount
FROM Production.ProductSubcategory AS psc
LEFT JOIN Production.Product AS p
	ON psc.ProductSubcategoryID = p.ProductSubcategoryID
GROUP BY
	psc.ProductSubcategoryID,
	psc.Name
ORDER BY
	psc.Name;

--4. 
USE AdventureWorks2022;
GO
SELECT 
	psc.ProductSubcategoryID,
	psc.Name As SubcategoryName,
	COUNT(p.ProductID) AS ProductCount,
	AVG(p.StandardCost) AS AvgStandardCost,
	AVG(p.ListPrice) AS AvgListPrice
FROM Production.ProductSubcategory AS psc
LEFT JOIN Production.Product AS p
	ON psc.ProductSubcategoryID = p.ProductSubcategoryID
GROUP BY
	psc.ProductSubcategoryID,
	psc.Name
ORDER BY
	psc.Name;

--5. 
USE AdventureWorks2022;
GO
SELECT 
	psc.ProductSubcategoryID,
	psc.Name As SubcategoryName,
	COUNT(DISTINCT p.ProductID) AS ProductCount,
	AVG(p.StandardCost) AS AvgStandardCost,
	AVG(p.ListPrice) AS AvgListPrice,
	COALESCE(SUM(pi.Quantity), 0) AS TotalInventoryQuantity
FROM Production.ProductSubcategory AS psc
LEFT JOIN Production.Product AS p
	ON psc.ProductSubcategoryID = p.ProductSubcategoryID
LEFT JOIN Production.ProductInventory AS pi
	ON p.ProductID = pi.ProductID
GROUP BY
	psc.ProductSubcategoryID,
	psc.Name
ORDER BY
	psc.Name;

-- Part C:
--1. 
-- I am using a local library for my database example

--3. 
CREATE DATABASE LocalLibrary;
GO

USE LocalLibrary;
GO

CREATE TABLE Authors(
	AuthorID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Books (
	BookID INT Identity(1,1) PRIMARY KEY,
	Title NVARCHAR(100) NOT NULL,
	Genre NVARCHAR(50),
	PublishedYear INT,
	AuthorID INT NOT NULL,
	FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
GO

CREATE TABLE Members (
	MemberID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(100)
);
GO

CREATE TABLE BorrowedBooks (
	BorrowID INT IDENTITY(1,1) PRIMARY KEY,
	MemberID INT NOT NULL,
	BookID INT NOT NULL,
	BorrowDate DATE,
	ReturnDate DATE,
	FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
	FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
GO

-- INSERT statements
INSERT INTO Authors (FirstName, LastName)
VALUES
('George', 'Orwell'),
('Harper','Lee'),
('JK', 'Rowling');

INSERT INTO Books (Title, Genre, PublishedYear, AuthorID)
VALUES
('1984','Dystopian', 1949, 1),
('To Kill a Mockingbird', 'Fiction', 1960, 2),
('Harry Potter and the Sorcerrers Stone', 'Fantasy', 1997, 3),
('Harry Potter and the Chamber of Secrets', 'Fantasy', 1998, 3);

INSERT INTO Members (FirstName, LastName, Email)
VALUES
('John', 'Smith', 'john.smith@email.com'),
('Emily', 'Johnson', 'emily.johnson@email.com');

INSERT INTO BorrowedBooks (MemberID, BookID, BorrowDate, ReturnDate)
VALUES
(1, 1, '2025-10-01', '2025-10-15'),
(2, 3, '2025-10-05', NULL),
(1, 4, '2025-10-10', NULL);
GO

SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Books;

--4. 
CREATE VIEW vm_Authors AS
SELECT AuthorID, FirstName, LastName FROM Authors;
GO

CREATE VIEW vm_Books AS
SELECT BookID, Title, Genre, PublishedYear, AuthorID
FROM Books;
GO

CREATE VIEW vm_Members AS
SELECT MemberID, FirstName, LastName, Email
FROM Members;
GO

CREATE VIEW vm_BorrowedBooks AS
SELECT BorrowID, MemberID, BookID, BorrowDate, ReturnDate
FROM BorrowedBooks;
GO

--5. 
CREATE VIEW vw_BooksWithAuthors AS
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

--6 Query 1
SELECT
	bb.BorrowID,
	m.FirstName + ' ' + m.LastName AS MemberName,
	b.Title AS BookTitle,
	DATEDIFF(DAY, bb.BorrowDate, ISNULL(bb.ReturnDate, GETDATE())) AS DaysBorrowed
FROM BorrowedBooks bb
JOIN Members m ON bb.MemberID = m.MemberID
JOIN Books b ON b.BookID = bb.BookID;

--6 Query 2
SELECT
	a.FirstName + ' ' + a.LastName AS AuthorName,
	COUNT(b.BookID) AS TotalBooks,
	AVG(b.PublishedYear) AS AvgPublishedYear
FROM Books b 
JOIN Authors a ON b.AuthorID = a.AuthorID
GROUP BY a.FirstName, a.LastName
HAVING COUNT(b.BookID) > 1;

