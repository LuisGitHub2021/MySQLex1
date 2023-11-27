-- MySQL Workbench Synchronization
-- Generated: 2023-11-26 20:55
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: luiss

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `optica`.`proveedor` (
  `proveedor_id` INT(11) NOT NULL AUTO_INCREMENT,
  `proveedor_name` VARCHAR(45) NOT NULL COMMENT 'Razon social proveedor',
  `proveedor_nif` VARCHAR(45) NOT NULL COMMENT 'Identificacion fiscal proveedor',
  `empresa_empresa_id` INT(11) NOT NULL DEFAULT 1 COMMENT 'id de la optica',
  PRIMARY KEY (`proveedor_id`),
  UNIQUE INDEX `proveedor_nif_UNIQUE` (`proveedor_nif` ASC),
  INDEX `fk_proveedor_empresa1_idx` (`empresa_empresa_id` ASC),
  CONSTRAINT `fk_proveedor_empresa`
    FOREIGN KEY (`empresa_empresa_id`)
    REFERENCES `optica`.`empresa` (`empresa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`proveedor` (`proveedor_id`, `proveedor_name`, `proveedor_nif`, `empresa_empresa_id`) VALUES (1, 'prov1', 'B60569035', 1);
INSERT INTO `optica`.`proveedor` (`proveedor_id`, `proveedor_name`, `proveedor_nif`, `empresa_empresa_id`) VALUES (2, 'prov2', 'A34541209', 1);
INSERT INTO `optica`.`proveedor` (`proveedor_id`, `proveedor_name`, `proveedor_nif`, `empresa_empresa_id`) VALUES (3, 'prov3', 'B67982091', 1);

CREATE TABLE IF NOT EXISTS `optica`.`modelosGafas` (
  `modelosGafas_id` INT(11) NOT NULL AUTO_INCREMENT,
  `modelosGafas_marca` VARCHAR(45) NOT NULL COMMENT 'TODAS LAS MARCAS\nmarca1\nmarca2\nmarca3\nmarca4\nmarca5\nmarca6\nmarca7\nmarca8\nmarca9',
  `modelosGafas_precio` DECIMAL(6,2) NOT NULL COMMENT 'Precio Gafas (incluye montura y vidrios)',
  `proveedor_proveedor_id` INT(11) NOT NULL,
  PRIMARY KEY (`modelosGafas_id`),
  INDEX `fk_modelosGafas_proveedor1_idx` (`proveedor_proveedor_id` ASC),
  CONSTRAINT `fk_modelosGafas_proveedor1`
    FOREIGN KEY (`proveedor_proveedor_id`)
    REFERENCES `optica`.`proveedor` (`proveedor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (1, 'marca1', 900.25, 1);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (2, 'marca2', 1250.32, 1);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (3, 'marca3', 1002.36, 1);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (4, 'marca4', 620.45, 2);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (5, 'marca5', 580.25, 2);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (6, 'marca6', 251.32, 2);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (7, 'marca7', 1352.65, 2);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (8, 'marca8', 1159.35, 2);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (9, 'marca9', 180.32, 3);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (10, 'marca9', 192.32, 3);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (11, 'marca9', 109.99, 3);

CREATE TABLE IF NOT EXISTS `optica`.`gafasCliente` (
  `gafasCliente_id` INT(11) NOT NULL AUTO_INCREMENT,
  `gafasCliente_montura` VARCHAR(45) NOT NULL COMMENT 'TIPO DE MONTURA\nF=Flotante\nP=Pasta\nM=Metálica',
  `gafasCliente_colorMontura` VARCHAR(45) NOT NULL COMMENT 'COLORES\nsegún carta colores',
  `gafasCliente_colorVidrio` VARCHAR(45) NOT NULL COMMENT 'COLOR DEL VIDRIO\nT=Transparente\nA=Ambar\nO=Oscuros',
  `gafasCliente_od` DECIMAL(5,2) NULL DEFAULT NULL COMMENT 'LEYENDA DE GRADUACION\nOD=ojo derecho\nOS=ojo izquierdo\n00.00 to 99.99 = Hipermetropia\n00.00 to -99.99 = Miopia\n1-180=Astigmatismo',
  `gafasCliente_os` DECIMAL(5,2) NULL DEFAULT NULL COMMENT 'LEYENDA DE GRADUACION\nOD=ojo derecho\nOS=ojo izquierdo\n00.00 to 99.99 = Hipermetropia\n00.00 to -99.99 = Miopia\n1-180=Astigmatismo',
  `gafasCliente_aod` TINYINT(1) NULL DEFAULT NULL COMMENT 'LEYENDA DE GRADUACION\nOD=ojo derecho\nOS=ojo izquierdo\n00.00 to 99.99 = Hipermetropia\n00.00 to -99.99 = Miopia\n1-180=Astigmatismo',
  `gafasCliente_aos` TINYINT(1) NULL DEFAULT NULL COMMENT 'LEYENDA DE GRADUACION\nOD=ojo derecho\nOS=ojo izquierdo\n00.00 to 99.99 = Hipermetropia\n00.00 to -99.99 = Miopia\n1-180=Astigmatismo',
  `modelosGafas_modelosGafas_id` INT(11) NOT NULL,
  PRIMARY KEY (`gafasCliente_id`),
  INDEX `fk_gafasCliente_modelosGafas1_idx` (`modelosGafas_modelosGafas_id` ASC),
  CONSTRAINT `fk_gafasCliente_modelosGafas1`
    FOREIGN KEY (`modelosGafas_modelosGafas_id`)
    REFERENCES `optica`.`modelosGafas` (`modelosGafas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`) VALUES (1, 'F', 'Golden', 'T', 1.25, 0.75, NULL, NULL, 1);
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`) VALUES (2, 'P', 'Negras', 'O', 1.25, 0.75, NULL, NULL, 4);
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`) VALUES (3, 'M', 'Amarillo', 'A', 2.75, 1.25, 30, 50, 5);
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`) VALUES (4, 'M', 'Rojo', 'T', 2.75, 1.25, 30, 50, 8);
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`) VALUES (5, 'F', 'Tigre', 'O', 2.75, 1.25, 30, 50, 9);
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`) VALUES (6, 'P', 'Verde', 'T', -1.25, -1.50, 25, 25, 2);

CREATE TABLE IF NOT EXISTS `optica`.`direccion` (
  `direccion_id` INT(11) NOT NULL AUTO_INCREMENT,
  `direccion_calle` VARCHAR(45) NOT NULL,
  `direccion_numero` VARCHAR(45) NOT NULL,
  `direccion_piso` VARCHAR(45) NULL DEFAULT NULL,
  `direccion_puerta` VARCHAR(45) NULL DEFAULT NULL,
  `direccion_ciudad` VARCHAR(45) NOT NULL,
  `direccion_cp` VARCHAR(5) NOT NULL,
  `direccion_pais` VARCHAR(45) NOT NULL,
  `empresa_empresa_id` INT(11) NULL DEFAULT NULL COMMENT 'id empresa',
  `personas_personas_id` INT(11) NULL DEFAULT NULL COMMENT 'id personas',
  `proveedor_proveedor_id` INT(11) NULL DEFAULT NULL COMMENT 'id proveedor',
  PRIMARY KEY (`direccion_id`),
  INDEX `fk_direccion_empresa1_idx` (`empresa_empresa_id` ASC),
  INDEX `fk_direccion_personas1_idx` (`personas_personas_id` ASC),
  INDEX `fk_direccion_proveedor1_idx` (`proveedor_proveedor_id` ASC),
  CONSTRAINT `fk_direccion_empresa1`
    FOREIGN KEY (`empresa_empresa_id`)
    REFERENCES `optica`.`empresa` (`empresa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccion_personas1`
    FOREIGN KEY (`personas_personas_id`)
    REFERENCES `optica`.`personas` (`personas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccion_proveedor1`
    FOREIGN KEY (`proveedor_proveedor_id`)
    REFERENCES `optica`.`proveedor` (`proveedor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (1, 'Calle Pio', '23', '4', '2', 'Barcelona', '08004', 'España', NULL, 1, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (2, 'Paseo Roura 32', '12', NULL, NULL, 'Castelldefels', '08960', 'España', NULL, 2, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (3, 'Av Republica Francesa', '60', '10', '5', 'L\'Hospitalet de Llobregat', '08905', 'España', NULL, 3, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (4, 'Calle Azucar', '96', NULL, NULL, 'Barcelona', '08021', 'España', NULL, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (5, 'Calle Lima', '234', NULL, NULL, 'Barcelona', '08012', 'España', NULL, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (6, 'Paseo Castellón', '24', NULL, NULL, 'Barcelona', '08040', 'España', NULL, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (7, 'Ctra Molins', '54', NULL, NULL, 'Barcelona', '08025', 'espña', NULL, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (8, 'Av America', '95', NULL, NULL, 'Barcelona', '08023', 'España', NULL, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (9, 'Calle San Jose', '64', NULL, NULL, 'Barcelona', '08018', 'España', NULL, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (10, 'Calle Alumbra', '98', NULL, NULL, 'Barcelona', '08012', 'España', NULL, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (11, 'Calle Rincón', '91', NULL, NULL, 'Barcelona', '08023', 'España', NULL, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (12, 'Av Rapidez', '23', NULL, NULL, 'Barcelona', '08014', 'España', NULL, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (13, 'Calle Cloro', '43', NULL, NULL, 'Barcelona', '08006', 'España', NULL, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (14, 'Calle Marte', '54', NULL, NULL, 'Barcelona', '08005', 'España', NULL, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (15, 'Av Llull', '36', NULL, NULL, 'Barcelona', '08022', 'España', NULL, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (16, 'Calle Optica', '1', '1', '1', 'Barcelona', '08020', 'España', 1, NULL, NULL);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (17, 'Calle Suministro1', '1', '1', '1', 'Barcelona', '08022', 'España', NULL, NULL, 1);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (18, 'Calle Suminstro2', '2', '2', '2', 'Barcelona', '08007', 'España', NULL, NULL, 2);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (19, 'Calle Suministro3', '3', '3', '3', 'Barcelona', '08008', 'España', NULL, NULL, 3);

CREATE TABLE IF NOT EXISTS `optica`.`datos_contacto` (
  `datos_contacto_id` INT(11) NOT NULL AUTO_INCREMENT,
  `datos_contacto_email` VARCHAR(255) NULL DEFAULT NULL COMMENT 'email contacto',
  `datos_contacto_movil` VARCHAR(45) NOT NULL COMMENT 'telefono contacto movil',
  `datos_contacto_telefono` VARCHAR(45) NULL DEFAULT NULL COMMENT 'telefono fijo contaco',
  `datos_contacto_fax` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Obsoleto',
  `empresa_empresa_id` INT(11) NULL DEFAULT NULL COMMENT 'id empresa',
  `personas_personas_id` INT(11) NULL DEFAULT NULL COMMENT 'id de personas',
  `proveedor_proveedor_id` INT(11) NULL DEFAULT NULL COMMENT 'id de proveedor',
  PRIMARY KEY (`datos_contacto_id`),
  UNIQUE INDEX `datos_contacto_email_UNIQUE` (`datos_contacto_email` ASC),
  INDEX `fk_datos_contacto_empresa1_idx` (`empresa_empresa_id` ASC),
  INDEX `fk_datos_contacto_personas1_idx` (`personas_personas_id` ASC),
  INDEX `fk_datos_contacto_proveedor1_idx` (`proveedor_proveedor_id` ASC),
  CONSTRAINT `fk_datos_contacto_empresa1`
    FOREIGN KEY (`empresa_empresa_id`)
    REFERENCES `optica`.`empresa` (`empresa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_datos_contacto_personas1`
    FOREIGN KEY (`personas_personas_id`)
    REFERENCES `optica`.`personas` (`personas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_datos_contacto_proveedor1`
    FOREIGN KEY (`proveedor_proveedor_id`)
    REFERENCES `optica`.`proveedor` (`proveedor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (1, 'j.rodrigo@cliente1.com', '65423432', NULL, NULL, 1, 1, NULL);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (2, 'ana.s@cliente2.com', '67898765', NULL, NULL, 1, 2, NULL);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (3, 'eva.prado@cliente3.com', '65498778', NULL, NULL, 1, 3, NULL);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (4, 'aklos@prov1.com', '63258741', NULL, NULL, NULL, 4, 1);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (5, 'p.rono123@prov2.com', '68745987', NULL, NULL, NULL, 5, 2);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (6, 'lua@prov3.com', '68723565', NULL, NULL, NULL, 6, 3);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (7, 'cris@vendedor1.com', '62102580', NULL, NULL, 1, 7, NULL);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (8, 'gael@vendedor2.com', '63201458', NULL, NULL, 1, 8, NULL);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (9, 'Lua@vendedor3.com', '69321547', NULL, NULL, 1, 9, NULL);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (10, 'Pirlo@prov1.com', '63598777', NULL, NULL, NULL, 10, 1);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (11, 'Donato@prov1.com', '65447125', NULL, NULL, NULL, 11, 1);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (12, 'Antonio@prov2.com', '61878978', NULL, NULL, NULL, 12, 2);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (13, 'Luz@prov2.com', '62233111', NULL, NULL, NULL, 13, 2);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (14, 'Alba@prov3.com', '63335775', NULL, NULL, NULL, 14, 3);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (15, 'Rigo@prov3.com', '61441144', NULL, NULL, NULL, 15, 3);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (16, 'info@optica.com', '67418547', '935488748', NULL, 1, NULL, NULL);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (17, 'info@suministro1.com', '65896556', '936541250', NULL, NULL, NULL, 1);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (18, 'info@suministro2.com', '65874587', '938456217', NULL, NULL, NULL, 2);
INSERT INTO `optica`.`datos_contacto` (`datos_contacto_id`, `datos_contacto_email`, `datos_contacto_movil`, `datos_contacto_telefono`, `datos_contacto_fax`, `empresa_empresa_id`, `personas_personas_id`, `proveedor_proveedor_id`) VALUES (19, 'info@suministro3.com', '63633969', '936589741', NULL, NULL, NULL, 3);

CREATE TABLE IF NOT EXISTS `optica`.`personas` (
  `personas_id` INT(11) NOT NULL AUTO_INCREMENT,
  `personas_nombre` VARCHAR(45) NOT NULL COMMENT 'nombre',
  `personas_apellido1` VARCHAR(45) NOT NULL COMMENT 'primer apellido',
  `personas_apellido2` VARCHAR(45) NOT NULL COMMENT 'segundo apellido',
  `personas_sex` VARCHAR(45) NULL DEFAULT NULL COMMENT 'GENERO\nM=Male\nF=Female\nI=Intersexual\nIM=Intersexual Dominante Male\nIF=Intersexual Dominante Female',
  `personas_fecha_cumpleaños` DATE NULL DEFAULT NULL,
  `personas_dni` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Documento de Identidad en el pais, DNI NIE o  Pasaporte',
  `personas_nif` VARCHAR(45) NULL DEFAULT NULL COMMENT 'numero identificacion fiscal para posible factura',
  `personas_recomendadoPor` VARCHAR(45) NULL DEFAULT NULL COMMENT 'persona que le recomendo nuestra optica',
  `personas_vendedor` VARCHAR(45) NULL DEFAULT NULL COMMENT 'el vendedor que  atendio al cliente',
  `empresa_empresa_id` INT(11) NULL DEFAULT NULL COMMENT 'id de persona equipo empresa. Cliente o Vendedor\nse deberia hacer una tabla de recursos humanos para separar',
  `personas_personas_id` INT(11) NULL DEFAULT NULL COMMENT 'id persona que recomienda la optica',
  `personas_personas_id1` INT(11) NULL DEFAULT NULL COMMENT 'id persona en funcion vendedor',
  `proveedor_proveedor_id` INT(11) NULL DEFAULT NULL COMMENT 'id proveedor persona equipo proveedor',
  PRIMARY KEY (`personas_id`),
  INDEX `fk_personas_personas1_idx` (`personas_personas_id` ASC),
  INDEX `fk_personas_empresa1_idx` (`empresa_empresa_id` ASC),
  INDEX `fk_personas_proveedor1_idx` (`proveedor_proveedor_id` ASC),
  INDEX `fk_personas_personas2_idx` (`personas_personas_id1` ASC),
  CONSTRAINT `fk_personas_personas1`
    FOREIGN KEY (`personas_personas_id`)
    REFERENCES `optica`.`personas` (`personas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_empresa1`
    FOREIGN KEY (`empresa_empresa_id`)
    REFERENCES `optica`.`empresa` (`empresa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_proveedor1`
    FOREIGN KEY (`proveedor_proveedor_id`)
    REFERENCES `optica`.`proveedor` (`proveedor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_personas2`
    FOREIGN KEY (`personas_personas_id1`)
    REFERENCES `optica`.`personas` (`personas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (1, 'Juan', 'Rodrigo', 'Martos', 'M', '2002-01-12', NULL, NULL, 'Eva Prado', 'Cris', 1, 3, 7, NULL);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (2, 'Ana', 'Horce', 'Silva', 'F', '2000-10-21', NULL, NULL, 'Ana Horce', 'Cris', 1, 2, 7, NULL);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (3, 'Eva', 'Prado', 'Gren', 'F', '1985-11-25', NULL, NULL, 'Ana Horce', 'Klausy', 1, 2, 9, NULL);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (4, 'Ada', 'Klos', 'Junco', 'F', '1996-07-05', NULL, NULL, 'Juan Rodrigo', 'Gael', NULL, 1, 8, 1);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (5, 'Pol', 'Rono', 'Sava', 'I', '1965-04-09', NULL, NULL, NULL, 'Cris', NULL, NULL, 7, 2);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (6, 'Lua', 'Nacor', 'Lujan', 'IM', '2010-08-26', NULL, NULL, 'Juan Rodrigo', 'Gael', NULL, 5, 8, 3);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (7, 'Cris', 'Rew', 'Toyu', 'M', '1984-05-07', NULL, NULL, 'Lua Nacor', 'Cris', 1, 6, 7, NULL);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (8, 'Gael', 'Fandos', 'Gracia', 'M', '1999-01-29', NULL, NULL, 'Ada Klos', 'Gael', 1, 4, 8, NULL);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (9, 'Klausy', 'Polme', 'Pilmo', 'F', '2015-03-10', NULL, NULL, NULL, 'Klausy', 1, NULL, 9, NULL);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (10, 'Pirlo', 'Jas', 'Sak', 'M', '1995-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (11, 'Donato', 'Ona', 'Tona', 'M', '1991-03-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (12, 'Antonio', 'Nio', 'Nat', 'M', '1992-05-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (13, 'Luz', 'Bal', 'Zul', 'F', '1992-08-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (14, 'Alba', 'Ul', 'Lu', 'F', '1993-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `optica`.`personas` (`personas_id`, `personas_nombre`, `personas_apellido1`, `personas_apellido2`, `personas_sex`, `personas_fecha_cumpleaños`, `personas_dni`, `personas_nif`, `personas_recomendadoPor`, `personas_vendedor`, `empresa_empresa_id`, `personas_personas_id`, `personas_personas_id1`, `proveedor_proveedor_id`) VALUES (15, 'Rigo', 'Grio', 'Orio', 'F', '2001-10-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);

CREATE TABLE IF NOT EXISTS `optica`.`empresa` (
  `empresa_id` INT(11) NOT NULL,
  `empresa_name` VARCHAR(45) NOT NULL COMMENT 'nombre empresa',
  `empresa_nif` VARCHAR(45) NOT NULL COMMENT 'nif empresa',
  UNIQUE INDEX `empresa_nif_UNIQUE` (`empresa_nif` ASC),
  PRIMARY KEY (`empresa_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`empresa` (`empresa_id`, `empresa_name`, `empresa_nif`) VALUES (1, 'optica', 'B23143560');

CREATE TABLE IF NOT EXISTS `optica`.`roles` (
  `roles_id` INT(11) NOT NULL AUTO_INCREMENT,
  `roles_role` TINYINT(1) NOT NULL COMMENT 'TIPO DE RELACION\ncliente=1\nempleado=2\nproveedor=3',
  `roles_descripcion` VARCHAR(45) NOT NULL COMMENT 'descripcion relacion',
  PRIMARY KEY (`roles_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`roles` (`roles_id`, `roles_role`, `roles_descripcion`) VALUES (1, 1, 'Compra productos');
INSERT INTO `optica`.`roles` (`roles_id`, `roles_role`, `roles_descripcion`) VALUES (2, 2, 'Suministra material');
INSERT INTO `optica`.`roles` (`roles_id`, `roles_role`, `roles_descripcion`) VALUES (3, 3, 'Formaliza Ventas');

CREATE TABLE IF NOT EXISTS `optica`.`personas_has_roles` (
  `personas_personas_id` INT(11) NOT NULL,
  `roles_roles_id` INT(11) NOT NULL,
  PRIMARY KEY (`personas_personas_id`, `roles_roles_id`),
  INDEX `fk_personas_has_roles_roles1_idx` (`roles_roles_id` ASC),
  INDEX `fk_personas_has_roles_personas1_idx` (`personas_personas_id` ASC),
  CONSTRAINT `fk_personas_has_roles_personas1`
    FOREIGN KEY (`personas_personas_id`)
    REFERENCES `optica`.`personas` (`personas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_has_roles_roles1`
    FOREIGN KEY (`roles_roles_id`)
    REFERENCES `optica`.`roles` (`roles_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (1, 1);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (2, 1);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (3, 1);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (4, 3);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (5, 3);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (6, 3);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (7, 2);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (8, 2);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (9, 3);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (10, 3);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (11, 3);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (12, 3);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (13, 3);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (14, 3);
INSERT INTO `optica`.`personas_has_roles` (`personas_personas_id`, `roles_roles_id`) VALUES (15, 3);

CREATE TABLE IF NOT EXISTS `optica`.`personas_has_gafasCliente` (
  `personas_personas_id` INT(11) NOT NULL,
  `gafasCliente_gafasCliente_id` INT(11) NOT NULL,
  PRIMARY KEY (`personas_personas_id`, `gafasCliente_gafasCliente_id`),
  INDEX `fk_personas_has_gafasCliente_gafasCliente1_idx` (`gafasCliente_gafasCliente_id` ASC),
  INDEX `fk_personas_has_gafasCliente_personas1_idx` (`personas_personas_id` ASC),
  CONSTRAINT `fk_personas_has_gafasCliente_personas1`
    FOREIGN KEY (`personas_personas_id`)
    REFERENCES `optica`.`personas` (`personas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_has_gafasCliente_gafasCliente1`
    FOREIGN KEY (`gafasCliente_gafasCliente_id`)
    REFERENCES `optica`.`gafasCliente` (`gafasCliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`personas_has_gafasCliente` (`personas_personas_id`, `gafasCliente_gafasCliente_id`) VALUES (1, 1);
INSERT INTO `optica`.`personas_has_gafasCliente` (`personas_personas_id`, `gafasCliente_gafasCliente_id`) VALUES (1, 2);
INSERT INTO `optica`.`personas_has_gafasCliente` (`personas_personas_id`, `gafasCliente_gafasCliente_id`) VALUES (2, 3);
INSERT INTO `optica`.`personas_has_gafasCliente` (`personas_personas_id`, `gafasCliente_gafasCliente_id`) VALUES (2, 4);
INSERT INTO `optica`.`personas_has_gafasCliente` (`personas_personas_id`, `gafasCliente_gafasCliente_id`) VALUES (2, 5);
INSERT INTO `optica`.`personas_has_gafasCliente` (`personas_personas_id`, `gafasCliente_gafasCliente_id`) VALUES (3, 6);

CREATE TABLE IF NOT EXISTS `optica`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gafasCliente_gafasCliente_id` INT(11) NULL DEFAULT NULL COMMENT 'accion gafas clientes',
  `empresa_empresa_id` INT(11) NULL DEFAULT NULL COMMENT 'accion sobre empresa',
  `proveedor_proveedor_id` INT(11) NULL DEFAULT NULL COMMENT 'accion sobre proveedores',
  `personas_personas_id` INT(11) NOT NULL COMMENT 'accion sobre personas',
  INDEX `fk_timestamps_empresa1_idx` (`empresa_empresa_id` ASC),
  INDEX `fk_timestamps_proveedor1_idx` (`proveedor_proveedor_id` ASC),
  INDEX `fk_timestamps_personas1_idx` (`personas_personas_id` ASC),
  INDEX `fk_timestamps_gafasCliente1_idx` (`gafasCliente_gafasCliente_id` ASC),
  CONSTRAINT `fk_timestamps_gafasCliente1`
    FOREIGN KEY (`gafasCliente_gafasCliente_id`)
    REFERENCES `optica`.`datos_contacto` (`datos_contacto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_timestamps_empresa1`
    FOREIGN KEY (`empresa_empresa_id`)
    REFERENCES `optica`.`empresa` (`empresa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_timestamps_proveedor1`
    FOREIGN KEY (`proveedor_proveedor_id`)
    REFERENCES `optica`.`proveedor` (`proveedor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_timestamps_personas1`
    FOREIGN KEY (`personas_personas_id`)
    REFERENCES `optica`.`personas` (`personas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, 1, 1, 1, 1);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, 2, NULL, 2, 2);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, 3, NULL, 3, 3);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, 4, NULL, NULL, 4);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, 5, NULL, NULL, 5);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, 6, NULL, NULL, 6);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, NULL, NULL, NULL, 14);
INSERT INTO `optica`.`timestamps` (`create_time`, `update_time`, `gafasCliente_gafasCliente_id`, `empresa_empresa_id`, `proveedor_proveedor_id`, `personas_personas_id`) VALUES (NULL, NULL, NULL, NULL, NULL, 15);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
