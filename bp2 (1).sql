-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 15 dec 2023 om 16:21
-- Serverversie: 10.4.27-MariaDB
-- PHP-versie: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `antwoorden`
--

CREATE TABLE `antwoorden` (
  `AntwoordID` int(11) NOT NULL,
  `VraagID` int(11) DEFAULT NULL,
  `Tekst` varchar(255) DEFAULT NULL,
  `CategorieID` int(11) DEFAULT NULL,
  `Waarde` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `antwoorden`
--

INSERT INTO `antwoorden` (`AntwoordID`, `VraagID`, `Tekst`, `CategorieID`, `Waarde`) VALUES
(1, 1, 'voetballen', 1, 5),
(2, 1, 'hardlopen', 1, 1),
(3, 1, 'basketbal', 1, 5),
(4, 1, 'atletiek', 1, 1),
(5, 2, 'Donald Duck', 7, 5),
(6, 2, 'Broer Konijn op reis', 7, 5),
(7, 2, 'Wie was de vader van Willem Alexander?', 7, 1),
(8, 2, 'Waarom er geen dino\'s meer zijn', 7, 1),
(9, 3, 'schroef', 8, 1),
(10, 3, 'spijker', 8, 1),
(11, 3, 'plakband', 8, 1),
(12, 3, 'plank', 8, 4),
(13, 4, 'fiets', 10, 1),
(14, 4, 'auto', 10, 1),
(15, 4, 'trein', 10, 1),
(16, 4, 'raket', 10, 5),
(17, 5, 'onderzeeboot', 10, 5),
(18, 5, 'zeilboot', 10, 1),
(19, 5, 'stoomboot', 10, 1),
(20, 5, 'roeiboot', 10, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categorieen`
--

CREATE TABLE `categorieen` (
  `CategorieID` int(11) NOT NULL,
  `Omschrijving` varchar(255) DEFAULT NULL,
  `Waarde1` varchar(255) DEFAULT NULL,
  `Waarde5` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `categorieen`
--

INSERT INTO `categorieen` (`CategorieID`, `Omschrijving`, `Waarde1`, `Waarde5`) VALUES
(1, 'Samenwerken', 'Zelfstandig', 'Teamverband'),
(2, 'Werkplek', 'Binnen', 'Buiten'),
(3, 'Werkplek', 'Vaste plek', 'Wisselende omgeving'),
(4, 'Soort werk', 'Vast werk', 'Wisselend werk'),
(5, 'Ontwikkeling', 'Avontuurlijk', 'Ontspannend'),
(6, 'Ontwikkeling', 'Avontuurlijk', 'Behoudend'),
(7, 'Ontwikkeling', 'Nieuwsgierig', 'Comfort zoekend'),
(8, 'Technisch inzicht', 'Laag', 'Hoog'),
(9, 'Sociale verantwoordelijkheid', 'Laag', 'Hoog'),
(10, 'Algemene ontwikkeling', 'Laag', 'Hoog');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vragen`
--

CREATE TABLE `vragen` (
  `VraagID` int(11) NOT NULL,
  `CategorieID` int(11) DEFAULT NULL,
  `Vraag` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `vragen`
--

INSERT INTO `vragen` (`VraagID`, `CategorieID`, `Vraag`) VALUES
(1, 1, 'Op sportdag gaan we met de klas naar buiten. Wat vind je dan het leukst om te doen?'),
(2, 7, 'Welk boek zou je het eerst pakken bij het leesuurtje?'),
(3, 8, 'Wat hoort er bij een hamer?'),
(4, 10, 'Waarmee ga je naar de maan?'),
(5, 10, 'Wat past er niet bij?');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vragen_categorieen`
--

CREATE TABLE `vragen_categorieen` (
  `VraagID` int(11) DEFAULT NULL,
  `CategorieID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `vragen_categorieen`
--

INSERT INTO `vragen_categorieen` (`VraagID`, `CategorieID`) VALUES
(1, 1),
(2, 7),
(3, 8),
(4, 10),
(5, 10);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `antwoorden`
--
ALTER TABLE `antwoorden`
  ADD PRIMARY KEY (`AntwoordID`),
  ADD KEY `VraagID` (`VraagID`),
  ADD KEY `CategorieID` (`CategorieID`);

--
-- Indexen voor tabel `categorieen`
--
ALTER TABLE `categorieen`
  ADD PRIMARY KEY (`CategorieID`);

--
-- Indexen voor tabel `vragen`
--
ALTER TABLE `vragen`
  ADD PRIMARY KEY (`VraagID`),
  ADD KEY `CategorieID` (`CategorieID`);

--
-- Indexen voor tabel `vragen_categorieen`
--
ALTER TABLE `vragen_categorieen`
  ADD KEY `VraagID` (`VraagID`),
  ADD KEY `CategorieID` (`CategorieID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `antwoorden`
--
ALTER TABLE `antwoorden`
  MODIFY `AntwoordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT voor een tabel `categorieen`
--
ALTER TABLE `categorieen`
  MODIFY `CategorieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `vragen`
--
ALTER TABLE `vragen`
  MODIFY `VraagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `antwoorden`
--
ALTER TABLE `antwoorden`
  ADD CONSTRAINT `antwoorden_ibfk_1` FOREIGN KEY (`VraagID`) REFERENCES `vragen` (`VraagID`),
  ADD CONSTRAINT `antwoorden_ibfk_2` FOREIGN KEY (`CategorieID`) REFERENCES `categorieen` (`CategorieID`);

--
-- Beperkingen voor tabel `vragen`
--
ALTER TABLE `vragen`
  ADD CONSTRAINT `vragen_ibfk_1` FOREIGN KEY (`CategorieID`) REFERENCES `categorieen` (`CategorieID`);

--
-- Beperkingen voor tabel `vragen_categorieen`
--
ALTER TABLE `vragen_categorieen`
  ADD CONSTRAINT `vragen_categorieen_ibfk_1` FOREIGN KEY (`VraagID`) REFERENCES `vragen` (`VraagID`),
  ADD CONSTRAINT `vragen_categorieen_ibfk_2` FOREIGN KEY (`CategorieID`) REFERENCES `categorieen` (`CategorieID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
