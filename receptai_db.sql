-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 25 2022 г., 17:00
-- Версия сервера: 5.7.36
-- Версия PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `receptai_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `indigrientas`
--

DROP TABLE IF EXISTS `indigrientas`;
CREATE TABLE IF NOT EXISTS `indigrientas` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pavadinimas` varchar(50) NOT NULL,
  `kaina` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `indigrientas`
--

INSERT INTO `indigrientas` (`id`, `pavadinimas`, `kaina`) VALUES
(1, 'morkos', '1.22'),
(2, 'Kiausiniai', '0.60'),
(3, 'Cesnakai', '0.25'),
(4, 'Grietine', '1.20'),
(5, 'Druska', '0.10'),
(6, 'Virtos Bulves', '0.98'),
(7, 'K.virti kiausiniai', '1.44'),
(8, 'Salieru stiebai', '0.18'),
(9, 'Ridikeliai', '1.40'),
(10, 'Svogunu laiskai', '0.45'),
(11, 'Majonezas', '1.44'),
(12, 'Pipirai', '0.12'),
(13, '300 g rūkytos, keptos ar virtos vištienos', '0.79'),
(14, 'Vienos guzines salotos', '0.88'),
(15, 'Helmans Majonezas', '0.58'),
(16, 'Granatus seklos apibarstymui', '1.02'),
(17, 'Vidutinio dydzio brokolis', '2.10'),
(18, 'Supjaustytos Morkos', '1.40'),
(19, 'DU kieti Obuoliai', '0.90'),
(20, '100g Dziovintu spanguoliu', '1.30'),
(21, '50g Graikisku riesutu', '0.80'),
(22, 'Jogurtas 200g', '1.20');

-- --------------------------------------------------------

--
-- Структура таблицы `receptai`
--

DROP TABLE IF EXISTS `receptai`;
CREATE TABLE IF NOT EXISTS `receptai` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pavadinimas` varchar(50) NOT NULL,
  `kaina` decimal(4,2) NOT NULL,
  `nurodymai` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `receptai`
--

INSERT INTO `receptai` (`id`, `pavadinimas`, `kaina`, `nurodymai`) VALUES
(1, 'Morku Salotos', '6.58', 'Pirmiausia nuskutame morkas bei sutarkuojame jas vidutine tarka.Tuomet kietai virtus kiaušinius taip pat sutriname vidutine tarka.Sudedame viską į salotų dubenį.Tada pridedame smulkiai supjaustytą česnaką.Įdedame grietinės ir viską išmaišome.Galiausiai įberiame druskos pagal savo skonį ir dar kartą viską išmaišome.Patiekiame ir skanaujame '),
(2, 'Pavasariška bulvių mišrainė', '6.56', 'Saliero stiebus ir ridikėlius supjaustykite griežinėliais. Viską dėkite į dubenį, sumaišykite su majonezu ir pagardinkite druska bei pipirais.\r\n\r\n\r\n '),
(3, 'Vištienos salotos su granatais', '4.98', 'Salotas sumaišykite tik prieš nešdami ant stalo, nes užpilas ilgainiui jas suminkština, ir salotos praranda traškumą.  Jeigu nenorite ar nevartojate majonezo, keiskite jį aliejumi su druska ir šlakeliu medaus. Citrinos nebereikės, nes granatai pakankamai rūgštūs. '),
(4, 'brokolių ir spanguolių salotų recepta', '8.34', ' Paprasčiausias salotų variantas – iš keturių ingredientų: brokolių, džiovintų spanguolių, mėlynojo svogūno ir majonezo. Brokolį ir svogūnus reikia supjaustyti, viską sumaišyti su majonezu.\r\n\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `receptu_ingredientai`
--

DROP TABLE IF EXISTS `receptu_ingredientai`;
CREATE TABLE IF NOT EXISTS `receptu_ingredientai` (
  `indigriento_id` smallint(5) UNSIGNED NOT NULL,
  `recepto_id` smallint(5) UNSIGNED NOT NULL,
  KEY `indigriento_id` (`indigriento_id`),
  KEY `recepto_id` (`recepto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `receptu_ingredientai`
--
ALTER TABLE `receptu_ingredientai`
  ADD CONSTRAINT `receptu_ingredientai_ibfk_1` FOREIGN KEY (`indigriento_id`) REFERENCES `indigrientas` (`id`),
  ADD CONSTRAINT `receptu_ingredientai_ibfk_2` FOREIGN KEY (`recepto_id`) REFERENCES `receptai` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
