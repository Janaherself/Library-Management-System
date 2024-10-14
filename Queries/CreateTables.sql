create table Books (
    BookID int identity primary key,
    Title varchar(100),
    Author varchar(50),
    ISBN varchar(20),
    PublishedDate date,
    Genre varchar(50),
    ShelfLocation varchar(50),
    CurrentStatus varchar(50) CHECK (CurrentStatus IN ('Available', 'Borrowed'))
);

create table Borrowers (
	BorrowerID int identity primary key,
	FirstName varchar(50),
	LastName varchar(50),
	Email varchar(255),
	DateofBirth date,
	MembershipDate date
);

create table Loans (
	LoanID int identity primary key,
	BookID int foreign key references Books(BookID),
	BorrowerID int foreign key references Borrowers(BorrowerID),
	DateBorrowed date,
	DueDate date,
	DateReturned date
);

