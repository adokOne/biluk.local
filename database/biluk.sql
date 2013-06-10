SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `biluk` DEFAULT CHARACTER SET utf8 ;
USE `biluk` ;

-- -----------------------------------------------------
-- Table `biluk`.`modules`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `biluk`.`modules` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `icon` VARCHAR(16) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `class` VARCHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `parent_id` INT(10) UNSIGNED NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `biluk`.`roles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `biluk`.`roles` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `desc` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `uniq_name` (`name` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `biluk`.`roles_users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `biluk`.`roles_users` (
  `user_id` INT(11) NOT NULL ,
  `role_id` INT(11) UNSIGNED NOT NULL ,
  PRIMARY KEY (`role_id`, `user_id`) ,
  INDEX `fk_users_has_roles` (`user_id` ASC) ,
  INDEX `fk_roles_users_to_roles` (`role_id` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `biluk`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `biluk`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(45) NOT NULL COMMENT 'логин' ,
  `email` VARCHAR(127) NOT NULL ,
  `phone` VARCHAR(45) NULL DEFAULT NULL ,
  `password` CHAR(50) NOT NULL ,
  `created_at` DATE NULL DEFAULT NULL ,
  `last_login` INT(11) NULL DEFAULT NULL ,
  `activation` VARCHAR(50) NULL DEFAULT NULL ,
  `pwd_change` TINYINT(1) NOT NULL DEFAULT '0' ,
  `email_change` VARCHAR(127) NULL DEFAULT NULL ,
  `active` ENUM('0','1') NULL DEFAULT '1' ,
  `moderated` ENUM('0','1') NULL DEFAULT '0' ,
  `login_from` VARCHAR(45) NULL DEFAULT NULL ,
  `site` VARCHAR(255) NULL DEFAULT NULL ,
  `about` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `login_UNIQUE` (`username` ASC) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `biluk`.`user_tokens`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `biluk`.`user_tokens` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `user_id` INT(11) NOT NULL ,
  `user_agent` VARCHAR(40) NOT NULL ,
  `token` VARCHAR(32) NOT NULL ,
  `created` INT(10) UNSIGNED NOT NULL ,
  `expires` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `uniq_token` (`token` ASC) ,
  INDEX `fk_user_tokens_users1` (`user_id` ASC) ,
  CONSTRAINT `fk_user_tokens_users1`
    FOREIGN KEY (`user_id` )
    REFERENCES `biluk`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
