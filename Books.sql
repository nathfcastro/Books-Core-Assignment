-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Books
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Books
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Books` DEFAULT CHARACTER SET utf8 ;
USE `Books` ;

-- -----------------------------------------------------
-- Table `Books`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`users` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`authors` (
  `author id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`author id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`books` (
  `book id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `authors_author id` INT NOT NULL,
  PRIMARY KEY (`book id`),
  INDEX `fk_books_authors_idx` (`authors_author id` ASC) VISIBLE,
  CONSTRAINT `fk_books_authors`
    FOREIGN KEY (`authors_author id`)
    REFERENCES `Books`.`authors` (`author id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`favorites` (
  `fave id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `users_id` INT NOT NULL,
  `books_book id` INT NOT NULL,
  PRIMARY KEY (`fave id`, `users_id`, `books_book id`),
  INDEX `fk_favorites_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_favorites_books1_idx` (`books_book id` ASC) VISIBLE,
  CONSTRAINT `fk_favorites_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `Books`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorites_books1`
    FOREIGN KEY (`books_book id`)
    REFERENCES `Books`.`books` (`book id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
