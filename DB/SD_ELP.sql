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
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL DEFAULT 'user',
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `topic` ;

CREATE TABLE IF NOT EXISTS `topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `log` ;

CREATE TABLE IF NOT EXISTS `log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `time_stamp` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `topic_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_log_user_idx` (`user_id` ASC),
  INDEX `fk_log_content_index1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_log_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_content_index1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image` ;

CREATE TABLE IF NOT EXISTS `image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content_img_url` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resource` ;

CREATE TABLE IF NOT EXISTS `resource` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `resource_url` VARCHAR(5000) NOT NULL,
  `topic_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `image_id` INT NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_resource_images1_idx` (`image_id` ASC),
  INDEX `fk_resource_content_index1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_resource_images1`
    FOREIGN KEY (`image_id`)
    REFERENCES `image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resource_content_index1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `content` ;

CREATE TABLE IF NOT EXISTS `content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `topic_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_content_topic1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_content_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profile` ;

CREATE TABLE IF NOT EXISTS `profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `image_id` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `user_id` INT NOT NULL,
  `job_title` VARCHAR(100) NULL,
  `about` VARCHAR(2500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_image1_idx` (`image_id` ASC),
  INDEX `fk_profile_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_profile_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `topic_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `topic_comment` ;

CREATE TABLE IF NOT EXISTS `topic_comment` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `topic_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `content` TEXT NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_post_topic1_idx` (`topic_id` ASC),
  INDEX `fk_post_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_post_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `topic_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `topic_image` ;

CREATE TABLE IF NOT EXISTS `topic_image` (
  `topic_id` INT NOT NULL,
  `image_id` INT NOT NULL,
  PRIMARY KEY (`topic_id`, `image_id`),
  INDEX `fk_topic_image_image1_idx` (`image_id` ASC),
  CONSTRAINT `fk_topic_image_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_topic_image_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `image` (`id`)
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
INSERT INTO `user` (`id`, `username`, `password`, `role`, `created_at`, `updated_at`, `active`) VALUES (1, 'admin', 'admin', 'ADMIN', '2020-01-23', '2020-01-23', 1);
INSERT INTO `user` (`id`, `username`, `password`, `role`, `created_at`, `updated_at`, `active`) VALUES (2, 'reactguy', 'reactguy', 'USER', '2020-01-24', '2020-01-24', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `topic`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `topic` (`id`, `title`, `created_at`, `updated_at`, `active`) VALUES (1, 'test', '2020-01-23', '2020-01-23', NULL);
INSERT INTO `topic` (`id`, `title`, `created_at`, `updated_at`, `active`) VALUES (2, 'react_test', '2020-01-24', '2020-01-24', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `log`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `log` (`id`, `time_stamp`, `user_id`, `topic_id`) VALUES (1, '2020-01-23', 1, 1);
INSERT INTO `log` (`id`, `time_stamp`, `user_id`, `topic_id`) VALUES (2, '2020-01-24', 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `image`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `image` (`id`, `content_img_url`) VALUES (1, 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png');
INSERT INTO `image` (`id`, `content_img_url`) VALUES (2, 'https://reactjs.org/logo-og.png');

COMMIT;


-- -----------------------------------------------------
-- Data for table `resource`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `resource` (`id`, `title`, `resource_url`, `topic_id`, `created_at`, `updated_at`, `image_id`, `active`) VALUES (1, 'test', 'www.google.com', 1, '2020-01-23', '2020-01-23', NULL, NULL);
INSERT INTO `resource` (`id`, `title`, `resource_url`, `topic_id`, `created_at`, `updated_at`, `image_id`, `active`) VALUES (2, 'react_test', 'https://reactjs.org/', 2, '2020-01-24', '2020-01-24', 2, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `content`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `content` (`id`, `content`, `topic_id`, `created_at`, `updated_at`, `active`) VALUES (1, 'test', 1, '2020-01-23', '2020-01-23', NULL);
INSERT INTO `content` (`id`, `content`, `topic_id`, `created_at`, `updated_at`, `active`) VALUES (2, 'React has been designed from the start for gradual adoption, and you can use as little or as much React as you need. Whether you want to get a taste of React, add some interactivity to a simple HTML page, or start a complex React-powered app, the links in this section will help you get started.\n\n', 2, '2020-01-24', '2020-01-24', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `profile` (`id`, `first_name`, `last_name`, `image_id`, `email`, `user_id`, `job_title`, `about`) VALUES (1, 'test', 'test', 1, 'test@test.com', 1, NULL, NULL);
INSERT INTO `profile` (`id`, `first_name`, `last_name`, `image_id`, `email`, `user_id`, `job_title`, `about`) VALUES (2, 'Java', 'Script', 2, 'reacttest@test.com', 2, 'React Developer', 'Been programming since yesterday');

COMMIT;


-- -----------------------------------------------------
-- Data for table `topic_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `topic_comment` (`id`, `title`, `created_at`, `updated_at`, `topic_id`, `user_id`, `content`, `active`) VALUES (1, 'test', '2020-01-23', '2020-01-23', 1, 1, 'test', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `topic_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `topic_image` (`topic_id`, `image_id`) VALUES (1, 1);
INSERT INTO `topic_image` (`topic_id`, `image_id`) VALUES (2, 2);

COMMIT;

