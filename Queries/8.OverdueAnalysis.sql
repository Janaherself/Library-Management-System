SELECT loan.BookID, loan.LoanID, loan.BorrowerID, loan.DueDate, 
	DATEDIFF(DAY, loan.DueDate, COALESCE(loan.DateReturned, GETDATE())) AS DaysOverDue
FROM Loans AS loan
JOIN Borrowers AS borrower ON loan.BorrowerID = borrower.BorrowerID
WHERE loan.DateReturned IS NULL AND DATEDIFF(DAY, loan.DueDate, GETDATE()) > 30;