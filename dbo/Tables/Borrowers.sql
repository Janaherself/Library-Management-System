CREATE TABLE [dbo].[Borrowers] (
    [BorrowerID]     INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]      VARCHAR (50)  NULL,
    [LastName]       VARCHAR (50)  NULL,
    [Email]          VARCHAR (255) NULL,
    [DateofBirth]    DATE          NULL,
    [MembershipDate] DATE          NULL,
    PRIMARY KEY CLUSTERED ([BorrowerID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ix_Borrowers_LastName_FirstName]
    ON [dbo].[Borrowers]([LastName] ASC, [FirstName] ASC);

