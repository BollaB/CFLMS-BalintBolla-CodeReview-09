-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 11:40 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_balint_bolla_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_balint_bolla_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_balint_bolla_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_c_address` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `fk_c_address`, `phone`) VALUES
(1, 'John', 'Doe', 1, 15789654),
(2, 'Maria', 'Smith', 2, 17635239),
(3, 'Peter', 'Johnson', 3, 18516324);

-- --------------------------------------------------------

--
-- Table structure for table `c_address`
--

CREATE TABLE `c_address` (
  `address_id` int(11) NOT NULL,
  `city` varchar(155) DEFAULT NULL,
  `street` varchar(155) DEFAULT NULL,
  `country` varchar(155) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_address`
--

INSERT INTO `c_address` (`address_id`, `city`, `street`, `country`, `zip_code`) VALUES
(1, 'Vienna', 'Mariahilferstrasse 1.', 'Austria', 1068),
(2, 'Budapest', 'Andrássy út 63.', 'Hungary', 1064),
(3, 'Bratislava', 'Rudnayovo námestie 1.', 'Slovakia', 81101);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_location` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `fk_location`) VALUES
(1, 'Thomas', 'Quick', 1),
(2, 'Susan', 'Slow', 2),
(3, 'Nick', 'Normal', 3),
(4, 'Jane', 'Faster', 4),
(5, 'Bill', 'Brown', 5),
(6, 'Amy', 'Moore', 6);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `fk_package` int(11) DEFAULT NULL,
  `fk_l_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `fk_package`, `fk_l_type`) VALUES
(1, 1, 1),
(2, 2, 4),
(3, 3, 2),
(4, 4, 4),
(5, 5, 3),
(6, 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `l_type`
--

CREATE TABLE `l_type` (
  `l_type_id` int(11) NOT NULL,
  `PuP` varchar(155) DEFAULT NULL,
  `Depo` varchar(155) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `l_type`
--

INSERT INTO `l_type` (`l_type_id`, `PuP`, `Depo`) VALUES
(1, 'Mariahilferstrasse 1.\r\nVienna\r\nAustria\r\n1068', NULL),
(2, 'Andrássy út 63.\r\nBudapest\r\nHungary\r\n1064', NULL),
(3, 'Rudnayovo námestie 1.\r\nBratislava\r\nSlovakia\r\n81101', NULL),
(4, NULL, 'DEPO');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `package_id` int(11) NOT NULL,
  `fk_p_size` int(11) DEFAULT NULL,
  `fk_transmit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`package_id`, `fk_p_size`, `fk_transmit`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `processing_system`
--

CREATE TABLE `processing_system` (
  `PS_id` int(11) NOT NULL,
  `deposited_timedate` datetime DEFAULT NULL,
  `received_timedate` datetime DEFAULT NULL,
  `fk_emp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `processing_system`
--

INSERT INTO `processing_system` (`PS_id`, `deposited_timedate`, `received_timedate`, `fk_emp`) VALUES
(1, '2020-07-08 15:03:27', '2020-07-09 09:19:45', 1),
(2, '2020-07-09 15:29:05', '2020-07-10 18:27:58', 3),
(3, '2020-07-08 17:11:35', '2020-07-09 18:11:02', 3),
(4, '2020-07-08 10:11:14', '2020-07-09 14:42:36', 2),
(5, '2020-07-09 09:13:25', '2020-07-11 16:27:12', 3),
(6, '2020-07-09 09:15:49', '2020-07-11 16:27:13', 3);

-- --------------------------------------------------------

--
-- Table structure for table `p_size`
--

CREATE TABLE `p_size` (
  `size_id` int(11) NOT NULL,
  `size` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_size`
--

INSERT INTO `p_size` (`size_id`, `size`) VALUES
(1, 'SMALL'),
(2, 'NORMAL'),
(3, 'BIG');

-- --------------------------------------------------------

--
-- Table structure for table `transmit`
--

CREATE TABLE `transmit` (
  `transmit_id` int(11) NOT NULL,
  `fk_customer` int(11) DEFAULT NULL,
  `fk_transmit_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transmit`
--

INSERT INTO `transmit` (`transmit_id`, `fk_customer`, `fk_transmit_type`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 1),
(4, 2, 2),
(5, 3, 1),
(6, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transmit_type`
--

CREATE TABLE `transmit_type` (
  `type_id` int(11) NOT NULL,
  `priority` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transmit_type`
--

INSERT INTO `transmit_type` (`type_id`, `priority`) VALUES
(1, 'Normal'),
(2, 'Express');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_c_address` (`fk_c_address`);

--
-- Indexes for table `c_address`
--
ALTER TABLE `c_address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `fk_location` (`fk_location`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_package` (`fk_package`),
  ADD KEY `fk_l_type` (`fk_l_type`);

--
-- Indexes for table `l_type`
--
ALTER TABLE `l_type`
  ADD PRIMARY KEY (`l_type_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_transmit` (`fk_transmit`),
  ADD KEY `fk_p_size` (`fk_p_size`);

--
-- Indexes for table `processing_system`
--
ALTER TABLE `processing_system`
  ADD PRIMARY KEY (`PS_id`),
  ADD KEY `fk_emp` (`fk_emp`);

--
-- Indexes for table `p_size`
--
ALTER TABLE `p_size`
  ADD PRIMARY KEY (`size_id`);

--
-- Indexes for table `transmit`
--
ALTER TABLE `transmit`
  ADD PRIMARY KEY (`transmit_id`),
  ADD KEY `fk_customer` (`fk_customer`),
  ADD KEY `fk_transmit_type` (`fk_transmit_type`);

--
-- Indexes for table `transmit_type`
--
ALTER TABLE `transmit_type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `c_address`
--
ALTER TABLE `c_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `l_type`
--
ALTER TABLE `l_type`
  MODIFY `l_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `processing_system`
--
ALTER TABLE `processing_system`
  MODIFY `PS_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `p_size`
--
ALTER TABLE `p_size`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transmit`
--
ALTER TABLE `transmit`
  MODIFY `transmit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transmit_type`
--
ALTER TABLE `transmit_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_c_address`) REFERENCES `c_address` (`address_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_location`) REFERENCES `locations` (`location_id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`fk_package`) REFERENCES `packages` (`package_id`),
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`fk_l_type`) REFERENCES `l_type` (`l_type_id`);

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`fk_transmit`) REFERENCES `transmit` (`transmit_id`),
  ADD CONSTRAINT `packages_ibfk_2` FOREIGN KEY (`fk_p_size`) REFERENCES `p_size` (`size_id`);

--
-- Constraints for table `processing_system`
--
ALTER TABLE `processing_system`
  ADD CONSTRAINT `processing_system_ibfk_1` FOREIGN KEY (`fk_emp`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `transmit`
--
ALTER TABLE `transmit`
  ADD CONSTRAINT `transmit_ibfk_1` FOREIGN KEY (`fk_customer`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `transmit_ibfk_2` FOREIGN KEY (`fk_transmit_type`) REFERENCES `transmit_type` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
