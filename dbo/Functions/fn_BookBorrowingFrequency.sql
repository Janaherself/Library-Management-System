CREATE FUNCTION fn_BookBorrowingFrequency (@BookID INT)
RETURNS INT
AS
BEGIN
	DECLARE @BorrowCount INT;
	SELECT @BorrowCount = COUNT(*)
	FROM dbo.Loans
	WHERE Loans.BookID = @BookID;

	RETURN @BorrowCount;
END;