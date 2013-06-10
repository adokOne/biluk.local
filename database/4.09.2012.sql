/*
SQLyog Community v9.63 
MySQL - 5.1.63-0ubuntu0.11.10.1 : Database - spotters_new
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
  `country_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_airports_city1` (`city_id`),
  KEY `fk_country` (`country_id`),
  CONSTRAINT `fk_airports_city1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_country_airports` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `airports` */

insert  into `airports`(`id`,`status`,`IATA`,`ICAO`,`city_id`,`latitude`,`longitude`,`country_id`) values (5,1,'ADT','ACUT',10,0,0,12),(6,1,'ASR','FGTE',12,NULL,NULL,14);

/*Table structure for table `airports_langs` */

DROP TABLE IF EXISTS `airports_langs`;

CREATE TABLE `airports_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `id_lang` int(3) DEFAULT NULL,
  `airport_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gergerger` (`airport_id`),
  CONSTRAINT `fk_airports_lang` FOREIGN KEY (`airport_id`) REFERENCES `airports` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `airports_langs` */

insert  into `airports_langs`(`id`,`name`,`id_lang`,`airport_id`) values (22,'Борисполь',0,5),(23,'Бориспіль',1,5),(24,'Borispol',2,5),(25,'Домодедово',0,6),(26,'Домодедово',1,6),(27,'Domodedovo',2,6);

/*Table structure for table `albums` */

DROP TABLE IF EXISTS `albums`;

CREATE TABLE `albums` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dedede` (`user_id`),
  CONSTRAINT `dededede` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `albums` */

insert  into `albums`(`id`,`name`,`description`,`created_at`,`updated_at`,`user_id`) values (1,'sgsdgvsd','ssvsdvsdvs','2012-09-03 17:26:44','2012-09-04 17:26:47',1),(2,'fwfweefweefw','fwefwefwe','2012-09-11 17:31:57','2012-09-03 17:31:52',1),(3,'sgsdgvsd','ssvsdvsdvs','2012-09-03 17:26:44','2012-09-04 17:26:47',1);

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `categories` */

/*Table structure for table `cities` */

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '1',
  `country_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_city_countriy1` (`country_id`),
  CONSTRAINT `fk_city_countries100` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `cities` */

insert  into `cities`(`id`,`status`,`country_id`) values (10,1,12),(12,1,14);

/*Table structure for table `cities_langs` */

DROP TABLE IF EXISTS `cities_langs`;

CREATE TABLE `cities_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lang` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_lang_city` (`city_id`),
  CONSTRAINT `fk_city_lang_city00` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Data for the table `cities_langs` */

insert  into `cities_langs`(`id`,`id_lang`,`name`,`city_id`) values (37,0,'Киев',10),(38,1,'Київ',10),(39,2,'Kiev',10),(40,0,'Москва',12),(41,1,'Москва',12),(42,2,'Moscow',12);

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
  KEY `fk_comments_comments1` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `comments` */

insert  into `comments`(`id`,`user_id`,`parent_id`,`item_type`,`text`,`active`,`date`,`item_id`) values (3,1,NULL,'photos','wegfwegwegwegwegwegwgwegwgw',1,'2012-09-10 18:10:03',1),(4,1,NULL,'photos','wegfwegwegwegwegwegwgwegwgw',1,'2012-09-03 18:10:03',1),(5,1,NULL,'photos','wegfwegwegwegwegwegwgwegwgw',1,'2012-09-03 18:10:03',1);

/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `has_logo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `companies` */

insert  into `companies`(`id`,`name`,`status`,`has_logo`) values (2,'Aerosvit',1,1),(3,'Russian airlaines',1,0),(4,'МАУ',1,0);

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `countries` */

insert  into `countries`(`id`,`status`) values (12,1),(14,1);

/*Table structure for table `countries_langs` */

DROP TABLE IF EXISTS `countries_langs`;

CREATE TABLE `countries_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lang` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_countries_langs` (`country_id`),
  CONSTRAINT `fwefwefwefwefw` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `countries_langs` */

insert  into `countries_langs`(`id`,`id_lang`,`name`,`country_id`) values (40,0,'Украина',12),(41,1,'Украина',12),(42,2,'Ukraine',12),(43,0,'Россия',14),(44,1,'Росія',14),(45,2,'Russia',14);

/*Table structure for table `lang` */

DROP TABLE IF EXISTS `lang`;

CREATE TABLE `lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `lang` */

