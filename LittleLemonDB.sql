-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`Customer_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Customer_details` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(255) NOT NULL,
  `contact_details` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Bookings` (
  `booking_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `table_number` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customer_fk_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `littlelemondb`.`Customer_details` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Order_delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Order_delivery_status` (
  `orderdel_id` INT NOT NULL,
  `delivery_date` DATE NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `order_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`orderdel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Staff_information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Staff_information` (
  `staff_id` INT NOT NULL,
  `role` VARCHAR(50) NOT NULL,
  `salary` VARCHAR(45) NOT NULL,
  `hire_date` DATE NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Menu` (
  `item_id` INT NOT NULL,
  `item_name` VARCHAR(255) NOT NULL,
  `category` VARCHAR(50) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Orders` (
  `order_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `total_cost` DECIMAL(10,2) NOT NULL,
  `booking_id` INT NOT NULL,
  `orderdel_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `bookings_fk_idx` (`booking_id` ASC) VISIBLE,
  INDEX `orderdel_fk_idx` (`orderdel_id` ASC) VISIBLE,
  INDEX `staff_fk_idx` (`staff_id` ASC) VISIBLE,
  INDEX `menu_fk_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `bookings_fk`
    FOREIGN KEY (`booking_id`)
    REFERENCES `littlelemondb`.`Bookings` (`booking_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `orderdel_fk`
    FOREIGN KEY (`orderdel_id`)
    REFERENCES `littlelemondb`.`Order_delivery_status` (`orderdel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff_fk`
    FOREIGN KEY (`staff_id`)
    REFERENCES `littlelemondb`.`Staff_information` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_fk`
    FOREIGN KEY (`item_id`)
    REFERENCES `littlelemondb`.`Menu` (`item_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;