-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2019 at 08:10 PM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `start`
--

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_gps_data`
--

CREATE TABLE IF NOT EXISTS `vehicle_gps_data` (
  `Vehicle_GPS_Data_Id` int(4) NOT NULL,
  `Vehicle_Id` int(4) NOT NULL,
  `Lat` text,
  `Log` text,
  `Location_Time` time DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_gps_data`
--

INSERT INTO `vehicle_gps_data` (`Vehicle_GPS_Data_Id`, `Vehicle_Id`, `Lat`, `Log`, `Location_Time`) VALUES
(1, 1, '28.629701', '77.212722', '00:00:00'),
(6, 1, '41.40338000', '2.17403000', '03:14:07'),
(7, 1, '41.40338100', '2.17403100', '03:16:07'),
(8, 1, '41.40338300', '2.17403300', '03:18:07'),
(9, 1, '41.40338000', '2.17403000', '03:14:07'),
(10, 2, '28.50352620', '77.04954680', '08:14:07'),
(11, 2, '28.50352820', '77.04954880', '08:16:07'),
(12, 2, '28.50352840', '77.04954990', '08:18:07'),
(13, 2, '28.50353020', '77.04955080', '08:20:07'),
(14, 3, '28.45950120', '77.02444960', '12:14:07'),
(15, 3, '28.45952120', '77.02445060', '12:16:07'),
(16, 3, '28.45950124', '77.02444964', '12:18:07'),
(17, 3, '28.45950128', '77.02444968', '12:20:07'),
(18, 4, '28.45061690', '77.00795400', '14:14:07'),
(19, 4, '28.45061694', '77.00795404', '14:16:07'),
(20, 4, '28.45061698', '77.00795408', '14:18:07'),
(21, 4, '28.45061702', '77.00795412', '14:20:07'),
(22, 5, '28.31741100', '76.91370330', '20:14:07'),
(23, 5, '28.31741104', '76.91370334', '20:16:07'),
(24, 5, '28.31741108', '76.91370338', '20:18:07'),
(25, 5, '28.31741112', '76.91370342', '20:20:07'),
(26, 1, '28.629768', '77.212867', '00:00:00'),
(27, 1, '28.629768', '77.212867', '00:00:00'),
(28, 1, '28.629768', '77.212867', '00:00:00'),
(29, 1, '28.629843', '77.213016', '00:00:00'),
(30, 1, '28.629989', '77.213394', '00:00:00'),
(31, 1, '28.630163', '77.213751', '00:00:00'),
(32, 1, '28.630315', '77.214094', '00:00:00'),
(33, 1, '28.630461', '77.214418', '00:00:00'),
(34, 1, '28.630633', '77.214777', '00:00:00'),
(35, 1, '28.630824', '77.215206', '00:00:00'),
(36, 1, '28.631069', '77.212867', '00:00:00'),
(37, 1, '28.631180', '77.216017', '00:00:00'),
(38, 1, '28.631347', '77.216328', '00:00:00'),
(39, 1, '28.631523', '77.216628', '00:00:00'),
(40, 1, '28.629768', '77.212867', '00:00:00'),
(41, 1, '28.629768', '77.212867', '00:00:00'),
(42, 1, '28.629768', '77.212867', '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_master`
--

CREATE TABLE IF NOT EXISTS `vehicle_master` (
  `Vehicle_Id` int(4) NOT NULL,
  `Vehicle_No` varchar(40) DEFAULT NULL,
  `Vehicle_Desc` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_master`
--

INSERT INTO `vehicle_master` (`Vehicle_Id`, `Vehicle_No`, `Vehicle_Desc`) VALUES
(1, 'WAUFFAFM3CA000000', 'Mercedes'),
(2, 'JH4TB2H26CC000000', 'Chrysler'),
(3, '1GNEK13ZX3R298984', 'Honda'),
(4, '1GNEK13Z6CC000000', 'Ecosport'),
(5, 'JAUFFAFM3CC000000', 'Chevrolet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vehicle_gps_data`
--
ALTER TABLE `vehicle_gps_data`
  ADD PRIMARY KEY (`Vehicle_GPS_Data_Id`),
  ADD KEY `Vehicle_Id_fk` (`Vehicle_Id`);

--
-- Indexes for table `vehicle_master`
--
ALTER TABLE `vehicle_master`
  ADD PRIMARY KEY (`Vehicle_Id`),
  ADD UNIQUE KEY `Vehicle_No` (`Vehicle_No`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vehicle_gps_data`
--
ALTER TABLE `vehicle_gps_data`
  MODIFY `Vehicle_GPS_Data_Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `vehicle_gps_data`
--
ALTER TABLE `vehicle_gps_data`
  ADD CONSTRAINT `Vehicle_Id_fk` FOREIGN KEY (`Vehicle_Id`) REFERENCES `vehicle_master` (`Vehicle_Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
