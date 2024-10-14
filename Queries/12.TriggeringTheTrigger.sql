SELECT * 
FROM Books
WHERE CurrentStatus = 'Available';
-- book with ID = 1 is available.

UPDATE Books
SET CurrentStatus = 'Borrowed'
WHERE BookID = 1;
-- triggers the action.

SELECT *
FROM AuditLog;
-- confirming that the trigger got triggered
