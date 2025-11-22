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
