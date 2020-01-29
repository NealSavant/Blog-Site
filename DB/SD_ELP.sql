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
  `title` VARCHAR(100) NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `topic_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `active` TINYINT NULL,
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
INSERT INTO `topic` (`id`, `title`, `created_at`, `updated_at`, `active`) VALUES (1, 'What is Java?', '2020-01-28', '2020-01-28', NULL);
INSERT INTO `topic` (`id`, `title`, `created_at`, `updated_at`, `active`) VALUES (2, 'Java Variables', '2020-01-28', '2020-01-28', NULL);

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
INSERT INTO `image` (`id`, `content_img_url`) VALUES (1, 'https://i.imgur.com/dhMTDTz.png');
INSERT INTO `image` (`id`, `content_img_url`) VALUES (2, 'https://i.imgur.com/TBN3q4j.png');
INSERT INTO `image` (`id`, `content_img_url`) VALUES (3, 'https://i.imgur.com/r8lFFTl.png');
INSERT INTO `image` (`id`, `content_img_url`) VALUES (4, 'https://reactjs.org/logo-og.png');
INSERT INTO `image` (`id`, `content_img_url`) VALUES (DEFAULT, '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `resource`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `resource` (`id`, `title`, `resource_url`, `topic_id`, `created_at`, `updated_at`, `image_id`, `active`) VALUES (1, 'Java Main Website', 'https://www.oracle.com/java', 1, '2020-01-28', '2020-01-28', 1, NULL);
INSERT INTO `resource` (`id`, `title`, `resource_url`, `topic_id`, `created_at`, `updated_at`, `image_id`, `active`) VALUES (2, 'Explaining the java heap vs java stack', 'https://stackify.com/java-heap-vs-stack', 2, '2020-01-28', '2020-01-28', 2, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `content`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `content` (`id`, `content`, `topic_id`, `created_at`, `updated_at`, `active`) VALUES (1, 'An object oriented programming language. The leading philosophy to this language is “Write once, run anywhere.” There are over 3 billion devices using java today. \nTo program in this language, an understanding of the OOP concepts is a necessity. The core principles are Abstraction, Polymorphism, Inheritance, and Encapsulation. (APIE for short)  Let’s go over a brief explanation of these terms. \nAbstraction: Uses abstract classes and interfaces to condense data from objects displaying only the desired information to the user. In short, abstraction means the developer does not have to know all of the internals, just the functional use cases.\nPolymorphism: Heavily reliant on Inheritance, polymorphism refers to the ability for java class objects to be used in different ways.  As an example, a bird is a winged creature, belonging to the classification of animal, possibly having the ability to fly. The ostrich does not inherit the ability to fly, but is an animal, a bird, and has wings. Polymorphism refers to the many different ways an object can be used. In programming terms, there are two important concepts utilized by polymorphism:\n Run-time polymorphism refers to method overriding\nCompile-time polymorphism refers to method overloading\nInheritance: Java objects support one-to-one inheritance from parent to child. There is however, no restriction on the amount of levels in an inheritance structure, or the way they connect further down the tree. Functionally, class objects can inherit properties and methods. Polymorphism allows java objects to use methods or fields from parent classes depending on the requirements in functionality.\nEncapsulation: Protects data from unwanted changes. This can be accomplished by modifying getters and setters and changing access modifiers on field variables. Encapsulation is the process of wrapping the data with an object for protection like your tupperware lunch in the break room fridge.\nAccess Modifer Type Accessibility:\nPrivate: Within the same class\nDefault: Within package\nProtected: Within package, and any subclasses including other packages\nPublic: Visible to classes everywhere', 1, '2020-01-28', '2020-01-28', NULL);
INSERT INTO `content` (`id`, `content`, `topic_id`, `created_at`, `updated_at`, `active`) VALUES (2, 'Two Types of Variables\nVariables can be thought of like containers that hold information. They can be primitive or object (reference) types. A primitive variable denoted in lowercase like “int”, “char” or “double” hold the actual value in memory. An object variable type like “String”, “Thread”, “Array”, or “Object” stores its value in memory on the java heap. These variables can be set to null, and have specific methods allowing manipulation of the data they hold. Whereas primitive data types are manipulated with basic arithmetic.\n\nLocal vs Field Variables\nLocal variables are declared inside of methods or code blocks and belong to the stack. Primitive variables declared locally are literally on the stack, whereas object variables declared locally belongs to the java heap with their reference stored on the stack. They must have a type and a name. The local variables have a scope of usage only within the method or block in which they are created. Field or sometimes referred to as global variables are more inclusive. These belong to the class, and by virtue of belonging to the class, are stored in the heap. In addition to the type and name definition, they have an access modifier of private, public, package, or default. They can also be declared static which initiates the variable for every instance of that class object.\nShadowing is a term you may see which refers to a local variable having the same name as a field variable. To differentiate between the two, use keyword ‘this.’ before the name to choose the field variable which belongs to the class object entity.\n\nAbout the Heap\nThe heap is created when the Java Virtual Machine starts up. As each object is created, space is allocated for it from the free space within the heap. Our reference variables hold locations of objects on the heap. Java manages the heap using ‘garbage collection’, so we never have to delete objects.\n\n\nI hope you learned something from this brief presentation on Java Variables, feel free to leave a comment down below.', 2, '2020-01-28', '2020-01-28', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `profile` (`id`, `first_name`, `last_name`, `image_id`, `email`, `user_id`, `job_title`, `about`) VALUES (1, 'test', 'test', 1, 'test@test.com', 1, NULL, NULL);
INSERT INTO `profile` (`id`, `first_name`, `last_name`, `image_id`, `email`, `user_id`, `job_title`, `about`) VALUES (2, 'Java', 'Script', 4, 'reacttest@test.com', 2, 'React Developer', 'Been programming since yesterday');

COMMIT;


-- -----------------------------------------------------
-- Data for table `topic_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `topic_comment` (`id`, `title`, `content`, `created_at`, `updated_at`, `topic_id`, `user_id`, `active`) VALUES (1, 'test', 'test', '2020-01-23', '2020-01-23', 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `topic_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `topic_image` (`topic_id`, `image_id`) VALUES (1, 1);
INSERT INTO `topic_image` (`topic_id`, `image_id`) VALUES (2, 2);

COMMIT;

