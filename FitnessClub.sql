-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 16 2024 г., 13:30
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `FitnessClub`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Applications`
--

CREATE TABLE `Applications` (
  `id` int NOT NULL,
  `vacancyTitle` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `resume` text NOT NULL,
  `uploaded_file_id` int DEFAULT NULL,
  `applicationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `favorite` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Applications`
--

INSERT INTO `Applications` (`id`, `vacancyTitle`, `fullName`, `email`, `phone`, `resume`, `uploaded_file_id`, `applicationDate`, `favorite`) VALUES
(104, 'fitness_trainer', 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', 'Тренер по фитнесу', NULL, '2024-05-06 15:51:31', 0),
(105, 'fitness_trainer', 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', '', NULL, '2024-05-07 12:43:49', 0),
(107, 'fitness_trainer', 'Андрей Сергеевич Михайлов', 'pasha.korchagin.03@mail.ru', '+79228765432', '', NULL, '2024-05-09 13:48:14', 0),
(108, 'fitness_trainer', 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', 'АВ', NULL, '2024-05-09 14:00:47', 0),
(109, 'fitness_trainer', 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', 'АВ', NULL, '2024-05-09 14:01:21', 0),
(110, 'aqua_aerobics_instructor', 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', 'в', NULL, '2024-05-09 14:05:06', 0),
(111, 'aqua_aerobics_instructor', 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', 'в', NULL, '2024-05-09 14:18:39', 0),
(112, 'fitness_trainer', 'Андрей Сергеевич Михайлов', 'pasha.korchagin.03@mail.ru', '+79228765432', 'dd', NULL, '2024-05-09 14:26:49', 1),
(113, 'Trainer', 'Иван Иванович Иванов', 'pasha.korchagin.03@mail.ru', '+79561343223', 'вк', NULL, '2024-05-10 11:11:13', 0),
(114, 'fitness_trainer', 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', 'ВК ТАМ И ТД', NULL, '2024-05-16 09:50:17', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `AquaAerobicsInstructors`
--

CREATE TABLE `AquaAerobicsInstructors` (
  `id` int NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `hireDate` date NOT NULL,
  `specialization` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `AquaAerobicsInstructors`
--

INSERT INTO `AquaAerobicsInstructors` (`id`, `fullName`, `email`, `phone`, `hireDate`, `specialization`) VALUES
(110, 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', '2024-05-09', 'Аквааэробика'),
(111, 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', '2024-05-09', 'Аквааэробика');

-- --------------------------------------------------------

--
-- Структура таблицы `MassageTherapists`
--

CREATE TABLE `MassageTherapists` (
  `id` int NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `hireDate` date NOT NULL,
  `specialization` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `PersonalTrainers`
--

CREATE TABLE `PersonalTrainers` (
  `id` int NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `hireDate` date NOT NULL,
  `specialization` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Trainers`
--

CREATE TABLE `Trainers` (
  `id` int NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `hireDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Trainers`
--

INSERT INTO `Trainers` (`id`, `fullName`, `email`, `phone`, `specialization`, `hireDate`) VALUES
(104, 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', 'Кардио тренировки', '2024-05-06'),
(105, 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', 'Силовые тренировки', '2024-05-07'),
(107, 'Андрей Сергеевич Михайлов', 'pasha.korchagin.03@mail.ru', '+79228765432', 'Силовые тренировки', '2024-05-09'),
(108, 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', 'Силовые тренировки', '2024-05-09'),
(109, 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', 'Силовые тренировки', '2024-05-09'),
(112, 'Андрей Сергеевич Михайлов', 'pasha.korchagin.03@mail.ru', '+79228765432', 'Силовые тренировки', '2024-05-09'),
(114, 'Мария Петровна Павлова', 'pasha.korchagin.03@mail.ru', '+79223334455', 'Групповые занятия', '2024-05-16');

-- --------------------------------------------------------

--
-- Структура таблицы `uploaded_files`
--

CREATE TABLE `uploaded_files` (
  `id` int NOT NULL,
  `application_id` int DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Applications`
--
ALTER TABLE `Applications`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `AquaAerobicsInstructors`
--
ALTER TABLE `AquaAerobicsInstructors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `MassageTherapists`
--
ALTER TABLE `MassageTherapists`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `PersonalTrainers`
--
ALTER TABLE `PersonalTrainers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Trainers`
--
ALTER TABLE `Trainers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Applications`
--
ALTER TABLE `Applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT для таблицы `AquaAerobicsInstructors`
--
ALTER TABLE `AquaAerobicsInstructors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT для таблицы `MassageTherapists`
--
ALTER TABLE `MassageTherapists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `PersonalTrainers`
--
ALTER TABLE `PersonalTrainers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `Trainers`
--
ALTER TABLE `Trainers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT для таблицы `uploaded_files`
--
ALTER TABLE `uploaded_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `AquaAerobicsInstructors`
--
ALTER TABLE `AquaAerobicsInstructors`
  ADD CONSTRAINT `fk_aqua_aerobics_instructor_application` FOREIGN KEY (`id`) REFERENCES `Applications` (`id`);

--
-- Ограничения внешнего ключа таблицы `MassageTherapists`
--
ALTER TABLE `MassageTherapists`
  ADD CONSTRAINT `fk_massage_therapist_application` FOREIGN KEY (`id`) REFERENCES `Applications` (`id`);

--
-- Ограничения внешнего ключа таблицы `PersonalTrainers`
--
ALTER TABLE `PersonalTrainers`
  ADD CONSTRAINT `fk_personal_trainer_application` FOREIGN KEY (`id`) REFERENCES `Applications` (`id`);

--
-- Ограничения внешнего ключа таблицы `Trainers`
--
ALTER TABLE `Trainers`
  ADD CONSTRAINT `fk_trainer_application` FOREIGN KEY (`id`) REFERENCES `Applications` (`id`);

--
-- Ограничения внешнего ключа таблицы `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD CONSTRAINT `uploaded_files_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `Applications` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
