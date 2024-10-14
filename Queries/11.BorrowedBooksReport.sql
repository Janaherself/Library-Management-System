CREATE PROCEDURE sp_BorrowedBooksReport
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT loan.LoanID, borrower.FirstName, borrower.LastName, book.Title, loan.DateBorrowed
    FROM Borrowers AS borrower
    JOIN Loans AS loan ON borrower.BorrowerID = loan.BorrowerID
    JOIN Books AS book ON loan.BookID = book.BookID
    WHERE loan.DateBorrowed BETWEEN @StartDate AND @EndDate
	ORDER BY loan.DateBorrowed DESC;
END;

EXEC sp_BorrowedBooksReport '2024-1-1', '2024-6-1';
