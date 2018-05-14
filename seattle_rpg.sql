-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 14, 2018 at 08:24 PM
-- Server version: 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seattle_rpg`
--
CREATE DATABASE IF NOT EXISTS `seattle_rpg` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `seattle_rpg`;

-- --------------------------------------------------------

--
-- Table structure for table `scenarios`
--

CREATE TABLE `scenarios` (
  `id` int(11) NOT NULL,
  `scenario_name` varchar(255) NOT NULL,
  `prompt_text` varchar(255) NOT NULL,
  `opt_1_choice_text` varchar(255) NOT NULL,
  `opt_1_result_text` varchar(255) NOT NULL,
  `option_1_health_effect` varchar(255) NOT NULL,
  `opt_1_money_effect` varchar(255) NOT NULL,
  `opt_1_mood_effect` varchar(255) NOT NULL,
  `opt_2_choice_text` varchar(255) NOT NULL,
  `opt_2_result_text` varchar(255) NOT NULL,
  `opt_2_health` varchar(255) NOT NULL,
  `opt_2_money` varchar(255) NOT NULL,
  `opt_2_mood` varchar(255) NOT NULL,
  `opt_3_choice_text` varchar(255) NOT NULL,
  `opt_3_result_text` varchar(255) NOT NULL,
  `opt_3_money` varchar(255) NOT NULL,
  `opt_3_mood` varchar(255) NOT NULL,
  `opt_3_health` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `scenarios`
--
ALTER TABLE `scenarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `scenarios`
--
ALTER TABLE `scenarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
