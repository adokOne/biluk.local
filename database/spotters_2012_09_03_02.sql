/*
SQLyog Community v10.2 
MySQL - 5.5.25a : Database - spotters_new
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`spotters_new` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `spotters_new`;

/*Table structure for table `airports` */

DROP TABLE IF EXISTS `airports`;

CREATE TABLE `airports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '1',
  `IATA` varchar(45) DEFAULT NULL,
  `ICAO` varchar(45) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `countries_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_airports_city1` (`city_id`),
  KEY `fk_countries` (`countries_id`),
  CONSTRAINT `dsvsdvs` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `fk_airports_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `airports` */

insert  into `airports`(`id`,`status`,`IATA`,`ICAO`,`city_id`,`latitude`,`longitude`,`countries_id`) values (1,1,'UKKL','LWO',1,49.8148932379223,23.9506244659424,1),(2,1,'DDDR','DWO',1,50.4480666188397,30.5131442715137,1),(3,1,'RFTW','OEM',3,55.411296848852,37.9029948879688,2),(4,0,'rthrt','hrthrthr',2,0,0,1);

/*Table structure for table `airports_langs` */

DROP TABLE IF EXISTS `airports_langs`;

CREATE TABLE `airports_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `id_lang` int(3) DEFAULT NULL,
  `airports_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_airports_lang` (`airports_id`),
  CONSTRAINT `fk_airports_lang` FOREIGN KEY (`airports_id`) REFERENCES `airports` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `airports_langs` */

insert  into `airports_langs`(`id`,`name`,`id_lang`,`airports_id`) values (1,'Скнилов',0,1),(2,'Скнилів',1,1),(3,'Sknilov',2,1),(7,'Домодедово',0,3),(8,'Домодедово',1,3),(9,'Domodedovo',2,3),(10,'Борисполь',0,2),(11,'Бориспіль',1,2),(12,'Borispol',2,2),(16,'rthjrthrt',0,4),(17,'hrthrthrt',1,4),(18,'hrthrth',2,4);

/*Table structure for table `albums` */

DROP TABLE IF EXISTS `albums`;

CREATE TABLE `albums` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_albums_users1` (`users_id`),
  KEY `users_id` (`users_id`),
  KEY `id` (`id`),
  CONSTRAINT `albums_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `albums` */

insert  into `albums`(`id`,`name`,`description`,`users_id`,`created_at`,`updated_at`) values (1,'Album_1','Description of Album_1',1,'2012-09-01 13:53:45','2012-09-02 13:53:48'),(2,'Album_2','Description of Album_2',1,'2012-09-01 15:15:03','2012-09-07 15:15:07'),(3,'Album_3','Description of Album_3',1,'2012-09-11 15:15:10','2012-09-14 15:15:13');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `categories` */

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '1',
  `countries_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_city_countries1` (`countries_id`),
  CONSTRAINT `fk_city_countries100` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `city` */

insert  into `city`(`id`,`status`,`countries_id`) values (1,1,1),(2,1,1),(3,2,2),(4,1,1);

/*Table structure for table `city_langs` */

DROP TABLE IF EXISTS `city_langs`;

CREATE TABLE `city_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lang` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_lang_city` (`city_id`),
  CONSTRAINT `fk_city_lang_city00` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `city_langs` */

insert  into `city_langs`(`id`,`id_lang`,`name`,`city_id`) values (1,0,'Львов',1),(2,1,'Львів',1),(3,2,'Lvov',1),(4,0,'Киев',2),(5,1,'Київ',2),(6,2,'Kyiv',2),(28,0,'Москва',3),(29,1,'Москва',3),(30,2,'Moscow',3),(31,0,'Винница',4),(32,1,'Вінниця',4),(33,2,'Vinnica',4);

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `item_type` enum('photos','news','video') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `date` datetime NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_FKIndex2` (`item_id`),
  KEY `fk_comments_users1` (`user_id`),
  KEY `fk_comments_comments1` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`),
  KEY `user_id_3` (`user_id`),
  KEY `user_id_4` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;

/*Data for the table `comments` */

