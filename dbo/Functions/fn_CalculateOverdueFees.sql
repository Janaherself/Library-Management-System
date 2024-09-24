CREATE FUNCTION fn_CalculateOverdueFees (@LoanID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
	DECLARE @DueDate DATE, @DateReturned DATE, @DaysOverDue INT, @Fee DECIMAL(10, 2);
	SET @Fee = 0;

	SELECT @DueDate = DueDate, @DateReturned = DateReturned
	FROM Loans
	WHERE LoanID = @LoanID;

	SET @DaysOverDue = DATEDIFF(DAY, @DueDate, COALESCE(@DateReturned, GETDATE()));

	IF @DaysOverDue <= 0
		SET @Fee = 0;
	ELSE IF @DaysOverDue <= 30
		SET @Fee = @DaysOverDue * 1;
	ELSE
		SET @Fee = 30 + (@DaysOverDue - 30) * 2;

	Return @Fee;

END;