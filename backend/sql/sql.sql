-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 26 2021 г., 04:37
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sql`
--

-- --------------------------------------------------------

--
-- Структура таблицы `course`
--

CREATE TABLE `course` (
  `course_id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `course`
--

INSERT INTO `course` (`course_id`, `name`, `description`) VALUES
(1, 'HTML', 'Курс по HTML'),
(2, 'CSS', 'Курс по CSS'),
(3, 'JS', 'Курс по JS'),
(4, 'PHP', 'Курс по PHP'),
(5, 'SQL', 'Курс по SQL');

-- --------------------------------------------------------

--
-- Структура таблицы `history`
--

CREATE TABLE `history` (
  `history_id` int UNSIGNED NOT NULL,
  `trainee_id` int UNSIGNED NOT NULL,
  `course_id` int UNSIGNED NOT NULL,
  `start` int NOT NULL,
  `end` int NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `history`
--

INSERT INTO `history` (`history_id`, `trainee_id`, `course_id`, `start`, `end`, `status`) VALUES
(1, 1, 1, 20210901, 20210905, 1),
(2, 1, 2, 20210906, 20210915, 1),
(3, 1, 3, 20210915, 20210925, 1),
(4, 1, 4, 20210925, 20210930, 1),
(5, 1, 5, 20211008, 20211208, 0),
(6, 2, 1, 20210903, 20210905, 0),
(7, 2, 2, 20210905, 20210912, 0),
(8, 2, 3, 20210912, 20210922, 1),
(9, 2, 4, 20210922, 20211007, 1),
(10, 2, 5, 20211007, 20211020, 1),
(11, 3, 1, 20210925, 20210930, 1),
(12, 3, 2, 20211001, 20211010, 1),
(13, 3, 3, 20211010, 20211020, 1),
(14, 3, 4, 20211020, 20211025, 1),
(15, 3, 5, 20211025, 20211026, 1),
(16, 4, 1, 20211001, 20211005, 0),
(17, 4, 2, 20211005, 20211011, 0),
(18, 4, 3, 20211011, 20211015, 0),
(19, 4, 4, 20211015, 20211018, 0),
(20, 4, 5, 20211018, 20211021, 0),
(21, 5, 1, 20210101, 20210105, 1),
(22, 5, 2, 20210105, 20210110, 1),
(23, 5, 3, 20210110, 20210115, 1),
(24, 5, 4, 20210115, 20210120, 1),
(25, 5, 5, 20210120, 20210125, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `trainee`
--

CREATE TABLE `trainee` (
  `trainee_id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `trainee`
--

INSERT INTO `trainee` (`trainee_id`, `name`, `email`) VALUES
(1, 'Губка Боб Квадратные Штаны', '1@1.ru'),
(2, 'Патрик Стар', '2@2.ru'),
(3, 'Сквидвард Тентикалс', '3@3.ru'),
(4, 'Мистер Юджин Крабс', '4@4.ru'),
(5, 'Планктон', '5@5.ru');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Индексы таблицы `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `trainee_id` (`trainee_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Индексы таблицы `trainee`
--
ALTER TABLE `trainee`
  ADD PRIMARY KEY (`trainee_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `trainee`
--
ALTER TABLE `trainee`
  MODIFY `trainee_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`trainee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
