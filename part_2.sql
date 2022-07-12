--Insert Shops
INSERT INTO books.dbo.Shop
VALUES ('������� �����', '��. ���������, 12'),
       ('�����+', '��. ������, 145'),
	   ('�������', '��.������������, 57'),
	   ('��������', '��. �������, 111');
-- Insert Houses
INSERT INTO books.dbo.PublishingHouse
VALUES ('���', '������� �������� "������ ����", ����� "�������"'),
	   ('�����', '��. �����, 1c1'),
	   ('������', '��. �����������, 4�2');
--Insert Books
INSERT INTO books.dbo.Book
VALUES ('����� ������', '��.�������', 1, 3, 600),
       ('������ ����', '��� ����������', 4, 2, 435),
	   ('�������', '�. ����������', 3, 2, 678),
	   ('������� � ���� �������', '�.�������', 2, 2, 586),
	   ('������� ����', '�.��������', 2, 3, 342),
	   ('���������', '�. �������', 1, 1, 254),
	   ('������ �����', '�. ������', 3, 2, 765),
	   ('�������������', '�. �����', 1, 3, 654);
TRUNCATE TABLE books.dbo.Book; 
--Select Shops
SELECT *
FROM books.dbo.Shop;

--Select PublishingHouses
SELECT *
FROM books.dbo.PublishingHouse;

--Select Book
SELECT *
FROM books.dbo.Book;

--Update Book
UPDATE books.dbo.Book -- ����� � UUID = 2 ����� ��� ������ ������������� 
SET PublishingHouseId = 3
WHERE UUID = 2;

--Delete book 
DELETE -- ����� � UUID = 3 �� ��������
FROM books.dbo.Book
WHERE UUID = 3;

-- Task 2. GROUP BY + aggregation func
SELECT books.dbo.Book.BookName, COUNT(books.dbo.Book.BookName) AS Amount -- �������� ���-�� ���� � �������� � UUID = 1
FROM books.dbo.Book WHERE ShopId = 1
GROUP BY books.dbo.Book.BookName;

-- Task 3. GROUP BY + having
SELECT * -- �������� �����������
FROM books.dbo.Book WHERE ShopId = 1
GROUP BY books.dbo.Book.UUID, books.dbo.Book.BookName, books.dbo.Book.Author, books.dbo.Book.PublishingHouseId,books.dbo.Book.ShopId, books.dbo.Book.NumberOfPages
HAVING MAX(books.dbo.Book.NumberOfPages) >= 500;

-- Task 4. JOIN tables
SELECT books.dbo.Book.BookName,
       books.dbo.Shop.ShopName,
	   books.dbo.PublishingHouse.PublishingHouseName
FROM books.dbo.Book -- ��� � ������� + ����� �������� + ����� ���� + ����� + ����� + ������
         JOIN books.dbo.Shop ON books.dbo.Book.ShopId = books.dbo.Shop.UUID
         JOIN books.dbo.PublishingHouse ON books.dbo.Book.PublishingHouseId = books.dbo.PublishingHouse.UUID