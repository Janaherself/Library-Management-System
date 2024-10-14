CREATE TABLE [dbo].[AuditLog] (
    [AuditID]    INT          IDENTITY (1, 1) NOT NULL,
    [BookID]     INT          NULL,
    [OldStatus]  VARCHAR (50) NULL,
    [NewStatus]  VARCHAR (50) NULL,
    [ChangeDate] DATETIME     DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([AuditID] ASC)
);