/*Table structure for table `manufacturers` */

DROP TABLE IF EXISTS `manufacturers`;

CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `has_logo` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `manufacturers` */

insert  into `manufacturers`(`id`,`name`,`status`,`has_logo`) values (3,'Antonov',1,1);

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
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_news_users1` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`status`,`type`,`user_id`,`date`) values (1,1,'telegraph',1,'2012-09-05'),(2,1,'telegraph',1,'2012-09-04');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `news_langs` */

insert  into `news_langs`(`id`,`title`,`meta_desc`,`meta_keywords`,`seo_name`,`text`,`news_id`,`id_lang`) values (2,'wefwefwef','wefewf','wefwef','wefewfweef','<p>fwefwefwefwefwef</p>',2,0),(5,'test tes test test','test tes test test','test tes test test','test tes test test','<p>wrgwqregqregerge</p>\n<p>gewr</p>\n<p>gergerger</p>\n<p>fwefwefwe</p>',1,0);

/*Table structure for table `pages` */

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pages` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pages_langs` */

/*Table structure for table `photos_categories` */

DROP TABLE IF EXISTS `photos_categories`;

CREATE TABLE `photos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `photos_categories` */

/*Table structure for table `picture_albums` */

DROP TABLE IF EXISTS `picture_albums`;

CREATE TABLE `picture_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_id` int(11) NOT NULL,
  `album_id` int(10) unsigned NOT NULL,
  `picture_album_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ewfwefwef` (`picture_id`),
  KEY `wefwefwefwe` (`album_id`),
  KEY `wefwefwefwfgggg` (`picture_album_id`),
  CONSTRAINT `fk_photos_albums_albums1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_photos_albums_pictures1` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Data for the table `picture_albums` */

insert  into `picture_albums`(`id`,`picture_id`,`album_id`,`picture_album_id`) values (40,2,1,2),(41,3,1,3),(42,2,2,2);

/*Table structure for table `pictures` */

DROP TABLE IF EXISTS `pictures`;

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('photo','picture') DEFAULT 'photo',
  `post_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wfwefwe` (`post_id`),
  CONSTRAINT `fk_pictures_addddd` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `pictures` */

insert  into `pictures`(`id`,`name`,`type`,`post_id`) values (2,'dwedwedwed','photo',1),(3,'dwedwedwed','photo',1),(4,'dwedwedwed','photo',1);

/*Table structure for table `plane_modifications` */

DROP TABLE IF EXISTS `plane_modifications`;

CREATE TABLE `plane_modifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `plane_type_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plane_modifications_plane_typ` (`plane_type_id`),
  KEY `fk_plane_manufacurer` (`manufacturer_id`),
  CONSTRAINT `fk_plane_manuf` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_plane_modifications_plane_types1` FOREIGN KEY (`plane_type_id`) REFERENCES `plane_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `plane_modifications` */

insert  into `plane_modifications`(`id`,`name`,`plane_type_id`,`manufacturer_id`) values (6,'-',7,3),(7,'a',7,3);

/*Table structure for table `plane_types` */

DROP TABLE IF EXISTS `plane_types`;

CREATE TABLE `plane_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plane_types_manufacturer1` (`manufacturer_id`),
  CONSTRAINT `fk_plane_types_manufacturers1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `plane_types` */

insert  into `plane_types`(`id`,`name`,`manufacturer_id`) values (7,'120',3);

/*Table structure for table `planes` */

DROP TABLE IF EXISTS `planes`;

