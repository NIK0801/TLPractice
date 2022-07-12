--Insert Shops
INSERT INTO books.dbo.Shop
VALUES ('Хорошие книги', 'ул. Советская, 12'),
       ('Книга+', 'ул. Кирова, 145'),
	   ('Буквоед', 'ул.Пролетарская, 57'),
	   ('Лабиринт', 'ул. Волкова, 111');
-- Insert Houses
INSERT INTO books.dbo.PublishingHouse
VALUES ('АСТ', 'Деловой комплекс "Москва Сити", башня "Империя"'),
	   ('Эксмо', 'ул. Зорге, 1c1'),
	   ('Росмэн', 'ул. Октябрьская, 4к2');
--Insert Books
INSERT INTO books.dbo.Book
VALUES ('Гарри Поттер', 'Дж.Роулинг', 1, 3, 600),
       ('Острые края', 'Джо Аберкромби', 4, 2, 435),
	   ('Ведьмак', 'А. Сапковский', 3, 2, 678),
	   ('Повесть о двух городах', 'Ч.Диккенс', 2, 2, 586),
	   ('Мрачный Жнец', 'Т.Пратчетт', 2, 3, 342),
	   ('Амстердам', 'И. Макьюэн', 1, 1, 254),
	   ('Столпы земли', 'К. Фоллет', 3, 2, 765),
	   ('Происхождение', 'Д. Браун', 1, 3, 654);
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
UPDATE books.dbo.Book -- Книга с UUID = 2 вышла под другим издательством 
SET PublishingHouseId = 3
WHERE UUID = 2;

--Delete book 
DELETE -- Книга с UUID = 3 не издается
FROM books.dbo.Book
WHERE UUID = 3;

-- Task 2. GROUP BY + aggregation func
SELECT books.dbo.Book.BookName, COUNT(books.dbo.Book.BookName) AS Amount -- Получаем кол-во книг в магазине с UUID = 1
FROM books.dbo.Book WHERE ShopId = 1
GROUP BY books.dbo.Book.BookName;

-- Task 3. GROUP BY + having
SELECT * -- Получаем многоэтажки
FROM books.dbo.Book WHERE ShopId = 1
GROUP BY books.dbo.Book.UUID, books.dbo.Book.BookName, books.dbo.Book.Author, books.dbo.Book.PublishingHouseId,books.dbo.Book.ShopId, books.dbo.Book.NumberOfPages
HAVING MAX(books.dbo.Book.NumberOfPages) >= 500;

-- Task 4. JOIN tables
SELECT books.dbo.Book.BookName,
       books.dbo.Shop.ShopName,
	   books.dbo.PublishingHouse.PublishingHouseName
FROM books.dbo.Book -- Имя и Фамилия + Номер квартиры + Номер дома + Улица + Город + Страна
         JOIN books.dbo.Shop ON books.dbo.Book.ShopId = books.dbo.Shop.UUID
         JOIN books.dbo.PublishingHouse ON books.dbo.Book.PublishingHouseId = books.dbo.PublishingHouse.UUID