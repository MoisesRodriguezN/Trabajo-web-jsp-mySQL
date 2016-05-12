-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-05-2016 a las 11:24:07
-- Versión del servidor: 5.5.49-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tienda_informatica`
--
CREATE DATABASE IF NOT EXISTS `tienda_informatica` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tienda_informatica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE IF NOT EXISTS `acceso` (
  `usuarioAcceso` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `claveAcceso` int(50) NOT NULL,
  PRIMARY KEY (`usuarioAcceso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE IF NOT EXISTS `articulo` (
  `codigoArticulo` int(11) NOT NULL,
  `nombreArticulo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `categoriaArticulo` int(11) NOT NULL,
  `fabricanteArticulo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcionArticulo` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precioCompraArticulo` decimal(5,2) NOT NULL,
  `precioVentaArticulo` decimal(5,2) NOT NULL,
  `stockArticulo` int(11) NOT NULL,
  PRIMARY KEY (`codigoArticulo`),
  KEY `Foranea` (`categoriaArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`codigoArticulo`, `nombreArticulo`, `categoriaArticulo`, `fabricanteArticulo`, `descripcionArticulo`, `precioCompraArticulo`, `precioVentaArticulo`, `stockArticulo`) VALUES
(1, 'Docking USB 3.0 SATA', 1, 'Connection', 'Estación Discos duros SATA 2,5 Y 3,5 Pulgadas.2TB Máximo', 10.00, 30.00, 4),
(2, 'Cable VGA 2M', 1, 'Revoltec', 'Cable VGA Macho/Macho 2 Metros', 1.00, 3.00, 10),
(3, 'Cable HDMI', 1, 'Revoltec', 'Cable HDMI Macho/Macho 2 Metros', 2.00, 6.00, 10),
(4, 'Disco duro sata III 500GB', 2, 'Samsung', 'Disco duro sata 3 500gb 7200RPM 64MB Cache.', 24.00, 52.00, 14),
(5, 'Tarjeta SD 32GB', 2, 'Kingston', 'Tarjeta SD 32GB Clase 10 U1. ', 3.00, 12.00, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int(11) NOT NULL,
  `nombreCategoria` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`codCategoria`, `nombreCategoria`) VALUES
(1, 'Accesorios'),
(2, 'Almacenamiento'),
(3, 'Conectividad'),
(4, 'Placas Base'),
(5, 'Memorias RAM'),
(6, 'Procesadores'),
(7, 'Tarjetas gráficas'),
(8, 'Perifericos'),
(9, 'Fuentes de alimentación'),
(10, 'Software');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `ForaneaCategoria` FOREIGN KEY (`categoriaArticulo`) REFERENCES `categoria` (`codCategoria`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
