-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-01-2017 a las 20:31:43
-- Versión del servidor: 5.7.11
-- Versión de PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS `bup` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bup`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bup`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--
DROP TABLE IF EXISTS `domicilio`;
CREATE TABLE `domicilio` (
  `id` int(11) NOT NULL,
  `idTipoDomicilio` int(11) NOT NULL,
  `calle` varchar(255) NOT NULL,
  `numero` int(11) NOT NULL,
  `piso` varchar(255) NOT NULL,
  `departamento` varchar(255) NOT NULL,
  `calleEntre1` varchar(255) NOT NULL,
  `calleEntre2` varchar(255) NOT NULL,
  `idCodigoPostal` int(11) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  `idPais` int(11) NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `barrio` varchar(255) NOT NULL,
  `latitud` varchar(255) NOT NULL,
  `longitud` varchar(255) NOT NULL,
  `idPersona` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`id`, `idTipoDomicilio`, `calle`, `numero`, `piso`, `departamento`, `calleEntre1`, `calleEntre2`, `idCodigoPostal`, `idCiudad`, `idProvincia`, `idPais`, `ubicacion`, `barrio`, `latitud`, `longitud`, `idPersona`) VALUES
(1, 2, 'Laprida', 245, '2', '6', 'Cerrito', 'Moreno', 1704, 1256, 24, 54, '', '', '', '', 100),
(2, 3, 'Arenales', 1541, '8', '7', 'Piedras', 'Cabildo', 2574, 56, 24, 54, '', '', '', '', 24),
(3, 2, 'Av. Cerrito', 2569, '5', '3', 'Juncal', 'Cerrito', 2016, 125, 24, 54, '', '', '', '', 186);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `idNumeroDocumento` int(11) NOT NULL,
  `numeroDocumento` int(11) NOT NULL,
  `idSexo` int(11) NOT NULL,
  `apellidos` tinytext NOT NULL,
  `nombres` tinytext NOT NULL,
  `esPersonaFisica` tinyint(1) NOT NULL,
  `esPersonaJuridica` tinyint(1) NOT NULL,
  `valorLealtadCliente` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `idNumeroDocumento`, `numeroDocumento`, `idSexo`, `apellidos`, `nombres`, `esPersonaFisica`, `esPersonaJuridica`, `valorLealtadCliente`) VALUES
(100, 4, 27806332, 1, 'Sucre', 'Pedro Alfonso', 1, 0, ''),
(24, 4, 30721538, 2, 'Steffan', 'Graciela Ana', 1, 0, ''),
(186, 4, 29927566, 2, 'Soler', 'Juana M.', 1, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--
DROP TABLE IF EXISTS `telefono`;
CREATE TABLE `telefono` (
  `id` int(11) NOT NULL,
  `idTipoTelefono` int(11) NOT NULL,
  `codigoPais` int(11) NOT NULL,
  `codigoArea` int(11) NOT NULL,
  `prefijo` int(11) NOT NULL,
  `caracteristica` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `interno` int(11) NOT NULL,
  `prioridad` int(11) NOT NULL,
  `esListaNegra` tinyint(1) NOT NULL,
  `numeroNormalizado` varchar(255) NOT NULL,
  `idPersona` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`id`, `idTipoTelefono`, `codigoPais`, `codigoArea`, `prefijo`, `caracteristica`, `numero`, `interno`, `prioridad`, `esListaNegra`, `numeroNormalizado`, `idPersona`) VALUES
(200, 4, 54, 11, 0, 0, 44114089, 0, 0, 0, '', 100),
(104, 4, 54, 11, 0, 0, 44432019, 0, 0, 0, '', 24),
(20, 4, 54, 221, 0, 0, 426351, 0, 0, 0, '', 186);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`id`);
  
--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);  

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `telefono`
--
ALTER TABLE `telefono`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



-- STORE PROCEDURES

DROP PROCEDURE IF EXISTS obtenerPersonas;
CREATE PROCEDURE obtenerPersonas()
SELECT * FROM persona;

DROP PROCEDURE IF EXISTS obtenerPersona;
CREATE PROCEDURE obtenerPersona(idPersona INT)
SELECT * FROM persona WHERE id = idPersona;

DROP PROCEDURE IF EXISTS obtenerTelefonos;
CREATE PROCEDURE obtenerTelefonos()
SELECT * FROM telefono;

DROP PROCEDURE IF EXISTS obtenerTelefono;
CREATE PROCEDURE obtenerTelefono(idTelefono INT)
SELECT * FROM telefono WHERE id = idTelefono;

DROP PROCEDURE IF EXISTS obtenerTelefonosDePersona;
CREATE PROCEDURE obtenerTelefonosDePersona(id INT)
SELECT * FROM telefono WHERE idPersona = id;

DROP PROCEDURE IF EXISTS obtenerDomicilios;
CREATE PROCEDURE obtenerDomicilios()
SELECT * FROM domicilio;

DROP PROCEDURE IF EXISTS obtenerDomicilio;
CREATE PROCEDURE obtenerDomicilio(idDomicilio INT)
SELECT * FROM domicilio WHERE id = idDomicilio;

DROP PROCEDURE IF EXISTS obtenerDomicilioDePersona;
CREATE PROCEDURE obtenerDomicilioDePersona(id INT)
SELECT * FROM domicilio WHERE idPersona = id;


