-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2022 at 01:12 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tecinternet_escola_veronica`
--

-- --------------------------------------------------------

--
-- Table structure for table `alunos`
--

CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `nascimento` date NOT NULL,
  `nota1` decimal(4,2) NOT NULL,
  `nota2` decimal(4,2) NOT NULL,
  `curso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `nascimento`, `nota1`, `nota2`, `curso_id`) VALUES
(1, 'Amy Lee', '1981-12-13', '5.00', '7.50', 1),
(2, 'Simone Simmons', '1985-01-17', '10.00', '8.30', 3),
(3, 'Fernanda Lira', '1989-09-09', '10.00', '9.30', 1),
(5, 'Cristina Scabbia', '1972-06-06', '7.00', '6.30', 5),
(6, 'Alissa WG', '1985-07-31', '9.90', '8.90', 5),
(7, 'Mizuho Lin', '1990-05-26', '8.90', '5.30', 2),
(8, 'Angela Gossow', '1974-11-05', '6.10', '8.30', 1),
(9, 'Tarja Turnen', '1977-08-17', '10.00', '9.10', 4),
(10, 'Doro Pesch', '1964-06-03', '9.30', '8.80', 2),
(11, 'Sharon Den Andel', '1974-07-12', '5.00', '7.30', 1),
(12, 'Joan Jett', '1958-09-22', '5.30', '6.50', 3);

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `carga` smallint(6) NOT NULL,
  `professor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`id`, `titulo`, `carga`, `professor_id`) VALUES
(1, 'Front-End', 40, 6),
(2, 'Back-End', 80, 5),
(3, 'UX/UI Design', 30, 4),
(4, 'Figma', 10, 3),
(5, 'Redes de Computadores', 100, 2);

-- --------------------------------------------------------

--
-- Table structure for table `professores`
--

CREATE TABLE `professores` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `area` enum('design','desenvolvimento','infra') NOT NULL,
  `curso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professores`
--

INSERT INTO `professores` (`id`, `nome`, `area`, `curso_id`) VALUES
(2, 'Jon Oliva', 'infra', 5),
(3, 'Lemmy Kilmister', 'design', 4),
(4, 'Neil Peart', 'design', 3),
(5, 'Ozzy Osbourne', 'desenvolvimento', 2),
(6, 'David Gilmour', 'desenvolvimento', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alunos` (`curso_id`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cursos` (`professor_id`);

--
-- Indexes for table `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_professores` (`curso_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `professores`
--
ALTER TABLE `professores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `fk_alunos` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);

--
-- Constraints for table `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_cursos` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`id`);

--
-- Constraints for table `professores`
--
ALTER TABLE `professores`
  ADD CONSTRAINT `fk_professores` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
