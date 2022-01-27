-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 22 2021 г., 00:02
-- Версия сервера: 5.7.33
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `library`
--
CREATE DATABASE IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `library`;

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `id_author` int(10) NOT NULL,
  `full_name` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `life_years` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`id_author`, `full_name`, `country`, `life_years`) VALUES
(1, 'Достоевский Фёдор Михайлович', 'Россия', '1821-1881'),
(2, 'Джейн Остин', 'Великобритания', '1775-1817'),
(3, 'Олкотт Луиза Мэй', 'США', '1832-1888'),
(4, 'Чехов Антон Павлович', 'Россия', '1860-1904'),
(5, 'Бунин Иван Алексеевич', 'Россия', '1870-1953'),
(6, 'Джером Дэвид Сэлинджер', 'США', '1919-2010'),
(7, 'Теренс Дэвид Джон Пратчетт', 'Великобритания', '1948-2015'),
(8, 'Артур Конан Дойл', 'Великобритания', '1859-1930'),
(9, 'Маргарет Митчелл', 'США', '1900-1949'),
(10, 'Антуан де Сент-Экзюпери', 'Франция', '1900-1944'),
(11, 'Рэй Дуглас Брэдбери', 'США', '1920-2012'),
(12, 'Эрнест Миллер Хемингуэй', 'США', '1899-1961'),
(13, 'Джордж Оруэлл', 'Великобритания', '1903-1950'),
(14, 'Надежда Александровна Бучинская', 'Россия', '1872-1952'),
(15, 'Мигель Де Сервантес Сааведра', 'Испания', '1547-1616'),
(16, 'Поль Мари Верлен', 'Франция', '1844-1896'),
(17, 'Иоганн Вольфганг фон Гёте', 'Германия', '1749-1832'),
(18, 'Корнелия Функе', 'Германия', '1958-?');

-- --------------------------------------------------------

--
-- Структура таблицы `compositions`
--