CREATE TABLE `planes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `companies_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `plane_type_id` int(11) NOT NULL,
  `plane_modification_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_planes_companies_id` (`companies_id`),
  KEY `fk_planes_manufacturer` (`manufacturer_id`),
  KEY `fk_planes_type` (`plane_type_id`),
  KEY `fk_planes_modification` (`plane_modification_id`),
  CONSTRAINT `fk_planes_companies_id` FOREIGN KEY (`companies_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_planes_manufacturers` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_planes_modifications` FOREIGN KEY (`plane_modification_id`) REFERENCES `plane_modifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_planes_types` FOREIGN KEY (`plane_type_id`) REFERENCES `plane_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `planes` */

insert  into `planes`(`id`,`name`,`status`,`companies_id`,`manufacturer_id`,`plane_type_id`,`plane_modification_id`,`company_id`) values (4,NULL,1,2,3,7,6,2),(5,NULL,1,NULL,3,7,7,0);

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `countries_id` int(10) unsigned NOT NULL,
  `tech_type_id` int(11) NOT NULL,
  `rating` double DEFAULT NULL,
  `type` enum('photo','video') COLLATE utf8_bin DEFAULT NULL,
  `reg_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `views_count` int(11) unsigned DEFAULT '0',
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `airport_id` int(11) NOT NULL,
  `plane_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photos_posts_countries1` (`countries_id`),
  KEY `fk_photos_posts_tech_type1` (`tech_type_id`),
  KEY `ddddddd` (`company_id`),
  KEY `rgerger` (`user_id`),
  KEY `ffewfwefwefw` (`airport_id`),
  KEY `wefwefwe` (`plane_id`),
  CONSTRAINT `dgege` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_photos_posts_airports1` FOREIGN KEY (`airport_id`) REFERENCES `airports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_photos_posts_countries1` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_photos_posts_planes1` FOREIGN KEY (`plane_id`) REFERENCES `planes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_photos_posts_tech_type1` FOREIGN KEY (`tech_type_id`) REFERENCES `tech_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `posts` */

insert  into `posts`(`id`,`serial_number`,`description`,`date`,`created_at`,`countries_id`,`tech_type_id`,`rating`,`type`,`reg_code`,`views_count`,`company_id`,`user_id`,`airport_id`,`plane_id`) values (1,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-04','2012-09-04 14:47:56',12,1,0.333,'photo','VP-BQS',162,2,1,5,4),(2,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-11','2012-09-10 14:48:00',12,1,0.333,'photo','VP-BQS',15,2,1,5,5),(3,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(44,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(45,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(46,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(47,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(48,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(49,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(50,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(51,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(52,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(53,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(54,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(55,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4),(56,'cn 2912','Впервые в Одессе - А-321 ! Длинная \"колбаса\" однако ) В этот раз солнце было менее благосклонно к нам, низкая облачность и дымка стелились прям по ВПП. Получилось как то так. 3-ий борт SSJ Арофлота все стоит.','2012-09-19','2012-09-04 14:48:03',12,1,0.333,'photo','VP-BQS',1,2,1,5,4);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`desc`) values (2,'admin','admin');

/*Table structure for table `roles_users` */

DROP TABLE IF EXISTS `roles_users`;

CREATE TABLE `roles_users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `fk_users_has_roles` (`user_id`),
  KEY `fk_roles_users_to_roles` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `roles_users` */

insert  into `roles_users`(`user_id`,`role_id`) values (1,2);

/*Table structure for table `tech_types` */

DROP TABLE IF EXISTS `tech_types`;

CREATE TABLE `tech_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tech_types` */

insert  into `tech_types`(`id`) values (1),(2),(3);

/*Table structure for table `tech_types_langs` */

DROP TABLE IF EXISTS `tech_types_langs`;

CREATE TABLE `tech_types_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lang` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tech_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photos_types_lang_photos_types1` (`tech_type_id`),
  CONSTRAINT `fk_photos_types_lang_photos_types1` FOREIGN KEY (`tech_type_id`) REFERENCES `tech_types` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tech_types_langs` */

insert  into `tech_types_langs`(`id`,`id_lang`,`name`,`tech_type_id`) values (1,0,'Самолет',1),(2,0,'Двигатель',2),(3,0,'Аэропорт',3);

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
  CONSTRAINT `fk_user_tokens_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_tokens` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
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
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`email`,`phone`,`password`,`created_at`,`last_login`,`activation`,`pwd_change`,`email_change`,`active`,`moderated`,`login_from`,`site`,`about`,`name`) values (1,'admin','admin@com.ua','093779996','5226beeeb71fb3d5a4cdb2069e4292455c06c8d806e246c204','2012-05-28',1346743193,NULL,0,NULL,'1','0',NULL,'www.example.com','rwerwe w ww fdf vdf vbrg wv wrgbrg bg br bwr','David Cherkasov');

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
  CONSTRAINT `fk_videos_photos_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_videos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `videos` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
