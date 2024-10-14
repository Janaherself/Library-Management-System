CREATE FUNCTION fn_BookBorrowingFrequency (@BookID INT)
RETURNS INT
AS
BEGIN
	DECLARE @BorrowCount INT;
	SELECT @BorrowCount = COUNT(*)
	FROM Loans
	WHERE BookID = @BookID;

	RETURN @BorrowCount;
END;

SELECT BookID, dbo.fn_BookBorrowingFrequency(BookID) as BorrowingFrequency
FROM Books
WHERE BookID = 5;