insert  into `comments`(`id`,`user_id`,`parent_id`,`item_type`,`text`,`active`,`date`,`item_id`) values (1,1,NULL,'news','gergergqer gerq geqr g erqg eqrgqerg erqg eqrgerqge rqger g eqrчто это? \nБлин, ну вы смешные!)))) \nЭто ж просто железная труба (она же трубная рамка), на которую крепится лампа для освещения светового «маячка» на ВПП. От, блин, дает',1,'2012-09-02 17:49:47',1),(2,1,1,'photos','heherherherherherherher',1,'2012-09-02 18:15:57',2);

/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `has_logo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `companies` */

insert  into `companies`(`id`,`name`,`status`,`has_logo`) values (1,'company 1',1,1),(2,'company 2',1,1),(3,'company 3',1,1);

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `countries` */

insert  into `countries`(`id`,`status`) values (1,1),(2,1);

/*Table structure for table `countries_langs` */

DROP TABLE IF EXISTS `countries_langs`;

CREATE TABLE `countries_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lang` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `countries_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_countries_lang` (`countries_id`),
  CONSTRAINT `fwefwefwefwefw` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `countries_langs` */

insert  into `countries_langs`(`id`,`id_lang`,`name`,`countries_id`) values (1,0,'Украина',1),(2,1,'Україна',1),(3,2,'Ukraine',1),(4,0,'Россия',2),(5,1,'Росія',2),(6,2,'Russia',2);

/*Table structure for table `lang` */

DROP TABLE IF EXISTS `lang`;

CREATE TABLE `lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `lang` */

insert  into `lang`(`id`,`name`,`code`) values (0,'Русский','RU'),(1,'Украинский','UA'),(2,'Английский','ENG');

/*Table structure for table `manufacturers` */

DROP TABLE IF EXISTS `manufacturers`;

CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `has_logo` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `manufacturers` */

insert  into `manufacturers`(`id`,`name`,`status`,`has_logo`) values (1,'Антонов ',1,1),(2,'eregergerg',1,0);

/*Table structure for table `modules` */

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `modules` */

