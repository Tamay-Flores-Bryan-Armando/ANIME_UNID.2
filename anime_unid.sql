-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2023 a las 05:56:29
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `anime_unid`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `color` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `color`) VALUES
(1, 'Acción', '000000'),
(2, 'Artes Marciales', '5656ff'),
(3, 'Aventuras', 'CC56AA'),
(4, 'Anime', '000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listas`
--

CREATE TABLE `listas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `sipnosis` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `fecha_insercion` date NOT NULL,
  `votos` float(1,1) NOT NULL,
  `anio` int(4) NOT NULL DEFAULT 2023
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `listas`
--

INSERT INTO `listas` (`id`, `nombre`, `sipnosis`, `thumbnail`, `fecha_insercion`, `votos`, `anio`) VALUES
(1, 'The Marginal Service', '', 'https://picsum.photos/300/200', '2023-06-04', 0.9, 2023),
(2, 'Attack on Titan', 'En un mundo donde la humanidad se encuentra al borde de la extinción debido a la existencia de gigantes devoradores de personas', 'https://media.tenor.com/uKtpA6aBurMAAAAd/anime-attack-on-titan.gif', '2023-06-10', 0.9, 2023),
(3, 'Death Note', 'Light Yagami, un estudiante de instituto, encuentra un cuaderno sobrenatural llamado Death Note. Con el poder de matar a cualquier persona cuyo nombre sea escrito en él', 'https://gifdb.com/images/high/light-yagami-death-note-crazy-laughing-5tmfcfouls6uccqt.gif', '2023-06-09', 0.9, 2023),
(4, 'Fullmetal Alchemist', 'Los hermanos Edward y Alphonse Elric utilizan la alquimia en busca de la Piedra Filosofal para recuperar sus cuerpos después de un intento fallido de resucitar a su madre. ', 'https://i.pinimg.com/originals/24/45/96/2445962b5f1009d3560278d827214222.gif', '2023-06-08', 0.9, 2023),
(5, 'One Piece', 'Monkey D. Luffy se embarca en una aventura épica para encontrar el tesoro más grande del mundo, conocido como el \"One Piece\".', 'https://i.pinimg.com/originals/48/f7/0c/48f70c3f92a28fc6d432620eb88442d4.gif', '2023-06-07', 0.9, 2023),
(6, 'My Hero Academia', 'En un mundo donde la mayoría de la población tiene habilidades sobrenaturales conocidas como \"Quirks\", un joven llamado Izuku Midoriya lucha por convertirse en un héroe a pesar de no tener un Quirk inicialmente.', 'https://media.tenor.com/6ve9NOXQnY0AAAAC/izuku-midoriya-my-hero-academia.gif', '2023-06-13', 0.9, 2023),
(7, 'Naruto', ' La historia sigue las aventuras de Naruto Uzumaki, un joven ninja que sueña con convertirse en el Hokage, el líder de su aldea.', 'https://media.tenor.com/UHURwQ02BTAAAAAC/anime-naruto.gif', '2023-06-06', 0.9, 2023);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_roles`
--

CREATE TABLE `rel_roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_status`
--

CREATE TABLE `rel_status` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_video_categoria`
--

CREATE TABLE `rel_video_categoria` (
  `id` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_video_lista`
--

CREATE TABLE `rel_video_lista` (
  `id` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `id_lista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(30) NOT NULL,
  `rol` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `contrasena`, `rol`, `status`, `usuario`) VALUES
(1, 'bryan14141212@gmail.com', 'cantalupe', 0, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `titulo` varchar(55) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `categoria` int(11) NOT NULL,
  `lista` int(4) NOT NULL,
  `fecha_insercion` date NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `orden` int(4) NOT NULL,
  `episodio` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video`
--

INSERT INTO `video` (`id`, `titulo`, `thumbnail`, `archivo`, `categoria`, `lista`, `fecha_insercion`, `fecha_publicacion`, `orden`, `episodio`) VALUES
(1, 'The Marginal Service', 'https://i.pinimg.com/originals/7a/3d/44/7a3d44bb12803b174dc135156e492125.gif', 'https://i.pinimg.com/originals/7a/3d/44/7a3d44bb12803b174dc135156e492125.gif', 1, 1, '2023-06-04', '2023-06-14 03:10:19', 0, 8),
(2, 'prueba_li', 'https://aniyuki.com/wp-content/uploads/2021/08/aniyuki-gif-naruto-78.gif', 'https://aniyuki.com/wp-content/uploads/2021/08/aniyuki-gif-naruto-78.gif', 2, 2, '2023-06-04', '2023-06-14 03:12:05', 0, 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `listas`
--
ALTER TABLE `listas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rel_roles`
--
ALTER TABLE `rel_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rel_status`
--
ALTER TABLE `rel_status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rel_video_categoria`
--
ALTER TABLE `rel_video_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rel_video_lista`
--
ALTER TABLE `rel_video_lista`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `listas`
--
ALTER TABLE `listas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `rel_roles`
--
ALTER TABLE `rel_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rel_status`
--
ALTER TABLE `rel_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rel_video_categoria`
--
ALTER TABLE `rel_video_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rel_video_lista`
--
ALTER TABLE `rel_video_lista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
