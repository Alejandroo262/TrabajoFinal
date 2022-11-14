/*
SQLyog Community v13.1.8 (64 bit)
MySQL - 10.4.17-MariaDB : Database - proyecto_torrealedua
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`proyecto_torrealedua` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `proyecto_torrealedua`;

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` char(5) NOT NULL,
  `mensaje` varchar(700) NOT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `chat` */

/*Table structure for table `evento` */

DROP TABLE IF EXISTS `evento`;

CREATE TABLE `evento` (
  `id` char(5) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `id_tecnico` char(40) NOT NULL,
  `id_usuario` char(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_evento_tecnico` (`id_tecnico`),
  KEY `FK_evento_usuario` (`id_usuario`),
  CONSTRAINT `FK_evento_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_evento_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `evento` */

/*Table structure for table `grupo` */

DROP TABLE IF EXISTS `grupo`;

CREATE TABLE `grupo` (
  `id` char(5) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `grupo` */

/*Table structure for table `hombre` */

DROP TABLE IF EXISTS `hombre`;

CREATE TABLE `hombre` (
  `id_usuario` char(9) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `FK_hombre_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hombre` */

/*Table structure for table `llamada` */

DROP TABLE IF EXISTS `llamada`;

CREATE TABLE `llamada` (
  `id` char(9) NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `valoracion` char(2) NOT NULL,
  `estado` varchar(200) NOT NULL,
  `id_usuario` char(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `FK_llamada_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `llamada` */

/*Table structure for table `mujer` */

DROP TABLE IF EXISTS `mujer`;

CREATE TABLE `mujer` (
  `id_usuario` char(9) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `FK_mujer_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mujer` */

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `nombre` char(15) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  PRIMARY KEY (`nombre`),
  UNIQUE KEY `fecha_alta` (`fecha_alta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rol` */

/*Table structure for table `tecnico` */

DROP TABLE IF EXISTS `tecnico`;

CREATE TABLE `tecnico` (
  `email` char(40) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `apellido_1` varchar(35) NOT NULL,
  `apellido_2` varchar(35) DEFAULT NULL,
  `clave` varchar(65) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `id_rol_nombre` char(15) NOT NULL,
  `id_rol_fecha_alta` datetime NOT NULL,
  `id_grupo_id` char(5) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `FK_tecnico_rol_nombre` (`id_rol_nombre`),
  KEY `FK_tecnico_grupo_id` (`id_grupo_id`),
  CONSTRAINT `FK_tecnico_grupo_id` FOREIGN KEY (`id_grupo_id`) REFERENCES `grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tecnico_rol_nombre` FOREIGN KEY (`id_rol_nombre`) REFERENCES `rol` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tecnico` */

/*Table structure for table `tener` */

DROP TABLE IF EXISTS `tener`;

CREATE TABLE `tener` (
  `id_tecnico` char(40) NOT NULL,
  `id_chat` char(5) NOT NULL,
  PRIMARY KEY (`id_tecnico`),
  UNIQUE KEY `id_chat` (`id_chat`),
  CONSTRAINT `FK_tener_tecnico_email` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tener` */

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `dni` char(9) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `apellido_1` varchar(35) NOT NULL,
  `apellido_2` varchar(35) DEFAULT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `provincia` varchar(35) DEFAULT NULL,
  `localidad` varchar(35) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `aficiones` varchar(300) DEFAULT NULL,
  `observaciones` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usuario` */

/*Table structure for table `ver_perfil` */

DROP TABLE IF EXISTS `ver_perfil`;

CREATE TABLE `ver_perfil` (
  `id_tecnico` char(40) NOT NULL,
  `id_usuario` char(9) NOT NULL,
  PRIMARY KEY (`id_tecnico`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `FK_ver_perfil_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ver_perfil` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
