CREATE INDEX ix_Books_Title ON Books(Title);
CREATE INDEX ix_Books_Author ON Books(Author);
CREATE INDEX ix_Books_CurrentStatus ON Books(CurrentStatus);
CREATE FULLTEXT INDEX ON Books(Title, Author)
KEY INDEX PK__Books__3DE0C22759112627;

CREATE INDEX ix_Borrowers_LastName_FirstName ON Borrowers(LastName, FirstName);

CREATE INDEX fk_Loans_BookID ON Loans(BookID);
CREATE INDEX fk_Loans_BorrowerID ON Loans(BorrowerID);
CREATE INDEX ix_Loans_DateBorrowed ON Loans(DateBorrowed);
CREATE INDEX ix_Loans_DateReturned ON Loans(DateReturned);
