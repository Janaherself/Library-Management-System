WITH LoansPerDay AS (
	SELECT DATENAME(weekday, DateBorrowed) AS Day, COUNT(*) AS LoanCount
	FROM Loans
	GROUP BY DATENAME(weekday, DateBorrowed)
),
TotalLoans AS (
	SELECT SUM(LoanCount) AS TotalLoanCount
	FROM LoansPerDay
)

SELECT TOP 3 Day, LoanCount, CAST(LoanCount*100 / TotalLoanCount AS DECIMAL(6,2)) AS LoanPercentage
FROM LoansPerDay, TotalLoans
ORDER BY LoanPercentage DESC;
