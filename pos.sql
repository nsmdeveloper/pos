-- phpMyAdmin SQL Dump
-- version 4.4.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 09, 2015 at 10:38 AM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `estado` enum('activo','inactivo','borrado','') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Apellidos', 'Categoria de apellidos.', 'activo'),
(2, 'Botas', '', 'activo'),
(3, 'Cananas', '', 'activo'),
(4, 'Canones', '', 'activo'),
(5, 'Cargadores', '', 'activo'),
(6, 'Chamacos', '', 'activo'),
(7, 'Chaqueteras', '', 'activo'),
(8, 'Correas', '', 'activo'),
(9, 'Culatas', '', 'activo'),
(10, 'Escopetas', '', 'activo'),
(11, 'Estuches', '', 'activo'),
(12, 'Gorras', '', 'activo'),
(13, 'Insignias', '', 'activo'),
(14, 'Kit de limpieza', '', 'activo'),
(15, 'Limpiador', '', 'activo'),
(16, 'Miras', '', 'activo'),
(17, 'Pistolas', '', 'activo'),
(18, 'Porta Tiros', '', 'activo'),
(19, 'Revolvers', '', 'activo'),
(20, 'Riches', '', 'activo'),
(21, 'Sellos', '', 'activo'),
(22, 'Sprays', '', 'activo'),
(23, 'Tiros', '', 'activo'),
(24, 'Esposas', '', 'activo');

-- --------------------------------------------------------

--
-- Table structure for table `factura_detalle`
--

