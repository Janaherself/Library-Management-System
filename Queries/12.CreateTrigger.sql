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
