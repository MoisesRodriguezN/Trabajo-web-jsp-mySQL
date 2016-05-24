-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-05-2016 a las 18:04:13
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE IF NOT EXISTS `acceso` (
  `usuarioAcceso` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `claveAcceso` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`usuarioAcceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`usuarioAcceso`, `claveAcceso`) VALUES
('admin', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE IF NOT EXISTS `articulo` (
  `codigoArticulo` int(11) NOT NULL,
  `nombreArticulo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `categoriaArticulo` int(11) NOT NULL,
  `fabricanteArticulo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcionArticulo` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `precioCompraArticulo` decimal(5,2) NOT NULL,
  `precioVentaArticulo` decimal(5,2) NOT NULL,
  `stockArticulo` int(11) NOT NULL,
  PRIMARY KEY (`codigoArticulo`),
  KEY `Foranea` (`categoriaArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`codigoArticulo`, `nombreArticulo`, `categoriaArticulo`, `fabricanteArticulo`, `descripcionArticulo`, `precioCompraArticulo`, `precioVentaArticulo`, `stockArticulo`) VALUES
(1, 'Docking USB 3.0 SATA', 2, 'Connection', 'Docking usb 3.0 USB data 2TB máximo', 30.48, 80.02, 4),
(2, 'Cable VGA 2M', 1, 'Revoltec', 'Cable VGA Macho/Macho 2 Metros', 1.00, 3.00, 10),
(3, 'Cable HDMI', 1, 'Revoltec', 'Cable HDMI Macho/Macho 2 Metros', 2.00, 6.00, 10),
(4, 'Disco duro sata III 500GB', 2, 'Samsung', 'Disco duro sata 3 500gb 7200RPM 64MB Cache.', 24.06, 52.06, 14),
(5, 'Tarjeta SD 32GB', 2, 'Kingston', 'Tarjeta SD 32GB Clase 10 U1. ', 3.00, 12.00, 30),
(6, 'NavidiaGF 610M', 7, 'Nvidia', 'Nvidia Geforce 610M 2GB DDR3', 20.00, 50.00, 8),
(7, 'Memoria RAM DDR3', 5, 'Kingston', 'Memoria RAM DDR3 PC2300 10MS', 6.00, 20.00, 40),
(8, 'Fuente ATX', 9, 'Urano', 'Fuente 800W Modular 12Db 4X sata 2 Molex CPU4+6', 30.00, 100.00, 2),
(9, 'cable utp ', 3, 'Connection', 'Cable UTP 6m 5e rigido', 1.00, 2.00, 100),
(10, 'Intel I7 2300QM', 6, 'Intel', 'Procesador Intel I7 2,2ghz 4/8 8MB L3', 100.00, 250.00, 21),
(11, 'Pantalla 20 LED DVI HDMI', 11, 'Asus', 'Pantalla 20 Pulgadas LED DVI, HDMI, 2ms', 80.00, 160.00, 6),
(12, 'raton', 8, 'prueba', 'raton ps2', 2.00, 10.00, 4),
(14, 'cable utp', 3, 'Connection', 'Cable 7m utp', 10.00, 34.00, 90),
(30, 'Disco sata', 2, 'maxtor', 'Disco sata 160gb', 30.00, 60.00, 2),
(31, 'Antena wifi', 3, 'Alfa', 'Antena wifi 2w', 10.00, 23.00, 10),
(40, 'Antena Wifi direccional', 3, 'Alfa', 'Antena direccional 36db', 80.00, 100.00, 2),
(42, 'Antivirus', 10, 'G-Data', 'Antivirus GDATA 2 licencias ', 23.00, 40.00, 30),
(83, 'Teclado USB ', 8, 'Logitech', 'Teclado 102 Teclas USB', 10.00, 24.00, 10),
(100, 'probando', 1, 'probado', 'probado', 1.18, 2.00, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int(11) NOT NULL,
  `nombreCategoria` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(10, 'Software'),
(11, 'Monitores'),
(12, 'Impresoras');

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