CREATE TABLE IF NOT EXISTS `factura_detalle` (
  `id` int(11) NOT NULL,
  `numero_orden` varchar(255) DEFAULT NULL,
  `codigo_producto` int(11) DEFAULT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `precio` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factura_detalle`
--

INSERT INTO `factura_detalle` (`id`, `numero_orden`, `codigo_producto`, `nombre_producto`, `precio`, `qty`) VALUES
(1, 'F151208054253', 62, 'Esposas', 15061, 1),
(2, 'F151208054253', 64, 'Canana De Pistola', 15063, 1),
(3, 'F151208054253', 63, 'Canana De Revolver Reversible', 15062, 1),
(4, 'F151208081515', 1, 'Escopeta Tuna', 15000, 3),
(5, 'F151208081515', 41, 'Cajas De Limpiador', 15040, 2),
(6, 'F151208083429', 9, 'Pistola C2 Mod 110', 15008, 2),
(7, 'F151209085053', 67, 'Kit De  Limpieza', 15066, 3),
(8, 'F151209100702', 30, 'Estuche De Saga', 15029, 1),
(9, 'F151209100702', 31, 'Estuche De Escopeta', 15030, 1);

-- --------------------------------------------------------

--
-- Table structure for table `factura_maestra`
--

CREATE TABLE IF NOT EXISTS `factura_maestra` (
  `id` int(11) NOT NULL,
  `numero_orden` varchar(255) DEFAULT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `documento` varchar(255) NOT NULL,
  `ncf` varchar(100) NOT NULL,
  `subtotal` double NOT NULL,
  `monto` double DEFAULT NULL,
  `itbis` int(11) NOT NULL,
  `tipo` enum('factura','cotizacion','','') NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factura_maestra`
--

INSERT INTO `factura_maestra` (`id`, `numero_orden`, `cliente`, `documento`, `ncf`, `subtotal`, `monto`, `itbis`, `tipo`, `fecha_creacion`) VALUES
(1, 'F151208054253', 'Cliente de prueba', '00100998859', 'P000000000000000001', 45186, 50608.32, 12, 'factura', '2015-12-08'),
(2, 'F151208081515', 'Rhina Gonzalez', '00100998859', 'P000000000000000002', 75080, 84089.6, 12, 'factura', '2015-12-08'),
(3, 'F151208083429', 'Rhina Gonzalez', '00100998859', 'P000000000000000003', 30016, 33617.92, 12, 'factura', '2015-12-08'),
(4, 'F151209085053', 'Rhina Gonzalez', '00100998859', 'P000000000000000004', 45198, 50621.76, 12, 'factura', '2015-12-09'),
(5, 'F151209100702', 'Rhina Gonzalez', '00100998859', 'P000000000000000005', 30059, 33666.08, 12, 'factura', '2015-12-09');

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

CREATE TABLE IF NOT EXISTS `inventario` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `categoria` varchar(255) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `estado` enum('Activo','Inactivo','Borrado','') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventario`
--

INSERT INTO `inventario` (`codigo`, `nombre`, `descripcion`, `categoria`, `precio`, `existencia`, `estado`) VALUES
(1, 'Escopeta Tuna', 'Descripcion', 'Escopetas', 15000, 10, 'Activo'),
(2, 'Escopeta Pegaso', 'Descripcion', 'Escopetas', 15001, 11, 'Activo'),
(3, 'Escopeta Movir', 'Descripcion', 'Escopetas', 15002, 12, 'Activo'),
(4, 'Escopeta Maverich', 'Descripcion', 'Escopetas', 15003, 13, 'Activo'),
(5, 'Combo  Escopeta Maverich', 'Descripcion', 'Escopetas', 15004, 14, 'Activo'),
(6, 'Pistola Bersa Mini Turbe', 'Descripcion', 'Pistolas', 15005, 15, 'Activo'),
(7, 'Pistola Taurus', 'Descripcion', 'Pistolas', 15006, 16, 'Activo'),
(8, 'Pistola Taurus Milenium', 'Descripcion', 'Pistolas', 15007, 17, 'Activo'),
(9, 'Pistola C2 Mod 110', 'Descripcion', 'Pistolas', 15008, 18, 'Activo'),
(10, 'Pistola  Vereta', 'Descripcion', 'Pistolas', 15009, 19, 'Activo'),
(11, 'Pistola Prieto Vereta', 'Descripcion', 'Pistolas', 15010, 20, 'Activo'),
(12, 'Pistola Bronix 360', 'Descripcion', 'Pistolas', 15011, 21, 'Activo'),
(13, 'Pistola Bronix ', 'Descripcion', 'Pistolas', 15012, 22, 'Activo'),
(14, 'Pistola Bronix Cod .33', 'Descripcion', 'Pistolas', 15013, 23, 'Activo'),
(15, 'Pistola Versa 380', 'Descripcion', 'Pistolas', 15014, 24, 'Activo'),
(16, 'Pistola Versa ', 'Descripcion', 'Pistolas', 15015, 25, 'Activo'),
(17, 'Pistola M Wasson 915', 'Descripcion', 'Pistolas', 15016, 26, 'Activo'),
(18, 'Pistola M Wasson ', 'Descripcion', 'Pistolas', 15017, 27, 'Activo'),
(19, 'Pistola Hs', 'Descripcion', 'Pistolas', 15018, 28, 'Activo'),
(20, 'Revolver (1)', 'Descripcion', 'Revolvers', 15019, 29, 'Activo'),
(21, 'Revolver (2)', 'Descripcion', 'Revolvers', 15020, 30, 'Activo'),
(22, 'Revolver (3)', 'Descripcion', 'Revolvers', 15021, 31, 'Activo'),
(23, 'Gorra Pn', 'Descripcion', 'Gorras', 15022, 32, 'Activo'),
(24, 'Riche', 'Descripcion', 'Riches', 15023, 33, 'Activo'),
(25, 'Culata(1)', 'Descripcion', 'Culatas', 15024, 34, 'Activo'),
(26, 'Culata(2)', 'Descripcion', 'Culatas', 15025, 35, 'Activo'),
(27, 'Culata(3)', 'Descripcion', 'Culatas', 15026, 36, 'Activo'),
(28, 'Canon', 'Descripcion', 'Canones', 15027, 37, 'Activo'),
(29, 'Correa', 'Descripcion', 'Correas', 15028, 38, 'Activo'),
(30, 'Estuche De Saga', 'Descripcion', 'Estuches', 15029, 39, 'Activo'),
(31, 'Estuche De Escopeta', 'Descripcion', 'Estuches', 15030, 40, 'Activo'),
(32, 'Caja De Cartuchos Carga  Completa', 'Descripcion', 'Cartuchos', 15031, 41, 'Activo'),
(33, 'Caja De Cartuchos 1/2 Carga', 'Descripcion', 'Cartuchos', 15032, 42, 'Activo'),
(34, 'Caja De Cartuchos De Goma', 'Descripcion', 'Cartuchos', 15033, 43, 'Activo'),
(35, 'Caja De Tiro Calibre 25', 'Descripcion', 'Tiros', 15034, 44, 'Activo'),
(36, 'Caja De Tiro Calibre 38', 'Descripcion', 'Tiros', 15035, 45, 'Activo'),
(37, 'Caja De Tiro 9 Mm', 'Descripcion', 'Tiros', 15036, 46, 'Activo'),
(38, 'Tiro 9 Mm', 'Descripcion', 'Tiros', 15037, 47, 'Activo'),
(39, 'Cajas Tiro 9 Mm Aguila', 'Descripcion', 'Tiros', 15038, 48, 'Activo'),
(40, 'Cajas Tiro 380 Aguila', 'Descripcion', 'Tiros', 15039, 49, 'Activo'),
(41, 'Cajas De Limpiador', 'Descripcion', 'Limpiador', 15040, 50, 'Activo'),
(42, 'Chaquetera', 'Descripcion', 'Chaqueteras', 15041, 51, 'Activo'),
(43, 'Insignia De Sargento', 'Descripcion', 'Insignias', 15042, 52, 'Activo'),
(44, 'Insignia De 2do Teniente', 'Descripcion', 'Insignias', 15043, 53, 'Activo'),
(45, 'Insignia De 1er Teniente', 'Descripcion', 'Insignias', 15044, 54, 'Activo'),
(46, 'Insignia De Capitan', 'Descripcion', 'Insignias', 15045, 55, 'Activo'),
(47, 'Insignia De Mayor', 'Descripcion', 'Insignias', 15046, 56, 'Activo'),
(48, 'Insignia De Tte. Coronel', 'Descripcion', 'Insignias', 15047, 57, 'Activo'),
(49, 'Insignia De Coronel', 'Descripcion', 'Insignias', 15048, 58, 'Activo'),
(50, 'Insignia De Alistado', 'Descripcion', 'Insignias', 15049, 59, 'Activo'),
(51, 'Botas Vibrar', 'Descripcion', 'Botas', 15050, 60, 'Activo'),
(53, 'Apellidos', 'Descripcion', 'Apellidos', 15052, 62, 'Activo'),
(54, 'Spray Gas Pimienta', 'Descripcion', 'Sprays', 15053, 63, 'Activo'),
(55, 'Sellos (1)', 'Descripcion', 'Sellos', 15054, 64, 'Activo'),
(56, 'Sellos (2)', 'Descripcion', 'Sellos', 15055, 65, 'Activo'),
(57, 'Sellos (3)', 'Descripcion', 'Sellos', 15056, 66, 'Activo'),
(58, 'Cargadores Ruger', 'Descripcion', 'Cargadores', 15057, 67, 'Activo'),
(59, 'Cargadores Bersa 18', 'Descripcion', 'Cargadores', 15058, 68, 'Activo'),
(60, 'Cargadores Largos', 'Descripcion', 'Cargadores', 15059, 69, 'Activo'),
(61, 'Chamaco Verde', 'Descripcion', 'Chamacos', 15060, 70, 'Activo'),
(62, 'Esposas', 'Descripcion', 'Esposas', 15061, 71, 'Activo'),
(63, 'Canana De Revolver Reversible', 'Descripcion', 'Cananas', 15062, 72, 'Activo'),
(64, 'Canana De Pistola', 'Descripcion', 'Cananas', 15063, 73, 'Activo'),
(65, 'Porta Tiro', 'Descripcion', 'Porta tiros', 15064, 74, 'Activo'),
(67, 'Kit De  Limpieza', 'Descripcion', 'Kit de limpieza', 15066, 76, 'Activo'),
(68, 'Mira De Glock', 'Descripcion', 'Miras', 15067, 77, 'Activo'),
(69, 'Magnum 5000', 'Pistola Magnum.', 'Pistolas', 50000, 20, 'Activo');

-- --------------------------------------------------------

--
-- Table structure for table `ncf`
--

CREATE TABLE IF NOT EXISTS `ncf` (
  `id` int(11) NOT NULL,
  `numero` text,
  `descripcion` text NOT NULL,
  `estado` enum('activo','inactivo','borrado','') NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `fechaUsado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ncf`
--

INSERT INTO `ncf` (`id`, `numero`, `descripcion`, `estado`, `fechaCreacion`, `fechaUsado`) VALUES
(1, 'P000000000000000001', 'codigo 1', 'inactivo', '0000-00-00 00:00:00', '2015-12-08 21:42:53'),
(2, 'P000000000000000002', 'codigo 2', 'inactivo', '0000-00-00 00:00:00', '2015-12-09 00:15:15'),
(3, 'P000000000000000003', '', 'inactivo', '0000-00-00 00:00:00', '2015-12-09 00:34:29'),
(4, 'P000000000000000004', '', 'inactivo', '0000-00-00 00:00:00', '2015-12-09 12:50:53'),
(5, 'P000000000000000005', '', 'inactivo', '0000-00-00 00:00:00', '2015-12-09 14:07:02'),
(6, 'P000000000000000006', '', 'activo', '0000-00-00 00:00:00', '2015-12-08 21:41:55'),
(7, 'P000000000000000007', '', 'activo', '0000-00-00 00:00:00', '2015-12-08 21:41:55'),
(8, 'P000000000000000008', '', 'activo', '0000-00-00 00:00:00', '2015-12-07 13:01:56'),
(9, 'P000000000000000009', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'P000000000000000010', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'P000000000000000011', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'P000000000000000012', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'P000000000000000013', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'P000000000000000014', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'P000000000000000015', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'P000000000000000016', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'P000000000000000017', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'P000000000000000018', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'P000000000000000019', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'P000000000000000020', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'P000000000000000021', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'P000000000000000022', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'P000000000000000023', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'P000000000000000024', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'P000000000000000025', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'P000000000000000026', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'P000000000000000027', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'P000000000000000028', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'P000000000000000029', '', 'activo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'P000000000000000030', '', 'activo', '2015-12-05 11:32:51', '2015-12-08 21:41:55'),
(31, 'P000000000000000031', '', 'activo', '2015-12-06 20:42:38', '2015-12-08 21:41:55'),
(32, 'P000000000000000032', '', 'activo', '2015-12-06 20:43:45', '2015-12-08 21:41:55'),
(33, 'P000000000000000033', '', 'activo', '2015-12-06 20:48:13', '2015-12-08 21:41:55'),
(34, 'P000000000000000030', '', 'activo', '2015-12-06 20:57:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `negocio_settings`
--

CREATE TABLE IF NOT EXISTS `negocio_settings` (
  `nombre` varchar(255) DEFAULT NULL,
  `rnc` varchar(50) DEFAULT NULL,
  `direccion` text,
  `telefono1` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `whatsapp` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `itbis` double DEFAULT NULL,
  `moneda` varchar(5) DEFAULT NULL,
  `nota_factura` text,
  `nota_factura2` text NOT NULL,
  `showFax` enum('0','1') NOT NULL,
  `showWhatsapp` enum('0','1') NOT NULL,
  `showEmail` enum('0','1') NOT NULL,
  `showHeader` enum('0','1') NOT NULL,
  `showFooter` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `negocio_settings`
--

INSERT INTO `negocio_settings` (`nombre`, `rnc`, `direccion`, `telefono1`, `fax`, `whatsapp`, `email`, `itbis`, `moneda`, `nota_factura`, `nota_factura2`, `showFax`, `showWhatsapp`, `showEmail`, `showHeader`, `showFooter`) VALUES
('El Piloto', '000-000000', 'Av. Venezuela #00', '809-000-0000', '809-000-0000', '809-000-0000', 'elpiloto@hotmail.com', 12, 'RD$', 'Ventas de Comida y Bebidas', 'Gracias por su compra.\n<br /> \nFeliz Navidad !', '0', '1', '1', '1', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `factura_detalle`
--
ALTER TABLE `factura_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `factura_maestra`
--
ALTER TABLE `factura_maestra`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_orden` (`numero_orden`);

--
-- Indexes for table `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `ncf`
--
ALTER TABLE `ncf`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `factura_detalle`
--
ALTER TABLE `factura_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `factura_maestra`
--
ALTER TABLE `factura_maestra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `inventario`
--
ALTER TABLE `inventario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `ncf`
--
ALTER TABLE `ncf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
