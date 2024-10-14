SELECT book.Title, loan.DateBorrowed, loan.DateReturned
FROM dbo.Loans as loan
JOIN Books as book ON loan.BookID = book.BookID
WHERE loan.BorrowerID = 913;