CREATE TABLE `compositions` (
  `id_composition` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `volume_count` int(10) NOT NULL DEFAULT '1',
  `id_genre` int(10) NOT NULL,
  `id_author` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `compositions`
--

INSERT INTO `compositions` (`id_composition`, `name`, `volume_count`, `id_genre`, `id_author`) VALUES
(1, 'Маленькие женщины', 1, 4, 3),
(2, 'Гордость и предубеждение', 1, 2, 2),
(3, 'Темные аллеи', 1, 1, 5),
(4, 'Приключения Шерлока Холмса', 1, 5, 8),
(5, 'Галантные празднества', 1, 9, 16),
(6, 'Унесенные ветром', 1, 2, 9),
(7, 'Над пропастью во ржи', 1, 2, 6),
(8, 'Маленький принц', 1, 4, 10),
(9, '1984', 1, 6, 13),
(10, 'Платье цвета полуночи', 1, 2, 7),
(11, '451 градус по Фаренгейту', 1, 8, 11),
(12, 'Сборник стихотворений', 1, 9, 14),
(13, 'Хитроумный идальго Дон Кихот Ламанчский', 2, 2, 15),
(14, 'Полное собрание романов в двух томах', 2, 2, 1),
(15, 'Скотный двор', 1, 6, 13),
(16, 'Старик и море', 1, 7, 12),
(17, 'Идиот', 1, 2, 1),
(18, 'Фауст', 1, 10, 17),
(19, 'Чернильное сердце', 1, 2, 18),
(20, 'Полное собрание сочинений', 2, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `copies`
--

CREATE TABLE `copies` (
  `id_copy` int(10) NOT NULL,
  `id_composition` int(10) NOT NULL,
  `copy_count` int(10) NOT NULL,
  `publisher` int(10) NOT NULL,
  `publish_year` year(4) NOT NULL,
  `id_storage` int(10) NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `copies`
--

INSERT INTO `copies` (`id_copy`, `id_composition`, `copy_count`, `publisher`, `publish_year`, `id_storage`, `price`) VALUES
(1, 3, 35, 2, 2015, 2, 238),
(2, 9, 110, 2, 2017, 8, 495),
(3, 4, 50, 4, 2017, 2, 592),
(4, 1, 240, 1, 2019, 9, 550),
(5, 3, 140, 3, 2018, 1, 570),
(6, 9, 121, 1, 2021, 4, 458),
(7, 2, 102, 3, 2018, 7, 620),
(8, 10, 98, 1, 2017, 9, 616),
(9, 14, 130, 5, 2019, 10, 987),
(10, 16, 56, 7, 2014, 3, 257),
(11, 19, 210, 6, 2018, 5, 680),
(12, 14, 101, 5, 2019, 6, 987),
(13, 19, 145, 8, 2017, 5, 598),
(14, 7, 56, 1, 2020, 10, 516),
(15, 17, 180, 10, 2017, 1, 376),
(16, 11, 243, 1, 2021, 5, 347),
(17, 13, 250, 10, 2021, 4, 926),
(18, 7, 20, 1, 2018, 3, 266),
(19, 13, 250, 10, 2021, 8, 926),
(20, 6, 125, 9, 2020, 7, 694);

-- --------------------------------------------------------

--
-- Структура таблицы `e_books`
--

CREATE TABLE `e_books` (
  `id_e_book` int(10) NOT NULL,
  `id_composition` int(10) NOT NULL,
  `num_volume` int(10) NOT NULL DEFAULT '1',
  `last_update` date NOT NULL,
  `pages` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `e_books`
--

INSERT INTO `e_books` (`id_e_book`, `id_composition`, `num_volume`, `last_update`, `pages`) VALUES
(1, 3, 1, '2021-07-30', 325),
(2, 4, 1, '2021-09-30', 416),
(3, 2, 1, '2021-03-17', 544),
(4, 10, 1, '2020-09-27', 480),
(5, 1, 1, '2020-09-04', 340),
(6, 9, 1, '2021-11-02', 320),
(7, 5, 1, '2020-12-26', 256),
(8, 4, 1, '2021-11-17', 608),
(9, 14, 1, '2020-04-05', 1279),
(10, 14, 2, '2021-04-08', 1279),
(11, 16, 1, '2021-10-22', 460),
(12, 7, 1, '2021-11-01', 320),
(13, 13, 1, '2019-05-23', 1120),
(14, 13, 2, '2020-03-12', 1120),
(15, 6, 1, '2019-03-10', 351),
(16, 17, 1, '2019-01-12', 736),
(17, 11, 1, '2021-10-22', 320),
(18, 12, 1, '2019-03-10', 528),
(19, 16, 1, '2019-01-27', 544),
(20, 8, 1, '2020-03-12', 96);

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

CREATE TABLE `genres` (
  `id_genre` int(10) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `genres`
--

INSERT INTO `genres` (`id_genre`, `name`, `property`) VALUES
(1, 'Рассказы', 'Повествовательное произведение небольшого объёма с малым количеством героев и кратковременностью изображаемых событий'),
(2, 'Роман', 'Художественное произведение большого объема, в котором развернуто повествуется о событиях в жизни главных действующих лиц и их судьбах'),
(3, 'Фэнтези', 'Фэнтези основывается на использовании мифологических и сказочных мотивов в современном виде'),
(4, 'Детская литература', 'Вид литературы, специально предназначенная для детей до 16 лет и осуществляющая языком художественных образов задачи воспитания и образования детей'),
(5, 'Детектив', 'Произведения в жанре детектива описывают, как заинтересованные люди с помощью «ума и сообразительности» расследуют загадочные происшествия, надеясь выяснить все обстоятельства и найти виновных'),
(6, 'Антиутопия', 'Изображение общественного строя или сообщества, представляющегося автору или критику нежелательным, отталкивающим или пугающим'),
(7, 'Повесть', 'Эпический прозаический жанр, который не имеет устойчивого объёма (занимает промежуточное место между романом и рассказом) и тяготеет к изображению событий в хронологической последовательности'),
(8, 'Научная фантастика', 'Описывает вымышленные технологии и научные открытия, контакты с нечеловеческим разумом, возможное будущее или альтернативный ход истории[3], а также влияние этих допущений на человеческое общество и личность'),
(9, 'Поэзия', 'Стихи, ритмическая речь'),
(10, 'Трагедия', 'Жанр художественного произведения, предназначенный для постановки на сцене, в котором сюжет приводит персонажей к катастрофическому исходу');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id_order` int(10) NOT NULL,
  `id_reader` int(10) NOT NULL,
  `adress` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id_order`, `id_reader`, `adress`) VALUES
(1, 9, 'Рязанская область, город Истра, наб. Ладыгина, 11'),
(2, 12, 'Новгородская область, город Лотошино, наб. Гоголя, 35'),
(3, 15, 'Рязанская область, город Шаховская, пер. Гоголя, 04'),
(4, 11, 'Омская область, город Солнечногорск, пл. Будапештсткая, 49'),
(5, 17, 'Кировская область, город Серпухов, ул. Балканская, 66'),
(6, 5, 'Рязанская область, город Истра, наб. Ладыгина, 11'),
(7, 2, 'Астраханская область, город Ногинск, пр. Чехова, 66'),
(8, 11, 'Омская область, город Солнечногорск, пл. Будапештсткая, 49'),
(9, 18, 'Калужская область, город Луховицы, бульвар Сталина, 98'),
(10, 4, 'Ростовская область, город Истра, пл. Косиора, 26'),
(11, 1, 'Тюменская область, город Можайск, спуск Домодедовская, 65'),
(12, 8, 'Рязанская область, город Истра, наб. Ладыгина, 11'),
(13, 19, 'Сахалинская область, город Видное, спуск Гагарина, 23'),
(14, 13, 'Ульяновская область, город Зарайск, проезд Будапештсткая, 31'),
(15, 3, 'Тверская область, город Талдом, пер. Сталина, 37'),
(16, 14, 'Иркутская область, город Щёлково, проезд Гагарина, 77'),
(17, 10, 'Рязанская область, город Истра, наб. Ладыгина, 11'),
(18, 6, 'Свердловская область, город Раменское, ул. Домодедовская, 70'),
(19, 16, 'Калужская область, город Раменское, въезд Ладыгина, 49'),
(20, 7, 'Волгоградская область, город Сергиев Посад, проезд 1905 года, 76');

-- --------------------------------------------------------

--
-- Структура таблицы `publishers`
--

CREATE TABLE `publishers` (
  `id_publisher` int(10) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `publishers`
--

INSERT INTO `publishers` (`id_publisher`, `name`, `address`) VALUES
(1, 'Эксмо', 'г. Москва, ул. Зорге, д. 1 стр. 1 этаж 20 каб'),
(2, 'АСТ', 'г. Москва, Пресненская наб., д.6, стр.2, БЦ «Империя»'),
(3, 'Речь', 'г. Санкт-Петербург, 11-я линия Васильевского о-ва, 26'),
(4, 'Издательский дом Мещерякова', 'г Москва, ул. Садовая-Триумфальная, д.4-10'),
(5, 'Альфа-книга', 'г. Москва, Бумажный проезд, д. 14'),
(6, 'Махаон', 'г. Москва ул. Беломорская, 26, стр.2'),
(7, 'Астрель', 'г. Москва, ул. Клары Цеткин, 18, корп. 3, ком. 19'),
(8, 'Росмэн', 'г. Москва, ул. Шоссейная, 47'),
(9, 'Т8', 'г. Москва, проспект Волгоградский, дом 42, корпус 5'),
(10, 'Время', 'г. Москва, ул Большая Тульская, д. 13');

-- --------------------------------------------------------

--
-- Структура таблицы `readers`
--

CREATE TABLE `readers` (
  `id_reader` int(10) NOT NULL,
  `full_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grants` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `readers`
--

INSERT INTO `readers` (`id_reader`, `full_name`, `email`, `password`, `grants`) VALUES
(1, 'Трофимов Кирилл Дмитриевич', 'maggio.jacinthe@gmail.com', 'user1', 'user'),
(2, 'Ермакова София Николаевна', 'osmitham@yahoo.com', 'user2', 'user'),
(3, 'Тарасов Александр Германович', 'otowne@keeling.com', 'user3', 'user'),
(4, 'Толкачева Василиса Александровна', 'damore.glenna@hotmail.com', 'user4', 'user'),
(5, 'Кузнецова Дарья Егоровна', 'meredith33@hotmail.com', 'user5', 'user'),
(6, 'Орлов Кирилл Дмитриевич', 'waelchi.emmett@yahoo.com', 'user6', 'user'),
(7, 'Чернышев Максим Серафимович', 'rkutch@gmail.com', 'user7', 'user'),
(8, 'Высоцкая Мадина Дмитриевна', 'epaucek@gmail.com', 'user8', 'user'),
(9, 'Маркелов Егор Борисович', 'kris.rippin@hotmail.com', 'user9', 'user'),
(10, 'Федотов Александр Иванович', 'lonzo28@yahoo.com', 'user10', 'user'),
(11, 'Казаков Матвей Никитич', 'shania.sawayn@gmail.com', 'user11', 'user'),
(12, 'Кудрявцев Тихон Арсентьевич', 'nelson19@hotmail.com', 'user12', 'user'),
(13, 'Симонова Дарья Арсентьевна', 'reilly.vernon@yahoo.com', 'user13', 'user'),
(14, 'Потапов Артём Лукич', 'angel.franecki@yahoo.com', 'user14', 'user'),
(15, 'Климова Софья Святославовна', 'mvonrueden@gmail.com', 'user15', 'user'),
(16, 'Мельникова Александра Егоровна', 'charlene.schoen@gmail.com', 'user16', 'user'),
(17, 'Алехина Дарья Мироновна', 'collins.abi@yahoo.com', 'user17', 'user'),
(18, 'Калмыков Алексей Даниилович', 'tanner57@gmail.com', 'user18', 'user'),
(19, 'guest', 'guest@guest.com', 'guest', 'user'),
(20, 'admin', 'admin@admin.com', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `sold_copies`
--

CREATE TABLE `sold_copies` (
  `id_copy` int(10) NOT NULL,
  `id_order` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sold_copies`
--

INSERT INTO `sold_copies` (`id_copy`, `id_order`) VALUES
(7, 2),
(8, 13),
(9, 18),
(3, 6),
(4, 14),
(13, 15),
(1, 7),
(19, 20),
(14, 17),
(5, 8),
(2, 3),
(12, 11),
(6, 9),
(10, 16),
(20, 19),
(16, 10),
(17, 12),
(18, 1),
(15, 4),
(11, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `storages`
--

CREATE TABLE `storages` (
  `id_storage` int(10) NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `storages`
--

INSERT INTO `storages` (`id_storage`, `address`, `phone`) VALUES
(1, 'Тульская область, г. Одинцово, наб. Чехова, 18', '(495) 272-2985'),
(2, 'Рязанская область, г. Истра, наб. Ладыгина, 11', '(495) 225-0301'),
(3, 'Самарская область, с. Пушкино, проезд Славы, 24', '(495) 856-8588'),
(4, 'Сахалинская область, г. Луховицы, въезд Славы, 54', '(495) 131-8545'),
(5, 'Тамбовская область, г. Можайск, пл. Гоголя, 05', '(495) 908-8507'),
(6, 'Брянская область, г. Мытищи, пр. Ленина, 67', '(495) 913-6220'),
(7, 'Кемеровская область, с. Шаховское, ул. Ладыгина, 5', '(812) 670-27-56'),
(8, 'Курганская область, г. Клин, пр. Домодедовская, 74', '(812) 923-01-53'),
(9, 'Тульская область, г. Одинцово, пл. Ломоносова, 15', '(812) 340-91-19'),
(10, 'Рязанская область, г. Ногинск, шоссе Сталина, 44', '(812) 866-60-41');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id_author`);

--
-- Индексы таблицы `compositions`
--
ALTER TABLE `compositions`
  ADD PRIMARY KEY (`id_composition`),
  ADD KEY `compositions_fk0` (`id_genre`),
  ADD KEY `compositions_fk1` (`id_author`);

--
-- Индексы таблицы `copies`
--
ALTER TABLE `copies`
  ADD PRIMARY KEY (`id_copy`),
  ADD KEY `copies_of_book_fk0` (`id_composition`),
  ADD KEY `copies_of_book_fk1` (`publisher`),
  ADD KEY `copies_of_book_fk2` (`id_storage`);

--
-- Индексы таблицы `e_books`
--
ALTER TABLE `e_books`
  ADD PRIMARY KEY (`id_e_book`),
  ADD KEY `e_books_fk0` (`id_composition`);

--
-- Индексы таблицы `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id_genre`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `orders_fk0` (`id_reader`);

--
-- Индексы таблицы `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id_publisher`);

--
-- Индексы таблицы `readers`
--
ALTER TABLE `readers`
  ADD PRIMARY KEY (`id_reader`);

--
-- Индексы таблицы `sold_copies`
--
ALTER TABLE `sold_copies`
  ADD KEY `sold_copies_fk0` (`id_copy`),
  ADD KEY `sold_copies_fk1` (`id_order`);

--
-- Индексы таблицы `storages`
--
ALTER TABLE `storages`
  ADD PRIMARY KEY (`id_storage`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `id_author` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `compositions`
--
ALTER TABLE `compositions`
  MODIFY `id_composition` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `copies`
--
ALTER TABLE `copies`
  MODIFY `id_copy` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `e_books`
--
ALTER TABLE `e_books`
  MODIFY `id_e_book` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `genres`
--
ALTER TABLE `genres`
  MODIFY `id_genre` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id_publisher` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `readers`
--
ALTER TABLE `readers`
  MODIFY `id_reader` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `storages`
--
ALTER TABLE `storages`
  MODIFY `id_storage` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `compositions`
--
ALTER TABLE `compositions`
  ADD CONSTRAINT `compositions_fk0` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id_genre`),
  ADD CONSTRAINT `compositions_fk1` FOREIGN KEY (`id_author`) REFERENCES `authors` (`id_author`);

--
-- Ограничения внешнего ключа таблицы `copies`
--
ALTER TABLE `copies`
  ADD CONSTRAINT `copies_of_book_fk0` FOREIGN KEY (`id_composition`) REFERENCES `compositions` (`id_composition`),
  ADD CONSTRAINT `copies_of_book_fk1` FOREIGN KEY (`publisher`) REFERENCES `publishers` (`id_publisher`),
  ADD CONSTRAINT `copies_of_book_fk2` FOREIGN KEY (`id_storage`) REFERENCES `storages` (`id_storage`);

--
-- Ограничения внешнего ключа таблицы `e_books`
--
ALTER TABLE `e_books`
  ADD CONSTRAINT `e_books_fk0` FOREIGN KEY (`id_composition`) REFERENCES `compositions` (`id_composition`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`id_reader`) REFERENCES `readers` (`id_reader`);

--
-- Ограничения внешнего ключа таблицы `sold_copies`
--
ALTER TABLE `sold_copies`
  ADD CONSTRAINT `sold_copies_fk0` FOREIGN KEY (`id_copy`) REFERENCES `copies` (`id_copy`),
  ADD CONSTRAINT `sold_copies_fk1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
