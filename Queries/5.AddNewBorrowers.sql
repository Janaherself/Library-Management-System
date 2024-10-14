CREATE PROCEDURE sp_AddNewBorrower
	@FirstName varchar(50),
	@LastName varchar(50),
	@Email varchar (255),
	@DateofBirth date,
	@MembershipDate date
as
BEGIN
	IF EXISTS (SELECT email FROM Borrowers WHERE Email = @Email)
	BEGIN
		RAISERROR('Email Already Exists!', 16, 3);
		RETURN;
	END

	ELSE

	BEGIN
	INSERT INTO Borrowers (FirstName, LastName, Email,DateofBirth, MembershipDate)
	VALUES (@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);

	SELECT SCOPE_IDENTITY() AS NewBorrowerID;
	END
END;

EXEC sp_AddNewBorrower @FirstName = 'Jana', @LastName = 'Abusaa', @Email = 'jana.abusaa@gmail.com', @DateOfBirth = '2001-9-26', @MembershipDate = '2024-1-1';
