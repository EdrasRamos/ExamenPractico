-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2021 a las 16:19:24
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `serie1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_desempeño`
--

CREATE TABLE `area_desempeño` (
  `Id` int(11) NOT NULL,
  `area_desempeño` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_x_persona`
--

CREATE TABLE `area_x_persona` (
  `Id_area_x_persona` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_area_desempeño` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logro_academico`
--

CREATE TABLE `logro_academico` (
  `Id_logro` int(11) NOT NULL,
  `titulo_obtenido` varchar(175) NOT NULL,
  `titulo_programa` varchar(175) NOT NULL,
  `institución` varchar(175) NOT NULL,
  `telefono_institucion` varchar(9) NOT NULL,
  `año` year(4) NOT NULL,
  `tipo_logro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logro_x_persona`
--

CREATE TABLE `logro_x_persona` (
  `Id_logro_x_persona` int(11) NOT NULL,
  `Id_logro` int(11) NOT NULL,
  `Id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Id` int(11) NOT NULL,
  `dpi` varchar(20) NOT NULL,
  `nombres` varchar(175) NOT NULL,
  `apellidos` varchar(175) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nit` varchar(10) NOT NULL,
  `sexo` int(1) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `email` varchar(75) NOT NULL,
  `logro_academico` int(11) NOT NULL,
  `area_desempeño` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_logro`
--

CREATE TABLE `tipo_logro` (
  `id` int(11) NOT NULL,
  `tipo_logro` varchar(175) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_usuario` int(11) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area_desempeño`
--
ALTER TABLE `area_desempeño`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `area_x_persona`
--
ALTER TABLE `area_x_persona`
  ADD PRIMARY KEY (`Id_area_x_persona`,`id_persona`,`id_area_desempeño`),
  ADD KEY `id_area_desempeño` (`id_area_desempeño`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `logro_academico`
--
ALTER TABLE `logro_academico`
  ADD PRIMARY KEY (`Id_logro`,`tipo_logro`),
  ADD KEY `tipo_logro` (`tipo_logro`);

--
-- Indices de la tabla `logro_x_persona`
--
ALTER TABLE `logro_x_persona`
  ADD PRIMARY KEY (`Id_logro_x_persona`,`Id_logro`,`Id_persona`),
  ADD KEY `Id_persona` (`Id_persona`),
  ADD KEY `Id_logro` (`Id_logro`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Id`,`logro_academico`,`area_desempeño`),
  ADD KEY `area_desempeño` (`area_desempeño`);

--
-- Indices de la tabla `tipo_logro`
--
ALTER TABLE `tipo_logro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_usuario`,`id_persona`),
  ADD KEY `id_persona` (`id_persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area_desempeño`
--
ALTER TABLE `area_desempeño`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logro_academico`
--
ALTER TABLE `logro_academico`
  MODIFY `Id_logro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_logro`
--
ALTER TABLE `tipo_logro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `area_x_persona`
--
ALTER TABLE `area_x_persona`
  ADD CONSTRAINT `area_x_persona_ibfk_1` FOREIGN KEY (`id_area_desempeño`) REFERENCES `area_desempeño` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `area_x_persona_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `logro_academico`
--
ALTER TABLE `logro_academico`
  ADD CONSTRAINT `logro_academico_ibfk_1` FOREIGN KEY (`tipo_logro`) REFERENCES `tipo_logro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `logro_x_persona`
--
ALTER TABLE `logro_x_persona`
  ADD CONSTRAINT `logro_x_persona_ibfk_1` FOREIGN KEY (`Id_persona`) REFERENCES `persona` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `logro_x_persona_ibfk_2` FOREIGN KEY (`Id_logro`) REFERENCES `logro_academico` (`Id_logro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
