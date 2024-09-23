CREATE TABLE [dbo].[Books] (
    [BookID]        INT           IDENTITY (1, 1) NOT NULL,
    [Title]         VARCHAR (100) NULL,
    [Author]        VARCHAR (50)  NULL,
    [ISBN]          VARCHAR (20)  NULL,
    [PublishedDate] DATE          NULL,
    [Genre]         VARCHAR (50)  NULL,
    [ShelfLocation] VARCHAR (50)  NULL,
    [CurrentStatus] VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([BookID] ASC),
    CHECK ([CurrentStatus]='Borrowed' OR [CurrentStatus]='Available')
);

