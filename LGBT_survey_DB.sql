-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LGBT_survey_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LGBT_survey_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LGBT_survey_DB` DEFAULT CHARACTER SET utf8 ;
USE `LGBT_survey_DB` ;

-- -----------------------------------------------------
-- Table `LGBT_survey_DB`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LGBT_survey_DB`.`Country` (
  `idCountry` INT NOT NULL,
  `CountryCode` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCountry`),
  UNIQUE INDEX `CountryCode_UNIQUE` (`CountryCode` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LGBT_survey_DB`.`Subset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LGBT_survey_DB`.`Subset` (
  `idLGBT` INT NOT NULL,
  `subset` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idLGBT`),
  UNIQUE INDEX `subset_UNIQUE` (`subset` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LGBT_survey_DB`.`QuestionCode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LGBT_survey_DB`.`QuestionCode` (
  `idQuestionCode` INT NOT NULL,
  `question_code` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idQuestionCode`),
  UNIQUE INDEX `question_code_UNIQUE` (`question_code` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LGBT_survey_DB`.`QuestionLabel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LGBT_survey_DB`.`QuestionLabel` (
  `idQuestionLabel` INT NOT NULL,
  `question_label` TEXT NOT NULL,
  PRIMARY KEY (`idQuestionLabel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LGBT_survey_DB`.`MainTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LGBT_survey_DB`.`MainTable` (
  `row_id` INT NOT NULL AUTO_INCREMENT,
  `CountryCode` INT NOT NULL,
  `subset` INT NOT NULL,
  `question_code` INT NOT NULL,
  `question_label` INT NOT NULL,
  `answer` VARCHAR(255) NOT NULL,
  `percentage` INT NOT NULL,
  PRIMARY KEY (`row_id`),
  INDEX `country_code_fk_idx` (`CountryCode` ASC) VISIBLE,
  INDEX `subset_fk_idx` (`subset` ASC) VISIBLE,
  INDEX `question_code_fk_idx` (`question_code` ASC) VISIBLE,
  INDEX `question_label_fk_idx` (`question_label` ASC) VISIBLE,
  CONSTRAINT `country_code_fk`
    FOREIGN KEY (`CountryCode`)
    REFERENCES `LGBT_survey_DB`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `subset_fk`
    FOREIGN KEY (`subset`)
    REFERENCES `LGBT_survey_DB`.`Subset` (`idLGBT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `question_code_fk`
    FOREIGN KEY (`question_code`)
    REFERENCES `LGBT_survey_DB`.`QuestionCode` (`idQuestionCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `question_label_fk`
    FOREIGN KEY (`question_label`)
    REFERENCES `LGBT_survey_DB`.`QuestionLabel` (`idQuestionLabel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
