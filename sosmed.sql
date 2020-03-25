-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 25, 2020 at 12:10 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sosmed`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `commentID` int(45) NOT NULL,
  `content` varchar(255) NOT NULL,
  `username` varchar(45) NOT NULL,
  `postID` varchar(45) NOT NULL,
  `timestamp` varchar(100) DEFAULT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentID`, `content`, `username`, `postID`, `timestamp`, `picture`) VALUES
(44, 'hei', 'admin', '52', '03:17 pm', 'https://i.imgur.com/2W7QVhD.jpeg'),
(43, 'g', 'admin', '50', '02:57 pm', 'https://i.imgur.com/2W7QVhD.jpeg'),
(40, 'bruh', 'derp', '48', '02:21 pm', 'https://i.imgur.com/tCFGjLe.png'),
(41, 'test', 'derp', '53', '02:22 pm', 'https://i.imgur.com/tCFGjLe.png'),
(39, 'bruh', 'derp', '53', '02:21 pm', 'https://i.imgur.com/tCFGjLe.png'),
(38, 'bruh', 'derp', '53', '02:21 pm', 'https://i.imgur.com/tCFGjLe.png'),
(36, 'nice\r\n', 'derp', '52', '02:20 pm', 'https://i.imgur.com/tCFGjLe.png'),
(37, 'testing', 'derp', '52', '02:20 pm', 'https://i.imgur.com/tCFGjLe.png');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `postID` int(45) NOT NULL,
  `content` varchar(255) NOT NULL,
  `username` varchar(45) NOT NULL,
  `timestamp` varchar(100) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `photos` varchar(1000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`postID`, `content`, `username`, `timestamp`, `picture`, `photos`) VALUES
(59, 'test', 'admin', '03:14 pm', 'https://i.imgur.com/2W7QVhD.jpeg', NULL),
(61, 'nothing here', 'admin', '03:17 pm', 'https://i.imgur.com/2W7QVhD.jpeg', NULL),
(62, 'nothing here', 'admin', '03:25 pm', 'https://i.imgur.com/2W7QVhD.jpeg', NULL),
(50, 'test', 'derp', '01:12 pm', 'https://i.imgur.com/tCFGjLe.png', NULL),
(51, 'Hello', 'derp', '01:12 pm', 'https://i.imgur.com/tCFGjLe.png', NULL),
(52, 'diahfau', 'derp', '01:12 pm', 'https://i.imgur.com/tCFGjLe.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `username_fk` varchar(45) NOT NULL,
  `skills` varchar(45) NOT NULL,
  `percent` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`username_fk`, `skills`, `percent`) VALUES
('derp', 'fdafsafdsa', 63),
('derp', 'Sotosop', 100);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `bdate` date NOT NULL,
  `phonenum` int(100) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `profilePicturePath` varchar(255) DEFAULT NULL,
  `coverPath` varchar(255) DEFAULT NULL,
  `contact` varchar(45) NOT NULL,
  `userdesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `firstName`, `lastName`, `password`, `bdate`, `phonenum`, `gender`, `profilePicturePath`, `coverPath`, `contact`, `userdesc`) VALUES
('admin', 'M. Ihsan', '', 'e10adc3949ba59abbe56e057f20f883e', '2020-03-05', 84949941, 'M', 'https://i.imgur.com/2W7QVhD.jpeg', 'https://i.imgur.com/0LIRXej.png', '', 'Hello World 123'),
('derp', 'derpsyt', 'lastDerp', '58fd9edd83341c29f1aebba81c31e257', '2000-04-11', 34648616, 'M', 'https://i.imgur.com/tCFGjLe.png', 'https://i.imgur.com/h72mp1V.jpeg', 'derp@gmail.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `fkIdx_27` (`username`),
  ADD KEY `fkIdx_30` (`postID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `fkIdx_20` (`username`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD KEY `username_fk` (`username_fk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `commentID` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `postID` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`username_fk`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
