SELECT book.Author, COUNT(loan.LoanID) AS BorrowCount
FROM Books AS book
JOIN Loans AS loan ON book.BookID = loan.BookID
GROUP BY book.Author
ORDER BY BorrowCount DESC;