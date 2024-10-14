WITH GenreCounts as (
	SELECT Books.Genre, COUNT(Loans.LoanID) as LoanCount
	FROM Books
	JOIN Loans on Books.BookID = Loans.BookID
	WHERE Month(Loans.DateBorrowed) = 9
	GROUP BY Books.Genre)

SELECT Genre, LoanCount, RANK() OVER (ORDER BY LoanCount DESC) as GenreRank
FROM GenreCounts;