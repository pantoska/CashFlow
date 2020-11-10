-- phpMyAdmin SQL Dump
-- version 5.0.0-alpha1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 26 Paz 2020, 14:36
-- Wersja serwera: 10.3.22-MariaDB-0+deb10u1
-- Wersja PHP: 7.3.18-1+0~20200515.59+debian10~1.gbp12fa4f

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cashflow`
--
DROP DATABASE IF EXISTS `cashflow`;
CREATE DATABASE IF NOT EXISTS `cashflow` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `cashflow`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_color` int(11) DEFAULT NULL,
  `is_income` tinyint(1) DEFAULT NULL,
  `id_def_subcategory` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `category`
--

INSERT INTO `category` (`id_category`, `name`, `id_user`, `id_color`, `is_income`, `id_def_subcategory`) VALUES
(1, 'Jedzenie i napoje', 2, 1, 0, 1),
(2, 'Dochody', 2, 12, 1, 2),
(13, 'Jedzenie i napoje', 1, 1, 0, 66),
(14, 'Opłaty', 1, 3, 0, 70),
(15, 'Zakupy', 1, 6, 0, 82),
(16, 'Pojazd', 1, 7, 0, 92),
(17, 'Życie i rozrywka', 1, 10, 0, 97),
(18, 'Dochody', 1, 12, 1, 110),
(19, 'Inne', 1, 16, 0, 118),
(20, 'Żółęćń', 2, 9, 0, 119),
(79, 'Jedzenie i napoje', 20, 1, 0, 555),
(80, 'Opłaty', 20, 1, 0, 559),
(81, 'Zakupy', 20, 1, 0, 571),
(82, 'Pojazd', 20, 1, 0, 581),
(83, 'Życie i rozrywka', 20, 1, 0, 586),
(84, 'Dochody', 20, 1, 1, 599),
(85, 'Inne', 20, 1, 0, 607),
(93, 'Jedzenie i napoje', 22, 1, 0, 664),
(94, 'Opłaty', 22, 3, 0, 668),
(95, 'Zakupy', 22, 6, 0, 680),
(96, 'Pojazd', 22, 7, 0, 690),
(97, 'Życie i rozrywka', 22, 10, 0, 695),
(98, 'Dochody', 22, 12, 1, 708),
(99, 'Inne', 22, 16, 0, 716),
(107, 'Jedzenie i napoje', 24, 1, 0, 770),
(108, 'Opłaty', 24, 3, 0, 774),
(109, 'Zakupy', 24, 6, 0, 786),
(110, 'Pojazd', 24, 7, 0, 796),
(111, 'Życie i rozrywka', 24, 2, 0, 801),
(112, 'Dochody', 24, 12, 1, 814),
(113, 'Inne', 24, 16, 0, 822),
(115, 'Jedzenie i napoje', 25, 1, 0, 825),
(116, 'Opłaty', 25, 3, 0, 829),
(117, 'Zakupy', 25, 6, 0, 841),
(118, 'Pojazd', 25, 7, 0, 851),
(119, 'Życie i rozrywka', 25, 10, 0, 856),
(120, 'Dochody', 25, 12, 1, 869),
(121, 'Inne', 25, 16, 0, 877),
(129, 'Jedzenie i napoje', 27, 1, 0, 931),
(130, 'Opłaty', 27, 3, 0, 935),
(131, 'Zakupy', 27, 6, 0, 947),
(132, 'Pojazd', 27, 7, 0, 957),
(133, 'Życie i rozrywka', 27, 10, 0, 962),
(134, 'Dochody', 27, 12, 1, 975),
(135, 'Inne', 27, 16, 0, 983),
(136, 'Jedzenie i napoje', 28, 1, 0, 984),
(137, 'Opłaty', 28, 3, 0, 988),
(138, 'Zakupy', 28, 6, 0, 1000),
(139, 'Pojazd', 28, 7, 0, 1010),
(140, 'Życie i rozrywka', 28, 10, 0, 1015),
(141, 'Dochody', 28, 12, 1, 1028),
(142, 'Inne', 28, 16, 0, 1036),
(551085, 'kuba1@fifi.commm', 2, 1, 1, 1197),
(551086, 'Rachunki', 2, 12, 0, 1200),
(551087, 'Loterie', 2, 15, 1, 1202),
(551137, 'Jedzenie i napoje', 50, 1, 0, 1574),
(551138, 'Opłaty', 50, 3, 0, 1578),
(551139, 'Zakupy', 50, 6, 0, 1590),
(551140, 'Pojazd', 50, 7, 0, 1600),
(551141, 'Życie i rozrywka', 50, 10, 0, 1605),
(551142, 'Dochody', 50, 12, 1, 1618),
(551143, 'Inne', 50, 16, 0, 1626),
(551167, 'Jedzenie i napoje', 54, 1, 0, 1790),
(551168, 'Opłaty', 54, 3, 0, 1794),
(551169, 'Zakupy', 54, 6, 0, 1806),
(551170, 'Pojazd', 54, 7, 0, 1816),
(551171, 'Życie i rozrywka', 54, 10, 0, 1821),
(551172, 'Dochody', 54, 12, 1, 1834),
(551173, 'Inne', 54, 16, 0, 1842);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `id_color` int(11) NOT NULL,
  `color` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `color`
--

