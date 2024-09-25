CREATE PROCEDURE sp_OverdueBooks
AS
BEGIN
    CREATE TABLE TempOverdueBorrowers (
        BorrowerID INT,
        BookID INT,
        DaysOverdue INT
    );

    INSERT INTO TempOverdueBorrowers (BorrowerID, BookID, DaysOverdue)
    SELECT loan.BorrowerID, loan.BookID, DATEDIFF(DAY, loan.DueDate, GETDATE())
    FROM Loans AS loan
    WHERE loan.DateReturned IS NULL AND DATEDIFF(DAY, loan.DueDate, GETDATE()) > 0;

    SELECT temp.BorrowerID, loan.BookID, temp.DaysOverdue, borrower.FirstName, borrower.LastName, book.Title
    FROM TempOverdueBorrowers AS temp
    JOIN Loans AS loan ON temp.BorrowerID = loan.BorrowerID AND temp.BookID = loan.BookID
    JOIN Borrowers AS borrower ON temp.BorrowerID = borrower.BorrowerID
    JOIN Books AS book ON temp.BookID = book.BookID
	ORDER BY temp.BorrowerID, temp.DaysOverdue DESC;

    DROP TABLE TempOverdueBorrowers;
END;