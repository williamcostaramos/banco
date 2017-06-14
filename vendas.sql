-- MySQL Script generated by MySQL Workbench
-- Wed Jun 14 10:22:08 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema venda
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema venda
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `venda` DEFAULT CHARACTER SET utf8 ;
USE `venda` ;

-- -----------------------------------------------------
-- Table `venda`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `venda`.`produto` (
  `idproduto` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `valor` DOUBLE NOT NULL,
  `quant_estoque` INT NOT NULL,
  PRIMARY KEY (`idproduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `venda`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `venda`.`venda` (
  `idvenda` INT NOT NULL,
  `cliente` VARCHAR(45) NOT NULL,
  `data` DATETIME NULL,
  PRIMARY KEY (`idvenda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `venda`.`item_venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `venda`.`item_venda` (
  `idvenda` INT NOT NULL,
  `idproduto` INT NOT NULL,
  `valor_venda` DOUBLE NOT NULL,
  `quant_item` INT NOT NULL,
  PRIMARY KEY (`idvenda`, `idproduto`),
  INDEX `fk_item_venda_produto_idx` (`idproduto` ASC),
  CONSTRAINT `fk_item_venda_produto`
    FOREIGN KEY (`idproduto`)
    REFERENCES `venda`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_venda_venda`
    FOREIGN KEY (`idvenda`)
    REFERENCES `venda`.`venda` (`idvenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;