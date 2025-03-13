-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autores` (
  `id_registro_autores` INT NOT NULL,
  `Nombre` VARCHAR(250) NOT NULL,
  `Fecha_de_nacimiento` DATE NOT NULL,
  `Biografía` VARCHAR(2500) NOT NULL,
  PRIMARY KEY (`id_registro_autores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`historial` (
  `id_historial` INT NOT NULL,
  `fecha_entrega` VARCHAR(50) NOT NULL,
  `fecha_devolución` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_historial`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`libros` (
  `id_registro_libros` INT NOT NULL,
  `Titulo` VARCHAR(200) NOT NULL,
  `fecha_de_publicación` DATE NOT NULL,
  `No_Páginas` VARCHAR(45) NOT NULL,
  `ISBN` VARCHAR(45) NOT NULL,
  `Editorial` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_registro_libros`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`historial_has_libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`historial_has_libros` (
  `historial_id_historial` INT NOT NULL,
  `libros_id_registro_libros` INT NOT NULL,
  PRIMARY KEY (`historial_id_historial`, `libros_id_registro_libros`),
  INDEX `fk_historial_has_libros_libros1_idx` (`libros_id_registro_libros` ASC) VISIBLE,
  INDEX `fk_historial_has_libros_historial1_idx` (`historial_id_historial` ASC) VISIBLE,
  CONSTRAINT `fk_historial_has_libros_historial1`
    FOREIGN KEY (`historial_id_historial`)
    REFERENCES `mydb`.`historial` (`id_historial`),
  CONSTRAINT `fk_historial_has_libros_libros1`
    FOREIGN KEY (`libros_id_registro_libros`)
    REFERENCES `mydb`.`libros` (`id_registro_libros`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`prestamos` (
  `id_prestamos` VARCHAR(45) NOT NULL,
  `Fecha_inicio` VARCHAR(50) NOT NULL,
  `fecha_limite` VARCHAR(50) NOT NULL,
  `fecha_entrega` VARCHAR(50) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_prestamos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`historial_has_prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`historial_has_prestamos` (
  `historial_id_historial` INT NOT NULL,
  `prestamos_id_prestamos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`historial_id_historial`, `prestamos_id_prestamos`),
  INDEX `fk_historial_has_prestamos_prestamos1_idx` (`prestamos_id_prestamos` ASC) VISIBLE,
  INDEX `fk_historial_has_prestamos_historial1_idx` (`historial_id_historial` ASC) VISIBLE,
  CONSTRAINT `fk_historial_has_prestamos_historial1`
    FOREIGN KEY (`historial_id_historial`)
    REFERENCES `mydb`.`historial` (`id_historial`),
  CONSTRAINT `fk_historial_has_prestamos_prestamos1`
    FOREIGN KEY (`prestamos_id_prestamos`)
    REFERENCES `mydb`.`prestamos` (`id_prestamos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `id_usuarios` VARCHAR(200) NOT NULL,
  `No_identificador` VARCHAR(8) NOT NULL,
  `Nombre` VARCHAR(250) NOT NULL,
  `correo` VARCHAR(350) NOT NULL,
  `telefono` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`historial_has_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`historial_has_usuarios` (
  `historial_id_historial` INT NOT NULL,
  `usuarios_id_usuarios` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`historial_id_historial`, `usuarios_id_usuarios`),
  INDEX `fk_historial_has_usuarios_usuarios1_idx` (`usuarios_id_usuarios` ASC) VISIBLE,
  INDEX `fk_historial_has_usuarios_historial1_idx` (`historial_id_historial` ASC) VISIBLE,
  CONSTRAINT `fk_historial_has_usuarios_historial1`
    FOREIGN KEY (`historial_id_historial`)
    REFERENCES `mydb`.`historial` (`id_historial`),
  CONSTRAINT `fk_historial_has_usuarios_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `mydb`.`usuarios` (`id_usuarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inventario` (
  `id_Inventario` VARCHAR(45) NOT NULL,
  `Disponibles` VARCHAR(50) NOT NULL,
  `Prestados` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Inventario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`inventario_has_historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inventario_has_historial` (
  `inventario_id_Inventario` VARCHAR(45) NOT NULL,
  `historial_id_historial` INT NOT NULL,
  PRIMARY KEY (`inventario_id_Inventario`, `historial_id_historial`),
  INDEX `fk_inventario_has_historial_historial1_idx` (`historial_id_historial` ASC) VISIBLE,
  INDEX `fk_inventario_has_historial_inventario1_idx` (`inventario_id_Inventario` ASC) VISIBLE,
  CONSTRAINT `fk_inventario_has_historial_historial1`
    FOREIGN KEY (`historial_id_historial`)
    REFERENCES `mydb`.`historial` (`id_historial`),
  CONSTRAINT `fk_inventario_has_historial_inventario1`
    FOREIGN KEY (`inventario_id_Inventario`)
    REFERENCES `mydb`.`inventario` (`id_Inventario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`libros_has_autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`libros_has_autores` (
  `libros_id_registro_libros` INT NOT NULL,
  `autores_id_registro_autores` INT NOT NULL,
  PRIMARY KEY (`libros_id_registro_libros`, `autores_id_registro_autores`),
  INDEX `fk_libros_has_autores_autores1_idx` (`autores_id_registro_autores` ASC) VISIBLE,
  INDEX `fk_libros_has_autores_libros_idx` (`libros_id_registro_libros` ASC) VISIBLE,
  CONSTRAINT `fk_libros_has_autores_autores1`
    FOREIGN KEY (`autores_id_registro_autores`)
    REFERENCES `mydb`.`autores` (`id_registro_autores`),
  CONSTRAINT `fk_libros_has_autores_libros`
    FOREIGN KEY (`libros_id_registro_libros`)
    REFERENCES `mydb`.`libros` (`id_registro_libros`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`libros_has_inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`libros_has_inventario` (
  `libros_id_registro_libros` INT NOT NULL,
  `inventario_id_Inventario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`libros_id_registro_libros`, `inventario_id_Inventario`),
  INDEX `fk_libros_has_inventario_inventario1_idx` (`inventario_id_Inventario` ASC) VISIBLE,
  INDEX `fk_libros_has_inventario_libros1_idx` (`libros_id_registro_libros` ASC) VISIBLE,
  CONSTRAINT `fk_libros_has_inventario_inventario1`
    FOREIGN KEY (`inventario_id_Inventario`)
    REFERENCES `mydb`.`inventario` (`id_Inventario`),
  CONSTRAINT `fk_libros_has_inventario_libros1`
    FOREIGN KEY (`libros_id_registro_libros`)
    REFERENCES `mydb`.`libros` (`id_registro_libros`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`prestamos_has_inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`prestamos_has_inventario` (
  `prestamos_id_prestamos` VARCHAR(45) NOT NULL,
  `inventario_id_Inventario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`prestamos_id_prestamos`, `inventario_id_Inventario`),
  INDEX `fk_prestamos_has_inventario_inventario1_idx` (`inventario_id_Inventario` ASC) VISIBLE,
  INDEX `fk_prestamos_has_inventario_prestamos1_idx` (`prestamos_id_prestamos` ASC) VISIBLE,
  CONSTRAINT `fk_prestamos_has_inventario_inventario1`
    FOREIGN KEY (`inventario_id_Inventario`)
    REFERENCES `mydb`.`inventario` (`id_Inventario`),
  CONSTRAINT `fk_prestamos_has_inventario_prestamos1`
    FOREIGN KEY (`prestamos_id_prestamos`)
    REFERENCES `mydb`.`prestamos` (`id_prestamos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios_has_prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios_has_prestamos` (
  `usuarios_id_usuarios` VARCHAR(200) NOT NULL,
  `prestamos_id_prestamos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usuarios_id_usuarios`, `prestamos_id_prestamos`),
  INDEX `fk_usuarios_has_prestamos_prestamos1_idx` (`prestamos_id_prestamos` ASC) VISIBLE,
  INDEX `fk_usuarios_has_prestamos_usuarios1_idx` (`usuarios_id_usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_prestamos_prestamos1`
    FOREIGN KEY (`prestamos_id_prestamos`)
    REFERENCES `mydb`.`prestamos` (`id_prestamos`),
  CONSTRAINT `fk_usuarios_has_prestamos_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `mydb`.`usuarios` (`id_usuarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
