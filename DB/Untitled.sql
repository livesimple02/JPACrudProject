-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema homemaintdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `homemaintdb` ;

-- -----------------------------------------------------
-- Schema homemaintdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `homemaintdb` DEFAULT CHARACTER SET utf8 ;
USE `homemaintdb` ;

-- -----------------------------------------------------
-- Table `task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `task` ;

CREATE TABLE IF NOT EXISTS `task` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `task_name` VARCHAR(200) NOT NULL,
  `description` VARCHAR(1000) NULL,
  `interval` SMALLINT(3) NULL,
  `last_completed` DATE NULL,
  `next_due_date` DATE NULL,
  `instructions_link` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS homeuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'homeuser'@'localhost' IDENTIFIED BY 'homeuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'homeuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `task`
-- -----------------------------------------------------
START TRANSACTION;
USE `homemaintdb`;
INSERT INTO `task` (`id`, `task_name`, `description`, `interval`, `last_completed`, `next_due_date`, `instructions_link`) VALUES (1, 'Replace Refridgerator Water Filter', NULL, NULL, NULL, NULL, NULL);

COMMIT;

