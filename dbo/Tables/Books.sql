CREATE TABLE [dbo].[Books] (
    [BookID]        INT           IDENTITY (1, 1) NOT NULL,
    [Title]         VARCHAR (100) NULL,
    [Author]        VARCHAR (50)  NULL,
    [ISBN]          VARCHAR (20)  NULL,
    [PublishedDate] DATE          NULL,
    [Genre]         VARCHAR (50)  NULL,
    [ShelfLocation] VARCHAR (50)  NULL,
    [CurrentStatus] VARCHAR (50)  NULL,
    CONSTRAINT [PK__Books__3DE0C22759112627] PRIMARY KEY CLUSTERED ([BookID] ASC),
    CHECK ([CurrentStatus]='Borrowed' OR [CurrentStatus]='Available')
);




GO
CREATE TRIGGER trg_BookStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
    DECLARE @BookID INT, @OldStatus VARCHAR(50), @NewStatus VARCHAR(50);
    
    SELECT @BookID = INSERTED.BookID, @NewStatus = INSERTED.CurrentStatus, @OldStatus = DELETED.CurrentStatus
    FROM INSERTED
    JOIN DELETED ON INSERTED.BookID = DELETED.BookID;
    
    IF (@OldStatus != @NewStatus)
    BEGIN
        INSERT INTO AuditLog (BookID, OldStatus, NewStatus)
        VALUES (@BookID, @OldStatus, @NewStatus);
    END;
END;
GO
CREATE NONCLUSTERED INDEX [ix_Books_Title]
    ON [dbo].[Books]([Title] ASC);


GO
CREATE NONCLUSTERED INDEX [ix_Books_CurrentStatus]
    ON [dbo].[Books]([CurrentStatus] ASC);


GO
CREATE NONCLUSTERED INDEX [ix_Books_Author]
    ON [dbo].[Books]([Author] ASC);

