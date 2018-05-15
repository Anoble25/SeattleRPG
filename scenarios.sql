-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 15, 2018 at 05:49 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seattle_rpg`
--

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
(1, 'Dream Job', 'You got your dream job offer!', 'Decline', 'Keep on dreaming! \r\n-1 to mood.', 0, 0, -1, 'Random', 'You got a your dream job with a relocation bonus! +2 to health. +500 to money. +10 to mood.', 2, 500, 10, 'Accept', '\"Yay!\"', 0, 1000, 8),
(2, '\"Uninteresting Job\"', '\"You got a offer from a company you would rather not work for\"', '\"\"Decline the offer and wait for your dream job\"\"', '\"Hopefully you get your dream job [Health = 0, Money = 0, Mood = -3]\"', 0, 0, -3, '\"Accept Offer\"', '\"You got the job! [Health = 0, Money = 325, Mood = 15]\"', 0, 325, 15, '\"Tell them you will accept the job offer if they pay you a little more\"', '\"Hey maybe this is better than your dream job! [Health = 0, Money = 1100, Mood = 20]\"', 0, 1100, 20),
(3, '\"Gift from Grandparents\"', '“Grandparents sent you $1,000!”', '“Tell them thanks but no thanks and return the check”', '\"That was nice of you, but you may be running out of money soon [Health = 0, Money = 0, Mood = 2]\"', 0, 0, 2, '“Random”', '\"Nice $$$! [Health = 0, Money = 1000, Mood = 15]\"', 0, 1000, 30, '“Send them a thank you card”', '\"Postage was .25 cents [Health = 0, Money = 1000, Mood = 5]\"', 0, 1000, 20),
(4, '\"Letter from apartments\"', '\"You got a letter from your apartment with three check marks with no description but you can only select one\"', 'Option 1', '\"You just got 1 free month of rent for next month [Health = 0, Money = 0, Mood = 30]\"', 0, 0, 30, 'Option 2', '\"Your invited to free breakfast in the community room [Health = -5, Money = 0, Mood = 5]\"', -5, 0, 5, 'Option 3', '\"You forgot to pay your deposit and we aren\'t going to waive it [Health = 0, Money = -500, Mood = -20]\"', 0, -500, -20),
(5, '\"Hungry and need to eat\"', '“You are hungry and need to eat”', '\"Eat a free meal at parents house\"', '\"Might not have been the best option because you still had to pay for the bus but at least you got to visit family [Health = 3, Money = -3.25, Mood = 1]\"', 3, -3, 1, '\"Buy groceries and cook at home\"', '\"Well this is a cheap meal, you just had to buy some groceries [Health = 5, Money = -5, Mood = 1]\"', 5, -5, 1, '\"Go out to eat\"', '\"That was expensive... oops [Health = 10, Money = -32.75, Mood = 20]\"', 10, -33, 20),
(6, '\"Date Night\"', '\"You have a date!\"', 'Dinner and a Movie', '\"The dinner and movie went great and have another date set [Health = 3, Money = -75.12, Mood = 50]\"', 3, -75, 50, '\"Netflix and Dinner at home(Groceries will be around $15)\"', '\"Date was great [Health = 15, Money = -16.47, Mood = 80]\"', 15, -16, 80, '\"Fancy restaurant\"', '\"Your date stood you up, and didn\'t show. You feel depressed and lonely, at least the bottle of wine that you ordered while waiting was good [Health = -15, Money = -207.56, Mood = -60]\"', -15, -208, -60),
(7, '\"Travel to Interview\"', '“You are traveling to a job interview”', '\"Bike to the interview\"', '\"Good, no money spent and health increased [Health = 8, Money = 0, Mood = 15]\"', 8, 0, 15, '\"Take the bus for $3.25\"', '\"At least it\'s quicker than biking [Health = 0, Money = -3.25, Mood = -1]\"', 0, -3, -1, '“Drive and spend $7 in gas”', '\"That was quick but traffic sucked.. and your lazy [Health = -2, Money = -7, Mood = -13]\"', -2, -7, -13),
(8, '\"Happy Hour with friends\"', '“Your friends are going out to happy hour”', '“Suggest getting free beer at work”', '\"Yay, no money... free buzz [Health = -7, Money = 0, Mood = 10]\"', -7, 0, 10, '\"Home\"', '\"You went home because you were tired. Bus was 3.25 though [Health = 0, Money = -3.25, Mood = 5]\"', 0, -3, 5, '“Buy several drinks and dinner”', '\"Yikes, that was a bad idea.... you ended up drunk and bought everyone food and drinks [Health = -18, Money = -375, Mood = -15]\"', -18, -375, -15),
(9, '\"Moms Birthday\"', '“It’s your mom’s birthday”', '“Send a text or call”', '\"She was glad to hear from you [Health = 0, Money = 0, Mood = 5]\"', 0, 0, 5, '\"Send a card in the mail\"', '\"That\'s nice of you. postage for the card is 25 cents [Health = 0, Money = -0.25, Mood = 5]\"', 0, 0, 5, '“Buy her a gift”', '\"Your her favorite [Health = 0, Money = -15, Mood = 30]\"', 0, -15, 30),
(10, '\"Slept In\"', '“You have slept in until the afternoon, losing half a day”', '\"Oops, I think I\'ll sleep some more\"', '\"There are probably more productive things to do... just saying [Health = -2, Money = 0, Mood = -3]\"', -2, 0, -3, '\"Apply for jobs\"', '\"You have an interview tomorrow [Health = 2, Money = 0, Mood = 5]\"', 0, 0, 5, '“Hang out with friends”', '\"That was a good afternoon, but you should have been applying for jobs [Health = 0, Money = 0, Mood = 7]\"', 0, 0, 7),
(11, '\"Parking Ticket\"', '“You wake up with a $75 parking ticket on your dashboard”', '\"Pay it right away\"', '\"Ticket paid for $75 [Health = -1, Money = -75, Mood = -15]\"', -1, -75, -15, '\"Ignore ticket. Refuse to pay it\"', '\"You wait three weeks then decide to pay because you don\'t want your license suspended. You pay the original fee plus a $20 late fee. It costs $95 total [Health = -1, Money = -95, Mood = -23]\"', -1, -95, -23, '\"Fight ticket in court\"', '\"You fight the ticket and win. Your fees are $30 [Health = -1, Money = -30, Mood = 2]\"', -1, -30, 2),
(12, '\"Lost Wallet\"', '“You lost your wallet and now have no cash or any way of withdrawing money”', '\"Look around apartment\"', '\"You find it, but are stressed after looking for it [Health = -5, Money = 0, Mood = -2]\"', -5, 0, -2, '\"Check the restaurant you were at last night\"', '\"\"Well it was actually at home, and the ferry you took to the bar was $7 that you loaned from a friend [Health = -1, Money = -7, Mood = -9]\"', -1, -7, -9, '\"Go to your friends house that you partied with some time recently\"', '\"\"Well they haven\'t seen it, because you left it at home. that was a 30 minute bike ride [Health = 20, Money = 0, Mood = 0]\"', 20, 0, 0),
(13, '\"Lost card and hungry\"', '“Your debit card has expired and you have to wait to get a new card in mail and need to eat”', '“Ask parents for money, but that is a half day trip to their house on bike\"', '\"They give you $50 [Health = 40, Money = 50, Mood = 2]\"', 40, 50, 2, '“Do yard work for a neighbor, therefore delaying your job search by a day and decreasing your mood.”', '\"You got paid $20 [Health = 10, Money = 20, Mood = -1]\"', 10, 20, -1, '\"Use android app to pay for food\"', '\"You used your phone to buy a bacon burger [Health = -1, Money = -9.75, Mood = 5]\"', -1, -10, 5),
(14, '\"Car broke down\"', '“Your car broke down on your way to your interview”', '“Have it towed to the shop to get fixed\"', '\"Tow $75, Repairs $697 [Health = 0, Money = -772, Mood = -50]\"', 0, -772, -50, '“Car parents for advise”', '\"Your parents bought you a new car and the junk yard towed and took your old car for free [Health = 1, Money = 0, Mood = 100]\"', 1, 0, 100, '\"Push it somewhere and abandon it\"', '\"The city towed your car and fined you for leaving it in a two hour spot for several days [Health = 0, Money = -700, Mood = -60]\"', 0, -700, -60),
(15, '\"House on fire\"', '\"Your house is on fire\"', '“Stay at parents\"', '\"You are relieved that at least you have a place to stay [Health = -5, Money = 0, Mood = -5]\"', -5, 0, -5, '\"Car renters insurance company\"', '\"They have decided to give you $700 [Health = 0, Money = 700, Mood = 60]\"', 0, 700, 60, '\"Become homeless\"', '\"You are now living at the local homeless shelter [Health = -30, Money = 0, Mood = -60]\"', -30, 0, -60),
(16, '\"Talking to the homeless\"', '\"You are walking to a bookstore -- suddenly a wild bearded man in tattered clothes approaches from the side. \'Excuse me... All I need is $1 for food.\' Theres a crazy look in his eye\"', 'Its only a dollar (-$1)', '\"The man blesses you and departs gleefully with your change. There is a warm feeling in your heart. +10 Mood [Health = 0, Money = -1, Mood = 10]\"', 0, -1, 10, '\"Ignore him\"', '\"Pretending he isn\'t there, you continue to the bookstore. \"He will find a dollar somewhere else\" you think to yourself. There is a cold feeling in your heart. [Health = 0, Money = 0, Mood = -10]\"', 0, 0, -10, '\"Stop plaguing my city, freak!\"', '\"You wake up in a hospital [Health = -50, Money = -700, Mood = -50]\"', -50, -700, -50);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
