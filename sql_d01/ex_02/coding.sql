-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 17 jan. 2020 à 10:59
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `coding`
--
CREATE DATABASE IF NOT EXISTS `coding` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `coding`;

-- --------------------------------------------------------

--
-- Structure de la table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `percentage_discount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `discounts`
--

INSERT INTO `discounts` (`id`, `name`, `start_date`, `end_date`, `percentage_discount`) VALUES
(0, 'jeune', NULL, NULL, 30),
(1, 'vieux', NULL, NULL, 25),
(2, 'famille', NULL, NULL, 20),
(3, 'fete de la musique', '2007-10-18 00:00:00', '2007-10-25 00:00:00', 35),
(4, 'groupe de plus de 10', NULL, NULL, 35);

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(0, 'detective'),
(1, 'dramatic comedy'),
(2, 'science fiction'),
(3, 'drama'),
(4, 'documentary'),
(5, 'animation'),
(6, 'comedy'),
(7, 'fantasy'),
(8, 'action'),
(9, 'thriller'),
(10, 'adventure'),
(11, 'various'),
(12, 'historical'),
(13, 'romance'),
(14, 'western'),
(15, 'music'),
(16, 'musical'),
(17, 'horror'),
(18, 'war'),
(19, 'unknow'),
(20, 'spying'),
(21, 'historical epic'),
(22, 'biography'),
(23, 'experimental'),
(24, 'short film'),
(25, 'erotic'),
(26, 'karate'),
(27, 'program'),
(28, 'family'),
(29, 'exp&amp;atilde;&amp;copy;rimental');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `salary` varchar(255) NOT NULL,
  `manager` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `sub_id` int(11) DEFAULT NULL,
  `sub_date` datetime DEFAULT NULL,
  `last_movie_id` int(11) DEFAULT NULL,
  `date_last_movie` datetime DEFAULT NULL,
  `date_registration` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_id` (`sub_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `members_movies`
--

DROP TABLE IF EXISTS `members_movies`;
CREATE TABLE IF NOT EXISTS `members_movies` (
  `member_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  KEY `member_id` (`member_id`),
  KEY `movie_id` (`movie_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(11) NOT NULL,
  `genre_id` tinyint(4) DEFAULT NULL,
  `producer_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `summary` varchar(300) NOT NULL,
  `release_date` date DEFAULT NULL,
  `end_release_date` date NOT NULL,
  `min_duration` int(11) DEFAULT NULL,
  `prod_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genre_id` (`genre_id`),
  KEY `producer_id` (`producer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `movies_programming`
--

DROP TABLE IF EXISTS `movies_programming`;
CREATE TABLE IF NOT EXISTS `movies_programming` (
  `movie_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `staff_opener_id` int(11) NOT NULL,
  `staff_technician_id` int(11) NOT NULL,
  `staff_menage_id` int(11) NOT NULL,
  `start_session_id` datetime NOT NULL,
  `end_session` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `producers`
--

DROP TABLE IF EXISTS `producers`;
CREATE TABLE IF NOT EXISTS `producers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `producers`
--

INSERT INTO `producers` (`id`, `name`, `phone`, `adress`, `zipcode`, `city`, `country`) VALUES
(0, 'gimages', '0524509890', NULL, NULL, NULL, NULL),
(1, 'les films du losange', '0172073438', NULL, NULL, NULL, NULL),
(2, 'mk2 diffusion', '0165082653', NULL, NULL, NULL, NULL),
(3, 'rezo films', '0503486847', NULL, NULL, NULL, NULL),
(4, 'studio images 5', '0537834131', NULL, NULL, NULL, NULL),
(5, 'eiffel productions', '0384390808', NULL, NULL, NULL, NULL),
(6, 'cerito films', '0164444892', NULL, NULL, NULL, NULL),
(7, 'france 3 cin&amp;atilde;&amp;copy;ma', '0387270953', NULL, NULL, NULL, NULL),
(8, 'monarchy enterprises b.v.', '0134931386', NULL, NULL, NULL, NULL),
(9, 'tartan movies', '0267515944', NULL, NULL, NULL, NULL),
(10, 'advanced', '0466014732', NULL, NULL, NULL, NULL),
(11, 'the vista organisation group', '0437174826', NULL, NULL, NULL, NULL),
(12, 'les films balenciaga', '0221824218', NULL, NULL, NULL, NULL),
(13, 'art-light productions', '0356023625', NULL, NULL, NULL, NULL),
(14, 'telinor', '0109372199', NULL, NULL, NULL, NULL),
(15, 'bandidos films', '0371213306', NULL, NULL, NULL, NULL),
(16, 'parco co, ltd', '0527672375', NULL, NULL, NULL, NULL),
(17, 'transfilm', '0448268106', NULL, NULL, NULL, NULL),
(18, 'dmvb films', '0215373495', NULL, NULL, NULL, NULL),
(19, 'davis-panzer productions', '0535418285', NULL, NULL, NULL, NULL),
(20, 'idea productions', '0313187914', NULL, NULL, NULL, NULL),
(21, 'vision international', '0424465993', NULL, NULL, NULL, NULL),
(22, 'films a2', '0243936488', NULL, NULL, NULL, NULL),
(23, 'dog eat dog productions', '0216868187', NULL, NULL, NULL, NULL),
(24, 'the carousel pictures company', '0578341887', NULL, NULL, NULL, NULL),
(25, 'interlight', '0387722115', NULL, NULL, NULL, NULL),
(26, 'deluxe productions', '0554695372', NULL, NULL, NULL, NULL),
(27, 'lolistar', '0190887722', NULL, NULL, NULL, NULL),
(28, 'united international pictures (uip)', '0511650332', NULL, NULL, NULL, NULL),
(29, 'verve pictures', '0343139508', NULL, NULL, NULL, NULL),
(30, 'entertainment film distributors ltd', '0136355344', NULL, NULL, NULL, NULL),
(31, 'eros film ltd.', '0117308564', NULL, NULL, NULL, NULL),
(32, 'dogwoof pictures', '0397752175', NULL, NULL, NULL, NULL),
(33, 'guerilla films ltd.', '0126939575', NULL, NULL, NULL, NULL),
(34, 'ica films', '0109521351', NULL, NULL, NULL, NULL),
(35, 'sony pictures', '0117667343', NULL, NULL, NULL, NULL),
(36, '20th century fox', '0450273867', NULL, NULL, NULL, NULL),
(37, 'contender entertainment', '0524345397', NULL, NULL, NULL, NULL),
(38, 'momentum pictures', '0333654411', NULL, NULL, NULL, NULL),
(39, 'adlabs films', '0255521648', NULL, NULL, NULL, NULL),
(40, 'artificial eye', '0135718252', NULL, NULL, NULL, NULL),
(41, 'the works', '0482435790', NULL, NULL, NULL, NULL),
(42, 'peccadillo pictures', '0142367829', NULL, NULL, NULL, NULL),
(43, 'metrodome films', '0184888460', NULL, NULL, NULL, NULL),
(44, 'icon film distribution uk', '0285454608', NULL, NULL, NULL, NULL),
(45, 'bfi distribution', '0278292428', NULL, NULL, NULL, NULL),
(46, 'optimum releasing', '0210219708', NULL, NULL, NULL, NULL),
(47, 'miracle comms', '0344573119', NULL, NULL, NULL, NULL),
(48, 'revolver entertainment', '0489407327', NULL, NULL, NULL, NULL),
(49, 'soda pictures', '0370402534', NULL, NULL, NULL, NULL),
(50, 'national film theater', '0304269716', NULL, NULL, NULL, NULL),
(51, 'revelation films', '0138006046', NULL, NULL, NULL, NULL),
(52, 'ace films', '0588636787', NULL, NULL, NULL, NULL),
(53, 'path&amp;atilde;&amp;copy;', '0530470806', NULL, NULL, NULL, NULL),
(54, 'v&amp;atilde;&amp;copy;rtigo films', '0588492202', NULL, NULL, NULL, NULL),
(55, 'park circus', '0517505479', NULL, NULL, NULL, NULL),
(56, 'buena vista international', '0147740888', NULL, NULL, NULL, NULL),
(57, 'yeah yeah yeah ltd.', '0579557407', NULL, NULL, NULL, NULL),
(58, 'swipe films', '0438820671', NULL, NULL, NULL, NULL),
(59, 'universal', '0118023807', NULL, NULL, NULL, NULL),
(60, 'paramount pictures', '0586773629', NULL, NULL, NULL, NULL),
(61, 'warner bros u.k.', '0379233026', NULL, NULL, NULL, NULL),
(62, 'showbox media group', '0194205118', NULL, NULL, NULL, NULL),
(63, 'united pictures international uk', '0398187864', NULL, NULL, NULL, NULL),
(64, 'paramount pictures uk', '0127074098', NULL, NULL, NULL, NULL),
(65, 'buena vista international uk', '0391010431', NULL, NULL, NULL, NULL),
(66, 'universal international pictures', '0142892701', NULL, NULL, NULL, NULL),
(67, 'punk distribution', '0387909616', NULL, NULL, NULL, NULL),
(68, 'axiom films', '0115965167', NULL, NULL, NULL, NULL),
(69, 'eros international ltd.', '0101316595', NULL, NULL, NULL, NULL),
(70, 'sony pictures uk', '0576925615', NULL, NULL, NULL, NULL),
(71, 'lions gate films home entertainment', '0486208894', NULL, NULL, NULL, NULL),
(72, 'studio 18', '0311132263', NULL, NULL, NULL, NULL),
(73, 'british path&amp;atilde;&amp;copy;', '0523400093', NULL, NULL, NULL, NULL),
(74, 'maiden voyage pictures', '0355023753', NULL, NULL, NULL, NULL),
(75, 'warner music entertainment', '0433185208', NULL, NULL, NULL, NULL),
(76, 'utv motion pictures', '0334826167', NULL, NULL, NULL, NULL),
(77, 'yume pictures', '0309873282', NULL, NULL, NULL, NULL),
(78, 'lionsgate uk', '0276522134', NULL, NULL, NULL, NULL),
(79, 'delanic films', '0412565948', NULL, NULL, NULL, NULL),
(80, 'vertigo films', '0464391054', NULL, NULL, NULL, NULL),
(81, 'path&amp;atilde;&amp;copy; distribution ltd.', '0267718795', NULL, NULL, NULL, NULL),
(82, 'spark pictures', '0114385541', NULL, NULL, NULL, NULL),
(83, 'slingshot', '0146903442', NULL, NULL, NULL, NULL),
(84, 'diffusion pictures', '0448074755', NULL, NULL, NULL, NULL),
(85, 'transmedia pictures', '0435146575', NULL, NULL, NULL, NULL),
(86, 'cinefilm', '0139243944', NULL, NULL, NULL, NULL),
(87, 'odeon sky filmworks', '0289544451', NULL, NULL, NULL, NULL),
(88, 'liberation entertainment', '0537490904', NULL, NULL, NULL, NULL),
(89, 'lagoon entertainment', '0462275200', NULL, NULL, NULL, NULL),
(90, 'halcyon pictures', '0394022987', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(11) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `birthdate` datetime NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `adress` varchar(255) NOT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `profiles_staff`
--

DROP TABLE IF EXISTS `profiles_staff`;
CREATE TABLE IF NOT EXISTS `profiles_staff` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `job_id` tinyint(4) NOT NULL,
  `timetable` enum('','pm','am') NOT NULL,
  `recruitment_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL,
  `room_number` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `floor` int(11) NOT NULL,
  `seats` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `name`, `floor`, `seats`) VALUES
(0, 1, 'Montana', 0, 135),
(1, 2, 'Highscore', 0, 300),
(2, 3, 'Salle 3', 0, 85),
(3, 10, 'Astek', 1, 85),
(4, 11, 'Gecko', 1, 125),
(5, 12, 'Azure', 1, 85),
(6, 13, 'Toshiba', 1, 300),
(7, 14, 'Salle 14', 1, 85),
(8, 15, 'Asus', 1, 280),
(9, 16, 'Salle 16', 1, 125),
(10, 20, 'Microsoft', 2, 200),
(11, 21, 'VIP', 2, 35),
(12, 22, 'Golden', 2, 89),
(13, 23, 'Salle 23', 2, 225),
(14, 30, 'Lenovo', 3, 225),
(15, 31, 'Salle 31', 3, 38),
(16, 32, 'Huawei', 3, 130);

-- --------------------------------------------------------

--
-- Structure de la table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `sub_duration` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `name`, `summary`, `price`, `sub_duration`) VALUES
(1, 'VIP', 'Le mois tout compris', 60, 30),
(2, 'GOLD', 'L annee complete', 500, 365),
(3, 'Classic', 'abonnement mensuel classique illimite', 40, 30),
(4, 'pass day', 'pass valable une journee', 15, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
