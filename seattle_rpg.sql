-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 14, 2018 at 11:12 PM
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
  `opt_1_health` int(11) NOT NULL,
  `opt_1_money` int(11) NOT NULL,
  `opt_1_mood` int(11) NOT NULL,
  `opt_2_choice_text` varchar(255) NOT NULL,
  `opt_2_result_text` varchar(255) NOT NULL,
  `opt_2_health` int(11) NOT NULL,
  `opt_2_money` int(11) NOT NULL,
  `opt_2_mood` int(11) NOT NULL,
  `opt_3_choice_text` varchar(255) NOT NULL,
  `opt_3_result_text` varchar(255) NOT NULL,
  `opt_3_health` int(11) NOT NULL,
  `opt_3_money` int(11) NOT NULL,
  `opt_3_mood` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scenarios`
--

INSERT INTO `scenarios` (`id`, `scenario_name`, `prompt_text`, `opt_1_choice_text`, `opt_1_result_text`, `opt_1_health`, `opt_1_money`, `opt_1_mood`, `opt_2_choice_text`, `opt_2_result_text`, `opt_2_health`, `opt_2_money`, `opt_2_mood`, `opt_3_choice_text`, `opt_3_result_text`, `opt_3_health`, `opt_3_money`, `opt_3_mood`) VALUES
(1, 'Dream Job', 'You got your dream job offer!', 'Decline', 'Keep on dreaming! \r\n-1 to mood.', 0, 0, -1, 'Random', 'You got a your dream job with a relocation bonus! +2 to health. +500 to money. +10 to mood.', 2, 500, 10, 'Accept', '\"Yay!\"', 0, 1000, 8);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
