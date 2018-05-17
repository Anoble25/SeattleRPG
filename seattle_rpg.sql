-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 17, 2018 at 09:58 PM
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
-- Table structure for table `current_player`
--

CREATE TABLE `current_player` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `health` int(11) NOT NULL,
  `mood` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `previous_choice` int(11) NOT NULL,
  `previous_scenario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `current_player`
--

INSERT INTO `current_player` (`id`, `name`, `health`, `mood`, `money`, `previous_choice`, `previous_scenario_id`) VALUES
(0, 'Justin', 83, 527, 4890, 3, 45);

-- --------------------------------------------------------

--
-- Table structure for table `high_score`
--

CREATE TABLE `high_score` (
  `id` int(11) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `high_score`
--

INSERT INTO `high_score` (`id`, `player_name`, `score`) VALUES
(62, 'Justin', 4890);

-- --------------------------------------------------------

--
-- Table structure for table `scenarios`
--

CREATE TABLE `scenarios` (
  `id` int(11) NOT NULL,
  `scenario_name` varchar(255) NOT NULL,
  `prompt_text` varchar(255) NOT NULL,
  `opt_1_choice_text` varchar(455) NOT NULL,
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
  `opt_3_mood` int(11) NOT NULL,
  `src` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scenarios`
--

INSERT INTO `scenarios` (`id`, `scenario_name`, `prompt_text`, `opt_1_choice_text`, `opt_1_result_text`, `opt_1_health`, `opt_1_money`, `opt_1_mood`, `opt_2_choice_text`, `opt_2_result_text`, `opt_2_health`, `opt_2_money`, `opt_2_mood`, `opt_3_choice_text`, `opt_3_result_text`, `opt_3_health`, `opt_3_money`, `opt_3_mood`, `src`) VALUES
(1, 'Dream Job', 'RING RING! A recruiter has offered you a full day website gig from a big tech company! It will be hard work, but could pay off', 'Decline', 'You feel you passed on a good opportunity. But nothing beats a day off +5 HP -5 Mood ', 5, 0, -5, 'Accept', 'The website took forever to build. You may have lost a few years off your life, but hey, money -25 HP +$500 -10 Mood', -25, 500, -10, 'Negotiate for higher pay', 'The recruiter is disgusted by your greed and hangs up the phone. You feel gross. -15 Mood', 0, 0, -15, 'dreamjob.jpg'),
(2, 'Uninteresting Job', 'RING RING! A man coughs on the phone. You got an offer from a company you would rather not work for', 'Decline the offer and wait for your dream job', 'Hopefully someday you will get your dream job. You spend the day imagining what that would be like +5 HP +5 Mood', 5, 0, 5, 'Accept Offer', 'You got the job! It paid decently, but you hated every second of it. -10 HP +$325 -20 Mood', -10, 325, -20, 'Negotiate for higher pay', 'The man coughs violently, but admits they are desperate. Hey maybe this is better than your dream job! +$900 +20 Mood', 0, 900, 20, 'boringjob.jpg'),
(3, 'Gift from Grandparents', 'Grandparents sent you $350! Awesome! But you know they are struggling financially', 'Tell them thanks but no thanks and return the check', 'That was nice of you, but you may be running out of money soon. Still, you feel like a saint. +20 Mood', 0, 0, 20, 'Accept the generous offer', 'You feel a bit dirty for accepting money they need, but someday you will pay them back... right? +$350, -10 Mood', 0, 350, -10, 'Send them a thank you card', 'Postage was five dollars ( includes $5 Seattle Postage Tax). You feel they will appreciate your quick response +$340, +10 Mood', 0, 340, 10, 'grandparentsgift.jpeg'),
(4, 'Letter from apartments', 'You got 3 letters in the mailbox today with no description. You only have time to open one, because you have plans today and are in a hurry ', 'Open Letter #1', 'Its a heart warming letter from your parents. It puts you in a great mood and now feel motivated. +30 Mood', 0, 0, 30, 'Open Letter #2', 'You are invited to a free breakfast in the community room of your apartment complex +15 HP +15 Mood', 15, 0, 15, 'Open Letter #3', 'You forgot to pay your deposit and we aren\'t going to waive it\'. The rest of your day is ruined. -$500 -30 Mood', 0, -500, -30, 'apartmentletter.png'),
(5, 'Hunger Pains', 'You are hungry, there might be top ramen in a drawer somewhere', 'Eat at a friends (-$15)', 'May not be the best option but at least you got to visit a friend. You took the bus and paid half for a meal. +10 HP -$15 +10 Mood ', 10, -15, 10, 'Buy groceries and eat at home ( $100 )', 'You buy groceries and cook a meal at home. You feel like an adult. +25 HP -$100 +5 Mood', 25, -100, 5, 'Go out to eat ($20)', 'This was expensive, but you\'re happy eating a decent meal. +10 HP -$20 +10 Mood', 10, -20, 10, 'hungry.jpg'),
(6, 'Date Night', 'You have a date! Where will you go?', 'Decent Restaurant and movie after ( -$75 )', 'It was a pretty average night, but your date had a great time! You\'re looking forward to the second date! +10 HP -$75 +20 Mood ', 10, -75, 20, 'Cook dinner at home (-$25)', 'Netflix and dinner at home... Nothing really happened, but your date appreciated the cooking. Also you have leftovers that will hold you over for a few days. +20 HP +5 Mood', 20, 0, 5, 'Explain you\'re on a budget to pay rent, but offer to meet at the park.', 'Your date stood you up, and didn\'t show. Maybe save that information for your 2nd date... or not at all -40 Mood', 0, 0, -40, 'datenight.jpeg'),
(7, 'Travel to Interview', 'You are traveling to a job interview', 'Bike to the interview', 'Good, no money spent and health increased +8 HP +15 Mood', 8, 0, 15, 'Take the bus (-$4)', 'Another passenger farted on you on the bus while getting up. Kinda ruined the mood, and your sense of smell. You thought about that fart during your interview and did not do well. -$4 -15 Mood', 0, -4, -15, 'Drive and spend gas (-$20)', 'That was quick but traffic sucked.. At least you feel good about the interview. -10 HP -$20 +10 Mood', -10, -20, 10, 'transportation.jpeg'),
(8, 'Happy Hour with friends', 'Your friends are going out to happy hour', 'Suggest getting free beer at work', 'Yay, no money... free buzz [Health = -7, Money = 0, Mood = 10]', -7, 0, 10, 'Home', 'You went home because you were tired. Bus was 3.25 though [Health = 0, Money = -3.25, Mood = 5]', 0, -3, 5, 'Buy several drinks and dinner', 'Yikes, that was a bad idea.... you ended up drunk and bought everyone food and drinks [Health = -18, Money = -375, Mood = -15]', -18, -375, -15, 'happyhour.jpeg'),
(9, 'Moms Birthday', 'It’s your mom’s birthday', 'Send a text or call', 'She was glad to hear from you +5 Mood', 0, 0, 5, 'Send a card in the mail (-$10)', 'That was nice of you. Postage and the card was $10. She later calls you and thanks you for the sweet gesture. -$10 +15', 0, 0, 15, 'Buy her a gift  (-$50)', 'You are her favorite -$50 +30 Mood', 0, -50, 30, 'mombirthday.jpeg'),
(10, 'Slept In', 'You have slept in until the afternoon, losing half a day', 'Oops, I think I\'ll sleep some more', 'You feel well rested but there are probably more productive things to do... just saying +15 HP -10 Mood', 15, 0, -10, 'Apply for jobs', 'You spent the whole day in front of a computer applying for jobs, which was pretty dreaming. But you have an interview tomorrow! -15 HP +20 Mood', -15, 0, 20, 'Hang out with friends', 'You had a fun afternoon +10 Mood', 0, 0, 10, 'sleptin.gif'),
(11, 'Parking Ticket', 'You wake up with a $75 parking ticket on your dashboard', 'Pay it right away (-$75)', 'Ticket paid for -$75', 0, -75, 0, 'Ignore ticket. Refuse to pay it', 'You wait three weeks then decide to pay because you don\'t want your license suspended. You pay the original fee plus a $20 late fee. It costs $95 total -$95 -25 Mood', 0, -95, -25, 'Fight ticket in court ', 'You fight the ticket and win. Your fees are $30 but you feel good about yourself for fighting -$30 +10 Mood', 0, -30, 10, 'parkingticket.jpg'),
(12, 'Lost Wallet', 'You lost your wallet and now have no cash or any way of withdrawing money', 'Look around apartment', 'You found it! You\'re so relieved! Also you found $20 in your jacket while looking for it +$20', 0, 20, 20, 'Check the restaurant you were at last night', 'Well it was actually at home, and the ferry you took to the bar was $7 that you loaned from a friend [Health = -1, Money = -7, Mood = -9]', -1, -7, -9, 'Go to your friends house that you partied with some time recently', 'Well they haven\'t seen it, because you left it at home. that was a 30 minute bike ride [Health = 20, Money = 0, Mood = 0]', 20, 0, 0, 'lostwallet.jpg'),
(13, 'Lost card and hungry', 'Your debit card has expired and you have to wait to get a new card in mail and need to eat', 'Ask parents for money, but that is a half day trip to their house on bike', 'They give you $50 [Health = 40, Money = 50, Mood = 2]', 40, 50, 2, 'Do yard work for a neighbor, therefore delaying your job search by a day and decreasing your mood.', 'You got paid $20 [Health = 10, Money = 20, Mood = -1]', 10, 20, -1, 'Use android app to pay for food', 'You used your phone to buy a bacon burger [Health = -1, Money = -9.75, Mood = 5]', -1, -10, 5, 'lostcard.jpg'),
(14, 'Car broke down', 'Your car broke down on your way to your interview', 'Have it towed to the shop to get fixed', 'Tow $75, Repairs $697 [Health = 0, Money = -772, Mood = -50]', 0, -772, -50, 'Car parents for advise', 'Your parents bought you a new car and the junk yard towed and took your old car for free [Health = 1, Money = 0, Mood = 100]', 1, 0, 100, 'Push it somewhere and abandon it', 'The city towed your car and fined you for leaving it in a two hour spot for several days [Health = 0, Money = -700, Mood = -60]', 0, -700, -60, 'carbroke.jpg'),
(15, 'House on fire', 'Uh oh. Your house is on fire', 'Stay at parents', 'You are relieved that at least you have a place to stay [Health = -5, Money = 0, Mood = -5]', -5, 0, -5, 'Attempt to douse the flames', 'You\'ve been severely burned, but managed to save your stuff. The fire was started from a neighbor cat and insurance has compensated you. -35 HP +$700 +10 Mood', -35, 700, 10, 'Meh', 'This was the last straw and you\'ve given up. Maybe Dreams are for chumps. -50 HP -50 Mood ', -50, 0, -50, 'houseonfire.jpg'),
(16, 'Talking to the homeless', 'You are walking to a bookstore -- suddenly a wild bearded man in tattered clothes approaches from the side. \'Excuse me... All I need is $1 for food.\' Theres a crazy look in his eye', 'Its only a dollar', 'The man blesses you and departs gleefully with your change. There is a warm feeling in your heart. +10 Mood [Health = 0, Money = -1, Mood = 10]', 0, -1, 10, 'Ignore him', 'Pretending he isn\'t there, you continue to the bookstore. \"He will find a dollar somewhere else\" you think to yourself. There is a cold feeling in your heart. [Health = 0, Money = 0, Mood = -10]', 0, 0, -10, 'Stop plaguing my city, freak!', 'The man is enraged. That\'s not good. He pulls a diseased dagger from pants and stabs you, then steals $100. Later the Hospital will charge you $500 for an ambulance and $100 for a tetanus shot. You\'re lucky to be alive. -50 HP -$700 Money -50 Mood ', -50, -700, -50, 'crazyman.jpg'),
(17, 'Student Loans', 'You owe money for your student loan this month', 'Pay amount due ($125)', 'Thank you for your patronage -$125 -10 Mood', 0, -125, -10, 'Ignore payment', 'You forgot you setup Autopay, so they\'re going to take out money anyway. College isnt paying off is it? -$125 -20 Mood', 0, -125, -20, 'Call and ask if you can pay at a later date', 'Unfortunately they won\'t allow that because you waited so long to call. They will reduce it by half this time around though. -$75', 0, -75, 0, 'studentloans.jpg'),
(18, 'Freemont Troll Bridge', 'Today you\'re feeling lucky! You go on a jog near freemont and enjoy the sunshine. Passing under a bridge, you look to the side and notice a giant inanimate rock troll underneath the \"bridge. You could swear you saw him wink at you.', 'Crumple up twenty dollars and put it underneath his giant palm', 'This troll has no need for money, but is impressed by your impulsiveness to help others. You feel the troll\'s gratitude surround you and it lifts your spirits [Health = 0, Money = -20, Mood = 30]', 0, -20, 30, 'Jump on the trolls back and do push-ups', 'The troll is confused, but impressed by your bravery. Also you really worked up a sweat... [Health = 10, Money =0 , Mood = 10]', 10, 0, 10, 'Make a wish', '', 0, 100, 30, 'trollbridge.jpg'),
(19, 'New Roomate', 'Your friend want\'s to become roommates', 'Say yes, I am almost due on rent', 'Great they owe you $500 for rent [Health = 0, Money = 500, Mood = 50]', 0, 500, 50, 'Say no, sorry', 'That is okay\" [Health = 0, Money = 0 , Mood = -2]', 0, 0, -2, 'Say sure, but you only need to pay half today', 'Well, okay sure but you could have had more money. [Health = 1, Money = 250, Mood = 20]', 1, 250, 20, 'newroomate.jpeg'),
(20, 'Car Loan', 'You owe money on your car loan', 'Pay Imediately', 'Done [Health = 0, Money = 500, Mood = 50]', 0, 500, 50, 'Say no, sorry', 'That is okay\" [Health = 0, Money = -120 , Mood = -20]', 0, -120, -20, 'Nah, I\'ll pay it later', 'You called and they said they will give you another 3 weeks to pay without any fees [Health = 0, Money = 0, Mood = 2]', 0, 0, 2, 'carloan.png'),
(21, 'Walk in the park', 'You found $40 on the ground during your walk through the park', 'Pick it up', 'Great let\'s put that in savings [Health = 0, Money = 40, Mood = 10]', 0, 40, 10, 'Leave it', 'Someone later gives you $50 just because [Health = 0, Money = 50 , Mood = 30]', 0, 50, 30, 'I do not notice such things', 'Karma? [Health = 0, Money = 0, Mood = -20]', 0, 0, -20, 'walkinpark.jpeg'),
(22, 'Late for Interview', 'You are late to your interview', 'Still show up quickly', 'You got the job, because all the other candidates showed up hung over [Health = 0, Money = 500, Mood = 100]', 0, 500, 100, 'Show up but take your time', 'Luckily even even though the interviewer had another appointment, they still decided to interview you, Well it helps when the next person doesn\'t show. [Health = 0, Money = 500 , Mood = 60]', 0, 500, 60, 'Well, I might as well not go', 'You decided to get drunk with your friends [Health = -40, Money = -75, Mood = 5]', -40, -75, 5, 'late.jpg'),
(23, 'Lottery Machine', 'Play Lottery', 'Buy $20 Ticket', 'You lost, better luck next time [Health = 0, Money = -20, Mood = -10]', 0, -20, -10, 'Buy $10 Ticket', 'You won $60 [Health = 0, Money = 60 , Mood = 20]', 0, 60, 20, 'Buy $30 Ticket', 'You won $80 [Health = 0, Money = 75, Mood = 20]', 0, 75, 20, 'lottery.jpg'),
(24, 'New Shoes', 'You need new shoes', 'Buy some cheap shoes from GoodWill', 'The shoes you just bought fell apart later in the afternoon and you decided to buy another pair at Nordstrom [Health = -1, Money = -95, Mood = -5]', -1, -95, -5, 'Buy a pair of shoes at Sears', 'Lucky you, found a pair on sale\" [Health = 2, Money = -40 , Mood = 15]', 2, -40, 15, 'I will just wear my flip flops everywhere since it is summer', 'Well, maybe not ideal. But probably should buy something before winter. [Health = 0, Money = 0, Mood = -15]', 0, 0, -15, 'newshoes.jpg'),
(25, 'New career at Facebook', 'You got a job at Facebook. You highly suspect this is a dream...', 'Accept job ', 'Yep this was a dream. But you were sent $100 for participating in a survey last month... so theres that +$100 +10 Mood', 0, 100, 10, 'Decline Job', 'You wake, realizing indeed it was all a dream -- though you\'re a bit disappointed it was -10 Mood', 0, 0, -10, 'Ask for a raise', 'They don\'t give you a raise, but they do give you a nice pat on the back. You feel relaxed and happy... even when you wake up realizing it was a dream +20 HP +20 Mood', 20, 0, 20, 'newcareerfb.jpeg'),
(26, 'Nice Restaurant', 'You go out to a really beutiful restaurant', 'Order just a coffee', 'You kept it simple and cheap', 5, -5, 5, 'Order 3 course meal', 'You had the best meal ever and have leftovers for later', 20, -30, 30, 'Order soup and salad', 'You chose an in the middle decision and it paid off a lilttle more [Health = 10, Money = -10, Mood = 10]', 10, -10, 10, 'nicerest.jpg'),
(27, 'Ice Cream Binge', 'Its 10pm but never too late for an ice cream binge. You drive to an Ice cream shop to find they closed 5 minutes ago and upon turning around are approached by three hooded men. \'Can I use your phone? I need to make a call\'', 'Sure!', 'The hooded man snatches the phone and pushes you to the ground. All three of them run away laughing. Later you will cancel that phone and buy a cheap replacement. And all you wanted was ice cream. [Health = -20, Money = -$150, Mood = -25]', -20, -50, -25, 'Stand your ground and tell them no', 'The three hooded men attack, but you didn\'t go down without a fight. They beat you and steal $35. Although you feel some internal bleeding, you feel an odd satisfaction standing your ground [Health = -50, Money = -35, Mood = +30]', -50, -35, 30, 'Scream for help', 'Caught off guard, the three men scurry away. You are a little embarrassed how loud you screeched, but feel more alive survivng a close encounter! [Health = 10, Money = 0, Mood = -5]', 10, 0, -5, 'fights.jpeg'),
(28, 'Seattle Dog', 'It\'s night time and you\'re feeling quite hungry. Reading online, you find a Seattle HotDog stand nearby. When you get there, you suddenly remember a new HotDog Tax was just implemented -- and Hotdogs are now $25', 'YOLO ($-25)', 'The Seattle Dog was pretty good... but was it THAT good? +5 HP, -$25, +10 Mood ', 5, -25, 10, 'Eat Packaged Ramen at home', 'Your body hates you, but you\'re on a budget.  -5 HP -5 Mood', -5, 0, -5, 'Buy a soda and walk away. Tell the cashier his dogs are WAY to0 expensive ($5)', 'The cashier feels bad and agrees. He gives you a free dog with the soda. It tasted better than you expected. +10 HP -$5 +10 Mood', 10, -5, 10, 'goldenticket.jpg'),
(29, 'Part Time Job Offer', 'You have met up with a friend and he offers you a part time job to help out with bills', 'Decline', 'Okay you missing out on a great opputunity and paycheck', 0, 0, 0, 'Accept Job Offer', 'Congratz on your part time job at the pizza-ria', 0, 300, 20, 'Accept job with less hours', 'Congratz you have a job and time on your hands', 0, 200, 10, 'parttimejob.jpg'),
(30, 'Career at Microsoft', 'You have done such a good job at epicodus you have found an internship at Microsoft', 'Decline', 'You missed out on a great opportunity', 0, 0, -10, 'Accept Internship', 'Congrats!', 0, 200, 40, 'Accept Full Time Career', 'Awesome!', 0, 500, 50, 'internship.jpg'),
(31, 'Night Out', 'Your Friends are going out and they invite you to come with on a night a full activities', 'You decide not go to out and stay home and save money', 'Good decision you stayed home, saved money, and a little boring.', 0, 0, 0, 'You decide to go out and have the best night of your life', 'You had a great time, spent a lot of money, and woke up away from home', -10, -100, 20, 'You go out for a little while', 'You went out for a little with friends had a good time and was responsible', 10, -40, 10, 'goingout.jpg'),
(32, 'Hot Dog Stand', 'It\'s night time and you\'re feeling quite hungry. Reading online, you find a Seattle HotDog stand nearby. When you get there, you suddenly remember a new HotDog Tax was just implemented -- and Hotdogs are now $9', 'YOLO', 'The hot dog was pretty good', -7, -9, 15, 'Eat Top Ramen at home', 'Your body hates you but your on a budget', -15, 0, -5, 'Go to bed', 'You went to bed hungry but at least you didnt spend any money', -10, 0, -20, 'latenightsnack.jpg'),
(33, 'Casino Night', 'You and your friends are going out to the casino', 'Put $20 in Slots', 'You just won $700', -5, 680, 30, 'Put $20 on blackjack', 'You just won $5', -5, -15, -5, 'You put $20 on Roullete', 'You won $60', -5, 40, 8, 'casino.jpg'),
(34, 'Mothers Day', 'It\'s mothers day and you decide to go all out for your mother', 'You buy Edible arrangement, tickets to pink concert, and candlelight dinner for you parents at pink door.', 'Great job on celebrating mothers day for you mom you mood goes up but your pockets become lighter', 10, 80, 26, 'You forgot about mothers day', 'Your mom is sad', 0, 0, -10, 'At the last minute you buy flowers, a card, and a gift card to help complete the mothers day mission.', 'Your mom was pleased that you thought about her', 0, -15, 20, 'mothersday.jpg'),
(35, 'Alki Beach', 'Its sunny outside! You decided to drive to Alki Beach to enjoy the sun. Too bad every everyone had the same idea, and are now sitting in 3 hour traffic on the West Seattle freeway.', 'Turn around, go home', 'You drive home and spend the rest of the day on the couch, thankful to be out of traffic', -3, 0, 5, 'Tough it out! Keep driving to Alki', 'Traffic only gets worse, and you end up waiting in traffic 4 hours baking in the sun. By the time you get there, it\'s already dark. You\'re starting to hate Seattle.', -2, 0, -23, 'Stop to get lunch, then continue to Alki', 'You stop at a cafe that serves ice cream and sandwiches. The food was delicious, and you feel rejuvinated! By the time you get there its night time, you wish you\'d gotten there sooner but at least you got out of the house', 0, -15, 5, 'traffic.png'),
(36, 'Lazy Day', 'You\'re feeling lazy today. You\'ve got all the food you need at home, no need to do anything today.', 'Relax at home', 'The entire day was spent relaxing in your pajamas. You feel a slight guilt for not doing anything, but ultimately enjoyed the day indoors.', -5, 0, -1, 'Push yourself to look for a job', 'The day was exhausting, but you found a gig online to help an old lady pack and move heavy furniture for 9 hours. You got some excersize, and  your wallet loves you.', 15, 90, 10, 'Workout instead', 'Push ups, Sit ups, Jogging, Biking! At first your body hated you -- but at some point the adrenaline kicked in and you overcame your laziness! You feel stronger from your hard work!', 20, 0, 35, 'lazy.jpeg'),
(37, 'Hot Yoga', 'Your friend Chelsea messaged you, inviting you to Hot Yoga with her. The cover charge is $25', 'Tell Chesea you have plans', 'K Chelsea replies. You will later find Chelsea has blocked you on all forms of social media, which you think is a bit dramatic. You can\'t help but feel you dodged a bullet there.', 0, 0, 2, 'Sure, sounds fun!', 'You regret every second you were there for Hot Yoga. The sweat, the tears, the money you will never get back. You are certain Hot Yoga was meant for torture. Chelsea messages you later that day inviting you to Hot yoga Day 2. You block Chelsea on all form', 40, 18, -5, 'Suggest yoga at home, for free!', 'Chelsea considers your offer, then agrees. You both spend the day attempting difficult Yoga poses in your living room. You\'re not great at it, Chelsea is clearly an expert and guides you along. Despite that, you feel like you had a great workout and becam', 30, 0, 10, 'yoga.jpg'),
(38, 'Seattle Protest', 'You are walking around down town and you turn a corner when you see a giant protest break out into a riot. You are now in the middle of it. What do you do?', 'You run home and curl up into a little ball and you never want to leave your apartment again.', 'Good job you got out of there quick, but now will have nightmares.', 3, 0, -10, 'You are so overwhelmed with everything you join in on the riot not knowing what it is about. Not even thinking of the consequences.', 'You walked around with the crowd', 15, 0, 15, 'You try and be a hero and like a police officer. Not knowing the consequences.', 'You end up getting beat up and sent to hospital. Way to go.', -50, -300, -50, 'protest.jpg'),
(39, 'Ticket Drawing', 'You entered in a contest awhile ago to win Seattle Seahawks tickets. They have finally done the drawing and you won Congratulations. What will you do with the tickets?', 'You decide to sell the tickets to make some money', 'You made some decent money on them', 0, 89, 20, 'Go to the game and have a great day', 'The game was great on a beautiful day you had a blast and enjoyed it with a lot of great people.  Also you had some snacks and drinks.', 5, -40, 15, 'Decide to go', 'On the day of the game you slept in and missed the game, thankfully the tickets were free', 2, 0, -3, 'football.png'),
(40, 'Earthquake', 'All of a sudden a 9.0 magnitude earthquake breaks out while your at home. What do you do?', 'You decide to take cover under a desk next to the strongest piillars in the building.', 'Good job you survive this earthquake thank the lord.', 0, 0, -30, 'No idea what to do', 'You have no idea what to do in an earthquake and you make the worst decision possible. You end up getting caught in the rubble and evacuated  to the hospital. You wake up hurt and confused.', -50, -300, -30, 'You leave the building to go to the hospital', 'You are safe from the earthquake but you get sick from beingn in the hospital to long.', 0, 0, 0, 'earthquake.jpg'),
(41, 'Kayaking', 'You want to go kayaking in the puget sound, but there are some different choices you need to make. What will you choose?', 'Choose the route of ferry\'s and ship and risk your safety for a great view and workout?', 'You have chosen wrong and are airlifted to hospital for all of your injuries', -20, -200, -10, 'Choose the safest and most boring route', 'You are safe and you make it a nice workout and you meet new kayakers.', 20, 0, 20, 'The intense and fast route', 'You are safe but you pulled a hammy and need to limp home', -3, 0, 20, 'kayak.jpg'),
(42, 'Rent almost due', 'You decide you have to sell some of your things to make your rent and survive. What will you choose to part ways with to survive.', 'Baseball Cards', 'You made money of of these', 0, 40, 3, 'Sell some clothes you havent worn in awhile', 'You made some money from your nice clothes', 1, 75, 1, 'Sell all of your electronics and video games', 'You feel less stressed now that your place is free of clutter', 3, 100, -3, 'sell.jpeg'),
(43, 'Payday', 'It is friday and payday you have a chance to spend it on something cool or will you save to survive?', 'Save it', 'You decided to be responsible and save your money, that is smart.', 0, 130, 5, 'You decide to splurge your money on a fancy watch', 'You look stylish but may need to sell it soon to pay rent', 0, -99, 20, 'Buy groceries', 'That was probably the wisest decision', 1, 100, 10, 'paycheck.jpeg'),
(44, 'Helping out a friend', 'Your friends are looking for some help to move and they are willing to offer food and money as compensation for helping out. What will you do?', 'Stay Home', 'You werent friends anyways, plus your lazy.', 0, 0, -5, 'Help out', 'You are a true friend, had a blast, had a meal, and got paid', 5, 50, 20, 'You go to help, there are attractive people there so you try and show off by how fast you can do this and how heavy you can carry things', 'You were a great help but you made a fool of yourself and strained a muscle showing off. But good job', 5, 50, 20, 'moving.jpg'),
(45, 'Summer Heat', 'It is now Summer and is becoming extremely hot in your apartment . It is hard to sleep and put up with it. How will you fix this problem?', 'You decided to ignore it and save money. You think you can put up with it', 'You were wrong and you cant sleep and you sweat 20 pounds every day. you mood and hp are gonna hurt', -20, 0, -20, 'You decide to buy two fans to fix this issue and make it bearable and comfortable to survive', 'good decision you can now surive a little longer at the expense of some money', 20, -75, 10, 'You try and steal some fans to help survive during summer and save some money. will your gamble pay off?', 'It does pay off but you lose some of your mood and hp for being a hoodlum', -10, 0, -20, 'summer.png'),
(46, 'Donations', 'You are contacted via email by a non-profit to donate money in helping the homeless.', 'Donate with support package', 'Your contribution has helped alleviate the homeless problem in Seattle. You feel like a good person.', 0, 20, 10, 'Select Angel Package', 'You are contacted by the non-profit thanking you for contributing so much. They email you frequently with updates, and have noticed fewer homeless downtown. You feel you\'ve made a real difference.', 0, 40, 10, 'Send email to trash', 'Although you saved some money, you start noticing more and more homeless men women and children downtown. You feel like you could have done more.', 0, 0, -5, 'donations.jpeg'),
(47, 'Project', 'You have made a video for your personal project that has went viral overnight. The problem is there is a lot of copyright problems with it also people who did not want to be tape or show there face. So they are legally coming at you with everything they g', '1st option he gives you is make a contract with youtube and fix all the problems so the people can be compensated and legally having nothing against you.', 'Good choice nothing will happen to you and you will be okay', -1, 200, 5, '2nd option you fight this to the bitter end cause you are right and didnt know this would go viral and you were within every right to do what you did to get by.', 'You have won your case at expense of your lawyer', 0, -200, 10, '3rd option you get dirt on everybody and blackmail them to come out on top and make some money off of this viral video', 'It was a success and you made a quick penny off of this.', -3, -500, 5, 'lawyer.jpg'),
(48, 'Neighbor', 'KNOCK KNOCK! Your neighbor Rob has invited you to eat at his place', 'Awesome, lets go', 'You guys talked and laughed the whole night, Although you feel sick because you ate about 5 chimichangas', -5, 0, 20, 'Stay Home', 'You hate your neighbor', 0, 0, 10, 'Politely Decline', 'Rob seems a bit disappointed, but thats not really your problem. You watch Netflix and cook a nice meal at home.', 10, 0, 10, 'weed.png'),
(49, 'Landlord Chaose', 'The Landlord appears at your door and you already hate each other. The landlord has been looking for ways to get rid of you and today has the balls to try it. The Landlord wants to evict you ASAP, but there are ways to get out of this situation. What will', 'You slip the landlord some money to calm down and get them off your back.', 'This works temporarily but im sure they will be back.', 0, -70, -15, 'You tell the landlord you will have the money when rent is due and you have no reason to evict me ', 'The landlord gets angry and storms off to try and find more ways to evict you.', 0, 0, -5, 'Pay rent early', 'Problem solved for now', 0, 300, 10, 'landlord.jpeg'),
(50, 'Hiking day', 'It\'s a gorgeous day -- you\'d like to go hiking at RattleSnake Ridge ( 3 mile hike up hill ) but you don\'t have food, water or hiking gear.', 'Go hiking without equipment or food.', 'Bad move. The hike was more brutal than you thought. You get halfway through and give up', -5, 0, -5, 'Buy hiking boots, food and water -- then go hiking!', 'You are drenching in sweat, but you had a great hike and feel stronger! You take a picture of yourself posing at the end of the trail and post it on social media -- it has 30 likes.', 20, -80, 20, 'Rest at home', 'You\'re sad you didn\'t go hiking today, but you found other things to keep you busy at home', 0, 0, -5, 'hiking.jpeg'),
(51, 'Alki Beach', 'Its sunny outside! You decided to drive to Alki Beach to enjoy the sun. Too bad every everyone had the same idea, and are now sitting in 3 hour traffic on the freeway.', 'Drive Home', 'You drive home and spend the rest of the day on the couch, thankful to be out of traffic +5 Mood', 0, 0, 5, 'Tough it out! Keep driving to Alki', 'Traffic only gets worse, and you end up waiting in traffic 4 hours baking in the sun. By the time you get there, it\'s already dark. You wish you stayed home. -25 HP -25 Mood', -25, 0, -25, 'Stop to get lunch, then continue to Alki (-$20)', 'You stop at a cafe that serves sandwiches. The food was delicious, and you feel rejuvenated! You get there at 9PM and wish you it were sooner but at least you got out of the house  -$20 +5 Mood ', 0, -20, 5, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `current_player`
--
ALTER TABLE `current_player`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `high_score`
--
ALTER TABLE `high_score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scenarios`
--
ALTER TABLE `scenarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `high_score`
--
ALTER TABLE `high_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `scenarios`
--
ALTER TABLE `scenarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
