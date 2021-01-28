-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2020 a las 18:47:53
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facturacionsifac`
--
CREATE DATABASE IF NOT EXISTS `facturacionsifac` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `facturacionsifac`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE IF NOT EXISTS `auditoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) DEFAULT NULL,
  `nombre_pc` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instancia` smallint(6) NOT NULL,
  `fecha_real` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `fecha` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `hora` time NOT NULL COMMENT '(DC2Type:carbontime)',
  `actividad` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `advertencia` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AF4BB49D67B3B43D` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

DROP TABLE IF EXISTS `bancos`;
CREATE TABLE IF NOT EXISTS `bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listas_id` int(11) DEFAULT NULL,
  `codigo` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` smallint(6) DEFAULT NULL,
  `numero_cuenta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `bancoop` smallint(6) DEFAULT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EAADF3A89A111542` (`listas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`id`, `listas_id`, `codigo`, `tipo`, `numero_cuenta`, `saldo`, `bancoop`, `observacion`) VALUES
(1, 55, 'Bp001', 0, '1236547899', '850.80', 0, NULL),
(2, 56, 'Ba001', 0, '3214569877', '992.30', 0, NULL),
(3, 57, 'C.JA', 1, '3214587441', '1000.00', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

DROP TABLE IF EXISTS `bodega`;
CREATE TABLE IF NOT EXISTS `bodega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleados_id` int(11) DEFAULT NULL,
  `tipo` smallint(6) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ubicacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `codigo` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5CD2A5FC13DA66E` (`empleados_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `bodega`
--

INSERT INTO `bodega` (`id`, `empleados_id`, `tipo`, `nombre`, `descripcion`, `ubicacion`, `estado`, `deleted_at`, `codigo`) VALUES
(1, NULL, 0, 'test', 'test', 'local', 1, '2019-05-29 15:08:38', '1234'),
(2, NULL, 0, 'mmmmmmm', 'nnnn', 'mmmmm', 1, '2019-05-30 01:11:41', '01'),
(3, NULL, 0, 'mnmnmn', 'kjkjkjk', 'kjikjkj', 1, '2019-05-30 04:36:34', '12121ghg'),
(4, NULL, 0, 'hjhjhhjh', 'ljkjkljlkj', 'lljklñj', 1, '2019-05-30 04:36:31', 'j21212121'),
(5, NULL, 0, 'BODEGA GENERAL', 'BBBBB', 'MMMMM', 1, '2019-06-18 13:35:04', '0001'),
(6, 2, 0, 'BODEGA CENTRAL', 'otra bodega', 'casa', 1, NULL, '0012'),
(7, 2, 0, 'BODEGA SUR', 'SUR', 'SUR', 1, NULL, '0004');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega_inventario`
--

DROP TABLE IF EXISTS `bodega_inventario`;
CREATE TABLE IF NOT EXISTS `bodega_inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventario_id` int(11) NOT NULL,
  `bodega_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BB03EE0DDFDFBE2A` (`inventario_id`),
  KEY `IDX_BB03EE0D8B1FDE9D` (`bodega_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `bodega_inventario`
--

INSERT INTO `bodega_inventario` (`id`, `inventario_id`, `bodega_id`, `cantidad`) VALUES
(15, 1, 6, 1),
(16, 2, 6, 13),
(17, 1, 7, 6),
(18, 3, 6, 10),
(19, 5, 6, 1),
(20, 17, 6, 5),
(21, 4, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro_costos`
--

DROP TABLE IF EXISTS `centro_costos`;
CREATE TABLE IF NOT EXISTS `centro_costos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cierre_caja`
--

DROP TABLE IF EXISTS `cierre_caja`;
CREATE TABLE IF NOT EXISTS `cierre_caja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) DEFAULT NULL,
  `historial` smallint(6) NOT NULL,
  `caja` smallint(6) NOT NULL,
  `fecha_apertura` date DEFAULT NULL COMMENT '(DC2Type:carbondate)',
  `fecha_cierre` date DEFAULT NULL COMMENT '(DC2Type:carbondate)',
  `saldo_inicial` decimal(8,2) DEFAULT NULL,
  `ingreso_efectivo` decimal(8,2) DEFAULT NULL,
  `ingreso_cheque` decimal(8,2) DEFAULT NULL,
  `ingreso_tarjeta_c` decimal(8,2) DEFAULT NULL,
  `ingreso_tarjeta_d` decimal(8,2) DEFAULT NULL,
  `egresos` decimal(10,2) DEFAULT NULL,
  `saldo_final` decimal(10,2) DEFAULT NULL,
  `saldo_cierre` decimal(10,2) DEFAULT NULL,
  `sobrante` decimal(10,2) DEFAULT NULL,
  `faltante` decimal(10,2) DEFAULT NULL,
  `responsable` smallint(6) DEFAULT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2B6E1081DB38439E` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cierre_caja`
--

INSERT INTO `cierre_caja` (`id`, `usuario_id`, `historial`, `caja`, `fecha_apertura`, `fecha_cierre`, `saldo_inicial`, `ingreso_efectivo`, `ingreso_cheque`, `ingreso_tarjeta_c`, `ingreso_tarjeta_d`, `egresos`, `saldo_final`, `saldo_cierre`, `sobrante`, `faltante`, `responsable`, `observacion`) VALUES
(1, 1, 1, 1, '2019-11-12', '2019-11-22', '1000.00', '881.40', '13.05', '0.00', NULL, '467.59', '894.45', '894.45', NULL, '0.05', 1, 'cierre de caja 22-11-2019');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_proveedor`
--

DROP TABLE IF EXISTS `cliente_proveedor`;
CREATE TABLE IF NOT EXISTS `cliente_proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `empleados_id` int(11) DEFAULT NULL,
  `tipocp` smallint(6) NOT NULL,
  `tipoidentidad` smallint(6) NOT NULL,
  `cedula` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razonsocial` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `representante` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria` smallint(6) DEFAULT NULL,
  `tipo` smallint(6) DEFAULT NULL,
  `parterelacionada` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ubicacion` smallint(6) DEFAULT NULL,
  `direccion` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lugar` smallint(6) DEFAULT NULL,
  `zona` smallint(6) DEFAULT NULL,
  `ciudad` smallint(6) DEFAULT NULL,
  `pais` smallint(6) DEFAULT NULL,
  `telefono` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail2` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maximocredito` decimal(10,2) DEFAULT NULL,
  `maximodias` decimal(10,2) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `estadocredito` tinyint(1) DEFAULT NULL,
  `deudaacumulada` decimal(10,2) DEFAULT NULL,
  `anticipos` decimal(10,2) DEFAULT NULL,
  `notascredito` decimal(10,2) DEFAULT NULL,
  `puntos` smallint(6) DEFAULT NULL,
  `precioventapre` tinyint(1) DEFAULT NULL,
  `subcliprove` smallint(6) DEFAULT NULL,
  `sexo` tinyint(1) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL COMMENT '(DC2Type:carbondate)',
  `hijos` smallint(6) DEFAULT NULL,
  `profesion` smallint(6) DEFAULT NULL,
  `empresa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingreso_mensual` decimal(10,2) DEFAULT NULL,
  `referido` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intereses` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `huella` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `estado_civil` smallint(6) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `codigoauxiliar` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigoacceso` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estadoacceso` tinyint(1) DEFAULT NULL,
  `cuentaspagar` decimal(10,2) DEFAULT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retencion_renta` smallint(6) DEFAULT NULL,
  `retencion_bienes` smallint(6) DEFAULT NULL,
  `retencion_servicios` smallint(6) DEFAULT NULL,
  `obligado_contabilidad` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interes` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1CDE70AC13DA66E` (`empleados_id`),
  KEY `IDX_1CDE70AA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente_proveedor`
--

INSERT INTO `cliente_proveedor` (`id`, `user_id`, `empleados_id`, `tipocp`, `tipoidentidad`, `cedula`, `nombre`, `razonsocial`, `representante`, `categoria`, `tipo`, `parterelacionada`, `ubicacion`, `direccion`, `referencia`, `lugar`, `zona`, `ciudad`, `pais`, `telefono`, `celular`, `mail`, `mail2`, `web`, `maximocredito`, `maximodias`, `descuento`, `estadocredito`, `deudaacumulada`, `anticipos`, `notascredito`, `puntos`, `precioventapre`, `subcliprove`, `sexo`, `fechanacimiento`, `hijos`, `profesion`, `empresa`, `ingreso_mensual`, `referido`, `intereses`, `huella`, `imagen`, `estado`, `estado_civil`, `deleted_at`, `codigoauxiliar`, `codigoacceso`, `estadoacceso`, `cuentaspagar`, `observacion`, `retencion_renta`, `retencion_bienes`, `retencion_servicios`, `obligado_contabilidad`, `interes`) VALUES
(1, 1, NULL, 1, 1, '1400722128001', 'MARTHA  MOROCHO', 'MARTHA MOROCHO', '.....', 3, 1, 'NO', 1, 'MACAS', NULL, NULL, NULL, 4, 5, '205704192', NULL, NULL, 'loqueseaahora@gmail.com', 'http://www.zionsifac.com', NULL, NULL, NULL, NULL, '218.76', '237.60', '44.80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, NULL, 1, 0, '1400730105', 'jhona', 'jhona', 'jhona', 3, 1, 'SI', 1, 'jha', NULL, NULL, NULL, 4, 5, '0991450275', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-07-05 09:34:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, NULL, 1, 0, '1400416978', 'NICOLAS  ALEJANDRO CARDENAS MOROCHO', 'NICOLAS  ALEJANDRO CARDENAS MOROCHO', 'NICOLAS', 2, 44, NULL, 2, 'MACAS- GUAMOTE Y TARQUI', NULL, NULL, NULL, 4, 5, '1234123458', NULL, 'zion@zionsifac.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '160.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'prueba', NULL, NULL, NULL, NULL, NULL),
(4, 1, NULL, 0, 0, '1400416978', 'Cardenas Romina', 'Cardenas Romina', 'nadie', 11, 24, NULL, 1, 'Macas guamote  y tarqui', NULL, 26, 25, 4, 15, '1234123458', NULL, 'zioncomputadoras@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'C01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, NULL, 1, 0, '1714449806', 'santiago alfredo rivera', 'santiago alfredo rivera', '.', 7, 32, NULL, 0, 'magdalena ', NULL, NULL, NULL, 12, 5, '0230033219', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '35.84', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, NULL, 0, 0, '9999999999999', 'Consumidor Final', 'Consumidor Final', NULL, 0, 0, NULL, NULL, 'N/A', NULL, NULL, NULL, 0, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO', NULL),
(7, 1, NULL, 0, 0, '1723494975', 'Jose Casalino Martinez', 'Jose Casalino Martinez', 'jose ', 11, 24, '0', 0, 'mi casa 66 y el vecino', NULL, 26, 25, 12, 5, NULL, NULL, 'josecasalino@hotmail.com', NULL, NULL, '2000.00', '60.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-05-22 16:19:03', '001', NULL, 0, NULL, 'prueba', NULL, NULL, NULL, NULL, NULL),
(8, 1, NULL, 0, 0, '1723494975', 'Jorge Cuara Vasquez', 'Jorge Cuara Vasquez', 'juan', 11, 24, '0', 0, 'Chillogallo', NULL, 26, 25, 4, 5, '356241254', NULL, 'cuar_123@hotmail.com', NULL, NULL, '5000.00', '60.00', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, 0, '2019-06-25', 1, NULL, NULL, '12000.00', NULL, NULL, NULL, NULL, 1, 1, NULL, 'J01', NULL, 0, NULL, 'aaaaa', 1, 41, NULL, NULL, NULL),
(9, 1, NULL, 0, 0, '1723494967', 'Pedro Illesca fuentes', 'Pedro Illesca fuentes', 'juan', 11, 24, '0', 0, 'Solanda', NULL, 26, 25, 4, 13, '022802020', NULL, 'ddfg_22233@provida.com', NULL, NULL, '39999.00', '30.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '0002', NULL, NULL, NULL, 'ssss', NULL, NULL, NULL, NULL, NULL),
(10, 1, NULL, 0, 0, '1723494975001', 'Farmacia mi vecino', 'Farmacia mi vecino', 'pedro', 11, 24, NULL, 1, 'guasmo', NULL, 26, 25, 4, 15, '065241523', NULL, 'mifarmacia@gmail.com', NULL, NULL, '190000.00', '60.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-05-29 05:24:55', '00000', NULL, NULL, NULL, 'dddd', NULL, NULL, NULL, NULL, NULL),
(11, 1, NULL, 0, 0, '1400416978', 'NICOLAS CARDENAS', 'NICOLAS CARDENAS', 'DDDDD', 11, 24, NULL, 1, 'MACAS', NULL, 26, 25, 4, 13, '1234123458', '123457877', 'zioncomputadoras@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 1, NULL, 0, 0, '1400722128', 'REPETIDO REPTIDO', 'REPETIDO REPTIDO', 'SSS', 11, 24, NULL, 0, 'MACAS', NULL, 26, 30, 16, 5, NULL, NULL, 'zioncomputadoras@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-05-30 04:48:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1, NULL, 1, 0, '1400715866', 'SAUL MOROCHO SA', 'SAUL MOROCHO SA', 'N/A', 2, 32, 'NO', 0, 'MACAS', NULL, NULL, NULL, 4, 5, '701006056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '120.00', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 1, NULL, 1, 0, '1723494975', 'Jorge Castillo Perez', 'Jorge Castillo Perez', 'Jorge Castillo', 7, 32, 'NO', 0, 'parque Carolina', NULL, NULL, NULL, 12, 5, '022545988', NULL, 'prueba@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 1, NULL, 1, 0, '1400941835', 'VALERIA CABRERA', 'VALERIA CABRERA', NULL, 8, 32, 'SI', 2, 'AMAZONAS Y SUCRE', NULL, NULL, NULL, NULL, NULL, '072700728', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 1, NULL, 1, 0, '1400584833', 'ORELLANA VELEZ FABIAN', 'Fabian Orellana', '-', 7, 44, 'NO', 0, 'peatonal 4', NULL, NULL, NULL, 45, 5, '999405221', NULL, 'fabian_ore@hotmail.com', 'fabian_ore@hotmail.com', NULL, '2500.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'eSTA E UNA OBSERVACION', NULL, NULL, NULL, NULL, NULL),
(17, 1, NULL, 0, 1, '1400782825001', 'TECNICONS PARCK', 'TECNICONS PARCK', 'KEVIN YANZA', 11, 46, NULL, 0, 'MACAS', NULL, 26, 25, 4, 5, '072704192', '0983790375', 'kevinparyanza@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-06-18 11:59:43', 'T01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO', NULL),
(18, 1, NULL, 0, 1, '1400782825001', 'KEVIN PATRICIO YANZA RIVERA', 'KEVIN PATRICIO YANZA RIVERA', 'kevin yanza', 11, 46, NULL, 0, 'RIO BLANCO', NULL, 26, 25, 47, 5, '072704192', '0983790374', 'zioncomputadoras@gmail.com', NULL, NULL, '1000.00', '30.00', '10.00', NULL, '130.00', '250.00', '100.00', 100, NULL, NULL, NULL, '2019-06-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO', NULL),
(19, 1, NULL, 1, 1, '0603191578001', 'QUISNIA TIERRA JORGE ENRIQUE', 'QUISNIA TIERRA JORGE ENRIQUE', 'N/A', 2, 44, NULL, 0, 'Barrio Langos Chico km 5', NULL, NULL, NULL, 16, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 1, NULL, 1, 1, '1400493498001', 'MICROMERCADO MC', 'CHIMBO VASQUEZ MARIELA NOEMI', NULL, NULL, 1, NULL, NULL, 'VEINTINUEVE DE MAYO Y SOASTI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 1, NULL, 1, 1, '1400671218001', 'ZOENET', 'MARIN ROJAS DARWIN MANFREDO', NULL, NULL, 1, NULL, NULL, 'AV ORIENTAL Y SERAFIN SOLIS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobros_pagos`
--

DROP TABLE IF EXISTS `cobros_pagos`;
CREATE TABLE IF NOT EXISTS `cobros_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_proveedor_id` int(11) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `operacion` smallint(6) NOT NULL,
  `tipo` smallint(6) DEFAULT NULL,
  `caja` smallint(6) NOT NULL,
  `fecha` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `hora` time NOT NULL COMMENT '(DC2Type:carbontime)',
  `forma_pago` smallint(6) DEFAULT NULL,
  `tipotarjeta` smallint(6) DEFAULT NULL,
  `capital_cobrado` double DEFAULT NULL,
  `intereses` double DEFAULT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_anulacion` date DEFAULT NULL COMMENT '(DC2Type:carbondate)',
  `motivo_anulacion` smallint(6) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `usuario_anula` smallint(6) DEFAULT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `numero_documento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bancos_id` int(11) DEFAULT NULL,
  `adicional` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posfechado` tinyint(1) DEFAULT NULL,
  `fecha_cobrar` date DEFAULT NULL COMMENT '(DC2Type:carbondate)',
  `refferencia` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D9581D169F3C9BC1` (`cliente_proveedor_id`),
  KEY `IDX_D9581D1667B3B43D` (`users_id`),
  KEY `IDX_D9581D16279A5D5E` (`sucursal_id`),
  KEY `IDX_D9581D1626DCA429` (`bancos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cobros_pagos`
--

INSERT INTO `cobros_pagos` (`id`, `cliente_proveedor_id`, `users_id`, `operacion`, `tipo`, `caja`, `fecha`, `hora`, `forma_pago`, `tipotarjeta`, `capital_cobrado`, `intereses`, `observacion`, `fecha_anulacion`, `motivo_anulacion`, `estado`, `usuario_anula`, `sucursal_id`, `deleted_at`, `numero_documento`, `bancos_id`, `adicional`, `posfechado`, `fecha_cobrar`, `refferencia`) VALUES
(5, 1, 1, 1, 1, 1, '2019-08-08', '18:38:11', 0, NULL, 257.33, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '002', NULL, NULL, NULL, NULL, NULL),
(6, 1, 1, 1, 1, 1, '2019-08-12', '18:12:45', 2, NULL, 66.67, 0, 'anulación de pago', '2019-08-12', 0, 0, 1, 1, NULL, '123654', 1, NULL, NULL, NULL, NULL),
(7, 1, 1, 1, 1, 1, '2019-08-12', '20:45:07', 2, NULL, 11.2, 0, 'Anulación pago', '2019-08-12', 1, 0, 1, 1, NULL, '36', 1, '001-001-123654789, ', NULL, NULL, NULL),
(8, 1, 1, 1, 1, 1, '2019-08-13', '00:04:09', 0, NULL, 89.06, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '00369', NULL, '001-001-3256, 001-001-123654789, ', NULL, NULL, NULL),
(9, 1, 1, 0, 2, 1, '2019-08-14', '17:40:12', 1, NULL, 100, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '258', 2, NULL, NULL, NULL, NULL),
(10, 3, 1, 0, 2, 1, '2019-08-14', '17:41:55', 0, NULL, 50, 0, 'Anticipo', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 1, 1, 0, 2, 1, '2019-08-15', '23:13:34', 1, NULL, 10, 0, 'Anticipo', NULL, NULL, 1, NULL, 1, NULL, '10', 2, NULL, NULL, NULL, NULL),
(12, 3, 1, 0, 2, 1, '2019-08-15', '23:17:03', 1, NULL, 10, 0, 'Anticipo', NULL, NULL, 1, NULL, 1, NULL, '11', 2, NULL, NULL, NULL, NULL),
(13, 13, 1, 0, 2, 1, '2019-08-15', '23:22:16', 1, NULL, 10, 0, 'Anticipo', NULL, NULL, 1, NULL, 1, NULL, '13', 2, NULL, NULL, NULL, NULL),
(14, 13, 1, 0, 2, 1, '2019-08-15', '23:22:33', 1, NULL, 5, 0, 'Anticipo', NULL, NULL, 1, NULL, 1, NULL, '14', 2, NULL, NULL, NULL, NULL),
(15, 13, 1, 0, 2, 1, '2019-08-15', '23:24:46', 1, NULL, 5, 0, 'Anticipo', NULL, NULL, 1, NULL, 1, NULL, '15', 2, NULL, NULL, NULL, NULL),
(16, 1, 1, 1, 0, 1, '2019-11-12', '22:30:37', 3, NULL, 44.8, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '569', 2, NULL, NULL, NULL, NULL),
(17, 3, 1, 1, 0, 1, '2019-11-12', '22:35:09', 3, NULL, 22.4, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '4569', 1, NULL, NULL, NULL, NULL),
(18, 1, 1, 1, 0, 1, '2019-11-12', '22:36:09', 3, NULL, 10, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '1233', 1, NULL, NULL, NULL, NULL),
(25, 1, 1, 1, 0, 1, '2019-11-12', '23:36:57', 2, NULL, 16.8, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '56567', 1, NULL, NULL, NULL, NULL),
(26, 1, 1, 1, 0, 1, '2019-11-13', '22:02:49', 5, NULL, 22.4, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 5, 1, 1, 1, 1, '2019-11-15', '21:47:28', 0, NULL, 112, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '123654', NULL, '001-001-12, ', NULL, NULL, NULL),
(28, 1, 1, 1, 1, 1, '2019-11-15', '22:02:17', 2, NULL, 29.87, 0, NULL, '2019-11-15', 0, 0, 1, 1, NULL, '258', 1, '001-002-654, ', NULL, NULL, NULL),
(29, 1, 1, 1, 1, 1, '2019-11-15', '22:40:27', 4, NULL, 29.87, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '001-002-654, ', NULL, NULL, NULL),
(30, 3, 1, 0, 2, 1, '2019-11-19', '17:02:59', 1, NULL, 50, 50, 'Anticipos a proveedor', NULL, NULL, 1, NULL, 1, NULL, '9685', 1, NULL, NULL, NULL, NULL),
(31, 1, 1, 1, 0, 1, '2019-11-19', '17:41:53', 0, NULL, 22.4, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '789', NULL, NULL, NULL, NULL, NULL),
(32, 13, 1, 1, 2, 1, '2019-11-19', '17:48:07', 1, NULL, 100, 100, 'Anticipos', NULL, NULL, 1, NULL, 1, NULL, '8', 1, NULL, NULL, NULL, NULL),
(33, 1, 1, 1, 1, 1, '2019-11-19', '19:58:10', 0, NULL, 29.87, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '123654', NULL, '001-002-654, ', NULL, NULL, NULL),
(34, 18, 1, 0, 1, 1, '2019-11-20', '17:44:16', 0, NULL, 13.05, 0, 'Anulación de pago', '2019-11-20', 0, 0, 1, 1, NULL, NULL, NULL, '001-004-2, ', NULL, NULL, 'Recibido por: Jhonatan Mejia Número: 258'),
(35, 18, 1, 0, 1, 1, '2019-11-20', '17:52:08', 0, NULL, 12.04, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '001-004-2, ', NULL, NULL, 'Recibido por: Jhonatan Mejia Número: 533'),
(36, 18, 1, 0, 1, 1, '2019-11-20', '19:45:25', 2, NULL, 13.05, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '4322', 2, '001-004-2, ', 1, '2019-11-30', 'Recibido por: Jhonatan Mejia Número: 4322'),
(37, 18, 1, 0, 2, 1, '2019-11-20', '20:24:18', 0, NULL, 100, 50, 'Anticipo', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 1, 1, 1, 2, 1, '2019-11-20', '20:24:52', 0, NULL, 100, 100, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 3, 1, 1, 2, 1, '2019-11-20', '20:29:06', 0, NULL, 50, 50, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 1, 1, 1, 2, 1, '2019-11-20', '20:31:29', 0, NULL, 50, 50, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 18, 1, 0, 2, 1, '2019-11-20', '20:32:00', 0, NULL, 50, 50, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 18, 1, 0, 2, 1, '2019-11-20', '21:29:48', 1, NULL, 50, 50, NULL, NULL, NULL, 1, NULL, 1, NULL, '9876543', 2, NULL, NULL, NULL, NULL),
(43, 8, 1, 0, 2, 1, '2019-11-20', '21:33:28', 0, NULL, 50, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 18, 1, 1, 0, 1, '2019-12-11', '15:47:52', 0, NULL, 30, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 6, 1, 1, 0, 1, '2019-12-17', '21:02:23', 0, NULL, 29.7, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 6, 1, 1, 0, 1, '2020-03-13', '20:32:33', 0, NULL, 160, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 6, 1, 1, 0, 1, '2020-03-13', '20:44:52', 0, NULL, 160, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 6, 1, 1, 0, 1, '2020-03-13', '21:10:02', 0, NULL, 160, 0, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes_meses`
--

DROP TABLE IF EXISTS `componentes_meses`;
CREATE TABLE IF NOT EXISTS `componentes_meses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `componentes_rol_id` int(11) NOT NULL,
  `mes` smallint(6) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F35EBCD6DE05162A` (`componentes_rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes_rol`
--

DROP TABLE IF EXISTS `componentes_rol`;
CREATE TABLE IF NOT EXISTS `componentes_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_cuentas_id` int(11) DEFAULT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_abreviado` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` smallint(6) NOT NULL,
  `origen` smallint(6) NOT NULL,
  `valor` double DEFAULT NULL,
  `ubicacion` smallint(6) DEFAULT NULL,
  `formula` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `texto` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modificable` tinyint(1) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_70CD053699EAF094` (`plan_cuentas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_ventas`
--

DROP TABLE IF EXISTS `compras_ventas`;
CREATE TABLE IF NOT EXISTS `compras_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cliente_proveedor_id` int(11) NOT NULL,
  `bodega_id` int(11) DEFAULT NULL,
  `tipocom` smallint(6) NOT NULL,
  `sustento` smallint(6) NOT NULL,
  `documento` smallint(6) DEFAULT NULL,
  `tributable` tinyint(1) DEFAULT NULL,
  `tipodoc` smallint(6) DEFAULT NULL,
  `gasto` smallint(6) DEFAULT NULL,
  `caja` smallint(6) NOT NULL,
  `fecha_emision` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `fecha_registro` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `hora` time NOT NULL COMMENT '(DC2Type:carbontime)',
  `subcliprove` smallint(6) DEFAULT NULL,
  `establecimiento` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `punto_emision` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` bigint(20) NOT NULL,
  `autorizacion` varchar(49) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pago` smallint(6) DEFAULT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suma` decimal(10,2) DEFAULT NULL,
  `descuento_porcentaje` decimal(10,2) DEFAULT NULL,
  `descuento_valor` decimal(10,2) DEFAULT NULL,
  `descuento_item` decimal(10,2) DEFAULT NULL,
  `mercaderia0` decimal(10,2) DEFAULT NULL,
  `mercaderia12` decimal(10,2) DEFAULT NULL,
  `servicio0` decimal(10,2) DEFAULT NULL,
  `servicio12` decimal(10,2) DEFAULT NULL,
  `iva_mercaderia` decimal(10,2) DEFAULT NULL,
  `iva_servicios` decimal(10,2) DEFAULT NULL,
  `ice_mercaderia` decimal(10,2) DEFAULT NULL,
  `ice_servicios` decimal(10,2) DEFAULT NULL,
  `subtotal0` decimal(10,2) DEFAULT NULL,
  `subtotal12` decimal(10,2) DEFAULT NULL,
  `costo0` decimal(10,2) DEFAULT NULL,
  `costo12` decimal(10,2) DEFAULT NULL,
  `total_parcial` decimal(10,2) DEFAULT NULL,
  `transporte` decimal(10,2) DEFAULT NULL,
  `financiamiento` decimal(10,2) DEFAULT NULL,
  `otros_cargos` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `subsidio` decimal(10,2) DEFAULT NULL,
  `fecha_utilidad` date DEFAULT NULL COMMENT '(DC2Type:carbondate)',
  `retencion` smallint(6) DEFAULT NULL,
  `asiento` smallint(6) DEFAULT NULL,
  `fecha_anulacion` date DEFAULT NULL COMMENT '(DC2Type:carbondate)',
  `anulausuario` smallint(6) DEFAULT NULL,
  `impresion` tinyint(1) DEFAULT NULL,
  `referencia` bigint(20) DEFAULT NULL,
  `estado` smallint(6) NOT NULL,
  `sucursal_id` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `recibido` decimal(10,2) DEFAULT NULL,
  `vuelto` decimal(10,2) DEFAULT NULL,
  `clave_acceso` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_objeto` decimal(10,2) DEFAULT NULL,
  `excento` decimal(10,2) DEFAULT NULL,
  `deducible` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BFFF00199F3C9BC1` (`cliente_proveedor_id`),
  KEY `IDX_BFFF00198B1FDE9D` (`bodega_id`),
  KEY `IDX_BFFF0019279A5D5E` (`sucursal_id`),
  KEY `IDX_BFFF0019952BE730` (`empleado_id`),
  KEY `IDX_BFFF0019A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compras_ventas`
--

INSERT INTO `compras_ventas` (`id`, `empleado_id`, `user_id`, `cliente_proveedor_id`, `bodega_id`, `tipocom`, `sustento`, `documento`, `tributable`, `tipodoc`, `gasto`, `caja`, `fecha_emision`, `fecha_registro`, `hora`, `subcliprove`, `establecimiento`, `punto_emision`, `numero`, `autorizacion`, `forma_pago`, `observacion`, `suma`, `descuento_porcentaje`, `descuento_valor`, `descuento_item`, `mercaderia0`, `mercaderia12`, `servicio0`, `servicio12`, `iva_mercaderia`, `iva_servicios`, `ice_mercaderia`, `ice_servicios`, `subtotal0`, `subtotal12`, `costo0`, `costo12`, `total_parcial`, `transporte`, `financiamiento`, `otros_cargos`, `total`, `saldo`, `subsidio`, `fecha_utilidad`, `retencion`, `asiento`, `fecha_anulacion`, `anulausuario`, `impresion`, `referencia`, `estado`, `sucursal_id`, `deleted_at`, `recibido`, `vuelto`, `clave_acceso`, `no_objeto`, `excento`, `deducible`) VALUES
(106, NULL, 1, 1, 6, 10, 36, 38, NULL, 0, NULL, 1, '2019-07-30', '2019-07-30', '16:32:29', NULL, '001', '001', 321, '1236565656', 1, NULL, '0.00', NULL, '0.00', NULL, '0.00', '200.00', '0.00', '0.00', '24.00', '0.00', NULL, NULL, '0.00', '200.00', NULL, NULL, '200.00', NULL, NULL, NULL, '224.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '3007201907140072212800110010010000003211907301610', '0.00', '0.00', 0),
(108, NULL, 1, 1, 6, 11, 36, NULL, NULL, 0, NULL, 1, '2019-07-30', '2019-07-30', '17:01:32', NULL, '001', '001', 321, '1236565656', NULL, 'Nota', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '40.00', NULL, NULL, NULL, NULL, NULL, NULL, '47.20', NULL, NULL, NULL, NULL, NULL, '2019-08-02', 1, 0, 106, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, NULL, 1, 3, 6, 11, 36, NULL, NULL, 0, NULL, 1, '2019-07-30', '2019-07-30', '19:09:45', NULL, '001', '001', 33, '1234678933', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '20.00', NULL, NULL, NULL, NULL, NULL, NULL, '22.40', NULL, NULL, NULL, NULL, NULL, '2019-08-02', 1, 0, 106, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, NULL, 1, 5, 7, 10, 36, 38, NULL, 0, NULL, 1, '2019-07-30', '2019-07-30', '21:16:11', NULL, '001', '001', 12, '1234678935', 1, NULL, '0.00', NULL, '0.00', NULL, '0.00', '100.00', '0.00', '0.00', '12.00', '0.00', NULL, NULL, '0.00', '100.00', NULL, NULL, '100.00', NULL, NULL, NULL, '112.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '3007201907140072212800110010010000000121907302110', '0.00', '0.00', 0),
(111, NULL, 1, 1, 6, 11, 36, NULL, NULL, 0, NULL, 1, '2019-07-30', '2019-07-30', '22:26:43', NULL, '001', '001', 7, '1234678991', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '224.00', '0.00', '0.00', '7.20', '0.00', NULL, NULL, '0.00', '20.00', NULL, NULL, NULL, NULL, NULL, NULL, '24.80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 106, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, NULL, 1, 5, NULL, 12, 36, NULL, NULL, 1, NULL, 1, '2019-07-30', '2019-08-02', '20:53:07', NULL, '001', '001', 36, '7412589633', NULL, 'nota debito', NULL, NULL, NULL, NULL, '10.00', '5.00', '10.00', '5.00', '0.60', '0.60', NULL, NULL, '20.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, '31.20', NULL, NULL, NULL, NULL, NULL, '2019-08-02', 1, 0, 110, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, NULL, 1, 1, 6, 11, 36, NULL, NULL, 1, NULL, 1, '2019-07-30', '2019-08-02', '21:48:52', NULL, '001', '001', 98, '7412589657', NULL, NULL, NULL, NULL, NULL, NULL, '10.00', '5.00', '10.00', '5.00', '0.60', '0.60', NULL, NULL, '20.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, '31.20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 106, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, NULL, 1, 1, 6, 11, 36, NULL, NULL, 0, NULL, 1, '2019-07-30', '2019-08-02', '23:17:49', NULL, '001', '001', 336, '7412589654', NULL, 'nota credito', NULL, NULL, NULL, NULL, '0.00', '112.00', '0.00', '0.00', '2.40', '0.00', NULL, NULL, '0.00', '20.00', NULL, NULL, NULL, NULL, NULL, NULL, '22.40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, NULL, 1, 20, 6, 11, 36, NULL, NULL, 0, NULL, 1, '2019-07-30', '2019-08-02', '23:21:31', NULL, '001', '001', 45, '7412589656', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '224.00', '0.00', '0.00', '2.40', '0.00', NULL, NULL, '0.00', '20.00', NULL, NULL, NULL, NULL, NULL, NULL, '22.40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 106, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, NULL, 1, 1, 6, 10, 36, 38, NULL, 0, NULL, 1, '2019-08-06', '2019-08-06', '22:11:16', NULL, '001', '001', 3256, '7412589652', 1, NULL, '0.00', NULL, '0.00', NULL, '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, '100.00', '0.00', NULL, NULL, '100.00', NULL, NULL, NULL, '100.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '0608201907140072212800110010010000032561908062215', '0.00', '0.00', 0),
(118, NULL, 1, 1, 6, 10, 36, 38, NULL, 0, NULL, 1, '2019-08-12', '2019-08-12', '20:44:22', NULL, '001', '001', 123654789, '1236549877', 1, NULL, '0.00', NULL, '0.00', NULL, '0.00', '20.00', '0.00', '0.00', '2.40', '0.00', NULL, NULL, '0.00', '20.00', NULL, NULL, '20.00', NULL, NULL, NULL, '22.40', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '1208201907140072212800110010011236547891908122019', '0.00', '0.00', 0),
(119, NULL, 1, 1, 6, 10, 36, 38, NULL, 0, NULL, 1, '2019-11-12', '2019-11-12', '22:30:37', NULL, '001', '001', 54, '1236985211', 3, NULL, '0.00', NULL, '0.00', NULL, '0.00', '0.00', '0.00', '40.00', '0.00', '4.80', NULL, NULL, '0.00', '40.00', NULL, NULL, '40.00', NULL, NULL, NULL, '44.80', '44.80', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, NULL, '0.00', '0.00', 0),
(120, NULL, 1, 3, 6, 10, 36, 38, NULL, 0, NULL, 1, '2019-11-12', '2019-11-12', '22:35:09', NULL, '001', '001', 259, '3456789098', 3, NULL, '0.00', NULL, '0.00', NULL, '0.00', '0.00', '0.00', '20.00', '0.00', '2.40', NULL, NULL, '0.00', '20.00', NULL, NULL, '20.00', NULL, NULL, NULL, '22.40', '22.40', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, NULL, '0.00', '0.00', 0),
(121, NULL, 1, 1, 6, 10, 36, 38, NULL, 0, NULL, 1, '2019-11-12', '2019-11-12', '22:36:09', 13, '001', '001', 654, '1236985215', 3, NULL, '0.00', NULL, '0.00', NULL, '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL, '10.00', '0.00', NULL, NULL, '10.00', NULL, NULL, NULL, '10.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, NULL, '0.00', '0.00', 0),
(128, NULL, 1, 1, 6, 10, 36, 38, NULL, 0, NULL, 1, '2019-11-12', '2019-11-12', '23:36:57', NULL, '001', '001', 543, '1236985214', 2, NULL, '0.00', NULL, '0.00', NULL, '0.00', '15.00', '0.00', '0.00', '1.80', '0.00', NULL, NULL, '0.00', '15.00', NULL, NULL, '15.00', NULL, NULL, NULL, '16.80', '16.80', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, NULL, '0.00', '0.00', 0),
(129, NULL, 1, 1, 6, 10, 36, 38, NULL, 0, NULL, 1, '2019-11-13', '2019-11-13', '22:02:47', NULL, '001', '002', 5432, '1234567899', 5, NULL, '0.00', NULL, '0.00', NULL, '0.00', '0.00', '0.00', '20.00', '0.00', '2.40', NULL, NULL, '0.00', '20.00', NULL, NULL, '20.00', NULL, NULL, NULL, '22.40', '22.40', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, NULL, '0.00', '0.00', 0),
(130, NULL, 1, 1, 6, 11, 36, NULL, NULL, 0, NULL, 1, '2019-11-12', '2019-11-15', '19:32:15', NULL, '001', '001', 89, '1236985211', NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '44.80', '0.00', '0.00', '4.80', '0.00', NULL, NULL, '0.00', '40.00', NULL, NULL, NULL, NULL, NULL, NULL, '44.80', NULL, NULL, NULL, NULL, NULL, '2019-11-15', 1, 0, 119, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, NULL, 1, 1, 6, 10, 36, 38, NULL, 0, NULL, 1, '2019-11-15', '2019-11-15', '21:55:48', NULL, '001', '002', 654, '1234567899', 1, NULL, '0.00', NULL, '0.00', NULL, '0.00', '80.00', '0.00', '0.00', '9.60', '0.00', NULL, NULL, '0.00', '80.00', NULL, NULL, '80.00', NULL, NULL, NULL, '89.60', '29.86', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, NULL, '0.00', '0.00', 0),
(132, NULL, 1, 1, 7, 10, 36, 38, NULL, 0, NULL, 1, '2019-11-19', '2019-11-19', '17:41:51', NULL, '001', '002', 743, '1234567899', 0, NULL, '0.00', NULL, '0.00', NULL, '0.00', '0.00', '0.00', '20.00', '0.00', '2.40', NULL, NULL, '0.00', '20.00', NULL, NULL, '20.00', NULL, NULL, NULL, '22.40', '22.40', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, NULL, '0.00', '0.00', 0),
(133, NULL, 1, 18, 6, 0, 0, 0, 1, NULL, NULL, 1, '2019-11-19', '2019-11-19', '20:08:30', NULL, '001', '004', 2, '00000000000', 1, NULL, '22.40', '0.00', '0.00', '0.00', NULL, NULL, NULL, NULL, '2.69', NULL, NULL, NULL, '0.00', '22.40', NULL, NULL, '22.40', NULL, NULL, NULL, '25.09', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '0.00', NULL, '1911201901140072212800110010040000000021911192012', NULL, NULL, NULL),
(134, NULL, 1, 18, 6, 0, 0, 0, 1, NULL, NULL, 1, '2019-11-21', '2019-11-21', '16:01:31', NULL, '001', '004', 3, '00000000000', 0, NULL, '22.40', '0.00', '0.00', '0.00', NULL, NULL, NULL, NULL, '2.69', NULL, NULL, NULL, '0.00', '22.40', NULL, NULL, '22.40', NULL, NULL, NULL, '25.09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, NULL, '26.00', '0.91', '2111201901140072212800110010040000000031911211613', NULL, NULL, NULL),
(135, NULL, 1, 6, 6, 0, 0, 0, 1, NULL, NULL, 1, '2019-12-05', '2019-12-05', '21:18:48', NULL, '001', '004', 4, '00000000000', 0, NULL, '30.00', '0.00', '0.00', '0.00', '0.00', '30.00', '0.00', '0.00', '3.21', '0.00', NULL, NULL, '0.00', '26.79', NULL, NULL, '26.79', NULL, NULL, NULL, '30.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, NULL, '0.00', NULL, '0512201901140072212800110010040000000041912052112', NULL, NULL, NULL),
(136, NULL, 1, 6, 6, 0, 0, 0, 1, NULL, NULL, 1, '2019-12-09', '2019-12-09', '16:30:09', NULL, '001', '004', 5, '00000000000', 0, NULL, '49.49', '0.01', '0.45', '0.00', '0.00', '50.00', '0.00', '0.00', '5.30', '0.00', NULL, NULL, '0.00', '44.19', NULL, NULL, '44.64', NULL, NULL, NULL, '49.49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, NULL, '50.00', '0.51', NULL, NULL, NULL, NULL),
(137, NULL, 1, 18, 6, 0, 0, 0, 1, NULL, NULL, 1, '2019-12-11', '2019-12-11', '15:47:51', NULL, '001', '004', 6, '00000000000', 0, NULL, '30.00', '0.00', '0.00', '0.00', '0.00', '30.00', '0.00', '0.00', '3.21', '0.00', NULL, NULL, '0.00', '26.79', NULL, NULL, '26.79', NULL, NULL, NULL, '30.00', '30.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '30.00', '0.00', NULL, NULL, NULL, NULL),
(138, NULL, 1, 18, 6, 0, 0, 0, 1, NULL, NULL, 1, '2019-12-11', '2019-12-11', '22:43:10', NULL, '001', '004', 7, '00000000000', 1, NULL, '30.00', '0.00', '0.00', '0.00', '0.00', '30.00', '0.00', '0.00', '3.21', '0.00', NULL, NULL, '0.00', '26.79', NULL, NULL, '26.79', NULL, NULL, NULL, '30.00', '28.77', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1236, 1, 1, NULL, '0.00', NULL, NULL, NULL, NULL, NULL),
(139, NULL, 1, 6, 6, 0, 36, 38, 1, NULL, NULL, 1, '2019-12-17', '2019-12-17', '21:02:22', NULL, '001', '004', 8, '00000000000', 0, NULL, '30.00', '0.00', '0.00', '0.30', '0.00', '29.70', '0.00', '0.00', '3.18', '0.00', NULL, NULL, '0.00', '26.52', NULL, NULL, '26.52', NULL, NULL, NULL, '29.70', '29.70', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '0.00', NULL, '1712201901140072212800110010040000000081912172112', NULL, NULL, NULL),
(140, NULL, 1, 1, 6, 10, 36, 38, NULL, 0, NULL, 1, '2019-12-17', '2019-12-17', '23:56:59', NULL, '001', '002', 23, '1234567899', 1, NULL, '0.00', NULL, '0.00', NULL, '0.00', '20.00', '0.00', '0.00', '2.40', '0.00', NULL, NULL, '0.00', '20.00', NULL, NULL, '20.00', NULL, NULL, NULL, '22.40', '21.48', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '1712201907140072212800110010020000000231912172310', '0.00', '0.00', 0),
(141, NULL, 1, 1, 6, 10, 36, 62, NULL, 0, NULL, 1, '2020-01-09', '2020-01-09', '19:42:12', NULL, '001', '003', 1, '0901202003140072212800110010030000000012001091912', 1, NULL, '0.00', NULL, '0.00', NULL, '0.00', '20.00', '0.00', '0.00', '2.40', '0.00', NULL, NULL, '0.00', '20.00', NULL, NULL, '20.00', NULL, NULL, NULL, '22.40', '22.40', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '0901202007140072212800110010030000000012001091918', '0.00', '0.00', 0),
(142, NULL, 1, 1, 6, 10, 36, 62, NULL, 0, NULL, 1, '2020-01-09', '2020-01-09', '19:47:39', NULL, '001', '003', 2, '0901202003140072212800110010030000000022001091918', 1, NULL, '0.00', NULL, '0.00', NULL, '0.00', '20.00', '0.00', '0.00', '2.40', '0.00', NULL, NULL, '0.00', '20.00', NULL, NULL, '20.00', NULL, NULL, NULL, '22.40', '22.40', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '0901202007140072212800110010030000000022001091913', '0.00', '0.00', 0),
(143, NULL, 1, 1, 6, 10, 36, 62, NULL, 0, NULL, 1, '2020-01-09', '2020-01-09', '20:02:34', NULL, '001', '003', 1, '0901202003140072212800110010030000000012001092013', 1, NULL, '0.00', NULL, '0.00', NULL, '0.00', '20.00', '0.00', '0.00', '2.40', '0.00', NULL, NULL, '0.00', '20.00', NULL, NULL, '20.00', NULL, NULL, NULL, '22.40', '22.40', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '0901202007140072212800110010030000000012001092019', '0.00', '0.00', 0),
(144, NULL, 1, 1, 6, 10, 36, 38, NULL, 0, NULL, 1, '2020-01-09', '2020-01-09', '20:43:29', NULL, '001', '003', 1, '1236547899', 1, NULL, '0.00', NULL, '0.00', NULL, '0.00', '20.00', '0.00', '0.00', '2.40', '0.00', NULL, NULL, '0.00', '20.00', NULL, NULL, '20.00', NULL, NULL, NULL, '22.40', '21.68', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '0901202007140072212800110010030000000012001092019', '0.00', '0.00', 0),
(145, NULL, 1, 5, 6, 10, 36, 38, NULL, 0, NULL, 1, '2020-01-17', '2020-01-17', '20:39:02', NULL, '001', '002', 78, '1701202003140072212800110010020000000782001172013', 1, NULL, '0.00', NULL, '0.00', NULL, '0.00', '32.00', '0.00', '0.00', '3.84', '0.00', NULL, NULL, '0.00', '32.00', NULL, NULL, '32.00', NULL, NULL, NULL, '35.84', '35.84', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '1701202007140072212800110010020000000782001172019', '0.00', '0.00', 0),
(146, NULL, 1, 6, 6, 0, 36, 38, 1, NULL, NULL, 1, '2020-03-13', '2020-03-13', '20:32:33', NULL, '001', '004', 9, 'Electrónica', 0, NULL, '160.00', '0.00', '0.00', '0.00', '0.00', '160.00', '0.00', '0.00', '17.14', '0.00', NULL, NULL, '0.00', '142.86', NULL, NULL, '142.86', NULL, NULL, NULL, '160.00', '160.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '160.00', '0.00', '1303202001140072212800110010040000000092003132010', NULL, NULL, NULL),
(147, NULL, 1, 6, 6, 0, 36, 0, 1, NULL, NULL, 1, '2020-03-13', '2020-03-13', '20:44:52', NULL, '001', '004', 10, 'Electrónica', 0, NULL, '160.00', '0.00', '0.00', '0.00', '0.00', '160.00', '0.00', '0.00', '17.14', '0.00', NULL, NULL, '0.00', '142.86', NULL, NULL, '142.86', NULL, NULL, NULL, '160.00', '160.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '160.00', '0.00', '1303202001140072212800110010040000000102003132016', NULL, NULL, NULL),
(148, NULL, 1, 6, 6, 0, 36, 38, 1, NULL, NULL, 1, '2020-03-13', '2020-03-13', '21:10:01', NULL, '001', '004', 11, 'Electrónica', 0, NULL, '160.00', '0.00', '0.00', '0.00', '0.00', '160.00', '0.00', '0.00', '17.14', '0.00', NULL, NULL, '0.00', '142.86', NULL, NULL, '142.86', NULL, NULL, NULL, '160.00', '160.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '160.00', '0.00', '1303202001140072212800110010040000000112003132119', NULL, NULL, NULL),
(149, NULL, 1, 1, 6, 10, 36, 38, NULL, 0, NULL, 1, '2020-07-15', '2020-07-15', '16:50:07', NULL, '001', '002', 1, '1507202003140072212800110010020000000012007151610', 1, NULL, '0.00', NULL, '0.00', NULL, '0.00', '100.00', '0.00', '0.00', '12.00', '0.00', NULL, NULL, '0.00', '100.00', NULL, NULL, '100.00', NULL, NULL, NULL, '112.00', '108.40', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '1507202007140072212800110010020000000012007151616', '0.00', '0.00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

DROP TABLE IF EXISTS `configuraciones`;
CREATE TABLE IF NOT EXISTS `configuraciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuraciones`
--

INSERT INTO `configuraciones` (`id`, `tipo`, `nombre`, `valor`) VALUES
(1, 'FACTURA_ELECTRONICA', 'LOGO_RIDE', 'facturacion_files/logo/logo.jpg'),
(2, 'DATOS_EMPRESA', 'tipoNegocio', 'FARMACIA'),
(3, 'DATOS_EMPRESA', 'nombreEmpresa', 'zion'),
(4, 'DATOS_EMPRESA', 'razonSocial', 'MOROCHO MARTHA ISABEL'),
(5, 'DATOS_EMPRESA', 'ruc', '1400722128001'),
(6, 'DATOS_EMPRESA', 'representante', 'N'),
(7, 'DATOS_EMPRESA', 'ciudad', 'MACAS'),
(8, 'DATOS_EMPRESA', 'provincia', 'MORONA'),
(9, 'DATOS_EMPRESA', 'pais', 'ECUADOR'),
(10, 'DATOS_EMPRESA', 'ambiente', '1'),
(11, 'DATOS_EMPRESA', 'email', 'zioncompucopy@gmail.com'),
(12, 'DATOS_EMPRESA', 'representanteLegal', 'ssss'),
(13, 'DATOS_EMPRESA', 'direccion', 'ssss'),
(14, 'DATOS_EMPRESA', 'telefono', '1234123458'),
(15, 'DATOS_EMPRESA', 'fax', 'w'),
(16, 'DATOS_EMPRESA', 'rucContador', '1111'),
(17, 'DATOS_EMPRESA', 'obligadoContabilidad', 'SI'),
(18, 'DATOS_EMPRESA', 'resolucionContribuyente', 'jbkjk'),
(19, 'FACTURA_ELECTRONICA', 'FIRMA', 'facturacion_files/firma/firma.p12'),
(20, 'FACTURA_ELECTRONICA', 'PASSWORD_FIRMA', 'WdMvdrsF2w'),
(21, 'SMTP', 'servidor', 'smtp.gmail.com'),
(22, 'SMTP', 'puerto', '587'),
(23, 'SMTP', 'nombreRemitente', 'PRUEBAS'),
(24, 'SMTP', 'tiempoEspera', '25'),
(25, 'SMTP', 'direccionRemitente', 'jhonatanjaviermejiaabad@gmail.com'),
(26, 'SMTP', 'ssl', 'true'),
(27, 'SMTP', 'usuario', 'jhonatanjaviermejiaabad'),
(28, 'SMTP', 'password', 'JHONATHANmejia789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones_globales`
--

DROP TABLE IF EXISTS `configuraciones_globales`;
CREATE TABLE IF NOT EXISTS `configuraciones_globales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_bool` tinyint(1) DEFAULT NULL,
  `valor_int` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuraciones_globales`
--

INSERT INTO `configuraciones_globales` (`id`, `clave`, `nombre`, `valor_bool`, `valor_int`) VALUES
(1, 'HISTORICOS', 'Historicos', 1, NULL),
(2, 'DECIMALES_PESO_BALANZA', 'N° decimales en peso de balanza electronica', NULL, 4),
(3, 'CALCULAR_UTILIDAD_VENTA', 'Calcular utilidades al registrar la venta', 1, NULL),
(4, 'ACTIVAR_IMPUESTOS', 'Activar otros impuestos para servicios', 1, NULL),
(5, 'BLOQUEAR_CASILLA', 'Bloquear casilla de verificación de IVA en ventas', 1, NULL),
(6, 'USAR_PV3', 'Usar el PV3 solo con 2 decimales sin IVA', 1, NULL),
(7, 'USAR_BLOQUEO', 'Usar bloqueo automaticó de créditos', 0, NULL),
(8, 'RECAPITULAR_INTERESES', 'Recapitular intereses con pago parcial', 0, NULL),
(9, 'INTERESES_ANUALES', 'Intereses anuales por mora', NULL, 5),
(10, 'NUMERO_PRECIOS', 'Número de precios de venta', NULL, 5),
(11, 'MANTENER_FIJOS_VENTA', 'Mantener fijos los precios de venta en cada compra', 1, NULL),
(12, 'USAR_ULTIMO', 'Usar el último precio de compra como costo', 1, NULL),
(13, 'BLOQUEAR_MODIFICACION_COMPRA', 'Bloquear modificación de precio de compra', 1, NULL),
(14, 'NUMERO_DECIMALES_COMPRA', 'Número de decimales en precio de compra (Incluido IVA)', NULL, 2),
(15, 'PORCENTAJE_EXTRA_FOB', 'Porcentaje extra sobre el FOB', NULL, 2),
(16, 'VIGILANTE', 'Ejecutar Vigilante', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desglose_caja`
--

DROP TABLE IF EXISTS `desglose_caja`;
CREATE TABLE IF NOT EXISTS `desglose_caja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cierre_caja_id` int(11) DEFAULT NULL,
  `b100` decimal(10,2) DEFAULT NULL,
  `b50` decimal(10,2) DEFAULT NULL,
  `b20` decimal(10,2) DEFAULT NULL,
  `b10` decimal(10,2) DEFAULT NULL,
  `b5` decimal(10,2) DEFAULT NULL,
  `b1` decimal(10,2) DEFAULT NULL,
  `m100` decimal(5,2) DEFAULT NULL,
  `m50` decimal(5,2) DEFAULT NULL,
  `m25` decimal(5,2) DEFAULT NULL,
  `m10` decimal(5,2) DEFAULT NULL,
  `m5` decimal(5,2) DEFAULT NULL,
  `m1` decimal(5,2) DEFAULT NULL,
  `cheque` decimal(5,2) DEFAULT NULL,
  `numero_cheque` smallint(6) DEFAULT NULL,
  `voucher` decimal(5,2) DEFAULT NULL,
  `numero_voucher` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6C732152667EEAA2` (`cierre_caja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `desglose_caja`
--

INSERT INTO `desglose_caja` (`id`, `cierre_caja_id`, `b100`, `b50`, `b20`, `b10`, `b5`, `b1`, `m100`, `m50`, `m25`, `m10`, `m5`, `m1`, `cheque`, `numero_cheque`, `voucher`, `numero_voucher`) VALUES
(1, 1, '8.00', '1.00', '2.00', NULL, NULL, NULL, '4.00', NULL, '1.00', '1.00', '2.00', NULL, '1.00', 13, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cobros_pagos`
--

DROP TABLE IF EXISTS `detalle_cobros_pagos`;
CREATE TABLE IF NOT EXISTS `detalle_cobros_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cobros_pagos_id` int(11) NOT NULL,
  `compras_ventas_id` int(11) NOT NULL,
  `capital` double DEFAULT NULL,
  `interes` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1018227DE436AFF1` (`cobros_pagos_id`),
  KEY `IDX_1018227D58B4B2FD` (`compras_ventas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_cobros_pagos`
--

INSERT INTO `detalle_cobros_pagos` (`id`, `cobros_pagos_id`, `compras_ventas_id`, `capital`, `interes`) VALUES
(5, 5, 117, 33.33, 0),
(6, 5, 106, 224, 0),
(7, 6, 117, 66.66, 0),
(8, 7, 118, 11.2, 0),
(9, 8, 118, 22.4, 0),
(10, 8, 117, 66.66, 0),
(11, 16, 119, 44.8, 0),
(12, 17, 120, 22.4, 0),
(13, 18, 121, 10, 0),
(20, 25, 128, 16.8, 0),
(21, 26, 129, 22.4, 0),
(22, 27, 110, 112, 0),
(23, 28, 131, 29.87, 0),
(24, 29, 131, 29.87, 0),
(25, 31, 132, 22.4, 0),
(26, 33, 131, 29.87, 0),
(27, 34, 133, 13.05, 0),
(28, 35, 133, 12.04, 0),
(29, 36, 133, 13.05, 0),
(30, 44, 137, 30, 0),
(31, 45, 139, 29.7, 0),
(32, 46, 146, 160, 0),
(33, 47, 147, 160, 0),
(34, 48, 148, 160, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_componentes_rol`
--

DROP TABLE IF EXISTS `detalle_componentes_rol`;
CREATE TABLE IF NOT EXISTS `detalle_componentes_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `componentes_rol_id` int(11) NOT NULL,
  `l1` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l2` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1A4D4A92DE05162A` (`componentes_rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras_ventas`
--

DROP TABLE IF EXISTS `detalle_compras_ventas`;
CREATE TABLE IF NOT EXISTS `detalle_compras_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compras_ventas_id` int(11) NOT NULL,
  `inventario_id` int(11) DEFAULT NULL,
  `tipo` tinyint(1) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `ice` decimal(10,2) DEFAULT NULL,
  `descripcion` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad_unidades` double DEFAULT NULL,
  `cantidad_cajas` double DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `bono` double DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `precio_original` decimal(10,2) NOT NULL,
  `descuento_porcentaje` decimal(10,2) DEFAULT NULL,
  `precio_final` decimal(10,2) NOT NULL,
  `valor_ice` decimal(10,2) DEFAULT NULL,
  `subsidio` decimal(10,2) DEFAULT NULL,
  `descuento_valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8F90560858B4B2FD` (`compras_ventas_id`),
  KEY `IDX_8F905608DFDFBE2A` (`inventario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_compras_ventas`
--

INSERT INTO `detalle_compras_ventas` (`id`, `compras_ventas_id`, `inventario_id`, `tipo`, `iva`, `ice`, `descripcion`, `cantidad_unidades`, `cantidad_cajas`, `cantidad`, `bono`, `costo`, `precio_original`, `descuento_porcentaje`, `precio_final`, `valor_ice`, `subsidio`, `descuento_valor`) VALUES
(113, 106, 1, 1, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 5, 0, 5, NULL, '20.00', '20.00', NULL, '112.00', NULL, NULL, NULL),
(114, 106, 2, 1, '12.00', NULL, 'IMPRESORA EPSON  TMU220', 5, 0, 5, NULL, '20.00', '20.00', NULL, '112.00', NULL, NULL, NULL),
(115, 108, 1, 0, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', NULL, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(116, 108, 2, 0, '12.00', NULL, 'IMPRESORA EPSON  TMU220', NULL, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(117, 109, 2, 0, '12.00', NULL, 'IMPRESORA EPSON  TMU220', NULL, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(118, 110, 1, 1, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 5, 0, 5, NULL, '20.00', '20.00', NULL, '112.00', NULL, NULL, NULL),
(119, 111, NULL, 0, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', NULL, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(120, 115, 1, 0, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', NULL, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(121, 116, 2, 0, '12.00', NULL, 'IMPRESORA EPSON  TMU220', NULL, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(122, 117, 3, 1, '0.00', NULL, 'TECLADO GENIUS P220', 10, 0, 10, NULL, '10.00', '10.00', NULL, '100.00', NULL, NULL, NULL),
(123, 118, 2, 1, '12.00', NULL, 'IMPRESORA EPSON  TMU220', 1, 0, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(124, 119, 1, 1, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 2, NULL, 2, NULL, '20.00', '20.00', NULL, '44.80', NULL, NULL, NULL),
(125, 120, 1, 1, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(126, 121, 3, 1, '0.00', NULL, 'TECLADO GENIUS P220', 1, NULL, 1, NULL, '10.00', '10.00', NULL, '10.00', NULL, NULL, NULL),
(127, 128, 5, 1, '12.00', NULL, 'CPU', 1, NULL, 1, NULL, '15.00', '15.00', NULL, '16.80', NULL, NULL, NULL),
(128, 129, 1, 1, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(129, 130, 1, 0, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', NULL, NULL, 2, NULL, '20.00', '20.00', NULL, '44.80', NULL, NULL, NULL),
(130, 131, 2, 1, '12.00', NULL, 'IMPRESORA EPSON  TMU220', 4, NULL, 4, NULL, '20.00', '20.00', NULL, '89.60', NULL, NULL, NULL),
(131, 132, 1, 1, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(132, 133, 1, 1, '2.69', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '22.40', '0.00', '22.40', NULL, NULL, '0.00'),
(133, 134, 1, 1, '2.69', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '22.40', '0.00', '22.40', NULL, NULL, '0.00'),
(134, 135, 1, 1, '3.21', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '30.00', '0.00', '30.00', NULL, NULL, '0.00'),
(135, 136, 1, 0, '5.36', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 2, NULL, 2, NULL, '20.00', '30.00', '0.00', '25.00', NULL, NULL, '0.00'),
(136, 137, 1, 0, '3.21', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '30.00', '0.00', '30.00', NULL, NULL, '0.00'),
(137, 138, 1, 0, '3.21', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '30.00', '0.00', '30.00', NULL, NULL, '0.00'),
(138, 139, 1, 0, '3.18', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '30.00', '1.00', '30.00', NULL, NULL, '0.30'),
(139, 140, 1, 0, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(140, 141, 1, 0, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(141, 142, 1, 0, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(142, 143, 1, 0, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(143, 144, 1, 0, '12.00', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 1, NULL, 1, NULL, '20.00', '20.00', NULL, '22.40', NULL, NULL, NULL),
(144, 145, 17, 0, '12.00', NULL, 'Producto codigos', 4, NULL, 4, NULL, '8.00', '8.00', NULL, '35.84', NULL, NULL, NULL),
(145, 148, NULL, 0, '17.14', NULL, 'COMPUTADOR  PORTATIL HP 305 MS254', 4, NULL, 4, NULL, NULL, '30.00', '0.00', '40.00', NULL, NULL, '0.00'),
(146, 149, 4, 0, '12.00', NULL, 'MONITOR  LG 20 PULGADAS', 1, NULL, 1, NULL, '100.00', '100.00', NULL, '112.00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_diario`
--

DROP TABLE IF EXISTS `detalle_diario`;
CREATE TABLE IF NOT EXISTS `detalle_diario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diario_id` int(11) NOT NULL,
  `plan_cuentas_id` int(11) NOT NULL,
  `debe` double NOT NULL,
  `haber` double NOT NULL,
  `auxiliar` double DEFAULT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67809A0B2D6E7A46` (`diario_id`),
  KEY `IDX_67809A0B99EAF094` (`plan_cuentas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingresos_egresos`
--

DROP TABLE IF EXISTS `detalle_ingresos_egresos`;
CREATE TABLE IF NOT EXISTS `detalle_ingresos_egresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventario_id` int(11) DEFAULT NULL,
  `ingresos_egresos_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `stock_actual` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C91B99B6DFDFBE2A` (`inventario_id`),
  KEY `IDX_C91B99B6A25FEB46` (`ingresos_egresos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_ingresos_egresos`
--

INSERT INTO `detalle_ingresos_egresos` (`id`, `inventario_id`, `ingresos_egresos_id`, `cantidad`, `costo`, `stock_actual`) VALUES
(1, 1, 1, 1, '20.00', 1),
(2, 2, 2, 1, '20.00', 13),
(3, 3, 3, 1, '10.00', 10),
(4, 5, 4, 1, '15.00', 2),
(5, 5, 5, 1, '15.00', 1),
(6, 17, 6, 1, '8.00', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_movimiento_caja_bancos`
--

DROP TABLE IF EXISTS `detalle_movimiento_caja_bancos`;
CREATE TABLE IF NOT EXISTS `detalle_movimiento_caja_bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bancos_id` int(11) DEFAULT NULL,
  `movimiento_caja_bancos_id` int(11) DEFAULT NULL,
  `comprobante` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` smallint(6) DEFAULT NULL,
  `fecha_original` date DEFAULT NULL COMMENT '(DC2Type:carbondate)',
  `beneficiario` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B393CF0426DCA429` (`bancos_id`),
  KEY `IDX_B393CF049949942C` (`movimiento_caja_bancos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_movimiento_caja_bancos`
--

INSERT INTO `detalle_movimiento_caja_bancos` (`id`, `bancos_id`, `movimiento_caja_bancos_id`, `comprobante`, `tipo`, `fecha_original`, `beneficiario`) VALUES
(1, 2, 2, '569', 3, '2019-11-12', NULL),
(2, 1, 3, '4569', 3, '2019-11-12', NULL),
(3, 1, 4, '1233', 3, '2019-11-12', NULL),
(4, 1, 11, '56567', 1, '2019-11-27', NULL),
(5, NULL, 12, NULL, NULL, NULL, NULL),
(6, NULL, 13, '123654', NULL, NULL, NULL),
(7, 1, 14, '258', 3, '2019-11-15', NULL),
(8, NULL, 15, '6987', NULL, NULL, NULL),
(9, 1, 16, NULL, 3, '2019-11-15', NULL),
(10, NULL, 18, '789', NULL, NULL, NULL),
(11, NULL, 20, '123654', NULL, NULL, NULL),
(13, 2, 24, '4322', 2, '2019-11-20', NULL),
(14, 1, NULL, '258', 1, '2019-11-20', NULL),
(15, 2, NULL, '9876543', 1, '2019-11-20', NULL),
(16, 2, 35, '987', 0, '2019-11-22', NULL),
(17, 2, 36, '965', 2, '2019-11-22', NULL),
(18, NULL, 39, NULL, NULL, NULL, NULL),
(19, NULL, 40, NULL, NULL, NULL, NULL),
(20, NULL, 42, NULL, NULL, NULL, NULL),
(21, NULL, 43, NULL, NULL, NULL, NULL),
(22, NULL, 44, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
CREATE TABLE IF NOT EXISTS `detalle_pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventario_id` int(11) NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `pedidos_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2FC82202DFDFBE2A` (`inventario_id`),
  KEY `IDX_2FC82202213530F2` (`pedidos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `inventario_id`, `cantidad`, `pedidos_id`) VALUES
(1, 5, '3.00', 2),
(2, 9, '3.00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_retenciones`
--

DROP TABLE IF EXISTS `detalle_retenciones`;
CREATE TABLE IF NOT EXISTS `detalle_retenciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retenciones_id` int(11) NOT NULL,
  `tipo` smallint(6) DEFAULT NULL,
  `codigo_retencion` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_imponible` double NOT NULL,
  `porcentaje_retenido` int(11) NOT NULL,
  `valor_retenido` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B21DA5F454956CEA` (`retenciones_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_retenciones`
--

INSERT INTO `detalle_retenciones` (`id`, `retenciones_id`, `tipo`, `codigo_retencion`, `base_imponible`, `porcentaje_retenido`, `valor_retenido`) VALUES
(1, 1, 1, '01', 20, 30, 0.72),
(2, 1, 0, '312', 20, 1, 0.2),
(3, 2, 1, '01', 20, 30, 0.72),
(4, 3, 1, '01', 100, 30, 3.6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diario`
--

DROP TABLE IF EXISTS `diario`;
CREATE TABLE IF NOT EXISTS `diario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) NOT NULL,
  `tipo` smallint(6) NOT NULL,
  `fecha` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `hora` time NOT NULL COMMENT '(DC2Type:carbontime)',
  `numero` bigint(20) NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origen` smallint(6) NOT NULL,
  `referencia` smallint(6) NOT NULL,
  `debe` double NOT NULL,
  `haber` double NOT NULL,
  `modificacion` tinyint(1) NOT NULL,
  `centro_costos` smallint(6) DEFAULT NULL,
  `sucursal_id` int(11) NOT NULL,
  `periodo_contable_id` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B5879AC67B3B43D` (`users_id`),
  KEY `IDX_B5879AC279A5D5E` (`sucursal_id`),
  KEY `IDX_B5879ACE548529E` (`periodo_contable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_autorizados`
--

DROP TABLE IF EXISTS `documentos_autorizados`;
CREATE TABLE IF NOT EXISTS `documentos_autorizados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comprobante` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `establecimiento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `punto_emision` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autorizacion_sri` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ultimo_numero` int(11) DEFAULT NULL,
  `fecha_caducidad` datetime DEFAULT NULL COMMENT '(DC2Type:carbondatetime)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `documentos_autorizados`
--

INSERT INTO `documentos_autorizados` (`id`, `comprobante`, `establecimiento`, `punto_emision`, `tipo`, `autorizacion_sri`, `ultimo_numero`, `fecha_caducidad`) VALUES
(4, 'COMPROBANTE_ELECTRONICO', '001', '008', 'RETENCION', NULL, 7, '2020-07-31 00:00:00'),
(5, 'COMPROBANTE_ELECTRONICO', '001', '003', 'LIQUIDACION_COMPRA', NULL, 0, '2020-01-31 00:00:00'),
(6, 'COMPROBANTE_FISICO', '001', '004', 'LIQUIDACION_COMPRA', '9658741253', 1, '2020-01-31 00:00:00'),
(9, 'COMPROBANTE_FISICO', '001', '001', 'FACTURA', '1236547899', 1, NULL),
(10, 'COMPROBANTE_ELECTRONICO', '001', '004', 'FACTURA', '', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inic` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sueldo` decimal(10,2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `mail` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` smallint(6) DEFAULT NULL,
  `pais` smallint(6) DEFAULT NULL,
  `cargo` smallint(6) DEFAULT NULL,
  `departamento` smallint(6) DEFAULT NULL,
  `fecha_contrato` date DEFAULT NULL COMMENT '(DC2Type:carbondate)',
  `carga_familiar` smallint(6) DEFAULT NULL,
  `comision_venta` decimal(10,2) DEFAULT NULL,
  `comision_cobrado` decimal(10,2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `agente` tinyint(1) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9EB2266C67B3B43D` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `cedula`, `inic`, `nombre`, `direccion`, `telefono`, `celular`, `observaciones`, `sueldo`, `deleted_at`, `mail`, `ciudad`, `pais`, `cargo`, `departamento`, `fecha_contrato`, `carga_familiar`, `comision_venta`, `comision_cobrado`, `estado`, `agente`, `users_id`) VALUES
(2, '1400730105', 'Cm', 'Carlos Geovanny Mejía Abad', 'Sucúa', '072741253', '0991450275', NULL, '750.00', NULL, 'carlos@gmail.com', 45, 5, 64, 63, '2020-02-12', 1, '25.00', '30.00', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

DROP TABLE IF EXISTS `facturas`;
CREATE TABLE IF NOT EXISTS `facturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_creado_id` bigint(20) DEFAULT NULL,
  `users_actualizado_id` bigint(20) DEFAULT NULL,
  `compra_venta_id` int(11) NOT NULL,
  `creado` datetime DEFAULT NULL COMMENT '(DC2Type:carbondatetime)',
  `actualizado` datetime DEFAULT NULL COMMENT '(DC2Type:carbondatetime)',
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `aprobada` tinyint(1) NOT NULL,
  `autorizada` tinyint(1) NOT NULL,
  `response` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_aprobacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_autorizacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enviada` tinyint(1) NOT NULL,
  `email_enviado` tinyint(1) NOT NULL,
  `firmada` tinyint(1) NOT NULL,
  `error` tinyint(1) NOT NULL,
  `mensaje_sri` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_622B9C0F914B7999` (`compra_venta_id`),
  KEY `IDX_622B9C0F873ED084` (`users_creado_id`),
  KEY `IDX_622B9C0FF340A389` (`users_actualizado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id`, `users_creado_id`, `users_actualizado_id`, `compra_venta_id`, `creado`, `actualizado`, `data`, `aprobada`, `autorizada`, `response`, `response_aprobacion`, `response_autorizacion`, `tipo`, `enviada`, `email_enviado`, `firmada`, `error`, `mensaje_sri`) VALUES
(1, 1, 1, 140, '2019-12-17 23:57:34', '2019-12-17 23:57:34', '<?xml version=\"1.0\"?>\n<comprobanteRetencion id=\"comprobante\" version=\"1.0.0\"><infoTributaria><ambiente>1</ambiente><tipoEmision>1</tipoEmision><razonSocial>MOROCHO MARTHA ISABEL</razonSocial><nombreComercial>zion</nombreComercial><ruc>1400722128001</ruc><claveAcceso>1712201907140072212800110010020000000231912172310</claveAcceso><codDoc>07</codDoc><estab>001</estab><ptoEmi>002</ptoEmi><secuencial>000000023</secuencial><dirMatriz>ssss</dirMatriz></infoTributaria><infoCompRetencion><fechaEmision>17/12/2019</fechaEmision><dirEstablecimiento>MACAS</dirEstablecimiento><obligadoContabilidad>NO</obligadoContabilidad><tipoIdentificacionSujetoRetenido>04</tipoIdentificacionSujetoRetenido><razonSocialSujetoRetenido>MARTHA MOROCHO</razonSocialSujetoRetenido><identificacionSujetoRetenido>1400722128001</identificacionSujetoRetenido><periodoFiscal>12/2019</periodoFiscal></infoCompRetencion><impuestos><impuesto><codigo>2</codigo><codigoRetencion>01</codigoRetencion><baseImponible>20</baseImponible><porcentajeRetener>30</porcentajeRetener><valorRetenido>0.72</valorRetenido><codDocSustento>01</codDocSustento><numDocSustento>001002000000023</numDocSustento><fechaEmisionDocSustento>17/12/2019</fechaEmisionDocSustento></impuesto><impuesto><codigo>1</codigo><codigoRetencion>312</codigoRetencion><baseImponible>20</baseImponible><porcentajeRetener>1</porcentajeRetener><valorRetenido>0.2</valorRetenido><codDocSustento>01</codDocSustento><numDocSustento>001002000000023</numDocSustento><fechaEmisionDocSustento>17/12/2019</fechaEmisionDocSustento></impuesto></impuestos><infoAdicional><campoAdicional nombre=\"CodR\">2883</campoAdicional><campoAdicional nombre=\"email\">zioncompucopy@gmail.com</campoAdicional></infoAdicional></comprobanteRetencion>\n', 1, 0, NULL, '<?xml version=\"1.0\"?>\n<response><RespuestaRecepcionComprobante><estado>RECIBIDA</estado><comprobantes/></RespuestaRecepcionComprobante></response>\n', '<?xml version=\"1.0\"?>\n<response><RespuestaAutorizacionComprobante><claveAccesoConsultada>1712201907140072212800110010020000000231912172310</claveAccesoConsultada><autorizaciones><autorizacion><estado>EN PROCESO</estado><mensajes/></autorizacion></autorizaciones></RespuestaAutorizacionComprobante></response>\n', 'RETENCION', 1, 0, 1, 1, ''),
(6, 1, 1, 143, '2020-01-09 20:10:32', '2020-01-09 20:10:32', '<?xml version=\"1.0\"?>\n<factura id=\"comprobante\" version=\"1.1.0\"><infoTributaria><ambiente>1</ambiente><tipoEmision>1</tipoEmision><razonSocial>MOROCHO MARTHA ISABEL</razonSocial><nombreComercial>zion</nombreComercial><ruc>1400722128001</ruc><claveAcceso>0901202007140072212800110010030000000012001092019</claveAcceso><codDoc>03</codDoc><estab>001</estab><ptoEmi>003</ptoEmi><secuencial>000000001</secuencial><dirMatriz>ssss</dirMatriz></infoTributaria><infoFactura><fechaEmision>09/01/2020</fechaEmision><dirEstablecimiento>MACAS</dirEstablecimiento><obligadoContabilidad/><tipoIdentificacionComprador>05</tipoIdentificacionComprador><razonSocialComprador>MARTHA MOROCHO</razonSocialComprador><identificacionComprador>1400722128001</identificacionComprador><direccionComprador>MACAS</direccionComprador><totalSinImpuestos>20</totalSinImpuestos><totalDescuento>0.00</totalDescuento><totalConImpuestos><totalImpuesto><codigo>2</codigo><codigoPorcentaje>2</codigoPorcentaje><baseImponible>20</baseImponible><valor>1.87</valor></totalImpuesto></totalConImpuestos><propina>0.00</propina><importeTotal>22.4</importeTotal><moneda>DOLAR</moneda><pagos><pago><formaPago>20</formaPago><total>22.4</total><plazo>0</plazo><unidadTiempo>dias</unidadTiempo></pago></pagos></infoFactura><detalles><detalle><codigoPrincipal>001</codigoPrincipal><codigoAuxiliar>001</codigoAuxiliar><descripcion>COMPUTADOR  PORTATIL HP 305 MS254</descripcion><cantidad>1</cantidad><precioUnitario>22.4</precioUnitario><descuento>0.00</descuento><precioTotalSinImpuesto>10.40</precioTotalSinImpuesto><impuestos><impuesto><codigo>2</codigo><codigoPorcentaje>2</codigoPorcentaje><tarifa>12</tarifa><baseImponible>10.40</baseImponible><valor>12.00</valor></impuesto></impuestos></detalle></detalles></factura>\n', 0, 0, NULL, '<?xml version=\"1.0\"?>\n<response><RespuestaRecepcionComprobante><estado>DEVUELTA</estado><comprobantes><comprobante><claveAcceso>N/A</claveAcceso><mensajes><mensaje><identificador>35</identificador><mensaje>ARCHIVO NO CUMPLE ESTRUCTURA XML</mensaje><informacionAdicional>Error al convetir el campo fechaEmision : Unparseable date: \"\"</informacionAdicional><tipo>ERROR</tipo></mensaje></mensajes></comprobante></comprobantes></RespuestaRecepcionComprobante></response>\n', NULL, 'LIQUIDACION', 1, 0, 1, 1, ', 35ARCHIVO NO CUMPLE ESTRUCTURA XMLError al convetir el campo fechaEmision : Unparseable date: \"\"ERROR, ARCHIVO NO CUMPLE ESTRUCTURA XML'),
(7, 1, 1, 149, '2020-07-15 16:50:33', '2020-07-15 16:50:33', '<?xml version=\"1.0\"?>\n<comprobanteRetencion id=\"comprobante\" version=\"1.0.0\"><infoTributaria><ambiente>1</ambiente><tipoEmision>1</tipoEmision><razonSocial>MOROCHO MARTHA ISABEL</razonSocial><nombreComercial>zion</nombreComercial><ruc>1400722128001</ruc><claveAcceso>1507202007140072212800110010020000000012007151616</claveAcceso><codDoc>07</codDoc><estab>001</estab><ptoEmi>002</ptoEmi><secuencial>000000001</secuencial><dirMatriz>ssss</dirMatriz></infoTributaria><infoCompRetencion><fechaEmision>15/07/2020</fechaEmision><dirEstablecimiento>MACAS</dirEstablecimiento><obligadoContabilidad>NO</obligadoContabilidad><tipoIdentificacionSujetoRetenido>04</tipoIdentificacionSujetoRetenido><razonSocialSujetoRetenido>MARTHA MOROCHO</razonSocialSujetoRetenido><identificacionSujetoRetenido>1400722128001</identificacionSujetoRetenido><periodoFiscal>07/2020</periodoFiscal></infoCompRetencion><impuestos><impuesto><codigo>2</codigo><codigoRetencion>01</codigoRetencion><baseImponible>100</baseImponible><porcentajeRetener>30</porcentajeRetener><valorRetenido>3.6</valorRetenido><codDocSustento>01</codDocSustento><numDocSustento>001002000000001</numDocSustento><fechaEmisionDocSustento>15/07/2020</fechaEmisionDocSustento></impuesto></impuestos><infoAdicional><campoAdicional nombre=\"CodR\">2883</campoAdicional><campoAdicional nombre=\"email\">zioncompucopy@gmail.com</campoAdicional></infoAdicional></comprobanteRetencion>\n', 1, 0, NULL, '<?xml version=\"1.0\"?>\n<response><RespuestaRecepcionComprobante><estado>RECIBIDA</estado><comprobantes/></RespuestaRecepcionComprobante></response>\n', '<?xml version=\"1.0\"?>\n<response><RespuestaAutorizacionComprobante><claveAccesoConsultada>1507202007140072212800110010020000000012007151616</claveAccesoConsultada><numeroComprobantes>1</numeroComprobantes><autorizaciones><autorizacion><estado>NO AUTORIZADO</estado><fechaAutorizacion>2020-07-15T09:50:27-05:00</fechaAutorizacion><ambiente>PRUEBAS</ambiente><comprobante><![CDATA[<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><comprobanteRetencion id=\"comprobante\" version=\"1.0.0\"><infoTributaria><ambiente>1</ambiente><tipoEmision>1</tipoEmision><razonSocial>MOROCHO MARTHA ISABEL</razonSocial><nombreComercial>zion</nombreComercial><ruc>1400722128001</ruc><claveAcceso>1507202007140072212800110010020000000012007151616</claveAcceso><codDoc>07</codDoc><estab>001</estab><ptoEmi>002</ptoEmi><secuencial>000000001</secuencial><dirMatriz>ssss</dirMatriz></infoTributaria><infoCompRetencion><fechaEmision>15/07/2020</fechaEmision><dirEstablecimiento>MACAS</dirEstablecimiento><obligadoContabilidad>NO</obligadoContabilidad><tipoIdentificacionSujetoRetenido>04</tipoIdentificacionSujetoRetenido><razonSocialSujetoRetenido>MARTHA MOROCHO</razonSocialSujetoRetenido><identificacionSujetoRetenido>1400722128001</identificacionSujetoRetenido><periodoFiscal>07/2020</periodoFiscal></infoCompRetencion><impuestos><impuesto><codigo>2</codigo><codigoRetencion>01</codigoRetencion><baseImponible>100</baseImponible><porcentajeRetener>30</porcentajeRetener><valorRetenido>3.6</valorRetenido><codDocSustento>01</codDocSustento><numDocSustento>001002000000001</numDocSustento><fechaEmisionDocSustento>15/07/2020</fechaEmisionDocSustento></impuesto></impuestos><infoAdicional><campoAdicional nombre=\"CodR\">2883</campoAdicional><campoAdicional nombre=\"email\">zioncompucopy@gmail.com</campoAdicional></infoAdicional><ds:Signature xmlns:ds=\"http://www.w3.org/2000/09/xmldsig#\" xmlns:etsi=\"http://uri.etsi.org/01903/v1.3.2#\" Id=\"Signature911069\">\r\n<ds:SignedInfo Id=\"Signature-SignedInfo110283\">\r\n<ds:CanonicalizationMethod Algorithm=\"http://www.w3.org/TR/2001/REC-xml-c14n-20010315\"/>\r\n<ds:SignatureMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#rsa-sha1\"/>\r\n<ds:Reference Id=\"SignedPropertiesID1013547\" Type=\"http://uri.etsi.org/01903#SignedProperties\" URI=\"#Signature911069-SignedProperties854160\">\r\n<ds:DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"/>\r\n<ds:DigestValue>eQZoSzobuqeKEoBOtW4yJ0WD81M=</ds:DigestValue>\r\n</ds:Reference>\r\n<ds:Reference URI=\"#Certificate1158395\">\r\n<ds:DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"/>\r\n<ds:DigestValue>hXLEqlEYRf8+QfBg43o7zw88HnI=</ds:DigestValue>\r\n</ds:Reference>\r\n<ds:Reference Id=\"Reference-ID-806540\" URI=\"#comprobante\">\r\n<ds:Transforms>\r\n<ds:Transform Algorithm=\"http://www.w3.org/2000/09/xmldsig#enveloped-signature\"/>\r\n</ds:Transforms>\r\n<ds:DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"/>\r\n<ds:DigestValue>u2XWu4mzPbqnCa3sAyfRk0110uc=</ds:DigestValue>\r\n</ds:Reference>\r\n</ds:SignedInfo>\r\n<ds:SignatureValue Id=\"SignatureValue729442\">\r\nbLbpU5Mt8G0DVyzn/1f6s1/1bjjLmyhSgiwUAXI9whwrnD4qNa3lWx7e2Q07NPFp0DGyMOMty1oj\r\nwxcE02R0QGv5WMW+Ifg0rKdP9V2WX9/E7zc2PE/cVTez0AhKwhnvpTtxbIbiTr7a7/zQvzFRzLpS\r\nEboYa3pHn/X9SVZbGsGY4zx2MpgsW1KbDKNhL9VMSHPOB4Dc99q/PsKAlI47tL8fPV4yvlKq++IZ\r\ngGOmqzmW2+35l2XFuitsjelJjFRWTlNpNrIA9hPEj3ZsSB5FStPfRwpbXmNsSLJiUi7xBGAWl38Q\r\nRAypZON97sA1V/0js7aYvN01OuOrFbJWBi/BfA==\r\n</ds:SignatureValue>\r\n<ds:KeyInfo Id=\"Certificate1158395\">\r\n<ds:X509Data>\r\n<ds:X509Certificate>\r\nMIIHkDCCBXigAwIBAgIIP27Vp5iTBkQwDQYJKoZIhvcNAQELBQAwgbUxCzAJBgNVBAYTAkVDMREw\r\nDwYDVQQHDAhETSBRVUlUTzEhMB8GA1UECgwYQ09OU0VKTyBERSBMQSBKVURJQ0FUVVJBMUQwQgYD\r\nVQQLDDtTVUJESVJFQ0NJT04gTkFDSU9OQUwgREUgU0VHVVJJREFEIERFIExBIElORk9STUFDSU9O\r\nIEROVElDUzEqMCgGA1UEAwwhRU5USURBRCBERSBDRVJUSUZJQ0FDSU9OIElDRVJULUVDMB4XDTE4\r\nMDUwMzIyNDQyOVoXDTIwMDUwMzIyNDQyOVowWTELMAkGA1UEBhMCRUMxDjAMBgNVBAcMBU1BQ0FT\r\nMRMwEQYDVQQFEwoxNDAwNzIyMTI4MSUwIwYDVQQDDBxNQVJUSEEgSVNBQkVMIE1PUk9DSE8gQUhP\r\nw5FBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAi6hu+5IMC/btYNmJp8KGdXSdfPe6\r\nPW4eSfT4Nw0VlrTdpWV3fQgmssKYHTU0Yl9pcDPWzBPBpLpbKprzfUIlgyztnHPrsTh3+gVRoY4/\r\n4N04Zua4tsKfrURxrr3AUffPsKxVGdgIYWUwBRG49CPb2GCTg1D68tpS8/YxS4qNi0pKi/7lPtw4\r\neyUv0PVGsXd4qFCCj6IO+e8npVMgIoCw4lZQLZGk9sd82mPRZyHmATERc1y9dVtWMCWuaLHr2Xb/\r\niahtRxmGbQwnrQ2dZxSDUEchYBVLLsY1KeSGNmgP4246sXPkra61DyqasfjcFCbmu/Nl/V0k9onU\r\noKGet9Jo2QIDAQABo4IC/TCCAvkwggGRBgNVHREEggGIMIIBhIETZ2xvcml0ckBob3RtYWlsLmNv\r\nbaAbBgsrBgEEAYLVYQEDAaAMDAoxNDAwNzIyMTI4oB4GCysGAQQBgtVhAQMCoA8MDU1BUlRIQSBJ\r\nU0FCRUygGAYLKwYBBAGC1WEBAwOgCQwHTU9ST0NIT6AXBgsrBgEEAYLVYQEDBKAIDAZBSE/DkUGg\r\nIQYLKwYBBAGC1WEBAwegEgwQR1VBTU9URSBZIFRBUlFVSaAeBgsrBgEEAYLVYQEDCKAPDA0rNTkz\r\nOTY5MzEzNDc4oBYGCysGAQQBgtVhAQMJoAcMBU1BQ0FToB4GCysGAQQBgtVhAQMLoA8MDTE0MDA3\r\nMjIxMjgwMDGgGAYLKwYBBAGC1WEBAwygCQwHRUNVQURPUqAgBgsrBgEEAYLVYQEDMqARDA9QRVJT\r\nT05BIE5BVFVSQUygIAYLKwYBBAGC1WEBAzOgEQwPQVJDSElWTyBQS0NTIzEyoBEGCysGAQQBgtVh\r\nAQM0oAIMAKARBgsrBgEEAYLVYQEDNaACDAAwOAYIKwYBBQUHAQEELDAqMCgGCCsGAQUFBzABhhxo\r\ndHRwOi8vb2NzcC5pY2VydC5mamUuZ29iLmVjMB0GA1UdDgQWBBT55SGLNEv4JZ5g5kAjWSGv1wtx\r\nuzAJBgNVHRMEAjAAMB8GA1UdIwQYMBaAFC8ievhebZSOakAUN8dua3LpOsI/MHIGA1UdIARrMGkw\r\nZwYOKwYBBAGC1WEBAgEBAgEwVTBTBggrBgEFBQcCARZHaHR0cDovL3d3dy5pY2VydC5mamUuZ29i\r\nLmVjL2RwYy9kZWNsYXJhY2lvbl9wcmFjdGljYXNfY2VydGlmaWNhY2lvbi5wZGYwOgYDVR0fBDMw\r\nMTAvoC2gK4YpaHR0cDovL3d3dy5pY2VydC5mamUuZ29iLmVjL2NybC9pY2VydC5jcmwwDgYDVR0P\r\nAQH/BAQDAgbAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDANBgkqhkiG9w0BAQsFAAOC\r\nAgEAjWITNwHWZ9SFZCggiAtaUqG15AejRd31DMZBjD6Eww0YinsLYR22em/asZxTe0/FIti4SCCx\r\nDSXdfI10mNicT93sD4Mfwj8qKtpNSVHvlS2LKGvz3JcXOjmBcJdrTjYZDuBDgHm/s1js7SgYQbpT\r\nEIbUyANvqlTsi29jVr5JM/jq4ROWslTsUi/jtngyC2mYVwmstlbgI0xbznqtDF2eB9xz3c5ak/vd\r\nZHGVy/XGUecex9Demp8A9d/kKmw1HHFs4E7Fqni7xXs8+yqDC+8xkohaYeis3B4T4UAf/4+2y4+s\r\nf/qSp1+4xHKULOozqfrwb7DpLhernFI41Nhc3MJkztTjEX7lMbr9+eqi8duzRqYjYesMYlFGarAt\r\nccq3lFb6kcgmhQQEP3LO/BUogACbFl0ZwjhgTVcFxt9fI7WXN2YpEDyIx54xQKVP0sjBgdRWjASm\r\nA9OPRzUX/y+G8pB/JDQE1hWnxLlcSt6BpNSEtj+qrVA4TO/DJCCuJzQMBL+aaR3U1nbhNWNHHAb1\r\nREfsqkaIq1gzVzJPSvx73B6xTVRapvdBda/98yHxmTPlGwY29lYeb9ECz4p7L1qeyIduG8qwv78C\r\n5WQYxmaEnPK7UppNSWk4NyleqwxQHcxlcLfGor6uaPKAXL/FPou+0k26nZoEoejJGEDQjOkkkBfY\r\nHqE=\r\n</ds:X509Certificate>\r\n</ds:X509Data>\r\n<ds:KeyValue>\r\n<ds:RSAKeyValue>\r\n<ds:Modulus>\r\ni6hu+5IMC/btYNmJp8KGdXSdfPe6PW4eSfT4Nw0VlrTdpWV3fQgmssKYHTU0Yl9pcDPWzBPBpLpb\r\nKprzfUIlgyztnHPrsTh3+gVRoY4/4N04Zua4tsKfrURxrr3AUffPsKxVGdgIYWUwBRG49CPb2GCT\r\ng1D68tpS8/YxS4qNi0pKi/7lPtw4eyUv0PVGsXd4qFCCj6IO+e8npVMgIoCw4lZQLZGk9sd82mPR\r\nZyHmATERc1y9dVtWMCWuaLHr2Xb/iahtRxmGbQwnrQ2dZxSDUEchYBVLLsY1KeSGNmgP4246sXPk\r\nra61DyqasfjcFCbmu/Nl/V0k9onUoKGet9Jo2Q==\r\n</ds:Modulus>\r\n<ds:Exponent>AQAB</ds:Exponent>\r\n</ds:RSAKeyValue>\r\n</ds:KeyValue>\r\n</ds:KeyInfo>\r\n<ds:Object Id=\"Signature911069-Object974869\"><etsi:QualifyingProperties Target=\"#Signature911069\"><etsi:SignedProperties Id=\"Signature911069-SignedProperties854160\"><etsi:SignedSignatureProperties><etsi:SigningTime>2020-07-15T09:50:28-05:00</etsi:SigningTime><etsi:SigningCertificate><etsi:Cert><etsi:CertDigest><ds:DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"/><ds:DigestValue>TgjN0ZuLkqV2X1VU8dkoWXPRm5k=</ds:DigestValue></etsi:CertDigest><etsi:IssuerSerial><ds:X509IssuerName>CN=ENTIDAD DE CERTIFICACION ICERT-EC,OU=SUBDIRECCION NACIONAL DE SEGURIDAD DE LA INFORMACION DNTICS,O=CONSEJO DE LA JUDICATURA,L=DM QUITO,C=EC</ds:X509IssuerName><ds:X509SerialNumber>4570825587623659076</ds:X509SerialNumber></etsi:IssuerSerial></etsi:Cert></etsi:SigningCertificate></etsi:SignedSignatureProperties><etsi:SignedDataObjectProperties><etsi:DataObjectFormat ObjectReference=\"#Reference-ID-806540\"><etsi:Description>contenido comprobante</etsi:Description><etsi:MimeType>text/xml</etsi:MimeType></etsi:DataObjectFormat></etsi:SignedDataObjectProperties></etsi:SignedProperties></etsi:QualifyingProperties></ds:Object></ds:Signature></comprobanteRetencion>]]></comprobante><mensajes><mensaje><identificador>39</identificador><mensaje>FIRMA INVALIDA</mensaje><informacionAdicional>La firma es invalida [La fecha de firma no esta dentro del periodo de validez del certificado firmante]</informacionAdicional><tipo>ERROR</tipo></mensaje></mensajes></autorizacion></autorizaciones></RespuestaAutorizacionComprobante></response>\n', 'RETENCION', 1, 0, 1, 1, ', 39FIRMA INVALIDALa firma es invalida [La fecha de firma no esta dentro del periodo de validez del certificado firmante]ERROR, FIRMA INVALIDA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia_remision`
--

DROP TABLE IF EXISTS `guia_remision`;
CREATE TABLE IF NOT EXISTS `guia_remision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compras_ventas_id` int(11) NOT NULL,
  `chofer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placa` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion_origen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad_origen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion_destino` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad_destino` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `establecimiento` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_191A1DC958B4B2FD` (`compras_ventas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos_egresos`
--

DROP TABLE IF EXISTS `ingresos_egresos`;
CREATE TABLE IF NOT EXISTS `ingresos_egresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bodega_id` int(11) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `cliente_proveedor_id` int(11) DEFAULT NULL,
  `bodega_detino_id` int(11) DEFAULT NULL,
  `tipo` smallint(6) DEFAULT NULL,
  `proceso` tinyint(1) DEFAULT NULL,
  `fecha` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `hora` time NOT NULL COMMENT '(DC2Type:carbontime)',
  `numero` int(11) DEFAULT NULL,
  `motivo` smallint(6) DEFAULT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referencia` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receptor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_18CA7E088B1FDE9D` (`bodega_id`),
  KEY `IDX_18CA7E0867B3B43D` (`users_id`),
  KEY `IDX_18CA7E089F3C9BC1` (`cliente_proveedor_id`),
  KEY `IDX_18CA7E0835D1FB8C` (`bodega_detino_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingresos_egresos`
--

INSERT INTO `ingresos_egresos` (`id`, `bodega_id`, `users_id`, `cliente_proveedor_id`, `bodega_detino_id`, `tipo`, `proceso`, `fecha`, `hora`, `numero`, `motivo`, `observacion`, `referencia`, `receptor`, `estado`) VALUES
(1, 6, 1, NULL, 6, 1, 1, '2020-01-03', '21:15:06', 1, 3, NULL, NULL, NULL, 1),
(2, 6, 1, NULL, 6, 0, 1, '2020-01-03', '21:15:06', 1, 3, NULL, NULL, NULL, 1),
(3, 6, 1, NULL, 6, 1, 1, '2020-01-03', '21:46:39', 2, 3, NULL, NULL, NULL, 1),
(4, 6, 1, NULL, 6, 0, 1, '2020-01-03', '21:46:39', 2, 3, NULL, NULL, NULL, 1),
(5, 6, 1, NULL, 6, 1, 1, '2020-01-21', '20:35:51', 3, 3, NULL, NULL, NULL, 1),
(6, 6, 1, NULL, 6, 0, 1, '2020-01-21', '20:35:51', 3, 3, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) NOT NULL,
  `cuenta_ventas_id` int(11) DEFAULT NULL,
  `cuenta_costoventas_id` int(11) DEFAULT NULL,
  `cuenta_mercaderia_id` int(11) DEFAULT NULL,
  `tipo` smallint(6) NOT NULL,
  `codigo_producto` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grupo1` smallint(6) DEFAULT NULL,
  `grupo2` smallint(6) DEFAULT NULL,
  `grupo3` smallint(6) DEFAULT NULL,
  `nombre` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_factura` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medida` smallint(6) DEFAULT NULL,
  `marca` smallint(6) DEFAULT NULL,
  `fraccion` tinyint(1) DEFAULT NULL,
  `factor` smallint(6) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `ice` decimal(10,2) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `pv1` double NOT NULL,
  `pv2` decimal(10,2) DEFAULT NULL,
  `pv3` decimal(10,2) DEFAULT NULL,
  `pv4` decimal(10,2) DEFAULT NULL,
  `pv5` decimal(10,2) DEFAULT NULL,
  `pv6` decimal(10,2) DEFAULT NULL,
  `pv7` decimal(10,2) DEFAULT NULL,
  `pv8` decimal(10,2) DEFAULT NULL,
  `pv9` decimal(10,2) DEFAULT NULL,
  `pv10` decimal(10,2) DEFAULT NULL,
  `utilidad1` decimal(10,2) DEFAULT NULL,
  `cantidad_minima` smallint(6) DEFAULT NULL,
  `cantidad_maxima` smallint(6) DEFAULT NULL,
  `codigo_barra` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `procedencia` tinyint(1) DEFAULT NULL,
  `pais` smallint(6) DEFAULT NULL,
  `parteoriginal` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fabricacion` smallint(6) DEFAULT NULL,
  `expira` tinyint(1) DEFAULT NULL,
  `dias_expira` smallint(6) DEFAULT NULL,
  `combustible` tinyint(1) DEFAULT NULL,
  `tipo_venta` tinyint(1) DEFAULT NULL,
  `vehiculo` tinyint(1) DEFAULT NULL,
  `deducible` smallint(6) DEFAULT NULL,
  `tipo_servicio` tinyint(1) DEFAULT NULL,
  `comision_vendedores` decimal(10,2) DEFAULT NULL,
  `subsidio` decimal(10,2) DEFAULT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posologia` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contradicciones` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usos` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estante` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `columna` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detalle` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `componentes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_balanza` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `fecha_creacion` datetime NOT NULL COMMENT '(DC2Type:carbondatetime)',
  `fecha_modificacion` datetime DEFAULT NULL COMMENT '(DC2Type:carbondatetime)',
  `fecha_eliminacion` datetime DEFAULT NULL COMMENT '(DC2Type:carbondatetime)',
  `deleted_at` datetime DEFAULT NULL,
  `caducable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6A194EF567B3B43D` (`users_id`),
  KEY `IDX_6A194EF5DFDB2E59` (`cuenta_ventas_id`),
  KEY `IDX_6A194EF5BCB3126F` (`cuenta_costoventas_id`),
  KEY `IDX_6A194EF512148A28` (`cuenta_mercaderia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `users_id`, `cuenta_ventas_id`, `cuenta_costoventas_id`, `cuenta_mercaderia_id`, `tipo`, `codigo_producto`, `grupo1`, `grupo2`, `grupo3`, `nombre`, `nombre_factura`, `medida`, `marca`, `fraccion`, `factor`, `iva`, `ice`, `cantidad`, `costo`, `precio_venta`, `pv1`, `pv2`, `pv3`, `pv4`, `pv5`, `pv6`, `pv7`, `pv8`, `pv9`, `pv10`, `utilidad1`, `cantidad_minima`, `cantidad_maxima`, `codigo_barra`, `procedencia`, `pais`, `parteoriginal`, `fabricacion`, `expira`, `dias_expira`, `combustible`, `tipo_venta`, `vehiculo`, `deducible`, `tipo_servicio`, `comision_vendedores`, `subsidio`, `observacion`, `posologia`, `contradicciones`, `usos`, `estante`, `lado`, `fila`, `columna`, `detalle`, `accion`, `componentes`, `codigo_balanza`, `imagen`, `estado`, `fecha_creacion`, `fecha_modificacion`, `fecha_eliminacion`, `deleted_at`, `caducable`) VALUES
(1, 1, NULL, NULL, NULL, 0, '001', 18, 19, 20, 'COMPUTADOR  PORTATIL HP 305 MS254', 'COMPUTADOR  PORTATIL HP 305 MS254', NULL, 21, 0, 12, '12.00', NULL, '7.00', '20.00', '22.40', 30, '25.00', '30.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '33.93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-05-14 03:26:19', NULL, NULL, NULL, NULL),
(2, 1, NULL, NULL, NULL, 0, '002', NULL, NULL, NULL, 'IMPRESORA EPSON  TMU220', 'IMPRESORA EPSON  TMU220', NULL, NULL, 0, NULL, '12.00', NULL, '18.00', '20.00', '22.40', 25, '22.00', '23.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11.61', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-05-28 04:46:11', NULL, NULL, NULL, NULL),
(3, 1, NULL, NULL, NULL, 0, '001', NULL, NULL, NULL, 'TECLADO GENIUS P220', 'TECLADO GENIUS P220', NULL, NULL, 0, NULL, '0.00', NULL, '12.00', '10.00', '10.00', 12, '13.00', '14.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-05-29 15:16:45', NULL, NULL, NULL, NULL),
(4, 1, NULL, NULL, NULL, 0, '0001', NULL, NULL, NULL, 'MONITOR  LG 20 PULGADAS', 'MONITOR  LG 20 PULGADAS', NULL, NULL, NULL, NULL, '12.00', NULL, '3.00', '100.00', '112.00', 130, '140.00', '150.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '16.07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-01 17:23:17', NULL, NULL, NULL, NULL),
(5, 1, NULL, NULL, NULL, 0, '5', NULL, NULL, NULL, 'CPU', 'CPU', NULL, NULL, 0, NULL, '12.00', NULL, '2.00', '15.00', '16.80', 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '48.81', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-05 00:10:28', NULL, NULL, NULL, NULL),
(6, 1, NULL, NULL, NULL, 0, 'PTERM0100205', NULL, NULL, NULL, 'CABO 1/2 GANADERO ROJO', 'CABO 1/2 GANADERO ROJO', NULL, NULL, NULL, NULL, '12.00', NULL, '18.05', '68.38', '76.59', 76.59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-20 10:03:20', NULL, NULL, NULL, NULL),
(7, 1, NULL, NULL, NULL, 0, 'PTERM0100456', NULL, NULL, NULL, 'CABO 1/2 JAQUIMERO', 'CABO 1/2 JAQUIMERO', NULL, NULL, NULL, NULL, '12.00', NULL, '16.15', '64.97', '72.77', 72.77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-20 10:03:20', NULL, NULL, NULL, NULL),
(8, 1, NULL, NULL, NULL, 0, '4972', NULL, NULL, NULL, 'VODKA RUSSOK 1 LTRS:  ', 'VODKA RUSSOK 1 LTRS:  ', NULL, NULL, NULL, NULL, '12.00', NULL, '1.00', '4.46', '5.00', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-20 14:19:56', NULL, NULL, NULL, NULL),
(9, 1, NULL, NULL, NULL, 0, 'CD', NULL, NULL, NULL, 'CAMBIO DE DOMICILIO CON FIBRA OPTICA', 'CAMBIO DE DOMICILIO CON FIBRA OPTICA', NULL, NULL, NULL, NULL, '12.00', NULL, '0.00', '26.79', '30.00', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-20 14:22:18', NULL, NULL, NULL, NULL),
(10, 1, NULL, NULL, NULL, 0, '0121', NULL, NULL, NULL, 'DIESEL PREMIUM DISTRIBUIDOR', 'DIESEL PREMIUM DISTRIBUIDOR', NULL, NULL, NULL, NULL, '12.00', NULL, '1.00', '0.82', '197.15', 197.15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-27 13:28:58', NULL, NULL, NULL, NULL),
(11, 1, NULL, NULL, NULL, 0, '0121', NULL, NULL, NULL, 'DIESEL PREMIUM DISTRIBUIDOR', 'DIESEL PREMIUM DISTRIBUIDOR', NULL, NULL, NULL, NULL, '12.00', NULL, '1.00', '0.82', '197.15', 197.15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-27 13:29:02', NULL, NULL, NULL, NULL),
(12, 1, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, 'RE ESTA REPITIENDO EL 1', 'RE ESTA REPITIENDO EL 1', NULL, NULL, 1, NULL, '12.00', NULL, '1.00', '20.00', '22.40', 50, '55.00', '52.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123.21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-07-05 09:05:44', NULL, NULL, NULL, NULL),
(13, 1, NULL, NULL, NULL, 0, '242001100', NULL, NULL, NULL, 'ALPISTE SACO 100LBS', 'ALPISTE SACO 100LBS', NULL, NULL, NULL, NULL, '12.00', NULL, '3.00', '36.34', '40.70', 40.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-07-15 21:35:14', NULL, NULL, NULL, 1),
(14, 1, NULL, NULL, NULL, 0, '313501495', NULL, NULL, NULL, 'MICHU POLLO 18KG  P/N', 'MICHU POLLO 18KG  P/N', NULL, NULL, NULL, NULL, '12.00', NULL, '3.00', '28.31', '31.71', 31.71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-07-15 21:35:14', NULL, NULL, NULL, NULL),
(15, 1, NULL, NULL, NULL, 1, 'SC', 0, 1, NULL, 'Transporte', 'Transporte', NULL, NULL, NULL, NULL, '12.00', '1.00', NULL, '0.00', NULL, 5, '10.00', '15.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-12-04 16:44:12', NULL, NULL, NULL, NULL),
(16, 1, NULL, NULL, NULL, 1, 'SP', 1, NULL, NULL, 'Transporte', 'Transporte', NULL, NULL, NULL, NULL, '12.00', '1.00', NULL, NULL, NULL, 5, '10.00', '15.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-12-04 16:44:47', NULL, NULL, NULL, NULL),
(17, 1, NULL, NULL, NULL, 0, '0024', NULL, NULL, NULL, 'Producto codigos', 'Producto codigos', NULL, NULL, 0, NULL, '12.00', NULL, '5.00', '8.00', '8.96', 9, '10.00', '11.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-01-16 22:25:24', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_alterno`
--

DROP TABLE IF EXISTS `inventario_alterno`;
CREATE TABLE IF NOT EXISTS `inventario_alterno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventario_id` int(11) NOT NULL,
  `inventario2_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9E9B5926DFDFBE2A` (`inventario_id`),
  KEY `IDX_9E9B59261FBD9415` (`inventario2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_codigos`
--

DROP TABLE IF EXISTS `inventario_codigos`;
CREATE TABLE IF NOT EXISTS `inventario_codigos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventario_id` int(11) DEFAULT NULL,
  `codigo` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B2511E0EDFDFBE2A` (`inventario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventario_codigos`
--

INSERT INTO `inventario_codigos` (`id`, `inventario_id`, `codigo`) VALUES
(2, 17, '12365478'),
(5, 1, '1400730105');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

DROP TABLE IF EXISTS `kardex`;
CREATE TABLE IF NOT EXISTS `kardex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) NOT NULL,
  `bodega_id` int(11) DEFAULT NULL,
  `inventario_id` int(11) DEFAULT NULL,
  `tipo` smallint(6) DEFAULT NULL,
  `fecha` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `hora` time NOT NULL COMMENT '(DC2Type:carbontime)',
  `periodo_kardex` smallint(6) DEFAULT NULL,
  `descripcion` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origen` smallint(6) DEFAULT NULL,
  `costo_original` double DEFAULT NULL,
  `costo_articulo` double DEFAULT NULL,
  `cantidad_ingresa` double DEFAULT NULL,
  `cantidad_egresa` double DEFAULT NULL,
  `saldo_cantidad` double DEFAULT NULL,
  `referencia` smallint(6) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `compras_ventas_id` int(11) DEFAULT NULL,
  `ingresos_egresos_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BF1F6DC067B3B43D` (`users_id`),
  KEY `IDX_BF1F6DC08B1FDE9D` (`bodega_id`),
  KEY `IDX_BF1F6DC0DFDFBE2A` (`inventario_id`),
  KEY `IDX_BF1F6DC058B4B2FD` (`compras_ventas_id`),
  KEY `IDX_BF1F6DC0A25FEB46` (`ingresos_egresos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`id`, `users_id`, `bodega_id`, `inventario_id`, `tipo`, `fecha`, `hora`, `periodo_kardex`, `descripcion`, `origen`, `costo_original`, `costo_articulo`, `cantidad_ingresa`, `cantidad_egresa`, `saldo_cantidad`, `referencia`, `deleted_at`, `compras_ventas_id`, `ingresos_egresos_id`) VALUES
(39, 1, 6, 1, 1, '2019-07-30', '16:32:31', NULL, 'Compra con FACTURA N° 001-001-321 a MARTHA  MOROCHO', NULL, 20, 20, 5, NULL, 5, NULL, NULL, 106, NULL),
(40, 1, 6, 2, 1, '2019-07-30', '16:32:31', NULL, 'Compra con FACTURA N° 001-001-321 a MARTHA  MOROCHO', NULL, 20, 20, 5, NULL, 5, NULL, NULL, 106, NULL),
(43, 1, 6, 1, 5, '2019-07-30', '17:01:32', NULL, 'Egreso por Nota de crédito N° 001-001-321 sobre la Compra N° 001-001-321', NULL, 20, 20, NULL, 1, 4, NULL, NULL, 108, NULL),
(44, 1, 6, 2, 5, '2019-07-30', '17:01:32', NULL, 'Egreso por Nota de crédito N° 001-001-321 sobre la Compra N° 001-001-321', NULL, 20, 20, NULL, 1, 4, NULL, NULL, 108, NULL),
(45, 1, 6, 2, 5, '2019-07-30', '19:09:45', NULL, 'Egreso por Nota de crédito N° 001-001-33 sobre la Compra N° 001-001-321', NULL, 20, 20, NULL, 1, 3, NULL, NULL, 109, NULL),
(46, 1, 7, 1, 1, '2019-07-30', '21:16:12', NULL, 'Compra con FACTURA N° 001-001-12 a santiago alfredo rivera', NULL, 20, 20, 5, NULL, 5, NULL, NULL, 110, NULL),
(47, 1, 6, 1, 5, '2019-07-30', '22:26:44', NULL, 'Egreso por Nota de crédito N° 001-001-7 sobre la Compra N° 001-001-321', NULL, 20, 20, NULL, 1, 3, NULL, NULL, 111, NULL),
(48, 1, 6, 1, 5, '2019-08-02', '23:17:49', NULL, 'Egreso por Nota de crédito N° 001-001-336 sobre la Compra N° 001-001-12', NULL, 20, 20, NULL, 1, 2, NULL, NULL, 115, NULL),
(49, 1, 6, 2, 5, '2019-08-02', '23:21:31', NULL, 'Egreso por Nota de crédito N° 001-001-45 sobre la Compra N° 001-001-321', NULL, 20, 20, NULL, 1, 2, NULL, NULL, 116, NULL),
(50, 1, 6, 1, 11, '2019-08-02', '23:45:11', NULL, 'Ingreso por Anulación de la Nota de crédito N° 001-001-321 sobre la Compra N° 001-001-321', NULL, 20, 20, 1, NULL, 5, NULL, NULL, 108, NULL),
(51, 1, 6, 2, 11, '2019-08-02', '23:45:11', NULL, 'Ingreso por Anulación de la Nota de crédito N° 001-001-321 sobre la Compra N° 001-001-321', NULL, 20, 20, 1, NULL, 6, NULL, NULL, 108, NULL),
(52, 1, 6, 2, 11, '2019-08-02', '23:45:17', NULL, 'Ingreso por Anulación de la Nota de crédito N° 001-001-33 sobre la Compra N° 001-001-321', NULL, 20, 20, 1, NULL, 7, NULL, NULL, 109, NULL),
(53, 1, 6, 3, 1, '2019-08-06', '22:11:17', NULL, 'Compra con FACTURA N° 001-001-3256 a MARTHA  MOROCHO', NULL, 10, 10, 10, NULL, 10, NULL, NULL, 117, NULL),
(54, 1, 6, 2, 1, '2019-08-12', '20:44:22', NULL, 'Compra con FACTURA N° 001-001-123654789 a MARTHA  MOROCHO', NULL, 20, 20, 1, NULL, 8, NULL, NULL, 118, NULL),
(55, 1, 6, 1, 1, '2019-11-12', '22:30:37', NULL, 'Compra con FACTURA N° 001-001-54 a MARTHA  MOROCHO', 1, 20, 20, 2, NULL, 7, NULL, NULL, 119, NULL),
(56, 1, 6, 1, 1, '2019-11-12', '22:35:09', NULL, 'Compra con FACTURA N° 001-001-259 a NICOLAS  ALEJANDRO CARDENAS MOROCHO', 1, 20, 20, 1, NULL, 8, NULL, NULL, 120, NULL),
(57, 1, 6, 3, 1, '2019-11-12', '22:36:09', NULL, 'Compra con FACTURA N° 001-001-654 a MARTHA  MOROCHO', 1, 10, 10, 1, NULL, 11, NULL, NULL, 121, NULL),
(58, 1, 6, 5, 1, '2019-11-12', '23:36:57', NULL, 'Compra con FACTURA N° 001-001-543 a MARTHA  MOROCHO', 1, 15, 15, 1, NULL, 1, NULL, NULL, 128, NULL),
(59, 1, 6, 1, 1, '2019-11-13', '22:02:48', NULL, 'Compra con FACTURA N° 001-002-5432 a MARTHA  MOROCHO', 1, 20, 20, 1, NULL, 9, NULL, NULL, 129, NULL),
(60, 1, 6, 1, 1, '2019-11-15', '19:32:15', NULL, 'Egreso por Nota de crédito N° 001-001-89 sobre la Compra N° 001-001-54', 24, 20, 20, NULL, 2, 7, NULL, NULL, 130, NULL),
(61, 1, 6, 1, 0, '2019-11-15', '19:46:56', NULL, 'Ingreso por Anulación de la Nota de crédito N° 001-001-89 sobre la Compra N° 001-001-54', 11, 20, 20, 2, NULL, 9, NULL, NULL, 130, NULL),
(62, 1, 6, 2, 1, '2019-11-15', '21:55:48', NULL, 'Compra con FACTURA N° 001-002-654 a MARTHA  MOROCHO', 1, 20, 20, 4, NULL, 12, NULL, NULL, 131, NULL),
(63, 1, 7, 1, 1, '2019-11-19', '17:41:52', NULL, 'Compra con FACTURA N° 001-002-743 a MARTHA  MOROCHO', 1, 20, 20, 1, NULL, 6, NULL, NULL, 132, NULL),
(64, 1, 6, 1, 1, '2019-12-11', '15:47:52', NULL, 'Venta con factura 001-004-6', 20, 30, 30, NULL, 1, 3, NULL, NULL, 137, NULL),
(65, 1, 6, 1, 1, '2019-12-11', '22:43:11', NULL, 'Venta con factura 001-004-7', 20, 30, 30, NULL, 1, 2, NULL, NULL, 138, NULL),
(66, 1, 6, 1, 1, '2019-12-17', '21:02:23', NULL, 'Venta con factura 001-004-8', 20, 30, 30, NULL, 1, 1, NULL, NULL, 139, NULL),
(67, 1, 6, 1, 0, '2019-12-17', '23:56:59', NULL, 'Compra con FACTURA N° 001-002-23 a MARTHA  MOROCHO', 1, 20, 20, 1, NULL, 2, NULL, NULL, 140, NULL),
(68, 1, 6, 1, 1, '2020-01-03', '21:15:06', NULL, 'Egreso para crear producto modificado', 23, 20, 20, NULL, NULL, 1, NULL, NULL, NULL, 1),
(69, 1, 6, 2, 0, '2020-01-03', '21:15:06', NULL, 'Creación de producto combinado o modificado', 4, 20, 20, NULL, NULL, 13, NULL, NULL, NULL, 2),
(70, 1, 6, 3, 1, '2020-01-03', '21:46:39', NULL, 'Egreso para crear producto modificado', 23, 10, 10, NULL, NULL, 10, NULL, NULL, NULL, 3),
(71, 1, 6, 5, 0, '2020-01-03', '21:46:39', NULL, 'Creación de producto combinado o modificado', 4, 15, 15, NULL, NULL, 2, NULL, NULL, NULL, 4),
(72, 1, 6, 1, 0, '2020-01-09', '19:42:13', NULL, 'Compra con LIQUIDACIÓN DE COMPRA DE BIENES Y PRESTACIÓN DE SERVICIOS  N° 001-003-1 a MARTHA  MOROCHO', 1, 20, 20, 1, NULL, 2, NULL, NULL, 141, NULL),
(73, 1, 6, 1, 0, '2020-01-09', '19:47:39', NULL, 'Compra con LIQUIDACIÓN DE COMPRA DE BIENES Y PRESTACIÓN DE SERVICIOS  N° 001-003-2 a MARTHA  MOROCHO', 1, 20, 20, 1, NULL, 3, NULL, NULL, 142, NULL),
(74, 1, 6, 1, 0, '2020-01-09', '20:02:35', NULL, 'Compra con LIQUIDACIÓN DE COMPRA DE BIENES Y PRESTACIÓN DE SERVICIOS  N° 001-003-1 a MARTHA  MOROCHO', 1, 20, 20, 1, NULL, 4, NULL, NULL, 143, NULL),
(75, 1, 6, 1, 0, '2020-01-09', '20:43:29', NULL, 'Compra con FACTURA N° 001-003-1 a MARTHA  MOROCHO', 1, 20, 20, 1, NULL, 5, NULL, NULL, 144, NULL),
(76, 1, NULL, 17, 0, '2020-01-16', '22:25:24', NULL, 'Inventario inicial', 0, 8, 8, 8, NULL, 8, NULL, NULL, NULL, NULL),
(78, 1, 6, 17, 0, '2020-01-17', '20:39:02', NULL, 'Compra con FACTURA N° 001-002-78 a santiago alfredo rivera', 1, 8, 8, 4, NULL, 4, NULL, NULL, 145, NULL),
(79, 1, 6, 5, 1, '2020-01-21', '20:35:51', NULL, 'Egreso para crear producto modificado', 23, 15, 15, NULL, 1, 1, NULL, NULL, NULL, 5),
(80, 1, 6, 17, 0, '2020-01-21', '20:35:51', NULL, 'Creación de producto combinado o modificado', 4, 8, 8, 1, NULL, 5, NULL, NULL, NULL, 6),
(81, 1, 6, 1, 1, '2020-03-13', '21:10:02', NULL, 'Venta con factura 001-004-11', 20, 30, 40, NULL, 4, 1, NULL, NULL, 148, NULL),
(82, 1, 6, 4, 0, '2020-07-15', '16:50:08', NULL, 'Compra con FACTURA N° 001-002-001 a MARTHA  MOROCHO', 1, 100, 100, 1, NULL, 1, NULL, NULL, 149, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listas`
--

DROP TABLE IF EXISTS `listas`;
CREATE TABLE IF NOT EXISTS `listas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` smallint(6) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `dato` int(11) DEFAULT NULL,
  `dato2` int(11) DEFAULT NULL,
  `referencia` smallint(6) DEFAULT NULL,
  `referencia2` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `listas`
--

INSERT INTO `listas` (`id`, `tipo`, `nombre`, `descripcion`, `codigo`, `estado`, `deleted_at`, `dato`, `dato2`, `referencia`, `referencia2`) VALUES
(1, 1, 'Natural', 'Personas Naturales', '1', 1, '2019-04-16 00:46:32', NULL, NULL, NULL, NULL),
(2, 1, 'MAYORISTA EMPRESA / INSTITUCION', 'MAYORISTAS PERSONAS JURIDICAS', '01', 1, NULL, NULL, NULL, NULL, NULL),
(3, 1, 'OOOOOOOOOO88789899', 'JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJIII9999999999', NULL, 1, '2019-04-17 18:58:02', NULL, NULL, NULL, NULL),
(4, 3, 'MACAS', 'NADA', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(5, 6, 'ECUADOR', 'NADA', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(6, 6, 'Venezuela', NULL, NULL, 1, '2019-04-17 19:02:56', NULL, NULL, NULL, NULL),
(7, 1, 'MAYORISTA PERSONA NATURAL', 'EMPLEADOS', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(8, 1, 'MINORISTA PERSONA NATURAL', 'EMPLEADOS', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(9, 9, 'MAYORISTA', NULL, NULL, 1, '2019-05-05 06:35:26', NULL, NULL, NULL, NULL),
(10, 9, 'MAYORISTA', NULL, NULL, 1, '2019-05-14 03:24:27', NULL, NULL, 9, NULL),
(11, 7, 'MAYORISTA', 'NNN', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(12, 3, 'QUITO', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(13, 6, 'MEXICO', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(14, 1, 'MINORISTA PERSONA EMPRESA/INSTITUCION', 'MINORISTA  PERSONA JURIDICA', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(15, 6, 'VENEZUELA', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(16, 3, 'CARACAS', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(17, 9, 'REFRIGERADORAS', NULL, NULL, 1, NULL, NULL, NULL, 10, NULL),
(18, 9, 'COMPUTARDOR', NULL, NULL, 1, NULL, NULL, NULL, 17, NULL),
(19, 10, 'PORTATIL', NULL, NULL, 1, NULL, NULL, NULL, 18, NULL),
(20, 11, 'NOTEBOOK', NULL, NULL, 1, NULL, NULL, NULL, 18, 19),
(21, 12, 'LENOVO', NULL, NULL, 1, NULL, NULL, NULL, 18, 19),
(22, 12, 'HP', NULL, NULL, 1, NULL, NULL, NULL, 18, 19),
(23, 13, 'UNIDADES', NULL, NULL, 1, NULL, NULL, NULL, 18, 19),
(24, 8, 'PERSONA', 'NADA', '1000', 1, NULL, 10, 0, NULL, NULL),
(25, 4, 'MACAS', 'ZONA DE  CENTRO', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(26, 5, 'MACAS', NULL, NULL, 1, NULL, NULL, NULL, 25, NULL),
(27, 14, 'Ecuador', NULL, NULL, 1, NULL, NULL, NULL, 17, 18),
(28, 11, 'ss', NULL, NULL, 1, NULL, NULL, NULL, 17, 19),
(29, 11, 'ss', NULL, NULL, 1, NULL, NULL, NULL, 17, 19),
(30, 4, 'MacA s', 'Nada', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(31, 15, 'RETENCION  DE IMPUESTO A  LA  RENTA 1%', NULL, '312', 1, NULL, 0, 1, NULL, NULL),
(32, 2, 'minorista', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(33, 9, 'medicina', NULL, NULL, 1, NULL, NULL, NULL, 18, NULL),
(34, 10, 'generico', NULL, NULL, 1, NULL, NULL, NULL, 33, NULL),
(35, 11, 'gripe', NULL, NULL, 1, NULL, NULL, NULL, 33, 34),
(36, 16, 'MERACDERIA PARA LA VENTA  INVENTARIOS', NULL, '06', 1, NULL, NULL, NULL, NULL, NULL),
(37, 17, 'FACTURA', NULL, '01', 1, NULL, NULL, NULL, NULL, NULL),
(38, 18, NULL, NULL, NULL, 1, NULL, NULL, NULL, 36, 37),
(39, 3, 'chiguagua', NULL, NULL, 1, '2019-05-30 04:50:36', NULL, NULL, NULL, NULL),
(40, 15, 'impuesto a la renta 1 % bienes  y servicios', NULL, '312', 1, NULL, 0, 1, NULL, NULL),
(41, 15, 'Reten. IVA bienes 30%', NULL, '01', 1, NULL, 1, 30, NULL, NULL),
(42, 7, 'MINORISTA', 'AL PÒR MENOR', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(43, 7, 'EMPLEADO PRIVADO', 'EPLEADO', NULL, 1, NULL, NULL, NULL, NULL, NULL),
(44, 2, 'MAYORISTA', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(45, 3, 'SUCUA', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(46, 8, 'EMPRESA', 'LOCAL', '1000', 1, NULL, 3, 3, NULL, NULL),
(47, 3, 'Rio Blanco', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(48, 17, 'NOTA DE VENTA', NULL, '02', 1, NULL, NULL, NULL, NULL, NULL),
(49, 18, NULL, NULL, NULL, 1, NULL, NULL, NULL, 36, 48),
(50, 16, 'COSTO O GASTO PARA LA DECLARACION DEL IVA', NULL, '01', 1, NULL, NULL, NULL, NULL, NULL),
(51, 16, 'COSTO O GASTO PARA LA DECLARACION DE  LA RENTA', NULL, '02', 1, NULL, NULL, NULL, NULL, NULL),
(52, 18, NULL, NULL, NULL, 1, NULL, NULL, NULL, 51, 37),
(53, 18, NULL, NULL, NULL, 1, NULL, NULL, NULL, 50, 37),
(54, 19, 'SUMINISTRO DE  OFICINA', NULL, NULL, 1, NULL, 51, NULL, NULL, NULL),
(55, 25, 'Banco Pichincha', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(56, 25, 'Banco del Austro', NULL, '0', 1, NULL, NULL, NULL, NULL, NULL),
(57, 25, 'Cooperativa Jardín Azuayo', NULL, '0', 1, NULL, NULL, NULL, NULL, NULL),
(58, 15, 'Reten. IVA bienes 100%', NULL, '03', 1, NULL, 1, 100, NULL, NULL),
(59, 15, 'Reten. IVA servicios 70%', NULL, '02', 1, NULL, 2, 70, NULL, NULL),
(60, 15, 'Reten. IVA servicios 100%', NULL, '03', 1, NULL, 2, 100, NULL, NULL),
(61, 17, 'LIQUIDACIÓN DE COMPRA DE BIENES Y PRESTACIÓN DE SERVICIOS ', NULL, '03', 1, NULL, NULL, NULL, NULL, NULL),
(62, 18, NULL, NULL, NULL, 1, NULL, NULL, NULL, 36, 61),
(63, 31, 'Administrativo', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(64, 30, 'Vendedor', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote_caducidades`
--

DROP TABLE IF EXISTS `lote_caducidades`;
CREATE TABLE IF NOT EXISTS `lote_caducidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventario_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `compras_ventas_id` int(11) DEFAULT NULL,
  `fecha_caducidad` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `cantidad` int(11) NOT NULL,
  `lote` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registro_sanitario` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_fabricacion` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `pais_origen` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3C6746B8DFDFBE2A` (`inventario_id`),
  KEY `IDX_3C6746B8CB305D73` (`proveedor_id`),
  KEY `IDX_3C6746B858B4B2FD` (`compras_ventas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tree_root` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `clave` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lft` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `icon` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `tab_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7D053A93A977936C` (`tree_root`),
  KEY `IDX_7D053A93727ACA70` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `tree_root`, `parent_id`, `clave`, `nombre`, `lft`, `lvl`, `rgt`, `icon`, `state`, `active`, `tab_name`) VALUES
(1, 1, NULL, 'ADMIN_PARAMETROS', 'Administrador de Parametros', 1, 0, 10, 'settings_applications', 'administracion', 1, 'Admin Parametros'),
(2, 1, 1, 'PARAMETROS_GENERALES', 'Parametros Generales', 2, 1, 3, 'build', 'configuraciones', 1, 'Param Generales'),
(3, 1, 1, 'DATOS_EMPRESA', 'Datos de la empresa', 4, 1, 5, 'business', 'datos-empresa', 1, 'Datos Empresa'),
(4, 1, 1, 'ADMINISTRACION_PERMISOS', 'Administración de permisos', 6, 1, 7, 'how_to_reg', 'permisos', 1, 'Admin Permisos'),
(5, 1, 1, 'ADMINISTRACION_USUARIOS', 'Administración de usuarios', 8, 1, 9, 'group_add', 'usuarios', 1, 'Admin usuarios'),
(6, 6, NULL, 'PROVEEDORES', 'Proveedores', 1, 0, 12, 'emoji_transportation', 'proveedores', 1, 'Proveedores'),
(7, 6, 6, 'ADMINISTRACION_PROVEEDORES', 'Administración de Proveedores', 2, 1, 3, 'group', 'administracion-proveedores', 1, 'Admin Proveedores'),
(8, 6, 6, 'CUENTAS_PAGAR', 'Cuentas por Pagar', 4, 1, 11, 'credit_card', 'cuentas-pagar', 1, 'Cuentas Pagar'),
(9, 6, 8, 'REGISTRAR_PAGO_PROVEEDORES', 'Registrar Pagos a Proveedores', 5, 2, 6, 'attach_money', 'pago-proveedores', 1, 'Pago Proveedores'),
(10, 6, 8, 'ANULAR_PAGO_PROVEEDORES', 'Anular Pagos a Proveedores', 7, 2, 8, 'money_off', 'anular-pago-proveedores', 1, 'Anular Pago Prov'),
(11, 6, 8, 'ANTICIPO_PAGO_PROVEEDORES', 'Anticipos a Proveedores', 9, 2, 10, 'money', 'anticipo-proveedores', 1, 'Anticipo Proveedores'),
(12, 12, NULL, 'CLIENTES', 'Clientes', 1, 0, 28, 'directions_walk', 'clientes', 1, 'Clientes'),
(13, 12, 12, 'ADMINISTRACION_CLIENTES', 'Administracion de Clientes', 2, 1, 3, 'people_alt', 'administracion-clientes', 1, 'Admin Clientes'),
(14, 12, 12, 'CUENTAS_PAGAR_CLIENTES', 'Cuentas Por Pagar', 4, 1, 23, 'credit_card', '', 1, 'Cuentas Pagar Cli'),
(15, 12, 14, 'ESPECIFICAR_PLAN_PAGOS_CLIENTES', 'Especificar plan de pagos de Clientes', 5, 2, 6, 'date_range', 'plan-pagos-clientes', 0, 'Plan Pagos Cli'),
(16, 12, 14, 'REGISTRA_PAGOS_CLIENTES', 'Registrar pagos de Clientes', 7, 2, 8, 'attach_money', 'pago-clientes', 1, 'Pagos Clientes'),
(17, 12, 14, 'ANULAR_PAGOS_CLIENTES', 'Anular pagos de Clientes', 9, 2, 10, 'money_off', 'anular-pago-clientes', 1, 'Anular Pagos Cli'),
(18, 12, 14, 'REGISTRAR_COMPROMISO_PAGO', 'Registrar compromiso de Pago', 11, 2, 12, 'description', 'registrar-promesa-pago', 1, 'Compromiso Pago'),
(19, 12, 14, 'ESTABLECER_CUENTA_INCOBRABLE', 'Establecer cuenta incobrable', 13, 2, 14, 'no_sim', 'cuenta-incobrable', 1, 'Cuenta Incobrable'),
(20, 12, 14, 'OTRAS_CUENTAS_COBRAR', 'Otras cuentas por cobrar', 15, 2, 16, 'wc', 'registrar-deuda-simple', 1, 'Otras Cuentas Por Cobrar'),
(21, 12, 14, 'REGISTRAR_PAGO_OTRAS_CUENTAS', 'Registrar pago de otras cuentas', 17, 2, 18, 'import_contacts', 'registrar-pago-deuda', 1, 'Pago Otras Cuentas'),
(22, 12, 14, 'REGISTRAR_ANTICIPOS_CLIENTES', 'Registrar anticipos de Clientes', 19, 2, 20, 'check_circle_outline', 'anticipo-clientes', 1, 'Anticipos Cli'),
(23, 12, 14, 'DEVOLVER_ANTICIPO_CLIENTE', 'Devolver anticipo del Cliente', 21, 2, 22, 'remove_circle_outline', 'devolver-anticipo-clientes', 1, 'Devolver Anticipo Cli'),
(24, 12, 12, 'REVISAR_KARDEX_CLIENTE', 'Revisar Kardex del Cliente', 24, 1, 25, 'assignment', 'kardex-cliente', 1, 'Kardex Cliente'),
(25, 12, 12, 'VER_ESTADOS_CUENTA_CLIENTE', 'Ver Estados de Cuenta del Cliente', 26, 1, 27, 'insert_chart_outlined', 'estado-cuenta', 1, 'Estado Ctas Cli'),
(26, 26, NULL, 'INVENTARIOS', 'Inventarios', 1, 0, 32, 'list_alt', 'inventario', 1, ''),
(27, 26, 26, 'ADMINISTRACION_INVENTARIOS', 'Administracion de Inventarios (Articulos)', 2, 1, 3, 'event_note', 'administracion-inventario', 1, 'Admin Inventario'),
(28, 26, 26, 'CONTROL_NUMEROS_SERIE_GARAN', 'Control de numeros de serie y garantias', 4, 1, 5, 'format_list_numbered', 'control-serie-caducidades', 1, 'Control Nº Series'),
(29, 26, 26, 'CONTROL_DE_CADUCIDADES', 'Control de Caducidades (tabla expiracion)', 6, 1, 7, 'date_range', 'control-caducidades', 1, 'Control Caducidades'),
(30, 26, 26, 'ARTICULOS_SUGERIDOS_CLIENTES', 'Articulos sugeridos por Clientes', 8, 1, 9, 'local_library', 'articulos-sugeridos', 0, 'Articulos Sugeridos Cli'),
(31, 26, 26, 'ADMINISTRACION_SERVICIOS', 'Administracion de Servicios', 10, 1, 11, 'departure_board', 'administracion-servicios', 1, 'Admin Servicios'),
(32, 26, 26, 'COMBINAR_ARTICULOS', 'Combinar articulos y formar otro', 12, 1, 13, 'crop_rotate', 'combinar-articulos', 1, 'Combinar Artículos'),
(33, 26, 26, 'ACTUALIZACIÓN_PRECIOS', 'Actualización de precios', 14, 1, 15, 'monetization_on', 'actualizar-precios', 1, 'Actualización Precios'),
(34, 26, 26, 'ASIGNAR_COSTO_SERVICIOS', 'Asignar costo de Servicios a Articulos', 16, 1, 17, 'money', 'costo-servicio-articulo', 0, 'Asignar Costos'),
(35, 26, 26, 'EQUIPOS_PRESTAR_CLIENTES', 'Equipos para prestar a Clientes', 18, 1, 19, 'wc', 'equipos-clientes', 0, 'Equipos Para Prestar'),
(36, 26, 26, 'DEFINIR_DESCUENTOS_PROMOCIONALES', 'Definir descuentos promocionales', 20, 1, 21, 'poll', 'descuentos-promocionales', 1, 'Desc Promocionales'),
(37, 26, 26, 'KARDEX', 'Kardex', 22, 1, 31, 'library_books', 'kardex', 1, 'Kardex'),
(38, 26, 37, 'INICIAR_KARDEX', 'Iniciar nueva Kardex', 23, 2, 24, 'play_circle_outline', 'iniciar', 1, 'Iniciar Kardex'),
(39, 26, 37, 'REVISAR_MOVIMIENTOS_KARDEX_GENERAL', 'Revisar movimientos del Kardex General', 25, 2, 26, 'import_contacts', 'movimientos-general', 1, 'Kardex General'),
(40, 26, 37, 'REVISAR_MOVIMIENTOS_KARDEX_BODEGA', 'Revisar movimientos del Kardex por Bodega', 27, 2, 28, 'store_mall_directory', 'movimientos-bodega', 1, 'Kardex Por Bodega'),
(41, 26, 37, 'REVISAR_MERCADERIA_LINEA_TIEMPO', 'Revisar mercaderia por linea de tiempo', 29, 2, 30, 'trending_up', 'mercaderia-linea-tiempo', 1, 'Mercaderia Linea Tiempo'),
(42, 42, NULL, 'BODEGAS', 'Bodegas', 1, 0, 18, 'apartment', 'bodegas', 1, ''),
(43, 42, 42, 'ADMINISTRACION_BODEGAS', 'Administracion de Bodegas', 2, 1, 3, 'home_work', 'administracion-bodegas', 1, 'Admin Bodegas'),
(44, 42, 42, 'ASIGNAR_UBICACIONES_ARTICULOS', 'Asignar ubicaciones fisicas a Articulos', 4, 1, 5, 'menu_book', 'ubicaciones-fisicas-articulos', 1, 'Ubicaciones Fisicas'),
(45, 42, 42, 'AJUSTES_INVENTARIOS', 'Ajustes de Inventarios', 6, 1, 7, 'ballot', 'ajustes-inventarios', 1, 'Ajustes Inventario'),
(46, 42, 42, 'REGISTRAR_EGRESO_MERCADERIA', 'Registrar egreso de Mercaderia', 8, 1, 9, 'remove_shopping_cart', 'egreso-mercaderia', 1, 'Egreso Mercaderia'),
(47, 42, 42, 'REGISTRAR_INGRESO_MERCADERIA', 'Registrar ingreso de Mercaderia', 10, 1, 11, 'add_shopping_cart', 'ingreso-mercaderia', 1, 'Ingreso Mercaderia'),
(48, 42, 42, 'REGISTRAR_TRASLADO_BODGEAS', 'Registrar traslado de Articulos entre bodegas', 12, 1, 13, 'local_shipping', 'traslado-articulos-bodegas', 1, 'Traslado de Arti/Bodegas'),
(49, 42, 42, 'LIQUIDACION_BODEGAS_MOVILES', 'Liquidacion de bodegas Moviles', 14, 1, 15, 'local_library', 'liquidacion-bodegas', 0, 'Bodegas Móviles'),
(50, 42, 42, 'REQUISICIONES_INTERNAS', 'Requisiciones Internas', 16, 1, 17, 'insert_chart', 'requisiones-internas', 0, 'Requisiones Internas'),
(51, 51, NULL, 'COMPRAS', 'Compras', 1, 0, 12, 'featured_play_list', 'compras', 1, ''),
(52, 51, 51, 'REGISTRAR_COMPRAS', 'Registrar Compras', 2, 1, 3, 'shopping_cart', 'registrar', 1, 'Registrar Compra'),
(53, 51, 51, 'ANULACION_COMPRAS', 'Anulacion/Devolucion de Compras', 4, 1, 5, 'remove_shopping_cart', 'devolucion', 1, 'Anulacion Compra'),
(54, 51, 51, 'REGISTRAR_NOTA_CREDITO_COMPRAS', 'Registrar nota de credito sobre compras', 6, 1, 7, 'assignment', 'nota-credito', 1, 'Reg Nota Cred'),
(55, 51, 51, 'REGISTRAR_PEDIDO_PROVEEDOR', 'Registrar Pedido a Proveedor', 8, 1, 9, 'event_note', 'pedido-proveedor', 1, 'Reg Ped Prov'),
(56, 51, 51, 'NOTA_DEBITO_PROVEEDOR', 'Nota de Debito a Proveedores', 10, 1, 11, 'assignment_ind', 'nota-debito', 1, 'Nota Debito Prov'),
(57, 57, NULL, 'VENTAS', 'Ventas', 1, 0, 26, 'chrome_reader_mode', 'ventas', 1, ''),
(58, 57, 57, 'REGISTRAR_VENTA_FACTURA', 'Registrar Venta con Factura', 2, 1, 3, 'shopping_cart', 'registrar-factura', 1, 'Registrar Factura'),
(59, 57, 57, 'REGISTRO_PROVISIONAL_VENTA', 'Registro provisional de Venta', 4, 1, 5, 'add_shopping_cart', 'provisional-ventas', 1, 'Reg Provicional Venta'),
(60, 57, 57, 'REGISTRAR_ENTREGA_MERCADERIA', 'Registrar entrega de mercaderia', 6, 1, 7, 'local_shipping', 'mercaderia-factura', 1, 'Entrega Mercaderia'),
(61, 57, 57, 'RROCESAR_ENTREGA_FACTURAR', 'Procesar entrega por facturar', 8, 1, 13, 'history', '', 1, 'Entrega Factura'),
(62, 57, 61, 'PROCESAR_ENTREGA_INDIVIDUAL', 'Procesar entregas individualmente', 9, 2, 10, 'hourglass_empty', 'entregas-individual', 1, 'Entrega Individual'),
(63, 57, 61, 'PROCESAR_ENTREGA_COLECTIVAMENTE', 'Procesar entregas colectivamente', 11, 2, 12, 'hourglass_full', 'entregas-colectivas', 0, 'Entrega Colectiva'),
(64, 57, 57, 'REGISTRAR_NOTA_CREDITO', 'Registrar nota de Credito', 14, 1, 15, 'assignment', 'nota-de-credito', 1, 'Nota Crédito'),
(65, 57, 57, 'EMITIR_GUIA_REMISION', 'Emitir guia de remisión', 16, 1, 17, 'assignment_turned_in', 'guia-remision', 1, 'Emitir Guia Remisión'),
(66, 57, 57, 'ANULAR_FACTURA', 'Anular Factura', 18, 1, 21, 'remove_shopping_cart', '', 1, ''),
(67, 57, 66, 'ANULAR_FACTURAS_EMITIDAS', 'Anular Facturas Emitidas', 19, 2, 20, 'signal_cellular_no_sim', 'anular-facturas-emitidas', 1, 'Anular Factu Emitida'),
(68, 57, 57, 'REGISTRAR_DEVOLUCION_MERCADERIA', 'Registrar devolucion de mercaderia', 22, 1, 23, 'transfer_within_a_station', 'devolucion-mercaderia', 1, 'Devolución Mercaderia'),
(69, 57, 57, 'REGISTRO_PEDIDOS_CLIENTES', 'Registro de Pedidos de Clientes', 24, 1, 25, 'ballot', 'pedidos-clientes', 0, 'Pedidos Clientes'),
(70, 70, NULL, 'CONSULTAS', 'Consultas', 1, 0, 34, 'search', 'consultas', 0, ''),
(71, 70, 70, 'REVISAR_PEDIDO', 'Revisar Pedido', 2, 1, 3, 'assignment', 'revisar-pedido', 1, 'Pedido'),
(72, 70, 70, 'REVISAR_COMPRA_REALIZADA', 'Revisar Compra Realizada', 4, 1, 5, 'shopping_cart', 'revisar-compra-realizada', 1, 'Compra Realizada'),
(73, 70, 70, 'REVISAR_FACTURA_EMITIDA', 'Revisar Factura Emitida', 6, 1, 7, 'library_books', 'revisar-factura-emitida', 1, 'Factura Emitida'),
(74, 70, 70, 'REVISAR_MERCADERIA_FACTURAR', 'Revisar entrega de mercaderia por Facturar', 8, 1, 9, 'ballot', 'revisar-mercaderia-factura', 1, 'Mercaderia Por Factura'),
(75, 70, 70, 'REVISAR_PROFORMA_EMITIDA', 'Revisar proforma Emitida', 10, 1, 11, 'format_list_numbered', 'revisar-proforma-emitida', 1, 'Proforma Emitida'),
(76, 70, 70, 'REVISAR_COBROS_CAJA', 'Revisar cobros en caja', 12, 1, 13, 'monetization_on', 'revisar-cobros-caja', 1, 'Cobros Cajas'),
(77, 70, 70, 'CONSULTA_ARTICULOS', 'Consulta de articulos', 14, 1, 15, 'event_available', 'consulta-articulo', 1, 'Consu Artículo'),
(78, 70, 70, 'CONSULTA_ARTICULOS_NUMERO_SERIE', 'Consulta de articulos por numero de serie', 16, 1, 17, 'format_list_bulleted', 'consulta-numero-serie', 0, 'Consu Art Serie'),
(79, 70, 70, 'CONSULTA_SERVICIO_OFRECIDO', 'Consultar Servicio ofrecido', 18, 1, 19, 'wc', 'consultar-servicio', 1, 'Consu Servi Ofrecido'),
(80, 70, 70, 'CONSULTA_PLAN_PAGOS_CLIENTE', 'Consultar Plan de pagos cliente', 20, 1, 21, 'local_atm', 'consultar-plan-pagos-cliente', 1, 'Consu Plan Pagos'),
(81, 70, 70, 'CONSULTA_PROMESA_PAGO', 'Consultar Promesa de Pago', 22, 1, 23, 'account_box', 'consultar-promesa-pago', 1, 'Consu Prome Pago'),
(82, 70, 70, 'CONSULTA_PLAN_PAGOS_PROVEEDORES', 'Consultar Plan de Pagos a Proveedores', 24, 1, 25, 'money', 'consultar-plan-pagos-proveedores', 1, 'Consu Plan Pago Prov'),
(83, 70, 70, 'CONSULTA_RETENCION_REALIZADA', 'Consultar retencion realizada', 26, 1, 27, 'contact_mail', 'consultar-retencion', 1, 'Consu Reten Realiz'),
(84, 70, 70, 'REVISAR_ASISTENCIA_EMPLEADO', 'Revisar asistencia y horarios de empleados', 28, 1, 29, 'alarm', 'revisar-asistencia-horaria', 0, 'Asist Empleados'),
(85, 70, 70, 'CONSULTAR_NOTA_CREDITO_PROVEEDORES', 'Consultar nota de credito de Proveedores', 30, 1, 31, 'description', 'consultar-credito-proveedor', 1, 'Consu Cred Prov'),
(86, 70, 70, 'CONSULTAR_NOTA_DEBITO_PROVEEDORES', 'Consultar nota de debito de Proveedores', 32, 1, 33, 'insert_drive_file', 'consultar-debito-proveedor', 1, 'Consu Debi Prov'),
(87, 87, NULL, 'REPORTES', 'Reportes', 1, 0, 28, 'picture_as_pdf', 'reportes', 1, ''),
(88, 87, 87, 'REPORTES_MERCADERIA', 'Mecaderia (Stock/Inventarios)', 2, 1, 3, 'vertical_split', 'mercaderia', 1, 'Repor Mercaderia'),
(89, 87, 87, 'REPORTES_BODEGAS', 'Bodegas (movimientos)', 4, 1, 5, 'home_work', 'bodegas', 1, 'Repor Bodegas'),
(90, 87, 87, 'REPORTES_CLIENTES', 'Clientes', 6, 1, 7, 'accessibility_new', 'clientes', 1, 'Repor Clientes'),
(91, 87, 87, 'REPORTES_PROVEEDORES', 'Proveedores', 8, 1, 9, 'wc', 'proveedores', 1, 'Repor Proveedores'),
(92, 87, 87, 'REPORTES_LISTADO_EMPLEADOS', 'Listado general de Empleados', 10, 1, 11, 'accessibility', 'empleados', 1, 'Repor Empleados'),
(93, 87, 87, 'REPORTES_VENTAS', 'Reporte de Ventas', 12, 1, 13, 'shopping_cart', 'ventas', 1, 'Repor Ventas'),
(94, 87, 87, 'REPORTES_COMPRAS', 'Reporte de Compras', 14, 1, 15, 'add_shopping_cart', 'compras', 1, 'Repor Compras'),
(95, 87, 87, 'REPORTES_RETENCIONES', 'Reporte de Retenciones', 16, 1, 17, 'chrome_reader_mode', 'retencion', 1, 'Repor Retenciones'),
(96, 87, 87, 'REPORTES_NOMINAS', 'Reportes de Nomina', 18, 1, 19, 'description', 'nomina', 1, 'Repor Nóminas'),
(97, 87, 87, 'REPORTES_CAJAS', 'Reportes de Caja/Bancos', 20, 1, 21, 'money', 'caja-bancos', 1, 'Repor Caja/Bancos'),
(98, 87, 87, 'REPORTES_ACTIVIDADES_SISTEMA', 'Reporte de actividades en el Sistema', 22, 1, 23, 'desktop_windows', 'actividad-sistema', 1, 'Repor Act. Sistema'),
(99, 87, 87, 'REPORTES_GRAFICAS_ESTADISTICAS', 'Graficas Estadisticas', 24, 1, 25, 'poll', 'graficas-estadisticas', 1, 'Repor Gráficas'),
(100, 87, 87, 'REPORTES_COMPROBANTES_ELECTRONICOS', 'Comprobantes Electronicos', 26, 1, 27, 'cloud_done', 'comprobante-electronico', 1, 'Compr Electronico'),
(101, 101, NULL, 'CONTABILIDAD', 'Contabilidad', 1, 0, 76, 'account_balance', 'contabilidad', 1, ''),
(102, 101, 101, 'CONTABILIDAD_CAJA', 'Caja', 2, 1, 15, 'local_atm', 'caja', 1, 'Caja'),
(103, 101, 102, 'CONTABILIDAD_APERTURA_CAJA', 'Apertura de Caja', 3, 2, 4, 'queue_play_next', 'apertura-caja', 1, 'Apertura Caja'),
(104, 101, 102, 'CONTABILIDAD_CIERRE_CAJA', 'Cierre de Caja', 5, 2, 6, 'cancel_presentation', 'cierre-caja', 1, 'Cierre Caja'),
(105, 101, 102, 'CONTABILIDAD_REGISTRAR_DEPOSITO', 'Registrar deposito en caja', 7, 2, 8, 'attach_money', 'registrar-deposito', 1, 'Reg Deposito'),
(106, 101, 102, 'CONTABILIDAD_REGISTRAR_RETIRO', 'Registrar retiro de caja', 9, 2, 10, 'money_off', 'retiro-efectivo-caja', 1, 'Reg Retir Caja'),
(107, 101, 102, 'CONTABILIDAD_LISTA_CHEQUES', 'Lista de cheques por cobrar', 11, 2, 12, 'list', 'cheques-por-cobrar', 1, 'Cheques Por Cobrar'),
(108, 101, 102, 'CONTABILIDAD_RESUMEN_GENERAL', 'Resumen general de caja', 13, 2, 14, 'assignment', 'resumen-de-caja', 1, 'Resumen de Caja'),
(109, 101, 101, 'CONTABILIDAD_BANCOS', 'Bancos', 16, 1, 35, 'account_balance', 'bancos', 1, ''),
(110, 101, 109, 'CONTABILIDAD_ADMINISTRAR_CUENTAS', 'Administrar Cuentas Bancarias', 17, 2, 22, 'account_circle', 'cuentas-bancarias', 1, 'Admin cuen banc'),
(111, 101, 110, 'CONTABILIDAD_CUENTAS_PROPIAS', 'Cuentas propias de la empresa', 18, 3, 19, 'featured_play_list', 'empresas', 1, 'Ctas Propias Empresa'),
(112, 101, 110, 'CONTABILIDAD_OTROS_BANCOS', 'Otros bancos y cooperativas', 20, 3, 21, 'featured_video', 'cooperativas', 1, 'Otros Bancos'),
(113, 101, 109, 'CONTABILIDAD_REGISTRAR_DEPOSITOS', 'Registrar Depositos o Ingresos', 23, 2, 24, 'local_atm', 'registrar-ingresos', 1, 'Regis Ingresos'),
(114, 101, 109, 'CONTABILIDAD_REGISTRAR_EGRESOS', 'Registrar Retiros o Egresos', 25, 2, 26, 'money_off', 'registrar-egresos', 1, 'Regis Egresos'),
(115, 101, 109, 'CONTABILIDAD_CHEQUES_POSTFECHADOS', 'Lista de Cheques PostFechados', 27, 2, 28, 'today', 'cheques-posfechados', 1, 'Cheques PostFechados'),
(116, 101, 109, 'CONTABILIDAD_CHEQUES_GIRADOS', 'Lista de Cheques Girados', 29, 2, 30, 'repeat', 'cheques-girados', 1, 'Cheques Girados'),
(117, 101, 109, 'CONTABILIDAD_CONCILIACION_BANCARIA', 'Conciliacion Bancaria', 31, 2, 32, 'assignment_ind', 'conciliacion-bancaria', 1, 'Conciliación Bancaria'),
(118, 101, 109, 'CONTABILIDAD_COBROS_TARJETA', 'Acreditar cobros con tarjeta', 33, 2, 34, 'credit_card', 'acreditar-cobro-tarjeta', 1, 'Acreditar Cobros con Tarjetas'),
(119, 101, 101, 'CONTABILIDAD_CONFIGURACIONES', 'Configuraciones', 36, 1, 51, 'build', 'configuraciones', 1, ''),
(120, 101, 119, 'CONTABILIDAD_PERIODOS_CONTABLES', 'Periodos contables', 37, 2, 38, 'alarm_on', 'periodos-contables', 1, ''),
(121, 101, 119, 'CONTABILIDAD_PLAN_CUENTAS', 'Plan de Cuentas', 39, 2, 40, 'menu_book', 'plan-de-cuentas', 1, 'Plan de Cuentas'),
(122, 101, 119, 'CONTABILIDAD_CUENTAS_EJERCICIOS', 'Cuentas usar en Ejercicios', 41, 2, 46, 'library_books', '', 1, ''),
(123, 101, 122, 'CONTABILIDAD_CONFIGURACION_GENERAL', 'Configuración General', 42, 3, 43, 'perm_data_setting', 'configuracion-general', 1, 'Conf. General'),
(124, 101, 122, 'CONTABILIDAD_AUTOMATIZACION_ASIENTOS', 'Automatización de Asientos', 44, 3, 45, 'spellcheck', 'automatizacion-asientos', 1, 'Automa Asientos'),
(125, 101, 119, 'CONTABILIDAD_REASIGNAR_CUENTAS_AUXILIARES', 'Reasignar Cuentas Auxiliares', 47, 2, 48, 'sync_alt', 'reasignar-cuentas-auxiliares', 1, 'Reasignar Ctas Aux'),
(126, 101, 119, 'CONTABILIDAD_CENTROS_COSTO', 'Centros de costo', 49, 2, 50, 'monetization_on', 'centros-de-costo', 1, 'Centros de Costo'),
(127, 101, 101, 'CONTABILIDAD_JORNALIZACION', 'Jornalizacion', 52, 1, 57, 'assignment_turned_in', 'jornalizacion', 1, ''),
(128, 101, 127, 'CONTABILIDAD_REGISTAR_ASIENTOS', 'Registrar Asientos', 53, 2, 54, 'assignment', 'registrar-asientos', 1, 'Regis Asientos'),
(129, 101, 127, 'CONTABILIDAD_COMPARACION_CONTABLE', 'Comparacion Contable', 55, 2, 56, 'cached', 'comparacion-contable', 1, 'Comparación Contable'),
(130, 101, 101, 'CONTABILIDAD_LIBRO_DIARIO', 'Libro Diario', 58, 1, 59, 'library_books', 'libro-diario', 1, 'Libro Diario'),
(131, 101, 101, 'CONTABILIDAD_MAYORIZACION', 'Mayorizacion', 60, 1, 61, 'import_contacts', 'mayorizacion', 1, 'Mayorización'),
(132, 101, 101, 'CONTABILIDAD_BALANCES', 'Balances', 62, 1, 65, 'collections_bookmark', 'balances', 1, 'Balances'),
(133, 101, 132, 'CONTABILIDAD_SUMAS_SALDOS', 'Sumas y Saldos', 63, 2, 64, 'exposure', 'sumas-saldos', 1, 'Sumas Y Saldos'),
(134, 101, 101, 'CONTABILIDAD_ESTADOS_FINANCIEROS', 'Estados Financieros', 66, 1, 73, 'poll', 'estado-financiero', 1, 'Estados Financieros'),
(135, 101, 134, 'CONTABILIDAD_ESTADOS_SITUACION_INICIAL', 'Estados de situacion inicial', 67, 2, 68, 'chrome_reader_mode', 'situacion-inicial', 1, 'Situacion inicial'),
(136, 101, 134, 'CONTABILIDAD_ESTADOS_RESULTADOS', 'Estados de resultados', 69, 2, 70, 'assessment', 'resultados', 1, 'Estados Resultados'),
(137, 101, 134, 'CONTABILIDAD_ESTADOS_FINAL', 'Estados de situacion final (Balance)', 71, 2, 72, 'assignment_turned_in', 'situacion-final', 1, 'Situacion Final'),
(138, 101, 101, 'CONTABILIDAD_COMPROBANTES', 'Comprobantes', 74, 1, 75, 'description', 'comprobantes', 1, 'Comprobantes'),
(139, 139, NULL, 'RETENCIONES', 'Retenciones', 1, 0, 20, 'account_balance_wallet', 'retenciones', 1, ''),
(140, 139, 139, 'RETENCIONES_COMPRAS', 'Registrar retenciones en Compras', 2, 1, 3, 'post_add', 'retenciones-compras', 1, 'Reg Ret Compras'),
(141, 139, 139, 'RETENCIONES_VENTAS', 'Registrar retenciones en ventas', 4, 1, 5, 'note_add', 'retenciones-ventas', 1, 'Reg Ret Ventas'),
(142, 139, 139, 'RETENCIONES_DECLARACIONES_SRI', 'Declaraciones para el SRI', 6, 1, 9, 'folder_shared', '', 1, ''),
(143, 139, 142, 'RETENCIONES_ANEXOS_TRANSACCIONALES', 'Generar Anexos Transaccionales', 7, 2, 8, 'insert_drive_file', 'anexos-transaccionales', 1, 'Anexos Transacc'),
(144, 139, 139, 'RETENCIONES_CONFIGURACIONES_RETENCIONES', 'Configuraciones Para Retenciones', 10, 1, 15, 'build', '', 1, ''),
(145, 139, 144, 'RETENCIONES_CODIGOS_RETENCIONES', 'Codigos de Retenciones', 11, 2, 12, 'filter_9_plus', 'codigos-retencion', 1, 'Cod Retenciones'),
(146, 139, 144, 'RETENCIONES_SUSTENTOS_TRIBUTARIOS', 'Sustentos Tributarios', 13, 2, 14, 'storage', 'sustento-tributario', 1, 'Sustento Tributario'),
(147, 139, 139, 'RETENCIONES_ANULAR_RETENCIONES_COMPRA', 'Anular retenciones en Compra', 16, 1, 17, 'cancel', 'anular-retenciones-compras', 1, 'Anular Reten Compra'),
(148, 139, 139, 'RETENCIONES_ANULAR_RETENCIONES_VENTA', 'Anular retenciones en Ventas', 18, 1, 19, 'cancel', 'anular-retenciones-ventas', 1, 'Anular Reten Ventas'),
(149, 149, NULL, 'EMPLEADOS', 'Empleados', 1, 0, 12, 'supervisor_account', 'empleados', 1, 'Empleados'),
(150, 149, 149, 'ADMINISTRACION_EMPLEADOS', 'Administración de Empleados', 2, 1, 3, 'group', 'administracion-empleados', 1, 'Admin Empleados'),
(151, 149, 149, 'CONFIGURACION_EMPLEADOS', 'Configuración de Empleados', 4, 1, 11, 'settings_applications', 'configurar', 1, 'Config Empleados'),
(152, 149, 151, 'CONFIGURACIONES_PARAMETROS_PAGOS', 'Configuración Y parametros de pagos', 5, 2, 6, 'attach_money', 'configuraciones-parametros', 1, 'Cofig. pagos'),
(153, 149, 151, 'COMPONENTES_ROL_PAGOS', 'Componentes de rol de pagos', 5, 2, 6, 'chrome_reader_mode', 'componente-rol-pagos', 1, 'Comp. rol pagos'),
(154, 149, 151, 'ASIGNAR_COMPONENTES_ROL_MESES', 'Asignar componentes de rol a meses', 5, 2, 6, 'assignment', 'componente-rol-mes', 1, 'Asignar comp. rol'),
(155, 149, 151, 'HORARIO_GENERAL', 'Horario General', 5, 2, 6, 'calendar_today', 'horario-general', 1, 'Horario general'),
(156, 149, 151, 'ASIGNAR_HORARIOS_EMPLEADOS', 'Asignar horarios a empleados', 5, 2, 6, 'perm_contact_calendar', 'horario-empleados', 1, 'Asig. horario empleado'),
(157, 149, 151, 'DESCUENTOS_FALTAS_ATRASOS', 'Descuento por faltas y atrasos', 5, 2, 6, 'money_off', 'descuentos-faltas', 1, 'Des. faltas-atrasos'),
(158, 149, 149, 'PAGOS_EMPLEADOS', 'pagos a Empleados', 4, 1, 11, 'attach_money', 'pagos', 1, 'Pago Empleados'),
(159, 149, 158, 'REGISTRAR_COMISIONES', 'Registrar comisiones', 5, 2, 6, 'ballot', 'registrar-comisiones', 1, 'Regist. comisiones'),
(160, 149, 158, 'REGISTRAR_BONOS', 'Registrar bonos', 5, 2, 6, 'emoji_emotions', 'registrar-bonos', 1, 'Regist. bonos'),
(161, 149, 158, 'REGISTRAR_OTROS_PAGOS', 'Registrar otros pagos', 5, 2, 6, 'event_note', 'otros-pagos', 1, 'Reg. otros pagos'),
(162, 149, 158, 'REGISTRAR_ANTICIPOS', 'Registrar anticipos', 5, 2, 6, 'attach_money', 'registrar-anticipos', 1, 'Regist. anticipos'),
(163, 149, 158, 'MULTAS_DESCUENTOS', 'Multas y descuentos', 5, 2, 6, 'sentiment_very_dissatisfied', 'multas-descuentos', 1, 'Multas-descuentos'),
(164, 149, 158, 'GENERAR_ROL_PAGOS', 'Generar rol de pagos', 5, 2, 6, 'assignment', 'generar-rol-pagos', 1, 'Generar rol pag.'),
(165, 149, 158, 'ANULAR_ROL_PAGOS', 'Anular rol de pagos', 5, 2, 6, 'backspace', 'anular-rol-pagos', 1, 'Anular rol pag.'),
(166, 149, 149, 'PERMISOS_EMPLEADOS', 'permisos de Empleados', 4, 1, 11, 'how_to_reg', 'permisos', 1, 'Permisos Empleados'),
(167, 149, 166, 'ASIGNAR_VACACIONES', 'Asignar vacaciones', 5, 2, 6, 'airplanemode_active', 'asignar-vacaciones', 1, 'Asig. vacaciones'),
(168, 149, 166, 'CONCEDER_PERMISOS', 'Conceder permisos', 5, 2, 6, 'face', 'conceder-permisos', 1, 'Conceder Perm.'),
(169, 149, 166, 'JUSTIFICAR_FALTA', 'Justificar falta', 5, 2, 6, 'library_add_check', 'justificar-falta', 1, 'Justificar Falta'),
(170, 149, 166, 'JUSTIFICAR_ATRASO', 'Justificar atraso', 5, 2, 6, 'check_circle_outline', 'justificar-atraso', 1, 'Justificar atraso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_permisos`
--

DROP TABLE IF EXISTS `menu_permisos`;
CREATE TABLE IF NOT EXISTS `menu_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `permisos_id` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_20154E75CCD7E912` (`menu_id`),
  KEY `IDX_20154E755FA0F787` (`permisos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_permisos`
--

INSERT INTO `menu_permisos` (`id`, `menu_id`, `permisos_id`, `activo`) VALUES
(7, 7, 1, 1),
(8, 8, 1, 1),
(9, 9, 1, 1),
(10, 10, 1, 1),
(11, 11, 1, 1),
(12, 12, 1, 1),
(13, 13, 1, 1),
(14, 14, 1, 1),
(15, 15, 1, 1),
(16, 16, 1, 1),
(17, 17, 1, 1),
(18, 18, 1, 1),
(19, 19, 1, 1),
(20, 20, 1, 1),
(21, 21, 1, 1),
(22, 22, 1, 1),
(23, 23, 1, 1),
(24, 24, 1, 1),
(25, 25, 1, 1),
(26, 26, 1, 1),
(27, 27, 1, 1),
(28, 28, 1, 1),
(29, 29, 1, 1),
(30, 30, 1, 1),
(31, 31, 1, 1),
(32, 32, 1, 1),
(33, 33, 1, 1),
(34, 34, 1, 1),
(35, 35, 1, 1),
(36, 36, 1, 1),
(37, 37, 1, 1),
(38, 38, 1, 1),
(39, 39, 1, 1),
(40, 40, 1, 1),
(41, 41, 1, 1),
(42, 42, 1, 1),
(43, 43, 1, 1),
(44, 44, 1, 1),
(45, 45, 1, 1),
(46, 46, 1, 1),
(47, 47, 1, 1),
(48, 48, 1, 1),
(49, 49, 1, 1),
(50, 50, 1, 1),
(51, 51, 1, 1),
(52, 52, 1, 1),
(53, 53, 1, 1),
(54, 54, 1, 1),
(55, 55, 1, 1),
(56, 56, 1, 1),
(57, 57, 1, 1),
(58, 58, 1, 1),
(59, 59, 1, 1),
(60, 60, 1, 1),
(61, 61, 1, 1),
(62, 62, 1, 1),
(63, 63, 1, 1),
(64, 64, 1, 1),
(65, 65, 1, 1),
(66, 66, 1, 1),
(67, 67, 1, 1),
(68, 68, 1, 1),
(69, 69, 1, 1),
(70, 70, 1, 1),
(71, 71, 1, 1),
(72, 72, 1, 1),
(73, 73, 1, 1),
(74, 74, 1, 1),
(75, 75, 1, 1),
(76, 76, 1, 1),
(77, 77, 1, 1),
(78, 78, 1, 1),
(79, 79, 1, 1),
(80, 80, 1, 1),
(81, 81, 1, 1),
(82, 82, 1, 1),
(83, 83, 1, 1),
(84, 84, 1, 1),
(85, 85, 1, 1),
(86, 86, 1, 1),
(87, 87, 1, 1),
(88, 88, 1, 1),
(89, 89, 1, 1),
(90, 90, 1, 1),
(91, 91, 1, 1),
(92, 92, 1, 1),
(93, 93, 1, 1),
(94, 94, 1, 1),
(95, 95, 1, 1),
(96, 96, 1, 1),
(97, 97, 1, 1),
(98, 98, 1, 1),
(99, 99, 1, 1),
(100, 100, 1, 1),
(101, 101, 1, 1),
(102, 102, 1, 1),
(103, 103, 1, 1),
(104, 104, 1, 1),
(105, 105, 1, 1),
(106, 106, 1, 1),
(107, 107, 1, 1),
(108, 108, 1, 1),
(109, 109, 1, 1),
(110, 110, 1, 1),
(111, 111, 1, 1),
(112, 112, 1, 1),
(113, 113, 1, 1),
(114, 114, 1, 1),
(115, 115, 1, 1),
(116, 116, 1, 1),
(117, 117, 1, 1),
(118, 118, 1, 1),
(119, 119, 1, 1),
(120, 120, 1, 1),
(121, 121, 1, 1),
(122, 122, 1, 1),
(123, 123, 1, 1),
(124, 124, 1, 1),
(125, 125, 1, 1),
(126, 126, 1, 1),
(127, 127, 1, 1),
(128, 128, 1, 1),
(129, 129, 1, 1),
(130, 130, 1, 1),
(131, 131, 1, 1),
(132, 132, 1, 1),
(133, 133, 1, 1),
(134, 134, 1, 1),
(135, 135, 1, 1),
(136, 136, 1, 1),
(137, 137, 1, 1),
(138, 138, 1, 1),
(139, 139, 1, 1),
(140, 140, 1, 1),
(141, 141, 1, 1),
(142, 142, 1, 1),
(143, 143, 1, 1),
(144, 144, 1, 1),
(145, 145, 1, 1),
(146, 146, 1, 1),
(147, 147, 1, 1),
(148, 148, 1, 1),
(149, 1, 3, 1),
(150, 2, 3, 1),
(151, 3, 3, 1),
(152, 4, 3, 1),
(153, 5, 3, 1),
(154, 6, 3, 1),
(155, 7, 3, 1),
(156, 12, 3, 1),
(157, 13, 3, 1),
(158, 26, 3, 1),
(159, 27, 3, 1),
(160, 6, 1, 1),
(161, 1, 1, 1),
(162, 2, 1, 1),
(163, 3, 1, 1),
(164, 5, 1, 1),
(165, 4, 1, 1),
(166, 8, 3, 1),
(167, 9, 3, 1),
(168, 10, 3, 1),
(169, 11, 3, 1),
(170, 14, 3, 1),
(171, 15, 3, 1),
(172, 16, 3, 1),
(173, 17, 3, 1),
(174, 18, 3, 1),
(175, 19, 3, 1),
(176, 20, 3, 1),
(177, 21, 3, 1),
(178, 22, 3, 1),
(179, 23, 3, 1),
(180, 24, 3, 1),
(181, 25, 3, 1),
(182, 28, 3, 1),
(183, 29, 3, 1),
(184, 30, 3, 1),
(185, 31, 3, 1),
(186, 32, 3, 1),
(187, 33, 3, 1),
(188, 34, 3, 1),
(189, 35, 3, 1),
(190, 36, 3, 1),
(191, 37, 3, 1),
(192, 38, 3, 1),
(193, 39, 3, 1),
(194, 40, 3, 1),
(195, 41, 3, 1),
(196, 42, 3, 1),
(197, 43, 3, 1),
(198, 44, 3, 1),
(199, 45, 3, 1),
(200, 46, 3, 1),
(201, 47, 3, 1),
(202, 48, 3, 1),
(203, 49, 3, 1),
(204, 50, 3, 1),
(205, 51, 3, 1),
(206, 52, 3, 1),
(207, 53, 3, 1),
(208, 54, 3, 1),
(209, 55, 3, 1),
(210, 56, 3, 1),
(211, 57, 3, 1),
(212, 58, 3, 1),
(213, 59, 3, 1),
(214, 60, 3, 1),
(215, 61, 3, 1),
(216, 62, 3, 1),
(217, 63, 3, 1),
(218, 64, 3, 1),
(219, 65, 3, 1),
(220, 66, 3, 1),
(221, 67, 3, 1),
(222, 68, 3, 1),
(223, 69, 3, 1),
(224, 70, 3, 1),
(225, 71, 3, 1),
(226, 72, 3, 1),
(227, 73, 3, 1),
(228, 74, 3, 1),
(229, 75, 3, 1),
(230, 76, 3, 1),
(231, 77, 3, 1),
(232, 78, 3, 1),
(233, 79, 3, 1),
(234, 80, 3, 1),
(235, 81, 3, 1),
(236, 82, 3, 1),
(237, 83, 3, 1),
(238, 84, 3, 1),
(239, 85, 3, 1),
(240, 86, 3, 1),
(241, 87, 3, 1),
(242, 88, 3, 1),
(243, 89, 3, 1),
(244, 90, 3, 1),
(245, 91, 3, 1),
(246, 92, 3, 1),
(247, 93, 3, 1),
(248, 94, 3, 1),
(249, 95, 3, 1),
(250, 96, 3, 1),
(251, 97, 3, 1),
(252, 98, 3, 1),
(253, 100, 3, 1),
(254, 99, 3, 1),
(255, 101, 3, 1),
(256, 102, 3, 1),
(257, 103, 3, 1),
(258, 104, 3, 1),
(259, 105, 3, 1),
(260, 106, 3, 1),
(261, 107, 3, 1),
(262, 108, 3, 1),
(263, 109, 3, 1),
(264, 110, 3, 1),
(265, 111, 3, 1),
(266, 112, 3, 1),
(267, 113, 3, 1),
(268, 114, 3, 1),
(269, 115, 3, 1),
(270, 115, 3, 1),
(271, 116, 3, 1),
(272, 117, 3, 1),
(273, 118, 3, 1),
(274, 119, 3, 1),
(275, 120, 3, 1),
(276, 121, 3, 1),
(277, 122, 3, 1),
(278, 123, 3, 1),
(279, 124, 3, 1),
(280, 125, 3, 1),
(281, 126, 3, 1),
(282, 127, 3, 1),
(283, 128, 3, 1),
(284, 129, 3, 1),
(285, 130, 3, 1),
(286, 131, 3, 1),
(287, 132, 3, 1),
(288, 133, 3, 1),
(289, 134, 3, 1),
(290, 135, 3, 1),
(291, 136, 3, 1),
(292, 137, 3, 1),
(293, 138, 3, 1),
(294, 139, 3, 1),
(295, 140, 3, 1),
(296, 141, 3, 1),
(297, 142, 3, 1),
(298, 143, 3, 1),
(299, 144, 3, 1),
(300, 145, 3, 1),
(301, 146, 3, 1),
(302, 147, 3, 1),
(303, 148, 3, 1),
(304, 149, 3, 1),
(305, 150, 3, 1),
(306, 151, 3, 1),
(307, 152, 3, 1),
(308, 153, 3, 1),
(309, 154, 3, 1),
(310, 155, 3, 1),
(311, 156, 3, 1),
(312, 157, 3, 1),
(313, 158, 3, 1),
(314, 159, 3, 1),
(315, 156, 3, 1),
(316, 160, 3, 1),
(317, 161, 3, 1),
(318, 162, 3, 1),
(319, 163, 3, 1),
(320, 164, 3, 1),
(321, 165, 3, 1),
(322, 166, 3, 1),
(323, 167, 3, 1),
(324, 168, 3, 1),
(325, 169, 3, 1),
(326, 170, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_caja`
--

DROP TABLE IF EXISTS `movimientos_caja`;
CREATE TABLE IF NOT EXISTS `movimientos_caja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) NOT NULL,
  `historial` bigint(20) DEFAULT NULL,
  `tipo` smallint(6) DEFAULT NULL,
  `fecha` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `hora` time NOT NULL COMMENT '(DC2Type:carbontime)',
  `pago` tinyint(1) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `operacion` smallint(6) DEFAULT NULL,
  `origen` smallint(6) DEFAULT NULL,
  `valor_ingreso` decimal(10,2) DEFAULT NULL,
  `valor_egreso` decimal(10,2) DEFAULT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `listas_id` int(11) DEFAULT NULL,
  `caja` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C8F6D5E367B3B43D` (`users_id`),
  KEY `IDX_C8F6D5E39A111542` (`listas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientos_caja`
--

INSERT INTO `movimientos_caja` (`id`, `users_id`, `historial`, `tipo`, `fecha`, `hora`, `pago`, `numero`, `operacion`, `origen`, `valor_ingreso`, `valor_egreso`, `observacion`, `deleted_at`, `listas_id`, `caja`) VALUES
(1, 1, 1, 0, '2019-08-07', '16:32:26', NULL, NULL, 0, NULL, '1000.00', NULL, 'Mes de Agosto', NULL, NULL, 1),
(6, 1, 1, 1, '2019-08-08', '18:38:11', 1, 2, 2, 11, NULL, '257.33', NULL, NULL, NULL, 1),
(7, 1, 1, 1, '2019-08-13', '00:04:09', 1, 369, 2, 11, NULL, '89.06', 'Pago al proveedor', NULL, NULL, 1),
(8, 1, 1, 1, '2019-08-13', '23:21:04', 1, NULL, 2, 11, NULL, '100.00', 'Anticipo al proveedor: NICOLAS  ALEJANDRO CARDENAS MOROCHO', NULL, NULL, 1),
(10, 1, 1, 1, '2019-08-14', '17:41:55', 1, NULL, 2, 11, NULL, '50.00', 'Anticipo al proveedor: NICOLAS  ALEJANDRO CARDENAS MOROCHO', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_caja_bancos`
--

DROP TABLE IF EXISTS `movimiento_caja_bancos`;
CREATE TABLE IF NOT EXISTS `movimiento_caja_bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) DEFAULT NULL,
  `historial` smallint(6) DEFAULT NULL,
  `numero` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `hora` time DEFAULT NULL COMMENT '(DC2Type:carbontime)',
  `operacion` smallint(6) DEFAULT NULL,
  `motivo` smallint(6) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1B04273567B3B43D` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimiento_caja_bancos`
--

INSERT INTO `movimiento_caja_bancos` (`id`, `users_id`, `historial`, `numero`, `fecha`, `hora`, `operacion`, `motivo`, `cantidad`, `saldo`, `observacion`, `tipo`) VALUES
(1, 1, 1, '1', '2019-11-12', '17:16:38', 0, NULL, '1000.00', '1000.00', 'Apertura de caja noviembre 2019', 0),
(2, 1, NULL, '3214569877', '2019-11-12', '22:30:37', 2, 0, '44.80', '-34.80', 'Compra con FACTURA N° 001-001-54 a MARTHA  MOROCHO', 1),
(3, 1, NULL, '1236547899', '2019-11-12', '22:35:09', 2, 0, '22.40', '977.60', 'Compra con FACTURA N° 001-001-259 a NICOLAS  ALEJANDRO CARDENAS MOROCHO', 1),
(4, 1, NULL, '1236547899', '2019-11-12', '22:36:09', 2, 0, '10.00', '967.60', 'Compra con FACTURA N° 001-001-654 a MARTHA  MOROCHO', 1),
(11, 1, NULL, '1236547899', '2019-11-12', '23:36:57', 2, 0, '16.80', '950.80', 'Compra con FACTURA N° 001-001-543 a MARTHA  MOROCHO', 2),
(12, 1, 1, NULL, '2019-11-13', '22:02:49', 2, 0, '22.40', '977.60', 'Compra con FACTURA N° 001-002-5432 a MARTHA  MOROCHO', 0),
(13, 1, 1, '1', '2019-11-15', '21:47:28', 2, 6, NULL, '977.60', 'Pago al proveedor: santiago alfredo rivera', 0),
(14, 1, NULL, '1236547899', '2019-11-15', '22:02:17', 2, 6, '29.87', '920.93', 'Pago al proveedor: MARTHA  MOROCHO', 1),
(15, 1, 1, '1', '2019-11-15', '22:40:27', 2, 6, '29.87', '947.73', 'Pago al proveedor: MARTHA  MOROCHO', 0),
(16, 1, NULL, '1236547899', '2019-11-15', '23:01:03', 2, 5, '29.87', '950.80', 'Anulación de pago al proveedor: MARTHA  MOROCHO', 1),
(17, 1, NULL, '1236547899', '2019-11-19', '17:02:59', 2, 7, '50.00', '1000.80', 'NICOLAS  ALEJANDRO CARDENAS MOROCHO', NULL),
(18, 1, 1, '1', '2019-11-19', '17:41:53', 2, 0, '22.40', '925.33', 'Compra con FACTURA N° 001-002-743 a MARTHA  MOROCHO', 0),
(19, 1, NULL, '1236547899', '2019-11-19', '17:48:07', 2, 7, '100.00', '900.80', 'SAUL MOROCHO SA', NULL),
(20, 1, 1, '1', '2019-11-19', '19:58:10', 2, 6, '29.87', '895.46', 'Pago al proveedor: MARTHA  MOROCHO', 0),
(21, 1, 1, NULL, '2019-11-20', '17:44:16', 1, 6, '13.05', '882.41', 'Pago del cliente: KEVIN PATRICIO YANZA RIVERA', 0),
(22, 1, 1, NULL, '2019-11-20', '17:52:08', 1, 6, '12.04', '894.45', 'Pago del cliente: KEVIN PATRICIO YANZA RIVERA', 0),
(23, 1, 1, '1', '2019-11-20', '19:35:21', 2, 6, '13.05', '881.40', 'Anulación de pago del cliente KEVIN PATRICIO YANZA RIVERA de la o las Facturas afectadas: 001-004-2, ', 0),
(24, 1, NULL, '3214569877', '2019-11-20', '19:45:25', 1, 6, '13.05', '47.85', 'Pago del cliente: KEVIN PATRICIO YANZA RIVERA', 1),
(25, 1, 1, '1', '2019-11-20', '20:24:18', 2, 7, '100.00', '881.40', '', 0),
(26, 1, 1, '1', '2019-11-20', '20:24:52', 2, 7, '100.00', '881.40', 'MARTHA  MOROCHO', 0),
(27, 1, 1, '1', '2019-11-20', '20:29:06', 2, 7, '50.00', '881.40', 'Anticipo al proveedor:  NICOLAS  ALEJANDRO CARDENAS MOROCHO', 0),
(28, 1, 1, '1', '2019-11-20', '20:31:29', 2, 7, '50.00', '831.40', 'Anticipo al proveedor:  MARTHA  MOROCHO', 0),
(29, 1, 1, '1', '2019-11-20', '20:32:00', 1, 7, '50.00', '881.40', 'Anticipo del cliente:  ', 0),
(30, 1, NULL, '1236547899', '2019-11-20', '21:09:46', 2, 4, '50.00', '850.80', 'Anulación de anticipo del cliente: KEVIN PATRICIO YANZA RIVERA', NULL),
(31, 1, NULL, '3214569877', '2019-11-20', '21:29:48', 1, 7, '50.00', '97.85', 'Anticipo del cliente:  ', 1),
(32, 1, 1, '1', '2019-11-20', '21:33:28', 1, 7, '50.00', '931.40', 'Anticipo del cliente:  ', 0),
(33, 1, 1, '1', '2019-11-20', '21:36:16', 2, 4, '50.00', '881.40', 'Anulación de anticipo del cliente: Jorge Cuara Vasquez', 0),
(34, 1, 1, '1', '2019-11-22', '20:45:26', 3, NULL, '894.45', '894.45', 'Cierre de Caja', 0),
(35, 1, NULL, '3214569877', '2019-11-22', '20:45:26', 1, 3, '881.40', '979.25', 'Cierre de Caja', 1),
(36, 1, NULL, '3214569877', '2019-11-22', '20:45:26', 1, 3, '13.05', '992.30', 'Cierre de Caja', 1),
(39, 1, 1, NULL, '2019-12-11', '15:47:52', 1, 1, '30.00', '851.40', 'Venta con factura 001-004-6', 0),
(40, 1, 1, NULL, '2019-12-17', '21:02:23', 1, 1, '29.70', '821.70', 'Venta con factura 001-004-8', 0),
(41, 1, 2, '1', '2020-03-05', '20:02:41', 0, NULL, '300.00', '300.00', 'Apertura Marzo 5 del 2020', 0),
(42, 1, 2, NULL, '2020-03-13', '20:32:33', 1, 1, '160.00', '140.00', 'Venta con factura 001-004-9', 0),
(43, 1, 2, NULL, '2020-03-13', '20:44:52', 1, 1, '160.00', '-20.00', 'Venta con factura 001-004-10', 0),
(44, 1, 2, NULL, '2020-03-13', '21:10:02', 1, 1, '160.00', '-180.00', 'Venta con factura 001-004-11', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_proveedor_id` int(11) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `fecha_pedido` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `numero` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6716CCAA9F3C9BC1` (`cliente_proveedor_id`),
  KEY `IDX_6716CCAA67B3B43D` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `cliente_proveedor_id`, `users_id`, `fecha_pedido`, `numero`, `estado`) VALUES
(2, 1, 1, '2019-07-31', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_contable`
--

DROP TABLE IF EXISTS `periodo_contable`;
CREATE TABLE IF NOT EXISTS `periodo_contable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `fecha_fin` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `observacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `clave`, `nombre`) VALUES
(1, 'ADMINISTRADOR', 'Administrador'),
(2, '01', 'juan'),
(3, 'ADMINISTRADOR', 'pruebas1'),
(4, '01', 'jhjhgas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_cuentas`
--

DROP TABLE IF EXISTS `plan_cuentas`;
CREATE TABLE IF NOT EXISTS `plan_cuentas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grupo` smallint(6) NOT NULL,
  `tipo_cuenta` smallint(6) NOT NULL,
  `cuenta_padre` smallint(6) DEFAULT NULL,
  `profundidad` smallint(6) NOT NULL,
  `cuentadetalle` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `codigocpl` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_pagos`
--

DROP TABLE IF EXISTS `plan_pagos`;
CREATE TABLE IF NOT EXISTS `plan_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compras_ventas_id` int(11) NOT NULL,
  `fecha_pago` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `valor_cuota` decimal(8,2) NOT NULL,
  `saldo` decimal(8,2) DEFAULT NULL,
  `numero_cuota` smallint(6) NOT NULL,
  `fecha_interes` date NOT NULL COMMENT '(DC2Type:carbondate)',
  PRIMARY KEY (`id`),
  KEY `IDX_893D480358B4B2FD` (`compras_ventas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `plan_pagos`
--

INSERT INTO `plan_pagos` (`id`, `compras_ventas_id`, `fecha_pago`, `valor_cuota`, `saldo`, `numero_cuota`, `fecha_interes`) VALUES
(17, 106, '2019-08-29', '224.00', '0.00', 1, '2019-08-29'),
(18, 110, '2019-08-29', '112.00', '0.00', 1, '2019-08-29'),
(19, 117, '2019-09-05', '33.33', '0.00', 1, '2019-09-05'),
(20, 117, '2019-10-05', '33.33', '0.00', 2, '2019-10-05'),
(21, 117, '2019-11-04', '33.33', '0.00', 3, '2019-11-04'),
(22, 118, '2019-09-11', '11.20', '0.00', 1, '2019-09-11'),
(23, 118, '2019-10-11', '11.20', '0.00', 2, '2019-10-11'),
(24, 131, '2019-12-15', '29.87', '0.00', 1, '2019-12-15'),
(25, 131, '2020-01-14', '29.87', '0.00', 2, '2020-01-14'),
(26, 131, '2020-02-13', '29.87', '29.87', 3, '2020-02-13'),
(27, 133, '2020-01-18', '13.05', '0.00', 1, '2020-01-18'),
(28, 133, '2020-01-18', '12.04', '0.00', 2, '2019-11-19'),
(29, 138, '2020-01-10', '9.59', '9.59', 1, '2020-01-10'),
(30, 138, '2020-02-09', '9.59', '9.59', 2, '2020-02-09'),
(31, 138, '2020-03-10', '9.59', '9.59', 3, '2020-03-10'),
(32, 140, '2020-01-16', '21.48', '21.48', 1, '2020-01-16'),
(33, 141, '2020-02-08', '22.40', '22.40', 1, '2020-02-08'),
(34, 142, '2020-02-08', '22.40', '22.40', 1, '2020-02-08'),
(35, 143, '2020-02-08', '22.40', '22.40', 1, '2020-02-08'),
(36, 144, '2020-02-08', '21.68', '21.68', 1, '2020-02-08'),
(37, 145, '2020-02-16', '35.84', '35.84', 1, '2020-02-16'),
(38, 149, '2020-08-14', '108.40', '108.40', 1, '2020-08-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promesa_pago`
--

DROP TABLE IF EXISTS `promesa_pago`;
CREATE TABLE IF NOT EXISTS `promesa_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleados_id` int(11) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `cliente_proveedor_id` int(11) DEFAULT NULL,
  `fecha` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `cantidad` decimal(10,2) DEFAULT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9DEAF509C13DA66E` (`empleados_id`),
  KEY `IDX_9DEAF50967B3B43D` (`users_id`),
  KEY `IDX_9DEAF5099F3C9BC1` (`cliente_proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retenciones`
--

DROP TABLE IF EXISTS `retenciones`;
CREATE TABLE IF NOT EXISTS `retenciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_proveedor_id` int(11) DEFAULT NULL,
  `users_id` bigint(20) NOT NULL,
  `tipo` smallint(6) DEFAULT NULL,
  `sustento` smallint(6) NOT NULL,
  `fecha_emision` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `fecha_registro` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `hora` time NOT NULL COMMENT '(DC2Type:carbontime)',
  `subcliprove` smallint(6) DEFAULT NULL,
  `numero_retencion` bigint(20) NOT NULL,
  `autorizacion_sri` varchar(49) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` smallint(6) NOT NULL,
  `fecha_anulacion` date DEFAULT NULL COMMENT '(DC2Type:carbondate)',
  `impresion` tinyint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `compras_ventas_id` int(11) NOT NULL,
  `documento` smallint(6) NOT NULL,
  `base_imponible` double DEFAULT NULL,
  `iva_mercaderia` double DEFAULT NULL,
  `iva_servicios` double DEFAULT NULL,
  `valor_retencion_renta` double DEFAULT NULL,
  `valor_retencion_bienes` double DEFAULT NULL,
  `valor_retencion_servicios` double DEFAULT NULL,
  `sucursal_id` int(11) NOT NULL,
  `establecimiento_retencion` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `punto_emision_retencion` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FE0248879F3C9BC1` (`cliente_proveedor_id`),
  KEY `IDX_FE02488767B3B43D` (`users_id`),
  KEY `IDX_FE02488758B4B2FD` (`compras_ventas_id`),
  KEY `IDX_FE024887279A5D5E` (`sucursal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `retenciones`
--

INSERT INTO `retenciones` (`id`, `cliente_proveedor_id`, `users_id`, `tipo`, `sustento`, `fecha_emision`, `fecha_registro`, `hora`, `subcliprove`, `numero_retencion`, `autorizacion_sri`, `observacion`, `estado`, `fecha_anulacion`, `impresion`, `deleted_at`, `compras_ventas_id`, `documento`, `base_imponible`, `iva_mercaderia`, `iva_servicios`, `valor_retencion_renta`, `valor_retencion_bienes`, `valor_retencion_servicios`, `sucursal_id`, `establecimiento_retencion`, `punto_emision_retencion`) VALUES
(1, 1, 1, 0, 36, '2019-12-17', '2019-12-17', '23:56:59', NULL, 5, 'COMPROBANTE_ELECTRONICO', NULL, 1, NULL, NULL, NULL, 140, 38, 20, 2.4, 0, 0.2, 0.72, NULL, 1, '001', '008'),
(2, 1, 1, 0, 36, '2020-01-09', '2020-01-09', '20:43:29', NULL, 6, 'COMPROBANTE_ELECTRONICO', NULL, 1, NULL, NULL, NULL, 144, 38, 20, 2.4, 0, 0, 0.72, NULL, 1, '001', '008'),
(3, 1, 1, 0, 36, '2020-07-15', '2020-07-15', '16:50:09', NULL, 7, 'COMPROBANTE_ELECTRONICO', NULL, 1, NULL, NULL, NULL, 149, 38, 100, 12, 0, 0, 3.6, NULL, 1, '001', '008');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_pagos`
--

DROP TABLE IF EXISTS `rol_pagos`;
CREATE TABLE IF NOT EXISTS `rol_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleados_id` int(11) NOT NULL,
  `componentes_rol_id` int(11) NOT NULL,
  `mes` smallint(6) NOT NULL,
  `year` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9CE02BBBC13DA66E` (`empleados_id`),
  KEY `IDX_9CE02BBBDE05162A` (`componentes_rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series`
--

DROP TABLE IF EXISTS `series`;
CREATE TABLE IF NOT EXISTS `series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventario_id` int(11) DEFAULT NULL,
  `numero` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adicional` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3A10012DDFDFBE2A` (`inventario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE IF NOT EXISTS `sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacion` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `administrador` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id`, `nombre`, `provincia`, `ciudad`, `direccion`, `telefono`, `observacion`, `administrador`, `deleted_at`) VALUES
(1, 'Prueba', 'test', 'test', 'test', '12345678', 'prueba', 'test', NULL),
(2, 'MI AHORRO', 'MORONA SANTIAGO', 'MACAS', 'AMAZONA Y 10 E AGOSTO', '123457', 'A', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp_ventas`
--

DROP TABLE IF EXISTS `tmp_ventas`;
CREATE TABLE IF NOT EXISTS `tmp_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventario_id` int(11) NOT NULL,
  `bodega_id` int(11) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `id_pc` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL COMMENT '(DC2Type:carbondate)',
  `hora` time NOT NULL COMMENT '(DC2Type:carbontime)',
  `numero` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `estado` smallint(6) DEFAULT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_798B0F94DFDFBE2A` (`inventario_id`),
  KEY `IDX_798B0F948B1FDE9D` (`bodega_id`),
  KEY `IDX_798B0F9467B3B43D` (`users_id`),
  KEY `IDX_798B0F94279A5D5E` (`sucursal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tmp_ventas`
--

INSERT INTO `tmp_ventas` (`id`, `inventario_id`, `bodega_id`, `users_id`, `id_pc`, `fecha`, `hora`, `numero`, `cantidad`, `precio`, `total`, `estado`, `sucursal_id`) VALUES
(1, 1, 6, 1, '20-16-D8-D6-4E-90', '2020-03-11', '19:58:56', 1, 1, '30.00', '30.00', 2, NULL),
(2, 1, 6, 1, '20-16-D8-D6-4E-90', '2020-03-12', '16:06:42', 2, 3, '50.00', '150.00', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp_venta_procesar`
--

DROP TABLE IF EXISTS `tmp_venta_procesar`;
CREATE TABLE IF NOT EXISTS `tmp_venta_procesar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventario_id` int(11) NOT NULL,
  `cliente_proveedor_id` int(11) DEFAULT NULL,
  `tipo` smallint(6) NOT NULL,
  `cantidad` double NOT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `id_pc` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_pc` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `compras_ventas_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B4E579D7DFDFBE2A` (`inventario_id`),
  KEY `IDX_B4E579D79F3C9BC1` (`cliente_proveedor_id`),
  KEY `IDX_B4E579D758B4B2FD` (`compras_ventas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tmp_venta_procesar`
--

INSERT INTO `tmp_venta_procesar` (`id`, `inventario_id`, `cliente_proveedor_id`, `tipo`, `cantidad`, `precio_venta`, `id_pc`, `nombre_pc`, `estado`, `compras_ventas_id`) VALUES
(7, 1, 6, 0, 4, '40.00', '20-16-D8-D6-4E-90', 'DESKTOP-0RSTU9I', 0, 148);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `recovery` tinyint(1) NOT NULL,
  `must_change_password` tinyint(1) NOT NULL,
  `rol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL COMMENT '(DC2Type:carbondatetime)',
  `attempts` int(11) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `permiso_id` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`),
  UNIQUE KEY `UNIQ_1483A5E9F85E0677` (`username`),
  UNIQUE KEY `UNIQ_1483A5E9D1B862B8` (`hash`),
  KEY `IDX_1483A5E96CEFAD37` (`permiso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `verified`, `active`, `recovery`, `must_change_password`, `rol`, `hash`, `last_login`, `attempts`, `locked`, `permiso_id`, `deleted_at`) VALUES
(1, 'jorge.pena@durango.gob.mx', 'admin', '$2y$13$YyCLoyGnGPl4QeUZs03T7O8k.V7kkVPjJVYdVeora4VV8Lkr1OrgG', 1, 1, 0, 0, 'ROLE_ADMIN', 'ec827e93e4431a61c8799f266d8517e4', '2020-07-23 18:44:09', 0, 0, 1, NULL),
(2, 'carlos@gmail.com', 'carlos', '$2y$13$HLxN32X.fw9DyII/LHW/c.b23CmPw1xhEhlCU3INagm3fceQDXbAa', 1, 1, 0, 0, 'ROLE_ADMIN', '68267969f52cb3120513746adfdb315a', '2020-02-20 21:09:08', 0, 0, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `work_space`
--

DROP TABLE IF EXISTS `work_space`;
CREATE TABLE IF NOT EXISTS `work_space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permiso_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_189BA156CEFAD37` (`permiso_id`),
  KEY `IDX_189BA15CCD7E912` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `work_space`
--

INSERT INTO `work_space` (`id`, `permiso_id`, `menu_id`) VALUES
(10, 1, 27),
(12, 1, 7),
(13, 1, 13),
(16, 3, 7),
(17, 3, 13),
(18, 3, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xml_importado`
--

DROP TABLE IF EXISTS `xml_importado`;
CREATE TABLE IF NOT EXISTS `xml_importado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventario_id` int(11) NOT NULL,
  `codigo_xml` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_178D459FDFDFBE2A` (`inventario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `FK_AF4BB49D67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD CONSTRAINT `FK_EAADF3A89A111542` FOREIGN KEY (`listas_id`) REFERENCES `listas` (`id`);

--
-- Filtros para la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD CONSTRAINT `FK_5CD2A5FC13DA66E` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `bodega_inventario`
--
ALTER TABLE `bodega_inventario`
  ADD CONSTRAINT `FK_BB03EE0D8B1FDE9D` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id`),
  ADD CONSTRAINT `FK_BB03EE0DDFDFBE2A` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `cierre_caja`
--
ALTER TABLE `cierre_caja`
  ADD CONSTRAINT `FK_2B6E1081DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `cliente_proveedor`
--
ALTER TABLE `cliente_proveedor`
  ADD CONSTRAINT `FK_1CDE70AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_1CDE70AC13DA66E` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `cobros_pagos`
--
ALTER TABLE `cobros_pagos`
  ADD CONSTRAINT `FK_D9581D1626DCA429` FOREIGN KEY (`bancos_id`) REFERENCES `bancos` (`id`),
  ADD CONSTRAINT `FK_D9581D16279A5D5E` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`),
  ADD CONSTRAINT `FK_D9581D1667B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_D9581D169F3C9BC1` FOREIGN KEY (`cliente_proveedor_id`) REFERENCES `cliente_proveedor` (`id`);

--
-- Filtros para la tabla `componentes_meses`
--
ALTER TABLE `componentes_meses`
  ADD CONSTRAINT `FK_F35EBCD6DE05162A` FOREIGN KEY (`componentes_rol_id`) REFERENCES `componentes_rol` (`id`);

--
-- Filtros para la tabla `componentes_rol`
--
ALTER TABLE `componentes_rol`
  ADD CONSTRAINT `FK_70CD053699EAF094` FOREIGN KEY (`plan_cuentas_id`) REFERENCES `plan_cuentas` (`id`);

--
-- Filtros para la tabla `compras_ventas`
--
ALTER TABLE `compras_ventas`
  ADD CONSTRAINT `FK_BFFF0019279A5D5E` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`),
  ADD CONSTRAINT `FK_BFFF00198B1FDE9D` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id`),
  ADD CONSTRAINT `FK_BFFF0019952BE730` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `FK_BFFF00199F3C9BC1` FOREIGN KEY (`cliente_proveedor_id`) REFERENCES `cliente_proveedor` (`id`),
  ADD CONSTRAINT `FK_BFFF0019A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `desglose_caja`
--
ALTER TABLE `desglose_caja`
  ADD CONSTRAINT `FK_6C732152667EEAA2` FOREIGN KEY (`cierre_caja_id`) REFERENCES `cierre_caja` (`id`);

--
-- Filtros para la tabla `detalle_cobros_pagos`
--
ALTER TABLE `detalle_cobros_pagos`
  ADD CONSTRAINT `FK_1018227D58B4B2FD` FOREIGN KEY (`compras_ventas_id`) REFERENCES `compras_ventas` (`id`),
  ADD CONSTRAINT `FK_1018227DE436AFF1` FOREIGN KEY (`cobros_pagos_id`) REFERENCES `cobros_pagos` (`id`);

--
-- Filtros para la tabla `detalle_componentes_rol`
--
ALTER TABLE `detalle_componentes_rol`
  ADD CONSTRAINT `FK_1A4D4A92DE05162A` FOREIGN KEY (`componentes_rol_id`) REFERENCES `componentes_rol` (`id`);

--
-- Filtros para la tabla `detalle_compras_ventas`
--
ALTER TABLE `detalle_compras_ventas`
  ADD CONSTRAINT `FK_8F90560858B4B2FD` FOREIGN KEY (`compras_ventas_id`) REFERENCES `compras_ventas` (`id`),
  ADD CONSTRAINT `FK_8F905608DFDFBE2A` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `detalle_diario`
--
ALTER TABLE `detalle_diario`
  ADD CONSTRAINT `FK_67809A0B2D6E7A46` FOREIGN KEY (`diario_id`) REFERENCES `diario` (`id`),
  ADD CONSTRAINT `FK_67809A0B99EAF094` FOREIGN KEY (`plan_cuentas_id`) REFERENCES `plan_cuentas` (`id`);

--
-- Filtros para la tabla `detalle_ingresos_egresos`
--
ALTER TABLE `detalle_ingresos_egresos`
  ADD CONSTRAINT `FK_C91B99B6A25FEB46` FOREIGN KEY (`ingresos_egresos_id`) REFERENCES `ingresos_egresos` (`id`),
  ADD CONSTRAINT `FK_C91B99B6DFDFBE2A` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `detalle_movimiento_caja_bancos`
--
ALTER TABLE `detalle_movimiento_caja_bancos`
  ADD CONSTRAINT `FK_B393CF0426DCA429` FOREIGN KEY (`bancos_id`) REFERENCES `bancos` (`id`),
  ADD CONSTRAINT `FK_B393CF049949942C` FOREIGN KEY (`movimiento_caja_bancos_id`) REFERENCES `movimiento_caja_bancos` (`id`);

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `FK_2FC82202213530F2` FOREIGN KEY (`pedidos_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `FK_2FC82202DFDFBE2A` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `detalle_retenciones`
--
ALTER TABLE `detalle_retenciones`
  ADD CONSTRAINT `FK_B21DA5F454956CEA` FOREIGN KEY (`retenciones_id`) REFERENCES `retenciones` (`id`);

--
-- Filtros para la tabla `diario`
--
ALTER TABLE `diario`
  ADD CONSTRAINT `FK_B5879AC279A5D5E` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`),
  ADD CONSTRAINT `FK_B5879AC67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_B5879ACE548529E` FOREIGN KEY (`periodo_contable_id`) REFERENCES `periodo_contable` (`id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `FK_9EB2266C67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `FK_622B9C0F873ED084` FOREIGN KEY (`users_creado_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_622B9C0F914B7999` FOREIGN KEY (`compra_venta_id`) REFERENCES `compras_ventas` (`id`),
  ADD CONSTRAINT `FK_622B9C0FF340A389` FOREIGN KEY (`users_actualizado_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `guia_remision`
--
ALTER TABLE `guia_remision`
  ADD CONSTRAINT `FK_191A1DC958B4B2FD` FOREIGN KEY (`compras_ventas_id`) REFERENCES `compras_ventas` (`id`);

--
-- Filtros para la tabla `ingresos_egresos`
--
ALTER TABLE `ingresos_egresos`
  ADD CONSTRAINT `FK_18CA7E0835D1FB8C` FOREIGN KEY (`bodega_detino_id`) REFERENCES `bodega` (`id`),
  ADD CONSTRAINT `FK_18CA7E0867B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_18CA7E088B1FDE9D` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id`),
  ADD CONSTRAINT `FK_18CA7E089F3C9BC1` FOREIGN KEY (`cliente_proveedor_id`) REFERENCES `cliente_proveedor` (`id`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `FK_6A194EF512148A28` FOREIGN KEY (`cuenta_mercaderia_id`) REFERENCES `plan_cuentas` (`id`),
  ADD CONSTRAINT `FK_6A194EF567B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_6A194EF5BCB3126F` FOREIGN KEY (`cuenta_costoventas_id`) REFERENCES `plan_cuentas` (`id`),
  ADD CONSTRAINT `FK_6A194EF5DFDB2E59` FOREIGN KEY (`cuenta_ventas_id`) REFERENCES `plan_cuentas` (`id`);

--
-- Filtros para la tabla `inventario_alterno`
--
ALTER TABLE `inventario_alterno`
  ADD CONSTRAINT `FK_9E9B59261FBD9415` FOREIGN KEY (`inventario2_id`) REFERENCES `inventario` (`id`),
  ADD CONSTRAINT `FK_9E9B5926DFDFBE2A` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `inventario_codigos`
--
ALTER TABLE `inventario_codigos`
  ADD CONSTRAINT `FK_B2511E0EDFDFBE2A` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `FK_BF1F6DC058B4B2FD` FOREIGN KEY (`compras_ventas_id`) REFERENCES `compras_ventas` (`id`),
  ADD CONSTRAINT `FK_BF1F6DC067B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_BF1F6DC08B1FDE9D` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id`),
  ADD CONSTRAINT `FK_BF1F6DC0A25FEB46` FOREIGN KEY (`ingresos_egresos_id`) REFERENCES `ingresos_egresos` (`id`),
  ADD CONSTRAINT `FK_BF1F6DC0DFDFBE2A` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `lote_caducidades`
--
ALTER TABLE `lote_caducidades`
  ADD CONSTRAINT `FK_3C6746B858B4B2FD` FOREIGN KEY (`compras_ventas_id`) REFERENCES `compras_ventas` (`id`),
  ADD CONSTRAINT `FK_3C6746B8CB305D73` FOREIGN KEY (`proveedor_id`) REFERENCES `cliente_proveedor` (`id`),
  ADD CONSTRAINT `FK_3C6746B8DFDFBE2A` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_7D053A93727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_7D053A93A977936C` FOREIGN KEY (`tree_root`) REFERENCES `menu` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `menu_permisos`
--
ALTER TABLE `menu_permisos`
  ADD CONSTRAINT `FK_20154E755FA0F787` FOREIGN KEY (`permisos_id`) REFERENCES `permisos` (`id`),
  ADD CONSTRAINT `FK_20154E75CCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);

--
-- Filtros para la tabla `movimientos_caja`
--
ALTER TABLE `movimientos_caja`
  ADD CONSTRAINT `FK_C8F6D5E367B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_C8F6D5E39A111542` FOREIGN KEY (`listas_id`) REFERENCES `listas` (`id`);

--
-- Filtros para la tabla `movimiento_caja_bancos`
--
ALTER TABLE `movimiento_caja_bancos`
  ADD CONSTRAINT `FK_1B04273567B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK_6716CCAA67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_6716CCAA9F3C9BC1` FOREIGN KEY (`cliente_proveedor_id`) REFERENCES `cliente_proveedor` (`id`);

--
-- Filtros para la tabla `plan_pagos`
--
ALTER TABLE `plan_pagos`
  ADD CONSTRAINT `FK_893D480358B4B2FD` FOREIGN KEY (`compras_ventas_id`) REFERENCES `compras_ventas` (`id`);

--
-- Filtros para la tabla `promesa_pago`
--
ALTER TABLE `promesa_pago`
  ADD CONSTRAINT `FK_9DEAF50967B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_9DEAF5099F3C9BC1` FOREIGN KEY (`cliente_proveedor_id`) REFERENCES `cliente_proveedor` (`id`),
  ADD CONSTRAINT `FK_9DEAF509C13DA66E` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `retenciones`
--
ALTER TABLE `retenciones`
  ADD CONSTRAINT `FK_FE024887279A5D5E` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`),
  ADD CONSTRAINT `FK_FE02488758B4B2FD` FOREIGN KEY (`compras_ventas_id`) REFERENCES `compras_ventas` (`id`),
  ADD CONSTRAINT `FK_FE02488767B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_FE0248879F3C9BC1` FOREIGN KEY (`cliente_proveedor_id`) REFERENCES `cliente_proveedor` (`id`);

--
-- Filtros para la tabla `rol_pagos`
--
ALTER TABLE `rol_pagos`
  ADD CONSTRAINT `FK_9CE02BBBC13DA66E` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `FK_9CE02BBBDE05162A` FOREIGN KEY (`componentes_rol_id`) REFERENCES `componentes_rol` (`id`);

--
-- Filtros para la tabla `series`
--
ALTER TABLE `series`
  ADD CONSTRAINT `FK_3A10012DDFDFBE2A` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `tmp_ventas`
--
ALTER TABLE `tmp_ventas`
  ADD CONSTRAINT `FK_798B0F94279A5D5E` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`),
  ADD CONSTRAINT `FK_798B0F9467B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_798B0F948B1FDE9D` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id`),
  ADD CONSTRAINT `FK_798B0F94DFDFBE2A` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `tmp_venta_procesar`
--
ALTER TABLE `tmp_venta_procesar`
  ADD CONSTRAINT `FK_B4E579D758B4B2FD` FOREIGN KEY (`compras_ventas_id`) REFERENCES `compras_ventas` (`id`),
  ADD CONSTRAINT `FK_B4E579D79F3C9BC1` FOREIGN KEY (`cliente_proveedor_id`) REFERENCES `cliente_proveedor` (`id`),
  ADD CONSTRAINT `FK_B4E579D7DFDFBE2A` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_1483A5E96CEFAD37` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`);

--
-- Filtros para la tabla `work_space`
--
ALTER TABLE `work_space`
  ADD CONSTRAINT `FK_189BA156CEFAD37` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`),
  ADD CONSTRAINT `FK_189BA15CCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);

--
-- Filtros para la tabla `xml_importado`
--
ALTER TABLE `xml_importado`
  ADD CONSTRAINT `FK_178D459FDFDFBE2A` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
