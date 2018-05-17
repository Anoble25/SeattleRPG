-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 16, 2018 at 06:17 PM
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
  `opt_3_mood` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scenarios`
--

INSERT INTO `scenarios` (`id`, `scenario_name`, `prompt_text`, `opt_1_choice_text`, `opt_1_result_text`, `opt_1_health`, `opt_1_money`, `opt_1_mood`, `opt_2_choice_text`, `opt_2_result_text`, `opt_2_health`, `opt_2_money`, `opt_2_mood`, `opt_3_choice_text`, `opt_3_result_text`, `opt_3_health`, `opt_3_money`, `opt_3_mood`) VALUES
(1, 'Dream Job', 'You got your dream job offer!', 'Decline', 'Keep on dreaming! \r\n-1 to mood.', 0, 0, -1, 'Random', 'You got a your dream job with a relocation bonus! +2 to health. +500 to money. +10 to mood.', 2, 500, 10, 'Accept', 'Yay!', 0, 1000, 8),
(2, 'Uninteresting Job', 'You got a offer from a company you would rather not work for', 'Decline the offer and wait for your dream job', 'Hopefully you get your dream job [Health = 0, Money = 0, Mood = -3]', 0, 0, -3, 'Accept Offer', 'You got the job! [Health = 0, Money = 325, Mood = 15]', 0, 325, 15, 'Tell them you will accept the job offer if they pay you a little more', 'Hey maybe this is better than your dream job! [Health = 0, Money = 1100, Mood = 20]', 0, 1100, 20),
(3, 'Gift from Grandparents', 'Grandparents sent you $1,000!', 'Tell them thanks but no thanks and return the check', 'That was nice of you, but you may be running out of money soon [Health = 0, Money = 0, Mood = 2]', 0, 0, 2, 'Random', 'Nice $$$! [Health = 0, Money = 1000, Mood = 15]', 0, 1000, 30, 'Send them a thank you card', 'Postage was .25 cents [Health = 0, Money = 1000, Mood = 5]', 0, 1000, 20),
(4, 'Letter from apartments', 'You got a letter from your apartment with three check marks with no description but you can only select one', 'Option 1', 'You just got 1 free month of rent for next month [Health = 0, Money = 0, Mood = 30]', 0, 0, 30, 'Option 2', 'Your invited to free breakfast in the community room [Health = -5, Money = 0, Mood = 5]', -5, 0, 5, 'Option 3', 'You forgot to pay your deposit and we aren\'t going to waive it [Health = 0, Money = -500, Mood = -20]', 0, -500, -20),
(5, 'Hungry and need to eat', 'You are hungry and need to eat', 'Eat a free meal at parents house', 'Might not have been the best option because you still had to pay for the bus but at least you got to visit family [Health = 3, Money = -3.25, Mood = 1]', 3, -3, 1, 'Buy groceries and cook at home', 'Well this is a cheap meal, you just had to buy some groceries [Health = 5, Money = -5, Mood = 1]', 5, -5, 1, 'Go out to eat', 'That was expensive... oops [Health = 10, Money = -32.75, Mood = 20]', 10, -33, 20),
(6, 'Date Night', 'You have a date!', 'Dinner and a Movie', 'The dinner and movie went great and have another date set [Health = 3, Money = -75.12, Mood = 50]', 3, -75, 50, 'Netflix and Dinner at home(Groceries will be around $15)', 'Date was great [Health = 15, Money = -16.47, Mood = 80]', 15, -16, 80, 'Fancy restaurant', 'Your date stood you up, and didn\'t show. You feel depressed and lonely, at least the bottle of wine that you ordered while waiting was good [Health = -15, Money = -207.56, Mood = -60]', -15, -208, -60),
(7, 'Travel to Interview', 'You are traveling to a job interview', 'Bike to the interview', 'Good, no money spent and health increased [Health = 8, Money = 0, Mood = 15]', 8, 0, 15, 'Take the bus for $3.25', 'At least it\'s quicker than biking [Health = 0, Money = -3.25, Mood = -1]', 0, -3, -1, 'Drive and spend $7 in gas', 'That was quick but traffic sucked.. and your lazy [Health = -2, Money = -7, Mood = -13]', -2, -7, -13),
(8, 'Happy Hour with friends', 'Your friends are going out to happy hour', 'Suggest getting free beer at work', 'Yay, no money... free buzz [Health = -7, Money = 0, Mood = 10]', -7, 0, 10, 'Home', 'You went home because you were tired. Bus was 3.25 though [Health = 0, Money = -3.25, Mood = 5]', 0, -3, 5, 'Buy several drinks and dinner', 'Yikes, that was a bad idea.... you ended up drunk and bought everyone food and drinks [Health = -18, Money = -375, Mood = -15]', -18, -375, -15),
(9, 'Moms Birthday', 'It’s your mom’s birthday', 'Send a text or call', 'She was glad to hear from you [Health = 0, Money = 0, Mood = 5]', 0, 0, 5, 'Send a card in the mail', 'That\'s nice of you. postage for the card is 25 cents [Health = 0, Money = -0.25, Mood = 5]', 0, 0, 5, 'Buy her a gift', 'Your her favorite [Health = 0, Money = -15, Mood = 30]', 0, -15, 30),
(10, 'Slept In', 'You have slept in until the afternoon, losing half a day', 'Oops, I think I\'ll sleep some more', 'There are probably more productive things to do... just saying [Health = -2, Money = 0, Mood = -3]', -2, 0, -3, 'Apply for jobs', 'You have an interview tomorrow [Health = 2, Money = 0, Mood = 5]', 0, 0, 5, 'Hang out with friends', 'That was a good afternoon, but you should have been applying for jobs [Health = 0, Money = 0, Mood = 7]', 0, 0, 7),
(11, 'Parking Ticket', 'You wake up with a $75 parking ticket on your dashboard', 'Pay it right away', 'Ticket paid for $75 [Health = -1, Money = -75, Mood = -15]', -1, -75, -15, 'Ignore ticket. Refuse to pay it', 'You wait three weeks then decide to pay because you don\'t want your license suspended. You pay the original fee plus a $20 late fee. It costs $95 total [Health = -1, Money = -95, Mood = -23]', -1, -95, -23, 'Fight ticket in court', 'You fight the ticket and win. Your fees are $30 [Health = -1, Money = -30, Mood = 2]', -1, -30, 2),
(12, 'Lost Wallet', 'You lost your wallet and now have no cash or any way of withdrawing money', 'Look around apartment', 'You find it, but are stressed after looking for it [Health = -5, Money = 0, Mood = -2]', -5, 0, -2, 'Check the restaurant you were at last night', 'Well it was actually at home, and the ferry you took to the bar was $7 that you loaned from a friend [Health = -1, Money = -7, Mood = -9]', -1, -7, -9, 'Go to your friends house that you partied with some time recently', 'Well they haven\'t seen it, because you left it at home. that was a 30 minute bike ride [Health = 20, Money = 0, Mood = 0]', 20, 0, 0),
(13, 'Lost card and hungry', 'Your debit card has expired and you have to wait to get a new card in mail and need to eat', 'Ask parents for money, but that is a half day trip to their house on bike', 'They give you $50 [Health = 40, Money = 50, Mood = 2]', 40, 50, 2, 'Do yard work for a neighbor, therefore delaying your job search by a day and decreasing your mood.', 'You got paid $20 [Health = 10, Money = 20, Mood = -1]', 10, 20, -1, 'Use android app to pay for food', 'You used your phone to buy a bacon burger [Health = -1, Money = -9.75, Mood = 5]', -1, -10, 5),
(14, 'Car broke down', 'Your car broke down on your way to your interview', 'Have it towed to the shop to get fixed', 'Tow $75, Repairs $697 [Health = 0, Money = -772, Mood = -50]', 0, -772, -50, 'Car parents for advise', 'Your parents bought you a new car and the junk yard towed and took your old car for free [Health = 1, Money = 0, Mood = 100]', 1, 0, 100, 'Push it somewhere and abandon it', 'The city towed your car and fined you for leaving it in a two hour spot for several days [Health = 0, Money = -700, Mood = -60]', 0, -700, -60),
(15, 'House on fire', 'Your house is on fire', 'Stay at parents', 'You are relieved that at least you have a place to stay [Health = -5, Money = 0, Mood = -5]', -5, 0, -5, 'Car renters insurance company', 'They have decided to give you $700 [Health = 0, Money = 700, Mood = 60]', 0, 700, 60, 'Become homeless', 'You are now living at the local homeless shelter [Health = -30, Money = 0, Mood = -60]', -30, 0, -60),
(16, 'Talking to the homeless', 'You are walking to a bookstore -- suddenly a wild bearded man in tattered clothes approaches from the side. \'Excuse me... All I need is $1 for food.\' Theres a crazy look in his eye', 'Its only a dollar', 'The man blesses you and departs gleefully with your change. There is a warm feeling in your heart. +10 Mood [Health = 0, Money = -1, Mood = 10]', 0, -1, 10, 'Ignore him', 'Pretending he isn\'t there, you continue to the bookstore. \"He will find a dollar somewhere else\" you think to yourself. There is a cold feeling in your heart. [Health = 0, Money = 0, Mood = -10]', 0, 0, -10, 'Stop plaguing my city, freak!', 'You wake up in a hospital [Health = -50, Money = -700, Mood = -50]', -50, -700, -50),
(17, 'Student Loans', 'You owe money for your student loan', 'Pay amount due', 'Amount due, paid [Health = 0, Money = -125, Mood = -10]', 0, -125, -10, 'Leave it.', 'You happened to set up auto pay, so that\'s fine [Health = 0, Money = -125, Mood = -10]', 0, -125, -10, 'Call and ask if you can pay at a latter date', 'Unfortunately they won\'t allow that because you waited so long to call and now theres a late charge. [Health = 0, Money = -150, Mood = -20]', 0, -150, -20),
(18, 'Freemont Troll Bridge', 'Today you\'re feeling lucky! You go on a jog near freemont and enjoy the sunshine. Passing under a bridge, you look to the side and notice a giant inanimate rock troll underneath the \"bridge. You could swear you saw him wink at you.', 'Crumple up twenty dollars and put it underneath his giant palm', 'This troll has no need for money, but is impressed by your impulsiveness to help others. You feel the troll\'s gratitude surround you and it lifts your spirits [Health = 0, Money = -20, Mood = 30]', 0, -20, 30, 'Jump on the trolls back and do push-ups', 'The troll is confused, but impressed by your bravery. Also you really worked up a sweat... [Health = 10, Money =0 , Mood = 10]', 10, 0, 10, 'Make a wish', '', 0, 100, 30),
(19, 'New Roomate', 'Your friend want\'s to become roommates', 'Say yes, I am almost due on rent', 'Great they owe you $500 for rent [Health = 0, Money = 500, Mood = 50]', 0, 500, 50, 'Say no, sorry', 'That is okay\" [Health = 0, Money = 0 , Mood = -2]', 0, 0, -2, 'Say sure, but you only need to pay half today', 'Well, okay sure but you could have had more money. [Health = 1, Money = 250, Mood = 20]', 1, 250, 20),
(20, 'Car Loan', 'You owe money on your car loan', 'Pay Imediately', 'Done [Health = 0, Money = 500, Mood = 50]', 0, 500, 50, 'Say no, sorry', 'That is okay\" [Health = 0, Money = -120 , Mood = -20]', 0, -120, -20, 'Nah, I\'ll pay it later', 'You called and they said they will give you another 3 weeks to pay without any fees [Health = 0, Money = 0, Mood = 2]', 0, 0, 2),
(21, 'Walk in the park', 'You found $40 on the ground during your walk through the park', 'Pick it up', 'Great let\'s put that in savings [Health = 0, Money = 40, Mood = 10]', 0, 40, 10, 'Leave it', 'Someone later gives you $50 just because [Health = 0, Money = 50 , Mood = 30]', 0, 50, 30, 'I do not notice such things', 'Karma? [Health = 0, Money = 0, Mood = -20]', 0, 0, -20),
(22, 'Late for Interview', 'You are late to your interview', 'Still show up quickly', 'You got the job, because all the other candidates showed up hung over [Health = 0, Money = 500, Mood = 100]', 0, 500, 100, 'Show up but take your time', 'Luckily even even though the interviewer had another appointment, they still decided to interview you, Well it helps when the next person doesn\'t show. [Health = 0, Money = 500 , Mood = 60]', 0, 500, 60, 'Well, I might as well not go', 'You decided to get drunk with your friends [Health = -40, Money = -75, Mood = 5]', -40, -75, 5),
(23, 'Lottery Machine', 'Play Lottery', 'Buy $20 Ticket', 'You lost, better luck next time [Health = 0, Money = -20, Mood = -10]', 0, -20, -10, 'Buy $10 Ticket', 'You won $60 [Health = 0, Money = 60 , Mood = 20]', 0, 60, 20, 'Buy $30 Ticket', 'You won $80 [Health = 0, Money = 75, Mood = 20]', 0, 75, 20),
(24, 'New Shoes', 'You need new shoes', 'Buy some cheap shoes from GoodWill', 'The shoes you just bought fell apart later in the afternoon and you decided to buy another pair at Nordstrom [Health = -1, Money = -95, Mood = -5]', -1, -95, -5, 'Buy a pair of shoes at Sears', 'Lucky you, found a pair on sale\" [Health = 2, Money = -40 , Mood = 15]', 2, -40, 15, 'I will just wear my flip flops everywhere since it is summer', 'Well, maybe not ideal. But probably should buy something before winter. [Health = 0, Money = 0, Mood = -15]', 0, 0, -15),
(25, 'New career at Facebook', 'You got a job at Facebook', 'Accept job in Seattle', 'You are making $120,000 a year and paying $2,500 a month for rent at a apartment [Health = 0, Money = 9,500, Mood = 100]', 0, 9500, 100, 'Accept job in California', 'You are making $150,000 and paying $3,500 a month for rent at a apartment [Health = 0, Money = 10,500 , Mood = 100]', 0, 10500, 100, 'Accept job in Texas', 'Accept job in Texas [Health = 0, Money = 2,500, Mood = 60]', 0, 2500, 60),
(26, 'Nice Restaurant', 'You go out to a really beutiful restaurant', 'Order just a coffee', 'You kept it simple and cheap', 5, -5, 5, 'Order 3 course meal', 'You had the best meal ever and have leftovers for later', 20, -30, 30, 'Order soup and salad', 'You chose an in the middle decision and it paid off a lilttle more [Health = 10, Money = -10, Mood = 10]', 10, -10, 10),
(27, 'Ice Cream Binge', 'Its 10pm but never too late for an ice cream binge. You drive to an Ice cream shop to find they closed 5 minutes ago and upon turning around are approached by three hooded men. \'Can I use your phone? I need to make a call\'', 'Sure!', 'The hooded man snatches the phone and pushes you to the ground. All three of them run away laughing. Later you will cancel that phone and buy a cheap replacement. And all you wanted was ice cream. [Health = -20, Money = -$150, Mood = -25]', -20, -50, -25, 'Stand your ground and tell them no', 'The three hooded men attack, but you didn\'t go down without a fight. They beat you and steal $35. Although you feel some internal bleeding, you feel an odd satisfaction standing your ground [Health = -50, Money = -35, Mood = +30]', -50, -35, 30, 'Scream for help', 'Caught off guard, the three men scurry away. You are a little embarrassed how loud you screeched, but feel more alive survivng a close encounter! [Health = 10, Money = 0, Mood = -5]', 10, 0, -5),
(28, 'Chest = Rent Extention', 'You were exploring around space needle and find a treasure chest. You open it and hear the zelda reward tune. Out pops a golden ticket of rent extension for 1 day.', '?', '?', 0, 0, 0, '?', '?', 0, 0, 0, '?', '?', 0, 0, 0),
(29, 'Part Time Job Offer', 'You have met up with a friend and he offers you a part time job to help out with bills', 'Decline', 'Okay you missing out on a great opputunity and paycheck', 0, 0, 0, 'Accept Job Offer', 'Congratz on your part time job at the pizza-ria', 0, 300, 20, 'Accept job with less hours', 'Congratz you have a job and time on your hands', 0, 200, 10),
(30, 'Career at Microsoft', 'You have done such a good job at epicodus you have found an internship at Microsoft', 'Decline', 'You missed out on a great opportunity', 0, 0, -10, 'Accept Internship', 'Congrats!', 0, 200, 40, 'Accept Full Time Career', 'Awesome!', 0, 500, 50),
(31, 'Night Out', 'Your Friends are going out and they invite you to come with on a night a full activities', 'You decide not go to out and stay home and save money', 'Good decision you stayed home, saved money, and a little boring.', 0, 0, 0, 'You decide to go out and have the best night of your life', 'You had a great time, spent a lot of money, and woke up away from home', -10, -100, 20, 'You go out for a little while', 'You went out for a little with friends had a good time and was responsible', 10, -40, 10),
(32, 'Hot Dog Stand', 'It\'s night time and you\'re feeling quite hungry. Reading online, you find a Seattle HotDog stand nearby. When you get there, you suddenly remember a new HotDog Tax was just implemented -- and Hotdogs are now $9', 'YOLO', 'The hot dog was pretty good', -7, -9, 15, 'Eat Top Ramen at home', 'Your body hates you but your on a budget', -15, 0, -5, 'Go to bed', 'You went to bed hungry but at least you didnt spend any money', -10, 0, -20),
(33, 'Casino Night', 'You and your friends are going out to the casino', 'Put $20 in Slots', 'You just won $700', -5, 680, 30, 'Put $20 on blackjack', 'You just won $5', -5, -15, -5, 'You put $20 on Roullete', 'You won $60', -5, 40, 8),
(34, 'Mothers Day', 'It\'s mothers day and you decide to go all out for your mother', 'You buy Edible arrangement, tickets to pink concert, and candlelight dinner for you parents at pink door.', 'Great job on celebrating mothers day for you mom you mood goes up but your pockets become lighter', 10, 80, 26, 'You forgot about mothers day', 'Your mom is sad', 0, 0, -10, 'At the last minute you buy flowers, a card, and a gift card to help complete the mothers day mission.', 'Your mom was pleased that you thought about her', 0, -15, 20),
(35, 'Alki Beach', 'Its sunny outside! You decided to drive to Alki Beach to enjoy the sun. Too bad every everyone had the same idea, and are now sitting in 3 hour traffic on the West Seattle freeway.', 'Turn around, go home', 'You drive home and spend the rest of the day on the couch, thankful to be out of traffic', -3, 0, 5, 'Tough it out! Keep driving to Alki', 'Traffic only gets worse, and you end up waiting in traffic 4 hours baking in the sun. By the time you get there, it\'s already dark. You\'re starting to hate Seattle.', -2, 0, -23, 'Stop to get lunch, then continue to Alki', 'You stop at a cafe that serves ice cream and sandwiches. The food was delicious, and you feel rejuvinated! By the time you get there its night time, you wish you\'d gotten there sooner but at least you got out of the house', 0, -15, 5),
(36, 'Lazy Day', 'You\'re feeling lazy today. You\'ve got all the food you need at home, no need to do anything today.', 'Relax at home', 'The entire day was spent relaxing in your pajamas. You feel a slight guilt for not doing anything, but ultimately enjoyed the day indoors.', -5, 0, -1, 'Push yourself to look for a job', 'The day was exhausting, but you found a gig online to help an old lady pack and move heavy furniture for 9 hours. You got some excersize, and  your wallet loves you.', 15, 90, 10, 'Workout instead', 'Push ups, Sit ups, Jogging, Biking! At first your body hated you -- but at some point the adrenaline kicked in and you overcame your laziness! You feel stronger from your hard work!', 20, 0, 35),
(37, 'Hot Yoga', 'Your friend Chelsea messaged you, inviting you to Hot Yoga with her. The cover charge is $25', 'Tell Chesea you have plans', 'K Chelsea replies. You will later find Chelsea has blocked you on all forms of social media, which you think is a bit dramatic. You can\'t help but feel you dodged a bullet there.', 0, 0, 2, 'Sure, sounds fun!', 'You regret every second you were there for Hot Yoga. The sweat, the tears, the money you will never get back. You are certain Hot Yoga was meant for torture. Chelsea messages you later that day inviting you to Hot yoga Day 2. You block Chelsea on all form', 40, 18, -5, 'Suggest yoga at home, for free!', 'Chelsea considers your offer, then agrees. You both spend the day attempting difficult Yoga poses in your living room. You\'re not great at it, Chelsea is clearly an expert and guides you along. Despite that, you feel like you had a great workout and becam', 30, 0, 10),
(38, 'Seattle Protest', 'You are walking around down town and you turn a corner when you see a giant protest break out into a riot. You are now in the middle of it. What do you do?', 'You run home and curl up into a little ball and you never want to leave your apartment again.', 'Good job you got out of there quick, but now will have nightmares.', 3, 0, -10, 'You are so overwhelmed with everything you join in on the riot not knowing what it is about. Not even thinking of the consequences.', 'You walked around with the crowd', 15, 0, 15, 'You try and be a hero and like a police officer. Not knowing the consequences.', 'You end up getting beat up and sent to hospital. Way to go.', -50, -300, -50),
(39, 'Ticket Drawing', 'You entered in a contest awhile ago to win Seattle Seahawks tickets. They have finally done the drawing and you won Congratulations. What will you do with the tickets?', 'You decide to sell the tickets to make some money', 'You made some decent money on them', 0, 89, 20, 'Go to the game and have a great day', 'The game was great on a beautiful day you had a blast and enjoyed it with a lot of great people.  Also you had some snacks and drinks.', 5, -40, 15, 'Decide to go', 'On the day of the game you slept in and missed the game, thankfully the tickets were free', 2, 0, -3),
(40, '', 'All of a sudden a 9.0 magnitude earthquake breaks out while your at home. What do you do?', 'You decide to take cover under a desk next to the strongest piillars in the building.', 'Good job you survive this earthquake thank the lord.', 0, 0, -30, 'No idea what to do', 'You have no idea what to do in an earthquake and you make the worst decision possible. You end up getting caught in the rubble and evacuated  to the hospital. You wake up hurt and confused.', -50, -300, -30, 'You leave the building to go to the hospital', 'You are safe from the earthquake but you get sick from beingn in the hospital to long.', 0, 0, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
