SeLECT BorrowerID, COUNT(LoanID) as BorrowingCount,
	RANK() OVER (ORDER BY COUNT(LoanID) DESC) as BorrowingRank
FROM Loans
GROUP BY BorrowerID;