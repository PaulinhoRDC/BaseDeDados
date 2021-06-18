-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema UminhoEntregas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema UminhoEntregas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `UminhoEntregas`;
CREATE SCHEMA IF NOT EXISTS `UminhoEntregas` DEFAULT CHARACTER SET utf8 ;
USE `UminhoEntregas` ;

-- -----------------------------------------------------
-- Table `UminhoEntregas`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UminhoEntregas`.`Funcionario` (
  `id` INT NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Telemovel` CHAR(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UminhoEntregas`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UminhoEntregas`.`Cliente` (
  `NIF` CHAR(9) NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Cod_Postal` CHAR(8) NOT NULL,
  `Localidade` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NIF`),
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UminhoEntregas`.`Encomenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UminhoEntregas`.`Encomenda` (
  `id` INT NOT NULL,
  `Estado` VARCHAR(15) NOT NULL,
  `DataEncomenda` DATE NOT NULL,
  `DataEntrega` DATE NULL,
  `Taxa` FLOAT NOT NULL,
  `Peso` FLOAT NOT NULL,
  `Conteudo` VARCHAR(45) NULL,
  `LocalEntrega` VARCHAR(45) NOT NULL,
  `TipoPagamento` VARCHAR(20) NOT NULL,
  `Urgente` BIT(1) NOT NULL,
  `ValorFatura` FLOAT NOT NULL,
  `DataFatura` DATE NOT NULL,
  `funcionario_id` INT NOT NULL,
  `cliente_id` CHAR(9) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Encomendas_Funcionario1_idx` (`funcionario_id` ASC) VISIBLE,
  INDEX `fk_Encomendas_Cliente1_idx` (`cliente_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Encomendas_Funcionario1`
    FOREIGN KEY (`funcionario_id`)
    REFERENCES `UminhoEntregas`.`Funcionario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encomendas_Cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `UminhoEntregas`.`Cliente` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UminhoEntregas`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UminhoEntregas`.`Veiculo` (
  `Matricula` CHAR(8) NOT NULL,
  `Marca` VARCHAR(20) NOT NULL,
  `Modelo` VARCHAR(20) NOT NULL,
  `AnoFabrico` YEAR(4) NOT NULL,
  `Observacoes` VARCHAR(150) NULL,
  PRIMARY KEY (`Matricula`),
  UNIQUE INDEX `Matricula_UNIQUE` (`Matricula` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UminhoEntregas`.`Contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UminhoEntregas`.`Contacto` (
  `Numero` CHAR(9) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `cliente_id` CHAR(9) NOT NULL,
  PRIMARY KEY (`Numero`),
  INDEX `fk_Contacto_Cliente1_idx` (`cliente_id` ASC) VISIBLE,
  UNIQUE INDEX `Numero_UNIQUE` (`Numero` ASC) VISIBLE,
  CONSTRAINT `fk_Contacto_Cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `UminhoEntregas`.`Cliente` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UminhoEntregas`.`Utiliza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UminhoEntregas`.`Utiliza` (
  `id_Encomenda` INT NOT NULL,
  `Matricula_Veiculo` VARCHAR(8) NOT NULL,
  INDEX `fk_Utiliza_Veiculo1_idx` (`Matricula_Veiculo` ASC) VISIBLE,
  PRIMARY KEY (`id_Encomenda`, `Matricula_Veiculo`),
  CONSTRAINT `fk_Utiliza_Encomendas1`
    FOREIGN KEY (`id_Encomenda`)
    REFERENCES `UminhoEntregas`.`Encomenda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utiliza_Veiculo1`
    FOREIGN KEY (`Matricula_Veiculo`)
    REFERENCES `UminhoEntregas`.`Veiculo` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
