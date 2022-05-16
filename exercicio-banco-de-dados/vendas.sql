-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2022 at 01:24 PM
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
-- Database: `vendas`
--

-- --------------------------------------------------------

--
-- Table structure for table `fabricantes`
--

CREATE TABLE `fabricantes` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fabricantes`
--

INSERT INTO `fabricantes` (`id`, `nome`) VALUES
(1, 'Asus'),
(2, 'Dell'),
(3, 'Apple'),
(5, 'Samsung'),
(6, 'Brastemp'),
(7, 'Positivo'),
(8, 'Microsoft Brasil');

-- --------------------------------------------------------

--
-- Table structure for table `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(6,2) NOT NULL,
  `quantidade` tinyint(4) NOT NULL,
  `fabricante_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`, `quantidade`, `fabricante_id`) VALUES
(1, 'Ultrabook', 'Intel Ultrabook Asus com processador Intel cORE i12, memória RAM de 16GB e Windows 11', '6500.99', 15, 1),
(2, 'Tablet Android', 'Tablet comum versão 12 do sistema operacional da google. Possui tela de 10 polegadas e armazenamento de 64GB', '4999.00', 4, 5),
(3, 'Geladeira', 'Refrigerador frost-free com acesso à internet das coisas e bla bla bla', '1500.00', 10, 6),
(4, 'iPhone 13 Pro Max', 'Alta durabilidade, processador Bionic 14 memória de 128GB de rmazenamento e 6GB de RAM e caro pra caramba', '6999.99', 15, 3),
(5, 'iPad Mini', 'Tablet apple com tela retina display de 4k e memória interna de 64GB e acesso gratuito ao iCloud', '5000.00', 15, 3),
(6, 'Xbox', 'Console de últma geração com acesso aos melhores jogos e bla bla bla', '2500.00', 6, 8),
(7, 'Ultrabook', 'Equipamento com processador AMD Ryzen5 12GB de RAM, placa de vídeo RTX', '4500.00', 12, 7),
(8, 'Teclado gamer', 'Teclado de última geração com teclas quanticas e mecânicas ótimo tempo de resposta e blá blá blá. Ah, e LED embutido!', '380.00', 8, 8),
(9, 'placa-mãe', 'placa com diversos slots de memória RAM DDR6, suporte a processdores intel linha core i5, i7 e etc.', '1200.00', 15, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fabricantes`
--
ALTER TABLE `fabricantes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produtos_fabricantes` (`fabricante_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fabricantes`
--
ALTER TABLE `fabricantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_produtos_fabricantes` FOREIGN KEY (`fabricante_id`) REFERENCES `fabricantes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
