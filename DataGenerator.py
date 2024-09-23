import pyodbc
import random
from faker import Faker
from datetime import datetime, timedelta

fake = Faker()

connection = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                            'SERVER=LAPTOP-5RBHM2O9;'
                            'DATABASE=Janas Library;'
                            'Trusted_Connection=yes;')
cursor = connection.cursor()

def generate_books(n):
    genres = ['Fiction', 'Non-Fiction', 'Science', 'Fantasy', 'Mystery', 'History', 'Biography']
    books_data = []
    for i in range(n):
        title = fake.sentence(nb_words=3)
        author = fake.name()
        isbn = fake.isbn13()
        published_date = fake.date_between(start_date='-20y', end_date='today')
        genre = random.choice(genres)
        shelf_location = f"{random.choice(['A', 'B', 'C', 'D'])}{random.randint(1, 20)}"
        status = random.choice(['Available', 'Borrowed'])
        books_data.append((title, author, isbn, published_date, genre, shelf_location, status))
    return books_data

def insert_books(books_data):
    for book in books_data:
        cursor.execute('''
            INSERT INTO Books (Title, Author, ISBN, PublishedDate, Genre, ShelfLocation, CurrentStatus)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', book)
    connection.commit()

def generate_borrowers(n):
    borrowers_data = []
    for i in range(n):
        first_name = fake.first_name()
        last_name = fake.last_name()
        email = fake.email()
        date_of_birth = fake.date_of_birth(minimum_age=18, maximum_age=80)
        membership_date = fake.date_between(start_date='-5y', end_date='today')
        borrowers_data.append((first_name, last_name, email, date_of_birth, membership_date))
    return borrowers_data

def insert_borrowers(borrowers_data):
    for borrower in borrowers_data:
        cursor.execute('''
            INSERT INTO Borrowers (FirstName, LastName, Email, DateOfBirth, MembershipDate)
            VALUES (?, ?, ?, ?, ?)
        ''', borrower)
    connection.commit()

def generate_loans(n, num_books, num_borrowers):
    loans_data = []
    for i in range(n):
        book_id = random.randint(1, num_books)
        borrower_id = random.randint(1, num_borrowers)
        date_borrowed = fake.date_between(start_date='-2y', end_date='today')
        due_date = date_borrowed + timedelta(days=14)
        if random.choice([True, False]):
            date_returned = fake.date_between(start_date=date_borrowed, end_date='today')
        else:
            date_returned = None
        loans_data.append((book_id, borrower_id, date_borrowed, due_date, date_returned))
    return loans_data

def insert_loans(loans_data):
    for loan in loans_data:
        cursor.execute('''
            INSERT INTO Loans (BookID, BorrowerID, DateBorrowed, DueDate, DateReturned)
            VALUES (?, ?, ?, ?, ?)
        ''', loan)
    connection.commit()

num_books = 1000
num_borrowers = 1000
num_loans = 1000

books_data = generate_books(num_books)
borrowers_data = generate_borrowers(num_borrowers)
loans_data = generate_loans(num_loans, num_books, num_borrowers)

insert_books(books_data)
insert_borrowers(borrowers_data)
insert_loans(loans_data)

connection.close()

print(f"{num_books} books, {num_borrowers} borrowers, and {num_loans} loans have been added to the database.")
