-- MySQL Script generated by MySQL Workbench
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Schema PawTrax
DROP SCHEMA `PawTrax`;
CREATE SCHEMA IF NOT EXISTS `PawTrax` ;
USE `PawTrax` ;

-- Table `PawTrax`.`Owner`
CREATE TABLE IF NOT EXISTS `PawTrax`.`Owner` (
  `Owner_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Owner_ID`))
ENGINE = InnoDB;

-- Table `PawTrax`.`Dog`
CREATE TABLE IF NOT EXISTS `PawTrax`.`Dog` (
  `Dog_ID` INT NOT NULL AUTO_INCREMENT,
  `Owner_ID` INT NOT NULL,
  `Dog_Name` VARCHAR(45) NULL,
  `Breed` VARCHAR(45) NULL,
  `Birthday` DATE NULL,
  `Gender` VARCHAR(45) NULL,
  `Total_Time_Outside_Hours` DECIMAL(4,1) NULL,
  `Total_Distance_Traveled_Miles` DECIMAL(4,1) NULL,
  `Weight_Pounds` DECIMAL(4,1) NULL,
  `Last_Month_Weight_Pounds` DECIMAL(4,1) NULL,
  PRIMARY KEY (`Dog_ID`, `Owner_ID`),
  CONSTRAINT `fk_Dog_Owner`
    FOREIGN KEY (`Owner_ID`)
    REFERENCES `PawTrax`.`Owner` (`Owner_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table `PawTrax`.`Workout`
CREATE TABLE IF NOT EXISTS `PawTrax`.`Workout` (
  `Workout_ID` VARCHAR(45) NOT NULL,
  `Dog_ID` INT NOT NULL,
  `Owner_ID` INT NOT NULL,
  `Exercise_Date` DATE NULL,
  `Exercise_Type` VARCHAR(45) NULL,
  `Distance_Traveled_Miles` DECIMAL(3,1) NULL,
  `Time_Spent_Outside_Hours` DECIMAL(3,1) NULL,
  PRIMARY KEY (`Dog_ID`, `Owner_ID`, `Workout_ID`),
  CONSTRAINT `fk_Workout_Dog1`
    FOREIGN KEY (`Dog_ID` , `Owner_ID`)
    REFERENCES `PawTrax`.`Dog` (`Dog_ID` , `Owner_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;