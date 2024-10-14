SELECT
	CASE
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 51 AND 60 THEN '51-60'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 61 AND 70 THEN '61-70'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 71 AND 81 THEN '71-80'
		ELSE 'Other'
	END AS AgeGroup,
	book.Genre,
	COUNT(loan.LoanID) AS BorrowCount
FROM Borrowers AS borrower
JOIN Loans AS loan ON borrower.BorrowerID = loan.BorrowerID
JOIN Books AS book ON loan.BookID = book.BookID
GROUP BY 
	CASE
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 51 AND 60 THEN '51-60'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 61 AND 70 THEN '61-70'
		WHEN DATEDIFF(YEAR, borrower.DateofBirth, GETDATE()) BETWEEN 71 AND 81 THEN '71-80'
		ELSE 'Other'
	END,
	book.Genre
HAVING COUNT(loan.LoanID) > 0
ORDER BY AgeGroup, BorrowCount DESC;
