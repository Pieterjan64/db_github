-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema lab_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_db` DEFAULT CHARACTER SET utf8 ;
USE `lab_db` ;

-- -----------------------------------------------------
-- Table `lab_db`.`trainings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_db`.`trainings` (
  `training_id` INT NOT NULL,
  `subject` VARCHAR(45) NULL,
  `Duration` INT NULL,
  PRIMARY KEY (`training_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_db`.`members`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_db`.`members` (
  `members_id` INT NOT NULL,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `birth_date` DATE NULL,
  PRIMARY KEY (`members_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_db`.`equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_db`.`equipment` (
  `equipment_id` INT NOT NULL,
  `eq_name` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `purchase_date` DATE NULL,
  PRIMARY KEY (`equipment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_db`.`experiment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_db`.`experiment` (
  `experiment_id` INT NOT NULL,
  `ex_name` VARCHAR(45) NULL,
  `performed_by` INT NULL,
  `equipment_id` INT NULL,
  `date` DATE NULL,
  PRIMARY KEY (`experiment_id`),
  INDEX `equipment_id_idx` (`equipment_id` ASC),
  INDEX `members_id_idx` (`performed_by` ASC),
  CONSTRAINT `equipment_id`
    FOREIGN KEY (`equipment_id`)
    REFERENCES `lab_db`.`equipment` (`equipment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `members_id`
    FOREIGN KEY (`performed_by`)
    REFERENCES `lab_db`.`members` (`members_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_db`.`members_in_training`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_db`.`members_in_training` (
  `mit_id` INT NOT NULL,
  `training_id` INT NULL,
  `members_id` INT NULL,
  PRIMARY KEY (`mit_id`),
  INDEX `members_id_idx` (`members_id` ASC),
  INDEX `trainings_id_idx` (`training_id` ASC),
  CONSTRAINT `members_id`
    FOREIGN KEY (`members_id`)
    REFERENCES `lab_db`.`members` (`members_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `trainings_id`
    FOREIGN KEY (`training_id`)
    REFERENCES `lab_db`.`trainings` (`training_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_db`.`results`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_db`.`results` (
  `results_id` INT NOT NULL,
  `directory` VARCHAR(45) NULL,
  `experiment` INT NULL,
  `status` ENUM('FAILED', 'PROGRESS', 'COMPLETED') NULL,
  PRIMARY KEY (`results_id`),
  INDEX `experiment_id_idx` (`experiment` ASC),
  CONSTRAINT `experiment_id`
    FOREIGN KEY (`experiment`)
    REFERENCES `lab_db`.`experiment` (`experiment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
