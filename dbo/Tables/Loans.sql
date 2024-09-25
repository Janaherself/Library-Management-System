CREATE TABLE [dbo].[Loans] (
    [LoanID]       INT  IDENTITY (1, 1) NOT NULL,
    [BookID]       INT  NULL,
    [BorrowerID]   INT  NULL,
    [DateBorrowed] DATE NULL,
    [DueDate]      DATE NULL,
    [DateReturned] DATE NULL,
    PRIMARY KEY CLUSTERED ([LoanID] ASC),
    FOREIGN KEY ([BookID]) REFERENCES [dbo].[Books] ([BookID]),
    FOREIGN KEY ([BorrowerID]) REFERENCES [dbo].[Borrowers] ([BorrowerID])
);

