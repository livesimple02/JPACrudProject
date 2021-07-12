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
  `maint_interval` SMALLINT(3) NULL,
  `last_completed` DATE NULL,
  `next_due_date` DATE NULL,
  `instructions_link` TEXT NULL,
  `active_flag` TINYINT NOT NULL DEFAULT 1,
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
INSERT INTO `task` (`id`, `task_name`, `description`, `maint_interval`, `last_completed`, `next_due_date`, `instructions_link`, `active_flag`) VALUES (1, 'Refrigerator Water Filter', 'Replace Water Filter', 180, '2021-2-12', '2021-8-11', NULL, 1);
INSERT INTO `task` (`id`, `task_name`, `description`, `maint_interval`, `last_completed`, `next_due_date`, `instructions_link`, `active_flag`) VALUES (2, 'Furnace Air Filter', 'Replace Furnace Air Filter', 90, '2021-6-9', '2021-9-7', NULL, 1);
INSERT INTO `task` (`id`, `task_name`, `description`, `maint_interval`, `last_completed`, `next_due_date`, `instructions_link`, `active_flag`) VALUES (3, 'Flush Hot Water Heater', 'Flush hot water heater and check pressure relief valve', 365, '2020-4-28', '2021-4-28', 'https://www.artofmanliness.com/articles/how-to-flush-your-hot-water-heater/', 1);
INSERT INTO `task` (`id`, `task_name`, `description`, `maint_interval`, `last_completed`, `next_due_date`, `instructions_link`, `active_flag`) VALUES (4, 'Clean Windows', NULL, 180, NULL, '2021-7-17', NULL, 1);
INSERT INTO `task` (`id`, `task_name`, `description`, `maint_interval`, `last_completed`, `next_due_date`, `instructions_link`, `active_flag`) VALUES (5, 'Clean Gutters', NULL, 90, '2020-6-24', '2020-9-24', NULL, 0);
INSERT INTO `task` (`id`, `task_name`, `description`, `maint_interval`, `last_completed`, `next_due_date`, `instructions_link`, `active_flag`) VALUES (6, 'Clean Washing Machin', 'Run washer using Afresh', 30, '2020-10-10', '2020-11-9', NULL, 0);
INSERT INTO `task` (`id`, `task_name`, `description`, `maint_interval`, `last_completed`, `next_due_date`, `instructions_link`, `active_flag`) VALUES (7, 'Clean Baseboards', NULL, 60, NULL, '2021-7-12', NULL, 1);

COMMIT;

