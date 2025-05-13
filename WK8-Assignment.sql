-- Create database
CREATE DATABASE LibraryManagement;

-- Use database
USE LibraryManagement;

-- Create tables
CREATE TABLE Authors (
  AuthorID INT AUTO_INCREMENT,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  PRIMARY KEY (AuthorID)
);

CREATE TABLE Publishers (
  PublisherID INT AUTO_INCREMENT,
  PublisherName VARCHAR(100) NOT NULL,
  PRIMARY KEY (PublisherID)
);

CREATE TABLE Books (
  BookID INT AUTO_INCREMENT,
  Title VARCHAR(200) NOT NULL,
  AuthorID INT,
  PublisherID INT,
  PublicationDate DATE,
  ISBN VARCHAR(20) UNIQUE,
  PRIMARY KEY (BookID),
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
  FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

CREATE TABLE Members (
  MemberID INT AUTO_INCREMENT,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100) UNIQUE,
  PRIMARY KEY (MemberID)
);

CREATE TABLE Borrowings (
  BorrowingID INT AUTO_INCREMENT,
  BookID INT,
  MemberID INT,
  BorrowDate DATE,
  ReturnDate DATE,
  PRIMARY KEY (BorrowingID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Fines (
  FineID INT AUTO_INCREMENT,
  BorrowingID INT,
  FineAmount DECIMAL(10, 2),
  PRIMARY KEY (FineID),
  FOREIGN KEY (BorrowingID) REFERENCES Borrowings(BorrowingID)
);
