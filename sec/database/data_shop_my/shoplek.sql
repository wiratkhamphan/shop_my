-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2024 at 08:02 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoplek`
--

-- --------------------------------------------------------

--
-- Table structure for table `apptaxid`
--

CREATE TABLE `apptaxid` (
  `id` int(11) NOT NULL,
  `request_no` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `name_customer` varchar(30) NOT NULL,
  `tax_id` int(13) NOT NULL,
  `Status` int(10) NOT NULL,
  `Recorder` varchar(30) NOT NULL,
  `Inspector` varchar(30) NOT NULL,
  `Attached_documents` varchar(30) NOT NULL,
  `Note` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apptaxid`
--

INSERT INTO `apptaxid` (`id`, `request_no`, `date_time`, `name_customer`, `tax_id`, `Status`, `Recorder`, `Inspector`, `Attached_documents`, `Note`) VALUES
(1, 1, '2024-04-22 07:12:35', '1', 0, 0, '', '', '', ''),
(2, 122, '2024-04-23 11:07:08', 'LEK', 0, 0, '', '', '', ''),
(3, 0, '0000-00-00 00:00:00', '', 0, 0, '', '', '', ''),
(4, 0, '0000-00-00 00:00:00', '', 0, 0, '', '', '', ''),
(5, 1, '0000-00-00 00:00:00', '1', 0, 0, '1', '1', '1', '1'),
(6, 122, '0000-00-00 00:00:00', '1', 0, 0, '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `age` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `age`, `fname`) VALUES
(1, '123', '123', '111', 111, '111');

-- --------------------------------------------------------

--
-- Table structure for table `user_a`
--

CREATE TABLE `user_a` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_a`
--

INSERT INTO `user_a` (`id`, `username`, `email`, `age`) VALUES
(1, '123', '11', 11);

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `username`, `password`) VALUES
(3, 'test', '$2a$10$Ps8aHA6W/f8jHM1X3zfd.e9vKVirctePNmVR7iOvcgpPHAThRxuUW'),
(4, '123', '123'),
(5, 'wirat0khamphan@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `vat_alculator`
--

CREATE TABLE `vat_alculator` (
  `id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `netprice` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vat_alculator`
--

INSERT INTO `vat_alculator` (`id`, `price`, `vat`, `netprice`, `img`) VALUES
(13, 123123, 8619, 131742, '002.jpg'),
(14, 112, 8, 120, '003.jpg'),
(15, 22, 2, 24, '002.jpg'),
(16, 123123, 8619, 131742, '003.jpg'),
(17, 111, 8, 119, '003.jpg'),
(18, 3213, 225, 3438, '132033.jpg'),
(19, 3123124, 218619, 3341743, '1712737187375.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apptaxid`
--
ALTER TABLE `apptaxid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_a`
--
ALTER TABLE `user_a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vat_alculator`
--
ALTER TABLE `vat_alculator`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apptaxid`
--
ALTER TABLE `apptaxid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_a`
--
ALTER TABLE `user_a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vat_alculator`
--
ALTER TABLE `vat_alculator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
