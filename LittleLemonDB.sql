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
-- Table `littlelemondb`.`customer_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`customer_details` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(255) NOT NULL,
  `contact_details` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`bookings` (
  `booking_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `table_number` INT NOT NULL,
  `bookingscol` VARCHAR(45) NULL,
  `customer_id` INT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customer_fk_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `littlelemondb`.`customer_details` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menuitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menuitems` (
  `MenuItemsID` INT NOT NULL,
  `CourseName` VARCHAR(45) NOT NULL,
  `StarterName` VARCHAR(45) NOT NULL,
  `DesertName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menu` (
  `menu_id` INT NOT NULL,
  `item_name` VARCHAR(255) NOT NULL,
  `category` VARCHAR(50) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `MenuItemsID` INT NOT NULL,
  PRIMARY KEY (`menu_id`),
  INDEX `menuitems_fk_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `menuitems_fk`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `littlelemondb`.`menuitems` (`MenuItemsID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`order_delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`order_delivery_status` (
  `orderdel_id` INT NOT NULL,
  `delivery_date` DATE NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `order_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`orderdel_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`staff_information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`staff_information` (
  `staff_id` INT NOT NULL,
  `role` VARCHAR(50) NOT NULL,
  `salary` VARCHAR(45) NOT NULL,
  `hire_date` DATE NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orders` (
  `order_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `total_cost` DECIMAL(10,2) NOT NULL,
  `booking_id` INT NOT NULL,
  `orderdel_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `menu_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `bookings_fk_idx` (`booking_id` ASC) VISIBLE,
  INDEX `orderdel_fk_idx` (`orderdel_id` ASC) VISIBLE,
  INDEX `staff_fk_idx` (`staff_id` ASC) VISIBLE,
  INDEX `menu_fk_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `bookings_fk`
    FOREIGN KEY (`booking_id`)
    REFERENCES `littlelemondb`.`bookings` (`booking_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_fk`
    FOREIGN KEY (`menu_id`)
    REFERENCES `littlelemondb`.`menu` (`menu_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `orderdel_fk`
    FOREIGN KEY (`orderdel_id`)
    REFERENCES `littlelemondb`.`order_delivery_status` (`orderdel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff_fk`
    FOREIGN KEY (`staff_id`)
    REFERENCES `littlelemondb`.`staff_information` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `littlelemondb` ;

-- -----------------------------------------------------
-- Placeholder table for view `littlelemondb`.`ordersview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`ordersview` (`order_id` INT, `quantity` INT, `total_cost` INT);

-- -----------------------------------------------------
-- procedure CancelOrder
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`DBCapUser`@`%` PROCEDURE `CancelOrder`(IN orderId INT)
BEGIN
    DECLARE row_count INT;

    -- Check if the order exists
    SELECT COUNT(*) INTO row_count FROM orders WHERE order_id = orderId;

    IF row_count > 0 THEN
        -- Delete the order
        DELETE FROM orders WHERE order_id = orderId;
        SELECT CONCAT('Order ', orderId, ' has been canceled.') AS Message;
    ELSE
        SELECT 'Order not found. No action taken.' AS Message;
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetMaxQuantity
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`DBCapUser`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
    DECLARE max_quantity INT;

    -- Selecting the maximum ordered quantity from the Orders table
    SELECT MAX(quantity) INTO max_quantity FROM orders;

    -- Displaying the maximum ordered quantity
    SELECT max_quantity AS "Max Quantity in Order";
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `littlelemondb`.`ordersview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`ordersview`;
USE `littlelemondb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`DBCapUser`@`%` SQL SECURITY DEFINER VIEW `littlelemondb`.`ordersview` AS select `littlelemondb`.`orders`.`order_id` AS `order_id`,`littlelemondb`.`orders`.`quantity` AS `quantity`,`littlelemondb`.`orders`.`total_cost` AS `total_cost` from `littlelemondb`.`orders` where (`littlelemondb`.`orders`.`quantity` > 2);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