INSERT INTO `color` (`id_color`, `color`) VALUES
(1, '#ff6969'),
(2, '#ff6998'),
(3, '#ff69d7'),
(4, '#e969ff'),
(5, '#cd69ff'),
(6, '#9669ff'),
(7, '#6c69ff'),
(8, '#6996ff'),
(9, '#69cdff'),
(10, '#69feff'),
(11, '#69ff91'),
(12, '#94ff69'),
(13, '#cbff69'),
(14, '#f5ff69'),
(15, '#ffee69'),
(16, '#ffcb69');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `expense`
--

DROP TABLE IF EXISTS `expense`;
CREATE TABLE `expense` (
  `id_expense` int(11) NOT NULL,
  `id_m_acc` int(11) NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `note` text CHARACTER SET utf8 DEFAULT NULL,
  `id_subcategory` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0 - expense\n1 - income\n2 - transfer out\n3 - transfer in'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `expense`
--

INSERT INTO `expense` (`id_expense`, `id_m_acc`, `amount`, `date`, `note`, `id_subcategory`, `type`) VALUES
(1, 1, '-2.50', '2018-12-04 00:00:00', '', 1, 0),
(2, 1, '252.00', '2018-12-01 00:00:00', '', 2, 1),
(4, 1, '15.00', '2018-02-20 00:00:00', '', 1, 1),
(9, 1, '15.00', '2018-02-20 00:00:00', '', 1, 1),
(16, 1, '15.00', '2018-02-20 00:00:00', '', 1, 1),
(17, 1, '15.00', '2018-02-20 00:00:00', '', 1, 1),
(18, 1, '15.00', '2018-02-20 00:00:00', '', 1, 1),
(19, 1, '15.00', '2018-02-20 00:00:00', '', 1, 1),
(21, 1, '15.00', '2018-02-20 00:00:00', '', 1, 1),
(22, 1, '15.00', '2018-02-20 00:00:00', '', 1, 1),
(23, 1, '1.50', '2018-02-20 00:00:00', '', 1, 1),
(24, 1, '5.00', '2018-02-20 00:00:00', '', 1, 0),
(25, 1, '-7.23', '2018-02-20 00:00:00', '', 1, 0),
(26, 1, '-8.95', '2018-02-21 00:00:00', '', 1, 0),
(27, 1, '-5.00', '2018-02-20 00:00:00', '', 3, 0),
(28, 1, '-5.00', '2018-12-18 00:00:00', '', 3, 0),
(29, 1, '-1.50', '2018-12-19 00:00:00', '', 1, 0),
(30, 1, '-5.00', '2018-12-29 00:00:00', '', 4, 0),
(36, 1, '-5.00', '2019-01-05 00:00:00', '', 4, 0),
(37, 1, '-2.00', '2019-01-05 00:00:00', '', 4, 0),
(38, 1, '-5.00', '2019-01-05 00:00:00', '', 3, 0),
(39, 1, '-2.30', '2019-01-05 00:00:00', '', 3, 0),
(40, 1, '-1.25', '2019-01-05 00:00:00', '', 3, 0),
(41, 3, '-5.00', '2019-01-10 00:00:00', '', 1, 0),
(42, 3, '-2.00', '2019-01-10 00:00:00', '', 121, 0),
(43, 1, '-1.23', '2019-01-12 00:00:00', '', 1, 0),
(44, 1, '-2.52', '2019-01-12 16:36:00', '', 1, 0),
(50, 6, '-3.23', '2019-01-12 21:22:00', '', 119, 0),
(51, 1, '-3.23', '2019-01-12 21:23:00', '', 119, 0),
(52, 6, '5.00', '2019-01-13 10:03:00', '', NULL, 3),
(53, 1, '-5.00', '2019-01-13 10:03:00', '', NULL, 2),
(54, 6, '100.00', '2019-01-13 10:22:00', '', NULL, 3),
(55, 1, '-100.00', '2019-01-13 10:22:00', '', NULL, 2),
(56, 6, '10.00', '2019-01-13 10:41:00', '', NULL, 3),
(57, 1, '-10.00', '2019-01-13 10:41:00', '', NULL, 2),
(58, 6, '10.00', '2019-01-13 10:41:00', '', NULL, 3),
(59, 1, '-10.00', '2019-01-13 10:41:00', '', NULL, 2),
(60, 6, '10.00', '2019-01-13 10:43:00', '', NULL, 3),
(61, 1, '-10.00', '2019-01-13 10:43:00', '', NULL, 2),
(62, 1, '-5.00', '2019-01-13 15:51:00', '', 1, 0),
(63, 1, '-3.00', '2019-01-13 15:53:00', '', 1, 0),
(64, 1, '3.00', '2019-01-13 15:53:00', '', 2, 1),
(65, 1, '2.50', '2019-01-13 15:53:00', '', NULL, 3),
(66, 6, '-2.50', '2019-01-13 15:53:00', '', NULL, 2),
(67, 1, '-5.00', '2019-01-13 16:02:00', '', 1, 0),
(68, 1, '-3.00', '2019-01-13 16:03:00', '', 119, 0),
(69, 1, '-2.55', '2019-01-13 16:03:00', '', 4, 0),
(70, 1, '-2.65', '2019-01-13 16:03:00', '', 3, 0),
(71, 6, '-3.20', '2019-01-13 16:04:00', '', 610, 0),
(72, 1, '-6.86', '2019-01-13 16:04:00', '', 120, 0),
(73, 6, '120.00', '2019-01-13 16:04:00', '', 30, 1),
(74, 6, '50.00', '2019-01-13 16:05:00', '', NULL, 3),
(75, 1, '-50.00', '2019-01-13 16:05:00', '', NULL, 2),
(76, 6, '-1.25', '2019-01-13 16:05:00', '', 121, 0),
(77, 6, '50.00', '2019-01-13 16:05:00', '', NULL, 3),
(78, 1, '-50.00', '2019-01-13 16:05:00', '', NULL, 2),
(79, 1, '10.00', '2019-01-13 16:13:00', '', NULL, 3),
(80, 6, '-10.00', '2019-01-13 16:13:00', '', NULL, 2),
(81, 1, '10.00', '2019-01-13 16:13:00', '', NULL, 3),
(82, 6, '-10.00', '2019-01-13 16:13:00', '', NULL, 2),
(83, 1, '10.00', '2019-01-13 16:13:00', '', NULL, 3),
(84, 6, '-10.00', '2019-01-13 16:13:00', '', NULL, 2),
(85, 1, '0.00', '2019-01-13 16:15:00', '', 1, 0),
(86, 1, '-9.69', '2019-01-13 16:16:00', '', 121, 0),
(87, 1, '-9.69', '2019-01-13 16:16:00', '', 121, 0),
(88, 1, '-1.23', '2019-01-13 16:20:00', '', 4, 0),
(89, 1, '-1.26', '2019-01-13 16:21:00', '', 1, 0),
(90, 1, '-5.36', '2019-01-13 16:26:00', '', 1, 0),
(91, 1, '-6.66', '2019-01-13 16:26:00', '', 1, 0),
(92, 1, '-3.33', '2019-01-13 16:27:00', '', 1, 0),
(96, 3, '-5.00', '2019-01-14 14:44:00', '', 1, 0),
(97, 48, '5.00', '2019-01-14 16:29:00', '', NULL, 3),
(98, 47, '-5.00', '2019-01-14 16:29:00', '', NULL, 2),
(99, 47, '-5.00', '2019-01-14 16:42:00', '', 665, 0),
(100, 47, '100.00', '2019-01-14 16:44:00', '', 713, 1),
(101, 47, '-5.00', '2019-01-14 16:44:00', '', 667, 0),
(102, 1, '0.00', '2019-01-20 21:42:00', '', 1, 0),
(103, 1, '-5.00', '2019-01-20 21:42:00', '', 1, 0),
(104, 1, '-6.00', '2019-01-20 21:44:00', '', 4, 0),
(107, 3, '-5.00', '2019-01-05 12:52:00', '', 1, 0),
(108, 6, '-3.00', '2019-01-21 13:06:00', '', 119, 0),
(109, 1, '-10.10', '2019-01-21 21:08:00', '', 121, 0),
(110, 1, '-0.01', '2019-01-22 11:06:00', '', 121, 0),
(111, 1, '-999999.99', '2019-01-22 11:06:00', '', 1, 0),
(112, 1, '-999999.99', '2019-01-22 11:07:00', '', 1, 0),
(113, 55, '-10.00', '2019-01-22 11:36:00', '', 798, 0),
(114, 53, '-100.02', '2019-01-22 11:36:00', '', 774, 0),
(115, 71, '-65.00', '2019-06-08 16:34:00', '', 931, 0),
(122, 1, '5.55', '2020-06-05 15:45:03', '', 2, 1),
(123, 1, '-3.35', '2020-06-05 15:45:03', '', 1, 0),
(124, 1, '-3.33', '2020-06-05 15:54:42', '', 1, 0),
(126, 1, '1000.00', '2020-06-05 16:06:10', '', 2, 1),
(127, 1, '10.00', '2020-06-05 16:06:10', '', 2, 1),
(128, 91, '1000.00', '2020-06-05 16:06:10', '', 2, 1),
(129, 91, '10.00', '2020-06-05 16:06:10', '', 2, 1),
(130, 91, '3.30', '2020-06-05 16:06:10', 'Zwrot od Moniki', 30, 1),
(131, 1, '-50.00', '2020-06-05 16:06:10', '', 4, 0),
(132, 1, '-10.00', '2020-06-05 16:06:10', '', 3, 0),
(133, 91, '-1000.00', '2020-06-05 16:10:36', 'Papuga &rarr; Karta', NULL, 2),
(134, 6, '1000.00', '2020-06-05 16:10:36', 'Papuga &rarr; Karta', NULL, 3),
(135, 101, '-3.33', '2020-06-05 21:16:22', '', 1575, 0),
(136, 101, '-5.20', '2020-06-05 21:16:00', 'Czekolada', 1577, 0),
(137, 100, '-52.69', '2020-06-05 21:16:00', '', 1592, 0),
(138, 101, '1000.00', '2020-06-05 18:16:00', '', 1623, 1),
(139, 101, '-900.00', '2020-06-05 18:16:00', 'Gotówka &rarr; Karta', NULL, 2),
(140, 100, '900.00', '2020-06-05 18:16:00', 'Gotówka &rarr; Karta', NULL, 3),
(153, 113, '100.00', '2020-06-07 10:21:29', '', 1834, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `money_account`
--

DROP TABLE IF EXISTS `money_account`;
CREATE TABLE `money_account` (
  `id_m_acc` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='projekt';

--
-- Zrzut danych tabeli `money_account`
--

INSERT INTO `money_account` (`id_m_acc`, `name`, `id_user`, `visible`) VALUES
(1, 'Gotówka', 2, 1),
(3, 'Usunięte konto', 2, 0),
(6, 'Karta', 2, 1),
(39, 'Usuniete konto', 20, 0),
(40, 'Gotówka', 20, 1),
(46, 'Usuniete konto', 22, 0),
(47, 'Gotówka', 22, 1),
(48, 'Karta', 22, 1),
(51, 'Usuniete konto', 24, 0),
(53, 'Karta', 24, 1),
(55, 'Gotówka', 24, 1),
(56, 'Usuniete konto', 25, 0),
(57, 'Gotówka', 25, 1),
(71, 'Usuniete konto', 27, 0),
(73, 'Usuniete konto', 28, 0),
(74, 'Gotówka', 28, 1),
(91, 'Papuga', 2, 1),
(99, 'Usunięte konta', 50, 0),
(100, 'Karta', 50, 1),
(101, 'Gotówka', 50, 1),
(112, 'Usunięte konta', 54, 0),
(113, 'Gotówka', 54, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE `subcategory` (
  `id_sub_cat` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `subcategory`
--

INSERT INTO `subcategory` (`id_sub_cat`, `name`, `id_category`) VALUES
(1, 'Ogólnie - Jedzenie i napoje', 1),
(2, 'Ogólnie - Dochody', 2),
(3, 'Owoce', 1),
(4, 'Mięso', 1),
(30, 'Ogólnie - Mieszkaniowe', 2),
(66, 'Ogólnie - Jedzenie i napoje', 13),
(67, 'Napoje', 13),
(68, 'Produkty spożywcze', 13),
(69, 'Słodycze', 13),
(70, 'Ogólnie - Opłaty', 14),
(71, 'Czynsz', 14),
(72, 'Gaz', 14),
(73, 'Internet', 14),
(74, 'Mandaty', 14),
(75, 'Naprawy', 14),
(76, 'Poczta, kurier', 14),
(77, 'Prąd', 14),
(78, 'Raty kredytu', 14),
(79, 'Telefon', 14),
(80, 'Ubezpieczenie', 14),
(81, 'Woda', 14),
(82, 'Ogólnie - Zakupy', 15),
(83, 'Apteka', 15),
(84, 'Dom i ogród', 15),
(85, 'Dzieci', 15),
(86, 'Elektronika', 15),
(87, 'Odzież i obuwie', 15),
(88, 'Programy', 15),
(89, 'Remontowe', 15),
(90, 'Zdrowie i uroda', 15),
(91, 'Zwierzeta', 15),
(92, 'Ogólnie - Pojazd', 16),
(93, 'Naprawy', 16),
(94, 'Paliwo', 16),
(95, 'Parking', 16),
(96, 'Ubezpieczenie', 16),
(97, 'Ogólnie - Życie i rozrywka', 17),
(98, 'Alkohol i używki', 17),
(99, 'Edukacja', 17),
(100, 'Gry', 17),
(101, 'Hobby', 17),
(102, 'Kosmetyka', 17),
(103, 'Książki, filmy i płyty', 17),
(104, 'Loteria', 17),
(105, 'Prezenty', 17),
(106, 'Sport', 17),
(107, 'Telewizja', 17),
(108, 'Wakacje', 17),
(109, 'Wydarzenia kulturalne', 17),
(110, 'Ogólnie - Dochody', 18),
(111, 'Loteria', 18),
(112, 'Odsetki', 18),
(113, 'Prezent', 18),
(114, 'Sprzedaż', 18),
(115, 'Wypłata', 18),
(116, 'Zwrot od znajomego', 18),
(117, 'Zwrot w sklepie, albo od podatku', 18),
(118, 'Ogólnie - Inne', 19),
(119, 'Ogólnie - Żółęćń', 20),
(120, 'Test', 20),
(121, 'Janki', 1),
(555, 'Ogólnie - Jedzenie i napoje', 79),
(556, 'Napoje', 79),
(557, 'Produkty spożywcze', 79),
(558, 'Słodycze', 79),
(559, 'Ogólnie - Opłaty', 80),
(560, 'Czynsz', 80),
(561, 'Gaz', 80),
(562, 'Internet', 80),
(563, 'Mandaty', 80),
(564, 'Naprawy', 80),
(565, 'Poczta, kurier', 80),
(566, 'Prąd', 80),
(567, 'Raty kredytu', 80),
(568, 'Telefon', 80),
(569, 'Ubezpieczenie', 80),
(570, 'Woda', 80),
(571, 'Ogólnie - Zakupy', 81),
(572, 'Apteka', 81),
(573, 'Dom i ogród', 81),
(574, 'Dzieci', 81),
(575, 'Elektronika', 81),
(576, 'Odzież i obuwie', 81),
(577, 'Programy', 81),
(578, 'Remontowe', 81),
(579, 'Zdrowie i uroda', 81),
(580, 'Zwierzeta', 81),
(581, 'Ogólnie - Pojazd', 82),
(582, 'Naprawy', 82),
(583, 'Paliwo', 82),
(584, 'Parking', 82),
(585, 'Ubezpieczenie', 82),
(586, 'Ogólnie - Życie i rozrywka', 83),
(587, 'Alkohol i używki', 83),
(588, 'Edukacja', 83),
(589, 'Gry', 83),
(590, 'Hobby', 83),
(591, 'Kosmetyka', 83),
(592, 'Książki, filmy i płyty', 83),
(593, 'Loteria', 83),
(594, 'Prezenty', 83),
(595, 'Sport', 83),
(596, 'Telewizja', 83),
(597, 'Wakacje', 83),
(598, 'Wydarzenia kulturalne', 83),
(599, 'Ogólnie - Dochody', 84),
(600, 'Loteria', 84),
(601, 'Odsetki', 84),
(602, 'Prezent', 84),
(603, 'Sprzedaż', 84),
(604, 'Wypłata', 84),
(605, 'Zwrot od znajomego', 84),
(606, 'Zwrot w sklepie, albo od podatku', 84),
(607, 'Ogólnie - Inne', 85),
(608, 'Test2', 20),
(609, 'test3', 20),
(610, 'test4', 20),
(664, 'Ogólnie - Jedzenie i napoje', 93),
(665, 'Napoje', 93),
(666, 'Produkty spożywcze', 93),
(667, 'Słodycze', 93),
(668, 'Ogólnie - Opłaty', 94),
(669, 'Czynsz', 94),
(670, 'Gaz', 94),
(671, 'Internet', 94),
(672, 'Mandaty', 94),
(673, 'Naprawy', 94),
(674, 'Poczta, kurier', 94),
(675, 'Prąd', 94),
(676, 'Raty kredytu', 94),
(677, 'Telefon', 94),
(678, 'Ubezpieczenie', 94),
(679, 'Woda', 94),
(680, 'Ogólnie - Zakupy', 95),
(681, 'Apteka', 95),
(682, 'Dom i ogród', 95),
(683, 'Dzieci', 95),
(684, 'Elektronika', 95),
(685, 'Odzież i obuwie', 95),
(686, 'Programy', 95),
(687, 'Remontowe', 95),
(688, 'Zdrowie i uroda', 95),
(689, 'Zwierzeta', 95),
(690, 'Ogólnie - Pojazd', 96),
(691, 'Naprawy', 96),
(692, 'Paliwo', 96),
(693, 'Parking', 96),
(694, 'Ubezpieczenie', 96),
(695, 'Ogólnie - Życie i rozrywka', 97),
(696, 'Alkohol i używki', 97),
(697, 'Edukacja', 97),
(698, 'Gry', 97),
(699, 'Hobby', 97),
(700, 'Kosmetyka', 97),
(701, 'Książki, filmy i płyty', 97),
(702, 'Loteria', 97),
(703, 'Prezenty', 97),
(704, 'Sport', 97),
(705, 'Telewizja', 97),
(706, 'Wakacje', 97),
(707, 'Wydarzenia kulturalne', 97),
(708, 'Ogólnie - Dochody', 98),
(709, 'Loteria', 98),
(710, 'Odsetki', 98),
(711, 'Prezent', 98),
(712, 'Sprzedaż', 98),
(713, 'Wypłata', 98),
(714, 'Zwrot od znajomego', 98),
(715, 'Zwrot w sklepie, albo od podatku', 98),
(716, 'Ogólnie - Inne', 99),
(770, 'Ogólnie - Jedzenie i napoje', 107),
(771, 'Napoje', 107),
(772, 'Produkty spożywcze', 107),
(773, 'Słodycze', 107),
(774, 'Ogólnie - Opłaty', 108),
(775, 'Czynsz', 108),
(776, 'Gaz', 108),
(777, 'Internet', 108),
(778, 'Mandaty', 108),
(779, 'Naprawy', 108),
(780, 'Poczta, kurier', 108),
(781, 'Prąd', 108),
(782, 'Raty kredytu', 108),
(783, 'Telefon', 108),
(784, 'Ubezpieczenie', 108),
(785, 'Woda', 108),
(786, 'Ogólnie - Zakupy', 109),
(787, 'Apteka', 109),
(788, 'Dom i ogród', 109),
(789, 'Dzieci', 109),
(790, 'Elektronika', 109),
(791, 'Odzież i obuwie', 109),
(792, 'Programy', 109),
(793, 'Remontowe', 109),
(794, 'Zdrowie i uroda', 109),
(795, 'Zwierzeta', 109),
(796, 'Ogólnie - Pojazd', 110),
(797, 'Naprawy', 110),
(798, 'Paliwo', 110),
(799, 'Parking', 110),
(800, 'Ubezpieczenie', 110),
(801, 'Ogólnie - Życie i rozrywka', 111),
(802, 'Alkohol i używki', 111),
(803, 'Edukacja', 111),
(804, 'Gry', 111),
(805, 'Hobby', 111),
(806, 'Kosmetyka', 111),
(807, 'Książki, filmy i płyty', 111),
(808, 'Loteria', 111),
(809, 'Prezenty', 111),
(810, 'Sport', 111),
(811, 'Telewizja', 111),
(812, 'Wakacje', 111),
(813, 'Wydarzenia kulturalne', 111),
(814, 'Ogólnie - Dochody', 112),
(815, 'Loteria', 112),
(816, 'Odsetki', 112),
(817, 'Prezent', 112),
(818, 'Sprzedaż', 112),
(819, 'Wypłata', 112),
(820, 'Zwrot od znajomego', 112),
(821, 'Zwrot w sklepie, albo od podatku', 112),
(822, 'Ogólnie - Inne', 113),
(825, 'Ogólnie - Jedzenie i napoje', 115),
(826, 'Napoje', 115),
(827, 'Produkty spożywcze', 115),
(828, 'Słodycze', 115),
(829, 'Ogólnie - Opłaty', 116),
(830, 'Czynsz', 116),
(831, 'Gaz', 116),
(832, 'Internet', 116),
(833, 'Mandaty', 116),
(834, 'Naprawy', 116),
(835, 'Poczta, kurier', 116),
(836, 'Prąd', 116),
(837, 'Raty kredytu', 116),
(838, 'Telefon', 116),
(839, 'Ubezpieczenie', 116),
(840, 'Woda', 116),
(841, 'Ogólnie - Zakupy', 117),
(842, 'Apteka', 117),
(843, 'Dom i ogród', 117),
(844, 'Dzieci', 117),
(845, 'Elektronika', 117),
(846, 'Odzież i obuwie', 117),
(847, 'Programy', 117),
(848, 'Remontowe', 117),
(849, 'Zdrowie i uroda', 117),
(850, 'Zwierzeta', 117),
(851, 'Ogólnie - Pojazd', 118),
(852, 'Naprawy', 118),
(853, 'Paliwo', 118),
(854, 'Parking', 118),
(855, 'Ubezpieczenie', 118),
(856, 'Ogólnie - Życie i rozrywka', 119),
(857, 'Alkohol i używki', 119),
(858, 'Edukacja', 119),
(859, 'Gry', 119),
(860, 'Hobby', 119),
(861, 'Kosmetyka', 119),
(862, 'Książki, filmy i płyty', 119),
(863, 'Loteria', 119),
(864, 'Prezenty', 119),
(865, 'Sport', 119),
(866, 'Telewizja', 119),
(867, 'Wakacje', 119),
(868, 'Wydarzenia kulturalne', 119),
(869, 'Ogólnie - Dochody', 120),
(870, 'Loteria', 120),
(871, 'Odsetki', 120),
(872, 'Prezent', 120),
(873, 'Sprzedaż', 120),
(874, 'Wypłata', 120),
(875, 'Zwrot od znajomego', 120),
(876, 'Zwrot w sklepie, albo od podatku', 120),
(877, 'Ogólnie - Inne', 121),
(931, 'Ogólnie - Jedzenie i napoje', 129),
(932, 'Napoje', 129),
(933, 'Produkty spożywcze', 129),
(934, 'Słodycze', 129),
(935, 'Ogólnie - Opłaty', 130),
(936, 'Czynsz', 130),
(937, 'Gaz', 130),
(938, 'Internet', 130),
(939, 'Mandaty', 130),
(940, 'Naprawy', 130),
(941, 'Poczta, kurier', 130),
(942, 'Prąd', 130),
(943, 'Raty kredytu', 130),
(944, 'Telefon', 130),
(945, 'Ubezpieczenie', 130),
(946, 'Woda', 130),
(947, 'Ogólnie - Zakupy', 131),
(948, 'Apteka', 131),
(949, 'Dom i ogród', 131),
(950, 'Dzieci', 131),
(951, 'Elektronika', 131),
(952, 'Odzież i obuwie', 131),
(953, 'Programy', 131),
(954, 'Remontowe', 131),
(955, 'Zdrowie i uroda', 131),
(956, 'Zwierzeta', 131),
(957, 'Ogólnie - Pojazd', 132),
(958, 'Naprawy', 132),
(959, 'Paliwo', 132),
(960, 'Parking', 132),
(961, 'Ubezpieczenie', 132),
(962, 'Ogólnie - Życie i rozrywka', 133),
(963, 'Alkohol i używki', 133),
(964, 'Edukacja', 133),
(965, 'Gry', 133),
(966, 'Hobby', 133),
(967, 'Kosmetyka', 133),
(968, 'Książki, filmy i płyty', 133),
(969, 'Loteria', 133),
(970, 'Prezenty', 133),
(971, 'Sport', 133),
(972, 'Telewizja', 133),
(973, 'Wakacje', 133),
(974, 'Wydarzenia kulturalne', 133),
(975, 'Ogólnie - Dochody', 134),
(976, 'Loteria', 134),
(977, 'Odsetki', 134),
(978, 'Prezent', 134),
(979, 'Sprzedaż', 134),
(980, 'Wypłata', 134),
(981, 'Zwrot od znajomego', 134),
(982, 'Zwrot w sklepie, albo od podatku', 134),
(983, 'Ogólnie - Inne', 135),
(984, 'Ogólnie - Jedzenie i napoje', 136),
(985, 'Napoje', 136),
(986, 'Produkty spożywcze', 136),
(987, 'Słodycze', 136),
(988, 'Ogólnie - Opłaty', 137),
(989, 'Czynsz', 137),
(990, 'Gaz', 137),
(991, 'Internet', 137),
(992, 'Mandaty', 137),
(993, 'Naprawy', 137),
(994, 'Poczta, kurier', 137),
(995, 'Prąd', 137),
(996, 'Raty kredytu', 137),
(997, 'Telefon', 137),
(998, 'Ubezpieczenie', 137),
(999, 'Woda', 137),
(1000, 'Ogólnie - Zakupy', 138),
(1001, 'Apteka', 138),
(1002, 'Dom i ogród', 138),
(1003, 'Dzieci', 138),
(1004, 'Elektronika', 138),
(1005, 'Odzież i obuwie', 138),
(1006, 'Programy', 138),
(1007, 'Remontowe', 138),
(1008, 'Zdrowie i uroda', 138),
(1009, 'Zwierzeta', 138),
(1010, 'Ogólnie - Pojazd', 139),
(1011, 'Naprawy', 139),
(1012, 'Paliwo', 139),
(1013, 'Parking', 139),
(1014, 'Ubezpieczenie', 139),
(1015, 'Ogólnie - Życie i rozrywka', 140),
(1016, 'Alkohol i używki', 140),
(1017, 'Edukacja', 140),
(1018, 'Gry', 140),
(1019, 'Hobby', 140),
(1020, 'Kosmetyka', 140),
(1021, 'Książki, filmy i płyty', 140),
(1022, 'Loteria', 140),
(1023, 'Prezenty', 140),
(1024, 'Sport', 140),
(1025, 'Telewizja', 140),
(1026, 'Wakacje', 140),
(1027, 'Wydarzenia kulturalne', 140),
(1028, 'Ogólnie - Dochody', 141),
(1029, 'Loteria', 141),
(1030, 'Odsetki', 141),
(1031, 'Prezent', 141),
(1032, 'Sprzedaż', 141),
(1033, 'Wypłata', 141),
(1034, 'Zwrot od znajomego', 141),
(1035, 'Zwrot w sklepie, albo od podatku', 141),
(1036, 'Ogólnie - Inne', 142),
(1197, 'Ogólnie - kuba1@fifi.commm', 551085),
(1198, 'kuba1@fifi.co', 551085),
(1199, 'Napoje', 1),
(1200, 'Ogólnie - Rachunki', 551086),
(1201, 'Wypłata', 2),
(1202, 'Ogólnie - Loterie', 551087),
(1574, 'Ogólnie - Jedzenie i napoje', 551137),
(1575, 'Napoje', 551137),
(1576, 'Produkty spożywcze', 551137),
(1577, 'Słodycze', 551137),
(1578, 'Ogólnie - Opłaty', 551138),
(1579, 'Czynsz', 551138),
(1580, 'Gaz', 551138),
(1581, 'Internet', 551138),
(1582, 'Mandaty', 551138),
(1583, 'Naprawy', 551138),
(1584, 'Poczta, kurier', 551138),
(1585, 'Prąd', 551138),
(1586, 'Raty kredytu', 551138),
(1587, 'Telefon', 551138),
(1588, 'Ubezpieczenie', 551138),
(1589, 'Woda', 551138),
(1590, 'Ogólnie - Zakupy', 551139),
(1591, 'Apteka', 551139),
(1592, 'Dom i ogród', 551139),
(1593, 'Dzieci', 551139),
(1594, 'Elektronika', 551139),
(1595, 'Odzież i obuwie', 551139),
(1596, 'Programy', 551139),
(1597, 'Remontowe', 551139),
(1598, 'Zdrowie i uroda', 551139),
(1599, 'Zwierzeta', 551139),
(1600, 'Ogólnie - Pojazd', 551140),
(1601, 'Naprawy', 551140),
(1602, 'Paliwo', 551140),
(1603, 'Parking', 551140),
(1604, 'Ubezpieczenie', 551140),
(1605, 'Ogólnie - Życie i rozrywka', 551141),
(1606, 'Alkohol i używki', 551141),
(1607, 'Edukacja', 551141),
(1608, 'Gry', 551141),
(1609, 'Hobby', 551141),
(1610, 'Kosmetyka', 551141),
(1611, 'Książki, filmy i płyty', 551141),
(1612, 'Loteria', 551141),
(1613, 'Prezenty', 551141),
(1614, 'Sport', 551141),
(1615, 'Telewizja', 551141),
(1616, 'Wakacje', 551141),
(1617, 'Wydarzenia kulturalne', 551141),
(1618, 'Ogólnie - Dochody', 551142),
(1619, 'Loteria', 551142),
(1620, 'Odsetki', 551142),
(1621, 'Prezent', 551142),
(1622, 'Sprzedaż', 551142),
(1623, 'Wypłata', 551142),
(1624, 'Zwrot od znajomego', 551142),
(1625, 'Zwrot w sklepie, albo od podatku', 551142),
(1626, 'Ogólnie - Inne', 551143),
(1790, 'Ogólnie - Jedzenie i napoje', 551167),
(1791, 'Napoje', 551167),
(1792, 'Produkty spożywcze', 551167),
(1793, 'Słodycze', 551167),
(1794, 'Ogólnie - Opłaty', 551168),
(1795, 'Czynsz', 551168),
(1796, 'Gaz', 551168),
(1797, 'Internet', 551168),
(1798, 'Mandaty', 551168),
(1799, 'Naprawy', 551168),
(1800, 'Poczta, kurier', 551168),
(1801, 'Prąd', 551168),
(1802, 'Raty kredytu', 551168),
(1803, 'Telefon', 551168),
(1804, 'Ubezpieczenie', 551168),
(1805, 'Woda', 551168),
(1806, 'Ogólnie - Zakupy', 551169),
(1807, 'Apteka', 551169),
(1808, 'Dom i ogród', 551169),
(1809, 'Dzieci', 551169),
(1810, 'Elektronika', 551169),
(1811, 'Odzież i obuwie', 551169),
(1812, 'Programy', 551169),
(1813, 'Remontowe', 551169),
(1814, 'Zdrowie i uroda', 551169),
(1815, 'Zwierzeta', 551169),
(1816, 'Ogólnie - Pojazd', 551170),
(1817, 'Naprawy', 551170),
(1818, 'Paliwo', 551170),
(1819, 'Parking', 551170),
(1820, 'Ubezpieczenie', 551170),
(1821, 'Ogólnie - Życie i rozrywka', 551171),
(1822, 'Alkohol i używki', 551171),
(1823, 'Edukacja', 551171),
(1824, 'Gry', 551171),
(1825, 'Hobby', 551171),
(1826, 'Kosmetyka', 551171),
(1827, 'Książki, filmy i płyty', 551171),
(1828, 'Loteria', 551171),
(1829, 'Prezenty', 551171),
(1830, 'Sport', 551171),
(1831, 'Telewizja', 551171),
(1832, 'Wakacje', 551171),
(1833, 'Wydarzenia kulturalne', 551171),
(1834, 'Ogólnie - Dochody', 551172),
(1835, 'Loteria', 551172),
(1836, 'Odsetki', 551172),
(1837, 'Prezent', 551172),
(1838, 'Sprzedaż', 551172),
(1839, 'Wypłata', 551172),
(1840, 'Zwrot od znajomego', 551172),
(1841, 'Zwrot w sklepie, albo od podatku', 551172),
(1842, 'Ogólnie - Inne', 551173);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` char(64) NOT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='projekt';

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id_user`, `email`, `name`, `password`, `active`) VALUES
(1, 'deffault@co.pl', '', '8e65999f0f3ed53c8049937f5fe2ef11', 0),
(2, 'krzysiek.swal@gmail.com', 'Krzysiek', '674a7ac232735fa605bba5129e47477b', 1),
(20, 'test@test.pl', 'Nie Fifi', '674a7ac232735fa605bba5129e47477b', 1),
(22, 'filip@cos.pl', 'Filip', '674a7ac232735fa605bba5129e47477b', 1),
(24, 'krzysiek@gmail.com', 'Krzyś', '674a7ac232735fa605bba5129e47477b', 1),
(25, 'krzysiek@n', '', '16ec114932520d2b9c18a28121d515af', 1),
(27, 'test@gmail.com', 'Test', '95e4635a172be87206e8d7385e3a52f3', 1),
(28, 'test1@gmail.com', 'Testowe', '95e4635a172be87206e8d7385e3a52f3', 1),
(50, 'test@test.com', 'Kubuś', 'a090ae742c956587c167619f976f9b1c', 1),
(54, 'kowalski@kow.com', 'Test', 'c60ea65c492a09b3f6c96cf8b989a46e', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE `user_details` (
  `id_user` int(11) NOT NULL,
  `money_account_trash` int(11) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL COMMENT '0 - user; 1 - admin; 2 - deffault'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='projekt';

--
-- Zrzut danych tabeli `user_details`
--

INSERT INTO `user_details` (`id_user`, `money_account_trash`, `rol`) VALUES
(2, 3, 1),
(20, 40, NULL),
(22, 47, NULL),
(24, 51, NULL),
(25, 56, NULL),
(27, 71, NULL),
(28, 73, NULL),
(50, 99, 0),
(54, 112, 0);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`),
  ADD KEY `proj_category_proj_color_id_color_fk` (`id_color`),
  ADD KEY `proj_category_proj_users_id_user_fk` (`id_user`);

--
-- Indeksy dla tabeli `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id_color`);

--
-- Indeksy dla tabeli `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id_expense`),
  ADD KEY `proj_expense_proj_monney_account_id_m_acc_fk` (`id_m_acc`),
  ADD KEY `proj_expense_proj_subcategory_id_sub_cat_fk` (`id_subcategory`);

--
-- Indeksy dla tabeli `money_account`
--
ALTER TABLE `money_account`
  ADD PRIMARY KEY (`id_m_acc`),
  ADD KEY `proj_monney_account_proj_users_id_user_fk` (`id_user`);

--
-- Indeksy dla tabeli `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id_sub_cat`),
  ADD KEY `proj_subcategory_proj_category_id_category_fk` (`id_category`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeksy dla tabeli `user_details`
--
ALTER TABLE `user_details`
  ADD KEY `proj_user_details_proj_users_id_user_fk` (`id_user`),
  ADD KEY `proj_user_details_proj_monney_account_id_m_acc_fk` (`money_account_trash`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=551174;

--
-- AUTO_INCREMENT dla tabeli `color`
--
ALTER TABLE `color`
  MODIFY `id_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `expense`
--
ALTER TABLE `expense`
  MODIFY `id_expense` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT dla tabeli `money_account`
--
ALTER TABLE `money_account`
  MODIFY `id_m_acc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT dla tabeli `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id_sub_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1843;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_ibfk_3` FOREIGN KEY (`id_color`) REFERENCES `color` (`id_color`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`id_m_acc`) REFERENCES `money_account` (`id_m_acc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expense_ibfk_2` FOREIGN KEY (`id_subcategory`) REFERENCES `subcategory` (`id_sub_cat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `money_account`
--
ALTER TABLE `money_account`
  ADD CONSTRAINT `money_account_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;