insert  into `modules`(`id`,`name`,`icon`,`class`,`parent_id`) values (1,'Контент','ico_moderated','test',NULL),(2,'Пользователи','ico_news','users',1),(3,'Аеропорты','ico_news','places',1),(4,'Страны / Города','ico_news','countries',1),(5,'Новости','ico_news','news',1),(6,'Статические страницы','ico_news','pages',1),(7,'Комментарии','ico_news','comments',1),(8,'Компании','ico_news','companies',1),(9,'Производители','ico_news','manufacturers',1),(10,'Самолеты','ico_news','planes',1);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT NULL,
  `type` enum('base','telegraph') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `views_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_news_users1` (`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`status`,`type`,`user_id`,`date`,`views_count`) values (1,1,'telegraph',1,'2012-09-04 00:00:00',NULL),(5,1,'telegraph',1,'2012-09-03 00:00:00',NULL),(6,0,'base',1,'2012-09-02 00:00:00',NULL),(7,1,'telegraph',1,'2012-09-03 09:35:00',NULL),(8,1,'base',1,'2012-09-13 09:35:00',NULL),(9,1,'telegraph',1,'2012-09-13 15:35:00',NULL),(10,1,'base',1,'2012-09-21 15:35:47',NULL),(11,1,'telegraph',1,'2012-09-11 15:35:47',NULL),(12,1,'base',1,'2012-09-21 15:35:47',NULL),(13,1,'telegraph',1,'2012-09-24 15:35:47',NULL),(14,1,'telegraph',1,'2012-09-25 15:35:47',NULL),(15,1,'base',1,'2012-09-27 15:35:47',NULL),(16,1,'telegraph',1,'2012-09-29 15:35:47',NULL);

/*Table structure for table `news_langs` */

DROP TABLE IF EXISTS `news_langs`;

CREATE TABLE `news_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `meta_desc` text,
  `meta_keywords` text,
  `seo_name` text,
  `text` text,
  `news_id` int(11) NOT NULL,
  `id_lang` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_news_lang_news1` (`news_id`),
  CONSTRAINT `fk_news_lang_news1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `news_langs` */

insert  into `news_langs`(`id`,`title`,`meta_desc`,`meta_keywords`,`seo_name`,`text`,`news_id`,`id_lang`) values (8,'«Трансаэро» полетит из Внуково в Жуляны 2','dfb','bdfb','fdbvdf','Авиакомпания «Трансаэро» откроет регулярный рейс из московского аэропорта Внуково в киевский Жуляны. Полеты начнутся c 15 июня 2012 г. на самолете Boeing 737. Изначально рейс будет выполняться один раз в день, но в перспективе частота полетов будет доведена до двух ежедневных рейсов. Сейчас авиакомпания «Трансаэро» ожидает приобретения аэропортом Жуляны телетрапа для ускоренного обслуживания пассажиров.',6,1),(14,'«Трансаэро» полетит из Внуково в Жуляны 3','dfbfd','bdfbd','dfbsfd','<b>Авиакомпания «Трансаэро» откроет регулярный рейс из московского аэропорта Внуково в киевский Жуляны. Полеты начнутся c 15 июня 2012 г. на самолете Boeing 737. Изначально рейс будет выполняться один раз в день, но в перспективе частота полетов будет доведена до двух ежедневных рейсов. Сейчас авиакомпания «Трансаэро» ожидает приобретения аэропортом Жуляны телетрапа для ускоренного обслуживания пассажиров.</b>',5,1),(15,'«Трансаэро» полетит из Внуково в Жуляны','gergergerg ee gerg e','erg erg erg eg e g','regegergegerge','<i>Авиакомпания «Трансаэро» откроет регулярный рейс из московского аэропорта Внуково в киевский Жуляны. Полеты начнутся c 15 июня 2012 г. на самолете Boeing 737. Изначально рейс будет выполняться один раз в день, но в перспективе частота полетов будет доведена до двух ежедневных рейсов. Сейчас авиакомпания «Трансаэро» ожидает приобретения аэропортом Жуляны телетрапа для ускоренного обслуживания пассажиров.</i>',1,1),(16,'тестова новина','rrrrrrrrrrrrrrrrrr','rrrrrrrrrrrrrrrrrrrrrrrrrrr','rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr','<p>gerg egeg ge ge ge ge gegegerg ge</p>',1,2),(17,'test news','ttttttttttttttt','ttttttttttttttt','tttttttttttttttttt','<p>tttttttttttttttttttttttttttttttttt</p>',1,2),(18,'«Трансаэро» полетит из Внуково в Жуляны 3','gergergerg ee gerg e','erg erg erg eg e g','regegergegerge','<i>Авиакомпания «Трансаэро» откроет регулярный рейс из московского аэропорта Внуково в киевский Жуляны. Полеты начнутся c 15 июня 2012 г. на самолете Boeing 737. Изначально рейс будет выполняться один раз в день, но в перспективе частота полетов будет доведена до двух ежедневных рейсов. Сейчас авиакомпания «Трансаэро» ожидает приобретения аэропортом Жуляны телетрапа для ускоренного обслуживания пассажиров.</i>\r\n<br>\r\n<b>3</b>',8,1),(19,'«Трансаэро» полетит из Внуково в Жуляны 4','gergergerg ee gerg e','erg erg erg eg e g','regegergegerge','<i>Авиакомпания «Трансаэро» откроет регулярный рейс из московского аэропорта Внуково в киевский Жуляны. Полеты начнутся c 15 июня 2012 г. на самолете Boeing 737. Изначально рейс будет выполняться один раз в день, но в перспективе частота полетов будет доведена до двух ежедневных рейсов. Сейчас авиакомпания «Трансаэро» ожидает приобретения аэропортом Жуляны телетрапа для ускоренного обслуживания пассажиров.</i>\r\n<br>\r\n<b>4</b>',9,1),(20,'«Трансаэро» полетит из Внуково в Жуляны 5','gergergerg ee gerg e','erg erg erg eg e g','regegergegerge','<i>Авиакомпания «Трансаэро» откроет регулярный рейс из московского аэропорта Внуково в киевский Жуляны. Полеты начнутся c 15 июня 2012 г. на самолете Boeing 737. Изначально рейс будет выполняться один раз в день, но в перспективе частота полетов будет доведена до двух ежедневных рейсов. Сейчас авиакомпания «Трансаэро» ожидает приобретения аэропортом Жуляны телетрапа для ускоренного обслуживания пассажиров.</i>\r\n<br>\r\n<b>5</b>',10,1),(21,'«Трансаэро» полетит из Внуково в Жуляны 6','gergergerg ee gerg e','erg erg erg eg e g','regegergegerge','<i>Авиакомпания «Трансаэро» откроет регулярный рейс из московского аэропорта Внуково в киевский Жуляны. Полеты начнутся c 15 июня 2012 г. на самолете Boeing 737. Изначально рейс будет выполняться один раз в день, но в перспективе частота полетов будет доведена до двух ежедневных рейсов. Сейчас авиакомпания «Трансаэро» ожидает приобретения аэропортом Жуляны телетрапа для ускоренного обслуживания пассажиров.</i>\r\n<br>\r\n<b>6</b>',11,1),(22,'«Трансаэро» полетит из Внуково в Жуляны 7','gergergerg ee gerg e','erg erg erg eg e g','regegergegerge','<i>Авиакомпания «Трансаэро» откроет регулярный рейс из московского аэропорта Внуково в киевский Жуляны. Полеты начнутся c 15 июня 2012 г. на самолете Boeing 737. Изначально рейс будет выполняться один раз в день, но в перспективе частота полетов будет доведена до двух ежедневных рейсов. Сейчас авиакомпания «Трансаэро» ожидает приобретения аэропортом Жуляны телетрапа для ускоренного обслуживания пассажиров.</i>\r\n<br>\r\n<b>7</b>',12,1),(23,'«Трансаэро» полетит из Внуково в Жуляны 8','gergergerg ee gerg e','erg erg erg eg e g','regegergegerge','<i>Авиакомпания «Трансаэро» откроет регулярный рейс из московского аэропорта Внуково в киевский Жуляны. Полеты начнутся c 15 июня 2012 г. на самолете Boeing 737. Изначально рейс будет выполняться один раз в день, но в перспективе частота полетов будет доведена до двух ежедневных рейсов. Сейчас авиакомпания «Трансаэро» ожидает приобретения аэропортом Жуляны телетрапа для ускоренного обслуживания пассажиров.</i>\r\n<br>\r\n<b>8</b>',13,1),(24,'«Трансаэро» полетит из Внуково в Жуляны 9','gergergerg ee gerg e','erg erg erg eg e g','regegergegerge','<i>Авиакомпания «Трансаэро» откроет регулярный рейс из московского аэропорта Внуково в киевский Жуляны. Полеты начнутся c 15 июня 2012 г. на самолете Boeing 737. Изначально рейс будет выполняться один раз в день, но в перспективе частота полетов будет доведена до двух ежедневных рейсов. Сейчас авиакомпания «Трансаэро» ожидает приобретения аэропортом Жуляны телетрапа для ускоренного обслуживания пассажиров.</i>\r\n<br>\r\n<b>9</b>',14,1),(25,'«Трансаэро» полетит из Внуково в Жуляны 10','gergergerg ee gerg e','erg erg erg eg e g','regegergegerge','<i>Авиакомпания «Трансаэро» откроет регулярный рейс из московского аэропорта Внуково в киевский Жуляны. Полеты начнутся c 15 июня 2012 г. на самолете Boeing 737. Изначально рейс будет выполняться один раз в день, но в перспективе частота полетов будет доведена до двух ежедневных рейсов. Сейчас авиакомпания «Трансаэро» ожидает приобретения аэропортом Жуляны телетрапа для ускоренного обслуживания пассажиров.</i>\r\n<br>\r\n<b>10</b>',15,1),(26,'«Трансаэро» полетит из Внуково в Жуляны 11','gergergerg ee gerg e','erg erg erg eg e g','regegergegerge','<i>Авиакомпания «Трансаэро» откроет регулярный рейс из московского аэропорта Внуково в киевский Жуляны. Полеты начнутся c 15 июня 2012 г. на самолете Boeing 737. Изначально рейс будет выполняться один раз в день, но в перспективе частота полетов будет доведена до двух ежедневных рейсов. Сейчас авиакомпания «Трансаэро» ожидает приобретения аэропортом Жуляны телетрапа для ускоренного обслуживания пассажиров.</i>\r\n<br>\r\n<b>11</b>',16,1);

/*Table structure for table `pages` */

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `pages` */

insert  into `pages`(`id`,`status`) values (2,1);

/*Table structure for table `pages_langs` */

DROP TABLE IF EXISTS `pages_langs`;

CREATE TABLE `pages_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `meta_desc` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `seo_name` varchar(255) DEFAULT NULL,
  `pages_id` int(11) NOT NULL,
  `id_lang` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pages_lang_pages1` (`pages_id`),
  CONSTRAINT `fk_pages_lang_pages1` FOREIGN KEY (`pages_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `pages_langs` */

insert  into `pages_langs`(`id`,`title`,`text`,`meta_desc`,`meta_keywords`,`seo_name`,`pages_id`,`id_lang`) values (2,'4y54','<p>y45y45y45y54y54y5</p>','y54','y54y','54y45y45y',2,0);

/*Table structure for table `photos_albums` */

DROP TABLE IF EXISTS `photos_albums`;

CREATE TABLE `photos_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `picture_id` (`picture_id`),
  KEY `album_id_2` (`album_id`),
  KEY `album_id_3` (`album_id`),
  CONSTRAINT `photos_albums_ibfk_1` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `photos_albums` */

insert  into `photos_albums`(`id`,`album_id`,`picture_id`) values (40,1,4),(41,3,4),(42,1,4),(43,1,5),(44,1,3),(45,2,3),(46,2,5);

/*Table structure for table `photos_categories` */

DROP TABLE IF EXISTS `photos_categories`;

CREATE TABLE `photos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `photos_categories` */

/*Table structure for table `pictures` */

DROP TABLE IF EXISTS `pictures`;

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pictures_advertisments1` (`post_id`),
  KEY `fk_pictures_users1` (`users_id`),
  CONSTRAINT `fk_pictures_advertisments1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_pictures_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `pictures` */

insert  into `pictures`(`id`,`name`,`post_id`,`users_id`) values (3,'alboms_photo_04.jpg',4,1),(4,'alboms_photo_01.jpg',5,1),(5,'alboms_photo_08.jpg',6,1);

/*Table structure for table `plane_modifications` */

DROP TABLE IF EXISTS `plane_modifications`;

CREATE TABLE `plane_modifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `plane_types_id` int(11) NOT NULL,
  `manufacturers_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plane_modifications_plane_types1` (`plane_types_id`),
  KEY `fk_plane_manuf` (`manufacturers_id`),
  CONSTRAINT `fk_plane_manuf` FOREIGN KEY (`manufacturers_id`) REFERENCES `manufacturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_plane_modifications_plane_types1` FOREIGN KEY (`plane_types_id`) REFERENCES `plane_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `plane_modifications` */

insert  into `plane_modifications`(`id`,`name`,`plane_types_id`,`manufacturers_id`) values (2,'yjrtjurt',6,1),(4,'a',1,1),(5,'b',1,1);

/*Table structure for table `plane_types` */

DROP TABLE IF EXISTS `plane_types`;

CREATE TABLE `plane_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plane_types_manufacturers1` (`manufacturers_id`),
  CONSTRAINT `fk_plane_types_manufacturers1` FOREIGN KEY (`manufacturers_id`) REFERENCES `manufacturers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `plane_types` */

insert  into `plane_types`(`id`,`name`,`manufacturers_id`) values (1,'15339',1),(5,';kjbjkb',1),(6,'hne',1);

/*Table structure for table `planes` */

DROP TABLE IF EXISTS `planes`;

CREATE TABLE `planes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `companies_id` int(11) DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL,
  `plane_types_id` int(11) NOT NULL,
  `plane_modifications_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_planes_companies_id` (`companies_id`),
  KEY `fk_planes_manufacturers` (`manufacturers_id`),
  KEY `fk_planes_types` (`plane_types_id`),
  KEY `fk_planes_modifications` (`plane_modifications_id`),
  CONSTRAINT `fk_planes_companies_id` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_planes_manufacturers` FOREIGN KEY (`manufacturers_id`) REFERENCES `manufacturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_planes_modifications` FOREIGN KEY (`plane_modifications_id`) REFERENCES `plane_modifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_planes_types` FOREIGN KEY (`plane_types_id`) REFERENCES `plane_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `planes` */

insert  into `planes`(`id`,`name`,`status`,`companies_id`,`manufacturers_id`,`plane_types_id`,`plane_modifications_id`) values (3,'AN-140',1,1,1,1,4);

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `companies_id` int(11) NOT NULL,
  `countries_id` int(10) unsigned NOT NULL,
  `planes_id` int(11) NOT NULL,
  `airports_id` int(11) NOT NULL,
  `tech_type_id` int(11) NOT NULL,
  `rating` double DEFAULT NULL,
  `type` enum('photo','video') COLLATE utf8_bin DEFAULT NULL,
  `reg_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `rating_admin` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photos_posts_companies1` (`companies_id`),
  KEY `fk_photos_posts_countries1` (`countries_id`),
  KEY `fk_photos_posts_planes1` (`planes_id`),
  KEY `fk_photos_posts_airports1` (`airports_id`),
  KEY `fk_photos_posts_tech_type1` (`tech_type_id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_photos_posts_airports1` FOREIGN KEY (`airports_id`) REFERENCES `airports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_photos_posts_companies1` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_photos_posts_countries1` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_photos_posts_planes1` FOREIGN KEY (`planes_id`) REFERENCES `planes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_photos_posts_tech_type1` FOREIGN KEY (`tech_type_id`) REFERENCES `tech_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `posts` */

insert  into `posts`(`id`,`serial_number`,`description`,`date`,`created_at`,`companies_id`,`countries_id`,`planes_id`,`airports_id`,`tech_type_id`,`rating`,`type`,`reg_code`,`users_id`,`rating_admin`) values (4,'e234212223','fdg fdgsfs','2012-09-03 00:00:00','2012-09-03 14:51:26',2,1,3,1,1,NULL,'photo','343223',1,NULL),(5,'24523','frfsdas fdasfdas','2012-09-03 00:00:00','2012-09-03 15:15:53',2,2,3,1,2,NULL,'photo','43453223',1,NULL),(6,'e234212','df dssd','2012-09-03 00:00:00','2012-09-03 15:16:30',1,1,3,1,1,NULL,'photo','32423455',1,NULL);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`desc`) values (1,'admin','Administrator');

/*Table structure for table `roles_users` */

DROP TABLE IF EXISTS `roles_users`;

CREATE TABLE `roles_users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `fk_users_has_roles` (`user_id`),
  KEY `fk_roles_users_to_roles` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `roles_users` */

insert  into `roles_users`(`user_id`,`role_id`) values (1,1);

/*Table structure for table `tech_type` */

DROP TABLE IF EXISTS `tech_type`;

CREATE TABLE `tech_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tech_type` */

insert  into `tech_type`(`id`) values (1),(2);

/*Table structure for table `tech_type_langs` */

DROP TABLE IF EXISTS `tech_type_langs`;

CREATE TABLE `tech_type_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lang` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tech_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photos_types_lang_photos_types1` (`tech_type_id`),
  CONSTRAINT `fk_photos_types_lang_photos_types1` FOREIGN KEY (`tech_type_id`) REFERENCES `tech_type` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tech_type_langs` */

insert  into `tech_type_langs`(`id`,`id_lang`,`name`,`tech_type_id`) values (1,1,'Tech type 1',1),(2,1,'Tech type 2',2);

/*Table structure for table `user_tokens` */

DROP TABLE IF EXISTS `user_tokens`;

CREATE TABLE `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(32) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_tokens_users1` (`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_tokens` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL COMMENT 'логин',
  `email` varchar(127) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `activation` varchar(50) DEFAULT NULL,
  `pwd_change` tinyint(1) NOT NULL,
  `email_change` varchar(127) DEFAULT NULL,
  `active` enum('0','1') DEFAULT NULL,
  `moderated` enum('0','1') DEFAULT NULL,
  `login_from` varchar(45) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `about` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`email`,`phone`,`password`,`created_at`,`last_login`,`activation`,`pwd_change`,`email_change`,`active`,`moderated`,`login_from`,`site`,`about`) values (1,'admin','admin@com.ua','admin@com.ua','5226beeeb71fb3d5a4cdb2069e4292455c06c8d806e246c204','2012-05-03 00:00:00','2012-05-11 00:00:00',NULL,0,NULL,'1','0',NULL,'www.example.com','rwerwe w ww fdf vdf vbrg wv wrgbrg bg br bwr');

/*Table structure for table `videos` */

DROP TABLE IF EXISTS `videos`;

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `posts_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_videos_users1` (`users_id`),
  KEY `fk_videos_photos_posts1` (`posts_id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_videos_photos_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `videos` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
