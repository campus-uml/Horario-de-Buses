-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.9.3-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla horario_de_buses.boleto
CREATE TABLE IF NOT EXISTS `boleto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reserva_asiento_id` int(11) NOT NULL DEFAULT 0,
  `encomienda` char(50) NOT NULL DEFAULT '0',
  `costo` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_boleto_reserva_asientos` (`reserva_asiento_id`),
  CONSTRAINT `FK_boleto_reserva_asientos` FOREIGN KEY (`reserva_asiento_id`) REFERENCES `reserva_asientos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla horario_de_buses.boleto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `boleto` ENABLE KEYS */;

-- Volcando estructura para tabla horario_de_buses.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `cedula` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla horario_de_buses.clientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla horario_de_buses.reserva_asientos
CREATE TABLE IF NOT EXISTS `reserva_asientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL DEFAULT 0,
  `tranporte_id` int(11) NOT NULL DEFAULT 0,
  `num_asiento` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_reserva_asientos_clientes` (`cliente_id`),
  KEY `FK_reserva_asientos_transporte` (`tranporte_id`),
  CONSTRAINT `FK_reserva_asientos_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_reserva_asientos_transporte` FOREIGN KEY (`tranporte_id`) REFERENCES `transporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla horario_de_buses.reserva_asientos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `reserva_asientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva_asientos` ENABLE KEYS */;

-- Volcando estructura para tabla horario_de_buses.transporte
CREATE TABLE IF NOT EXISTS `transporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `origen` text NOT NULL,
  `destino` text NOT NULL,
  `hora` time DEFAULT NULL,
  `tipo_bus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla horario_de_buses.transporte: ~96 rows (aproximadamente)
/*!40000 ALTER TABLE `transporte` DISABLE KEYS */;
INSERT INTO `transporte` (`id`, `nombre`, `origen`, `destino`, `hora`, `tipo_bus`) VALUES
	(1, 'CORRALES', 'Ocotal', 'Managua', '04:00:00', 'Expreso'),
	(2, 'ORTEZ', 'Ocotal', 'Managua', '05:00:00', 'Expreso'),
	(3, 'BELTRAN', 'Ocotal', 'Managua', '06:30:00', 'Expreso'),
	(4, 'CORRALES', 'Ocotal', 'Managua', '07:45:00', 'Expreso'),
	(5, 'GAMEZ', 'Ocotal', 'Managua', '09:00:00', 'Expreso'),
	(6, 'ARRELLANO', 'Ocotal', 'Managua', '10:30:00', 'Expreso'),
	(7, 'PRADO', 'Ocotal', 'Managua', '11:30:00', 'Expreso'),
	(8, 'URIARTE', 'Ocotal', 'Managua', '12:30:00', 'Expreso'),
	(9, 'SANCHEZ', 'Ocotal', 'Managua', '01:30:00', 'Expreso'),
	(10, 'GAMEZ', 'Ocotal', 'Managua', '02:30:00', 'Expreso'),
	(11, 'ORTEZ', 'Ocotal', 'Managua', '03:30:00', 'Expreso'),
	(12, 'OSORIO', 'Ocotal', 'Esteli', '04:45:00', 'Ruteado'),
	(13, 'MA ANTONIETA', 'Ocotal', 'Esteli', '05:59:58', 'Ruteado'),
	(14, 'OSORIO', 'Ocotal', 'Esteli', '07:00:00', 'Ruteado'),
	(15, 'RUGAMA', 'Ocotal', 'Esteli', '07:30:00', 'Ruteado'),
	(16, 'EL GAMEZ', 'Ocotal', 'Esteli', '08:10:00', 'Ruteado'),
	(17, 'ARELLANO', 'Ocotal', 'Esteli', '10:00:00', 'Ruteado'),
	(18, 'ERNESTO JOSE', 'Ocotal', 'Esteli', '11:00:00', 'Ruteado'),
	(19, 'OSORIO', 'Ocotal', 'Esteli', '12:00:00', 'Ruteado'),
	(20, 'MA ANTONIETA', 'Ocotal', 'Esteli', '01:00:00', 'Ruteado'),
	(21, 'OSORIO', 'Ocotal', 'Esteli', '01:40:00', 'Ruteado'),
	(22, 'CABALLERO', 'Ocotal', 'Esteli', '02:10:00', 'Ruteado'),
	(23, 'GÁMEZ', 'Ocotal', 'Esteli', '02:50:00', 'Ruteado'),
	(24, 'LAGUNA/FENIX', 'Ocotal', 'Esteli', '04:00:00', 'Ruteado'),
	(25, 'ARELLANO', 'Ocotal', 'Esteli', '05:00:00', 'Ruteado'),
	(26, 'ERNESTO JOSÉ', 'Ocotal', 'Esteli', '06:00:00', 'Ruteado'),
	(27, 'RAMOS', 'Ocotal', 'Esteli', '03:45:00', 'Ruteado'),
	(28, 'DIAZ', 'Ocotal', 'Somoto', '05:45:00', 'Ruteado'),
	(29, 'ERNESTO JOSÉ', 'Ocotal', 'Somoto', '06:30:00', 'Ruteado'),
	(30, 'OSORIO', 'Ocotal', 'Somoto', '07:20:00', 'Ruteado'),
	(31, 'MARTINEZ', 'Ocotal', 'Somoto', '08:30:00', 'Ruteado'),
	(32, 'DIAZ', 'Ocotal', 'Somoto', '09:05:00', 'Expreso'),
	(33, 'ERNESTO JOSÉ', 'Ocotal', 'Somoto', '09:45:00', 'Ruteado'),
	(34, 'OSORIO', 'Ocotal', 'Somoto', '10:30:00', 'Ruteado'),
	(35, 'MARTINEZ', 'Ocotal', 'Somoto', '11:15:00', 'Ruteado'),
	(36, 'DIAZ', 'Ocotal', 'Somoto', '11:45:00', 'Ruteado'),
	(37, 'ERNESTO JOSÉ', 'Ocotal', 'Somoto', '12:45:00', 'Ruteado'),
	(38, 'OSORIO', 'Ocotal', 'Somoto', '01:30:00', 'Ruteado'),
	(39, 'MARTINEZ', 'Ocotal', 'Somoto', '02:25:00', 'Ruteado'),
	(40, 'DIAZ', 'Ocotal', 'Somoto', '03:25:00', 'Ruteado'),
	(41, 'RIVERA', 'Ocotal', 'Somoto', '04:30:00', 'Ruteado'),
	(42, 'OSORIO', 'Ocotal', 'Somoto', '05:30:00', 'Ruteado'),
	(43, 'OSORIO', 'Ocotal', 'Somoto', '06:30:00', 'Ruteado'),
	(44, 'RODRIGUEZ', 'Ocotal', 'Las Manos', '05:00:00', 'Ruteado'),
	(45, 'ORTIZ', 'Ocotal', 'Las Manos', '05:35:00', 'Ruteado'),
	(46, 'RODRIGUEZ', 'Ocotal', 'Las Manos', '06:10:00', 'Ruteado'),
	(47, 'CARRASCO', 'Ocotal', 'Las Manos', '06:45:00', 'Ruteado'),
	(48, 'ALTAMIRANO', 'Ocotal', 'Las Manos', '07:20:00', 'Ruteado'),
	(49, 'RIVERA', 'Ocotal', 'Las Manos', '07:55:00', 'Ruteado'),
	(50, 'CANALES', 'Ocotal', 'Las Manos', '08:30:00', 'Ruteado'),
	(51, 'ORTIZ', 'Ocotal', 'Las Manos', '09:05:00', 'Ruteado'),
	(52, 'RODRIGUEZ', 'Ocotal', 'Las Manos', '09:40:00', 'Ruteado'),
	(53, 'CARRASCO', 'Ocotal', 'Las Manos', '10:15:00', 'Ruteado'),
	(54, 'ALTAMIRANO', 'Ocotal', 'Las Manos', '10:50:00', 'Ruteado'),
	(55, 'RODRIGUEZ', 'Ocotal', 'Las Manos', '11:25:00', 'Ruteado'),
	(56, 'CANALES', 'Ocotal', 'Las Manos', '12:00:00', 'Ruteado'),
	(57, 'RIVERA', 'Ocotal', 'Las Manos', '12:35:00', 'Ruteado'),
	(58, 'ORTIZ', 'Ocotal', 'Las Manos', '01:10:00', 'Ruteado'),
	(59, 'RODRIGUEZ', 'Ocotal', 'Las Manos', '01:45:00', 'Ruteado'),
	(60, 'CARRASCO', 'Ocotal', 'Las Manos', '02:20:00', 'Ruteado'),
	(61, 'ALTAMIRANO', 'Ocotal', 'Las Manos', '02:55:00', 'Ruteado'),
	(62, 'CANALES', 'Ocotal', 'Las Manos', '03:30:00', 'Ruteado'),
	(63, 'ZELAYA', 'Ocotal', 'Las Manos', '04:05:00', 'Ruteado'),
	(64, 'RODRIGUEZ', 'Ocotal', 'Las Manos', '04:45:00', 'Ruteado'),
	(65, 'PAOLA', 'Ocotal', 'Jalapa', '05:45:00', 'Ruteado'),
	(66, 'CABALLERO', 'Ocotal', 'Jalapa', '06:35:00', 'Ruteado'),
	(67, 'RUIZ', 'Ocotal', 'Jalapa', '08:15:00', 'Ruteado'),
	(68, 'ELIZABETH', 'Ocotal', 'Jalapa', '09:40:00', 'Ruteado'),
	(69, 'PRADO', 'Ocotal', 'Jalapa', '10:30:00', 'Ruteado'),
	(70, 'MAIRENA', 'Ocotal', 'Jalapa', '11:30:00', 'Ruteado'),
	(71, 'LOPEZ', 'Ocotal', 'Jalapa', '12:40:00', 'Ruteado'),
	(72, 'AGURCIA', 'Ocotal', 'Jalapa', '01:45:00', 'Ruteado'),
	(73, 'RUGAMA', 'Ocotal', 'Jalapa', '02:30:00', 'Ruteado'),
	(74, 'PAGUAGA', 'Ocotal', 'Jalapa', '03:30:00', 'Ruteado'),
	(75, 'ORTIZ', 'Ocotal', 'Jalapa', '04:30:00', 'Ruteado'),
	(76, 'RODRIGUEZ', 'Ocotal', 'Murra', '05:15:00', 'Ruteado'),
	(77, 'RAMOS', 'Ocotal', 'Murra', '07:00:00', 'Ruteado'),
	(78, 'VILCHEZ', 'Ocotal', 'Murra', '08:45:00', 'Ruteado'),
	(79, 'RODRIGUEZ', 'Ocotal', 'Murra', '12:30:00', 'Ruteado'),
	(80, 'RODRIGUEZ', 'Ocotal', 'Murra', '01:25:00', 'Ruteado'),
	(81, 'GÓMEZ', 'Ocotal', 'Macuelizo', '06:00:00', 'Ruteado'),
	(89, 'GÓMEZ', 'Ocotal', 'Macuelizo', '07:30:00', 'Ruteado'),
	(90, 'GÓMEZ', 'Ocotal', 'Macuelizo', '10:15:00', 'Ruteado'),
	(91, 'GÓMEZ', 'Ocotal', 'Macuelizo', '12:00:00', 'Ruteado'),
	(92, 'GÓMEZ', 'Ocotal', 'Macuelizo', '02:00:00', 'Ruteado'),
	(93, 'GÓMEZ', 'Ocotal', 'Macuelizo', '04:00:00', 'Ruteado'),
	(94, 'PEREZ', 'Ocotal', 'Quilalí', '05:00:00', 'Ruteado'),
	(95, 'RODRIGUEZ', 'Ocotal', 'Quilalí', '12:00:00', 'Ruteado'),
	(96, 'VÁSQUEZ', 'Ocotal', 'Quilalí', '02:00:00', 'Ruteado'),
	(97, 'ZELAYA', 'Ocotal', 'Jicaro', '06:15:00', 'Ruteado'),
	(98, 'CARDOZA', 'Ocotal', 'Jicaro', '10:45:00', 'Ruteado'),
	(99, 'GUTIERREZ', 'Ocotal', 'Jicaro', '03:20:00', 'Ruteado'),
	(100, 'SEVILLA', 'Ocotal', 'Jicaro', '05:00:00', 'Ruteado'),
	(101, 'BRIONES/ESPINOZA', 'Ocotal', 'Wiwili', '07:45:00', 'Ruteado'),
	(102, 'LAGUNA/FENIX', 'Ocotal', 'Wiwili', '09:10:00', 'Ruteado'),
	(103, 'AGURCIA', 'Ocotal', 'Ciudad Antigua', '05:00:00', 'Ruteado'),
	(104, 'AGURCIA', 'Ocotal', 'Ciudad Antigua', '09:00:00', 'Ruteado'),
	(105, 'AGURCIA', 'Ocotal', 'Ciudad Antigua', '12:00:00', 'Ruteado'),
	(106, 'AGURCIA', 'Ocotal', 'Ciudad Antigua', '04:00:00', 'Ruteado'),
	(107, 'ALCALDIA', 'Ocotal', 'SantaMaria', '12:15:00', 'Ruteado'),
	(108, 'PAOLA', 'Ocotal', 'SantaMaria', '01:15:00', 'Ruteado'),
	(109, 'MONTANO', 'Ocotal', 'El Suyatal', '02:25:00', 'Ruteado');
/*!40000 ALTER TABLE `transporte` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
