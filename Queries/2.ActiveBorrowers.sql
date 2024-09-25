WITH ActiveBorrowers as (
	SELECT BorrowerID, COUNT(*) as BorrowedBooksCount
	FROM Loans 
	WHERE DateReturned is NULL
	GROUP BY BorrowerID
	HAVING COUNT(*) >= 2)

SELECT * FROM ActiveBorrowers
ORDER BY BorrowedBooksCount DESC;