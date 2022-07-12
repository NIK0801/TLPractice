--Insert Shops
INSERT INTO books.dbo.Shop
VALUES (N'Хорошие книги', N'ул. Советская, 12'),
       (N'Книга+', N'ул. Кирова, 145'),
	   (N'Буквоед', N'ул.Пролетарская, 57'),
	   (N'Лабиринт', N'ул. Волкова, 111');
-- Insert Houses
INSERT INTO books.dbo.PublishingHouse
VALUES (N'АСТ', N'Деловой комплекс "Москва Сити", башня "Империя"'),
	   (N'Эксмо', N'ул. Зорге, 1c1'),
	   (N'Росмэн', N'ул. Октябрьская, 4к2');
--Insert Books
INSERT INTO books.dbo.Book
VALUES (N'Гарри Поттер', N'Дж.Роулинг', 1, 3, 600),
       (N'Острые края', N'Джо Аберкромби', 4, 2, 435),
	   (N'Ведьмак', N'А. Сапковский', 3, 2, 678),
	   (N'Повесть о двух городах', N'Ч.Диккенс', 2, 2, 586),
	   (N'Мрачный Жнец', N'Т.Пратчетт', 2, 3, 342),
	   (N'Амстердам', N'И. Макьюэн', 1, 1, 254),
	   (N'Столпы земли', N'К. Фоллет', 3, 2, 765),
	   (N'Происхождение', N'Д. Браун', 1, 3, 654);
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
SELECT * -- Получаем книги с количеством страниц больше 500
FROM books.dbo.Book WHERE ShopId = 1
GROUP BY books.dbo.Book.UUID, books.dbo.Book.BookName, books.dbo.Book.Author, books.dbo.Book.PublishingHouseId,books.dbo.Book.ShopId, books.dbo.Book.NumberOfPages
HAVING MAX(books.dbo.Book.NumberOfPages) >= 500;

-- Task 4. JOIN tables
SELECT books.dbo.Book.BookName,
       books.dbo.Shop.ShopName,
	   books.dbo.PublishingHouse.PublishingHouseName
FROM books.dbo.Book -- Название книги + Магазин + Издааельство
         JOIN books.dbo.Shop ON books.dbo.Book.ShopId = books.dbo.Shop.UUID
         JOIN books.dbo.PublishingHouse ON books.dbo.Book.PublishingHouseId = books.dbo.PublishingHouse.UUID
