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


GO
CREATE NONCLUSTERED INDEX [ix_Loans_DateReturned]
    ON [dbo].[Loans]([DateReturned] ASC);


GO
CREATE NONCLUSTERED INDEX [ix_Loans_DateBorrowed]
    ON [dbo].[Loans]([DateBorrowed] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_Loans_BorrowerID]
    ON [dbo].[Loans]([BorrowerID] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_Loans_BookID]
    ON [dbo].[Loans]([BookID] ASC);

