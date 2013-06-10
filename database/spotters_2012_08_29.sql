-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 29, 2012 at 05:38 PM
-- Server version: 5.5.25a
-- PHP Version: 5.2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spotters`
--

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE IF NOT EXISTS `airports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `IATA` varchar(45) DEFAULT NULL,
  `ICAO` varchar(45) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `city_id1` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_airports_city1_idx` (`city_id`),
  KEY `fk_airports_city2_idx` (`countries_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`id`, `countries_id`, `status`, `IATA`, `ICAO`, `city_id`, `latitude`, `longitude`, `city_id1`) VALUES
(2, 2, 1, NULL, NULL, 2, 15.2851, -35.493894, 0),
(3, 1, 1, NULL, NULL, 1, 16.515153, -34.5465465, 0);

-- --------------------------------------------------------

--
-- Table structure for table `airports_langs`
--

CREATE TABLE IF NOT EXISTS `airports_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `airports_id` int(11) NOT NULL,
  `id_lang` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_airports_lang_airports1_idx` (`airports_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `airports_langs`
--

INSERT INTO `airports_langs` (`id`, `name`, `airports_id`, `id_lang`) VALUES
(1, 'Аеропорт Львів', 2, 1),
(2, 'Аеропорт Москва', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE IF NOT EXISTS `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_albums_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `name`, `description`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 'Album_1', 'Some description of Albom_1', 3, '2012-08-08 00:00:00', '2012-08-09 00:00:00'),
(2, 'Album_2', 'Some description of Albom_2', 3, '2012-08-01 00:00:00', '2012-08-04 00:00:00'),
(3, 'Album_3', 'Some description of Albom_3', 3, '2012-08-08 00:00:00', '2012-08-11 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8,
  `users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '1',
  `countries_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_city_countries1` (`countries_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `status`, `countries_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `city_lang`
--

CREATE TABLE IF NOT EXISTS `city_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lang` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_lang_city` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `city_lang`
--

INSERT INTO `city_lang` (`id`, `id_lang`, `name`, `city_id`) VALUES
(1, 1, 'Львов', 1),
(2, 2, 'Львів', 1),
(3, 3, 'Lviv', 1),
(4, 1, 'Москва', 2);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `item_type` enum('photos','news','video') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `date` int(11) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_FKIndex2` (`item_id`),
  KEY `fk_comments_users1` (`user_id`),
  KEY `fk_comments_comments1` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `status`) VALUES
(1, 'AeroSvit', 1),
(2, 'Dniproavia', 1),
(3, 'Khors', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `status`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries_langs`
--

CREATE TABLE IF NOT EXISTS `countries_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lang` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `countries_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_countries_lang_countries1_idx` (`countries_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `countries_langs`
--

INSERT INTO `countries_langs` (`id`, `id_lang`, `name`, `countries_id`) VALUES
(1, 1, 'Украина', 1),
(2, 2, 'Україна', 1),
(3, 3, 'Ukraine', 1),
(5, 1, 'США', 2),
(6, 2, 'США', 2),
(7, 3, 'USA', 2),
(8, 1, 'Польша', 3),
(9, 2, 'Польща', 3),
(10, 2, 'Poland', 3);

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

CREATE TABLE IF NOT EXISTS `lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `lang`
--

INSERT INTO `lang` (`id`, `name`) VALUES
(1, 'ru'),
(2, 'en'),
(3, 'uk');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE IF NOT EXISTS `manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`, `status`) VALUES
(1, 'KYIV_BUD', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `type` enum('base','telegraph') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news_lang`
--

CREATE TABLE IF NOT EXISTS `news_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `meta_desc` text,
  `meta_keywords` text,
  `seo_name` text,
  `text` text,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_news_lang_news1_idx` (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages_lang`
--

CREATE TABLE IF NOT EXISTS `pages_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `meta_desc` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `seo_name` varchar(255) DEFAULT NULL,
  `pages_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pages_lang_pages1_idx` (`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `photos_albums`
--

CREATE TABLE IF NOT EXISTS `photos_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`,`picture_id`),
  KEY `picture_id` (`picture_id`),
  KEY `album_id_2` (`album_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `photos_albums`
--

INSERT INTO `photos_albums` (`id`, `album_id`, `picture_id`) VALUES
(8, 1, 14),
(4, 1, 19),
(3, 2, 14),
(2, 2, 15),
(10, 2, 16),
(5, 2, 17),
(12, 2, 18),
(11, 2, 19),
(7, 2, 21),
(9, 3, 21),
(6, 3, 23);

-- --------------------------------------------------------

--
-- Table structure for table `photos_categories`
--

CREATE TABLE IF NOT EXISTS `photos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`,`picture_id`),
  KEY `picture_id` (`picture_id`),
  KEY `category_id_2` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE IF NOT EXISTS `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pictures_advertisments1_idx` (`post_id`),
  KEY `fk_pictures_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `name`, `post_id`, `users_id`) VALUES
(14, 'alboms_photo_01.jpg', 88, 3),
(15, 'alboms_photo_02.jpg', 89, 3),
(16, 'alboms_photo_04.jpg', 90, 3),
(17, 'alboms_photo_05.jpg', 91, 3),
(18, 'alboms_photo_06.jpg', 92, 3),
(19, 'alboms_photo_07.jpg', 93, 3),
(20, 'alboms_photo_08.jpg', 94, 3),
(21, 'alboms_photo_09.jpg', 95, 3),
(22, 'alboms_photo_10.jpg', 96, 3),
(23, 'img_random_08.jpg', 97, 3);

-- --------------------------------------------------------

--
-- Table structure for table `planes`
--

CREATE TABLE IF NOT EXISTS `planes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufactur_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `plane_type_id` int(11) NOT NULL,
  `plane_modification_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_planes_manufacturers1_idx` (`manufactur_id`),
  KEY `fk_planes_types1_idx` (`plane_type_id`),
  KEY `fk_planes_modifications1_idx` (`plane_modification_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `planes`
--

INSERT INTO `planes` (`id`, `manufactur_id`, `name`, `plane_type_id`, `plane_modification_id`, `status`) VALUES
(1, 1, 'AN-70', 1, 1, 1),
(2, 1, 'RUSLAN-K140', 1, 1, 1),
(3, 1, 'BOING-170', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `plane_modifications`
--

CREATE TABLE IF NOT EXISTS `plane_modifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `plane_types_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plane_modifications_plane_types1_idx` (`plane_types_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `plane_modifications`
--

INSERT INTO `plane_modifications` (`id`, `name`, `plane_types_id`) VALUES
(1, 'MODIF_1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plane_types`
--

CREATE TABLE IF NOT EXISTS `plane_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plane_types_manufacturers1_idx` (`manufacturers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `plane_types`
--

INSERT INTO `plane_types` (`id`, `name`, `manufacturers_id`) VALUES
(1, 'REGULAR', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `serial_number` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `companies_id` int(11) NOT NULL,
  `countries_id` int(10) unsigned NOT NULL,
  `planes_id` int(11) NOT NULL,
  `airports_id` int(11) NOT NULL,
  `tech_type_id` int(11) NOT NULL,
  `rating_visitors` double DEFAULT NULL,
  `rating_editors` double DEFAULT NULL,
  `type` enum('photo','video') CHARACTER SET utf8 DEFAULT NULL,
  `reg_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_advertisments_users1_idx` (`users_id`),
  KEY `fk_photos_posts_companies1_idx` (`companies_id`),
  KEY `fk_photos_posts_countries1_idx` (`countries_id`),
  KEY `fk_photos_posts_planes1_idx` (`planes_id`),
  KEY `fk_photos_posts_airports1_idx` (`airports_id`),
  KEY `fk_photos_posts_tech_type1_idx` (`tech_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=98 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `users_id`, `serial_number`, `description`, `date`, `created_at`, `companies_id`, `countries_id`, `planes_id`, `airports_id`, `tech_type_id`, `rating_visitors`, `rating_editors`, `type`, `reg_code`) VALUES
(88, 3, 'e234212223', 'Some descr 1', '2012-08-28 00:00:00', '2012-08-28 18:19:17', 2, 2, 1, 2, 1, 4.23, 4.22, 'photo', '11111543'),
(89, 3, 'sdafes', 'Some descr 2', '2012-08-28 00:00:00', '2012-08-28 18:19:50', 1, 3, 2, 2, 1, 4.65, 3.87, 'photo', '43453223'),
(90, 3, '24523', 'Some descr 3', '2012-08-28 00:00:00', '2012-08-28 18:20:28', 1, 1, 3, 3, 1, 2.83, 3.48, 'photo', '43453223'),
(91, 3, 'e234212223', 'Some descr 3', '2012-08-28 00:00:00', '2012-08-28 18:20:54', 2, 2, 3, 2, 1, 4.91, 4.01, 'photo', '43453223'),
(92, 3, 'e234212223', 'Some descr 5', '2012-08-28 00:00:00', '2012-08-28 18:21:27', 3, 1, 2, 2, 3, 4.97, 4.36, 'photo', '343223'),
(93, 3, '56534', 'Some descr 6', '2012-08-28 00:00:00', '2012-08-28 18:21:57', 2, 1, 1, 2, 1, 3.24, 4.33, 'photo', '34322312'),
(94, 3, '674535', 'Some descr 7', '2012-08-28 00:00:00', '2012-08-28 18:22:24', 1, 1, 3, 2, 1, 3.78, 4.9, 'photo', '343223'),
(95, 3, '675355', 'Some descr 8', '2012-08-28 00:00:00', '2012-08-28 18:22:53', 1, 1, 2, 2, 1, 4.32, 4.12, 'photo', '565454'),
(96, 3, '65435', 'Some descr 9', '2012-08-28 00:00:00', '2012-08-28 18:23:25', 1, 2, 3, 2, 3, 3.69, 3.73, 'photo', '32423455'),
(97, 3, '54546', 'Some descr 10', '2012-08-28 00:00:00', '2012-08-28 18:23:57', 2, 1, 2, 3, 1, 4.78, 4.35, 'photo', '6754645');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `desc`) VALUES
(1, 'admin', ''),
(2, 'login', '');

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `fk_users_has_roles` (`user_id`),
  KEY `fk_roles_users_to_roles` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles_users`
--

INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES
(1, 2),
(3, 2),
(13, 2),
(15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tech_types`
--

CREATE TABLE IF NOT EXISTS `tech_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tech_types`
--

INSERT INTO `tech_types` (`id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Table structure for table `tech_type_langs`
--

CREATE TABLE IF NOT EXISTS `tech_type_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lang` int(11) NOT NULL,
  `name` varchar(356) DEFAULT NULL,
  `tech_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photos_types_lang_photos_types1_idx` (`tech_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tech_type_langs`
--

INSERT INTO `tech_type_langs` (`id`, `id_lang`, `name`, `tech_type_id`) VALUES
(1, 1, 'tech_type_1', 1),
(2, 1, 'tech_type_2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8 NOT NULL,
  `email` varchar(127) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  `activation` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pwd_change` tinyint(1) NOT NULL DEFAULT '0',
  `email_change` varchar(127) CHARACTER SET utf8 DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `moderated` tinyint(1) DEFAULT '0',
  `login_from` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `site` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `about` text CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phone`, `password`, `created_at`, `last_login`, `activation`, `pwd_change`, `email_change`, `active`, `moderated`, `login_from`, `site`, `about`) VALUES
(3, 'TAEAS', 'tar@g.com', '09739487856', '3603c1af0267e260e1ab6f3230cb26f4372754476dd80a9d7c', '2012-08-27 00:00:00', 1346064140, 'afb5194e7b1074150b8b1905a58f9094c3e87638', 0, NULL, 1, 0, NULL, 'www.g.com', 'asa');

-- --------------------------------------------------------

--
-- Table structure for table `user_tokens`
--

CREATE TABLE IF NOT EXISTS `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(32) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_tokens_users1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usrs`
--

CREATE TABLE IF NOT EXISTS `usrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL COMMENT 'логин',
  `email` varchar(127) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `password` char(50) NOT NULL,
  `created_at` date DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  `activation` varchar(50) DEFAULT NULL,
  `pwd_change` tinyint(1) NOT NULL DEFAULT '0',
  `email_change` varchar(127) DEFAULT NULL,
  `active` enum('0','1') DEFAULT '1',
  `moderated` enum('0','1') DEFAULT '0',
  `login_from` varchar(45) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `about` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `id_3` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `usrs`
--

INSERT INTO `usrs` (`id`, `username`, `email`, `phone`, `password`, `created_at`, `last_login`, `activation`, `pwd_change`, `email_change`, `active`, `moderated`, `login_from`, `site`, `about`) VALUES
(1, 'TARAS', 'tarqq@g.com', '09739487856', '42dc56ff859eecebbaccd63101829be702a8db4aa69c7a651d', '2012-08-27', 1346062920, 'c82822cf9062c9745fbfd65b621ec6a9fd719898', 0, NULL, '1', '0', NULL, 'www.g.com', 'qsx');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `posts_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_videos_users1_idx` (`users_id`),
  KEY `fk_videos_photos_posts1_idx` (`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airports`
--
ALTER TABLE `airports`
  ADD CONSTRAINT `fk_airports_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_airports_city2` FOREIGN KEY (`countries_id`) REFERENCES `city` (`countries_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `airports_langs`
--
ALTER TABLE `airports_langs`
  ADD CONSTRAINT `fk_airports_lang_airports1` FOREIGN KEY (`airports_id`) REFERENCES `airports` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `fk_albums_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fk_city_countries100` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `city_lang`
--
ALTER TABLE `city_lang`
  ADD CONSTRAINT `fk_city_lang_city00` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `countries_langs`
--
ALTER TABLE `countries_langs`
  ADD CONSTRAINT `fk_countries_lang_countries1` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news_lang`
--
ALTER TABLE `news_lang`
  ADD CONSTRAINT `fk_news_lang_news1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pages_lang`
--
ALTER TABLE `pages_lang`
  ADD CONSTRAINT `fk_pages_lang_pages1` FOREIGN KEY (`pages_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photos_albums`
--
ALTER TABLE `photos_albums`
  ADD CONSTRAINT `photos_albums_ibfk_3` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `photos_albums_ibfk_1` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `photos_categories`
--
ALTER TABLE `photos_categories`
  ADD CONSTRAINT `photos_categories_ibfk_4` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `photos_categories_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `fk_pictures_advertisments1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pictures_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `planes`
--
ALTER TABLE `planes`
  ADD CONSTRAINT `fk_planes_manufacturers1` FOREIGN KEY (`manufactur_id`) REFERENCES `manufacturers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_planes_modifications1` FOREIGN KEY (`plane_modification_id`) REFERENCES `plane_modifications` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_planes_types1` FOREIGN KEY (`plane_type_id`) REFERENCES `plane_types` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `plane_modifications`
--
ALTER TABLE `plane_modifications`
  ADD CONSTRAINT `fk_plane_modifications_plane_types1` FOREIGN KEY (`plane_types_id`) REFERENCES `plane_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `plane_types`
--
ALTER TABLE `plane_types`
  ADD CONSTRAINT `fk_plane_types_manufacturers1` FOREIGN KEY (`manufacturers_id`) REFERENCES `manufacturers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_photos_posts_airports1` FOREIGN KEY (`airports_id`) REFERENCES `airports` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_photos_posts_companies1` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_photos_posts_countries1` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_photos_posts_planes1` FOREIGN KEY (`planes_id`) REFERENCES `planes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_photos_posts_tech_type1` FOREIGN KEY (`tech_type_id`) REFERENCES `tech_types` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_photos_posts_users_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tech_type_langs`
--
ALTER TABLE `tech_type_langs`
  ADD CONSTRAINT `fk_photos_types_lang_photos_types1` FOREIGN KEY (`tech_type_id`) REFERENCES `tech_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `fk_user_tokens_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `fk_videos_photos_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_videos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
