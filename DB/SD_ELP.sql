-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SD_ELP
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SD_ELP` ;

-- -----------------------------------------------------
-- Schema SD_ELP
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SD_ELP` DEFAULT CHARACTER SET utf8 ;
USE `SD_ELP` ;

-- -----------------------------------------------------
-- Table `images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `images` ;

CREATE TABLE IF NOT EXISTS `images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content_img_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL DEFAULT 'user',
  `active` TINYINT NULL DEFAULT 1,
  `email` VARCHAR(50) NULL,
  `images_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_images1_idx` (`images_id` ASC),
  CONSTRAINT `fk_user_images1`
    FOREIGN KEY (`images_id`)
    REFERENCES `images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `written_content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `written_content` ;

CREATE TABLE IF NOT EXISTS `written_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `content` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content_index`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `content_index` ;

CREATE TABLE IF NOT EXISTS `content_index` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `images_id` INT NOT NULL,
  `written_content_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_content_index_images1_idx` (`images_id` ASC),
  INDEX `fk_content_index_written_content1_idx` (`written_content_id` ASC),
  CONSTRAINT `fk_content_index_images1`
    FOREIGN KEY (`images_id`)
    REFERENCES `images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_content_index_written_content1`
    FOREIGN KEY (`written_content_id`)
    REFERENCES `written_content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `log` ;

CREATE TABLE IF NOT EXISTS `log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `time_stamp` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `content_index_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_log_user_idx` (`user_id` ASC),
  INDEX `fk_log_content_index1_idx` (`content_index_id` ASC),
  CONSTRAINT `fk_log_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_content_index1`
    FOREIGN KEY (`content_index_id`)
    REFERENCES `content_index` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resource` ;

CREATE TABLE IF NOT EXISTS `resource` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `resource_url` VARCHAR(2000) NOT NULL,
  `images_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_resource_images1_idx` (`images_id` ASC),
  CONSTRAINT `fk_resource_images1`
    FOREIGN KEY (`images_id`)
    REFERENCES `images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS sdelpuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'sdelpuser'@'localhost' IDENTIFIED BY '694881fCmJ';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'sdelpuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `user` (`id`, `username`, `password`, `role`, `active`, `email`, `images_id`) VALUES (1, 'admin', 'admin', 'ADMIN', 1, NULL, NULL);

COMMIT;

