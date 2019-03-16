-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 26, 2013 at 01:10 PM
-- Server version: 5.1.44
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT=0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fusionmartialart`
--
DROP TABLE IF EXISTS  `Classes`, `ClassTimes`, `EncyclopediaCount`, `Encyclopedias`, `Instructors`, `Motions`, `Movements`, `PatternCount`, `Patterns`, `Stances`, `TechniqueLinesOfAttack`, `Techniques`;
DROP VIEW IF EXISTS `viewPattern`, `viewPatternTechniqueCounts`, `viewPatternTechniques`, `viewStances`, `viewPatternCountsToFacing`, `viewPatternCountsLegInEffect`;


-- --------------------------------------------------------

--
-- Table structure for table `Instructors`
--

CREATE TABLE IF NOT EXISTS `Instructors` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SortOrder` tinyint(4) NOT NULL,
  `Title` enum('Instructor','Branch Instructor','Assistant Instructor','Head Of School') NOT NULL DEFAULT 'Instructor',
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(30) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `ShortDescription` tinytext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Instructors`
--

INSERT INTO `Instructors` (`ID`, `SortOrder`, `Title`, `Name`, `Phone`, `Email`, `Description`, `ShortDescription`) VALUES
(1, 1, 'Head Of School', 'Catherine McMaster (née Galvin)', '0415 628 951', 'catherine@fusionmartialarts.com.au', '<p>\r\nThe Founder of Fusion Martial Arts, Instructor Catherine started training at the tender age of 13 at Adelaide Headquarters with the legendary Master Vernon Low. Just before turning 16 she achieved 1st Dan black belt, graded by Master Chong Chul Rhee. At 17 she became president of the Adelaide University Dojang and was Assistant Instructor to John O’Brien. At this early stage of Australian Taekwon-do, she was the first female Taekwon-do Instructor in Australia and appeared in many photos published in the original Rhee Taekwon-do magazines.\r\n</p>\r\n<p>\r\nInstructor Catherine McMaster has continued in the tradition of Master Vernon Low; an ethic of working hard, enjoying your training and most importantly thinking about what we learn in class and its applications in the real world.\r\n</p>\r\n<p>\r\nAn Electrical Engineer by training, Instructor Catherine has recently followed her passion for Sports Science and not only works as a Master Personal Trainer but also is completing an Honours Degree in Sports Science at University of Canberra. Combining a passion for biomechanics, the pursuit of ‘best practice’ training, a great interest in the development of children’s Martial Arts training programs, a personal crusade to make Taekwondo training safe for all ages plus her shear breadth of knowledge and experience in traditional Taekwon-do, Instructor Catherine provides a solid foundation and knowledge base for Fusion Martial Arts.\r\n</p>', ''),
(2, 2, 'Branch Instructor', 'Nick Campbell', '0412 083 183', 'nick@fusionmartialarts.com.au', '<p>\r\nInstructor Nick first came to Taekwon-do as a means of self-defense. He is also very fortunate to trace his training pedigree through Instructor Russell Knudsen and Instructor Catherine McMaster back to Master Vernon Low. A Computer Programmer by trade, he brings his technical eye with him into the dojang. In his continuing pursuit of effective self-defense strategies he also actively trains in <a href=''http://en.wikipedia.org/wiki/Bujinkan''>Bujinkan Budō Taijutsu</a> (associated with Ninjitzu), bringing with him their concepts of the center line, the use of balance as well as the use of weapons. Instructor Nick has also been known to moonlight with other Martial Arts (Wing Chun, Brazilian Jiu-Jitsu) in order to glean insights from them.\r\n</p>\r\n<p>\r\nInstructor Nick has also spent a large amount of time researching the theory and documentation of ITF Taekwon-do, developing Fusion Martial Arts <a href=''/resources.php#GreenBook''>Student Handbook</a>, the <a href=''/resources.php#BlueBook''>Condensed ITF Patterns</a> as well as <a href=''/resources.php''>a number of other resources</a>. This knowledge is brought into the dojang in order to provide a deeper understanding of the execution and usage of techniques.\r\n</p>\r\n<p>\r\nInstructor Nick has a very innovative and exciting approach to instructing and has developed new strategies for our children’s classes that has added vitality and energy to training. Come and see for yourself how engaged and excited the students are, how much fun they have and how much they have learnt.\r\n</p>', '');


-- --------------------------------------------------------

--
-- Table structure for table `Classes`
--

CREATE TABLE IF NOT EXISTS `Classes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(1000) NOT NULL,
  `InstructorID` int(11) DEFAULT NULL,
  `Description` text NOT NULL,
  `ShortDescription` tinytext NOT NULL,
  `Lat` double NOT NULL,
  `Lng` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `InstructorID` (`InstructorID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Classes`
--

INSERT INTO `Classes` (`ID`, `tag`, `Name`, `Address`, `InstructorID`, `Description`, `ShortDescription`, `Lat`, `Lng`) VALUES
(1, 'holder', 'Holder Dojang @ Canberra Montessori School', '35 Mully Street, Holder ACT 2611', 2, '<p>\r\nOur Holder Dojang is located in the Jacaranda Room on the grounds of the <a href=''http://www.canberramontessori.com/'' target=''_new''>Canberra Montessori School</a> and offers two classes twice a week. The Junior Class is filled with our youngest beginners (ages 4+) and focuses on spacial awareness, discipline and features games tailored to assist our students developing young brains with coordination and fine motor skills. The Senior Class caters to adults and our older coloured belt students and features Taekwon-do patterns, technique development, self defense and technical theory. The Workshop time allows for students of all ages to practice patterns, board breaks, or anything the student feels they need to work on. <b>Please note that our Holder Dojang only operates during <a href=''http://www.canberramontessori.com/'' target=''_new''>school terms</a>.</b>\r\n</p>', 'Held in the Jacaranda Room during <a href="http://www.canberramontessori.com/" target="_new">school terms</a>.', -35.331849, 149.050628);

-- --------------------------------------------------------

--
-- Table structure for table `ClassTimes`
--

CREATE TABLE IF NOT EXISTS `ClassTimes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassID` int(11) DEFAULT NULL,
  `Days` varchar(100) NOT NULL,
  `Time` varchar(100) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassID` (`ClassID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ClassTimes`
--

INSERT INTO `ClassTimes` (`ID`, `ClassID`, `Days`, `Time`, `Description`) VALUES
(3, 1, 'Wednesdays & Fridays', '3:30-4:30pm', 'Junior Class'),
(4, 1, 'Wednesdays & Fridays', '4:30-5:30pm', 'Senior Class');

-- --------------------------------------------------------
--
-- Table structure for table `Patterns`
--

CREATE TABLE IF NOT EXISTS `Patterns` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SortOrder` smallint(6) NOT NULL DEFAULT '0',
  `Key` varchar(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `AKA` varchar(100) DEFAULT NULL,
  `IsOfficial` tinyint(1) DEFAULT '0',
  `GupLevel` enum('10th Gup','9th Gup','8th Gup','7th Gup','6th Gup','5th Gup','4th Gup','3rd Gup','2nd Gup','1st Gup','1st Dan','2nd Dan','3rd Dan','4th Dan','5th Dan','6th Dan','7th Dan','8th Dan','9th Dan') DEFAULT NULL,
  `Belt` enum('White Belt','White Belt Yellow Tip','Yellow Belt','Yellow Belt Green Tip','Green Belt','Green Belt Blue Tip','Blue Belt','Blue Belt Red Tip','Red Belt','Red Belt Black Tip','Black Belt') DEFAULT NULL,
  `MovementCount` tinyint(4) NOT NULL,
  `Meaning` text,
  `Diagram` enum('x','i','s','x-v','x-','l','l2','-','t','t2','t-','ltl','ivv','z','ii') DEFAULT NULL,
	-- '+','I','S','士v','士','|','_','iT','i山','T','Ivv','Z','王'
	`LongMeaning` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1118 ;

--
-- Dumping data for table `Patterns`
--

INSERT INTO `Patterns` (`ID`, `SortOrder`, `Key`, `Name`, `AKA`, `IsOfficial`, `GupLevel`, `Belt`, `MovementCount`, `Meaning`, `Diagram`) VALUES
(1000, 1, 'j', 'Saju-Jirugi', 'Right 4-Directional Punch', 1, '10th Gup', 'White Belt', 7, '4-Directional Punch', 'x'),
(1001, 2, 'j', 'Saju-Jirugi', 'Left 4-Directional Punch', 1, '10th Gup', 'White Belt', 7, '4-Directional Punch', 'x'),
(1002, 5, 'm', 'Saju-Makgi', 'Right 4-Directional Block', 1, '10th Gup', 'White Belt', 8, '4-Directional Block', 'x'),
(1003, 6, 'm', 'Saju-Makgi', 'Left 4-Directional Block', 1, '10th Gup', 'White Belt', 8, '4-Directional Block', 'x'),
(1004, 10, 'cj', 'Chon-Ji', 'Cheon-Ji, Chong-Ji', 1, '9th Gup', 'White Belt Yellow Tip', 19, 'Cheon-Ji means literally "the Heaven - the Earth." In the Orient, it is interpreted as the creation of the world or the beginning of human history, therefore, it is the initial pattern played by the beginner. This pattern consists of two similar parts: one representing Heaven and the other representing Earth.', 'x'),
(1005, 20, 'dg', 'Dan-Gun', NULL, 1, '8th Gup', 'Yellow Belt', 21, 'Dan-Gun is named after the holy Dangun, the legendary founder of Korea in the year of 2,333 B.C.', 'i'),
(1006, 30, 'ds', 'Do-San', 'To-San', 1, '7th Gup', 'Yellow Belt Green Tip', 24, 'Do-San is the pseudonym of the patriot An Chang-Ho (1876-1938). The 24 movements represent his entire life, which he devoted to furthering the education of Korea and its independence movement.', 's'),
(1007, 40, 'wh', 'Won-Hyo', 'Weon-Hyo', 1, '6th Gup', 'Green Belt', 28, 'Won-Hyo was the noted monk who introduced Buddhism to the Silla Dynasty in the year 686 A.D. ', 'i'),
(1008, 50, 'yg', 'Yul-Gok', NULL, 1, '5th Gup', 'Green Belt Blue Tip', 38, 'Yul-Gok is the pseudonym of a great philosopher and scholar Yi l (1536-1584) nicknamed the "Confucius of Korea." The 38 movements of this pattern refer to his birthplace on 38th latitude, and the diagram represents the Chinese character (士) for "scholar."', 'x-v'),
(1009, 60, 'jg', 'Joong-Gun', 'Jung-Geun, Joon-Gun', 1, '4th Gup', 'Blue Belt', 32, 'Joong-Gun is named after the patriot An Jung-Geun who assassinated Hirobumi Ito, the first Japanese governor-general of Korea.  Ito was known as the man who played the leading part in the Korea-Japan merger. There are 32 movements in this pattern to represent Mr. An''s age when he was executed in Lui-Shung prison (1910). ', 'i'),
(1010, 70, 'tg', 'Toi-Gye', 'Toe-Gye', 1, '3rd Gup', 'Blue Belt Red Tip', 37, 'Toi-Gye is the pen name of the noted 16th century scholar Yi Hwang, an authority on neo Confucianism. The 37 movements of this pattern refer to his birthplace on the 37th latitude, and the diagram represents the Chinese character (士) for "scholar."', 'x-'),
(1011, 80, 't', 'Saju-Tulgi', 'Right 4-Directional Thrust', 1, '2nd Gup', 'Red Belt', 4, '4-Directional Thrust', 'x'),
(1012, 81, 't', 'Saju-Tulgi', 'Left 4-Directional Thrust', 1, '2nd Gup', 'Red Belt', 4, '4-Directional Thrust', 'x'),
(1013, 82, 'hr', 'Hwa-Rang', NULL, 1, '2nd Gup', 'Red Belt', 29, 'Hwa-Rang is named after the Hwarang youth group, which originated in the Silla Dynasty in the early 7th century. The 29 movements refer to the 29th Infantry Division, where Taekwon-Do developed into maturity.', 'i'),
(1014, 90, 'cm', 'Choong-Moo', 'Chung-Mu', 1, '1st Gup', 'Red Belt Black Tip', 30, 'Choong-Moo was the name given to the great Admiral Yi Sun-Sin of the Yi Dynasty. He was reputed to have invented the first armored battleship (geobukseon) in 1592, which is said to be the precursor of the present day submarine. The reason why this pattern ends with a left-hand attack is to symbolize his regrettable death, having no chance to show his unrestrained potentiality, checked by the forced reservation of his loyalty to the king.', 'i'),
(1015, 100, 'kg', 'Kwang-Gae', 'Gwang-Gae', 1, '1st Dan', 'Black Belt', 39, 'Kwang-Gae is named after the famous Gwang-Gae To-Wang, the 19th King of the Goguryeo Dynasty, who regained all the lost territories including the greater part of Manchuria. The diagram is in the shape of the Chinese character for land (土), representing the expansion and recovery of the lost territory. The 39 movements refer to the first two figures of 391 A.D., the year he came to the throne.', 't-'),
(1016, 110, 'pe', 'Po-Eun', NULL, 1, '1st Dan', 'Black Belt', 36, 'Po-Eun is the pseudonym of a loyal subject Chong Mong-Chu (1400), who was a famous poet and whose poem, "I would not serve a second master though I might be crucified a hundred times," is known to every Korean. He was also a pioneer in the field of physics. The diagram (一) represents his unerring loyalty to the king and country towards the end of the Goryeo Dynasty.', '-'),
(1017, 120, 'gb', 'Gae-Baek', 'Gye-Baek', 1, '1st Dan', 'Black Belt', 44, 'Gae-Baek is named after Gye-Baek, a great general in the Baekje Dynasty (660 A.D.). The diagram (|) represents his severe and strict military discipline.', 'l'),
(1018, 200, 'ea', 'Eui-Am', NULL, 1, '2nd Dan', 'Black Belt', 45, 'Eui-Am is the pseudonym of Son Byong-Hi, leader of the Korean independence movement on March 1, 1919. The 45 movements refer to his age when he changed the name of Donghak (Oriental culture) to Cheondogyo (Heavenly Way Religion) in 1905. The diagram (|) represents his Indomitable Spirit, displayed while dedicating himself to the prosperity of his nation.', 'l'),
(1019, 210, 'cj2', 'Choong-Jang', 'Chung-Jang', 1, '2nd Dan', 'Black Belt', 52, 'Chung-Jang is the pseudonym given to General Kim Deok-Ryeong who lived during the Yi Dynasty, in the 14th century. This pattern ends with a left-hand attack to symbolize the tragedy of his death at 27, in prison before he was able to reach full maturity.', 't'),
(1020, 220, 'jc', 'Juche', 'Ju-Che', 1, '2nd Dan', 'Black Belt', 45, 'Juche is a philosophical idea that man is the master of everything and decides everything. In other words, the idea that man is the master of the world and his own destiny. It is said that this idea was rooted in Baek-Du Mountain, which symbolizes the spirit of the Korean people. The diagram is in the shape of the Chinese character (山) for mountain, representing Baekdu Mountain.', 'ltl'),
(1021, 240, 'kd', 'Ko-Dang', 'Go-Dang', NULL, '2nd Dan', 'Black Belt', 39, 'Ko-Dang is the pseudonym of the patriot Cho Man-Sik, who dedicated his life to the Independence Movement and education of his people. The 39 movements in this pattern signify his times of imprisonment and his birthplace on the 39th parallel.\r\nKo-Dang was one of the original 24 patterns created by General Choi. In the early 1980s, however, Ko-Dang was removed from the official syllabus by General Choi and replaced by a new pattern which he named Juche. Ko-Dang was a famous South Korean anti-communist, and when Choi began to spread his art throughout the world, and to North Korea in particular, he removed this pattern so as not to offend anyone. Although no longer part of official ITF Taekwondo, Ko-Dang is still included in the syllabi of many Taekwondo organisations. In those organisations where it is still taught, it is generally taught to students at the level of 2nd Dan black belt. Although some sources lead to the deduction that Ko-Dang is exactly the same pattern as Juche, they are in fact two completely different patterns. The confusion arose when one of the ITF Taekwondo groups changed the name of the pattern Juche to Ko-Dang in 2008, because the word "Juche" is associated with North Korea''s communist ideology.', 't2'),
(1022, 300, 'si', 'Sam-Il', NULL, 1, '3rd Dan', 'Black Belt', 33, 'Sam-Il denotes the historical date of the independence movement of Korea, which began throughout the country on March 1, 1919. The 33 movements in the pattern stand for the 33 patriots who planned the movement.', 'x'),
(1023, 310, 'ys', 'Yoo-Sin', 'Yu-Sin', 1, '3rd Dan', 'Black Belt', 68, 'Yoo-Sin is named after General Kim Yoo-Sin, a commanding general during the Silla Dynasty. The 68 movements refer to the last two figures of 668 A.D., the year Korea was united. The ready posture signifies a sword drawn on the right rather than left side, symbolizing Yoo-Sin’s mistake of following his King''s orders to fight with foreign forces against his own nation.', 'ivv'),
(1024, 320, 'cy', 'Choi-Yong', 'Choi-Yeong, Choe-Yeong', 1, '3rd Dan', 'Black Belt', 46, 'Choi-Yeong is named after General Choi-Yeong, premier and commander in chief of the armed forces during the 14th century Goryeo Dynasty. Choi-Yong was greatly respected for his loyalty, patriotism, and humility. He was executed by his subordinate commanders headed by general Yi Seong-Gye, who later became the first King of the Yi Dynasty.', 'x'),
(1025, 400, 'yg4', 'Yon-Gae', 'Yeon-Gae', 1, '4th Dan', 'Black Belt', 49, 'Yeon-Gae is named after a famous general during the Goguryeo Dynasty, Yeon-Gae So-Mun. The 49 movements refer to the last two figures of 649 A.D., the year he forced the Tang Dynasty to quit Korea after destroying nearly 300,000 of their troops at Ansiseong.', 'x'),
(1026, 410, 'ej', 'Ul-Ji', 'Eul-Ji', 1, '4th Dan', 'Black Belt', 42, 'Ul-Ji is named after general Ul-Ji Mun-Dok who successfully defended Korea against the Tang''s invasion force of nearly one million soldiers led by Yang Je in 612 A.D.  Ul-Ji, employing hit and run guerilla tactics, was able to decimate a large percentage of the force. The diagram is in the shape of the Chinese character (乙) represents his surname. The 42 movements represent age the of General Choi Hong-Hi when he designed the pattern.', 'z'),
(1027, 420, 'mm', 'Moon-Moo', 'Mun-Mu', 1, '4th Dan', 'Black Belt', 61, 'Moon-Moo honors the 30th King of the Silla Dynasty. His body was buried near Daewangam (Great King''s Rock). According to his will, the body was placed in the sea "where my soul shall forever defend my land against the Japanese." It is said that the Seokgulam (Stone Cave) was built to guard his tomb. The Seokgulam is a fine example of the culture of the Silla Dynasty. The 61 movements in this pattern symbolize the last two figures of 661 A.D. when Mun-Mu came to the throne.', 'x'),
(1028, 500, 'ss', 'Seo-San', 'So-San', 1, '5th Dan', 'Black Belt', 72, 'Seo-San is the pseudonym of the great monk Choi Hyeong-Eung (1520-1604) during the Yi Dynasty. The 72 movements refer to his age when he organized a corps of monk soldiers with the assistance of his pupil, Sa Myeong-Dang. The monk soldiers helped repulse the Japanese pirates who overran most of the Korean peninsula in 1592.', 'x'),
(1029, 510, 'sj', 'Se-Jong', NULL, 1, '5th Dan', 'Black Belt', 24, 'Se-Jong is named after the greatest Korean King, Se-Jong, who invented the Korean alphabet (han-geul) in 1443, and he was also a noted meteorologist. The pattern diagram is in the shape of the Chinese character (王) for king, representing King Se-Jong, while the 24 movements refer to the 24 letters of the Korean alphabet.', 'ii'),
(1031, 520, 'un', 'U-Nam', 'Woo-Nam', NULL, '5th Dan', 'Black Belt', 42, 'U-Nam is the pseudonym of the first President of Korea, Dr. Syngman Rhee. U-Nam was removed from the curriculum due to nationwide protests in 1960 which forced President Rhee’s resignation and exile.', 't'), -- U-Nam was researched by Dr. George Vitale, VIII Degree from NYC, USA. During his many years of extensive research he was advised of its creation by Grandmaster C.K. Choi, a Founding Member of the ITF. "U-Nam was one of the patterns used in the early developmental stages. At that time Syngman Rhee was the first President of South Korea and as Taekwon-do was in this early developmental phase, our Founder General Choi Hong Hi wanted to gain the support of the South Korean President. U Nam was the pen name of Syngman Rhee and as such, General Choi created pattern U Nam. The pattern was replaced by Choong Jang tul after the President’s resignation in 1960. Choong Jang tul contains many similar and also upgraded movements from pattern U Nam." -FGMR
(1032, 521, 'un_lit', 'U-Nam (Lost In Translation)', 'Woo-Nam', NULL, '5th Dan', 'Black Belt', 42, 'This version of U-Nam stems from the original incorrect English translation which was demonstrated from rediscovery in 2013 through early 2016 when an accurate translation was made widely available. This ''Lost In Translation'' version of U-Nam as written and preformed did not return to the starting position due to the footwork in movement #39. As this version of U-Nam has little resemblance to the accurate translation, artistic license was taken to add a single step so practitoners may return to the starting position. As such, in movement #39 the right foot now steps forward into a parallel stance before moving the left foot into position. To practice this pattern as origionally (incorrectly) translated, omit this right foot movement from movement #39.', 't'), -- U-Nam was researched by Dr. George Vitale, VIII Degree from NYC, USA. During his many years of extensive research he was advised of its creation by Grandmaster C.K. Choi, a Founding Member of the ITF. "U-Nam was one of the patterns used in the early developmental stages. At that time Syngman Rhee was the first President of South Korea and as Taekwon-do was in this early developmental phase, our Founder General Choi Hong Hi wanted to gain the support of the South Korean President. U Nam was the pen name of Syngman Rhee and as such, General Choi created pattern U Nam. The pattern was replaced by Choong Jang tul after the President’s resignation in 1960. Choong Jang tul contains many similar and also upgraded movements from pattern U Nam." -FGMR
(1030, 600, 'ti', 'Tong-Il', NULL, 1, '6th Dan', 'Black Belt', 56, 'Tong-Il denotes the resolution of the unification of Korea, which has been divided since 1945. The diagram (ㅣ) symbolizes the homogenous race.', 'l2'),


(1100, 1000, '~sp', 'Right Punch Sparing Pattern', NULL, 0, NULL, NULL, 28, NULL, NULL),
(1101, 1001, '~sp', 'Left Punch Sparing Pattern', NULL, 0, NULL, NULL, 28, NULL, NULL),
(1102, 1002, '~sp', 'Right Front/Side Kick Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1103, 1003, '~sp', 'Left Front/Side Kick Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1104, 1004, '~sp', 'Right Hooking/Turning Kick Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1105, 1005, '~sp', 'Left Hooking/Turning Kick Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1106, 1006, '~sp', 'Right Back Kick Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1107, 1007, '~sp', 'Left Back Kick Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1108, 1008, '~sp', 'Right Reverse Turning Kick Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1109, 1009, '~sp', 'Left Reverse Turning Kick Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1110, 1010, '~sp', 'Right Knee Kick Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1111, 1011, '~sp', 'Left Knee Kick Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1112, 1012, '~sp', 'Right Block Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1113, 1013, '~sp', 'Left Block Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1114, 1014, '~sp', 'Right Palm Block Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1115, 1015, '~sp', 'Left Palm Block Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1116, 1016, '~sp', 'Right Forearm Block Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL),
(1117, 1017, '~sp', 'Left Forearm Block Sparing Pattern', NULL, 0, NULL, NULL, 0, NULL, NULL);

UPDATE `Patterns`
SET LongMeaning = 'Literal meaning of Chon-Ji is "Heaven and Earth," which in the Orient symbolizes the creation of the world and the beginning of human history. Chon-Ji was named after Lake Chon-Ji, a lake that fills the crater on top of the extinct volcano Paektu-San on the border of North Korea and China. It is 2,749 metres above sea level, covers 14.4 square metres and is 384 metres deep at its deepest point, making it possibly the deepest volcanic lake on earth. It is said that General Choi, Hong-Hi named the pattern after the lake because the water is so clear and calm that you can literally see the Heaven meeting the Earth.\nChon-Ji is appropriately named because creation is the starting point of all things and this pattern establishes a foundation for the remaining patterns. The pattern consists of two similar parts: one part representing heaven and the other earth. Stances and techniques in this pattern comprise the basic movements required for mastery of all 24 patterns.'
WHERE ID = 1004;

UPDATE `Patterns`
SET LongMeaning = 'October 3rd is celebrated in Korea as a national holiday to commemorate the founding father, Dan-Gun. The legend of his life is as follows:\nWhen heaven and earth were one and when animals could speak like humans, the god Hwanin sent his son Hwang-Ung to the East to build a new country. Hwang-Ung settled in what is now called North Korea, at the highest point on the peninsula. This was in the 25th reign of the Yao Emperor in China, approximately 2,333 BC.\nOne day a tiger and a bear appeared in front of Hwang-Ung and asked that they be made into human form. After great thought Hwang-Ung informed the animals that their wish could be granted, but it would be difficult and would take much patience. The animals agreed that they would do whatever it took to become human. Hwang-Ung gave the tiger and the bear twenty garlic cloves and some mugworts. They were told to eat these, stay in a cave and pray earnestly for 100 days.\nAfter twenty days the tiger became hungry and could no longer continue, so he left the cave in search of food. But when the 100 days were almost at an end, the bear began to lose its fur and its rear feet began to change, until at the end of the 100th day the bear had fully transformed into a beautiful woman. She became known as Ung-Yo, which means "the girl incarnated from a bear".\nHwang-Ung then married Ung-Yo, and she gave birth to a son, who they named Dan-Gun. This child gave rise to the first Korean Dynasty, called Go-Joseon.'
WHERE ID = 1005;

UPDATE `Patterns`
SET LongMeaning = 'Do-San commemorates the pseudonym of the great patriot and educator Ahn Chang-ho (November 9, 1876 - March 10, 1938).\nAhn Chang-Ho was committed to preserving Korea\'s educational system during the Japanese occupation. He was well known for his sincerity and lack of pretence in dealing with others. A farmer\'s son, he abandoned traditional learning in his home town, Pyongyang, and studied for two years at a missionary school operated by the Salvation Army. He became a Christian and felt he couldn\'t hate the Japanese as men. He decided to seek a source of national strength and cultivate it to regain national independence and prosperity.\nIn 1894, at the age of 18, Ahn became a member of the Tongnip Hyophoe "Independence Association," which promoted independence from Japan and worked to reform domestic affairs and reduce dependence upon foreign countries.\nIn 1899, Ahn established the Cheomjin ("gradual progress") School in Pyongyang, the first modern and co-educational private school ever established by a Korean. The name of the school seemed to reflect his political philosophy of evolutionary social changes through education.\nAhn, Chang-Ho was one of the first Koreans to emigrate to the United States. He arrived in America in September 1902 with his newlywed wife, Lee Hae- Ryon, and, as the steamship approached Hawaii, Ahn resolved to stand tall above the sea of turmoil existing at that time in Korea, and decided to call himself "Do-San" (meaning "Island Mountain"). While living in San Francisco, he organised the San Francisco Social Meeting on September 23, 1903, and initiated a social reform movement that was desperately needed by the Korean American society. An accomplished orator and leader at the age of 24, Ahn guided his countrymen to form a respectable community for Koreans in the United States. He organised a society that became the Kungminhoe (Korean National Association), which inspired Korean immigrants to hope for national independence.\nIn 1906, following the Russo-Japanese war, Ahn learned of the Japanese "Protectorate Treaty" that had been enforced on Korea, which gave the Japanese the legal right to occupy the country, and returned home. He organised an underground independence group in Pyongahn-do called Shinmin-Hoe (New Peoples\' Association), an organisation dedicated to promoting Korean independence through the cultivation of nationalism in education, business and culture.\nIn 1908 the Shinmin-Hoe founded the Tae-Song ("large achievement") School in Pyongyang. This school was designed to provide Koreans with an education based on national spirit. Ahn, Chang-Ho worked a ceramic kiln as a commercial enterprise to raise funds for the publication of books for young people. The political environment of the time, however, was not conducive to the founding of such a school; in fact the Japanese were in the process of eradicating education for Koreans, in order to ensure illiteracy and essentially create a class of slave workers.\nWith Yi Kap, Yang Ki-tak and Shin Chae-Ho, Ahn embarked on a lecture tour of Korea, warning of the national crisis being incurred by the Japanese and urging the people to unite and resist the Japanese. Ahn repeatedly told Japanese leaders that Japan would profit more with Korea as a friend rather than an enemy.\nBy 1910 the Shinmin-Hoe had around 300 members and represented a threat to the Japanese occupation. The Japanese were actively crushing these types of organizations, and the Shinmin-Hoe quickly became a target of their efforts. In December of 1910 the Japanese Governor General, Terauchi, was scheduled to attend the dedicating ceremony for the new railway bridge over the Amnok River. The Japanese used this situation to pretend to uncover a plot to assassinate Terauchi on the way to this ceremony. All of the Shinmin-Hoe leaders and 600 innocent Christians were arrested. Under severe torture, which led to the deaths of many, 105 Koreans were indicted and brought to trial. During the trial, the defendants were adamant about their innocence. The world community felt that the alleged plot was such an obvious fabrication that political pressure grew and most of the defendants had to be set free. (By 1913, only six of the original defendants had received prison sentences.)\nBy this time, the Japanese had become fairly successful at detecting and destroying underground resistance groups. However, they were not successful in quelling the desire for freedom and self-government among\nthe Korean people. The resistance groups moved further underground\nand guerrilla raids from the independence groups in Manchuria and Siberia increased.\nThe Japanese stepped up their assault on the Korean school system and other nationalistic movements. After the passage of an Education Act in 1911 the Japanese began to close all Korean schools.\nIn 1913, the Tae-Song School was forced to close, and, by 1914, virtually all Korean schools had been shut down and all Koreans were attending Japanese schools. In order to do so, they had to abandon using their Korean language and their Korean birth-names, and instead use the Japanese language and Japanese names. The Koreans had the same conditions imposed on them in order to purchase food from stores. They were taught that they were the under-class whose purpose was to serve their superior Japanese masters.\nThis all but completed the Japanese campaign of cultural genocide. Chances of any part of the Korean culture surviving rested in the hands of the few dedicated patriots working in exile outside of Korea.\nWhen Japanese Governor-General Hiro-Bumi Ito was assassinated by Ahn, Joong-Gun, Japan tightened its grip on Korean leaders. Ahn, Chang-Ho was forced to go into exile in Manchuria, then Siberia, Russia, Europe, and finally the United States. In 1912, Ahn was elected chairman of the Korean National People\'s Association, which had emerged as an organisation for Koreans living abroad, and played an active role in negotiations with the US government. Around this time he also established Hungsadan, a secret voluntary group of ardent patriots. These and other organisations pressured President Woodrow Wilson into speaking on behalf of Korean autonomy at the Paris peace talks, and, in 1918, a representative of the Korean exiles was indeed sent to these talks.\nIn 1919, when the Yi Dynasty was forcefully absorbed into the Japanese Empire, Ahn started underground activities that focused on regaining Korean independence. He returned to Shanghai in April 1919 along with Rhee Syngman and Kim Ku, where Rhee became acting premier of a provisional government. They drew up a Democratic Constitution that provided for a freely elected president and legislature. This document also established the freedom of the press, speech, religion, and assembly. An independent judiciary was established and the previous class system of nobility was abolished. After trying in vain to narrow the differences of opinion between the leaders in Shanghai, he resigned from the post after two years.\nFinally, on March 1 1919, the provisional government in Shanghai formally declared its independence from Japan, and called for massive general resistance from the people of Korea. During the ensuing resistance demonstrations the Japanese police opened fire on unarmed Korean crowds, killing thousands. Many thousands more were arrested and tortured. Even after this, Ahn, Chang-Ho continued to work on in the United States on behalf of his country of birth. He created a village in Manchuria for wandering Korean refugees, and in 1922 led a commission which compiled all historical materials relating to Korea, particularly concerning the Japanese occupation.\nIn 1932 Ahn, Chang-Ho was arrested by the Japanese following a bombing carried out by Yun, Pong-Gil (although Ahn himself was not involved in the incident) and he was placed in prison in Taejon. After briefly being released he was arrested again by the Japanese police and stayed in prison until 1938 when, in poor health, he was allowed to leave the prison on bail. He died in a hospital in Seoul on 10 March 1938.'
WHERE ID = 1006;

UPDATE `Patterns`
SET LongMeaning = 'Won-Hyo (617-686 AD) was the noted Buddhist monk who introduced Buddhism into the Silla Dynasty in 686 AD.\nLegend has it that Won-Hyo\'s mother, while pregnant with him, was passing by a sala tree when she suddenly felt birth pangs, and, without having time to reach her home, gave birth to him there and then. The sala tree is significant, as it is usually only found in legends of highly revered figures. The name given to him at birth was Sol Sedang. He derived the pen name Won-Hyo (meaning "dawn") from his nickname, "Sedak" (also meaning "dawn"). He assumed this pen name in later years, after he had become more accomplished as a Buddhist philosopher and poet.\nCivil war amongst the Koguryo, Silla and Paekche kingdoms marked the period of Won Hyo\'s birth and childhood, and indeed it was not until 677 that the Silla dynasty unified Korea. Legend asserts that Won-Hyo, as a young man, took part in these bloody civil wars and saw many of his friends slaughtered, and it was this that drove him to turn his back on violence and become a monk. Most sources agree that he became a monk at the age 20. One story says he remodelled his home as a temple which he named Ch\'ogae-sa; another says he simply shaved his head and went into the mountains to live as a monk. It is not even clear under which teachers he studied Buddhism; some say it was Nangji on Yong-ch\'wi Mountain, others say he was a disciple of priest Popchang at Hungnyun-sa. Yet another legend has it that he learned the Nirvana Sutra from Podok, a Koguryo priest exiled in Silla. Buddhism was not a popular religion in Silla at that time, though; although it had been introduced into the kingdom of Koguryo in 372 and Paekche in 384, the general population of Silla was reluctant to accept it.\nIn 650, when Won-Hyo was 33 years old, he set out for China in the company of his friend Uisang; both of them had been inspired to study under the famous Buddhist scholar Huan-Tchuang. Their journey was smooth, except near the Chinese border in Liaotung, Koguryo, when they were mistaken for spies by sentries and barely escaped being captured. One of the most famous stories in Korean Buddhism concerns Won-Hyo\'s enlightenment during this attempted journey to China:\n"One evening as Won-Hyo was crossing the desert, he stopped at a small patch of green where there were a few trees and some water. He went to sleep. Toward midnight he awoke, very thirsty. It was pitch-dark. He groped along on all fours, searching for water. At last his hand touched a cup on the ground. He picked it up and drank. Ah, how delicious! Then he bowed deeply, in gratitude to Buddha for the gift of water.\nThe next morning Won-Hyo woke up and saw beside him what he had taken for a cup. It was a shattered skull, blood-caked and with shreds of flesh still stuck to the cheek-bones. Strange insects crawled or floated on the surface of the filthy rainwater inside it. Won-Hyo looked at the skull and felt a great wave of nausea. He opened his mouth. As soon as the vomit poured out, his mind opened and he understood. Last night, since he hadn\'t seen and hadn\'t thought, the water was delicious. This morning, seeing and thinking had made him vomit. Ah, he said to himself, thinking makes good and bad, life and death. And without thinking, there is no universe, no Buddha, no Dharma. All is one, and this one is empty.\nThere was no need now to find a master. Won-Hyo already understood life and death. What more was there to learn? So he turned and started back across the desert to Korea."\nHis friend, Uisang, continued on to China and learned the doctrines of the Chinese school Hua-yen and later established this in Korea - as the Hwa-om school - when he returned.\nFollowing his return, Won-Hyo undertook prodigious amounts of scholarly work, and his writing was not the only area in which he gained recognition. He was well-known both to the general population and to the members of the royal family and their court. He was often asked to conduct services, recite prayers, and give sermons at the royal court.\nIn 660 AD, King Muyo became so interested in Won-Hyo that he asked him to come and live in the royal palace of Yosok. A relationship with the royal princess Kwa developed, and marriage and the birth of their son Sol-Ch\'ong soon followed. Shortly after his son was born, though, Won-Hyo left the palace to travel the country, and he became highly respected by the people of Korea. He hated the fact that different religions argued with each other over their different beliefs, so he created his own ideology in which the conflicts between various religions could be reconciled.\nIn 661 AD, he experienced a revelation in his Buddhist philosophy and developed the Chongto-Gyo ("pure land") sect. This sect did not require study of the Chinese Buddhist literature for salvation, requiring instead merely diligent prayer. This fundamental change in Buddhist philosophy made religion accessible to the lower classes, and as such it quickly became very popular among the entire population.\nIn 662 AD, Won-Hyo left the priesthood and devoted the rest of his life to travelling the country teaching his new sect to the common people. Won- Hyo\'s contributions to the culture and national awareness of Silla were instrumental in the unification of the three kingdoms of Korea.\nWon-Hyo died in the year 686 aged 70, nine years after the unification of the Korean peninsula under the Silla dynasty. His body was laid in state by his son, Sol-Ch\'ong, at Punhwang-sa temple.\nIt is said that during his lifetime Won-Hyo authored some 240 works on Buddhism; of these, 20 works in 25 volumes still exist. One of the forms he chose to use was a special Silla poetic form, Hyang-Ga. These poems were mainly written by monks or members of the Hwa-Rang and concerned patriotism, Buddhism, and praise of the illustrious dead. Won-Hyo\'s poem "Hwaorm-Ga" is said to be among the most admired of these poems. During his lifetime Won-Hyo dominated the intellectual and religious arenas both inside and outside Korea, and made extensive commentaries on all the different schools of Buddhism that were competing for supremacy at that time. He set the shape and form of Silla Buddhism and was also the dominant figure in the Korean Buddhist tradition. Along with two other famous Korean Buddhists, Chinul and Sosan Taesa, Won-Hyo was one of the most influential thinkers Korea has ever produced.\nHis belief was that one could obtain salvation, or enter the "Pure Land", by simply praying. This fundamental change in Buddhist philosophy made religion accessible to the lower classes. It soon became very popular among the entire population. However, his most remarkable achievements were his efforts in relieving the poverty and suffering of ordinary people. In 662 AD, Won-Hyo left the priesthood and devoted the rest of his life to traveling the country teaching this new sect to the common people. Won-Hyo\'s contributions to the culture and national awareness of Silla were instrumental in the unification of the three kingdoms of Korea.\nWon-Hyo died in 686 AD and was laid in state by his son Sol-Chong in Punhwang-Sa temple. He had seen the unification of the Three Kingdoms of Korea in his own lifetime and had helped to bring about a brilliant culture in Korea through his efforts in Buddhist philosophy. He had a profound influence on quality of life in Silla and on Buddhism in Korea, China, and Japan.'
WHERE ID = 1007;

UPDATE `Patterns`
SET LongMeaning = 'Yul-Gok is the pseudonym of the great philosopher Yi I nicknamed "the Confucius of Korea."\nYi I was born on 26 December 1536 in Pukp\'yong, in Kangwon Province. He was a child prodigy who knew Chinese script at the age of three and composed poems in Chinese before he had reached his seventh birthday. By the age of seven, he had finished his lessons in the Confucian Classics, and he passed the Civil Service literary examination at the age of 13.\nAt the age of 29, Yi I passed a higher Civil Service examination - with full marks - and he started government service. He wrote a thesis on the subject of Ch\'ondoch\'aek which was widely regarded as a literary masterpiece, displaying his knowledge of history and the Confucian philosophy of politics, and also reflecting his profound knowledge of Taoism.\nHe took the pen name Yul-Gok (meaning "Valley of Chestnuts") and continued his studies to grow into a great Confucian scholar, revered as the "Greatest Teacher in the East".\nAt 34, Yul-Gok authored "Tongho Mundap", an eleven article treatise devoted to clarifying his conviction that righteous government could be achieved even within his own lifetime, showing his aspirations and also measures to achieve it.\nYul-Gok temporarily renounced the world by secluding himself in the Diamond Mountains following his mother\'s death when he was 36. It is not known why he did this, although it is thought that either: he sought three years of lamentation until the Buddhist phrase, "life is transient", eased his sorrow; he may have understood that the Confucian teaching, "preserve your mind and nurture your nature", was synonymous with the Buddhist teaching, "open your mind and see your nature"; or he may have regarded it as a pleasure simply to retire to the countryside to rest.\nFollowing his return to society, he authored "The Essentials of Confucianism" in 1576, which was considered to be a most valuable book, showing examples for a good Confucian life.\nYul-Gok died in 1584, and the valuable Yul-Gok Chônjip ("The Complete Works of Yul-Gok") was compiled after his death on the basis of the writings he bequeathed.\nYul-Gok’s portrait is on the 5000 Won note in Korea.'
WHERE ID = 1008;

UPDATE `Patterns`
SET LongMeaning = 'Ahn, Joong-Gun was born in 1879 in the town of Hae-Ju in Hwang-Hae Province. His family moved to the town of Sin-Chun in Pyongahn Province when he was about ten years old. When he grew up he became a teacher and founded a school, called the Sam-Heung ("three success") School. The Japanese occupation of Korea would mean that his school, like all others in Korea at that time, would come under great hardships. Due to its location, it would also become caught up in a Japanese power play.\nKorea was dragged into conflict as a result of trouble erupting in China in 1900. In response to the Boxer rebellion, the colonial powers descended upon the Orient in force to protect their interests. Prompted by the movement of Russian army units into neighbouring Manchuria in 1902, England formed an Anglo-Japanese Alliance, and a Russo-French Alliance was subsequently established in 1903, quickly followed by a movement of French and Russian troops into northern Korea. The Japanese saw this action as a threat to their intention to claim Korea for the Japanese Empire and demanded the removal of all Russian troops from Korea. When Russia rejected this demand in 1904, Japan initiated a naval attack. Korea claimed neutrality, but was invaded by Japan nonetheless; in autumn 1905 Russia surrendered and Japan was firmly established in Korea. This invasion was not viewed as an act of aggression anywhere outside of Korea.\nLong-term occupation of Korea required the takeover of the Korean government. Hiro-Bumi Ito, one of Japan\'s leading elder statesmen of the time, masterminded a plan to complete the occupation and political takeover of Korea, and was named as the first Japanese Governor General of Korea in 1905. From Japan, Ito pressured the weak Korean government into signing the "Protectorate Treaty" on November 19, 1905, which gave the Japanese the legal right to occupy Korea. Ito arrived in Korea in March 1906 to take the reins of power and ordered all foreign delegations in Korea to withdraw, leaving Korea at the mercy of the Japanese. The new Japanese puppet government passed laws that allowed Korean land to be sold to Japanese, although land was just taken anyway.\nThe Korean people were incensed by this, and waves of anti-Japanese violence swept the country. A number of guerrilla groups were formed to attack the Japanese occupation forces, but they were crushed by the much larger Japanese army. Popular violent unrest continued to spread as many loyal Korean government officials committed suicide, and Korean signatories to the Protectorate Treaty were assassinated.\nIn the face of this oppression, Ahn, Joong-Gun went into self-imposed exile in Manchuria where he formed a small guerrilla movement. His force, of about 300 men, carried out raids across the Manchuria-Korea border in order to maintain pressure on the Japanese.\nIn June 1907, the Korean emperor, Ko-Jong, secretly sent an emissary to the Hague Peace Conference in order to expose the aggressive Japanese policy in Korea to the world. When Hiro-Bumi Ito found out about this, he forced Ko- Jong to abdicate the Korean throne. Following this, in July 1907 the Japanese officially took over the Government of Korea. This led to severe rioting throughout Korea, involving many Korean army units. The Japanese responded by disbanding the Korean army and police force. The Korean army retaliated by attacking the Japanese troops, but were quickly defeated.\nIn response to increased Japanese activity in the Kando region on the border with Manchuria, Ahn, Joong-Gun led his guerrillas on a raid there in June 1909. The raid was a success, resulting in many Japanese deaths. Despite such guerrilla activities being planned and executed from within China, the Japanese arrived at an agreement with the Chinese and signed a treaty with them on September 4 1909. This treaty granted the Japanese access to connect to the Southern Manchurian Railway, allowing them to exploit the rich mineral resources in Manchuria. In return, the Japanese gave China the territorial rights to Kando. This act of selling Korean territory to another country was the final straw for patriots like Ahn. He retreated to his headquarters in Vladivostok, Siberia, to plan the assassination of the man he saw as responsible - Hiro-Bumi Ito.\nIto had planned to meet with a Russian official called General Kokotseff in Harbin, Manchuria on October 26 1909, to calm Russian fears over Japan\'s intentions to annex Manchuria and invade China. When Ito\'s train arrived at Harbin train station at 9:00am on the day of the meeting, Ahn, Joong-Gun was waiting for him. Even though he knew that he would be tortured if he was captured by the Japanese, Ahn shot Ito as he stepped off the train. He was indeed captured by Japanese troops, and imprisoned at Port Arthur. Whilst in the Japanese prisons, he suffered five months of barbaric torture. Other prisoners told that despite this unbelievable treatment, his spirit never broke. At 10:00am on March 26, l9l0, Ahn, Joong-Gun was executed at Lui- Shung prison at the age of just 32.\nAhn, Joong-Gun\'s scarifice was one of many in this chaotic time of Korea\'s history. His attitude, and that of his compatriots, symbolised the loyalty and dedication that the Korean people felt towards their country\'s independence and freedom. Ahn\'s devotion to his country was captured in the calligraphy that he wrote in his cell in Lui-Shung prison prior to his execution, which said simply "The Best Rivers and Mountains". This can be interpreted to mean that he felt that his country was the most beautiful on earth. His life took him from educator to guerrilla leader, but above all this he was one of Korea\'s great patriots.'
WHERE ID = 1009;

UPDATE `Patterns`
SET LongMeaning = 'Yi Hwang was born in On\'gye-ri (now Tosan), North Kyôngsang Province, on November 25, 1501. He was a child prodigy. At the age of six, he started to learn the Book of One Thousand letters from an old gentleman in his neighborhood, and at 12 he learned the Analects of Confucius from his uncle, Yi U. At the age of 19, he obtained the two-volume Sôngni Taejôn, a great compendium of neo-Confucianism by Hu Guang, and experienced a process of great awakening. He became devoted to Song thought.\nHe came to Seoul when he was 23 years old to study at the National Academy, and passed the preliminary provincial Civil Service examination with top honours at the age of 33, continuing his scholarly pursuits whilst working for the Korean government. Indeed, he continued to work for the government throughout his life, moving through 29 different positions. His integrity made him relentless as he took part in purges of corrupt government officials. In a report to the king following an inspection tour of Ch\'ungch\'ông Province as a royal secret inspector, he ruthlessly condemned a provincial official who, ignoring an order from an honest magistrate, busied himself in illicitly building a fortune by taking possession of government articles. On numerous occasions he was even exiled from the capital for his firm commitment to principle.\nIn 1549 he retired back to his home and lived there until his death, thereby justifying his chosen pen name of Toi-Gye (meaning "retreating stream"). There he began to build the Tosan Sowon, a private Confucian academy offering instruction in the classics and honouring the sages with regular memorial rites. Unfortunately he died in 1570 and never lived to see the opening of his academy open, although his students continued to work after his death. Tosan Sowon opened in 1574, and remains in use to this day.\nOn his death, Yi Hwang was posthumously promoted to the highest ministerial rank, and his mortuary tablet is housed in a Confucian shrine as well as in the shrine of King Sonjo. He was the author of many books on Confucianism, and he also published a "shijo" collection, a short poetic form popular with the literati of the Choson period. During forty years of public life he served four kings (Chungjong, Injong, Myôngjong and Sônjo), and his interpretation of the "li-chi" dualism gained him fame in Korea and beyond.\nHis influence is still being felt in the 20th century in China, Korea, and Japan. His academy remains a center for the study Toi-Gae thought, and regular memorial services are held in honor of its founder twice a year.\nToi-Gye’s portrait is on the 1000 Won note in Korea.'
WHERE ID = 1010;

UPDATE `Patterns`
SET LongMeaning = 'This Tul was named for the Hwarang youth group that originated in the Silla Dynasty about 1350 years ago and became the driving force for unification of the three kingdoms of Korea.\nDuring the 6th century AD, the Korean peninsula was divided into the three kingdoms of Silla, Koguryo, and Paekche. The smallest of these kingdoms, Silla, was constantly being harassed and invaded by its two more powerful neighbours, and so in 576 Chin-Hung, the 24th king of the Silla dynasty, established the Hwa-Rang (meaning "flower of youth") warriors from groups of talented young noblemen who were exceedingly loyal to the throne, who could be extensively trained in all forms of warfare and then successfully go into battle to defend the kingdom.\nEach Hwa-Rang group consisted of hundreds of thousands of members chosen from the young sons of the nobility (some as young as 12) by popular election. The leaders of each group, including the most senior leader, were referred to as Kuk-Son. These Kuk-Son were similar to the legendary Knights of the Round Table of King Arthur\'s reign.\nTrainees learned the five cardinal principles of human relations (kindness, justice, courtesy, intelligence and faith), the three scholarships (royal tutor, instructor and teacher) and the six ways of service (holy minister, good minister, loyal minister, wise minister, virtuous minister and honest minister). After completing their training, which usually lasted around ten years, candidates were presented to the king for nomination as a Hwa-Rang or Kuk-Son.\nThe Hwa-Rang trained to improve their moral principles and military skills. To harden their bodies, they climbed rugged mountains and swam turbulent rivers in the coldest months. The youths were taught dance, literature, arts and sciences, and the arts of warfare, chariot driving, archery and hand-to- hand combat.\nThe hand-to-hand combat was based on the Um-Yang principles of Buddhist philosophy and included a blending of hard and soft, linear and circular techniques. The art of foot fighting known as Subak, practised by common people throughout the three kingdoms, was adopted and transformed by the Hwa-Rang. They intensified it and added hand techniques - it was said that the Hwa-Rang punches could penetrate the wooden chest armor of an enemy and kill him, and that their foot techniques were said to be executed at such speed that opponents frequently thought that the feet of Hwa-Rang warriors were swords. They called this new art Taek Kyon.\nThe Hwa-Rang code was established in the 3Oth year of king Chin-Hung\'s rule. Two noted Hwa-Rang warriors, Kwi-San and Chu-Hang, sought out the famous Buddhist warrior-monk Wong-Gwang Popsa and asked that he give them a set of commandments that men who could not embrace the secluded life of a Buddhist monk could follow. These commandments, based on Confucian and Buddhist principles, were divided into five rules (loyalty to the king and country, obedience to one\'s parents, sincerity, trust and brotherhood among friends, no retreat in battle and justice in the killing of living things) and nine virtues (humanity, justice, courtesy, wisdom, trust, goodness, virtue, loyalty and courage).\nThe Hwa-Rang were the first group of trained warriors ever to possess a spiritual attitude toward warfare. This spiritual warrior code was passed on to Japan in the late 6th century AD, and it was from these roots that the famous "Bushido" Samurai tradition was eventually born.\nThe zeal of the Hwa-Rang helped Silla to become the world\'s first Buddhist kingdom, and eventually led to the unification of the three kingdoms of Korea. The battles won by the Hwa-Rang brought about the unification, but history would not be served, however, if it were not acknowledged that this unification was only achieved by a series of very bloody conflicts in which a large percentage of the Korean population was killed.\nAfter the unification of Korea and the defeat of the invading Chinese Tang dynasty, the thoughts of the Korean people began to move away from conflict and on to more philosophical ideas. As warriors, the Hwa-Rang fell into decline by the end of the 7th century. Their refined knowledge of healing caused them to become known as a group specialising in Buddhist philosophy, healing and poetry, but no longer did they enjoy the exalted status of royal warriors.'
WHERE ID = 1013;

UPDATE `Patterns`
SET LongMeaning = 'Yi, Soon-Sin was born in Seoul on the 28th April 1545. After his father left his job as a government official, the family moved to Asan, Chungcheongdo province and the young Soon-Sin started his education. He at first chose to study the liberal arts, but later decided to take the military course. He passed the entrance examination at the age of 32 and was appointed as a lower officer of Hamgyeong-do province to begin his military service.\nAfter rising through the ranks, Yi was appointed as naval commander of the Left Division of Cheollado in 1591, when he was 47 years old. It was at this time that he came up with the idea of the armoured battleship "Kobukson", or "turtle ship", a galley ship decked over with iron plating to protect the soldiers and rowers. It was so named because the curvature of the iron plates covering the top decks resembled a turtle\'s shell. It had a large iron ram at its prow in the shape of a turtle\'s head with an open mouth, from which smoke, arrows and missiles were discharged. There was another such opening in the rear, and six more on either side, all for the same purpose. The armored shell was fitted with iron spikes and knives that were disguised with straw or grass and designed to impale unwanted boarders. It was truly revolutionary, the most highly-developed warship of its time, and it was to play a crucial part in the ensuing war against Japan.\nWhen the Japanese Shogun Toyotomi Hideyoshi came to power in 1590, his priority was the conquest of China, as he knew that a war with China would drain the financial resources of his rival fuedal lords of Japan and cement his hold on power. In 1592 he approached Korea and requested her aid in this conquest. When Korea refused, he ordered two of his generals, Kato Kiyomasa (the Buddhist commander) and Konishi Yukinaga (the Christian commander), to attack Korea. His plan was to sweep through the peninsula and on to conquer China.\nThanks to their larger army and superior technology (the Japanese had imported muskets from Europe and developed their own, whereas the Korean army was armed with swords, bows and arrows and spears), the Japanese troops reached Seoul in just 15 days and occupied the entire country by May 1592.\nIn early 1592, at the start of the conflict, Admiral Yi Soon-Sin, in charge of the Right Division of Chulla Province, made his headquarters in the port city of Yosu. It was in Yosu at this time that he constructed his famous Kobukson; the first one was launched and outfitted with cannons just two days before the first Japanese troops landed at Pusan, and in May 1592, Admiral Yi engaged the Japanese at Okpa. In his first battle, Yi led 80 ships against a Japanese naval force of 800 aiming to re-supply their northern bases from their port at Pusan. By the end of the day, Yi had set 26 Japanese ships on fire and forced the rest to flee. Giving chase, he sank many more, leaving the entire Japanese fleet scattered.\nSeveral major engagements followed in which Admiral Yi annihilated every Japanese squadron he encountered. Courageous and a tactical genius, he even seemed to be able to outguess the enemy. In one incident, Yi dreamed that a robed man called out to him "The Japanese are coming". Seeing this as a sign, he rose to assemble his ships, sailed out, and surprised a large enemy fleet. He burned 12 enemy ships and scattered the rest. In the course of the battle, he demonstrated his bravery by not showing pain when shot in the shoulder, revealing his injury only when the battle was over, when he bared his shoulder and ordered that the bullet be cut out.\nIn August 1592, 100,000 Japanese troop reinforcements headed around the Pyongyang peninsula and up the west coast. Admiral Yi confronted them at Kyon-Na-Rang, among the islands off the southern coast of Korea. Pretending at first to flee, Admiral Yi then turned and began to ram the Japanese ships with his sturdy Kobukson. His fleet copied his tactic and they sank 71 Japanese vessels. When a Japanese reinforcement fleet arrived, Admiral Yi\'s fleet sank 48 of them and forced many more to be beached as the Japanese sailors tried to escape on land. This engagement is considered to be one of history\'s greatest ever naval battles, and it utterly crushed Japan\'s ambitions of conquering China.\nIn a brilliant move, Admiral Yi then took the entire Korean Navy of 180 ships, small and large, into the Japanese home port at Pusan harbour. There he proceeded to attack the main Japanese naval force of more than 500 ships, that were still at anchor. Using fire boats and strategic manoeuvring, he sank over half of the Japanese vessels, but, receiving no land support, was eventually forced to withdraw. With this battle, Admiral Yi completed what some naval historians have called the most important series of naval engagements in the history of the world.\nAdmiral Yi, Soon-Sin\'s dominance over the sea was so complete that no Japanese supply ships could reach Korea, and the Japanese forces began to dwindle. The stalemate naval blockade forced Admiral Yi into many months of inactivity, during which he prepared for the future; he had his men make salt by evaporating seawater, and used it to pay local workers for building ships and barracks, and to trade for materials his navy needed. His energy and patriotism were so great that many men worked for nothing. Having heard not only of Yi\'s military feats, but his contributions to the navy as well, the king conferred upon him the admiralty of the surrounding three provinces.\nUnfortunately, a Japanese spy named Yosira managed to ingratiate himself to the Korean General Kim, Eung-Su, and convinced the General that the Japanese General Kato was due to attack Korea with a great fleet. He convinced General Kim to send Admiral Yi to lie in wait and sink the fleet, but Yi refused on the grounds that the area given by Yosira was studded with rocks and highly dangerous. Admiral Yi\'s refusal to follow orders was seized upon by his enemies at court, and they insisted on his arrest. As a result, in 1597 Admiral Yi, Soon-Sin was relieved of command, placed under arrest and taken to Seoul in chains, where he was beaten and tortured. It was only the fervour of his supporters in promoting his past record that prevented the king from having him executed. Spared the death penalty, Admiral Yi was demoted to the rank of common foot soldier. He responded to this humiliation as a most obedient subject, going quietly about his work as if his rank and orders were totally appropriate.\nWhen Hideyoshi learned from Yosira that Yi, Soon-Sin was out of the way, the Japanese attacked Korea again with 140,000 men in thousands of ships. Admiral Yi\'s replacement, Won Kyun, led the Korean navy to a humiliating defeat that almost resulted in its total destruction. Fearing for his country\'s security, the king hastily reinstated Yi, Soon-Sin as naval commander, and, in spite of his previous treatment, Yi immediately set out on foot for his former base at Hansan. There, with a force of just 12 ships, he repelled a Japanese fleet of 133 ships sailing through the Myongyang Strait at night by hiding, spread out, in the shadow of a mountain and firing constantly as they passed, convincing the Japanese that they were facing a vastly superior force. The next day more Japanese ships arrived, but Yi fearlessly sailed straight at them, sinking 30 and causing the remainder to flee in panic as they recognised the return of the fearless Admiral. Yi gave chase and destroyed the fleet, killing the Japanese Commander Madasi.\nKorea was relatively weak at that time and relied heavily upon troops supplied by her close ally China (who had helped to drive Japan back following their initial occupation in 1592), and, in 1598, the Chinese emperor sent Admiral Chil Lin to command Korea\'s western coast. Admiral Chil Lin was an extremely vain man and would take advice from no one. Knowing this to be a serious problem, Admiral Yi made every effort to win the trust of the Chinese admiral, and his political skills proved to be as effective as his military ones as he allowed Admiral Chil Lin to take credit for many of his own victories. He was willing to forgo the praise and let others reap the commendation in order to have the enemies of his country destroyed.\nYi, Soon-Sin was soon in charge of all strategy while Admiral Chil Lin took the credit. This arrangement made the Chinese seem successful, which so encouraged them that they gave Korea more of the aid she desperately needed. Admiral Chil Lin could not praise Admiral Yi enough, and repeatedly wrote to the Korean king So-Jon that "the universe did not contain another man who could perform the feats that Yi, Soon-Sin apparently found easy". Unfortunately Admiral Yi, Soon-Sin never lived to see the rewards of the heroic efforts and brilliant strategies of his that led, finally, to the Japanese withdrawal at the end of 1598. On November 19, 1598, Admiral Yi was shot by a stray bullet during the final battle of the war. Even as he lay wounded on deck, he commanded that his body be hidden by a shield so that his enemies could not see that he had fallen. To his oldest son, he whispered, "Do not weep, do not announce my death. Beat the drum, blow the trumpet, wave the flag for advance. We are still fighting. Finish the enemy to the last one." He was 54 years old when he died.\nAlthough known primarily for his invention of the Kobukson, he also developed other military devices. One of his little-known inventions was a smoke generator in which sulphur and saltpetre were burned, emitting great clouds of smoke. This first recorded use of a smokescreen struck terror in the hearts of superstitious enemy sailors, and, more practically, it masked the movements of Admiral Yi\'s ships. Another of his inventions was a type of flamethrower, a small cannon with an arrow-shaped shell that housed an incendiary charge, that he used to set fire to enemy ships. Along with his inventions, the tactical manoeuvres that he pioneered, such as his use of the fishnet "V" formation and the use of two-salvo fire against ships, demonstrate Yi\'s brilliance as a naval tactician.\nAdmiral Yi, Soon-Sin was one of the greatest heroes in Korean history. He was posthumously awarded the honorary title of Choong-Moo (meaning "Loyalty-Chivalry") in 1643, and the Distinguished Military Service Medal of the Republic of Korea (the third highest) is named after this title. Numerous books praise his feats of glory and several statues and monuments commemorate his deeds. His name is held in such high esteem that when the Japanese fleet defeated the Russian navy in 1905, the Japanese admiral was quoted as saying "You may wish to compare me with Lord Nelson, but do not compare me with Korea\'s Admiral Yi, Soon-Sin...he is too remarkable for anyone."\nChoong-Moo’s portrait is on the 100 Won silver coins in Korea.\nThe name Choong-Moo, representing "Loyalty-Chivalry," was awarded posthumously to Yi Sun-Sin in 1643.\nChoong Moo is also the name of Korean\'s 3rd highest military award, the "Distinguished Military Service Medal of the People\'s Republic of Korea".'
WHERE ID = 1014;

UPDATE `Patterns`
SET LongMeaning = 'King Kwang-Gae-Toh-Wang (meaning "broad expander of territory") was born in 374 AD and ascended to the throne in 391, at the age of just seventeen, to become the 19th king of the Koguryo Dynasty. He ruled over Koguryo at the time in Korea\'s history known as The Three Kingdoms, so called because during this time the Korean peninsula was constantly being fought over by the three Koguryo, Silla and Paekche dynasties. He is sometimes referred to as Great King Yeongnak, after the era name selected by him. He expanded Koguryo’s territories far into the Korean peninsula by advancing southward at the expense of the Paekche dynasty to occupy the north of the Han River, and occupied Manchurian territory to the east of Liaohe. On his death in 413, at just 39 years of age, Koguryo ruled everything between the Sungari and Han Rivers. This gave it control over two thirds of what is now modern Korea as well as a large part of Manchuria. In addition, the chieftains of Silla submitted to the northern kingdom\'s authority in 399 to receive protection from Japanese raids. Only Paekche continued to resist Koguryo domination during this period, thereby preventing what would have been the first recognized unification of the Korean peninsula. During his reign, King Kwang-Gae conquered 65 walled cities and some 1,400 villages, in addition to aiding Silla when it was attacked by the Japanese. In 392 he built nine Buddhist temples in Pyongyang. His accomplishments are recorded on a monument which was erected in 414 in southern Manchuria.'
WHERE ID = 1015;

UPDATE `Patterns`
SET LongMeaning = 'Chong, Mong-Chu was born in 1337, at the time when the Koryo dynasty ruled the Korean peninsula.\nAt the age of 23 he took three different Civil Service literary examinations and received the highest marks possible on all three, and in 1367 he became an instructor in Neo-Confucianism at Songgyungwan University whilst simultaneously holding a government position, and was a faithful public servant to King U.\nThe king had great confidence in his wide knowledge and good judgment, and so he participated in various national projects and his scholarly works earned him great respect in the Koryo court.\nHe was most knowledgeable about human behaviour, and visited China and Japan as a diplomat for the king, securing promises of Japanese aid in defeating pirates and managing to secure peace with Ming dynasty China in 1385.\nHe also founded an institute devoted to the theories of Confucianism.\nDuring the beginning of the eleventh century Mongol forces had advanced into China and the Korean peninsula, and by the year 1238 Koryo was fully under Mongol domination and would remain so for the next full century. The Ming Dynasty in China had grown extremely powerful during the 14th century, however, and began to beat back the Mongol armies, so that by the 1350s Koryo had regained its independence, although China garrisoned a large number of troops in the north-east of Koryo, effectively occupying part of the country.\nGeneral Yi, Sung-Gae had grown in power and respect during the late 1370s and early 1380s, and many of Chong\'s contemporaries plotted to dethrone then-King U and replace him with General Yi.\nIn 1388, General Yi, Sung-Gae was ordered to use his armies to push the Ming armies out of the Korean peninsula. The general, however, was no fool. He realized the strength of the Ming forces when he came into contact with them at the Yalu River, and made a momentous decision that would alter the course of Korean history. Knowing of the support he enjoyed both from high- ranking government officials and the general populace, he decided to return to the capital, Kaesong, and secure control of the government instead of possibly destroying his army by attacking the Chinese.\nYi marched his army into the capital, defeated the forces loyal to the king (commanded by General Choi Yong) and removed the government, but did not ascend the throne right away.\nKing Gongyang and his family were sent into exile in 1392 (where they would later be secretly murdered), but Chong, Mong-Chu faithfully supported the king, leading the opposition to Yi’s claim to the throne.\nChong was revered throughout Koryo, even by Yi himself, but he was seen to be an obstacle and as such had to be removed. Yi threw a party for him and afterward, on his way home, Chong was murdered by five men on the Sonjukkyo Bridge in Kaesong. This bridge has now become a national monument, and a brown spot on one of the stones is said to be a bloodstain of his which turns red when it rains.\nThe 474-year-old Koryo Dynasty effectively ended with the death of Chong, Mong-Chu, and was followed by the Lee Dynasty. His noble death symbolises his faithful allegiance to the king.\nHe was honored in 1517, 125 years after his death, when he was canonised into the national academy alongside other Korean sages such as Yul-Gok and Toi-Gye.\n\nEven if I may die, die a hundred times\nEven if my skeleton may become dust and dirt,\nAnd whether my spirit may be there or not,\nMy single-hearted loyalty to the lord will not change.\nChong, Mong-Chu (Po-Eun)'
WHERE ID = 1016;

UPDATE `Patterns`
SET LongMeaning = 'Little is known of the life of Ge-Baek, including the year and location of his birth, apart from the fact that he was a great general in the Paekche dynasty in the early to mid-7th century AD.\nThe Paekche dynasty flourished for six centuries from 18 BC until it was defeated by Silla in 660. Paekche was established by refugees from Koguryo in the southwest corner of the Korean peninsula, close to the site of present- day Seoul. It expanded southward and set up a trading relationship with China. A major Paekche expedition to Kyushu, Japan, led to the creation of the Yamato Kingdom and the beginnings of a new cultural legacy.\nIn 655, Paekche and Koguryo joined forces to attack Silla, although they were eventually driven back when Silla received aid from Tang Dynasty China. In 660, when a huge united army of Silla and the Chinese invaded Paekche, General Ge-Baek organised 5,000 soldiers of the highest morale and courage to meet them in battle. He knew before he set out that his army was outnumbered and that his efforts would be futile, but nonetheless he did not hesitate to try to defend his country, reportedly stating\n"I would rather die than be a slave of the enemy."\nHe then killed his wife and family to prevent them from falling into the hands of opposing forces, and to prevent the thought of them to influence his actions or cause him to falter in battle.\nHis forces won four small initial battles, but then he was forced to move his forces to block the advance of General Kim, Yoo-Sin on the Paekche capital, Puyo. The two generals met on the plains of Hwangsan Field, in present day Hamyang, near Chiri Mountain. Ge-Baek\'s forces fought bravely but they were outnumbered ten to one and, in the end, he and his men were completely defeated.\nThe Paekche dynasty was destroyed after 678 years of rule, but the name of Ge-Baek is still recognised for his bravery and his fierce loyalty to his country.'
WHERE ID = 1017;

UPDATE `Patterns`
SET LongMeaning = 'Son, Byong-Hi was born in 1861 in Chungcheong Province. In 1884 he heard of the Dong Hak religion* and its ideals of supporting the nation and comforting the people, and decided to become a member.\nAfter joining Dong Hak, Son entered into a period of profound training that included reading and reciting the Dong Hak "Incantation of Twenty-One Letters" thirty thousand times a day. In addition he made straw sandals, which he sold at the market in Cheongju. He is thought to have lived in this manner for roughly three years.\nAfter this period Son, Byong-Hi became the student of Ch\'oe, Si-Hyung, who was the 2nd Great Leader of Dong Hak, and entered a life of devoted study. In 1894 Ch\'oe, Si-Hyung led the Gabo Dong Hak Revolution in protest at the corruption of the Korean Joseon government, and Son, Byong-Hi served as a commander. This revolution quickly grew into a resistance struggle against foreign invasion and occupation, in which Japan was the principal target. Ch\'oe\'s forces met defeat in 1895, however, and the revolution was put down at the hands of Japan\'s superior modern weaponry. After living for some years as a fugitive Ch\'oe, Si-Hyung was captured by\npursuing government troops in 1898 and executed, although he had foreseen that his time was marked, and on December 24, 1897 he had ordained Son, Byong-Hi as the 3rd Great Leader of Dong Hak.\nIn 1898, following the execution of Ch\'oe, Si-Hyung, Son, Byong-Hi sought political asylum in Japan. After the Russo-Japan War in 1904, he returned to Korea and established the Chinbohoe ("progressive society"), a new cultural and reformist movement designed to reverse the declining fortunes of the nation and to create a new society. Through Dong Hak he conducted a nationwide movement that aimed at social improvement through the renovation of old customs and ways of life. Hundreds of thousands members of Dong Hak cut their long hair short and\ninitiated the wearing of simple, modest clothing. Non-violent demonstrations for social improvement organized by members of Dong Hak took place throughout 1904. This coordinated series of activities was known as the Kapjin reform movement.\nMembers of Dong Hak were severely persecuted by the Japanese government, and so, on December 1, 1905, Son decided to modernize the religion and usher in an era of openness and transparency in order to legitimize it in the eyes of the Japanese. As a result he officially changed the name of Dong Hak to Chondo Kyo ("Heavenly Way"). The following year, Chondo Kyo was established as a modern religious organisation. Its central headquarters were based in Seoul.\nOver the years of Japanese colonial rule since the annexation in 1910, Son, Byong-Hi, like all Koreans, longed for freedom and independence. As a result of these years of oppression, he helped to set up a systematic underground anti-Japanese movement throughout 1918 which saw uprecedented cooperation between Chondo Kyo, Christians and Buddhists as they united under a common cause. Son\'s Chondo Kyo gave financial support to the movement, and he insisted that the independence movement must be popular in nature and non-violent. A Declaration of Independence was prepared and 33 national leaders selected, 15 of which were members of Chondo Kyo. Son, Byong-Hi was the most prominent of these.\nThe climax came on March 1, 1919 when, during a period of public mourning for the recently deceased Emperor Ko-Jong, the Declaration of Independence was publicly proclaimed at Pagoda Park in Seoul. This spark ignited the public, who took to the streets and demonstrated, calling for Korean independence. This initiated a nationwide movement in which many people took part, regardless of locality and social status, but the Japanese immediately mobilised their police and army and brutally put down the demonstrations, despite their peaceful nature. More than 6,000 Koreans were killed, some 15,000 wounded, and around 50,000 arrested, including Son, Byong-Hi.\nWhile in prison Son became ill and was eventually released from custody on sick bail. His illness worsened, however, and in 1922 he died at home in Sangchunweon.\nSon, Byong-Hi selflessly devoted his life, both in terms of his spiritual ideals and his political ideals, to the oppressed Korean masses and the Korean nation.\n* Dong Hak ("Oriental Culture") was a Korean religion founded in 1860 by Ch\'oe Suun. Dong Hak venerated the god "Hanulnim" ("Lord of Heaven"), and believed that man is not created by a supernatural God, but man is instead caused by an innate God. Koreans have believed in Hanulnim from ancient times, so Dong Hak could be seen to be a truly Korean religion, unlike Buddhism or Christianity.'
WHERE ID = 1018;

UPDATE `Patterns`
SET LongMeaning = 'Kim Duk Ryang was born in 1567, in Lee Dynasty Korea. He joined the army and rose to become a commander of the royal troops.\nWhen Japan invaded in 1592, he was promoted to the rank of general and, in 1594, he was appointed as commander-in-chief of the Honam district. He was immediately called upon to defend his district, and succeeded in repelling the Japanese invaders. He and another commander, Ja, Woo-Kwak, followed the routed Japanese troops and destroyed their camps. As a result of this his reputation grew, and the Japanese forces became afraid of him. He was nicknamed General Ho-Ik (“tiger wing”) as a result of his bravery.\nHe was regarded jealously by King Sonjo’s subordinates, and they engineered his arrest and imprisonment in 1595 on falsified charges relating to the killing of a slave girl, but he was later released by decree of the king. He was eventually implicated in the rebellion orchestrated by Lee, Mong-Hak in 1596 and sentenced to death by poisoning, although he was later exonerated and absolved of any dishonour.'
WHERE ID = 1019;

UPDATE `Patterns`
SET LongMeaning = 'The Juche Idea was improvised in the 1950s by Kim, Il-Sung, and became the official state ideology of the Democratic People’s Rebublic of Korea (DPRK) in 1972.\nJuche is often described as “self-reliance”. When applied to an individual this can be interpreted as meaning that man is the master of his own self, his own world and his own destiny. The true meaning of Juche is more nuanced, however, as it was devised as a political rather than a personal philosophy. Kim, Il-Sung explained: “Establishing Juche means, in a nutshell, being the master of revolution and reconstruction in one’s own country. This means holding fast to an independent position, rejecting dependence on others, using one’s own brains, believing in one’s own strength, displaying the revolutionary spirit of self-reliance, and thus solving one’s own problems for oneself on one’s own responsibility under all circumstances.”\nThe Juche philosophy carries a great deal of controversy with it due to its political purpose and application in North Korea by Kim, Il-Sung and subsequently Kim, Jong-Il, and full understanding of it would require extensive exploration of its many aspects.'
WHERE ID = 1020;

-- UPDATE `Patterns`
-- SET LongMeaning = 'U-Nam'
-- WHERE ID = 1031;

-- UPDATE `Patterns`
-- SET LongMeaning = 'Ko-Dang was one of the original 24 patterns created by General Choi. In the early 1980s, however, Ko-Dang was removed from the official syllabus by General Choi and replaced by a new pattern which he named Juche. Ko-Dang was a famous South Korean anti-communist, and when Choi began to spread his art throughout the world, and to North Korea in particular, he removed this pattern so as not to offend anyone.\nKo-Dang is now commonly referred to as the 25th pattern.'
-- WHERE ID = 1021;

UPDATE `Patterns`
SET LongMeaning = 'One of the earliest displays of Korean nationalism under the Japanese occupation of Korea came in the form of the Sam-Il (meaning literally “three-one”, referring to the first day of the third month) Movement, which occurred on the 1st of March 1919.\nThe inspiration for these actions came from the “Fourteen Points” and the right of national “self-determination of weak nations” proclaimed by President Woodrow Wilson at the Paris peace talks earlier that year. After hearing news of the Wilson’s talk and realizing its consequences, Korean students studying in Tokyo published a statement that demanded Korean independence. When this news reached the underground movement in Korea that had been secretly forming throughout 1918, composed of 33 Chondo Kyo, Buddhist and Christian leaders including Son, Byong-Hi (Eui- Am), it was decided that the time to act was nearing. Secret plans were drawn up and information disseminated by word of mouth throughout the towns and villages of Korea.\nIt was decided that the movement should be staged two days before the funeral of Emperor Ko-Jong. From a Korean point of view this funeral brought to an end not only the Lee Dynasty but also one of the last symbols of the Korean nation. With the death of their Emperor, Koreans realized that any possibility of an independently ruled nation was lost, and that Korea lay solely in the hands of the colonial Japanese. This situation provided the necessary momentum for the Korean independence movements to mobilize themselves.\nAt 2pm on the 1st of March, the 33 patriots who formed the core of the Sam- Il movement assembled at Pagoda Park in downtown Seoul to read the Declaration of Independence that they had drawn up, and the crowds that had assembled in the park to hear it formed into a procession. The leaders of the movement signed the document and sent a copy to the Japanese Governor General, with their compliments. They then telephoned the central police station to inform them of their actions. As such, the\nJapanese police fell upon the procession and it was soon crushed and the leaders of the movement arrested. It is said that the crowd was fired upon by the officers. According to reports issued by the Yon-Hap news agency, "...more than 6,000 demonstrators were killed and about 15,000 wounded. Some 50,000 others were arrested by the Japanese police". According to another report the crowd cheered the arrested men.\nCoinciding with these events, special delegates associated with the movement also read copies of the proclamation from appointed places throughout the country at 2pm on that same day, but the nationwide uprisings that resulted were also brutally put down by the Japanese police and army.\nAs international response to the incident was virtually non-existent, one of the most important teachings resulting from the Sam-Il Movement for the nationalists was that they essentially needed to rely solely on their own efforts. They could not expect assistance from other, foreign nations to fight a battle that was not their own.\nIt is said that the Sam-Il Movement was one of the most extraordinary examples of passive resistance to foreign domination that the world has ever seen.'
WHERE ID = 1022;

UPDATE `Patterns`
SET LongMeaning = 'Kim, Yoo-Sin was born in Gyeyang, Jincheon in 595 AD, became a Hwa-Rang warrior at just 15 and was an accomplished swordsman and a Kuk-Son (Hwa- Rang leader) by the time he was 18 years old. By the age of 34 he had been given total command of the Silla armed forces.\nYoo-Sin felt that Paekche, Koguryo and Silla should not be separate countries, but should instead be united because all the people had the same ethnic background. He is regarded as the driving force in the unification of the Korean peninsula, and is the most famous of all the generals in the unification wars of the Three Kingdoms, but his victories were tempered by his regret that they had to be at the expense of people he considered\nto be ethnically the same as him. His first military engagement is believed to have occurred around 629, and through it he quickly proved his capabilities as a warrior. Silla was in a constant struggle with its neighbour to the west, Paekche, over territory. There had been gains and losses on both sides, and the struggle lasted for many years. It was during this period that Kim rose through the ranks of the military, rising to the position of general and becoming a skilled field commander.\nMany stories exist about General Kim, Yoo Sin. It is told that once he was ordered to subdue a rebel army, but his troops refused to fight as they had seen a large shooting star fall from the sky and believed it to be a bad omen. To regain control, the General used a large kite to carry a ball of fire into the sky. The soldiers, seeing the “star” return to heaven, rallied and defeated the rebels. It is also said that General Kim ingeniously used kites as a means of communication between his troops when split between islands and the mainland.\nAnother story tells that once, while Silla was allied with China against Paekche, an argument broke out between Yoo-Sin\'s commander and a Chinese general. As the argument escalated into a potentially bloody confrontation, Yoo-Sin\'s sword was said to have leaped from its scabbard into his hand. Because the sword of a warrior was believed to be his soul, this occurrence so frightened the Chinese general that he immediately apologized to the Silla officers. Incidents such as this kept the Chinese in awe of the Hwa-Rang, and meant that in later years, when asked by the Chinese emperor to attack Silla, the Chinese generals refused, claiming that although Silla was small, it could not be defeated.\nWhen Koguryo and Paekche attacked Silla in 655, Silla joined forces with Tang Dynasty China to battle the invaders. Although it is not clear when Kim first became a general, he was certainly commanding the Silla forces at this time. Eventually, with the help of the Silla navy and some 13,000 Tang forces, Kim attacked the Paekche capital, Puyo, in 660 in one of the most famous battles of the 7th century. The Paekche defenders were commanded by none other than General Ge-Baek, although the Paekche forces consisted of about 5,000 men and were no match for Kim\'s warriors, which numbered about ten times as many. Paekche, who had been experiencing internal political problems, crumbled. Kim\'s Silla forces and their Tang allies now moved on Koguryo from two directions, and in 661 they attacked the seemingly impregnable Koguryo Kingdom but were repelled. The attack had weakened Koguryo, though, and in 667 another offensive was launched which, in 668, destroyed Koguryo forever. Silla still had to subdue various pockets of resistance, but their efforts were then focused on ensuring that their Chinese allies did not overstay their welcome on the peninsula. After some difficult conflicts, Silla eventually forced out the Tang and united the peninsula under their rule.\nKim was rewarded handsomely for his efforts in these campaigns. He reportedly received a village of over 500 households, and in 669 was given some 142 separate horse farms, spread throughout the kingdom. He died four years later at the age of 78, leaving behind ten children.\nGeneral Kim, Yoo-Sin lived to the age of 78 and is considered to be one of Korea\'s most famous generals of all time. Following his death in 673, General Kim was posthumously awarded the honorary title of King Heungmu, and was buried at the foot of Mt. Songhwasan, near Kyongju on the southeast coast of Korea, in a tomb as splendid as that of kings.'
WHERE ID = 1023;

UPDATE `Patterns`
SET LongMeaning = 'Choi Yong was born in 1316 in Ch\'orwon, Kangwon Province. His beginnings were humble, and his lifestyle would best be described as spartan. He paid little heed to his own clothes and meals, and eschewed fine garments or other comforts even when he became famous and could easily have enjoyed them. He disliked men who desired expensive articles, and he viewed simplicity as a virtue. His motto, inherited from his father, was “Do not be covetous of gold”.\nSuch a man was well suited for military service, and Choi quickly gained the confidence of both his men and his king during numerous battles with Japanese pirates who began raiding the Korean coast around 1350.\nAt 36 years of age he became a national hero when he successfully put down a rebellion by Cho, Il-Shin after his insurgents had surrounded the palace and killed many officials and Cho had proclaimed himself king. Then, in 1355, an armed rebellion took place in the troubled Mongol Yuan Dynasty that occupied part of China. Choi Yong was sent to help the Mongols quash the rebellion, and his success in nearly thirty different battles won him even more fame and favour at home. Upon returning to Korea, he dutifully reported to King Kongmin the internal problems experienced by the dying Yuan Dynasty, which gave the king the idea that the time was right to reclaim some of the northern territories previously lost to the Mongols.\nChoi commanded his troops well and recovered many towns west of the Yalu River, to the great delight of his king.\nHe served briefly as the Mayor of Pyongyang, where his efforts at increasing crop production and mitigating famine won him even more attention as a national hero. Then, in 1363, he distinguished himself further when a powerful government official named Kim, Yon-An tried to take control of the government and Choi was forced to defeat a 10,000-man Mongol force that attacked Koryo in support of the rebellion. Meanwhile, following a dream that he thought predicted that a Buddhist monk would save his life, King Kongmin promoted a monk named Shin Ton to a lofty position within his court, and allowed him considerable influence. Shin Ton , though, was ruthless and corrupt, and Choi – who vigorously opposed corruption in the kingdom – found himself at odds with him. Shin Ton engineered false accusations of misconduct against Choi that resulted in a punishment of six years in exile, and brought him dangerously close to the death penalty. When Shin Ton died, though, Choi Yong was restored to his previous position and was immediately asked to prepare a fleet to fight the Japanese pirates and eliminate the remaining Mongol forces on Cheju Island.\nHe engaged the Mongols first, who fought tenaciously, but Choi\'s forces eventually freed the island. Then, in 1376, the Japanese pirates advanced into Koryo and captured the city of Kongju. Chong, Mong-Chu (Po-Eun) secured assistance from the Japanese Shogun to eliminate these pirates, but the Japanese were of little help and General Choi Yong and his subordinate Yi, Sung-Gae managed to rout and eventually defeat them and reclaim Kongju.\nThe Ming Dynasty in China had become powerful during the 14th Century, and had driven back the Mongols and occupied part of north-eastern Koryo. In 1388, General Yi, Sung-Gae was ordered to use his armies to push the Ming armies out of the Korean peninsula. Knowing of the support he enjoyed both from high-ranking government officials and the general populace, however, he decided to return to the capital, Kaesong, and secure control of the government instead of possibly destroying his army by attacking the Chinese. When Yi returned, the loyal Choi Yong put up a gallant fight at the palace but was overwhelmed. Records differ as to what happened next, although it seems likely that he was banished to Koyang and later beheaded. Choi Yong is remembered as a great general who was wholeheartedly devoted to the protection of his country. He risked his life many times for Koryo, and his unswerving loyalty eventually cost him his life.'
WHERE ID = 1024;

UPDATE `Patterns`
SET LongMeaning = 'Yon-Gae Somoon was a famous general who lived in 7th century Koguryo. Koguryo was an aggressive and warlike nation with wide territories. It had developed a horse-riding culture and placed great emphasis on its military. These circumstances led to the formation of the Koguryo “Sunbae”, an organisation of strong warriors that served to protect and strengthen the state and its centralised authoritarian ruling system. Both Yon-Gae Somoon and his son Namsang were known to have been members of the Sunbae.\nIn 612, Sui China had attempted to invade Koguryo, and would have done so if it had not been for the efforts of the great General Ul-Ji Moon Dok. The Sui Dynasty in China was overthrown by the Tang Dynasty in 618, and the new regime held greedy expansionist ambitions. When Emperor Taizong took over the Tang throne in 627 he dispatched troops to northern Koguryo to dismantle Koguryo monuments at the sites of Sui Dynasty soldiers\' mass graves.\nIn 642, General Yon-Gae Somoon seized power from King Jianwu, and over the next few years the Chinese attacks grew more and more successful so that by 645 they had conquered a number of fortresses and towns, including Liaodong, the main base on the frontline. Taizong was serious enough about his conquest to have had 500 ships built to support it. In 645, though, the Tang offensive reached the fortress at Ansi.\nAt the fortress the army and general population of Koguryo, led by Yon-Gae, made a great stand and fiercely confronted the invading Tang, managing to resist the concentrated attack for 60 days. They fought valiantly, injuring Emperor Taizong himself, and the combination of their valour and the inclement winter forced the Chinese to retreat.\nTaizong continued his campaign against Koguryo for two years, but was unable to deal the killer blow and, in 647, he withdrew. His death in 649 and the subsequent confusion in the Tang Dyasty allowed Yon-Gae to consolidate his forces and retake much of the territory conquered by the Tang.\nAfter the death of Yon-Gae Somoon in 654, bitter dissent gradually began to arise amongst the leading Koguryo generals. When Silla and Tang came to learn of this internal turmoil, they took advantage and attacked Koguryo. After resisting the attack for a year, Pyongyang fell and the Kingdom grew weaker and weaker, until it was eventually destroyed in 668.'
WHERE ID = 1025;

UPDATE `Patterns`
SET LongMeaning = 'It is not known exactly when or where this great man was born, and unfortunately it is also not known exactly when he died. The best that can be said is that he was born in the mid-6th century and died in the early 7th century, sometime after 618.\nHe was born and raised in the kingdom of Koguryo, in a turbulent era of Korean history. It was a powerful and warlike kingdom, constantly warring with its neighbours, Silla to the southeast and Paekche to the southwest. The balance of power was roughly equal between the three kingdoms, however, and it took the injection of an outside influence to tip the balance. This influence was supplied by the kingdoms’ much larger western neighbor, China. In 589 China had been united under the Sui Dynasty, and this new dynasty, hungry for power, would be the deciding factor in the struggles between Paekche, Koguryo and Silla. This was the background for Ul-Ji Moon Dok as he grew up.\nHe was an educated man, and eventually became a Minister of Koguryo, with skills in both the political and military sciences. He was called upon to render service as a military leader, however, when the very existance of the kingdom became threatened by alliances between its rival neighbors.\nThe Sui Dynasty was suspicious of Koguryo and saw its aggressive ways as threatening, so in 612 Sui Emperor Yang Je decided to subdue this dangerous neighbour and prepared to attack. He mustered an army of over one million men and personally led them against Koguryo. They quickly overran Koguryo outposts, camped on the banks of the Liao River and prepared to bridge it. General Ul-Ji Moon Dok was called upon to assist in the defence of the nation, and so he prepared to meet the superior Sui forces with a strategy of false retreat, deception and attack.\nAfter the Sui forces crossed the Liao River, a small contingent was sent to attack the Koguryo city of Liaotung, but General Ul-Ji sent his forces to meet them there and drove them out. As the rainy season progressed, the Sui forces tried other probing attacks, but these were not really of any significance, as they were mainly biding their time until the rainy season passed.\nWhen the rains stopped, Yang Je moved his forces to the banks of the Yalu River in northwestern Korea and prepared for a major assault. General Ul-Ji visited the Chinese camp under the pretense of surrender in an attempt to discover any Sui weaknesses. Emperor Yang Je listened to General Ul-Ji and allowed him to leave the camp, but shortly after changed his mind and set out after him. But it was too late – the general had discovered what he needed to defeat the force. He had learned that the Sui forces were short of provisions and had overstretched their supply lines, and so he decided to pursue a strategy of gradual retreat, hoping to lure his enemy deeper and deeper into hostile territory. He drew the Sui on, fighting a kind of guerrilla warfare, picking when and where he fought and allowing the Sui forces to feel as though victory was close at hand, all the while luring them deeper into his trap.\nA Sui advance force of over 300,000 men was sent to take the city of Pyongyang. General Ul-Ji continued to lure them closer and closer to the city, but led them to a strategic point where he could strike. His forces attacked from all sides, driving the Sui troops back in utter confusion. His troops pursued the retreating army, slaughtering them almost at will, so that it is said that only 2,700 troops successfully made it back to the main body of forces. This was the great battle of Salsu, and it has come to be known as one of the most glorious military triumphs in Korea\'s history. Following this defeat, winter began to set in and the Sui forces, short on provisions, were forced to return home.\nThe Sui Dynasty was beginning to disintegrate and Yang Je decided that he urgently needed to expand his empire in order to regain power, but the two more desperate attacks on Koguryo by Yang Je following spring met with similar disaster, and eventually internal rebellion in China forced the Sui to give up its desires on Koguryo. By 618, the relatively short-lived Sui Dynasty was replaced by the Tang Dynasty. General Ul-Ji Moon Dok\'s strategy and leadership had saved Koguryo from the Chinese.\nProbably the most distinguished military leader of the Koguryo period and one of the most well-known generals in Korean history, General Ul-Ji Moon Dok\'s leadership and tactical acumen was the decisive factor in saving Koguryo from destruction at the hands of the invading Chinese. He faced forces of far superior numbers and not only turned them back but was able to pursue and destroy them with such vigor that they were not able nor inclined to return. His life was filled with enough spectacular success to earn him a permanent place among Korea\'s most remembered. He is still celebrated as a great Korean hero, and a main street in downtown Seoul, Ulji-ro, is named after him.'
WHERE ID = 1026;

UPDATE `Patterns`
SET LongMeaning = 'Moon-Moo was born Prince Bubmin, and was the son of King Mu-Yal, 29th king of the Silla Dynasty. He took the name Moon-Moo when he succeeded his father to the throne in 661.\nHe ascended to the Silla throne in the midst of the long conflict against Paekche and Koguryo, shortly after General Ge-Baek and Paekche had been defeated at Puyo by General Kim, Yoo-Sin. The first years of his reign were spent trying to defeat Koguryo, following an abortive attempt in 661. Finally, in 667, he ordered another attack which led, in 668, to the defeat of Koguryo. After the small isolated pockets of resistance were eliminated, King Moon-Moo was the first ruler ever to look upon the Korean peninsula and see it completely unified.\nKing Moon-Moo ruled over unified Silla for 20 years, until he fell ill in 681. On his deathbed, he left his last will and testament, and abdicated to his son, Prince Sin-Moon. Before he died he said\n“A country should not be without a king at any time. Let the Prince have my crown before he has my coffin. Cremate my remains and scatter the ashes in the sea where the whales live. I will become a dragon and thwart the Japanese invasion.”\nKing Sin-Moon did as his father asked and scattered his ashes over Daewangam (the Rock of the Great King), a small rocky islet a hundred metres or so off the Korean coast. Moreover, King Sin-Moon built the Gomun Temple (the Temple of Appreciated Blessing) and dedicated it to his father, he built a waterway for the sea dragon to come to and from the sea and land, and he built a pavilion, Eegun, overlooking the islet so that future kings could pay their respects to the great King Moon-Moo.\nIn a dream, King Moon-Moo and the famous general Kim, Yoo-Sin appeared to King Sin-Moon and told him that blowing on a bamboo flute would calm the heavens and the earth. King Sin-Moon awoke from the dream, rode out to the sea and received the bamboo flute Monposikjuk. It was said that the blowing of the bamboo flute invoked the spirits of King Moon-Moo and General Kim, Yoo-Sin and would push back enemy troops, cure illnesses, bring rain during drought and halt the rains in floods.'
WHERE ID = 1027;

UPDATE `Patterns`
SET LongMeaning = 'Little is known of the early life of Choi, Hyong Ung, other than that he was born in 1520 and that he became a monk. As was common for monks in this time, he travelled from place to place, living in a succession of monasteries. Buddhist monks had been forced to keep a low profile since the end of the Koryo period, as General Yi, Sung-Gae had been forced to eject Buddhism from its state of total permeation of government, in order to gain the support of Neo-Confucian scholar-officials to consolidate his position against his Buddhist political opponents when he overthrew King Gongyang in 1392. This was the beginning of the suppression of Buddhism, which came into full flower during the succeeding Lee Dynasty.\nBefore ever having tested his hand as a military commander, So-San was a first-rate Seon (Korean Buddhism) master and the author of a number of important religious texts, the most important of which is probably his “Seon gugam”, a guide to Seon practice which is studied by Korean monks even today. Like most monks of the Lee Dynasty, So-San had been initially educated in Neo-Confucian philosophy. Dissatisfied, though, he wandered through the mountain monasteries. Later, after making a name for himself as a teacher, he was made arbiter of the Seon school by queen Munjeong, who was sympathetic towards Buddhism. He soon resigned from this responsibility, returning to the itinerant life, advancing his Seon studies and teaching at monasteries all around Korea.\nThe mountains where the monasteries were located were dangerous, and so the monks had to learn to defend themselves. So-San recognised that the development of armour made striking and kicking much less effective, but he also noticed that wherever the armour bends, so does the body. He saw that by manipulation of these joints one could defeat an armoured opponent on the battlefield. He also applied this same principle to the use of a rope or belt as a weapon, which he discovered can be wrapped around the body of your attacker, trapping weapons and, when necessary, breaking joints as it wraps. It was used by So-San and the soldiers he trained to immobilise, carry and even kill their opponents. Wrapped around the mouth and nose the rope would prevent the opponent from breathing, bringing about unconsciousness and allowing them to be taken as a prisoner. Many of these techniques were adopted and developed to give birth to the modern art of Hapkido.\nAt the beginning of the 1590s, Japanese Shogun Toyotomi Hideyoshi, after stabilising Japan during this era of warring nations, made preparations for a large scale invasion of Korea. Korea was unaware of the situation in Japan, however, and was unprepared for the Japanese aggression. In 1592, after rebuffing Japan’s request for aid in conquering China, approximately 200,000 Japanese soldiers invaded Korea, and the Waeran (Japanese War) began. At the beginning of the invasion, King Sonjo fled the capital, leaving a weak, poorly-trained army to defend the country. In desperation he called on Master So-San to organise monks into guerilla units. Even at 73 years of age he managed to recruit and deploy some 5,000 of these warrior monks, who enjoyed some instrumental successes.\nAt first, the Korean armies suffered repeated defeats, and the Japanese marched north up to Pyongyang and the Hamgyong provinces. At sea, however, the Korean navy, under the command of Admiral Yi, Soon-Sin, enjoyed successive victories. Throughout the country, loyal volunteer armies formed and fought against the Japanese together with the warrior monks and the government armies of Korea.\nThe presence of So-San’s monks\' army, operating out of the Heungguksa temple deep in Mt. Yeongchwisan, was a critical factor in the eventual expulsion of the Japanese invaders in 1593 and again in 1598.\nSo-San died in 1604 leaving behind some 1,000 disciples, 70 of whom were monks and nuns, and many of whom held a prominent role in the later transmission of Korean Buddhism. One of the most important reasons for the restoration of Buddhism to a position of minimal acceptance in Lee Dynasty Korea was the role of So-San’s monks in repelling the Japanese invasion. So- San is also known for his efforts in the continuation of the project of the unification of Buddhist doctrinal study and practice, and in his works strong influence can be seen from Won-Hyo. He is considered the central figure in the revival of Korean Buddhism, and most major streams of modern Korean Seon trace their lineages back to him through one of his four main disciples, all four of whom were lieutenants of his during the war with Japan.'
WHERE ID = 1028;

UPDATE `Patterns`
SET LongMeaning = 'Se-Jong was born Yi Do on the 15th of May 1397, the third son of Prince Chong-An and a grandson of Taejo (Yi, Sung-Gae), who started the Lee Dynasty in 1392. He was born near the royal palace in the capital Hanyang (now Seoul).\nYi Do’s older brother was in line to become king, which suited him, as the young Yi Do was apparently not concerned with becoming king. He was instead interested from an early age in learning and spent most of his time reading books, although at the age of just 12 he found the time to marry Sim On, a young girl two years older than himself.\nPrince Chong-An ascended to the throne in 1400 and took the name Taejong. He watched his young son grow in wisdom as he continued his studies, and by the time Yi Do was 22 years old King Taejong decided to make him Crown Prince and successor to the throne over his older brother. Soon afterward, his father decided to abdicate in favour of his son. Many in the king\'s court (including Yi Do himself) protested that the young man was not yet ready to shoulder such responsibility, but the king insisted and so in 1418 Yi Do became king and took the name Se-Jong.\nKing Se-Jong believed that good government could only come when a king recognised and trained talented men and installed them into influential governmental positions to administrate the various branches of government. To this end he established the Chipyonjon (Jade Hall of Scholars), an amalgamation of the Hall of Art and the Hall of Literature that he made sure included an extensive library. King Se-Jong then chose twenty of his most able scholars and made them Masters of Learning, a position that freed them to devote themselves full time to advanced learning. He also set up a system that encouraged local governors throughout the country to report to the king any individuals who distinguished themselves. These individuals were then given the chance to become government officials, or other positions according to their talents.\nOne of King Se-Jong\'s goals – the one for which he is most famous – was to make his people more educated by making it easier for them to become literate. At that time the Koreans used the Chinese script to document their spoken language, but Chinese writing consisted of thousands of individual characters that takes significant effort to master. King Se-Jong recognised that this was a barrier to learning, and threw his efforts into developing a system of writing that was simple and effective, and by 1443 he had completed the Hangul alphabet. He was so concerned with its perfection that he kept it for another three years so that he could test and modify it until he was satisfied. There was much resistance to the language, when it was first unveiled, from scholars who thought it would, among other things, limit the scholarly study of the Chinese classics. The king insisted, however, and ordered many of his scholars to begin translating classic books and Buddhist scriptures into Hangul. This greatly increased the ability of the layperson to become educated. In addition, he ordered that books be written that would be of help to the common man, such as the Farmers’ Handbook, which provided guidance on farming methods and techniques to increase production. He also ordered more technical books to be written, such as a complete medical dictionary, and an 85-volume pharmaceutical encyclopaedia that contained medical therapies, acupuncture techniques and herbal prescriptions to treat 959 different diseases.\nKing Se-Jong also had some impressive political achievements. It was during his reign he was able finally to subjugate the Japanese pirates who had been raiding the Korean coastline for so many years. He extended the territory of Korea as far north as the Yalu River, and, domestically, he tried to control corruption and raise the moral standards of the entire country.\nTowards the end of his life, King Se-Jong tragically (and somewhat ironically) became afflicted by a paralysis that prevented him from speaking more than a few words at a time. He later developed a cancer and died in 1450 at the age of 52, after nearly 30 years on the throne.\nHe is proudly remembered as a king who was concerned for his people and fully committed to their intellectual advancement. Today, the main thoroughfare running north to south in front of Kyongbok Palace in Seoul bears his name. In addition, two holidays are related to him: Hangul Day (9 October) and King Se-Jong Day (15 May).'
WHERE ID = 1029;

UPDATE `Patterns`
SET LongMeaning = 'After Japan occupied Korea in 1910, the country remained part of the Japanese Empire until 1945. Following Japan\'s surrender at the end of World War II, Korea was liberated from the Japanese. As it was liberated by both Soviet and US forces, the responsibility for overseeing the rebuilding and rehabilitation of Korea was divided between the two sides, and the country was divided along the 38th parallel. The USSR occupied Korea north of this line, the USA occupied the south.\nUnder the auspices of the UN, a democratic government established the Republic of Korea (South Korea) in 1948, with its capital in Seoul. The Soviets established the communist Democratic People\'s Republic of Korea (North Korea) with its capital in Pyongyang. The peninsula remains divided in this way to this day.\nKorea has not been truly free since Japan started to encroach in 1876, and has been divided since 1945, not just in terms of being two separate states - the ideologies and politics of the two countries are also vastly different.\nIt was the dream of General Choi, Hong Hi to see a unified Korea.'
WHERE ID = 1030;

-- --------------------------------------------------------

--
-- Table structure for table `Motions`
--

CREATE TABLE IF NOT EXISTS `Motions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `ShortDescription` varchar(50) NOT NULL,
  `Encyclopedia` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2008 ;

--
-- Dumping data for table `Motions`
--

INSERT INTO `Motions` (`ID`, `Name`, `Description`, `ShortDescription`, `Encyclopedia`) VALUES
(2000, 'Normal Speed', 'Approx. 1.2 seconds per technique', NULL, NULL),
(2001, 'Continuous Motion', '1 Breath, 2 Sine Waves', NULL, NULL),
(2002, 'Fast Motion', '2 Breaths, 1.5 Sine Waves', NULL, NULL), -- '2 B 1½ KS'
-- (2003, 'Continuous* Motion', '1 Breath, 2 Sine Waves', '1 B', NULL),
(2003, 'Connecting Motion', '1 Breath, 1 Sine Wave', NULL, NULL),
(2004, 'Slowly', '3 times normal execution time (~3.6 sec)', NULL, NULL),
(2005, 'Consecutive Kicking Motion', '2 Breaths, 2 Sine Waves', NULL, NULL);
-- (2006, 'Simultaneously', '1 Breaths, 1 Sine Wave', '1 b 1 sw', NULL),
-- (2007, 'Consecutive Motion', '2 Breaths, 2 Sine Waves', '2 b 2 sw', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Movements`
--

CREATE TABLE IF NOT EXISTS `Movements` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `IsDirectionChange` tinyint(1) NOT NULL DEFAULT '0',
  `Notes` tinytext,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3046 ;

--
-- Dumping data for table `Movements`
--

INSERT INTO `Movements` (`ID`, `IsDirectionChange`, `Name`, `Notes`) VALUES
(3000, 0, 'Stepping Forward', NULL),
(3003, 0, 'Stepping Backward', NULL),
(3013, 0, 'Stepping Across L', NULL),
(3031, 0, 'Stepping Across R', NULL),

(3007, 1, 'Turning L 30°', NULL),
(3015, 1, 'Turning L 60°', NULL),
(3001, 1, 'Turning L 90°', NULL),
(3009, 1, 'Turning L 120°', NULL),
(3028, 1, 'Turning L 150°', NULL),
(3012, 1, 'Turning L 180°', NULL),
(3005, 1, 'Turning L 270°', NULL),
(3052, 1, 'Turning L 300°', NULL),
(3008, 1, 'Turning L 330°', NULL),
(3047, 1, 'Turning L 360°', NULL),

(3014, 1, 'Turning R 30°', NULL),
(3010, 1, 'Turning R 60°', NULL),
(3002, 1, 'Turning R 90°', NULL),
(3050, 1, 'Turning R 120°', NULL),
(3027, 1, 'Turning R 150°', NULL),
(3004, 1, 'Turning R 180°', NULL),
(3046, 1, 'Turning R 210°', NULL),
(3054, 1, 'Turning R 240°', NULL),
(3016, 1, 'Turning R 270°', NULL),
(3044, 1, 'Turning R 360°', NULL),

(3017, 1, 'Spot Turn Method 1 L 180°', NULL),
(3006, 1, 'Spot Turn Method 1 R 180°', NULL),

(3011, 0, 'Slipping Forward', 'One foot moves without taking a step.'),
(3018, 0, 'Slipping {Pulling} Backward', 'One foot moves without taking a step. When done in while moving backward, this is referred to as "pulling the foot" or "pulling backward". But in order to be consistent, it is described here as "slipping backward".'),

(3022, 0, 'Sliding Forward [~2 FT]', 'Both feet move without taking a step approx. 2 Foot Lengths.'),
(3026, 0, 'Sliding {Shifting} Backward [~2 FT]', 'Both feet move without taking a step approx. 2 Foot Lengths. When done in while moving backward, this is referred to as "shifting backward". But in order to be consistent, it is described here as "sliding backward".'),

(3048, 0, 'Sliding Across L [~2 FT]', 'Both feet move without taking a step approx. 2 Foot Lengths.'),
(3049, 0, 'Sliding Across R [~2 FT]', 'Both feet move without taking a step approx. 2 Foot Lengths.'),

(3023, 0, 'Flying {Jumping} Forward [~5 SW]', "Jumping/Flying technique covering approx. 5 Shoulder Widths."),

(3019, 0, 'Jumping Forward [~1½ SW]', 'Approx. 1½ Shoulder Widths.'),
(3033, 0, 'Jumping Backward [~1½ SW]', 'Approx. 1½ Shoulder Widths.'),
(3040, 1, 'Jumping Forward [~1½ SW] L 360°', 'Approx. 1½ Shoulder Widths.'),
(3041, 1, 'Jumping Forward [~1½ SW] R 360°', 'Approx. 1½ Shoulder Widths.'),
(3042, 1, 'Jumping Backward [~1½ SW] R 360°', 'Executed as part of a dodging maneuver.'),
(3043, 1, 'Jumping Backward [~1½ SW] L 360°', 'Executed as part of a dodging maneuver.'),
(3030, 0, 'Jumping Up', NULL),
(3024, 0, 'Jumping Up L 360°', NULL),
(3038, 0, 'Jumping Forward [~1 SW]', 'Approx. 1 Shoulder Width.'),
(3051, 0, 'Jumping Forward [~2 SW]', 'Approx. 2 Shoulder Widths.'),
(3029, 0, 'Jumping L [~½ SW]', 'Executed as part of a dodging maneuver.'),
(3055, 1, 'Jumping Forward [~1 SW] L 180°', 'Approx. 1½ Shoulder Widths.'),
(3056, 1, 'Jumping Forward [~1 SW] R 180°', 'Approx. 1½ Shoulder Widths.'),
(3057, 0, 'Jumping Forward [~2 SW] R 360°', 'Approx. 2 Shoulder Widths.'),

(3020, 1, 'Pivot L 120°', NULL),
(3021, 1, 'Pivot R 120°', NULL),
(3039, 1, 'Pivot L 60°', NULL),
(3053, 1, 'Pivot R 60°', NULL),
-- (3058, 1, 'Pivot R 90°', NULL),
-- (3059, 1, 'Pivot L 90°', NULL),

(3036, 0, 'Double Stepping Backward', NULL),
(3025, 0, 'Double Stepping Forward', NULL),

(3034, 0, 'Shuffle Forward', 'Rear foot steps to the back of the front foot, then the front foot steps forward.'),
(3035, 0, 'Shuffle Backward', 'Front foot steps to the front of the back foot, then the back foot steps backward.'),

(3037, 0, 'Crouch Down', 'Lower body toward ground.'),
(3045, 0, 'Stand Up', 'Stand up from lowered position.'),


(3032, 0, '&nbsp;', NULL),



(3100, 1, 'Turning L 45°', NULL),
(3101, 1, 'Turning R 45°', NULL),
(3102, 1, 'Turning L 90+45°', '90+45=135'), -- 90+45?
(3103, 1, 'Turning R 90+45°', '90+45=135'), -- 90+45?

(3104, 1, 'Turning R 180+45°', '180+45=225'), -- 180+45? R only
(3105, 1, 'Turning L 360-45°', '360-45=315'), -- 360-45? L only


(3106, 1, 'Pivot L 45°', NULL),
(3107, 1, 'Pivot R 45°', NULL),
(3108, 1, 'Pivot L ~60°', NULL),
(3109, 1, 'Pivot R ~60°', NULL),
(3110, 1, 'Pivot L 90+45°', '90+45=135'), -- 180+45?
(3111, 1, 'Pivot R 90+45°', '90+45=135'), -- 180+45?
(3112, 1, 'Pivot L ~90°', NULL),
(3113, 1, 'Pivot R ~90°', NULL);

-- 3046

-- --------------------------------------------------------

--
-- Table structure for table `Stances`
--

CREATE TABLE IF NOT EXISTS `Stances` (
  `TechniqueID` int(11) NOT NULL,
  `SortOrder` int(11) NOT NULL,
  `ParentTechniqueID` int(11) DEFAULT NULL,
  `IsMod` tinyint(1) NOT NULL DEFAULT '0',
  `IsRel` tinyint(1) NOT NULL DEFAULT '0',
  `IsDescOnly` tinyint(1) NOT NULL DEFAULT '0',
  `Weight` enum('50/50','40/60','30/70','10/90','100/0') DEFAULT NULL,
  `Length` enum('none','1sw','1.5sw') DEFAULT NULL,
  `LengthMeasurement` enum('outside stance','inside stance','heel-to-heel','toe-to-toe','foot centers','feet are inline') DEFAULT NULL,
  `Width` enum('none','1sw','1.5sw','2.5cm') DEFAULT NULL,
  `WidthMeasurement` enum('outside stance','inside stance','heel-to-heel','toe-to-toe','foot centers') DEFAULT NULL,
  `Characterization` enum('none','supporting leg','front leg','rear leg') DEFAULT NULL,
  `CharacterizationPoints` text,
  `Arms` varchar(255) DEFAULT NULL,
  `ArmsPoints` text,
  `Description` text,
  PRIMARY KEY (`TechniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Stances`
--

INSERT INTO `Stances` (`TechniqueID`, `SortOrder`, `ParentTechniqueID`, `IsMod`, `IsRel`, `IsDescOnly`, `Weight`, `Length`, `LengthMeasurement`, `Width`, `WidthMeasurement`, `Characterization`, `CharacterizationPoints`, `Arms`, `ArmsPoints`, `Description`) VALUES
(10100, 12, NULL, 0, 0, 0, '50/50', '1.5sw', 'toe-to-toe', '1sw', 'foot centers', 'front leg', 'Left toes point forward.\r\nFront of left knee is inline above the rear of the left heel.\r\nRight leg is straight.\r\nRight toes point approx. 25° outward.\r\nTense leg muscles as though squeezing the space between the legs, to solidify the stance.', 'Form a Twin Low Side Block with fists approx. 30cm from thighs, elbows bent approx. 30°.', NULL, 'The Walking Stance is a strong, effective stance to the front and rear when attacking and defending. If the stance is too long (over 1.5 shoulder widths) reaction time is slower and the stance is weaker. If the rear foot angled greater than 25° the knee is weakened to attacks from the rear, if angled less than 25° stability is compromised.'),
(10101, 13, 10100, 1, 0, 0, NULL, NULL, 'inside stance', NULL, NULL, NULL, NULL, 'Form the prescribed attacking tool.', NULL, 'The Low Stance is effective in extending the attacking tool as well as a means to adjust the distance to your target. As this stance is longer than 1.5 shoulder widths, reaction time is slower and the stance is weaker than a Walking Stance. \r\nIf the rear foot angled greater than 25° the knee is weakened to attacks from the rear, if angled less than 25° stability is compromised.'),
(10102, 17, 10104, 0, 1, 0, '10/90', '1sw', 'outside stance', 'none', NULL, 'rear leg', 'Right leg is bent so the knee is inline above the toes.\r\nRight knee points slightly inward.\r\nRight heel is placed slightly inside the left heel.\r\nRight toes should point approx. 15° inward.\r\nLeft leg is bent to allow the ball of the foot to slightly touch the ground.\r\nLeft toes should point approx. 25° inward.', 'Form a Twin Low Side Block.', NULL, 'The Rear Foot Stance is primarily used for defense as the front foot can move spontaneously to kick, adjust distance or stance as the front leg carries only its own weight. Rear Foot Stance is not designated as a “relative” to L-Stance in the Encyclopaedia, but is considered a relative here due to the number of similarities (foot orientation, foot angles, facings, characterization, etc.) to L-Stance.\r\n'),
(10103, 16, 10104, 0, 1, 0, '40/60', '1sw', 'toe-to-toe', 'none', NULL, 'rear leg', 'Both legs are straight.\r\nBoth heels are approx. inline.\r\nBoth feet should be angled inward at approx. 15°.', 'Form a Twin Low Side Block.', NULL, 'Vertical Stance is not designated as a “relative” to L-Stance in the Encyclopaedia, but is considered a relative here due to the number of similarities (foot orientation, foot angles, facings, characterization, etc.) to L-Stance.'),
(10104, 14, NULL, 0, 0, 0, '30/70', '1.5sw', 'outside stance', '2.5cm', 'heel-to-heel', 'rear leg', 'Front of right knee is inline above the right toes.\r\nBack of the right hip is inline above the inside of the knee and ankle (see vertical : line at left).\r\nLeft leg is bent to allow for proper distancing.\r\nBoth feet should be angled inward at approx. 15°.', 'Form a Left Outer Forearm Guarding Block.', NULL, 'The L-Stance is generally used as a defensive technique, but can also be effective in attacking. Due to the weight distribution of the stance, the front leg is available to kick with a slight weight shift. The angling of the feet coupled with the distance between the heels aids stability. If the front heel is placed inline or beyond the rear heel the front legs becomes susceptible to leg sweeps.'),
(10105, 15, 10104, 1, 0, 0, '50/50', NULL, 'toe-to-toe', NULL, NULL, NULL, '\r\n-', NULL, NULL, 'The Fixed Stance is used to attack and defend to the side (over the front leg).\r\nThe angling of the feet coupled with the distance between the heels aids stability. If the front heel is placed inline or beyond the rear heel the front legs becomes susceptible to leg sweeps.'),
(10106, 7, 0, 0, 0, 0, '50/50', 'none', NULL, '1sw', 'inside stance', 'none', 'Both legs are bent so that the knees are inline above the balls of the feet.\r\nToes point forward.\r\nTense leg muscles as though squeezing the space between the legs, to solidify the stance.\r\nPush both the chest and abdomen out while pulling the hips back.', 'Form a Twin Low Side Block with fists approx. 30cm from thighs.', NULL, 'The Sitting Stance is a stable stance for lateral movement and can be easily shifted into a Walking Stance by slightly rotating on the balls of the feet. If the stance is too wide (greater then 1.5 shoulder widths) reaction time is slower and the stance is weaker. If the toes are not pointed forward, stability is compromised.'),
(10108, 4, 0, 0, 0, 0, '50/50', 'none', NULL, '1sw', 'outside stance', 'none', 'Both legs are straight.\r\nToes point forward.', 'Relaxed at side, elbows angled inward, fists lightly clenched approx. 5cm apart and 7cm in front of abdomen.', 'Ready (Junbi): Upper arms angled forward approx. 30°, forearms angled upward approx. 40°, elbows approx. 10cm from floating ribs (extending to the side only as much as necessary), fists lightly clenched approx. 5cm apart and 7cm in front of abdomen.\r\nWarrior Stance A: Left Vertical Punch at side of waist with Right Finger Bellies covering the Left Fore-Fist.\r\nWarrior Stance B: Right Vertical Punch at side of waist with Left Finger Bellies covering the Right Fore-Fist.\r\n', 'The Parallel Stance is primarily used as a preparatory technique, but it can be used for attacking or defense.'),
(10109, 3, 0, 0, 0, 0, '10/90', 'none', NULL, 'none', NULL, 'supporting leg', 'Right leg is bent so that the knee is approx. inline above the toes.\r\nLeft leg is bent to allow only the ball of the foot to slightly touch the ground.\r\nLeft leg should be placed at a natural angle facing forward (denoted as X° in the figures).\r\n', 'Form a Twin Low Side Block.', '', 'The X-Stance is frequently used as part of a side or front jumping motion or as a preparatory stance. The non-supporting foot is usually crossed behind the supporting foot when jumping (Figure 1), and is always crossed in front when stepping (Figure 2). This stance allows for convenient attacks to the side and front.'),
(10110, 2, 0, 0, 0, 0, '50/50', 'none', NULL, 'none', NULL, 'none', 'Both legs are straight\r\nFeet are together\r\n', NULL, 'Ready (Junbi) Type A: Right fist is clenched with left finger pads placed over the right fore-fist; hands are positioned approx. 30cm directly in front of the philtrum (upper lip).\r\nReady (Junbi) Type B: Right fist is clenched with left finger pads placed over the right fore-fist; hands are positioned approx. 15cm directly in front of the naval (belly button).\r\nReady (Junbi) Type C: Right hand forms a knife-hand with the left hand covering the right (middle fingertips overlap); hands are positioned approx. 10cm directly in front of the abdomen (stomach).\r\nReady (Junbi) Type D: Form a Twin Low Side Block with fists approx. 30cm from thighs.', 'The Close Stance is primarily used as a preparatory technique, but it can be used for attacking or defense.\r\n'),
(10111, 11, 10116, 0, 1, 0, '100/0', 'none', NULL, 'none', NULL, 'supporting leg', 'Right leg is straight.\r\nLeft foot is angled downward (toes down) and slightly outward with the ball of the foot  at the side of the right knee, or with the instep of the left foot placed behind the right knee.', 'Form a Twin Low Side Block.', NULL, 'The One-Leg Stance is primarily used in balancing exercises, but can also be used for attacking and defense. \r\nOne-Leg Stance is not designated as a “relative” to Bending Stance in the Encyclopaedia, but is considered a relative here due to the number of similarities (foot orientation, foot angles, facings, characterization, etc.) to Bending Stance.'),
(10112, 8, 10106, 1, 0, 0, NULL, NULL, 'feet are inline', NULL, NULL, 'front leg', NULL, NULL, '', 'The Diagonal Stance is a strong, effective stance to the front and rear when attacking and defending.'),
(10113, 9, 10112, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Crouched Stance makes use of leg tension (speeding reaction time) by bending the knees inward, but this advantage is also the main disadvantage of the stance as the knees are weakened to side attacks. This stance provides some additional advantages for shifting to other stances quickly and presents a flexible guarding posture to keep your opponent on the move. The distance between the feet can be flexible, leading this to be a more dynamic stance.'),
(10114, 5, 10108, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '\r\n-\r\nToes point slightly inward (denoted as X° in the figure).', 'Relaxed at side with elbows slightly bent and fists lightly clenched.', 'Ready (Junbi): In position similar to Parallel Ready Stance, but with fists positioned lower over thighs.', 'The Inner Open Stance is not often used due to the looseness of the leg muscles and the inherent lack of stability.\r\nThe Inner Open Stance is primarily used as a preparatory technique, but it can be used for attacking or defense.'),
(10115, 6, 10108, 1, 0, 0, NULL, NULL, NULL, NULL, 'heel-to-heel', NULL, '\r\n-\r\nBoth feet are angled outward at approx. 45°.', 'Relaxed at side with elbows slightly bent and fists lightly clenched.', 'Ready (Junbi): In position similar to Parallel Ready Stance, but with fists positioned lower over thighs.', 'The Outer Open Stance is not often used due to the looseness of the leg muscles and the inherent lack of stability. Though the measurement definition differs, the width of the legs is the same as in Parallel Stance. Only the pads of the feet are rotated outward at approx. 45° which gives the appearance of a wider stance.\r\nThe Outer Open Stance is primarily used as a preparatory technique, but it can be used for attacking or defense.'),
(10116, 10, NULL, 0, 0, 0, '100/0', 'none', NULL, 'none', NULL, 'supporting leg', 'Right leg is bent.\r\nReady (Junbi) Type A: Raised left knee pointed approx. 60° from the front (or approx. 30° from the facing direction), sole of the left foot is placed on/near the inside of the right knee and the left foot-sword is parallel to the ground.\r\nReady (Junbi) Type B: Raised left knee pointed to the front; arch of the left foot is placed on/near the inside of the right knee and left foot-sword is parallel to the ground.\r\n', 'Form a Twin Low Side Block.', 'Ready (Junbi) Type A: Form a Left Outer Forearm Guarding Block.\r\nReady (Junbi) Type B: Form a Twin Low Side Block with fists approx. 25cm from thighs, elbows bent approx. 30°.', 'The Bending Stance serves as a preparation for side and back kicks, though it is also frequently used for defense. Bending Ready Stance Type A is primarily a preparation position for executing a side piercing kick or a side thrusting kick. Bending Ready Stance Type B is primarily a preparation position for executing a back piercing kick. The “front” of the stance is defined as the direction the supporting foots toes are pointed (as opposed to the facing of the head, which generally looks toward the non-supporting leg side).'),
(10150, 1, 0, 0, 0, 0, '50/50', 'none', NULL, 'none', NULL, 'none', 'Both legs are straight\r\nFeet are angled outward forming an angle between them of approx. 45°\r\nEyes face to the front, looking slightly above the horizon\r\n', NULL, '', NULL);


-- --------------------------------------------------------

--
-- Table structure for table `Techniques`
--
CREATE TABLE IF NOT EXISTS `TechniqueLinesOfAttack` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TechniqueID` int(11) DEFAULT NULL,
  `IsArmToolTwin` tinyint(1) DEFAULT '0',
  `LineOfAttack` enum('Cl','Bl','Sl','Fl','Rl','RBl','RSl','~Cl','~Bl','~Sl','~Fl','~RBl','~RSl','Fl+RSl','Cl>~Sl','Cl>~Fl','Cl+Cl') DEFAULT NULL,
  `Tool` enum(
	-- 'Forefist','Side Fist','Backfist','Middle-Knuckle Fist','Foreknuckle Fist','Long Fist','Open Fist','X-Fist','Forearm','Inner Forearm','Outer Forearm','Knife-Hand','Reverse Knife-Hand','X-Knife-Hand','Palm','Palm Heel','Alternate Palm','Arch Hand','Backhand','Elbow','Side Elbow','Back Elbow','Fingertip','Straight Fingertip','Flat Fingertip','Upset Fingertip','Double Finger','Bow Wrist','Angle Fingertip','Under Fist',
	'Forefist','Side Fist','Backfist','Middle-Knuckle Fist','Foreknuckle Fist','Long Fist','Open Fist','X-Fist','Forearm','Inner Forearm','Outer Forearm','Knife-Hand','Reverse Knife-Hand','X-Knife-Hand','Palm','Palm Heel','Alternate Palm','Arch Hand','Backhand','Elbow','Side Elbow','Back Elbow','Fingertip','Straight Fingertip','Flat Fingertip','Upset Fingertip','Double Finger','Bow Wrist','Angle Fingertip','Under Fist','X-Palm','Straight Forearm','Straight Knife-Hand','Thumb Ridge','Back Forearm','Straight Elbow','Front Elbow','Finger Pincers',
	'Ball of Foot','Heel','Back of Heel','Instep','Side Instep','Foot Sword','Knee','Reverse Foot Sword','Foot'
  ) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `TechniqueLinesOfAttack`
--

INSERT INTO `TechniqueLinesOfAttack` (`TechniqueID`, `IsArmToolTwin`, `LineOfAttack`, `Tool`) VALUES
(10205, 0, '~Sl', 'Backfist'),			-- Side Strike
(10400, 0, '~Bl', 'Outer Forearm');		-- Block
-- (10400, 1, '~45°', 'Outer Forearm');	-- Block



-- --------------------------------------------------------

--
-- Table structure for table `Techniques`
--

CREATE TABLE IF NOT EXISTS `Techniques` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` enum('Action','Attack','Block','Ready Stance','Stance') DEFAULT NULL,
  `Appendage` enum('Arm','Leg') DEFAULT NULL,
  `IsSectionInferred` tinyint(1) DEFAULT NULL,
  `OfficialName` varchar(255) DEFAULT NULL,
  `KoreanName` varchar(255) DEFAULT NULL,
  `LineOfAttack` enum('Cl','Bl','Sl','Fl','Rl','RBl','RSl','~Cl','~Bl','~Sl','~Fl','~RBl','~RSl','Fl+RSl','Cl>~Sl','Cl>~Fl','Cl+Cl') DEFAULT NULL,
  `IsFullFacing` tinyint(1) NOT NULL,
  `IsSideFacing` tinyint(1) NOT NULL,
  `IsHalfFacing` tinyint(1) NOT NULL,
  `IsReverseHalfFacing` tinyint(1) NOT NULL,
  `IsReverseSideFacing` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11000 ;

--
-- Dumping data for table `Techniques`
--

INSERT INTO `Techniques` (`ID`, `Type`, `Appendage`, `IsSectionInferred`, `OfficialName`, `KoreanName`, `LineOfAttack`, `IsFullFacing`, `IsSideFacing`, `IsHalfFacing`, `IsReverseHalfFacing`, `IsReverseSideFacing`) VALUES
(10000, 'Ready Stance', 'Leg', 0, 'Parallel Ready Stance', NULL, NULL, 1, 0, 0, 0, 0),
(10001, 'Ready Stance', 'Leg', 0, 'Parallel Ready Stance with Heaven Hand', NULL, NULL, 1, 0, 0, 0, 0),
(10002, 'Ready Stance', 'Leg', 0, 'Close Stance with Heaven Hand', NULL, NULL, 1, 0, 0, 0, 0),
(10003, 'Ready Stance', 'Leg', 0, 'Close Ready Stance Type A', NULL, NULL, 1, 0, 0, 0, 0),
(10004, 'Ready Stance', 'Leg', 0, 'Close Ready Stance Type B', NULL, NULL, 1, 0, 0, 0, 0),
(10005, 'Ready Stance', 'Leg', 0, 'Close Ready Stance Type C', NULL, NULL, 1, 0, 0, 0, 0),
(10006, 'Ready Stance', 'Leg', 0, 'Close Ready Stance Type D', NULL, NULL, 1, 0, 0, 0, 0),
(10007, 'Ready Stance', 'Leg', 0, 'Bending Ready Stance Type A', NULL, NULL, 0, 0, 1, 0, 0),
(10008, 'Ready Stance', 'Leg', 0, 'Bending Ready Stance Type B', NULL, NULL, 1, 0, 0, 0, 0),
(10009, 'Ready Stance', 'Leg', 0, 'Parallel Ready Stance with Twin Side Elbow', NULL, NULL, 1, 0, 0, 0, 0),
(10010, 'Ready Stance', 'Leg', 0, 'Warrior Ready Stance A', NULL, NULL, 1, 0, 0, 0, 0),
(10011, 'Ready Stance', 'Leg', 0, 'Warrior Ready Stance B', NULL, NULL, 1, 0, 0, 0, 0),
(10012, 'Ready Stance', 'Leg', 0, 'Parallel Ready Stance with X-Back Hand', NULL, NULL, 1, 0, 0, 0, 0),
(10013, 'Ready Stance', 'Leg', 0, 'Parallel Ready Stance with overlapped Back Hand', NULL, NULL, 1, 0, 0, 0, 0),
(10014, 'Ready Stance', 'Leg', 0, 'Walking Ready Stance', NULL, NULL, 1, 0, 0, 0, 0),


(10100, 'Stance', 'Leg', 0, 'Walking Stance', NULL, NULL, 1, 0, 1, 1, 0),
(10101, 'Stance', 'Leg', 0, 'Low Stance', NULL, NULL, 1, 0, 1, 0, 0),
(10102, 'Stance', 'Leg', 0, 'Rear Foot Stance', NULL, NULL, 0, 0, 1, 0, 0),
(10103, 'Stance', 'Leg', 0, 'Vertical Stance', NULL, NULL, 0, 0, 1, 0, 0),
(10104, 'Stance', 'Leg', 0, 'L-Stance', NULL, NULL, 0, 0, 1, 0, 0),
(10105, 'Stance', 'Leg', 0, 'Fixed Stance', NULL, NULL, 0, 0, 1, 0, 0),
(10106, 'Stance', 'Leg', 0, 'Sitting Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10107, 'Stance', 'Leg', 0, 'Sitting Stance with Body raised slightly', NULL, NULL, 1, 1, 0, 0, 0),
(10112, 'Stance', 'Leg', 0, 'Diagonal Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10113, 'Stance', 'Leg', 0, 'Crouched Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10108, 'Stance', 'Leg', 0, 'Parallel Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10114, 'Stance', 'Leg', 0, 'Inner Open Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10115, 'Stance', 'Leg', 0, 'Outer Open Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10109, 'Stance', 'Leg', 0, 'X-Stance', NULL, NULL, 1, 1, 1, 0, 0),
(10110, 'Stance', 'Leg', 0, 'Close Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10111, 'Stance', 'Leg', 0, 'One-Leg Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10116, 'Stance', 'Leg', 0, 'Bending Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10150, 'Stance', 'Leg', 0, 'Attention Stance', NULL, NULL, 1, 0, 0, 0, 0),
(10151, 'Stance', 'Leg', 0, 'Fighting Stance', NULL, NULL, 0, 0, 1, 0, 0),
(10152, 'Stance', 'Leg', 0, 'Pivoted Fighting Stance', NULL, NULL, 0, 0, 1, 1, 1),
(10153, 'Stance', 'Leg', 0, 'Raised Prone Position', NULL, NULL, 0, 0, 1, 1, 1),


(10200, 'Attack', 'Arm', 0, 'Punch', NULL, 'Cl', 1, 0, 0, 0, 0),							-- v3p25
(10201, 'Attack', 'Arm', 0, 'Strike', NULL, 'Cl', 1, 0, 0, 0, 0),							-- v3p140
(10202, 'Attack', 'Arm', 0, 'Thrust', NULL, 'Cl', 1, 1, 1, 0, 0),							-- - v3p84 Low,Mid,High; 'Upset Fingertip','Straight Fingertip','Flat Fingertip','Double Finger','Angle Fingertip'
(10203, 'Attack', 'Arm', 1, 'Side Thrust', NULL, '~Fl', 1, 1, 0, 0, 0),					-- - v3p92 Mid; (+Twin) '[Side] Elbow','Flat Fingertip'+forefinger; ~Sl? redefine as Back Thust?
(10204, 'Attack', 'Arm', 1, 'Back Thrust', NULL, 'Rl', 1, 0, 0, 0, 0),						-- - v3p98 Mid; 'Elbow'; defined as 'Twin Side Back Elbow' and 'Back Elbow'
(10205, 'Attack', 'Arm', 0, 'Side Strike', NULL, 'Sl', 0, 1, 1, 1, 0),						-- - v3p128-131 Mid,High; 'Knife-Hand',(Twin) 'Backfist','Side Fist'+(Twin) 'Back Hand'; Side Strike = Outward Strike = Outward Side Strike, but Side Strike = Cl & Outward Side Strike = 90°
(10218, 'Attack', 'Arm', 0, 'Outward Strike', NULL, 'Cl>~Fl', 0, 1, 1, 0, 0),			-- - v3p128 Mid,High; 'Knife-Hand',(Twin) 'Backfist','Side Fist'+?(Twin) 'Back Hand'; Side Strike = Outward Strike = Outward Side Strike, but Side Strike = Cl & Outward Side Strike = 90°
-- (102xx, 'Attack', 'Arm', 0, 'Outward {Side} Strike', NULL, 'C', 0, 0, 0, 0, 0),						-- dup 10218
(10207, 'Attack', 'Arm', 0, 'Side Back Strike', NULL, 'Fl', 1, 1, 1, 0, 0),				-- - v3p147 High; 'Backfist'+'Back Hand'
(10208, 'Attack', 'Arm', 1, 'Side Front Strike', NULL, 'Sl', 1, 0, 0, 0, 0),				-- - v3p148 High; 'Backfist'+'Reverse Knife-Hand','Back Hand'
(10211, 'Attack', 'Arm', 1, 'Upset Punch', NULL, '~Bl', 1, 0, 1, 0, 0),						-- - v3p48 Mid; (Twin) 'Forefist','Middle-Knuckle Fist'
(10212, 'Attack', 'Arm', 1, 'Horizontal Punch', NULL, 'Fl+RSl', 0, 1, 0, 0, 0),			-- - v3p68 Mid; Twin 'Forefist'
(10213, 'Attack', 'Arm', 1, 'Horizontal Thrust', NULL, 'Fl', 1, 1, 0, 0, 0),				-- - v3p96 Mid; (Twin) 'Elbow'
(10214, 'Attack', 'Arm', 1, 'Horizontal Strike', NULL, 'Fl', 1, 1, 0, 0, 0),				-- - v3p134 Mid; Twin 'Knife-Hand', Twin 'Side Fist', 'Back Fist',+twin back fist or twin back hand
(10215, 'Attack', 'Arm', 0, 'Inward Strike', NULL, 'Bl', 1, 0, 1, 0, 0),					-- v3p116 Mid,High; 'Knife-Hand'+twin knife-hand, twin reverse knife-hand, under fist, palm, twin palm and bear hand
(10216, 'Attack', 'Arm', 1, 'Upper Strike', NULL, 'Sl', 1, 0, 0, 0, 0),						-- - v3p109 High (U-Nam has Mid); 'Elbow'
(10217, 'Attack', 'Arm', 1, 'Upward Punch', NULL, 'Cl', 1, 0, 1, 0, 0),						-- - v3p46 High; 'Forefist'
-- elbow = ~Sl
(10221, 'Attack', 'Arm', 0, 'Downward Thrust', NULL, 'Cl', 1, 0, 1, 0, 0),					-- - v3p89 Low; 'Flat Fingertip','Straight Elbow'
(10222, 'Attack', 'Arm', 1, 'Downward Punch', NULL, 'Cl', 1, 0, 1, 0, 0),					-- - v3p53 Low; 'Forefist'
(10223, 'Attack', 'Arm', 1, 'Front {Straight} Downward Strike', NULL, 'Sl', 1, 0, 0, 0, 0),					-- - v3p127 Mid; 'Knife-Hand','Back Fist'+side fist, back hand, twin side fist, twin knife-hand, twin back hand and base of knife-hand
(10210, 'Attack', 'Arm', 1, 'Side {Circular} Downward Strike', NULL, '~Fl', 0, 0, 1, 0, 0),			-- - v3p124 Mid; 'Knife-Hand','Back Fist'+side fist, back hand, twin side fist, twin knife-hand, twin back hand and base of knife-hand
(10224, 'Attack', 'Arm', 0, 'Vertical Punch', NULL, '~Bl', 1, 0, 0, 0, 0),					-- - v3p36 Low?,Mid,High; (Twin) 'Forefist'
(10225, 'Attack', 'Arm', 1, 'Angle Punch', NULL, 'RBl', 1, 0, 0, 0, 0),						-- - v3p59 Mid,High?; 'Forefist'
(10226, 'Attack', 'Arm', 0, 'Crescent Punch', NULL, 'Cl', 1, 0, 1, 0, 0),					-- - v3p54 Mid,High; (Twin) 'Forefist'+(Twin) 'Foreknuckle Fist'
(10227, 'Attack', 'Arm', 1, 'Turning Punch', NULL, 'Cl', 1, 0, 0, 0, 0),					-- - v3p56 Mid; 'Forefist'
(10228, 'Attack', 'Arm', 1, 'Mid-Air Strike', NULL, 'Cl>~Fl', 0, 0, 0, 0, 0),					-- - v3p155 Mid; 'Knife-Hand','Back Fist'
(10229, 'Attack', 'Arm', 1, 'Inward Cross-Cut', NULL, 'Cl', 1, 0, 1, 1, 0),					-- - v3p103 High; 'Flat Fingertip'
-- (102xx, 'Attack', 'Arm', 1, 'Side Cross-Cut', NULL, NULL, 0, 1, 1, 0, 0),					-- - v3p105 High; 'Flat Fingertip'
(10220, 'Attack', 'Arm', 0, 'Outward Cross-Cut', NULL, '~Sl', 1, 0, 0, 0, 0),				-- - v3p102 High; 'Flat Fingertip'
(10231, 'Attack', 'Arm', 1, 'Crescent Strike', NULL, 'Cl', 1, 0, 0, 0, 0),					-- - v3p145 p54 High; 'Arc Hand','Finger Pincers'
(10232, 'Attack', 'Arm', 1, 'U-Shape Punch', NULL, 'Fl', 0, 0, 1, 0, 0),					-- - v3p52 Mid+High; 'Forefist'
-- 'Forefist','Side Fist','Backfist','Middle-Knuckle Fist','Foreknuckle Fist','Long Fist','Open Fist','X-Fist','Forearm','Inner Forearm','Outer Forearm','Knife-Hand','Reverse Knife-Hand','X-Knife-Hand','Palm','Palm Heel','Alternate Palm','Arc Hand','Backhand','Elbow','Side Elbow','Back Elbow','Fingertip','Straight Fingertip','Flat Fingertip','Upset Fingertip','Double Finger','Bow Wrist','Angle Fingertip','Under Fist','X-Palm','Straight Forearm','Straight Knife-Hand','Thumb Ridge','Back Forearm','Straight Elbow','Front Elbow','Finger Pincers'

(10290, 'Attack', 'Arm', 0, 'Side Punch', NULL, 'Fl', 0, 1, 1, 0, 0),						-- - v3p41 Mid; 'Forefist'
(10291, 'Attack', 'Arm', 0, 'Front Strike', NULL, 'Cl', 1, 0, 0, 0, 0),							-- v3p140??
(10292, 'Attack', 'Arm', 0, 'Front Elbow', NULL, 'Sl', 1, 0, 0, 0, 0),							-- ??
(10293, 'Attack', 'Arm', 0, 'Side Elbow', NULL, 'Fl', 1, 0, 0, 0, 0),							-- ??
(10294, 'Attack', 'Arm', 0, 'Back Elbow', NULL, 'Rl', 1, 0, 0, 0, 0),							-- ??



(10300, 'Attack', 'Leg', 0, 'Front Snap Kick', NULL, '~Cl', 1, 0, 0, 0, 0),					      -- - v4p33 'Ball of Foot','Instep','Toes','Knee'(<- using Upward Kick)
(10302, 'Attack', 'Leg', 0, 'Side Piercing Kick', NULL, 'Fl', 0, 1, 0, 0, 0),				    -- - v4p17 'Foot Sword'
(10303, 'Attack', 'Leg', 1, 'Upward {Front Snap} Kick', NULL, '~Bl', 1, 0, 0, 0, 0),       -- - v4p61 Mid; 'Knee'
(10304, 'Attack', 'Leg', 0, '{Side Front} Turning Kick', NULL, '~Sl', 0, 0, 1, 0, 0),                   -- - v4p50 'Ball of Foot','Instep','Toes','Knee'
-- (10305, 'Attack', 'Leg', 1, 'Flying Side Piercing Kick', NULL, 'Fl', 0, 1, 0, 0, 0),    -- - dup of 10302 v4p110 'Foot Sword'
(10306, 'Attack', 'Leg', 0, 'Back Piercing Kick', NULL, 'Rl', 1, 0, 0, 0, 0),            -- - v4p26 'Foot Sword'
(10307, 'Attack', 'Leg', 1, 'Pressing Kick', NULL, 'Fl', 0, 1, 0, 0, 0),                  -- - v4p72 Low; 'Foot Sword' (Outward); 'Side Sole' (Inward)
(10308, 'Attack', 'Leg', 1, 'Twisting Kick', NULL, '~Sl', 0, 1, 0, 0, 0),                  -- - v4p66 'Ball of Foot', 'Knee', 'Toes' (Low); 'Ball of Foot','Instep','Toes','Knee' (Mid); 'Ball of Foot', 'Toes' (High)
(10309, 'Attack', 'Leg', 0, 'Reverse Turning Kick', NULL, 'Fl', 0, 0, 1, 0, 0),           -- - v4p62 'Back of Heel', 'Ball of Foot'
(10310, 'Attack', 'Leg', 0, 'Reverse Hooking Kick', NULL, 'Fl', 0, 0, 1, 0, 0),           -- - v4p64 'Back of Heel'
(10311, 'Block', 'Leg', 0, 'Hooking {Outward Vertical} Kick', NULL, 'Cl', 0, 0, 1, 0, 0), -- - v4p172 'Side Instep'
(10312, 'Attack', 'Leg', 1, '{Downward} Pick-Shape Kick', NULL, '~Cl', 1, 0, 0, 0, 0),     -- - v4p59 'Back of Heel'
(10313, 'Block', 'Leg', 1, 'Waving Kick', NULL, 'Cl', 1, 1, 0, 0, 0),                    -- - v4p166 'Side Sole'
(10314, 'Attack', 'Leg', 1, 'Sweeping Kick', NULL, 'Cl', 1, 0, 1, 0, 0), -- - v4p75 Low; 'Side Sole', 'Back of Heel'; sorta mostly {Inward Pressing}
(10315, 'Block', 'Leg', 1, 'Crescent {Inward Vertical} Kick', NULL, 'Cl', 1, 0, 1, 0, 0),  -- - v4p160 'Foot Sole'; executed same as inward vertical kick
(10316, 'Attack', 'Leg', 0, 'Side Thrusting Kick', NULL, 'Fl', 0, 0, 1, 0, 0),          -- - v4p28 'Ball of Foot'
(10317, 'Block', 'Leg', 0, 'Side Checking Kick', NULL, 'Fl', 0, 0, 1, 0, 0),           -- - v4p168 'Side Sole'
(10318, 'Block', 'Leg', 0, 'Side Pushing Kick', NULL, 'Fl', 0, 0, 1, 0, 0),            -- - v4p30 'Foot Sword'
(10319, 'Attack', 'Leg', 1, 'Inward Vertical Kick', NULL, 'Cl', 1, 0, 1, 0, 0),           -- - v4p70 Mid,High; 'Foot Sword' (Outward); 'Reverse Foot Sword' (Inward)
(10320, 'Attack', 'Leg', 1, 'Outward Vertical Kick', NULL, 'Cl', 1, 0, 1, 0, 0),          -- - v4p70 Mid,High; 'Foot Sword' (Outward); 'Reverse Foot Sword' (Inward)
(10321, 'Attack', 'Leg', 1, 'Downward Kick', NULL, '~Bl', 1, 0, 1, 0, 0),                  -- - v4p58 'Back of Heel'
(10322, 'Attack', 'Leg', 1, 'Mid-Air {Side Piercing} Kick', NULL, 'Fl', 0, 1, 0, 0, 0),                 -- - dup 10302 v4p120 == Flying Side Piercing || Thrusting Kick
(10323, 'Attack', 'Leg', 0, 'High {Front Snap} Kick', NULL, '~Bl', 1, 0, 0, 0, 0),              -- - v4p118 High; 'Ball of Foot', 'Toes' (was Flying)
-- 'Ball of Foot','Heel','Back of Heel','Instep','Side Instep','Foot Sword','Side Sole','Knee','Reverse Foot Sword','Foot','Foot Sole','Toes'

(10390, 'Attack', 'Leg', 0, 'Side Front Snap Kick', NULL, '~Sl', 0, 0, 1, 0, 0),			    -- - dup 10300 v4p46 'Ball of Foot','Instep','Toes'
(10391, 'Attack', 'Leg', 0, 'Two Direction Kick', NULL, 'Fl', 1, 0, 0, 0, 0),			    -- ~45° Fl


(10400, 'Block', 'Arm', 0, 'Block', NULL, 'Cl', 1, 1, 1, 1, 0),							    -- v3p182/188, facing?
(10410, 'Block', 'Arm', 0, '{Inward} Front Block', NULL, 'Cl', 1, 0, 0, 0, 0),			-- - v3p206 Low,Mid,High; 'Outer Forearm','Knife-Hand',(Twin*) 'Palm'+'X-Fist'*,'X-Knife-Hand'*,'Reverse Knife-Hand'; * = Not Inward, Full/Center
(10425, 'Block', 'Arm', 1, 'Outward Block', NULL, '~Sl', 0, 0, 1, 0, 0),					-- v3p186 "inward to outward"
-- (104xx, 'Block', 'Arm', 0, 'Outward Block', NULL, '~Bl', 1, 1, 1, 1, 0),						-- dup 10415 v3p186/203, Half/Side facing to Breast/Shoulder-line
(10402, 'Block', 'Arm', 1, 'Rising Block', NULL, 'Cl', 1, 0, 0, 0, 0),						-- - v3p232 High; 'Forearm','Knife-Hand','X-Fist','X-Knife-Hand','Arc-Hand',(Twin) 'Palm'
(10403, 'Block', 'Arm', 0, 'Guarding Block', NULL, 'Cl', 0, 0, 1, 0, 0),			 	-- - v3p284 Low,Mid,High; 'Forearm','Knife-Hand','Reverse Knife-Hand'
(10404, 'Block', 'Arm', 1, 'Wedging Block', NULL, 'Sl', 1, 0, 0, 0, 0),						-- - v3p266 Mid, High; 'Outer Forearm','Inner Forearm','Knife-Hand','Reverse Knife-Hand'
(10405, 'Block', 'Arm', 1, 'Circular Block', NULL, 'Cl>~Sl', 0, 0, 1, 1, 0),					-- - v3p298 Low>Mid; 'Inner Forearm','Reverse Knife-Hand'+'Knife-Hand'
(10406, 'Block', 'Arm', 1, 'Pressing Block', NULL, 'Cl', 1, 0, 0, 0, 0),					-- - v3p257 Low; (Twin) 'Palm','Forefist','X-Fist' ; Palm Pressing Block always done with a Palm Upward Block
-- (104xx, 'Block', 'Arm', 1, 'Pressing Block', NULL, 'Cl', 1, 0, 0, 0, 0),						-- dup 10406
-- Downward block twin on Sl
(10407, 'Block', 'Arm', 1, 'Downward Block', NULL, 'Cl', 1, 1, 0, 1, 0),					-- - v3p247 Mid; 'Palm','Alternate Palm','Forearm',(Twin) 'Forearm',(Twin) 'Knife-Hand','X-Fist','X-Knife-Hand'+'Straight Elbow' Juche='Outer Forearm'
(10408, 'Block', 'Arm', 1, 'Parallel Block', NULL, 'Sl', 1, 0, 1, 0, 0),					-- - v3p272 High; 'Outer Forearm','Inner Forearm','Knife-Hand','Reverse Knife-Hand'+'Backhand','Back Forearm'
(10409, 'Block', 'Arm', 0, 'Inward Block', NULL, 'Bl', 1, 0, 1, 1, 0),						-- v3p184 "outward to inward"
-- (104xx, 'Block', 'Arm', 0, 'Side Hooking Block', NULL, 'Sl', 0, 0, 1, 1, 0),					-- dup 10411
(10411, 'Block', 'Arm', 1, 'Hooking Block', NULL, 'Cl', 0, 0, 1, 1, 0),					-- - v3p262-265 Mid,High; 'Palm','Outer Forearm','Knife-Hand','Back Hand'
(10412, 'Block', 'Arm', 1, 'U-Shape Block', NULL, 'Cl', 0, 0, 1, 0, 0),					-- - v3p302 Mid+High; 'Reverse Knife-Hand'
(10413, 'Block', 'Arm', 1, 'U-Shape Grasp', NULL, 'Cl', 0, 0, 1, 0, 0),					-- - v3p303 Mid+High; 'Reverse Knife-Hand'
(10414, 'Block', 'Arm', 1, '9-Shape Block', NULL, 'Cl', 1, 0, 0, 0, 0),						-- - v3p300 Mid, Low+Mid; 'Forearm'
-- when paired with pressing, on Sl, twin on Sl
(10416, 'Block', 'Arm', 1, 'Upward Block', NULL, '~Bl', 1, 0, 1, 1, 0),						-- - v3p243-245 Mid; (Twin) 'Palm', (Twin) 'Reverse Knife-Hand','Thumb Ridge','Bow Wrist'
-- (104xx, 'Block', 'Arm', 1, 'Upward Block', NULL, '~Sl', 1, 0, 1, 0, 0),						-- dup 10416
(10417, 'Block', 'Arm', 1, 'W-Shape Block', NULL, 'Fl', 1, 1, 0, 0, 0),					-- - v3p304 High; 'Outer Forearm','Knife-Hand','Reverse Knife-Hand','Inner Forearm'; Blocking both sides (directionality wrong)
(10418, 'Block', 'Arm', 0, 'Pushing Block', NULL, '~Bl', 1, 0, 0, 0, 0),						-- - v3p279-280 Low, Mid; 'Palm',Double 'Forearm','Knife-Hand','Reverse Knife-Hand'; Double Forearm Low Pushing Block is C****
-- (104xx, 'Block', 'Arm', 0, 'Side Front Pushing Block', NULL, 'Sl', 1, 0, 0, 0, 0),			-- dup 10418
(10420, 'Block', 'Arm', 1, 'Side Front Block', NULL, 'Sl', 1, 0, 1, 1, 0),					-- - v3p215 High; 'Inner Forearm','Reverse Knife-Hand'
(10421, 'Block', 'Arm', 1, 'Checking Block', NULL, 'Cl', 1, 0, 1, 0, 0),					-- - v3p225 Mid,High; 'X-Fist','X-Knife-Hand','Straight Forearm','Straight Knife-Hand'
(10424, 'Block', 'Arm', 1, 'Scooping {Upward} Block', NULL, 'Cl', 1, 0, 1, 1, 0),					-- - v3p282 Low>Mid; 'Palm', 'Reverse Knife-Hand'; kick specific!?
(10426, 'Block', 'Arm', 1, 'Waist {Upward} Block', NULL, '~Cl', 0, 0, 1, 0, 0),				-- - v3p220 Mid; 'Outer Forearm','Inner Forearm','Palm',
(10419, 'Block', 'Arm', 1, 'Horizontal Block', NULL, '~Bl', 1, 1, 0, 0, 0),				-- - v3p312 Mid; Twin 'Palm',Twin 'Knife-Hand'

(10491, 'Block', 'Arm', 0, 'Side Block', NULL, 'Cl', 0, 1, 1, 1, 0),						  -- v3p212, Half/Side facing to Centerline
-- (10492, 'Block', 'Arm', 0, 'Outward/Side Block', NULL, 'Fl', 0, 1, 1, 0, 0),	  -- v3p212/203/128, Half/Side facing to Fl


(10600, 'Action', 'Arm', 1, 'Fist lifted upward', NULL, 'Fl', 1, 1, 1, 1, 0),
(10601, 'Action', 'Arm', 0, 'Fist rotated so Backfist faces downward', NULL, 'Sl', 1, 0, 0, 0, 0),
(10602, 'Action', 'Arm', 1, 'Hand pulls opposite Hand to front of L Chest', NULL, 'Bl', 0, 0, 0, 0, 0),
(10603, 'Action', 'Arm', 0, 'Hand stays in previous position', NULL, NULL, 0, 0, 0, 0, 0),
(10604, 'Action', 'Arm', 0, 'Hand rotated so Palm faces downward', NULL, 'Cl', 0, 0, 1, 0, 0),
(10605, 'Action', 'Arm', 0, 'Hand stays in previous position during turn', NULL, NULL, 0, 0, 0, 0, 0),
(10606, 'Action', 'Arm', 1, 'Hands pulled down to ~Elbow height', NULL, 'Cl', 1, 0, 0, 0, 0),
(10607, 'Action', 'Arm', 0, 'Hands stay in previous position', NULL, NULL, 0, 0, 0, 0, 0),
(10608, 'Action', 'Arm', 1, 'Hands pulled to L Hip', NULL, 'Sl', 1, 0, 0, 0, 0), -- "Hands pulled to opposite Hip"?
(10609, 'Action', 'Arm', 1, 'Hands pulled to front of L Chest', NULL, 'Bl', 0, 0, 0, 0, 0),
(10610, 'Action', 'Arm', 1, 'Hands extended upward to grab opponent''s Head', NULL, 'Bl', 1, 0, 0, 0, 0),
(10611, 'Action', 'Arm', 0, 'Hands transition in circular motion', NULL, NULL, 1, 0, 0, 0, 0),
(10612, 'Action', 'Arm', 1, 'Hands pulled in opposite direction of kick', NULL, NULL, 1, 0, 0, 0, 0),
(10613, 'Action', 'Arm', 1, 'Hands pulled to front of Chest', NULL, 'Cl', 0, 0, 0, 0, 0),
(10614, 'Action', 'Arm', 1, 'Backhand in front of Forehead', NULL, 'Cl', 0, 0, 0, 0, 0),
(10615, 'Action', 'Arm', 0, 'Backhand under opposite Elbow', NULL, NULL, 0, 0, 0, 0, 0),
(10616, 'Action', 'Arm', 0, 'Fingerbelly supporting opposite Forefist', NULL, NULL, 0, 0, 0, 0, 0),
(10617, 'Action', 'Arm', 0, 'Fingerbelly slipped to above opposite Elbow', NULL, NULL, 0, 0, 0, 0, 0),
(10618, 'Action', 'Arm', 0, 'Fingerbelly on opposite Under Forearm', NULL, NULL, 0, 0, 0, 0, 0),
(10619, 'Action', 'Arm', 0, 'Fingerbelly on opposite Side Fist', NULL, NULL, 0, 0, 0, 0, 0),
(10620, 'Action', 'Arm', 0, 'Fingerbelly on opposite Backhand', NULL, NULL, 0, 0, 0, 0, 0),
(10621, 'Action', 'Arm', 0, 'Palm/Fingerbelly struck by opposite Elbow', NULL, NULL, 1, 0, 0, 0, 0),
(10622, 'Action', 'Arm', 0, 'Palm to opposite Forefist', NULL, NULL, 0, 0, 0, 0, 0),
(10623, 'Action', 'Arm', 1, 'Palm trapping opponents Instep', NULL, NULL, 0, 0, 0, 0, 0),
(10624, 'Action', 'Arm', 0, 'Palm pressing opposite Side Fist', NULL, NULL, 0, 0, 0, 0, 0),
(10625, 'Action', 'Arm', 0, 'Side Fist on opposite Under Fist', NULL, NULL, 0, 0, 0, 0, 0),
(10626, 'Action', 'Arm', 1, 'Side Fist in front of opposite Shoulder', NULL, NULL, 0, 0, 1, 0, 0),
(10627, 'Action', 'Arm', 1, 'Side Fists held up', NULL, 'Bl', 0, 0, 1, 0, 0),
(10628, 'Action', 'Arm', 0, 'into opposite Palm in circular motion', NULL, NULL, 0, 0, 0, 0, 0),
(10629, 'Action', 'Arm', 0, 'into opposite Palm/Fingerbelly', NULL, NULL, 1, 0, 0, 0, 0),
(10630, 'Action', 'Arm', 1, 'Arm extended to the side downward', NULL, 'Sl', 0, 0, 0, 0, 0),
(10631, 'Action', 'Arm', 1, 'Fist extended on shoulder line', NULL, 'Sl', 1, 0, 0, 0, 0),
(10632, 'Action', 'Arm', 0, 'Elbow bent ~45° outward', NULL, 'RSl', 0, 0, 0, 0, 0),
(10633, 'Action', 'Arm', 0, 'Backfist under opposite Elbow', NULL, NULL, 1, 0, 0, 0, 0),
(10634, 'Action', 'Arm', 0, 'Under Fist over opposite Side Fist', NULL, 'Cl', 0, 0, 0, 0, 0),
(10635, 'Action', 'Arm', 0, 'Fingerbelly on opposite Back Forearm', NULL, NULL, 0, 0, 0, 0, 0),
(10636, 'Action', 'Arm', 1, 'Arm extended on shoulder line slightly bent', NULL, 'Sl', 0, 0, 0, 0, 0),
(10638, 'Action', 'Arm', 1, 'Palms on ground under shoulders', NULL, NULL, 0, 0, 0, 0, 0),
(10639, 'Action', 'Arm', 0, 'Palm on opposite Back Forearm', NULL, NULL, 1, 0, 0, 0, 0),
(10640, 'Action', 'Arm', 1, 'Fist under same side armpit', NULL, NULL, 0, 0, 1, 0, 0),
(10641, 'Action', 'Arm', 1, 'Fist over opposite shoulder', NULL, NULL, 0, 0, 1, 0, 0),
(10642, 'Action', 'Arm', 1, 'Arms extended to side horizontally', NULL, 'Fl', 1, 0, 0, 0, 0),
(10643, 'Action', 'Arm', 1, 'Fists pulled to L Hip', NULL, 'Sl', 1, 0, 0, 0, 0),
(10644, 'Action', 'Arm', 1, 'Fists pulled to R Hip', NULL, 'Sl', 1, 0, 0, 0, 0),
(10645, 'Action', 'Arm', 1, 'Fist horizontal in front of opposite Chest', NULL, 'RBl', 0, 0, 1, 0, 0),
(10646, 'Action', 'Arm', 1, 'Fist pulled to Hip', NULL, 'Sl', 1, 0, 0, 0, 0),
(10647, 'Action', 'Arm', 1, 'Hands pulled rapidly to side in straight line', NULL, 'Sl', 1, 0, 0, 0, 0),
(10648, 'Action', 'Arm', 0, 'Palm on opposite Elbow Joint', NULL, NULL, 1, 0, 0, 0, 0),
(10649, 'Action', 'Arm', 0, 'Palm struck by Back Forearm', NULL, NULL, 1, 0, 0, 0, 0),
(10650, 'Action', 'Arm', 1, '{Under} Fist on opposite Shoulder', NULL, 'RSl', 0, 0, 1, 0, 0),
(10651, 'Action', 'Arm', 1, 'Fist in front of opposite Chest', NULL, 'RBl', 0, 0, 1, 0, 0),


(10700, 'Action', 'Leg', 0, 'Heels Raised ~Sitting Stance', NULL, NULL, 0, 0, 1, 0, 0),
(10701, 'Action', 'Leg', 0, 'Heel Raised ~Close Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10702, 'Action', 'Leg', 0, 'Heel Raised ~1 FT behind opposite Foot', NULL, NULL, 0, 0, 1, 0, 0),
(10703, 'Action', 'Leg', 0, 'Heel Raised ~Parallel Stance', NULL, NULL, 0, 0, 1, 0, 0),
(10704, 'Action', 'Leg', 0, 'Heel Raised ~Outer Open Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10705, 'Action', 'Leg', 0, 'Heel Raised ~1 FT ahead opposite Foot', NULL, NULL, 0, 0, 1, 0, 0),
(10706, 'Action', 'Leg', 0, 'Heel Raised ~1 SW ahead opposite Foot', NULL, NULL, 0, 0, 1, 0, 0),
(10707, 'Action', 'Leg', 0, 'Heel Raised ~1 SW behind opposite Foot', NULL, NULL, 0, 0, 1, 0, 0),
(10708, 'Action', 'Leg', 0, 'Instep to hollow of opposite Leg', NULL, NULL, 1, 0, 0, 0, 0),
(10709, 'Action', 'Leg', 0, 'Foot inline behind opposite Foot', NULL, NULL, 0, 0, 1, 0, 0),
(10710, 'Action', 'Leg', 0, 'Foot ~1 FT ahead opposite Foot', NULL, NULL, 0, 0, 1, 0, 0),

(10720, 'Action', 'Leg', 0, '~Close Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10721, 'Action', 'Leg', 0, '~Rear Foot Stance', NULL, NULL, 0, 0, 1, 0, 0),
-- (10722, 'Action', 'Leg', 0, '~Walking Stance', NULL, NULL, 1, 0, 1, 1, 0),
-- (10723, 'Action', 'Leg', 0, '~Low Stance', NULL, NULL, 1, 0, 1, 0, 0),
-- (10724, 'Action', 'Leg', 0, '~Vertical Stance', NULL, NULL, 0, 0, 1, 0, 0),
(10725, 'Action', 'Leg', 0, '~L-Stance', NULL, NULL, 0, 0, 1, 0, 0),
-- (10726, 'Action', 'Leg', 0, '~Fixed Stance', NULL, NULL, 0, 0, 1, 0, 0),
(10727, 'Action', 'Leg', 0, '~Sitting Stance', NULL, NULL, 1, 1, 0, 0, 0),
-- (10728, 'Action', 'Leg', 0, '~Sitting Stance with straight Legs', NULL, NULL, 1, 1, 0, 0, 0),
-- (10729, 'Action', 'Leg', 0, '~Diagonal Stance', NULL, NULL, 1, 1, 0, 0, 0),
-- (10730, 'Action', 'Leg', 0, '~Crouched Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10731, 'Action', 'Leg', 0, '~Parallel Stance', NULL, NULL, 1, 1, 0, 0, 0),
(10732, 'Action', 'Leg', 0, '~Inner Open Stance', NULL, NULL, 1, 1, 0, 0, 0),
-- (10733, 'Action', 'Leg', 0, '~Outer Open Stance', NULL, NULL, 1, 1, 0, 0, 0),
-- (10734, 'Action', 'Leg', 0, '~X-Stance', NULL, NULL, 1, 1, 1, 0, 0),
-- (10735, 'Action', 'Leg', 0, '~One-Leg Stance', NULL, NULL, 1, 1, 0, 0, 0),
-- (10736, 'Action', 'Leg', 0, '~Bending Stance', NULL, NULL, 1, 1, 0, 0, 0),
-- (10737, 'Action', 'Leg', 0, 'Wide ~Parallel Stance', NULL, NULL, 1, 1, 0, 0, 0),
-- (10738, 'Action', 'Leg', 0, 'Narrow ~Diagonal Stance', NULL, NULL, 1, 1, 0, 0, 0),

(10999, NULL, NULL, 0, '&nbsp;', NULL, NULL, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Encyclopedias`
--

CREATE TABLE IF NOT EXISTS `Encyclopedias` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Notes` tinytext,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Encyclopedias`
--

INSERT INTO `Encyclopedias` (`ID`, `Name`, `Notes`) VALUES
(1, 'Encyclopedia of Taekwon-Do (2008 15 Volume)', 'The text for these entries was sourced from the 15 Volume Encyclopedia of Taekwon-do, published in 2008 by the Chang Hon Foundation/International Taekwon-Do Federation (Draugasse 3, 1210 Wien, Austria).'),
(2, 'Chang Hon Kwan Taekwon-Do (Littleton)', 'The text for these entries was sourced from http://chk-taekwondo.com/. This version is included along side of the official Encyclopedia versions due to the time and effort put into correcting and annotating each entry with explicate facings and movement d'),
(3, 'Encyclopedia of Taekwon-Do (1999 Condensed)', 'The text for these entries was sourced from the Condensed Encyclopedia of Taekwon-do, published in 1999.'),
(4, 'Encyclopedia of Taekwon-Do (1995 Condensed)', 'The text for these entries was sourced from the Condensed Encyclopedia of Taekwon-do, published in 1995.'),
(5, 'Encyclopedia of Taekwon-Do (????)', 'The text for these entries was sourced from http://www.drysdaletkd.com/ (Gup Patterns) and http://www.taekwondo-schools.co.uk/ (Dan I Patterns). Accuracy of this text still needs to be verified.'),
(6, 'Taekwon-Do - The Art Of Self-Defence (1965 Condensed)', 'The text for these entries was sourced from the original "Condensed Encyclopedia"; Taekwon-do - The Art Of Self-Defence, published in 1965.'),
(7, 'Taekwon-Do (1959)', 'The text for these entries was sourced from the 1959 edition of "Taekwon-Do", published in Korean and the first ever book published on Taekwon-Do.');

-- --------------------------------------------------------

--
-- Table structure for table `EncyclopediaCount`
--

CREATE TABLE IF NOT EXISTS `EncyclopediaCount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EncyclopediaID` int(11) NOT NULL,
  `PatternID` int(11) NOT NULL,
  `Count` smallint(6) NOT NULL,
  `Text` text,
  PRIMARY KEY (`ID`),
  KEY `EncyclopediaID` (`EncyclopediaID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1561 ;

--
-- Dumping data for table `EncyclopediaCount`
--

INSERT INTO `EncyclopediaCount` (`ID`, `EncyclopediaID`, `PatternID`, `Count`, `Text`) VALUES
(1, 2, 1000, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Ready Stance toward D. Remain in this parallel ready stance toward D until given the command to begin the fundamental pattern exercise.'),
(2, 2, 1000, 1, 'Move the right foot forward to D to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(3, 2, 1000, 2, 'Pull the right foot toward the left foot. Then, while pivoting on the ball of the left foot and turning counterclockwise, move the right foot backward to A to form a left walking stance toward B, while executing (half facing) a low block to B with the left outer forearm.'),
(4, 2, 1000, 3, 'Move the right foot forward to B to form a right walking stance toward B, while executing (full facing) a middle front punch to B with the right forefist.'),
(5, 2, 1000, 4, 'Pull the right foot toward the left foot. Then, while pivoting on the ball of the left foot and turning counterclockwise, move the right foot backward to D to form a left walking stance toward C, while executing (half facing) a low block to C with the left outer forearm.'),
(6, 2, 1000, 5, 'Move the right foot forward to C to form a right walking stance toward C, while executing (full facing) a middle front punch to C with the right forefist.'),
(7, 2, 1000, 6, 'Pull the right foot toward the left foot. Then, while pivoting on the ball of the left foot and turning counterclockwise, move the right foot backward to B to form a left walking stance toward A, while executing (half facing) a low block to A with the left outer forearm.'),
(8, 2, 1000, 7, 'Move the right foot forward to A to form a right walking stance toward A, while executing (full facing) a middle front punch to A with the right forefist.'),
(9, 2, 1000, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot toward the left foot to form a parallel ready stance toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(10, 2, 1001, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Ready Stance toward D. Remain in this parallel ready stance toward D until given the command to begin the fundamental pattern exercise.'),
(11, 2, 1001, 1, 'Move the left foot forward to D to form a left walking stance toward D, while executing (full facing) a middle front punch to D with the left forefist.'),
(12, 2, 1001, 2, 'Pull the left foot toward the right foot. Then, while pivoting on the ball of the right foot and turning clockwise, move the left foot backward to B to form a right walking stance toward A, while executing (half facing) a low block to A with the right outer forearm.'),
(13, 2, 1001, 3, 'Move the left foot forward to A to form a left walking stance toward A, while executing (full facing) a middle front punch to A with the left forefist.'),
(14, 2, 1001, 4, 'Pull the left foot toward the right foot. Then, while pivoting on the ball of the right foot and turning clockwise, move the left foot backward to D to form a right walking stance toward C, while executing (half facing) a low block to C with the right outer forearm.'),
(15, 2, 1001, 5, 'Move the left foot forward to C to form a left walking stance toward C, while executing (full facing) a middle front punch to C with the left forefist.'),
(16, 2, 1001, 6, 'Pull the left foot toward the right foot. Then, while pivoting on the ball of the right foot and turning clockwise, move the left foot backward to A to form a right walking stance toward B, while executing (half facing) a low block to B with the right outer forearm.'),
(17, 2, 1001, 7, 'Move the left foot forward to B to form a left walking stance toward B, while executing (full facing) a middle front punch to B with the left forefist.'),
(18, 2, 1001, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot toward the right foot to form a parallel ready stance toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(19, 2, 1002, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Ready Stance toward D. Remain in this parallel ready stance toward D until given the command to begin the fundamental pattern exercise.'),
(20, 2, 1002, 1, 'Move the right foot backward to C to form a left walking stance toward D, while executing (half facing) a low block to D with the left knife-hand.'),
(21, 2, 1002, 2, 'Move the right foot forward to D to form a right walking stance toward D, while executing (half facing) a middle side block to D with the right inner forearm.'),
(22, 2, 1002, 3, 'Pull the right foot toward the left foot. Then, while pivoting on the ball of the left foot and turning counterclockwise, move the right foot backward to A to form a left walking stance toward B,while executing (half facing) a low block to B with the left knife-hand.'),
(23, 2, 1002, 4, 'Move the right foot forward to B to form a right walking stance toward B while executing (half facing) a middle side block to B with the right inner forearm.'),
(24, 2, 1002, 5, 'Pull the right foot toward the left foot. Then, while pivoting on the ball of the left foot and turning counterclockwise, move the right foot backward to D to form a left walking stance toward C,while executing (half facing) a low block to C with the left knife-hand.'),
(25, 2, 1002, 6, 'Move the right foot forward to C to form a right walking stance toward C, while executing (half facing) a middle side block to C with the right inner forearm.'),
(26, 2, 1002, 7, 'Pull the right foot toward the left foot. Then, while pivoting on the ball of the left foot and turning counterclockwise, move the right foot backward to B to form a left walking stance toward A, while executing (half facing) a low block to A with the left knife-hand.'),
(27, 2, 1002, 8, 'Move the right foot forward to A to form a right walking stance toward A, while executing (half facing) a middle side block to A with the right inner forearm.'),
(28, 2, 1002, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot toward the left foot to form a parallel ready stance toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(29, 2, 1003, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Ready Stance toward D. Remain in this parallel ready stance toward D until given the command to begin the fundamental pattern exercise.'),
(30, 2, 1003, 1, 'Move the left foot backward to C to form a right walking stance toward D, while executing (half facing) a low block to D with the right knife-hand.'),
(31, 2, 1003, 2, 'Move the left foot forward to D to form a left walking stance toward D, while executing (half facing) a middle side block to D with the left inner forearm.'),
(32, 2, 1003, 3, 'Pull the left foot toward the right foot. Then, while pivoting on the ball of the right foot and turning clockwise, move the left foot backward to B to form a right walking stance toward A, while executing (half facing) a low block to A with the right knife-hand.'),
(33, 2, 1003, 4, 'Move the left foot forward to A to form a left walking stance toward A, while executing (half facing) a middle side block to A with the left inner forearm.'),
(34, 2, 1003, 5, 'Pull the left foot toward the right foot. Then, while pivoting on the ball of the right foot and turning clockwise, move the left foot backward to D to form a right walking stance toward C, while executing (half facing) a low block to C with the right knife-hand.'),
(35, 2, 1003, 6, 'Move the left foot forward to C to form a left walking stance toward C, while executing (half facing) a middle side block to C with the left inner forearm.'),
(36, 2, 1003, 7, 'Pull the left foot toward the right foot. Then, while pivoting on the ball of the right foot and turning clockwise, move the left foot backward to A to form a right walking stance toward B, while executing (half facing) a low block to B with the right knife-hand.'),
(37, 2, 1003, 8, 'Move the left foot forward to B to form a left walking stance toward B, while executing (half facing) a middle side block to B with the left inner forearm.'),
(38, 2, 1003, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot toward the right foot to form a parallel ready stance toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(39, 2, 1004, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Ready Stance toward D. Remain in this parallel ready stance toward D until given the command to begin the pattern.'),
(40, 2, 1004, 1, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to B to form a left walking stance toward B, while executing (half facing) a low block to B with the left outer forearm.'),
(41, 2, 1004, 2, 'Move the right foot forward to B to form a right walking stance toward B, while executing (full facing) a middle front punch to B with the right forefist.'),
(42, 2, 1004, 3, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to A to form a right walking stance toward A, while executing (half facing) a low block to A with the right outer forearm.'),
(43, 2, 1004, 4, 'Move the left foot forward to A to form a left walking stance toward A, while executing (full facing) a middle front punch to A with the left forefist.'),
(44, 2, 1004, 5, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a left walking stance toward D, while executing (half facing) a low block to D with the left outer forearm.'),
(45, 2, 1004, 6, 'Move the right foot forward to D to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(46, 2, 1004, 7, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to C to form a right walking stance toward C, while executing (half facing) a low block to C with the right outer forearm.'),
(47, 2, 1004, 8, 'Move the left foot forward to C to form a left walking stance toward C, while executing (full facing) a middle front punch to C with the left forefist.'),
(48, 2, 1004, 9, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to A to form a right L-stance toward A, while executing (half facing) a middle side block to A with the left inner forearm.'),
(49, 2, 1004, 10, 'Move the right foot forward to A to form a right walking stance toward A, while executing (full facing) a middle front punch to A with the right forefist.'),
(50, 2, 1004, 11, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to B to form a left L-stance toward B, while executing (half facing) a middle side block to B with the right inner forearm.'),
(51, 2, 1004, 12, 'Move the left foot forward to B to form a left walking stance toward B, while executing (full facing) a middle front punch to B with the left forefist.'),
(52, 2, 1004, 13, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to C to form a right L-stance toward C while executing (half facing) a middle side block to C with the left inner forearm.'),
(53, 2, 1004, 14, 'Move the right foot forward to C to form a right walking stance toward C, while executing (full facing) a middle front punch to C with the right forefist.'),
(54, 2, 1004, 15, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to D to form a left L-stance toward D, while executing (half facing) a middle side block to D with the right inner forearm.'),
(55, 2, 1004, 16, 'Move the left foot forward to D to form a left walking stance toward D, while executing (full facing) a middle front punch to D with the left forefist.'),
(56, 2, 1004, 17, 'Move the right foot forward to D to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(57, 2, 1004, 18, 'Move the right foot backward to C to form a left walking stance toward D, while executing (full facing) a middle front punch to D with the left forefist.'),
(58, 2, 1004, 19, 'Move the left foot backward to C to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(59, 2, 1004, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot forward onto the AB line to form a parallel ready stance toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(60, 2, 1005, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Ready Stance toward D. Remain in this parallel ready stance toward D until given the command to begin the pattern.'),
(61, 2, 1005, 1, 'Move the left foot to B to form a right L-stance toward B, while executing (half facing) a middle knife-hand guarding block to B.'),
(62, 2, 1005, 2, 'Move the right foot forward to B to form a right walking stance toward B, while executing (full facing) a high front punch to B with the right forefist.'),
(63, 2, 1005, 3, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to A to form a left L-stance toward A, while executing (half facing) a middle knife-hand guarding block to A.'),
(64, 2, 1005, 4, 'Move the left foot forward to A to form a left walking stance toward A, while executing (full facing) a high front punch to A with the left forefist.'),
(65, 2, 1005, 5, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a left walking stance toward D, while executing (half facing) a low block to D with the left outer forearm.'),
(66, 2, 1005, 6, 'Move the right foot forward to D to form a right walking stance toward D, while executing (full facing) a high front punch to D with the right forefist.'),
(67, 2, 1005, 7, 'Move the left foot forward to D to form a left walking stance toward D, while executing (full facing) a high front punch to D with the left forefist.'),
(68, 2, 1005, 8, 'Move the right foot forward to D to form a right walking stance toward D, while executing (full facing) a high front punch to D with the right forefist.'),
(69, 2, 1005, 9, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to E to form a right L-stance toward E, while executing (half facing) a twin forearm block to E.'),
(70, 2, 1005, 10, 'Move the right foot forward to E to form a right walking stance toward E, while executing (full facing) a high front punch to E with the right forefist.'),
(71, 2, 1005, 11, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to F to form a left L-stance toward F, while executing (half facing) a twin forearm block to F.'),
(72, 2, 1005, 12, 'Move the left foot forward to F to form a left walking stance toward F, while executing (full facing) a high front punch to F with the left forefist.'),
(73, 2, 1005, 13, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to C to form a left walking stance toward C, while executing (half facing) a low block to C with the left outer forearm. Perform moves 13 and 14 in a continuous motion.'),
(74, 2, 1005, 14, 'While maintaining a left walking stance toward C, execute (full facing) a rising block to C with the left outer forearm.'),
(75, 2, 1005, 15, 'Move the right foot forward to C to form a right walking stance toward C, while executing (full facing) a rising block to C with the right outer forearm.'),
(76, 2, 1005, 16, 'Move the left foot forward to C to form a left walking stance toward C, while executing (full facing) a rising block to C with the left outer forearm.'),
(77, 2, 1005, 17, 'Move the right foot forward to C to form a right walking stance toward C, while executing (full facing) a rising block to C with the right outer forearm.'),
(78, 2, 1005, 18, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to B to form a right L-stance toward B, while executing (half facing) a middle outward side strike to B with the left knife-hand.'),
(79, 2, 1005, 19, 'Move the right foot forward to B to form a right walking stance toward B, while executing (full facing) a high front punch to B with the right forefist.'),
(80, 2, 1005, 20, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to A to form a left L-stance toward A, while executing (half facing) a middle outward side strike to A with the right knife-hand.'),
(81, 2, 1005, 21, 'Move the left foot forward to A to form a left walking stance toward A, while executing (full facing) a high front punch to A with the left forefist.'),
(82, 2, 1005, 999, 'END: When the command to return to the ready position (ba-ro) is given, pivot on the ball of the right foot, bringing the left foot back to B turning counterclockwise, to form a parallel ready stance toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(83, 2, 1006, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Ready Stance toward D. Remain in this parallel ready stance toward D until given the command to begin the pattern.'),
(84, 2, 1006, 1, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to B to form a left walking stance toward B, while executing (half facing) a high side block to B with the left outer forearm.'),
(85, 2, 1006, 2, 'While maintaining a left walking stance toward B, execute (full facing) a middle front punch to B with the right forefist.'),
(86, 2, 1006, 3, 'Prior to moving the body, move the ball of the left foot on the AB line (half a shoulder width toward D and half a shoulder width toward A). Then, while pivoting on the ball of the left foot and turning clockwise, move the right foot to A to form a right walking stance toward A, while executing (half facing) a high side block to A with the right outer forearm. Perform this move in a spot-turning motion - method one.'),
(87, 2, 1006, 4, 'While maintaining a right walking stance toward A, execute (full facing) a middle front punch to A with the left forefist.'),
(88, 2, 1006, 5, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(89, 2, 1006, 6, 'Move the right foot forward to D to form a right walking stance toward D, while executing (full facing) a middle front thrust to D with the right straight fingertip, pulling the back of the left fingertips under the right elbow.'),
(90, 2, 1006, 7, 'Pivot on the balls of both feet until they face BD, while twisting the right knife-hand together with the body counterclockwise in a releasing motion until the right palm faces downward. Then, while pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a left walking stance toward D, while executing (half facing) a high side strike to D with the left backfist. Perform this move in a releasing motion.'),
(91, 2, 1006, 8, 'Move the right foot forward to D to form a right walking stance toward D, while executing (half facing) a high side strike to D with the right backfist.'),
(92, 2, 1006, 9, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to E to form a left walking stance toward E, while executing (half facing) a high side block to E with the left outer forearm.'),
(93, 2, 1006, 10, 'While maintaining a left walking stance toward E, execute (full facing) a middle front punch to E with the right forefist.'),
(94, 2, 1006, 11, 'Prior to moving the body, move the ball of the left foot on the EF line (half a shoulder width toward C and half a shoulder width toward F). Then, while pivoting on the ball of the left foot and turning clockwise, move the right foot to F to form a right walking stance toward F, while executing (half facing) a high side block to F with the right outer forearm. Perform this move in a spot-turning motion - method one.'),
(95, 2, 1006, 12, 'While maintaining a right walking stance toward, execute (full facing) a middle front punch to F with the left forefist.'),
(96, 2, 1006, 13, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to CE to form a left walking stance toward CE, while executing (full facing) a high wedging block to CE with the outer forearms.'),
(97, 2, 1006, 14, 'Execute a middle front snap kick to CE with the ball of the right foot, keeping the position of the hands as they were in move 13 above (a high wedging block with the outer forearms).'),
(98, 2, 1006, 15, 'Lower the right foot to CE to form a right walking stance toward CE, while executing (full facing) a middle front punch to CE with the right forefist. Perform moves 15 and 16 in a fast motion.'),
(99, 2, 1006, 16, 'While maintaining a right walking stance toward CE, execute (full facing) a middle front punch to CE with the left forefist.'),
(100, 2, 1006, 17, 'While pivoting on the ball of the left foot and turning clockwise, move the right foot to CF to form a right walking stance toward CF, while executing (full facing) a high wedging block to CF with the outer forearms.'),
(101, 2, 1006, 18, 'Execute a middle front snap kick to CF with the ball of the left foot, keeping the position of the hands as they were in move 17 above (a high wedging block with the outer forearms).'),
(102, 2, 1006, 19, 'Lower the left foot to CF to form a left walking stance toward CF, while executing (full facing) a middle front punch to CF with the left forefist. Perform moves 19 and 20 in a fast motion.'),
(103, 2, 1006, 20, 'While maintaining a left walking stance toward CF, execute (full facing) a middle front punch to CF with the right forefist.'),
(104, 2, 1006, 21, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to C to form a left walking stance toward C, while executing a rising block (full facing) to C with the left outer forearm.'),
(105, 2, 1006, 22, 'Move the right foot forward to C to form a right walking stance toward C, while executing (full facing) a rising block to C with the right outer forearm.'),
(106, 2, 1006, 23, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to B to form a sitting stance toward D, while executing (side facing) a middle side strike to B with the left knife-hand.'),
(107, 2, 1006, 24, 'Bring the ball of the left foot straight to the side of the right foot facing D. Then, move the right foot (in a curving line) to A to form a sitting stance toward D, while executing (side facing) a middle side strike to A with the right knife-hand.'),
(108, 2, 1006, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot toward the left foot to form a parallel ready stance toward D. Remain in this stance until the at-ease command (swi-eot).'),
(109, 2, 1007, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type A toward D. Remain in this close ready stance type A toward D until given the command to begin the pattern.'),
(110, 2, 1007, 1, 'Move the left foot to B to form a right L-stance toward B, while executing (half facing) a twin forearm block to B.'),
(111, 2, 1007, 2, 'While maintaining a right L-stance toward B, execute (half facing) a high inward front strike to B with the right knife-hand, pulling the left side fist in front of the right shoulder.'),
(112, 2, 1007, 3, 'Slip the left foot to B to form a left fixed stance toward B, while executing (half facing) a middle side punch to B with the left forefist.'),
(113, 2, 1007, 4, 'Bring the ball of the left foot to the side of the right foot facing D. Then, move the right foot to A to form a left L-stance toward A, while executing (half facing) a twin forearm block to A.'),
(114, 2, 1007, 5, 'While maintaining a left L-stance toward A, execute (half facing) a high inward front strike to A with the left knife-hand, pulling the right side fist in front of the left shoulder.'),
(115, 2, 1007, 6, 'Slip the right foot to A to form a right fixed stance toward A, while executing (half facing) a middle side punch to A with the right forefist.'),
(116, 2, 1007, 7, 'Bring the ball of the right foot to the side rear of the left foot facing D. Then, while pivoting on the ball of the right foot form a right bending ready stance type A (half facing) toward D, while turning the face toward D.'),
(117, 2, 1007, 8, 'Execute a middle side piercing kick to D with the left footsword. At the same time, execute a high side punch to D with the left forefist.'),
(118, 2, 1007, 9, 'Lower the left foot to D to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(119, 2, 1007, 10, 'Move the right foot to D to form a left L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(120, 2, 1007, 11, 'Move the left foot to D to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(121, 2, 1007, 12, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) a middle front thrust to D with the right straight fingertip, pulling the back of the left fingertips under the right elbow.'),
(122, 2, 1007, 13, 'While pivoting on the ball of the right foot and turning counterclockwise, move the left foot to E to form a right L-stance toward E, while executing (half facing) a twin forearm block to E.'),
(123, 2, 1007, 14, 'While maintaining a right L-stance toward E, execute (half facing) a high inward front strike to E with the right knife-hand, pulling the left side fist in front of the right shoulder.'),
(124, 2, 1007, 15, 'Slip the left foot to E to form a left fixed stance toward E, while executing (half facing) a middle side punch to E with the left forefist.'),
(125, 2, 1007, 16, 'Bring the ball of the left foot to the side of the right foot facing C. Then, move the right foot to F to form a left L-stance toward F, while executing (half facing) a twin forearm block to F.'),
(126, 2, 1007, 17, 'While maintaining a left L-stance toward F, execute (half facing) a high inward front strike to F with the left knife-hand, pulling the right side fist in front of the left shoulder.'),
(127, 2, 1007, 18, 'Slip the right foot to F to form a right fixed stance toward F, while executing (half facing) a middle side punch to F with the right forefist.'),
(128, 2, 1007, 19, 'Bring the right foot to the side of the left foot facing C with the right arm extended to F. Then move the left foot to C to form a left walking stance toward C, while executing (reverse half facing) a circular block to CF with the right inner forearm.'),
(129, 2, 1007, 20, 'Execute a low front snap kick to C with the ball of the right foot, keeping the position of the hands as they were in move 19 above (a circular block position with the right inner forearm).'),
(130, 2, 1007, 21, 'Lower the right foot to C to form a right walking stance toward C, while executing (full facing) a middle front punch to C with the left forefist.'),
(131, 2, 1007, 22, 'While maintaining a right walking stance toward C, execute (reverse half facing) a circular block to CE with the left inner forearm.'),
(132, 2, 1007, 23, 'Execute a low front snap kick to C with the ball of the left foot, keeping the position of the hands as they were in move 22 above (a circular block position with the left inner forearm).'),
(133, 2, 1007, 24, 'Lower the left foot to C to form a left walking stance toward C, while executing (full facing) a middle front punch to C with the right forefist.'),
(134, 2, 1007, 25, 'Pivot on the ball of the left foot to form a left bending ready stance type A (half facing) toward C, while turning the face toward C.'),
(135, 2, 1007, 26, 'Execute a middle side piercing kick to C with the right footsword. At the same time, execute a high side punch to C with the right forefist.'),
(136, 2, 1007, 27, 'Lower the ball of the right foot toward BD on the CD line. Then, while pivoting on the ball of the right foot and turning counterclockwise, move the left foot to B to form a right L-stance toward B, while executing (half facing) a middle outer forearm guarding block to B.'),
(137, 2, 1007, 28, 'Bring the ball of the left foot to the side of the right foot facing D. Then, move the right foot to A to form a left L-stance toward A, while executing (half facing) a middle outer forearm guarding block to A.'),
(138, 2, 1007, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot to the left foot to form a close ready stance type A toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(139, 2, 1008, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Ready Stance toward D. Remain in this parallel ready stance toward D until given the command to begin the pattern.'),
(140, 2, 1008, 1, 'Move the left foot to B to form a sitting stance toward D, while extending (full facing) the left fist horizontally on the shoulder line toward D.'),
(141, 2, 1008, 2, 'While maintaining a sitting stance toward D, execute (full facing) a middle front punch to D with the right forefist. Perform moves 2 and 3 in a fast motion.'),
(142, 2, 1008, 3, 'While maintaining a sitting stance toward D, execute (full facing) a middle front punch to D with the left forefist.'),
(143, 2, 1008, 4, 'Bring the ball of the left foot straight to the side of the right foot facing D. Then, move the right foot (in a curving line) to A to form a sitting stance toward D, while extending (full facing) the right fist horizontally on the shoulder line toward D.'),
(144, 2, 1008, 5, 'While maintaining a sitting stance toward D, execute (full facing) a middle front punch to D with the left forefist. Perform moves 5 and 6 in a fast motion.'),
(145, 2, 1008, 6, 'While maintaining a sitting stance toward D, execute (full facing) a middle front punch to D with the right forefist.'),
(146, 2, 1008, 7, 'Pivoting on the ball of the left foot, move the right foot to AD to form a right walking stance toward AD, while executing (half facing) a middle side block to AD with the right inner forearm.'),
(147, 2, 1008, 8, 'Execute a low front snap kick to AD with the ball of the left foot, keeping the position of the hands as they were in move 7 above (a middle side block with the right inner forearm).'),
(148, 2, 1008, 9, 'Lower the left foot to AD to form a left walking stance toward AD, while executing (full facing) a middle front punch to AD with the left forefist. Perform moves 9 and 10 in a fast motion.'),
(149, 2, 1008, 10, 'While maintaining a left walking stance toward AD, execute (full facing) a middle front punch to AD with the right forefist.'),
(150, 2, 1008, 11, 'Pivoting on the ball of the right foot, move the left foot to BD to form a left walking stance toward BD, while executing (half facing) a middle side block to BD with the left inner forearm.'),
(151, 2, 1008, 12, 'Execute a low front snap kick to BD with the ball of the right foot, keeping the position of the hands as they were in move 11 above (a middle side block with the left inner forearm).'),
(152, 2, 1008, 13, 'Lower the right foot to BD to form a right walking stance toward BD, while executing (full facing) a middle front punch to BD with the right forefist. Perform moves 13 and 14 in a fast motion.'),
(153, 2, 1008, 14, 'While maintaining a right walking stance toward BD, execute (full facing) a middle front punch to BD with the left forefist.'),
(154, 2, 1008, 15, 'Pivoting on the ball of the left foot, move right foot to D to form a right walking stance toward D, while executing (half facing) a middle side hooking block to D with the right palm.'),
(155, 2, 1008, 16, 'While maintaining a right walking stance toward D, execute (reverse half facing) a middle side hooking block to D with the left palm. Perform moves 16 and 17 in a connecting motion.'),
(156, 2, 1008, 17, 'While maintaining a right walking stance toward D, execute (full facing) a middle front punch to D with the right forefist.'),
(157, 2, 1008, 18, 'Move the left foot to D to form a left walking stance toward D, while executing (half facing) a middle side hooking block to D with the left palm.'),
(158, 2, 1008, 19, 'While maintaining a left walking stance toward D, execute (reverse half facing) a middle side hooking block to D with the right palm. Perform moves 19 and 20 in a connecting motion.'),
(159, 2, 1008, 20, 'While maintaining a left walking stance toward D, execute (full facing) a middle front punch to D with the left forefist.'),
(160, 2, 1008, 21, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(161, 2, 1008, 22, 'Pivot on the ball of the right foot to form a right bending ready stance type A (half facing) toward D, while turning the face toward D.'),
(162, 2, 1008, 23, 'Execute a middle side piercing kick to D with the left footsword. At the same time, execute a high side punch to D with the left forefist.'),
(163, 2, 1008, 24, 'Lower the left foot to D to form a left walking stance toward D, while executing (full facing) front strike to D with the right elbow, striking the left palm and finger belly with the right elbow.'),
(164, 2, 1008, 25, 'Pivoting on the ball of the left foot and turning clockwise, form a left bending ready stance type A (half facing) toward C, while turning the face toward C.'),
(165, 2, 1008, 26, 'Execute a middle side piercing kick to C with the right footsword. At the same time, execute a high side punch to C with the right forefist.'),
(166, 2, 1008, 27, 'Lower the right foot to C to form a right walking stance toward C, while executing (full facing) front strike to C with the left elbow, striking the right palm and finger belly with the left elbow.'),
(167, 2, 1008, 28, 'Pivoting on the ball of the right foot, move the left foot to E to form a right L-stance toward E, while executing (half facing) a twin knife-hand block to E.'),
(168, 2, 1008, 29, 'Move the right foot to E to form a right walking stance toward E, while executing (full facing) a middle front thrust to E with the right straight fingertip, pulling the back of the left fingertips under the right elbow.'),
(169, 2, 1008, 30, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to F to form a left L-stance toward F, while executing (half facing) a twin knife-hand block to F.'),
(170, 2, 1008, 31, 'Move the left foot to F to form a left walking stance toward F, while executing (full facing) a middle front thrust to F with the left straight fingertip, pulling the back of the right fingertips under the left elbow.'),
(171, 2, 1008, 32, 'Pivoting on the ball of the right foot, move the left foot to C to form a left walking stance toward C, while executing (half facing) a high side block to C with the left outer forearm.'),
(172, 2, 1008, 33, 'While maintaining a left walking stance toward C, execute (full facing) a middle front punch to C with the right forefist.'),
(173, 2, 1008, 34, 'Move the right foot to C to form a right walking stance toward C, while executing (half facing) a high side block to C with the right outer forearm.'),
(174, 2, 1008, 35, 'While maintaining a right walking stance toward C, execute (full facing) a middle front punch to C with the left forefist.'),
(175, 2, 1008, 36, 'Move the left foot toward C in a jumping motion (about one and a half shoulder widths in front of the right foot), landing to form a left X-stance toward BC, while executing (side facing) a high side strike to C with the left backfist. Perform this move in a jumping motion.'),
(176, 2, 1008, 37, 'While pivoting on the ball of the left foot and turning clockwise, move the right foot to A to form a right walking stance toward A, while executing (half facing) a high side block to A with the right double forearm.'),
(177, 2, 1008, 38, 'Bring the ball of the right foot to the side of the left foot facing D. Then, while pivoting on the ball of the right foot, move the left foot to B to form a left walking stance toward B, while executing (half facing) a high side block to B with the left double forearm.'),
(178, 2, 1008, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot toward the right foot to form a parallel ready stance toward D. Remain in this stance until the at-ease command (swi-eot).'),
(179, 2, 1009, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type B toward D. Remain in this close ready stance type B toward D until given the command to begin the pattern.'),
(180, 2, 1009, 1, 'Move the left foot to B to form a right L-stance toward B, while executing (half facing) a middle outward side block to B with the left reverse knife-hand.'),
(181, 2, 1009, 2, 'Execute a low side front snap kick to B with the ball of the left foot, keeping the position of the hands as they were in move 1 above (a middle outward block with the left reverse knife-hand).'),
(182, 2, 1009, 3, 'Lower the ball of the left foot to B. Then, while pivoting on the ball of the left foot, move the right foot to B to form a left rear foot stance toward B, while executing (half facing) an upward block to B with the right palm.'),
(183, 2, 1009, 4, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to A to form a left L-stance toward A, while executing (half facing) a middle outward side block to A with the right reverse knife-hand.'),
(184, 2, 1009, 5, 'Execute a low side front snap kick to A with the ball of the right foot, keeping the position of the hands as they were in move 4 above (a middle outward block with the right reverse knife-hand).'),
(185, 2, 1009, 6, 'Lower the ball of the right foot to A. Then, while pivoting on the ball of the right foot, move the left foot to A to form a right rear foot stance toward A, while executing (half facing) an upward block to A with the left palm.'),
(186, 2, 1009, 7, 'Pivoting on the ball of the right foot, move the left foot to D to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(187, 2, 1009, 8, 'Slip the left foot to D to form a left walking stance toward D, while executing (full facing) a right upper elbow strike to D.'),
(188, 2, 1009, 9, 'Move the right foot to D to form a left L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(189, 2, 1009, 10, 'Slip the right foot to D to form a right walking stance toward D, while executing (full facing) a left upper elbow strike to D.'),
(190, 2, 1009, 11, 'Move the left foot to D to form a left walking stance toward D, while executing (full facing) a high vertical punch to D with a twin forefist.'),
(191, 2, 1009, 12, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) an upset punch to D with a twin forefist.'),
(192, 2, 1009, 13, 'Prior to moving the body, move the ball of the right foot on the CD line (half a shoulder width toward F and half a shoulder width toward C). Then, while pivoting on the ball of the right foot and turning counterclockwise, move the left foot to C to form a left walking stance toward C, while executing (full facing) a rising block to C with an X-fist. Perform this move in a spot-turning motion - method one.'),
(193, 2, 1009, 14, 'Move the left foot to E to form a right L-stance toward E, while executing (half facing) a high side strike to E with the left backfist.'),
(194, 2, 1009, 15, 'Slip the left foot straight to E to form a left walking stance (full facing) toward E, while twisting the left fist counterclockwise until the backfist faces downward. Perform moves 15 and 16 in a fast motion with no balance recovery, as well as performing move 15 in releasing motion.'),
(195, 2, 1009, 16, 'While maintaining a left walking stance toward E, execute (full facing) a high front punch to E with the right forefist.'),
(196, 2, 1009, 17, 'Bring the ball of the left foot to the side of the right foot facing C. Then, move the right foot to F to form a left L-stance toward F, while executing (half facing) a high side strike to F with the right backfist.'),
(197, 2, 1009, 18, 'Slip the right foot straight to F to form a right walking stance (half facing) toward F, while twisting the right fist clockwise until the backfist faces downward. Perform moves 18 and 19 in a fast motion with no balance recovery, as well as performing move 18 in releasing motion.'),
(198, 2, 1009, 19, 'While maintaining a right walking stance toward F, execute (full facing) a high front punch to F with the left forefist.'),
(199, 2, 1009, 20, 'Bring the ball of the right foot to the side of the left foot facing C. Then, move the left foot to C to form a left walking stance toward C, while executing (half facing) a high side block to C with the left double forearm.'),
(200, 2, 1009, 21, 'Pull the left foot toward the right foot to form a right L-stance toward C, while executing (half facing) a middle side punch to C with the left forefist.'),
(201, 2, 1009, 22, 'Execute a middle side piercing kick to C with the right footsword. At the same time, execute a high side punch to C with the right forefist.'),
(202, 2, 1009, 23, 'Lower the right foot to C to form a right walking stance toward C, while executing (half facing) a high side block to C with the right double forearm.'),
(203, 2, 1009, 24, 'Pull the right foot toward the left foot to form a left L-stance toward C, while executing (half facing) a middle side punch to C with the right forefist.'),
(204, 2, 1009, 25, 'Execute a middle side piercing kick to C with the left footsword. At the same time, execute a high side punch to C with the left forefist.'),
(205, 2, 1009, 26, 'Lower the left foot to C to form a right L-stance toward C, while executing (half facing) a middle outer forearm guarding block to C.'),
(206, 2, 1009, 27, 'Slip the left foot to C to form a left low stance toward C, while executing (full facing) a pressing block to C with the right palm. Perform this move in a slow motion – sliding the left foot.'),
(207, 2, 1009, 28, 'Move the right foot to C to form a left L-stance toward C, while executing (half facing) a middle outer forearm guarding block to C.'),
(208, 2, 1009, 29, 'Slip the right foot to C to form a right low stance toward C, while executing (full facing) a pressing block to C with the left palm. Perform this move in a slow motion – sliding the right foot.'),
(209, 2, 1009, 30, 'Pivoting on the ball of the right foot, bring the left foot to the side of the right foot to form a close stance toward A, while executing (full facing) an angle punch with the right forefist. Perform this move in slow motion.'),
(210, 2, 1009, 31, 'Move the right foot to A to form a right fixed stance toward A, while executing (half facing) a U-shape block to A with reverse knife-hands.'),
(211, 2, 1009, 32, 'Bring the ball of the right foot to the side of the left foot facing D. Then, move the left foot to B to form a left fixed stance toward B, while executing (half facing) a U-shape block to B with reverse knife-hands.'),
(212, 2, 1009, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot to the right foot to form a close ready stance type B toward D. Remain in this stance until the at-ease command (swi-eot).'),
(213, 2, 1010, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type B toward D. Remain in this close ready stance type B toward D until given the command to begin the pattern.'),
(214, 2, 1010, 1, 'Move the left foot to B to form a right L-stance toward B, while executing (half facing) a middle side block to B with the left inner forearm.'),
(215, 2, 1010, 2, 'Slip left foot to B to form a left walking stance toward B, while executing (full facing) a low front thrust to B with the right upset fingertip, pulling the left side fist in front of the right shoulder.'),
(216, 2, 1010, 3, 'Bring the left foot to the side of the right foot to form a close stance toward D, while executing (full facing) a side back strike to C with the right backfist and extending the left arm to the side-downward. Perform this move in a slow motion.'),
(217, 2, 1010, 4, 'Move the right foot to A to form a left L-stance toward A, while executing (half facing) a middle side block to A with the right inner forearm.'),
(218, 2, 1010, 5, 'Slip the right foot to A to form a right walking stance toward A, while executing (full facing) a low front thrust to A with the left upset fingertip, pulling the right side fist in front of the left shoulder.'),
(219, 2, 1010, 6, 'Bring the right foot to the side of the left foot to form a close stance toward D, while executing (full facing) a side back strike to C with the left backfist and extending the right arm to the side-downward. Perform this move in a slow motion.'),
(220, 2, 1010, 7, 'Move the left foot to D to form a left walking stance toward D, while executing (full facing) a pressing block to D with an X-fist. Perform moves 7 and 8 in a continuous motion.'),
(221, 2, 1010, 8, 'While maintaining a left walking stance toward D, execute (full facing) a high vertical punch to D with a twin forefist.'),
(222, 2, 1010, 9, 'Execute a middle front snap kick to D with the ball of the right foot, keeping the position of the hands as they were in move 8 above (a high vertical punch with a twin forefist).'),
(223, 2, 1010, 10, 'Lower the right foot to D to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(224, 2, 1010, 11, 'While maintaining a right walking stance toward D, execute (full facing) a middle front punch to D with the left forefist.'),
(225, 2, 1010, 12, 'Bring the left foot to the side of the right foot to form a close stance toward F, while executing (side facing) a twin side elbow thrust. Perform this move in a slow motion.'),
(226, 2, 1010, 13, 'Pivoting on the ball of the left foot, move the right foot to F in a stamping motion to form a sitting stance toward C, while executing (side facing) an inward W-shape block with the right outer forearm. Perform this move in a stamping motion.'),
(227, 2, 1010, 14, 'Pivoting on the ball of the right foot and turning clockwise, move the left foot to F in a stamping motion to form a sitting stance toward D, while executing (side facing) an inward W-shape block with the left outer forearm. Perform this move in a stamping motion.'),
(228, 2, 1010, 15, 'Pivoting on the ball of the right foot and turning clockwise, move the left foot to E in a stamping motion to form a sitting stance toward C, while executing (side facing) an inward W-shape block with the left outer forearm. Perform this move in a stamping motion.'),
(229, 2, 1010, 16, 'Pivoting on the ball of the left foot and turning counterclockwise, move the right foot to E in a stamping motion to form a sitting stance toward D, while executing (side facing) an inward W-shape block with the right outer forearm. Perform this move in a stamping motion.'),
(230, 2, 1010, 17, 'Pivoting on the ball of the right foot and turning clockwise, move the left foot to E in a stamping motion to form a sitting stance toward C, while executing (side facing) an inward W-shape block with the left outer forearm. Perform this move in a stamping motion.'),
(231, 2, 1010, 18, 'Pivoting on the ball of the right foot and turning clockwise, move the left foot to F in a stamping motion to form a sitting stance toward D, while executing (side facing) an inward W-shape block with the left outer forearm. Perform this move in a stamping motion.'),
(232, 2, 1010, 19, 'Bring the ball of the right foot to the side of the left foot facing D. Then, while pivoting on the ball of the right foot, move the left foot to D to form a right L-stance toward D, while executing (half facing) a low pushing block to D with the left double forearm.'),
(233, 2, 1010, 20, 'Slip the left foot to D to form a left walking stance toward D, extending both hands (full facing) upward toward D as if to grab the opponent''s head.'),
(234, 2, 1010, 21, 'Execute an upward kick to D with the right knee, while pulling both open hands downward to the same level as the elbows.'),
(235, 2, 1010, 22, 'Lower the ball of the right foot to the side front of the left foot. Then, while pivoting on the ball of the right foot and turning counterclockwise, move the left foot to C to form a right L-stance toward C, while executing (half facing) a middle knife-hand guarding block to C.'),
(236, 2, 1010, 23, 'Execute a low side front snap kick to C with the ball of the left foot, keeping the position of the hands as they were in move 22 above (a middle knife-hand guarding block).'),
(237, 2, 1010, 24, 'Lower the left foot to C to form a left walking stance toward C, while executing (full facing) a high front thrust to C with the left flat fingertip.'),
(238, 2, 1010, 25, 'Move the right foot to C to form a left L-stance toward C, while executing (half facing) a middle knife-hand guarding block to D.'),
(239, 2, 1010, 26, 'Execute a low side front snap kick to C with the ball of the right foot, keeping the position of the hands as they were in move 25 above (a middle knife-hand guarding block).'),
(240, 2, 1010, 27, 'Lower the right foot to C to form a right walking stance toward C, while executing (full facing) a high front thrust to C with the right flat fingertip.');
INSERT INTO `EncyclopediaCount` (`ID`, `EncyclopediaID`, `PatternID`, `Count`, `Text`) VALUES
(241, 2, 1010, 28, 'Move the right foot to D to form a right L-stance toward C, while executing (half facing) a side back strike to D with the right backfist and a low block to C with the left outer forearm.'),
(242, 2, 1010, 29, 'Move the right foot toward C in a jumping motion (about one and a half shoulder widths in front of the left foot), landing to form a right X-stance toward A, while executing (full facing) a pressing block to A with an X-fist. Perform this move in a jumping motion.'),
(243, 2, 1010, 30, 'Pivoting on the ball of the left foot, move the right foot to C to form a right walking stance toward C, while executing (half facing) a high side block to C with the right double forearm.'),
(244, 2, 1010, 31, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to B to form a right L-stance toward B, while executing (half facing) a low knife-hand guarding block to B.'),
(245, 2, 1010, 32, 'Slip the left foot straight to B to form a left walking stance toward B, while executing (reverse half facing) a circular block to BD with the right inner forearm. Perform this move with no balance recovery.'),
(246, 2, 1010, 33, 'Bring the ball of the left foot to the side of the right foot facing D. Then, move the right foot to A to form a left L-stance toward A, while executing (half facing) a low knife-hand guarding block to A.'),
(247, 2, 1010, 34, 'Slip the right foot straight to A to form a right walking stance toward A, while executing (reverse half facing) a circular block to AD with the left inner forearm. Perform this move with no balance recovery.'),
(248, 2, 1010, 35, 'Pivot on the balls of both feet to form a left walking stance toward BD, while executing (reverse half facing) a circular block to D with the right inner forearm.'),
(249, 2, 1010, 36, 'Pivot on the balls of both feet to form a right walking stance toward A, while executing (reverse half facing) a circular block to AD with the left inner forearm.'),
(250, 2, 1010, 37, 'Move the right foot on the AB line to form a sitting stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(251, 2, 1010, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot to the left foot to form a close ready stance type B toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(252, 2, 1011, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type C toward D. Remain in this close ready stance type C toward D until given the command to begin the fundamental pattern exercise.'),
(253, 2, 1011, 1, 'Pivoting on the ball of the left foot and turning counterclockwise, move the right foot to D in a sliding motion to form a right L-stance toward C, while thrusting (half facing) to D with the right side elbow. Perform this move in a sliding motion.'),
(254, 2, 1011, 2, 'Pivoting on the ball of the left foot and turning counterclockwise, move the right foot to B in a sliding motion to form a right L-stance toward A, while thrusting (half facing) to B with the right side elbow. Perform this move in a sliding motion.'),
(255, 2, 1011, 3, 'Pivoting on the ball of the left foot and turning counterclockwise, move the right foot to C in a sliding motion to form a right L-stance toward D, while thrusting (half facing) to C with the right side elbow. Perform this move in a sliding motion.'),
(256, 2, 1011, 4, 'Pivoting on the ball of the left foot and turning counterclockwise, move the right foot to A in a sliding motion to form a right L-stance toward B, while thrusting (half facing) to A with the right side elbow. Perform this move in a sliding motion.'),
(257, 2, 1011, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot to the left foot to form a close ready stance type C toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(258, 2, 1012, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type C toward D. Remain in this close ready stance type C toward D until given the command to begin the fundamental pattern exercise.'),
(259, 2, 1012, 1, 'Pivoting on the ball of the right foot and turning clockwise, move the left foot to D in a sliding motion to form a left L-stance toward C, while thrusting (half facing) to D with the left side elbow. Perform this move in a sliding motion.'),
(260, 2, 1012, 2, 'Pivoting on the ball of the right foot and turning clockwise, move the left foot to A in a sliding motion to form a left L-stance toward B, while thrusting (half facing) to A with the left side elbow. Perform this move in a sliding motion.'),
(261, 2, 1012, 3, 'Pivoting on the ball of the right foot and turning clockwise, move the left foot to C in a sliding motion to form a left L-stance toward D, while thrusting (half facing) to C with the left side elbow. Perform this move in a sliding motion.'),
(262, 2, 1012, 4, 'Pivoting on the ball of the right foot and turning clockwise, move the left foot to B in a sliding motion to form a left L-stance toward A, while thrusting (half facing) to B with the left side elbow. Perform this move in a sliding motion.'),
(263, 2, 1012, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot to the right foot to form a close ready stance type C toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(264, 2, 1013, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type C toward D. Remain in this close ready stance type C toward D until given the command to begin the pattern.'),
(265, 2, 1013, 1, 'Move the left foot to B to form a sitting stance toward D, while executing (full facing) a middle side front pushing block to D with the left palm.'),
(266, 2, 1013, 2, 'While maintaining a sitting stance toward D, execute (full facing) a middle front punch to D with the right forefist.'),
(267, 2, 1013, 3, 'While maintaining a sitting stance toward D, execute (full facing) a middle front punch to D with the left forefist.'),
(268, 2, 1013, 4, 'Pivoting on the ball of the left foot, move the right foot to A to form a left L-stance toward A, while executing (half facing) a twin forearm block to A.'),
(269, 2, 1013, 5, 'While maintaining a left L-stance toward A, execute (half facing) an upward punch to A with the left forefist, pulling the right side fist in front of the left shoulder.'),
(270, 2, 1013, 6, 'Move the right foot to A to form a right fixed stance toward A in a sliding motion, while executing (half facing) a middle side punch to A with the right forefist. Perform this move in a sliding motion.'),
(271, 2, 1013, 7, 'Pull the right foot toward the left foot to form a left vertical stance toward A, while executing (half facing) a side downward strike to A with the right knife-hand.'),
(272, 2, 1013, 8, 'Move the left foot to A to form a left walking stance toward A, while executing (full facing) a middle punch to A with the left forefist.'),
(273, 2, 1013, 9, 'Move the left foot to D to form a left walking stance toward D, while executing (half facing) a low block to D with the left outer forearm.'),
(274, 2, 1013, 10, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(275, 2, 1013, 11, 'Pull the ball of the left foot toward the right foot with both feet (about a half shoulder width apart) facing BD. At the same time, bring the left palm to the right forefist, while bending the right elbow about 45 degrees outward.'),
(276, 2, 1013, 12, 'Execute a middle side piercing kick to D with the right footsword, while pulling both hands in the opposite direction to the front of the left chest, with the left palm on the right forefist. Then, lower the right foot to D to form a left L-stance toward D, while executing (half facing) a middle outward side strike to D with the right knife-hand.'),
(277, 2, 1013, 13, 'Move the left foot to D to form a left walking stance toward D, while executing (full facing) a middle front punch to D with the left forefist.'),
(278, 2, 1013, 14, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(279, 2, 1013, 15, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to E to form a right L-stance toward E, while executing (half facing) a middle knife-hand guarding block to E.'),
(280, 2, 1013, 16, 'Move the right foot to E to form a right walking stance toward E, while executing (full facing) a middle front thrust to E with the right straight fingertip, pulling the back of the left fingertips under the right elbow.'),
(281, 2, 1013, 17, 'Prior to moving the body, move the ball of the right foot on the EF line (about 2/3 shoulder width toward D and 1/2 shoulder width toward F). Then, while pivoting on the ball of the right foot and turning counterclockwise, move the left foot to F to form a right L-stance toward F, while executing (half facing) a middle knife-hand guarding block to F. Perform this move in a spot-turning motion - method one.'),
(282, 2, 1013, 18, 'Execute a high turning kick to DF with the ball of the right foot, while holding both side fists up and toward DF, Then lower the ball of the right foot to F. Perform moves 18 and 19 in a fast motion.'),
(283, 2, 1013, 19, 'Execute a high turning kick to CF with the ball of the left foot, while holding both side fists up and toward CF. Then, lower the left foot to F to form a right L-stance toward F, while executing (half facing) a middle knife-hand guarding block to F.'),
(284, 2, 1013, 20, 'Pivoting on the ball of the right foot, move the left foot to C to form a left walking stance toward C,while executing (half facing) a low block to C with the left outer forearm.'),
(285, 2, 1013, 21, 'Pull the left foot straight toward the right foot to form a right L-stance toward C, while executing (half facing) a middle front punch to C with the right forefist.'),
(286, 2, 1013, 22, 'Move the right foot to C to form a left L-stance toward C, while executing (half facing) a middle front punch to C with the left forefist.'),
(287, 2, 1013, 23, 'Move the left foot to C to form a right L-stance toward C, while executing (half facing) a middle front punch to C with the right forefist.'),
(288, 2, 1013, 24, 'Slip the left foot straight to C, pivoting on the ball of the right foot to form a left walking stance toward C, while executing (full facing) a pressing block with an X-fist to C. Perform this move with no balance recovery.'),
(289, 2, 1013, 25, 'Move the right foot to C in a sliding motion to form a right L-stance toward D, while thrusting (half facing) to C with the right side elbow. Perform this move in a sliding motion.'),
(290, 2, 1013, 26, 'Pivoting on the ball of the right foot and turning counterclockwise, bring the left foot to the side of the right foot to form a close stance toward B, while executing (full facing) a high side front block to B with the right inner forearm, extending the left forearm to the side-downward.'),
(291, 2, 1013, 27, 'While maintaining a close stance toward B, execute (full facing) a high side front block to B with the left inner forearm, extending the right forearm to the side-downward.'),
(292, 2, 1013, 28, 'While pivoting on the ball of the right foot, move the left foot to B to form a right L-stance toward B, at the same time executing (half facing) a middle knife-hand guarding block to B.'),
(293, 2, 1013, 29, 'Bring the ball of the left foot to the side of the right foot facing D. Then, move the right foot to A to form a left L-stance toward A, while executing (half facing) a middle knife-hand guarding block to A.'),
(294, 2, 1013, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot to the left foot to form a close ready stance type C toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(295, 2, 1014, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Ready Stance toward D. Remain in this parallel ready stance toward D until given the command to begin the pattern.'),
(296, 2, 1014, 1, 'Move the left foot to B to form a right L-stance toward B, while executing (half facing) a twin knife-hand block to B.'),
(297, 2, 1014, 2, 'Move the right foot to B to form a right walking stance toward B, while executing (full facing) a high front strike to B with the right knife-hand, bringing the left backhand in front of the forehead.'),
(298, 2, 1014, 3, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to A to form a left L-stance toward A, while executing (half facing) a middle knife-hand guarding block to A.'),
(299, 2, 1014, 4, 'Move the left foot to A to form a left walking stance toward A, while executing (full facing) a high front thrust to A with the left flat fingertip.'),
(300, 2, 1014, 5, 'Move the left foot to D to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(301, 2, 1014, 6, 'Pivot on the ball of the left foot to form a left bending ready stance type A (half facing) toward C, while turning the face toward C.'),
(302, 2, 1014, 7, 'Execute a middle side piercing kick to C with the right footsword. At the same time, execute a high side punch to D with the right forefist.'),
(303, 2, 1014, 8, 'Lower the right foot to C to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(304, 2, 1014, 9, 'Move the ball of the right foot to D, at the side front of the left foot, and then execute a flying side piercing kick to D with the right footsword, while holding both side fists up and toward D. Then, land facing toward D to form a left L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D. Perform this move in a step-jumping motion.'),
(305, 2, 1014, 10, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to E to form a right L-stance toward E, while executing (half facing) a low block to E with the left outer forearm.'),
(306, 2, 1014, 11, 'Slip the left foot to E to form a left walking stance toward E, while extending (full facing) both hands upward as if to grab the opponent''s head.'),
(307, 2, 1014, 12, 'Execute an upward kick to E with the right knee pulling both open hands downward to the same level as the elbows.'),
(308, 2, 1014, 13, 'Lower the ball of the right foot to the side of the left foot. Then, while pivoting on the ball of the right foot and turning counterclockwise, move the left foot to F to form a left walking stance toward F, while executing (full facing) a high front strike to F with the right reverse knife-hand, bringing the left backhand under the right elbow joint.'),
(309, 2, 1014, 14, 'Execute a high turning kick to DF with the ball of the right foot, while holding both side fists up and toward DF. Then, lower the ball of the right foot to the side of the left foot with the right foot facing F. Perform moves 14 and 15 in a fast motion.'),
(310, 2, 1014, 15, 'Pivoting on the ball of the right foot, execute a middle back piercing kick to F with the left footsword, while holding both side fists up and toward F.'),
(311, 2, 1014, 16, 'Lower the left foot to F to form a left L-stance toward E, while executing (half facing) a middle outer forearm guarding block to E.'),
(312, 2, 1014, 17, 'Execute a middle turning kick to DE with the ball of the left foot, while holding both side fists up and toward DE.'),
(313, 2, 1014, 18, 'Lower the ball of the left foot to the side of the right foot. Then, move the right foot to C to form a right fixed stance toward C, while executing (half facing) a U-shape block to C with reverse knife-hands.'),
(314, 2, 1014, 19, 'Jump and spin around counterclockwise, landing on the same spot to form a left L-stance toward C, while executing (half facing) a middle knife-hand guarding block to C. Perform this move in a jumping motion.'),
(315, 2, 1014, 20, 'Move the left foot to C to form a left walking stance toward C, while executing (full facing) a low front thrust to C with the right upset fingertip.'),
(316, 2, 1014, 21, 'Pull the left foot straight toward the right foot to form a right L-stance toward C, while executing (half facing) a side back strike to D with the right backfist and a low block to C with the left outer forearm. Perform this move with no balance recovery.'),
(317, 2, 1014, 22, 'Move the right foot to C to form a right walking stance toward C, while executing (full facing) a middle front thrust to C with the right straight fingertip, pulling the back of the left fingertips under the right elbow.'),
(318, 2, 1014, 23, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to B to form a left walking stance toward B, while executing (half facing) a high side block to B with the left double forearm.'),
(319, 2, 1014, 24, 'Pivoting on the ball of the left foot, move the right foot to B to form a sitting stance toward C, while executing (full facing) a middle front block to C with the right outer forearm. Then, while maintaining a sitting stance toward C, execute (side facing) a high side strike to B with the right backfist. Perform both of the techniques included in this move at regular speed.'),
(320, 2, 1014, 25, 'Pivoting on the ball of the left foot, execute a middle side piercing kick to A with the right footsword. At the same time, execute a high side punch to A with the right forefist.'),
(321, 2, 1014, 26, 'Lower the ball of the right foot to A. Then, while pivoting on the ball of the right foot, execute a middle side piercing kick to A with the left footsword. At the same time, execute a high side punch to A with the left forefist.'),
(322, 2, 1014, 27, 'Lower the ball of the left foot to A. Then, while pivoting on the ball of the left foot, move the right foot to B to form a left L-stance toward B, while executing (half facing) a checking block to B with an X-knife-hand.'),
(323, 2, 1014, 28, 'Move the left foot to B to form a left walking stance toward B, while executing (full facing) an upward block to B with a twin palm.'),
(324, 2, 1014, 29, 'Prior to moving the body, move the ball of the left foot on the AB line (half a shoulder width toward D and half a shoulder width toward A). Then, while pivoting on the ball of the left foot and turning clockwise, move the right foot to A to form a right walking stance toward A, while executing (full facing) a rising block to A with the right outer forearm. Perform this move in a spot-turning motion - method one.'),
(325, 2, 1014, 30, 'While maintaining a right walking stance toward A, execute (full facing) a middle front punch to A with the left forefist.'),
(326, 2, 1014, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot back onto the AB line to form a parallel ready stance toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(327, 2, 1015, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Stance with a Heaven Hand toward D. Remain in this parallel stance with a heaven hand toward D until given the command to begin the pattern.'),
(328, 2, 1015, 1, 'Move the left foot to the side of the right foot (at the same time bringing both hands around in a circular motion) to form a close ready stance type B (full facing) toward D.'),
(329, 2, 1015, 2, 'Move the left foot to D to form a left walking stance toward D, while executing (full facing) an upset punch to D with the right forefist. Perform this move in a slow motion – sliding the left foot.'),
(330, 2, 1015, 3, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) an upset punch to D with the left forefist.Perform this move in a slow motion – sliding the right foot.'),
(331, 2, 1015, 4, 'Move the ball of the left foot to the side front of the right foot, and then move the right foot to D to form a right walking stance toward D, while executing (half facing) a high hooking block to D with the right palm. Perform this move in a double stepping motion.'),
(332, 2, 1015, 5, 'Move the right foot to C in a sliding motion to form a right L-stance toward D, while executing (half facing) a low knife-hand guarding block to D. Perform this move in a sliding motion.'),
(333, 2, 1015, 6, 'Move the ball of the right foot to the side front of the left foot, and then move the left foot to D to form a left walking stance toward D, while executing (half facing) a high hooking block to D with the left palm. Perform this move in a double stepping motion.'),
(334, 2, 1015, 7, 'Move the left foot to C in a sliding motion to form a left L-stance toward D, while executing (half facing) a low knife-hand guarding block to D. Perform this move in a sliding motion.'),
(335, 2, 1015, 8, 'Move the left foot to D to form a right rear foot stance toward D, while executing (half facing) a high knife-hand guarding block to D.'),
(336, 2, 1015, 9, 'Move the right foot to D to form a left rear foot stance toward D, while executing (half facing) a high knife-hand guarding block to D.'),
(337, 2, 1015, 10, 'Move the ball of the left foot to the side front of the right foot. Then, pivoting on the ball of the left foot and turning counter-clockwise, move the right foot to D to form a left walking stance toward C, while executing (full facing) an upward block to C with the right palm. Perform this move in a slow motion – sliding the right foot.'),
(338, 2, 1015, 11, 'Move the right foot to C to form a right walking stance toward C, while executing (full facing) an upward block to C with the left palm. Perform this move in a slow motion – sliding the right foot.'),
(339, 2, 1015, 12, 'Move the left foot to the side of the right foot to form a close stance toward C, while executing (full facing) a low front block with the right knife-hand, striking the left palm with the right knife-hand (moving both hands in a circular motion).'),
(340, 2, 1015, 13, 'Execute a pressing kick to E with the left footsword, keeping the position of the hands as they were in move 12 above (a low front block with the right knife-hand). Perform moves 13 and 14 in a consecutive kicking motion.'),
(341, 2, 1015, 14, 'Execute a middle side piercing kick to E with the left footsword, keeping the position of the hands as they were in move 13 above (a low front block with the right knife-hand).'),
(342, 2, 1015, 15, 'Lower the left foot to E to form a right L-stance toward E, while executing (half facing) a high inward strike to E with the right knife-hand, bringing the left side fist in front of the right shoulder'),
(343, 2, 1015, 16, 'Pull the left foot to the side of the right foot to form a close stance toward C, while executing (side facing) a side downward strike to E with the left side fist.'),
(344, 2, 1015, 17, 'Execute a pressing kick to F with the right footsword, keeping the position of the hands as they were in move 16 above (a side downward strike with the left side fist). Perform moves 17 and 18 in a consecutive kicking motion.'),
(345, 2, 1015, 18, 'Execute a middle side piercing kick to F with the right footsword, keeping the position of thehands as they were in move 17 above (a side downward strike with the left side fist).'),
(346, 2, 1015, 19, 'Lower the right foot to F to form a left L-stance toward F, while executing (half facing) a high inward strike to F with the left knife-hand, bringing the right side fist in front of the left shoulder.'),
(347, 2, 1015, 20, 'Pull the right foot to the side of the left foot to form a close stance toward C, while executing (side facing) a downward strike to F with the right side fist.'),
(348, 2, 1015, 21, 'Move the left foot to C to form a left low stance toward C, while executing (full facing) a pressing block to C with the right palm. Perform this move in a slow motion – sliding the left foot.'),
(349, 2, 1015, 22, 'Move the right foot to C to form a right low stance toward C, while executing (full facing) a pressing block to C with the left palm. Perform this move in a slow motion – sliding the right foot.'),
(350, 2, 1015, 23, 'While pivoting on the ball of the left foot and turning clockwise, move the right foot to D in a stamping motion to form a sitting stance toward F, while executing (side facing) a high side strike to D with the right backfist. Perform this move in a stamping motion.'),
(351, 2, 1015, 24, 'While pivoting on the ball of the left foot and turning clockwise, move the right foot to D to form a right walking stance toward D, while executing (half facing) a middle block to D with the right double forearm.'),
(352, 2, 1015, 25, 'Shifting to C while maintaining a right walking stance toward D, execute (reverse half facing) a low block to D with the left outer forearm, keeping the position of the right hand as it was in move 24 above (in the position of a middle outward block with the right inner forearm). Perform this move in a shifting motion.'),
(353, 2, 1015, 26, 'Slip the right foot to D to form a right low stance toward D, while executing (full facing) a high front thrust to D with the right flat fingertip. Perform this move in a slow motion – sliding the right foot.'),
(354, 2, 1015, 27, 'While pivoting on the ball of the right foot, move the left foot on the CD line in a stamping motion to form a sitting stance toward F, while executing (side facing) a high side strike to C with the left backfist. Perform this move in a stamping motion.'),
(355, 2, 1015, 28, 'While pivoting on the ball of the left foot and turning counterclockwise, move the right foot to D to form a left walking stance toward C, while executing (half facing) a middle block to C with the left double forearm.'),
(356, 2, 1015, 29, 'Shifting to D while maintaining a left walking stance toward C, execute (reverse half facing) a low block to C with the right outer forearm, keeping the position of the left hand as it was in move 28 above (in the position of a middle outward block with the left inner forearm). Perform this move in a shifting motion.'),
(357, 2, 1015, 30, 'Slip the left foot to C to form a left low stance toward C, while executing (full facing) a high front thrust to C with the left flat fingertip. Perform this move in a slow motion – sliding the left foot.'),
(358, 2, 1015, 31, 'Move the right foot to C in a stamping motion to form a right walking stance toward C, while executing (full facing) a high vertical punch to C with a twin forefist. Perform this move in a stamping motion.'),
(359, 2, 1015, 32, 'While pivoting on the ball of the right foot, move the left foot to A in a stamping motion to form a left walking stance toward A, while executing (full facing) an upset punch to A with a twin forefist. Perform this move in a stamping motion.'),
(360, 2, 1015, 33, 'Execute a middle front snap kick to A with the ball of the right foot, keeping the position of the hands as they were in move 32 above (an upset punch with a twin forefist).'),
(361, 2, 1015, 34, 'Lower the ball of the right foot to the side front of the left foot. Then, pivoting on the ball of the right foot and turning clockwise, move the left foot to A to form a left L-stance toward B, while executing (half facing) a middle knife-hand guarding block to B.'),
(362, 2, 1015, 35, 'Move the left foot to B to form a left walking stance toward B, while executing a high front punch (full facing) to B with the left forefist.'),
(363, 2, 1015, 36, 'Move the right foot to B in stamping motion to form a right walking stance toward B, while executing (full facing) an upset punch to B with a twin forefist. Perform this move in a stamping motion.'),
(364, 2, 1015, 37, 'Execute a middle front snap kick to B with the ball of the left foot, keeping the position of the hands as they were in move 36 above (an upset punch with a twin forefist).'),
(365, 2, 1015, 38, 'Lower the ball of the left foot to the side front of the right foot. Then, pivoting on the ball of the left foot and turning counterclockwise, move the right foot to B to form a right L-stance toward A, while executing (half facing) a middle knife-hand guarding block to A.'),
(366, 2, 1015, 39, 'Move the right foot to A to form a right walking stance toward A, while executing (full facing) a high front punch to A with the right forefist.'),
(367, 2, 1015, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot back onto the AB line to form a parallel stance with a heaven hand toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(368, 2, 1016, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Stance with a Heaven Hand toward D. Remain in this parallel stance with a heaven hand toward D until given the command to begin the pattern.'),
(369, 2, 1016, 1, 'Move the left foot to B to form a right L-stance toward B, while executing (half facing) a middle outer forearm guarding block to B.'),
(370, 2, 1016, 2, 'Turning the face toward A, pull the right foot to the left knee joint to form a left one-leg stance (side facing) toward D, while lifting (side facing) both fists upward to B, with the right side fist in front of the left shoulder.'),
(371, 2, 1016, 3, 'Execute a pressing kick to A with the right footsword, keeping the position of the hands as they were in move 2 above (both fists pulled upward to B, with the right side fist in front of the left shoulder).'),
(372, 2, 1016, 4, 'Lower the right foot to A to form a sitting stance toward D, while executing (side facing) a middle side strike to A with the right knife-hand.'),
(373, 2, 1016, 5, 'While maintaining a sitting stance toward D, execute (full facing) an angle punch with the left forefist.'),
(374, 2, 1016, 6, 'While maintaining a sitting stance toward D, execute (full facing) a pressing block to D with the left forefist and a high side front block to D with the right inner forearm. Perform moves 6 through 12 in a continuous motion.'),
(375, 2, 1016, 7, 'While maintaining a sitting stance toward D, execute (full facing) a pressing block to D with the right forefist and a high side front block to D with the left inner forearm.'),
(376, 2, 1016, 8, 'While maintaining a sitting stance toward D, execute (full facing) a middle wedging block to D with the inner forearm.'),
(377, 2, 1016, 9, 'While maintaining a sitting stance toward D, thrust (full facing) to C with the right back elbow, supporting the right forefist with the left finger belly and keeping the face as it was in move 8 above (looking toward D).'),
(378, 2, 1016, 10, 'While maintaining a sitting stance toward D, execute (full facing) a middle front punch to D with the right forefist, slipping the left finger belly up to the right elbow joint.'),
(379, 2, 1016, 11, 'While maintaining a sitting stance toward D, thrust (full facing) to C with the left back elbow, supporting the left forefist with right finger belly and keeping the face as it was in move10 above (looking toward D).'),
(380, 2, 1016, 12, 'While maintaining a sitting stance toward D, execute (side facing) a right horizontal punch to A with the forefists.'),
(381, 2, 1016, 13, 'Cross the left foot over the right foot to form a right X-stance toward D, while executing (full facing) a low front block to D with the right outer forearm, bringing the left finger belly on the right under forearm.'),
(382, 2, 1016, 14, 'Move the right foot to A to form a left L-stance toward A, while executing (half facing) a U-shape grasp to A.'),
(383, 2, 1016, 15, 'Bring the left foot to the side of the right foot to form a close stance toward D, while executing (full facing) a horizontal thrust with a twin elbow, at the same time turning the face toward B. Perform this move in a slow motion.'),
(384, 2, 1016, 16, 'Move the left foot to B to form a sitting stance toward D, while executing (full facing) a side back strike to C with the right backfist, extending the left arm to the side downward.'),
(385, 2, 1016, 17, 'Cross the right foot over the left foot to form a left X-stance toward D, while executing (full facing) a low front block to D with the left outer forearm, bringing the right finger belly to the left side fist.'),
(386, 2, 1016, 18, 'Move the left foot to B to form a sitting stance toward D, while executing (side facing) a low reverse knife-hand guarding block to B.'),
(387, 2, 1016, 19, 'While pivoting on the ball of the left foot, move the right foot to A to form a left L-stance toward A, while executing (half facing) a middle outer forearm guarding block to A.'),
(388, 2, 1016, 20, 'Turning the face toward B, pull the left foot to the right knee joint to form a right one-leg stance toward D, while lifting (side facing) both fists upward to A, with the left side fist in front of the right shoulder.'),
(389, 2, 1016, 21, 'Execute a pressing kick to B with the left footsword, keeping the position of the hands as they were in move 20 above (both fists pulled upward to A, with the left side fist in front of the right shoulder).'),
(390, 2, 1016, 22, 'Lower the left foot to B to form a sitting stance toward D, while executing (side facing) a middle side strike to B with the left knife-hand.'),
(391, 2, 1016, 23, 'While maintaining a sitting stance toward D, execute (full facing) an angle punch with the right forefist.'),
(392, 2, 1016, 24, 'While maintaining a sitting stance toward D, execute (full facing) a pressing block to D with the right forefist and a high side front block to D with the left inner forearm. Perform moves 24 through 30 in a continuous motion.'),
(393, 2, 1016, 25, 'While maintaining a sitting stance toward D, execute (full facing) a pressing block to D with the left forefist and a high side front block to D with the right inner forearm.'),
(394, 2, 1016, 26, 'While maintaining a sitting stance toward D, execute (full facing) a middle wedging block to D with the inner forearm.'),
(395, 2, 1016, 27, 'While maintaining a sitting stance toward D, thrust (full facing) to C with the left back elbow, supporting the left forefist with the right finger belly and keeping the face as it was in move 26 above (looking toward D).'),
(396, 2, 1016, 28, 'While maintaining a sitting stance toward D, execute (full facing) a middle front punch to D with the left forefist, slipping the right finger belly up to the left elbow joint.'),
(397, 2, 1016, 29, 'While maintaining a sitting stance toward D, thrust (full facing) to C with the right back elbow, supporting the right forefist with left finger belly and keeping the face as it was in move 28 above (looking toward D).'),
(398, 2, 1016, 30, 'While maintaining a sitting stance toward D, execute (side facing) a left horizontal punch to B with the forefists.'),
(399, 2, 1016, 31, 'Cross the right foot over the left foot to form a left X-stance toward D, while executing (full facing) a low front block to D with the left outer forearm, bringing the right finger belly on the left under forearm.'),
(400, 2, 1016, 32, 'Move the left foot to B to form a right L-stance toward B, while executing (half facing) a U-shape grasp to B.'),
(401, 2, 1016, 33, 'Bring the right foot to the side of the left foot to form a close stance toward D, while executing (full facing) a horizontal thrust with a twin elbow, at the same time turning the face toward A. Perform this move in a slow motion.'),
(402, 2, 1016, 34, 'Move the right foot to A to form a sitting stance toward D, while executing (full facing) a side back strike to C with the left backfist, extending the right arm to the side downward.'),
(403, 2, 1016, 35, 'Cross the left foot over the right foot to form a right X-stance toward D, while executing (full facing) a low front block with the right outer forearm, bringing the left finger belly to the right side fist.'),
(404, 2, 1016, 36, 'Move the right foot to A to form a sitting stance toward D, while executing (side facing) a low reverse knife-hand guarding block to A.'),
(405, 2, 1016, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot toward the right foot to form a parallel stance with a heaven hand toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(406, 2, 1017, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Ready Stance toward D. Remain in this parallel ready stance toward D until given the command to begin the pattern.'),
(407, 2, 1017, 1, 'Move the right foot to C to form a right L-stance toward D, while executing (half facing) a checking block to D with an X-knife-hand.'),
(408, 2, 1017, 2, 'Execute a low twisting kick to D with the ball of the right foot, keeping the position of the hands as they were in move 1 above (a checking block with an X-knife-hand).'),
(409, 2, 1017, 3, 'Lower the right foot to D to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist. Perform moves 3 and 4 in a fast motion.'),
(410, 2, 1017, 4, 'While maintaining a right walking stance toward D, execute (full facing) a middle front punch to D with the left forefist.'),
(411, 2, 1017, 5, 'Move the right foot to C to form a left walking stance toward D, while executing (full facing) a rising block to D with the left outer forearm. Perform moves 5 and 6 in a continuous motion.'),
(412, 2, 1017, 6, 'While maintaining a left walking stance toward D, execute (half facing) a low block to D with the left outer forearm.'),
(413, 2, 1017, 7, 'While maintaining a left walking stance toward D, execute (reverse half facing) a high block to AD with a double arc-hand, looking through the space between the hands.'),
(414, 2, 1017, 8, 'Form a right bending ready stance type A (half facing) toward D, while turning the face toward D.'),
(415, 2, 1017, 9, 'Lower the left foot to AD to form a sitting stance toward AC, while executing (full facing) a scooping block to AC with the left palm. Perform moves 9 and 10 in a connecting motion.'),
(416, 2, 1017, 10, 'While maintaining a sitting stance toward AC, execute (full facing) a middle front punch to AC with the right forefist.'),
(417, 2, 1017, 11, 'While maintaining a sitting stance toward AC, execute (full facing) a high front strike to AC with the left backfist, pulling the right backfist under the left elbow.'),
(418, 2, 1017, 12, 'Move the right foot onto the AB line, and then move the left foot to C to form a right L-stance toward C, while executing (half facing) a middle knife-hand guarding block to C.'),
(419, 2, 1017, 13, 'Execute a low side front snap kick to C with the ball of the left foot, keeping the position of the hands as they were in move 12 above a middle knife-hand guarding block position).'),
(420, 2, 1017, 14, 'Lower the left foot to C to form a left low stance toward C, while executing (full facing) a high front thrust to C with the left flat fingertip.'),
(421, 2, 1017, 15, 'While maintaining a left low stance toward C, execute (full facing) a high front thrust to C with the right flat fingertip.'),
(422, 2, 1017, 16, 'While pivoting on the ball of the left foot and turning counterclockwise, execute a middle side piercing kick to C with the right footsword. At the same time, pull both hands in the opposite direction to the front of the left chest, with the right side fist on the left under fist.'),
(423, 2, 1017, 17, 'Lower the right foot to C to form a right L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D.'),
(424, 2, 1017, 18, 'While pivoting on the ball of the left foot and turning counterclockwise, move the right foot to D to form a right L-stance toward C, while executing (half facing) a middle outer forearm guarding block to C.'),
(425, 2, 1017, 19, 'While pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(426, 2, 1017, 20, 'Move the left foot on the CD line to form a sitting stance toward A, while executing (full facing) a right 9-shape block.'),
(427, 2, 1017, 21, 'While pivoting on the ball of the left foot and turning counterclockwise, move the right foot to D to form a left walking stance toward C, while executing (half facing) a low block to C with the left knife-hand.'),
(428, 2, 1017, 22, 'Execute a middle turning kick to BC with the ball of the right foot, while holding both side fists up and toward BC. Then, lower the ball of the right foot to C. Perform moves 22 and 23 in a fast motion.'),
(429, 2, 1017, 23, 'Execute a mid-air flying side piercing kick to C with the right footsword, forming a forearm guarding block with the fists toward C at shoulder level. Perform this move in a jumping motion.'),
(430, 2, 1017, 24, 'Land on the left foot, and then move the right foot to C to form a right walking stance toward C, while executing (full facing) a high vertical punch to C with a twin forefist.'),
(431, 2, 1017, 25, 'While maintaining a right walking stance toward C, execute (reverse half facing) a high block to AC with a double arc-hand, looking through the space between the hands.'),
(432, 2, 1017, 26, 'While maintaining a right walking stance toward C, execute (full facing) an upset punch to C with the left forefist.'),
(433, 2, 1017, 27, 'Prior to moving the body, move the ball of the right foot on the CD line (half a shoulder width toward A and half a shoulder width toward D). Then, pivoting on the ball of the right foot and turning counterclockwise, move the left foot to C to form a left walking stance toward D, while executing (full facing) a front strike to D with the right elbow, striking the left palm and finger belly with the right elbow. Perform this move in a spot-turning motion - method one.'),
(434, 2, 1017, 28, 'Jump to D, landing to form a right X-stance toward BD, while executing (half facing) a high block to D with the right double forearm. Perform this move in jumping motion.'),
(435, 2, 1017, 29, 'Move the left foot to BC to form a sitting stance toward BD, while executing (full facing) a scooping block to BD with the right palm. Perform moves 29 and 30 in a connecting motion.'),
(436, 2, 1017, 30, 'While maintaining a sitting stance toward BD, execute (full facing) a middle front punch to BD with the left forefist.'),
(437, 2, 1017, 31, 'While maintaining a sitting stance toward BD, execute (full facing) a high front strike to BD with the right backfist, pulling the left backfist under the right elbow.'),
(438, 2, 1017, 32, 'While pivoting on the ball of the right foot and turning counterclockwise, move the left foot to C to form a left walking stance toward C, while executing (full facing) a high front strike to C with the right reverse knife-hand.'),
(439, 2, 1017, 33, 'Move the left foot toward A in a jumping motion (about half a shoulder width). Land with the left foot on the AB line pointing toward A, while executing a middle turning kick to C with the ball of the right foot, forming a forearm guarding block with the fists toward BC at shoulder level. Perform this move in a jumping motion.'),
(440, 2, 1017, 34, 'Lower the ball of the right foot to C at the side rear of the left foot. Then, pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a left walking stance toward D, while executing (full facing) a high vertical punch to D with a twin forefist.'),
(441, 2, 1017, 35, 'Pull the left foot toward the right foot to form a right L-stance toward D, while executing (half facing) an upset punch to D with the right middle knuckle fist, pulling the left side fist in front of the right shoulder.'),
(442, 2, 1017, 36, 'Move the right foot to D to form a sitting stance toward B, while executing (full facing) a left 9-shape block.'),
(443, 2, 1017, 37, 'While maintaining a sitting stance toward B, execute (side facing) a low reverse knife-hand guarding block to C. Perform moves 37 and 38 in a continuous motion.'),
(444, 2, 1017, 38, 'While maintaining a sitting stance toward B, execute (side facing) a low knife-hand guarding block to C.'),
(445, 2, 1017, 39, 'While pivoting on the ball of the right foot and turning clockwise, move the left foot to D in a stamping motion to form a sitting stance toward A, while executing (side facing) a W-shape block with the left outer forearm. Perform this move in stamping motion.'),
(446, 2, 1017, 40, 'While pivoting on the ball of the right foot and turning clockwise, move the left foot to C in a stamping motion to form a sitting stance toward B, while executing (side facing) a W-shape block with the left outer forearm. Perform this move in stamping motion.'),
(447, 2, 1017, 41, 'Move the right foot to C to form a right walking stance toward C, while executing (full facing) a rising block with the right outer forearm.'),
(448, 2, 1017, 42, 'While maintaining a right walking stance toward C, execute (full facing) a middle front punch to C with the left forefist.'),
(449, 2, 1017, 43, 'Move the right foot on the CD line (half a shoulder width toward A and half a shoulder width toward D). Then, pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a left walking stance toward D, while executing (full facing) a rising block with the left outer forearm. Perform this move in a spot-turning motion - method one.'),
(450, 2, 1017, 44, 'While maintaining a left walking stance toward D, execute (full facing) a middle front punch to D with the right forefist.'),
(451, 2, 1017, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot forward onto the AB line to form a parallel ready stance toward D. Remain in this stance until given the at-ease command (swi-eot).'),


(452, 5, 1000, 0, 'Parallel ready stance toward D.'),
(453, 5, 1000, 1, 'Right Walking stance middle punch toward D.'),
(454, 5, 1000, 2, 'Move the right foot to A, Forming a left walking stance toward B while executing a low block to B with the left forearm.'),
(455, 5, 1000, 3, 'Move the right foot to B, forming a right walking stance toward B while executing a middle punch to B with the right fist.'),
(456, 5, 1000, 4, 'Move the right foot to D, forming a left walking stance toward C while executing a low block to C with the left forearm.'),
(457, 5, 1000, 5, 'Move the right foot to C, forming a right walking stance toward C while executing a middle punch to C with the Right fist.'),
(458, 5, 1000, 6, 'Move the right foot to B, forming a left walking stance toward A while executing a low block to A with the left forearm.'),
(459, 5, 1000, 7, 'Move the right foot to A, forming a right walking stance toward A while executing a middle punch to A with the right fist.'),
(460, 5, 1000, 999, 'END: Bring the right foot back to a ready posture.'),
(461, 5, 1001, 0, 'Parallel ready stance toward D.'),
(462, 5, 1001, 1, 'Move the left foot to D, forming a left walking stance toward D while executing a middle punch to D with the left fist.'),
(463, 5, 1001, 2, 'Move the left foot to B, forming a right walking stance toward A while executing a low block to A with the right forearm.'),
(464, 5, 1001, 3, 'Move the left foot to A, forming a left walking stance toward A while executing a middle punch to A with the left fist.'),
(465, 5, 1001, 4, 'Move the left foot to D, forming a right walking stance toward C while executing a low block to C with the right forearm.'),
(466, 5, 1001, 5, 'Move the left foot to C, forming a left walking stance toward C while executing a middle punch to C with the left fist.'),
(467, 5, 1001, 6, 'Move the left foot to A, forming a right walking stance toward B while executing a low block to B with the right forearm.'),
(468, 5, 1001, 7, 'Move the left foot to B, forming a left walking stance toward B while executing a middle punch to B with the left fist.'),
(469, 5, 1001, 999, 'END: Bring the left foot back to ready posture.'),
(470, 5, 1002, 0, 'Parallel ready stance toward D.'),
(471, 5, 1002, 1, 'Move the right foot to C, forming a left walking stance toward D while executing a low block to D with the left knife-hand.'),
(472, 5, 1002, 2, 'Move the right foot to D, forming a right walking stance toward D while executing a middle side block to D with the right inner forearm.'),
(473, 5, 1002, 3, 'Move the right foot to A, forming a left walking stance toward B while executing a low block to B with the left knife-hand.'),
(474, 5, 1002, 4, 'Move the right foot to B, forming a right walking stance toward B while executing a middle side block to B with the right inner forearm.'),
(475, 5, 1002, 5, 'Move the right foot to D, forming a left walking stance toward C while executing a low block to C with the left knife-hand.'),
(476, 5, 1002, 6, 'Move the right foot to C, forming a right walking stance toward C, at the same time executing a middle side block to C with the right inner forearm.'),
(477, 5, 1002, 7, 'Move the right foot to B, forming a left walking stance toward A while executing a low block to A with the left knife-hand.'),
(478, 5, 1002, 8, 'Move the right foot to A, forming a right walking stance toward A while executing a middle side block to A with the right inner forearm.'),
(479, 5, 1002, 999, 'END: Bring the right foot back to a ready posture.'),
(480, 5, 1003, 0, 'Parallel ready stance toward D.'),
(481, 5, 1003, 1, 'Move the left foot to C, forming a right walking stance toward D while executing a low block to D with the right knife hand.'),
(482, 5, 1003, 2, 'Move the left foot to D, forming a left walking stance toward D while executing a middle side block to D with the left inner forearm.');
INSERT INTO `EncyclopediaCount` (`ID`, `EncyclopediaID`, `PatternID`, `Count`, `Text`) VALUES
(483, 5, 1003, 3, 'Move the left foot to B, forming a right walking stance toward A while executing a low block to A with the right knife-hand.'),
(484, 5, 1003, 4, 'Move the left foot to A, forming a left walking stance toward A while executing a middle side block to A with the left inner forearm.'),
(485, 5, 1003, 5, 'Move the left foot to D, forming a right walking stance toward C while executing a low block to C with the right knife-hand.'),
(486, 5, 1003, 6, 'Move the left foot to C, forming a left walking stance toward C, at the same time executing a middle side block to C with the left inner forearm.'),
(487, 5, 1003, 7, 'Move the left foot to A, forming a right walking stance toward B while executing a low block to B with the right knife-hand.'),
(488, 5, 1003, 8, 'Move the left foot to B, forming a left walking stance toward B while executing a middle side block to B with the left inner forearm.'),
(489, 5, 1003, 999, 'END: Bring the left foot back to ready posture'),
(490, 5, 1004, 0, 'Parallel ready stance toward D.'),
(491, 5, 1004, 1, 'Move the left foot to B, forming a left walking stance toward B while executing a low block to B with the left forearm.'),
(492, 5, 1004, 2, 'Move the right foot to B, forming a right walking stance toward B while executing a middle punch to B with the right fist.'),
(493, 5, 1004, 3, 'Move the right foot to A, turning clockwise to form a right walking stance toward A while executing a low block to A with the right forearm.'),
(494, 5, 1004, 4, 'Move the left foot to A, forming a left walking stance toward A while executing a middle punch to A with the left fist.'),
(495, 5, 1004, 5, 'Move the left foot to D, forming a left walking stance toward D while executing a low block to D with the left forearm.'),
(496, 5, 1004, 6, 'Move the right foot to D, forming a right walking stance toward D while executing a middle punch to D with the right fist.'),
(497, 5, 1004, 7, 'Move the right foot to C, turning clockwise to form a right walking stance toward C while executing a low block to C with the right forearm.'),
(498, 5, 1004, 8, 'Move the left foot to C, forming a left walking stance toward C while executing a middle punch to C with the left fist.'),
(499, 5, 1004, 9, 'Move the left foot to A, forming a right L-stance toward A while executing a middle block to A with the left inner forearm.'),
(500, 5, 1004, 10, 'Move the right foot to A, forming a right walking stance toward A while executing a middle punch to A with the right fist.'),
(501, 5, 1004, 11, 'Move the right foot to B, turning clockwise to form a left L-stance toward B while executing a middle block to B with the right inner forearm.'),
(502, 5, 1004, 12, 'Move the left foot to B, forming a left walking stance toward B while executing a middle punch to B with the left fist.'),
(503, 5, 1004, 13, 'Move the left foot to C, forming a right L-stance toward C while executing a middle block to C with the left inner forearm.'),
(504, 5, 1004, 14, 'Move the right foot to C, forming a right walking stance toward C while executing a middle punch to C with the right fist.'),
(505, 5, 1004, 15, 'Move the right foot to D, turning clockwise to form a left L-stance toward D while executing a middle block with the right inner forearm.'),
(506, 5, 1004, 16, 'Move the left foot to D, forming a left walking stance toward D while executing a middle punch to D with the left fist.'),
(507, 5, 1004, 17, 'Move the right foot to D, forming a right walking stance toward D while executing a middle punch to D with the right fist.'),
(508, 5, 1004, 18, 'Move the right foot to C, forming a left walking stance toward D while executing a middle punch to D with the left fist.'),
(509, 5, 1004, 19, 'Move the left foot to C, forming a right walking stance toward D while executing a middle punch to D with the right fist.'),
(510, 5, 1004, 999, 'END: Bring the left foot back to a ready posture.'),
(511, 5, 1005, 0, 'Parallel ready stance toward D.'),
(512, 5, 1005, 1, 'Move the left foot to B, forming a right L-stance toward B, at the same time executing a middle-guarding block to B with a knife-hand.'),
(513, 5, 1005, 2, 'Move the right foot to B, forming a right walking stance toward B while executing a high punch to B with the right fist.'),
(514, 5, 1005, 3, 'Move the right foot to A, turning clockwise to form a left L-stance toward A, at the same time executing a middle guarding block to A with a knife-hand.'),
(515, 5, 1005, 4, 'Move the left foot to A, forming a left walking stance toward A while executing a high punch to A with the left fist.'),
(516, 5, 1005, 5, 'Move the left foot to D, forming a left walking stance toward D while executing a low block to D with the left forearm.'),
(517, 5, 1005, 6, 'Move the right foot to D, forming a right walking stance toward D while executing a high punch to D with the right fist.'),
(518, 5, 1005, 7, 'Move the left foot to D, forming a left walking stance toward D, at the same time executing a high punch to D with the left fist.'),
(519, 5, 1005, 8, 'Move the right foot to D, forming a right walking stance toward D while executing a high punch to D with the right fist.'),
(520, 5, 1005, 9, 'Move the left foot to E, turning counterclockwise to form a right L-stance toward E while executing a twin forearm block to E.'),
(521, 5, 1005, 10, 'Move the right foot to E, forming a right walking stance toward E while executing a high punch to E with the right fist.'),
(522, 5, 1005, 11, 'Move the right foot to F, turning clockwise to form a left L-stance toward F while executing a twin forearm block.'),
(523, 5, 1005, 12, 'Move the left foot to F, forming a left walking stance toward F, at the same time executing a high punch to F with the left fist.'),
(524, 5, 1005, 13, 'Move the left foot to C, forming a left walking stance toward C while executing a low block to C with the left forearm.'),
(525, 5, 1005, 14, 'Execute a rising block with the left forearm, maintaining the left walking stance toward C. Perform 13 and 14 in a continuous motion.'),
(526, 5, 1005, 15, 'Move the right foot to C, forming a right walking stance toward C, at the same time executing a rising block with the right forearm.'),
(527, 5, 1005, 16, 'Move the left foot to C, forming a left walking stance toward C while executing a rising block with the left forearm.'),
(528, 5, 1005, 17, 'Move the right foot to C, forming a right walking stance toward C, at the same time executing a rising block with the right forearm.'),
(529, 5, 1005, 18, 'Move the left foot to B, turning counterclockwise to form a right L-stance toward B while executing a middle strike to B with the left knife-hand.'),
(530, 5, 1005, 19, 'Move the right foot to B, forming a right walking stance toward B while executing a high punch to B with the right fist.'),
(531, 5, 1005, 20, 'Move the right foot to A, turning clockwise to form a left L-stance toward A while executing a middle strike to A with the right knife hand.'),
(532, 5, 1005, 21, 'Move the left foot to A, forming a left walking stance toward A, at the same time executing a high punch to A with the left fist.'),
(533, 5, 1005, 999, 'END: Bring the left foot back to a ready posture.'),
(534, 5, 1006, 0, 'Parallel ready stance toward D.'),
(535, 5, 1006, 1, 'Move the left foot to B, forming a left walking stance toward B while executing a high side block to B with the left outer forearm.'),
(536, 5, 1006, 2, 'Execute a middle punch to B with the right fist while maintaining a left walking stance toward B.'),
(537, 5, 1006, 3, 'Move the left foot on line AB, and then turn clockwise to form a right walking stance toward A while executing a high side block to A with the right outer forearm.'),
(538, 5, 1006, 4, 'Execute a middle punch to A with the left fist while maintaining a right walking stance toward A.'),
(539, 5, 1006, 5, 'Move the left foot to D, forming a right L-stance toward D while executing a middle-guarding block to D with a knife-hand.'),
(540, 5, 1006, 6, 'Move the right foot to D, forming a right walking stance toward D while executing a middle thrust to D with the right straight fingertip.'),
(541, 5, 1006, 7, 'Twist the right knife-hand together with the body counter-clockwise until its palm faces downward and then move the left foot to D, turning counter-clockwise to form a left walking stance toward D while executing a high side strike to D with the left back fist.'),
(542, 5, 1006, 8, 'Move the right foot to D, forming a right walking stance toward D while executing a high side strike to D with the right fist.'),
(543, 5, 1006, 9, 'Move the left foot to E, turning counterclockwise to form a left walking stance toward E while executing a high side block to E with the outer forearm.'),
(544, 5, 1006, 10, 'Execute a middle punch to E with the right fist while maintaining a left walking stance toward E.'),
(545, 5, 1006, 11, 'Move the left foot on line EF, and then turn clockwise to form a right walking stance toward F while executing a high side block to F with the right outer forearm.'),
(546, 5, 1006, 12, 'Execute a middle punch to F with the left fist while maintaining a right walking stance toward F.'),
(547, 5, 1006, 13, 'Move the left foot to CE, forming a left walking stance toward CE, at the same time executing a high wedging block to CE with the outer forearm.'),
(548, 5, 1006, 14, 'Execute a middle front snap kick to CE with the right foot, keeping the position of the hands as they were in 13.'),
(549, 5, 1006, 15, 'Lower the right foot to CE, forming a right walking stance toward CE while executing a middle punch to CE with the right fist.'),
(550, 5, 1006, 16, 'Execute a middle punch to CE with the left fist while maintaining a right walking stance toward CE. Perform 15 and 16 in a fast motion.'),
(551, 5, 1006, 17, 'Move the right foot to CF, forming a right walking stance toward CF while executing a high wedging block to CF with the outer forearm.'),
(552, 5, 1006, 18, 'Execute a middle front snap kick to CF with the left foot, keeping the position of the hands as they were in 17.'),
(553, 5, 1006, 19, 'Lower the left foot to CF, forming a left walking stance toward CF while executing a middle punch to CF with the left fist.'),
(554, 5, 1006, 20, 'Execute a middle punch to CF with the right fist while maintaining a left walking stance toward CF. Perform 19 and 20 in a fast motion.'),
(555, 5, 1006, 21, 'Move the left foot to C, forming a left walking stance toward C, at the same time executing a rising block with the left forearm.'),
(556, 5, 1006, 22, 'Move the right foot to C, forming a right walking stance toward C while executing a rising block with the right forearm.'),
(557, 5, 1006, 23, 'Move the left foot to B, turning counterclockwise to form a sitting stance toward D while executing a middle side strike to B with the left knife-hand.'),
(558, 5, 1006, 24, 'Bring the left foot to the right foot, and then move the right foot to A, forming a sitting stance toward D while executing a middle side strike to A with the right knife-hand.'),
(559, 5, 1006, 999, 'END: Bring the right foot back to a ready posture.'),
(560, 5, 1007, 0, 'Close ready stance A toward D.'),
(561, 5, 1007, 1, 'Move the left foot to B, forming a right L-stance toward B while executing a twin forearm block.'),
(562, 5, 1007, 2, 'Execute a high inward strike to B with the right knife-hand while bringing the left side fist in front of the right shoulder.'),
(563, 5, 1007, 3, 'Execute a middle punch to B with the left fist while forming a left fixed stance toward B, slipping the left foot to B.'),
(564, 5, 1007, 4, 'Bring the left foot to the right foot, and then move the right foot to A, forming a left L-stance toward A while executing a twin forearm block.'),
(565, 5, 1007, 5, 'Execute a high inward strike to A with a left knife-hand bringing the right side fist in front of the left shoulder.'),
(566, 5, 1007, 6, 'Execute a middle punch to A with the right fist while forming a right fixed stance toward A, slipping the right foot to A.'),
(567, 5, 1007, 7, 'Bring the right foot to the left foot, and then turn the face toward D while forming a right bending ready stance A toward D.'),
(568, 5, 1007, 8, 'Execute a middle side piercing kick to D with the left foot.'),
(569, 5, 1007, 9, 'Lower the left foot D, forming a right L-stance toward D while executing a middle guarding block to D with a knife-hand.'),
(570, 5, 1007, 10, 'Move the right foot to D, forming a left L-stance toward D while executing a middle guarding block to D with a knife-hand.'),
(571, 5, 1007, 11, 'Move the left foot to D, forming a right L-stance toward D while executing a middle guarding block to D with a knife-hand.'),
(572, 5, 1007, 12, 'Move the right foot to D, forming a right walking stance toward D while executing a middle thrust to D with the right straight fingertip.'),
(573, 5, 1007, 13, 'Move the left foot to E, turning counter-clockwise to form a right L-stance toward E, at the same time executing a twin forearm block.'),
(574, 5, 1007, 14, 'Execute a high inward strike to e with the right knife-hand, at the same time bringing the left side fist in front of the right shoulder.'),
(575, 5, 1007, 15, 'Execute a middle punch to E with the left fist while forming a left fixed stance toward E, slipping the left foot to E.'),
(576, 5, 1007, 16, 'Bring the left foot to the right foot, and then move the right foot to F, forming a left L-stance toward F while executing a twin forearm block.'),
(577, 5, 1007, 17, 'Execute a high inward strike to F with the left knife-hand while brining the right side fist in front of the left shoulder.'),
(578, 5, 1007, 18, 'Execute a middle punch to F with the right fist while forming a right fixed stance toward F, slipping the right foot to F.'),
(579, 5, 1007, 19, 'Bring the right foot to the left foot, and then move the left foot to C, forming a left walking stance toward C while executing a circular block to CF with the right inner forearm.'),
(580, 5, 1007, 20, 'Execute a low front snap kick to C with the right foot, keeping the position of the hands as they were in 19.'),
(581, 5, 1007, 21, 'Lower the right foot to C, forming a right walking stance toward C while executing a middle punch to C with the left fist.'),
(582, 5, 1007, 22, 'Execute a circular block to CE with the left inner forearm while maintaining a right walking stance toward C.'),
(583, 5, 1007, 23, 'Execute a low front snap kick to C with the left foot, keeping the position of the hands as they were in 22.'),
(584, 5, 1007, 24, 'Lower the left foot to C, forming a left walking stance toward C while executing a middle punch to C with the right fist.'),
(585, 5, 1007, 25, 'Turn the face toward C, forming a left bending ready stance A toward C.'),
(586, 5, 1007, 26, 'Execute a middle side piercing kick to C with the right foot.'),
(587, 5, 1007, 27, 'Lower the right foot on line CD, and then move the left foot to B, turning counter-clockwise to form a right L-stance toward B, at the same time executing a middle guarding block with the forearm.'),
(588, 5, 1007, 28, 'Bring the left foot to the right foot, and then move the right foot to A, forming a left L-stance toward A while executing a middle guarding block to A with the forearm.'),
(589, 5, 1007, 999, 'END: Bring the right foot back to a ready posture.'),
(590, 5, 1008, 0, 'Parallel ready stance toward D.'),
(591, 5, 1008, 1, 'Move the left foot to B, forming a sitting stance toward D while extending the left fist to D horizontally.'),
(592, 5, 1008, 2, 'Execute a middle punch to D with the right fist while maintaining a sitting stance toward D.'),
(593, 5, 1008, 3, 'Execute a middle punch to D with the left fist while maintaining a sitting stance toward D. Perform 2 and 3 in a fast motion.'),
(594, 5, 1008, 4, 'Bring the left foot to the right foot, and then move the right foot to A, forming a sitting stance toward D while extending the right fist to D horizontally.'),
(595, 5, 1008, 5, 'Execute a middle punch to D with the left fist while maintaining a sitting stance toward D.'),
(596, 5, 1008, 6, 'Execute a middle punch to D with the right fist while maintaining a sitting stance toward D. Perform 5 and 6 in a fast motion.'),
(597, 5, 1008, 7, 'Move the right foot to AD, forming a right waling stance toward AD while executing a high side block to AD with the right inner forearm.'),
(598, 5, 1008, 8, 'Execute a low front snap kick to AD with the left foot, keeping the position of the hands as they were in 7.'),
(599, 5, 1008, 9, 'Lower the left foot to AD, forming a left walking stance toward AD while executing a middle punch to AD with the left fist.'),
(600, 5, 1008, 10, 'Execute a middle punch to AD with the right fist while maintaining a left walking stance toward AD. Perform 9 and 10 in a fast motion.'),
(601, 5, 1008, 11, 'Move the left foot to BD, forming a left walking stance toward BD, at the same time executing a high side block to BD with the left inner forearm.'),
(602, 5, 1008, 12, 'Execute a low front snap kick to BD with the right foot, keeping the position of the hands as they were in 11.'),
(603, 5, 1008, 13, 'Lower the right foot to BD, forming a right walking stance toward BD, while executing a middle punch to BD with the right fist.'),
(604, 5, 1008, 14, 'Execute a middle punch to DE with the left fist while maintaining a right walking stance toward BD. Perform 13 and 14 in a fast motion.'),
(605, 5, 1008, 15, 'Execute a high hooking block to D with the right palm while forming a right walking stance toward D, pivoting with the left foot.'),
(606, 5, 1008, 16, 'Execute a high hooking block to D with the left palm while maintaining a right walking stance toward D.'),
(607, 5, 1008, 17, 'Execute a middle punch to D with the right fist while maintaining a right walking stance toward D. Perform 16 and 17 in a connecting motion.'),
(608, 5, 1008, 18, 'Move the left foot to D, forming a left walking stance toward D while executing a high hooking block to D with the left palm.'),
(609, 5, 1008, 19, 'Execute a high hooking block to D with the right palm while maintaining a left walking stance.'),
(610, 5, 1008, 20, 'Execute a middle punch to D with the left fist while maintaining a left walking stance toward D. Perform 19 and 20 in a connecting motion.'),
(611, 5, 1008, 21, 'Move the right foot to D, forming a right walking stance toward D, at the same time executing a middle punch to D with the right fist.'),
(612, 5, 1008, 22, 'Turn the face toward D, forming a right bending ready stance A toward D.'),
(613, 5, 1008, 23, 'Execute a middle side piercing kick to D with the left foot.'),
(614, 5, 1008, 24, 'Lower the left foot to D, forming a left walking stance toward D while striking the left palm with the right front elbow.'),
(615, 5, 1008, 25, 'Turn the face toward C while forming a left bending ready stance A toward C.'),
(616, 5, 1008, 26, 'Execute a middle side piercing kick to C with the right foot.'),
(617, 5, 1008, 27, 'Lower the right foot to C, forming a right walking stance toward C while striking the right palm with the left front elbow.'),
(618, 5, 1008, 28, 'Move the left foot to E, forming a right L-stance toward E while executing a twin knife-hand block.'),
(619, 5, 1008, 29, 'Move the right foot to E, forming a right walking stance toward E while executing a middle thrust to E with the right straight fingertip.'),
(620, 5, 1008, 30, 'Move the right foot to F, turning clockwise to form a left L-stance toward F while executing a twin knife-hand block.'),
(621, 5, 1008, 31, 'Move the left foot to F, forming a left walking stance toward F while executing a middle thrust to F with the left straight fingertip.'),
(622, 5, 1008, 32, 'Move the left foot to C, forming a left walking stance toward C while executing a high side block to C with the left outer forearm.'),
(623, 5, 1008, 33, 'Execute a middle punch to C with the right fist while maintaining a left walking stance toward C.'),
(624, 5, 1008, 34, 'Move the right foot to C, forming a right walking stance toward C while executing a high side block to C with the right outer forearm.'),
(625, 5, 1008, 35, 'Execute a middle punch to C with the left fist while maintaining a right walking stance toward C.'),
(626, 5, 1008, 36, 'Jump to C, forming a left X-stance toward B while executing a high side strike to C with the left back fist.'),
(627, 5, 1008, 37, 'Move the right foot to A, forming a right walking stance toward A, at the same time executing a high block to A with the right double forearm.'),
(628, 5, 1008, 38, 'Bring the right foot to the left foot, and then move the left foot to B, forming a left walking stance toward B while executing a high side block to B with the left double forearm.'),
(629, 5, 1008, 999, 'END. Bring the left foot back to a ready posture.'),
(630, 5, 1009, 0, 'Close ready stance B toward D.'),
(631, 5, 1009, 1, 'Move the left foot to B, forming a right L-stance toward B while executing a middle side block to B with a left reverse knife-hand.'),
(632, 5, 1009, 2, 'Execute a low side front snap kick to B with the left foot, keeping the position of the hands as they were in 1.'),
(633, 5, 1009, 3, 'Lower the left foot to B and then move the right foot to B, forming a left rear foot stance toward B while executing an upward block with a right palm.'),
(634, 5, 1009, 4, 'Move the right foot to A, forming a left L-stance toward A, at the same time executing a middle side block to A with a right reverse knife-hand.'),
(635, 5, 1009, 5, 'Execute a low side front snap kick to A with the right foot, keeping the position of the hands as they were in 4.'),
(636, 5, 1009, 6, 'Lower the right foot to A and then move the left foot to A, forming a right rear foot stance toward A while executing an upward block with the left palm.'),
(637, 5, 1009, 7, 'Move the left foot to D, forming a right L-stance toward D while executing a middle guarding block to D with a knife-hand.'),
(638, 5, 1009, 8, 'Execute a high strike to D with the right upper elbow while forming a left walking stance toward D, slipping the left foot to D.'),
(639, 5, 1009, 9, 'Move the right foot to D, forming a left L-stance toward D, at the same time executing a middle guarding block to D with a knife-hand.'),
(640, 5, 1009, 10, 'Execute a high strike to D with the left upper elbow, at the same time forming a right walking stance toward D, slipping the right foot to D.'),
(641, 5, 1009, 11, 'Move the left foot to D, forming a left walking stance toward D, while executing a high vertical punch to D with a twin fist.'),
(642, 5, 1009, 12, 'Move the right foot to D, forming a right walking stance toward D while executing an upset punch to D with a twin fist.'),
(643, 5, 1009, 13, 'Move the right foot on line CD and then turn counter-clockwise to form a left walking stance toward C while executing a rising block with an X-fist.'),
(644, 5, 1009, 14, 'Move the left foot to E, forming a right L-stance toward E while executing a high side strike to E with the left back fist.'),
(645, 5, 1009, 15, 'Twist the left fist counter-clockwise until the back fist faces downward, at the same time forming a left walking stance toward E, slipping the left foot to E.'),
(646, 5, 1009, 16, 'Execute a high punch to E with the right fist while maintaining a left walking stance toward E. Perform 15 and 16 in a fast motion.'),
(647, 5, 1009, 17, 'Bring the left foot to the right foot and then move the right foot to F, forming a left L-stance toward F while executing a high side strike to F with a right back fist.'),
(648, 5, 1009, 18, 'Twist the right fist counter-clockwise until the back fist faces downward while forming a right walking stance toward F, slipping the right foot to F.'),
(649, 5, 1009, 19, 'Execute a high punch to F with the left fist while maintaining a right walking stance toward F.'),
(650, 5, 1009, 20, 'Bring the right foot to the left foot and then move the left foot to C, forming a left walking stance toward C while executing a high block to C with a left double forearm.'),
(651, 5, 1009, 21, 'Execute a middle punch to C with the left fist while forming a right L-stance toward C, pulling the left foot.'),
(652, 5, 1009, 22, 'Execute a middle side piercing kick to C with the right foot.'),
(653, 5, 1009, 23, 'Lower the right foot to C, forming a right walking stance toward C while executing a high side block to C with the right double forearm.'),
(654, 5, 1009, 24, 'Execute a middle punch to C with the right fist while forming a left L-stance toward C, pulling the right foot.'),
(655, 5, 1009, 25, 'Execute a middle side piercing kick to C with the left foot.'),
(656, 5, 1009, 26, 'Lower the left foot to C, forming a right L-stance toward C while executing a middle guarding block to C with the forearm.'),
(657, 5, 1009, 27, 'Execute a pressing block to C with the right palm while forming a left low stance toward C, slipping the left foot.'),
(658, 5, 1009, 28, 'Move the right foot to C, forming a left L-stance toward C while executing a middle guarding block to C with the forearm.'),
(659, 5, 1009, 29, 'Execute a pressing block to C with the left palm while forming a right low stance toward C, slipping the right foot.'),
(660, 5, 1009, 30, 'Bring the left foot to the right foot, forming a close stance toward A while executing an angle punch with the right fist.'),
(661, 5, 1009, 31, 'Move the right to A, forming a right fixed stance toward A while executing a U shape block to A.'),
(662, 5, 1009, 32, 'Bring the right foot to the left foot and then move the left foot to B, forming a left fixed stance toward B, at the same time executing a U-shape block to B.'),
(663, 5, 1009, 999, 'END: Bring the left foot back to ready posture.'),
(664, 5, 1010, 0, 'Close ready stance B toward D.'),
(665, 5, 1010, 1, 'Move the left foot to B, forming a right L-stance toward B while executing a middle side block to B with the left inner forearm.'),
(666, 5, 1010, 2, 'Execute a low thrust to B with the right upset fingertip while forming a left walking stance toward B, slipping the left foot to B.'),
(667, 5, 1010, 3, 'Bring the left foot to the right foot to form a close stance toward D while executing a side back strike to C with the right back fist, extending the left arm to the side downward. Perform in a slow motion.'),
(668, 5, 1010, 4, 'Move the right foot to A, forming a left L-stance toward A while executing a middle side block to A with the right inner forearm.'),
(669, 5, 1010, 5, 'Execute a low thrust to A with the left upset fingertip while forming a right walking stance toward A, slipping the right foot to A.'),
(670, 5, 1010, 6, 'Bring the right foot to the left foot to form a close stance toward D while executing a side back strike to C with the left back fist, extending the right arm to the side-downward. Perform in a slow motion.'),
(671, 5, 1010, 7, 'Move the left foot to D, forming a left walking stance toward D while executing a pressing block with an X-fist.'),
(672, 5, 1010, 8, 'Execute a high vertical punch to D with a twin fist while maintaining a left walking stance toward D.'),
(673, 5, 1010, 9, 'Execute a middle front snap kick to D with the right foot, keeping the position of the hands as they were in 8.'),
(674, 5, 1010, 10, 'Lower the right foot to D, forming a right walking stance toward D while executing middle punch to D with the right fist.'),
(675, 5, 1010, 11, 'Execute a middle punch to D with the left fist while maintaining a right walking stance toward D.'),
(676, 5, 1010, 12, 'Bring the left foot to the right foot, forming a close stance toward F while bringing both fists to the hips simultaneously. Perform in a slow motion.'),
(677, 5, 1010, 13, 'Move the right foot to F in a stamping motion, forming a sitting stance toward C while executing a W-shape block to C with the right outer forearm.'),
(678, 5, 1010, 14, 'Move the left foot to F in a stamping motion, turning clockwise to form a sitting stance toward D while executing a W-shape block to D with the left outer forearm.'),
(679, 5, 1010, 15, 'Move the left foot to E in a stamping motion, turning clockwise to form a sitting stance toward C, at the same time executing a W-shape block to C with the left outer forearm.'),
(680, 5, 1010, 16, 'Move the right foot to E in a stamping motion, turning counter-clockwise to form a sitting stance toward D while executing a W-shape block to D with the right outer forearm.'),
(681, 5, 1010, 17, 'Move the left foot to E in a stamping motion, turning clockwise to form a sitting stance toward C, at the same time executing a W-shape block to C with the left outer forearm.'),
(682, 5, 1010, 18, 'Move the left foot to F in a stamping motion, turning clockwise to form a sitting stance toward D while executing a W-shape block to D with the left outer forearm.'),
(683, 5, 1010, 19, 'Bring the right foot to the left foot and then move the left foot to D, forming a right L-stance toward D while executing a low pushing block to D with the left double forearm.'),
(684, 5, 1010, 20, 'Extend both hands upwards as if to grab the opponent''s head while forming a left walking stance toward D, slipping the left foot to D.'),
(685, 5, 1010, 21, 'Execute an upward kick with the right knee while pulling both hands downward.'),
(686, 5, 1010, 22, 'Lower the right foot to the left foot and then move the left foot to C, forming a right L-stance toward C while executing a middle guarding block to C with a knife-hand.'),
(687, 5, 1010, 23, 'Execute a low side front snap kick to C with the left foot, keeping the position of the hands as they were in 22.'),
(688, 5, 1010, 24, 'Lower the left foot to C, forming a left walking stance toward C while executing a high thrust to C with the left flat fingertip.'),
(689, 5, 1010, 25, 'Move the right foot to C, forming a left L-stance toward C while executing a middle-guarding block to C with a knife-hand.'),
(690, 5, 1010, 26, 'Execute a low side front snap kick to C with the right foot, keeping the position of the hands as they were in 25.'),
(691, 5, 1010, 27, 'Lower the right foot to C, forming a right walking stance toward C, at the same time executing a high thrust to C with the right flat fingertip.'),
(692, 5, 1010, 28, 'Move the right foot to D, forming a right L-stance toward C while executing a high strike to D with the right back fist and a low block to C with the left forearm.'),
(693, 5, 1010, 29, 'Jump to C, forming a right X-stance toward A while executing a pressing block to A with an X-fist.'),
(694, 5, 1010, 30, 'Move the right foot to C, forming a right walking stance toward C while executing a high block to C with the right double forearm.'),
(695, 5, 1010, 31, 'Move the left foot to B, forming a right L-stance toward B while executing a low guarding block to B with the knife-hand.'),
(696, 5, 1010, 32, 'Execute a circular block to BD with the right inner forearm while forming a left walking stance toward B, slipping the left foot to B.'),
(697, 5, 1010, 33, 'Bring the left foot to the right foot and then move the right foot to A, forming a left L-stance toward A, at the same time executing a low guarding block to A with a knife-hand.'),
(698, 5, 1010, 34, 'Execute a circular block to AD with the left inner forearm while forming a right walking stance toward A, slipping the right foot to A.'),
(699, 5, 1010, 35, 'Execute a circular block to CE with the right inner forearm while forming a left walking stance toward CE.'),
(700, 5, 1010, 36, 'Execute a circular block to CE with the left inner forearm while forming a right walking stance toward A.'),
(701, 5, 1010, 37, 'Move the right foot on line AB to form a sitting stance toward D while executing a middle punch to D with the right fist.'),
(702, 5, 1010, 999, 'END: Bring the right foot back to ready posture.'),
(703, 5, 1011, 0, 'Close ready stance C toward D.'),
(704, 5, 1011, 1, 'Slide to D, forming a right L-Stance towards C while thrusting to D with the right side elbow.'),
(705, 5, 1011, 2, 'Slide to B, forming a right L-stance toward A while thrusting to B with the right side elbow.'),
(706, 5, 1011, 3, 'Slide to C, forming a right L-stance toward D while thrusting to C with the right side elbow.'),
(707, 5, 1011, 4, 'Slide to A, forming a right L-stance toward B while thrusting to A with the right side elbow.'),
(708, 5, 1011, 999, 'END. Bring the right foot back to a ready posture.'),
(709, 5, 1012, 0, 'Close ready stance C toward D.'),
(710, 5, 1012, 1, 'Slide to D, forming a left L-Stance towards C while thrusting to D with the left side elbow.'),
(711, 5, 1012, 2, 'Slide to B, forming a left L-stance toward A while thrusting to B with the left side elbow.'),
(712, 5, 1012, 3, 'Slide to C, forming a left L-stance toward D while thrusting to C with the left side elbow.'),
(713, 5, 1012, 4, 'Slide to A, forming a left L-stance toward B while thrusting to A with the left side elbow.'),
(714, 5, 1012, 999, 'END. Bring the left foot back to a ready posture.'),
(715, 5, 1013, 0, 'Close ready stance C toward D.'),
(716, 5, 1013, 1, 'Move the left foot to B to form a sitting stance toward D while executing a middle-pushing block to D with the left palm.'),
(717, 5, 1013, 2, 'Execute a middle punch to D with the right fist while maintaining a sitting stance toward D.'),
(718, 5, 1013, 3, 'Execute a middle punch to D with the left fist while maintaining a sitting stance toward D.'),
(719, 5, 1013, 4, 'Execute a twin forearm block forming a left L-stance toward A, pivoting with the left foot.'),
(720, 5, 1013, 5, 'Execute an upward punch with the left fist while pulling the right side fist in front of the left shoulder.'),
(721, 5, 1013, 6, 'Execute a middle punch to A with the right fist while forming a right fixed stance toward A in a sliding motion.'),
(722, 5, 1013, 7, 'Execute a downward strike to A with the right knife-hand while forming a left vertical stance toward A, pulling the right foot.'),
(723, 5, 1013, 8, 'Move the left foot to A, forming a left walking stance toward A while executing a middle punch to A with the left fist.'),
(724, 5, 1013, 9, 'Move the left foot to D, forming a left walking stance toward D while executing a low block to D with the left forearm.'),
(725, 5, 1013, 10, 'Move the right foot to D, forming a right walking stance toward D while executing a middle punch to D with the right fist.'),
(726, 5, 1013, 11, 'Pull the left foot toward the right foot while bringing the left palm to the right fore fist, at the same time bending the right elbow about 45 degrees outward.'),
(727, 5, 1013, 12, 'Execute a middle side piercing kick to D with the right foot while pulling both hands in the opposite direction, and then lower it to D, forming a left L-stance toward D, at the same time executing a middle side strike to D with the right knife-hand.'),
(728, 5, 1013, 13, 'Move the left foot to D, forming a left walking stance toward D while executing a middle punch to D with the left fist.'),
(729, 5, 1013, 14, 'Move the right foot to D, forming a right walking stance toward D, at the same time executing a middle punch to D with the right fist.'),
(730, 5, 1013, 15, 'Move the left foot to E, turning counter-clockwise to form a right L-stance toward E while executing a middle-guarding block to E with a knife-hand.'),
(731, 5, 1013, 16, 'Move the right foot to E, forming a right walking stance toward E while executing a middle thrust to E with the right straight fingertip.'),
(732, 5, 1013, 17, 'Move the right foot on line EF, forming a right L-stance toward F while executing a middle-guarding block to F with a knife-hand.'),
(733, 5, 1013, 18, 'Execute a high turning kick to DF with the right foot and then lower it to F.'),
(734, 5, 1013, 19, 'Execute a high turning kick to CF with the left foot and then lower it forming a right L-stance toward F while executing a middle-guarding block to F with a knife-hand. Perform 18 and 19 in a fast motion.'),
(735, 5, 1013, 20, 'Move the left foot to C, forming a left walking stance toward C while executing a low block to C with the left forearm.'),
(736, 5, 1013, 21, 'Execute a middle punch with the right fist while forming a right L-stance toward C, pulling the left foot.'),
(737, 5, 1013, 22, 'Move the right foot to C, forming a left L-stance toward C while executing a middle punch to C with the left fist.'),
(738, 5, 1013, 23, 'Move the left foot to C, forming a right L-stance toward C, at the same time executing a middle punch to C with the right fist.'),
(739, 5, 1013, 24, 'Execute a pressing block to C with an X-fist while forming a left walking stance toward C, slipping the left foot.'),
(740, 5, 1013, 25, 'Move the right foot to C in a sliding motion, forming a right L-stance toward D while thrusting to C with the right side elbow.'),
(741, 5, 1013, 26, 'Bring the left foot to the right foot, turning counter-clockwise to form a close stance toward B while executing a high side front block with the right inner forearm and a low block with the left forearm.'),
(742, 5, 1013, 27, 'Execute a high side front block with the left inner forearm and a low block with the right forearm.'),
(743, 5, 1013, 28, 'Move the left foot to B, forming a right L-stance toward B, at the same time executing a middle-guarding block to B with a knife-hand.'),
(744, 5, 1013, 29, 'Bring the left foot to the right foot and then move the right foot to A, forming a left L-stance toward A while executing a middle guarding block to A with a knife-hand.'),
(745, 5, 1013, 999, 'END: Bring the right foot back to a ready posture.'),
(746, 5, 1014, 0, 'Parallel ready stance toward D.'),
(747, 5, 1014, 1, 'Move the left foot to B, forming a right L-stance toward D while executing a twin knife-hand block.'),
(748, 5, 1014, 2, 'Move the right foot to B, forming a right walking stance toward B while executing a high front strike to B with the right knife-hand and bring the left back hand in front of the forehead.'),
(749, 5, 1014, 3, 'Move the right foot to A, turning clockwise to form a left L-stance toward A while executing a middle guarding block to A with a knife-hand.'),
(750, 5, 1014, 4, 'Move the left foot to A, forming a left walking stance toward A while executing a high thrust to A with the left flat fingertip.'),
(751, 5, 1014, 5, 'Move the left foot to D, forming a right L-stance toward D while executing a middle- guarding block to D with a knife-hand.'),
(752, 5, 1014, 6, 'Turn the face to C, forming a left bending ready stance A toward C.'),
(753, 5, 1014, 7, 'Execute a middle side piercing kick to C with the right foot.'),
(754, 5, 1014, 8, 'Lower the right foot to C, forming a right L-stance toward D while executing a middle guarding block to D with a knife-hand.'),
(755, 5, 1014, 9, 'Execute a flying side piercing kick to D with the right foot in a double motion, and then land to D, forming a left L-stance toward D while executing a middle-guarding block to D with a knife-hand.'),
(756, 5, 1014, 10, 'Move the left foot to E, turning counter-clockwise to form a right L-stance toward E, at the same time executing a low block to E with the left forearm.'),
(757, 5, 1014, 11, 'Extend both hands upward as if to grab the opponent''s head while forming a left walking stance toward E, slipping the left foot.'),
(758, 5, 1014, 12, 'Execute an upward kick to E with the right knee, pulling both hands downward.'),
(759, 5, 1014, 13, 'Lower the right foot to the left foot and then move the left foot to F, forming a left walking stance toward F while executing a high front strike to F with the right reverse knife-and, bringing the left back hand under the right elbow joint.'),
(760, 5, 1014, 14, 'Execute a high turning kick to DF with the right foot and then lower it to the left foot.'),
(761, 5, 1014, 15, 'Execute a middle back piercing kick to F with the left foot. Perform 14 and 15 in a fast motion.'),
(762, 5, 1014, 16, 'Lower the left foot to F, forming a left L-stance toward E while executing a middle-guarding block to E with the forearm.'),
(763, 5, 1014, 17, 'Execute a middle turning kick to DE with the left foot.'),
(764, 5, 1014, 18, 'Lower the left foot to the right foot and then move the right foot to C, forming a right fixed stance toward C while executing a U-shape block towards C.'),
(765, 5, 1014, 19, 'Jump and spin around counter-clockwise, landing on the same spot to form a left L-stance toward C while executing a middle-guarding block to C with a knife hand.'),
(766, 5, 1014, 20, 'Move the left foot to C, forming a left walking stance toward C, at the same time executing a low thrust to C with the right upset fingertip.'),
(767, 5, 1014, 21, 'Execute a side back strike to D with the right back fist and a low block to C with the left forearm while forming a right L-stance toward C, pulling the left foot.'),
(768, 5, 1014, 22, 'Move the right foot to C, forming a right walking stance toward C while executing a middle thrust to C with the right straight fingertip.'),
(769, 5, 1014, 23, 'Move the left foot to B, turning counter-clockwise to form a left walking stance toward B while executing a high block to B with the left double forearm.'),
(770, 5, 1014, 24, 'Move the right foot to B, forming a sitting stance toward C while executing a middle front block to C with the right forearm, and then a high side strike to B with the right back fist.'),
(771, 5, 1014, 25, 'Execute a middle side piercing kick to A with the right foot, turning counter-clockwise and then lower it to A.'),
(772, 5, 1014, 26, 'Execute a middle side piercing kick to A with the left foot turning clockwise.'),
(773, 5, 1014, 27, 'Lower the left foot to A and then execute a middle block to B with an X-knife-hand while forming a left L-stance toward B, pivoting with the left foot.'),
(774, 5, 1014, 28, 'Move the left foot to B, forming a left walking stance toward B while executing an upward block to B with both palms.'),
(775, 5, 1014, 29, 'Move the left foot on line AB and then execute a rising block to A with the right forearm while forming a right walking stance toward A.'),
(776, 5, 1014, 30, 'Execute a middle punch to A with the left fist while maintaining a right walking stance toward A.'),
(777, 5, 1014, 999, 'END. Bring the left foot back to a ready posture.'),
(778, 5, 1015, 0, 'Parallel stance with a heaven hand toward D.'),
(779, 5, 1015, 1, 'Bring the left foot to the right foot, forming a close ready stance B toward D, bringing both hands in a circular motion.'),
(780, 5, 1015, 2, 'Move the left foot to D, forming a left walking stance toward D while executing an upset punch to D with the right fist. Perform in slow motion.'),
(781, 5, 1015, 3, 'Move the right foot to D, forming a right walking stance toward D while executing an upset punch to D with the left fist. Perform in slow motion.'),
(782, 5, 1015, 4, 'Move the left foot to the side front of the right foot, and then move the right foot to D, forming a right walking stance toward D, at the same time executing a high hooking block to D with the right palm. Perform in a double stepping motion.'),
(783, 5, 1015, 5, 'Move the right foot to C in a sliding motion to form a right L-stance toward D, at the same time executing a low guarding block to D with a knife-hand.'),
(784, 5, 1015, 6, 'Move the right foot to the side of the left foot and then move the left foot to D, forming a left walking stance toward D while executing a high hooking block to D with the left palm. Perform in a double stepping motion.'),
(785, 5, 1015, 7, 'Move the left foot to C in a sliding motion forming a left L-stance toward D while executing a low guarding block to D with a knife-hand.'),
(786, 5, 1015, 8, 'Move the left foot to D, forming a right rear foot stance toward D while executing a high guarding block to D with a knife-hand.'),
(787, 5, 1015, 9, 'Move the right foot to D, forming a left rear foot stance toward D while executing a high guarding block to D with a knife-hand.'),
(788, 5, 1015, 10, 'Move the left foot to the side front of the right foot and then turn counter-clockwise, pivoting with the left foot, to form a left walking stance toward C while executing an upward block to C with the right palm. Perform in a slow motion.'),
(789, 5, 1015, 11, 'Move the right foot to C, forming a right walking stance toward C while executing an upward block to C with the left palm. Perform in a slow motion.'),
(790, 5, 1015, 12, 'Execute a low front block with the right knife-hand in a circular motion, hitting the left palm while bringing the left foot to the right foot to form a close stance toward C.'),
(791, 5, 1015, 13, 'Execute a pressing kick to E with the left foot, keeping the position of the hands as they were in 12 .'),
(792, 5, 1015, 14, 'Execute a middle side piercing kick to E with the left foot, keeping the position of the hands as they were in 13. Perform 13 and 14 in a consecutive kick.'),
(793, 5, 1015, 15, 'Lower the left foot to E, forming a right L-stance toward E while executing a high inward strike to E with the right knife-hand and bringing the left side fist in front of the right shoulder.'),
(794, 5, 1015, 16, 'Execute a downward strike to E with the left side fist while forming a close stance toward C, pulling the left foot to the right foot.'),
(795, 5, 1015, 17, 'Execute a pressing kick to F with the right foot, keeping the position of the hands as they were in 16.'),
(796, 5, 1015, 18, 'Execute a middle side piercing kick to F with the right foot, keeping the position of the hands as they were in 17. Perform 17 and 18 in a consecutive kick.'),
(797, 5, 1015, 19, 'Lower the right foot to F, forming a left L-stance toward F while executing a high inward strike to F with the knife-hand and bringing the right side fist in front of the left shoulder.'),
(798, 5, 1015, 20, 'Execute a downward strike to F with the right side fist while forming a close stance toward C, pulling the right foot to the left foot.'),
(799, 5, 1015, 21, 'Move the left foot to C, forming a left low stance toward C while executing a pressing block with the right palm. Perform in slow motion.'),
(800, 5, 1015, 22, 'Move the right foot to C, forming a right low stance toward C while executing a pressing block with the left palm. Perform in a slow motion.'),
(801, 5, 1015, 23, 'Move the right foot to D in a stamping motion to form a sitting stance toward F while executing a high side strike to D with the right back fist.'),
(802, 5, 1015, 24, 'Execute a middle block to D with the right double forearm while forming a right walking stance toward D, pivoting with the left foot.'),
(803, 5, 1015, 25, 'Execute a low block to D with the left forearm while shifting to C, maintaining a right walking stance toward D, keeping the position of the right hand as it was in 24.'),
(804, 5, 1015, 26, 'Execute a high thrust to D with the right flat fingertip while forming a right low stance toward D, slipping the right foot to D. Perform in slow motion.'),
(805, 5, 1015, 27, 'Move the left foot on lone CD in a stamping motion to form a sitting stance toward F while executing a high side strike to C with the left back fist.'),
(806, 5, 1015, 28, 'Execute a middle block to C with the left double forearm while forming a left walking stance toward C, pivoting with the left foot.'),
(807, 5, 1015, 29, 'Execute a low reverse block to C with the right forearm while shifting to D, maintaining a left walking stance toward C, keeping the position of the left hand as it was in 28.'),
(808, 5, 1015, 30, 'Execute a high thrust to C with the left flat fingertip while forming a left low stance toward C, slipping the left foot to C.'),
(809, 5, 1015, 31, 'Move the right foot to C in a stamping motion, forming a right walking stance toward C while executing a high vertical punch to C with a twin fist.'),
(810, 5, 1015, 32, 'Move the left foot to A in a stamping motion, forming a left walking stance toward A while executing an upset punch to A with a twin fist.'),
(811, 5, 1015, 33, 'Execute a middle front snap kick to A with the right foot, keeping the position of the hands as they were in 32.'),
(812, 5, 1015, 34, 'Lower the right foot, and then move the left foot to A to form a left L-stance toward B while executing a middle guarding block to B with a knife-hand.'),
(813, 5, 1015, 35, 'Move the left foot to B, forming a left walking stance toward B while executing a high punch to B with the left fist.'),
(814, 5, 1015, 36, 'Move the right foot to B in stamping motion, forming a right walking stance toward B while executing an upset punch to B with a twin fist.'),
(815, 5, 1015, 37, 'Execute a middle front snap kick to B with the left foot, keeping the position of the hands as they were in 36.'),
(816, 5, 1015, 38, 'Lower the left foot to the right foot, and then move the right foot to B to form a right L-stance toward A at the same time executing a middle guarding block to A with a knife-hand.'),
(817, 5, 1015, 39, 'Move the right foot to A, forming a right walking stance toward A while executing a high punch to A with the right fist.'),
(818, 5, 1015, 999, 'END: Bring the left foot back to a ready posture.'),
(819, 5, 1016, 0, 'Parallel stance with a heaven hand toward D.'),
(820, 5, 1016, 1, 'Move the left foot to B, forming a right L-stance toward B while executing a middle guarding block to B with the forearm.'),
(821, 5, 1016, 2, 'Pull the right foot to the left knee joint to form a left one-leg stance toward D, at the same time lifting both fists while turning the face toward A.'),
(822, 5, 1016, 3, 'Execute a pressing kick to A with the right foot keeping the position of the hands as they were in 2.'),
(823, 5, 1016, 4, 'Lower the right foot to A to form a sitting stance toward D while executing a middle side strike to A with the right knife-hand.'),
(824, 5, 1016, 5, 'Execute an angle punch with the left fist while maintaining a sitting stance toward D.'),
(825, 5, 1016, 6, 'Execute a pressing block with the left, fore fist while executing a side front block with the right inner forearm, maintaining a sitting stance toward D.'),
(826, 5, 1016, 7, 'Execute a pressing block with the right fore fist and a side front block with the left inner forearm while maintaining a sitting stance toward D.'),
(827, 5, 1016, 8, 'Execute a middle wedging block with the inner forearm while maintaining a sitting stance toward D.');
INSERT INTO `EncyclopediaCount` (`ID`, `EncyclopediaID`, `PatternID`, `Count`, `Text`) VALUES
(828, 5, 1016, 9, 'Thrust to C with the right back elbow supporting the right fore fist with the left palm keeping the face as it was in 8 while maintaining a sitting stance towards D.'),
(829, 5, 1016, 10, 'Execute a middle punch to D with the right fist slipping the left palm up to the right elbow joint while maintaining a sitting stance toward D.'),
(830, 5, 1016, 11, 'Thrust to C with the left back elbow supporting the left fore fist with right palm, keeping the face as it was in 10 while maintaining a sitting stance toward D.'),
(831, 5, 1016, 12, 'Execute a right horizontal punch to A while maintaining a sitting stance toward D. Perform 6 through 12 in a continuous motion.'),
(832, 5, 1016, 13, 'Cross the left foot over the right foot forming a right X-stance toward D while executing a low front block to D with the right outer forearm and bringing the left finger belly on the right under forearm.'),
(833, 5, 1016, 14, 'Move the right foot to A forming a left L-stance toward A at the same time executing a U-shape grasp to A.'),
(834, 5, 1016, 15, 'Bring the left foot to the right foot forming a closed stance toward D while executing a horizontal thrust with a twin elbow, turning the face toward B. Perform in slow motion.'),
(835, 5, 1016, 16, 'Move the left foot to B to form a sitting stance toward D while executing a side back strike to C with the right back fist and extending the left arm to the side downward.'),
(836, 5, 1016, 17, 'Cross the right foot over the left foot forming a left X-stance toward D while executing a low front block with the left outer forearm and bringing the right finger belly to the left side fist.'),
(837, 5, 1016, 18, 'Move the left foot to B to form a sitting stance toward D while executing a low guarding block to B with a reverse knife-hand.'),
(838, 5, 1016, 19, 'Execute a forearm middle guarding block to A while forming a left L-stance toward A pivoting with left foot.'),
(839, 5, 1016, 20, 'Pull the left foot to the right knee joint to form a right one-leg stance toward D, at the same time lifting both fists while turning the face toward B.'),
(840, 5, 1016, 21, 'Execute a pressing kick to B with the left foot keeping the position of the hands as they were in 20.'),
(841, 5, 1016, 22, 'Lower the left foot to B to form a sitting stance toward D while executing a middle side strike to B with the left knife-hand.'),
(842, 5, 1016, 23, 'Execute an angle punch with the right fist while maintaining a sitting stance toward D.'),
(843, 5, 1016, 24, 'Execute a pressing block with the right, fore fist while executing a side front block with the left inner forearm, maintaining a sitting stance toward D.'),
(844, 5, 1016, 25, 'Execute a pressing block with the left fore fist and a side front block with the right inner forearm while maintaining a sitting stance toward D.'),
(845, 5, 1016, 26, 'Execute a middle wedging block with the inner forearm while maintaining a sitting stance toward D.'),
(846, 5, 1016, 27, 'Thrust to C with the left back elbow supporting the left fore fist with the right palm keeping the face as it was in 26 while maintaining a sitting stance towards D.'),
(847, 5, 1016, 28, 'Execute a middle punch to D with the left fist slipping the right palm up to the left elbow joint while maintaining a sitting stance toward D.'),
(848, 5, 1016, 29, 'Thrust to C with the right back elbow supporting the right fore fist with left palm, keeping the face as it was in 28 while maintaining a sitting stance toward D.'),
(849, 5, 1016, 30, 'Execute a left horizontal punch to B while maintaining a sitting stance toward D. Perform 24 through 30 in a continuous motion.'),
(850, 5, 1016, 31, 'Cross the right foot over the left foot forming a left X-stance toward D while executing a low front block to D with the left outer forearm and bringing the right finger belly on the left under forearm.'),
(851, 5, 1016, 32, 'Move the left foot to B forming a right L-stance toward B at the same time executing a U-shape grasp to B.'),
(852, 5, 1016, 33, 'Bring the right foot to the left foot forming a closed stance toward D while executing a horizontal thrust with a twin elbow, turning the face toward A. Perform in slow motion.'),
(853, 5, 1016, 34, 'Move the right foot to A to form a sitting stance toward D while executing a side back strike to C with the left back fist and extending the right arm to the side downward.'),
(854, 5, 1016, 35, 'Cross the left foot over the right foot forming a right X-stance toward D while executing a low front block with the right outer forearm and bringing the left finger belly to the right side fist.'),
(855, 5, 1016, 36, 'Move the right foot to A to form a sitting stance toward D while executing a low guarding block to A with a reverse knife-hand.'),
(856, 5, 1016, 999, 'END: Bring the left foot back to a ready posture.'),
(857, 5, 1017, 0, 'Parallel ready stance toward D.'),
(858, 5, 1017, 1, 'Move the right foot to C forming a right L-stance toward D while executing a checking block D with an Xknife-hand.'),
(859, 5, 1017, 2, 'Execute a low twisting kick to D with the right foot keeping the position of the hands as they were in 1.'),
(860, 5, 1017, 3, 'Lower the right foot to D forming a right walking stance toward D while executing a middle punch to D with the right fist.'),
(861, 5, 1017, 4, 'Execute a middle punch to D with the left fist while maintaining a right walking stance toward D. Perform 3 and 4 in a fast motion.'),
(862, 5, 1017, 5, 'Move the right foot to C forming a left walking stance toward D while executing a rising block with the left forearm.'),
(863, 5, 1017, 6, 'Execute a low block to D with the left forearm while maintaining a left walking stance toward D. Perform 5 and 6 in a continuous motion.'),
(864, 5, 1017, 7, 'Execute a high block to AD with a double arc hand while looking through it maintaining a left walking stance toward D.'),
(865, 5, 1017, 8, 'Turn the face toward D while forming a right bending ready stance A toward D.'),
(866, 5, 1017, 9, 'Lower the left foot to AD to form a sitting stance toward AC while executing a scooping block to AC with the left palm.'),
(867, 5, 1017, 10, 'Execute a middle punch to AC with the right fist while maintaining a sitting stance toward AC. Perform 9 and 10 in a connecting motion.'),
(868, 5, 1017, 11, 'Execute a front strike to AC with the left back fist while maintaining a sitting stance toward AC.'),
(869, 5, 1017, 12, 'Move the right foot on line AB and then move the left foot to C forming a right L-stance toward C while executing a middle guarding block to C with a knife-hand.'),
(870, 5, 1017, 13, 'Execute a low side front snap kick to C with the left foot keeping the position of the hands as they were in 12.'),
(871, 5, 1017, 14, 'Lower the left foot to C forming a left low stance toward C while executing a high thrust to C with the left flat finger tip.'),
(872, 5, 1017, 15, 'Execute a high thrust to C with the right flat finger tip while maintaining a left low stance toward C.'),
(873, 5, 1017, 16, 'Execute a middle side piercing kick to C with the right foot while pulling both hands in the opposite direction.'),
(874, 5, 1017, 17, 'Lower the right foot to C forming a right L-stance toward D while executing a middle guarding block to D with the forearm.'),
(875, 5, 1017, 18, 'Move the right foot to D turning counter clockwise to form a right L-stance toward C while executing a middle guarding block to C with the forearm.'),
(876, 5, 1017, 19, 'Move the left foot to D turning counter clockwise to form a right L-stance toward D while executing a middle guarding block to D with a knife-hand.'),
(877, 5, 1017, 20, 'Move the left foot on line CD to form a sitting stance toward A while executing a right 9-shape block.'),
(878, 5, 1017, 21, 'Move the right foot to D, turning counter-clockwise to form a left walking stance toward C while executing a low block to C with the left knife-hand.'),
(879, 5, 1017, 22, 'Execute a middle turning kick to BC with the right foot and then lower it to C.'),
(880, 5, 1017, 23, 'Execute a flying side piercing kick to C with the right foot. Perform 22 and 23 in a fast motion.'),
(881, 5, 1017, 24, 'Land to C to form a right walking stance toward C while executing a high vertical punch to C with a twin fist.'),
(882, 5, 1017, 25, 'Execute a high block to AC with a double arc-hand while looking through it maintaining a right walking stance toward C.'),
(883, 5, 1017, 26, 'Execute an upset punch to C with the left fist while maintaining a right walking stance toward C.'),
(884, 5, 1017, 27, 'Move the right foot on line CD, forming a left walking stance toward D while striking the left palm with the right front elbow.'),
(885, 5, 1017, 28, 'Jump to D, forming a right x-stance toward BD while executing a high block to D with the right double forearm.'),
(886, 5, 1017, 29, 'Move the left foot to BC to form a sitting stance toward BD, at the same time executing a scooping block to BD with the right palm.'),
(887, 5, 1017, 30, 'Execute a middle punch to BD with the left fist while maintaining a sitting stance toward BD. Perform 29 and 30 in a connecting motion.'),
(888, 5, 1017, 31, 'Execute a front strike to BD with the right back fist while maintaining a sitting stance toward BD.'),
(889, 5, 1017, 32, 'Move the left foot to C, forming a left walking stance toward C, at the same time executing a high front strike to C with the right reverse knife-hand.'),
(890, 5, 1017, 33, 'Move the left foot to A about half a shoulder width while executing a middle turning kick to C with the right foot.'),
(891, 5, 1017, 34, 'Lower the right foot to C, and then turn counter-clockwise to form a left walking stance toward D, pivoting with the right foot while executing a high vertical punch to D with a twin fist.'),
(892, 5, 1017, 35, 'Execute a middle punch to D with the right middle knuckle fist, bringing the left side first in front of the right shoulder while forming a right L-stance toward D pulling the left foot.'),
(893, 5, 1017, 36, 'Move the right foot to D to form a sitting stance toward B, at the same time executing left 9-shape block.'),
(894, 5, 1017, 37, 'Execute a low guarding block to C with a reverse knife-hand while maintaining a sitting stance toward B.'),
(895, 5, 1017, 38, 'Execute a low guarding block to C with a reverse knife-hand while maintaining a sitting stance toward B. Perform 37 Perform 37 and 38 in a continuous motion.'),
(896, 5, 1017, 39, 'Move the left foot to D in a stamping motion to form a sitting stance toward A while executing a W-shape block with the outer forearm.'),
(897, 5, 1017, 40, 'Move the left foot to C in a stamping motion to form a sitting stance toward B while executing a W-shape block with the outer forearm.'),
(898, 5, 1017, 41, 'Move the right foot to C forming a right walking stance toward C while executing a rising block with the right forearm.'),
(899, 5, 1017, 42, 'Execute a middle punch to C with the left fist while maintaining a right walking stance toward C.'),
(900, 5, 1017, 43, 'Move the right foot on line CD forming a left walking stance toward D while executing a rising block with the left forearm.'),
(901, 5, 1017, 44, 'Execute a middle punch to D with the right fist while maintaining a left walking stance toward D.'),
(902, 5, 1017, 999, 'END: Bring the right foot back to a ready posture.'),
(903, 2, 1018, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type D toward D. Remain in this close ready stance type D until given the command to begin the pattern.'),
(904, 2, 1018, 1, 'Move the right foot to C to form a left walking stance toward D, while executing (full facing) a low inward block to D with the right knife-hand, pulling the left side fist in front of the right shoulder.'),
(905, 2, 1018, 2, 'Move the left foot to C to form a right walking stance toward D, while executing (reverse half facing) a high side block to D with the left outer forearm.'),
(906, 2, 1018, 3, 'While maintaining a right walking stance toward D, execute a middle front punch (full facing) to D with the right forefist.'),
(907, 2, 1018, 4, 'Execute a low twisting kick to D with the ball of the left foot, keeping the position of the hands as they were in move 3 above (a middle front punch with the right forefist).'),
(908, 2, 1018, 5, 'Lower the left foot to D to form a left walking stance toward D, while executing (full facing) a downward block to D with an X-fist. Perform moves 5 and 6 in a continuous motion.'),
(909, 2, 1018, 6, 'While maintaining a left walking stance toward D, execute a rising block (full facing) to D with the right knife-hand.'),
(910, 2, 1018, 7, 'Move the right foot toward D in a jumping motion (about one and a half shoulder widths in front of the left foot), landing to form a right X-stance toward BD, while executing (half facing) a high side strike to D with the right backfist, bringing the left finger belly to the right side fist. Perform this move in jumping motion.'),
(911, 2, 1018, 8, 'Move the left foot to C to form a right L-stance toward C, while executing (half facing) a middle punch to C with the left forefist.'),
(912, 2, 1018, 9, 'Execute a middle reverse turning kick to AC with the back heel of the right foot, while holding both side fists up and toward AC.'),
(913, 2, 1018, 10, 'Lower the right foot to C in a stamping motion to form a sitting stance toward A, while executing (side facing) a middle side strike to C with the right knife-hand. Perform this move in a stamping motion.'),
(914, 2, 1018, 11, 'While pivoting on the ball of the right foot and turning clockwise, execute a middle side piercing kick to C with the left footsword. At the same time, pull both hands in the opposite direction to the front of the right chest, with the left side fist on the right under fist.'),
(915, 2, 1018, 12, 'Lower the left foot to C to form a left walking stance toward C, while executing (full facing) a high crescent punch with the right forefist.'),
(916, 2, 1018, 13, 'Pull the right foot toward the left foot to form a parallel stance toward C, while executing (full facing) a middle turning punch with the left forefist. Perform this move in a slow motion.'),
(917, 2, 1018, 14, 'Move the left foot to D to form a right walking stance toward C, while executing (full facing) a low inward block with the left knife-hand, pulling the right side fist in front of the left shoulder.'),
(918, 2, 1018, 15, 'Move the right foot to D to form a left walking stance toward C, while executing (reverse half facing) a high side block to C with the right outer forearm.'),
(919, 2, 1018, 16, 'While maintaining a left walking stance toward C, execute a middle front punch (full facing) to C with the left forefist.'),
(920, 2, 1018, 17, 'Execute a low twisting kick to C with the ball of the right foot, keeping the position of the hands as they were in move 16 above (a middle front punch with the left forefist).'),
(921, 2, 1018, 18, 'Lower the right foot to C to form a right walking stance toward C, while executing (full facing) a downward block to C with an X-fist. Perform moves 18 and 19 in a continuous motion.'),
(922, 2, 1018, 19, 'While maintaining a right walking stance toward C, execute a rising block (full facing) to C with the left knife-hand.'),
(923, 2, 1018, 20, 'Move the left foot toward C in a jumping motion (about one and a half shoulder widths in front of the right foot), landing to form a left X-stance toward BC, while executing (half facing) a high side strike to C with the left backfist, bringing the right finger belly to the left side fist. Perform this move in jumping motion.'),
(924, 2, 1018, 21, 'Move the right foot to D to form a left L-stance toward D, while executing (half facing) a middle punch to D with the right forefist.'),
(925, 2, 1018, 22, 'Execute a middle reverse turning kick to AD with the back heel of the left foot, while holding both side fists up and toward AD.'),
(926, 2, 1018, 23, 'Lower the left foot to D in a stamping motion to form a sitting stance toward A, while executing (side facing) a middle side strike to D with the left knife-hand. Perform this move in a stamping motion.'),
(927, 2, 1018, 24, 'While pivoting on the ball of the left foot and turning counterclockwise, execute a middle side piercing kick to D with the right footsword. At the same time, pull both hands in the opposite direction to the front of the left chest, with the right side fist on the left under fist.'),
(928, 2, 1018, 25, 'Lower the right foot to D to form a right walking stance toward D, while executing (full facing) a high crescent punch with the left forefist.'),
(929, 2, 1018, 26, 'Pull the left foot toward the right foot to form a parallel stance toward D, while executing a middle turning punch (full facing) with the right forefist. Perform this move in a slow motion.'),
(930, 2, 1018, 27, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) a middle wedging block with a knife-hand.'),
(931, 2, 1018, 28, 'While maintaining a right walking stance toward D, execute (reverse half facing) a circular block to BD with the left reverse knife-hand.'),
(932, 2, 1018, 29, 'Pull the right foot toward the left foot to form a left rear foot stance toward D, while executing a downward block (half facing) to D with an alternate palm.'),
(933, 2, 1018, 30, 'Slip the right foot to D to form a left L-stance toward D, while executing (half facing) a middle front punch to D with the left forefist.'),
(934, 2, 1018, 31, 'While shifting to C and maintaining a left L-stance toward D, execute (half facing) a low inward block to D with the right reverse knife-hand, pulling the left side fist in front of the right shoulder. Perform this move in a shifting motion.'),
(935, 2, 1018, 32, 'Move the left foot to D to form a left walking stance toward D, while executing (full facing) a middle wedging block with a knife-hand.'),
(936, 2, 1018, 33, 'While maintaining a left walking stance toward D, execute (reverse half facing) a circular block to AD with the right reverse knife-hand.'),
(937, 2, 1018, 34, 'Pull the left foot toward the right foot to form a right rear foot stance toward D, while executing a downward block (half facing) to D with an alternate palm.'),
(938, 2, 1018, 35, 'Slip the left foot to D to form a right L-stance toward D, while executing (half facing) a middle front punch to D with the right forefist.'),
(939, 2, 1018, 36, 'While shifting to C and maintaining a right L-stance toward D, execute (half facing) a low inward block to D with the left reverse knife-hand, pulling the right side fist in front of the left shoulder. Perform this move in a shifting motion.'),
(940, 2, 1018, 37, 'Execute a high reverse turning kick to BD with the back heel of the right foot, forming a forearm guarding block with the fists toward BD at shoulder level.'),
(941, 2, 1018, 38, 'Lower the right foot to D to form a left rear foot stance toward D, while executing (half facing) a middle outer forearm guarding block to D.'),
(942, 2, 1018, 39, 'Execute a high reverse turning kick to AD with the back heel of the left foot, while holding both side fists up and toward AD.'),
(943, 2, 1018, 40, 'Lower the left foot to D to form a right rear foot stance toward D, while executing (half facing) a middle outer forearm guarding block to D.'),
(944, 2, 1018, 41, 'Move the ball of the left foot to the side rear of the right foot, and then move the right foot to C to form a right L-stance toward D, while executing (half facing) a low outward block to D with the left knife-hand. Perform this move in a double-stepping motion.'),
(945, 2, 1018, 42, 'Slip the left foot to D to form a left walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(946, 2, 1018, 43, 'Move the left foot to C to form a left L-stance toward D, while executing (half facing) a low block to D with the right knife-hand.'),
(947, 2, 1018, 44, 'Slip the right foot to D to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the left forefist.'),
(948, 2, 1018, 45, 'While maintaining a right walking stance toward D, execute (full facing) a high front punch to D with the right forefist.'),
(949, 2, 1018, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot back to the left foot to form a close ready stance type D toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(950, 2, 1019, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type A toward D. Remain in this close ready stance type A toward D until given the command to begin the pattern.'),
(951, 2, 1019, 1, 'Move the right foot to A to form a sitting stance toward D, while executing (full facing) a high side front block with the right inner forearm and extending the left forearm to the side-downward.'),
(952, 2, 1019, 2, 'While maintaining a sitting stance toward D, execute (full facing) a high side front block with the left inner forearm, extending the right forearm to the side-downward.'),
(953, 2, 1019, 3, 'Bring the right foot to the side of the left foot to form a close stance toward D, while executing (full facing) an angle punch with the left forefist. Perform this move in a slow motion.'),
(954, 2, 1019, 4, 'Move the left foot to D to form a left walking stance toward D, while executing (full facing) a high front thrust to D with the right double finger.'),
(955, 2, 1019, 5, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) a high front thrust to D with the left double finger.'),
(956, 2, 1019, 6, 'While maintaining a right walking stance toward D, execute (full facing) a front strike to D with the right backfist, pulling the left backfist under the right elbow.'),
(957, 2, 1019, 7, 'Move the left foot to D to form a left walking stance toward D, while executing (full facing) a rising block with the left outer forearm.'),
(958, 2, 1019, 8, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(959, 2, 1019, 9, 'While pivoting on the ball of the left foot and turning counterclockwise, move the ball of the right foot to C, pausing as the feet face toward AC. Then move the right foot to C in a sliding motion to form a right L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D. Perform this move in a sliding motion.'),
(960, 2, 1019, 10, 'Execute a low front snap kick to D with the ball of the right foot, keeping the position of the hands as they were in move 9 above (a middle outer forearm guarding block).'),
(961, 2, 1019, 11, 'Lower the right foot to D to form a right low stance toward D, while executing (full facing) a high front thrust to D with the right flat fingertip.'),
(962, 2, 1019, 12, 'While pivoting on the ball of the left foot, place both hands on the floor toward B to support the body, while executing a high turning kick to D with the ball of the right foot.'),
(963, 2, 1019, 13, 'Lower the right foot to D, and then execute (full facing) a high front punch to D with the right forefist, pressing the ground with the thumb and fingers of the left hand as if to trap the opponent''s instep on the ground with the left palm.'),
(964, 2, 1019, 14, 'Move the left foot to D turning clockwise to form a left L-stance toward C, while thrusting (half facing) to D with the left side elbow.'),
(965, 2, 1019, 15, 'Move the left foot to C turning clockwise to form a left L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D.'),
(966, 2, 1019, 16, 'Move the right foot to C to form a right L-stance toward D, while executing (half facing) a scooping block with the left palm.'),
(967, 2, 1019, 17, 'Move the left foot to C to form a left L-stance toward D, while executing (half facing) a middle outward strike to D with the right knife-hand.'),
(968, 2, 1019, 18, 'While pivoting on the ball of the right foot and turning counterclockwise, move the left foot to C to form a left walking stance toward C, while executing (full facing) a pressing block to C with an X-fist.'),
(969, 2, 1019, 19, 'Execute a low front snap kick to C with the right knee, while pulling both hands in an X-palm in the opposite direction to the left hip, as if grabbing and pulling the opponent''s leg.'),
(970, 2, 1019, 20, 'Lower the right foot to C to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(971, 2, 1019, 21, 'Move the right foot to D in a sliding motion to form a right L-stance toward C, while thrusting (half facing) to D with the right side elbow. Perform this move in a sliding motion.'),
(972, 2, 1019, 22, 'While pivoting on the ball of the left foot, move the right foot to D to form a left L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(973, 2, 1019, 23, 'Execute a middle side piercing kick to D with the right footsword, while pulling both hands in the opposite direction in front of the left chest.'),
(974, 2, 1019, 24, 'Lower the right foot to D to form a right rear foot stance toward C, while executing (full facing) a pressing block to C with a twin palm.'),
(975, 2, 1019, 25, 'Move the right foot to C to form a right walking stance toward C, while executing (full facing) a high front block to C with the right outer forearm. Then, while maintaining a right walking stance toward C, execute (half facing) a high side strike to C with the right backfist. Perform both of the techniques included in this move at regular speed.'),
(976, 2, 1019, 26, 'While pivoting on the ball of the right foot, move the left foot to D to form a right L-stance toward D, while executing (half facing) a high front thrust to D with the left flat fingertip.'),
(977, 2, 1019, 27, 'Execute a low front snap kick to D with the right foot, bringing the right finger belly on the left backhand.'),
(978, 2, 1019, 28, 'While pivoting on the ball of the left foot and turning counterclockwise, move the right foot to D to form a left walking stance toward C, while thrusting (full facing) to D with the right back elbow, placing the left side fist on the right under fist. Perform this move in a slow motion – sliding the right foot.'),
(979, 2, 1019, 29, 'While pivoting on the ball of the right foot, move the left foot to C in a stamping motion to form a right L-stance toward C, while executing (half facing) a downward strike to C with the left backhand. Perform this move in a stamping motion.'),
(980, 2, 1019, 30, 'While maintaining a right L-stance toward C, execute (half facing) a middle front punch to C with the right forefist, punching the left palm and keeping the right arm straight.'),
(981, 2, 1019, 31, 'Move the right foot to C in a stamping motion to form a left L-stance toward C, while executing (half facing) a downward strike to C with the right backhand. Perform this move in a stamping motion.'),
(982, 2, 1019, 32, 'While maintaining a left L-stance toward C, execute (half facing) a middle front punch to C with the left forefist, punching the right palm and keeping the left arm straight.'),
(983, 2, 1019, 33, 'While pivoting on the ball of the right foot, move the left foot to D in a stamping motion to form a right L-stance toward D, while executing (half facing) a middle outward strike to D with the left knife-hand. Perform this move in a stamping motion.'),
(984, 2, 1019, 34, 'Slip the left foot to D to form a left walking stance toward D, while executing (full facing) a high side front strike to D with the right backfist, striking the left finger belly with the right elbow.'),
(985, 2, 1019, 35, 'Move the right foot to D in a stamping motion to form a left L-stance toward D, while executing (half facing) a middle outward strike to D with the right knife-hand. Perform this move in a stamping motion.'),
(986, 2, 1019, 36, 'Slip the right foot to D to form a right walking stance toward D, while executing (full facing) a high side front strike to D with the left backfist, striking the right finger belly with the left elbow.'),
(987, 2, 1019, 37, 'While pivoting on the ball of the right foot, move the left foot to C to form a right L-stance toward C, while executing (half facing) a low reverse knife-hand guarding block to C.'),
(988, 2, 1019, 38, 'Slip the left foot to C to form a left walking stance toward C, while executing (full facing) a right 9-shape block.'),
(989, 2, 1019, 39, 'Move the right foot to C to form a left L-stance toward C, while executing (half facing) a low reverse knife-hand guarding block to C.'),
(990, 2, 1019, 40, 'Slip the right foot to C to form a right walking stance toward C, while executing (full facing) a left 9-shape block.'),
(991, 2, 1019, 41, 'Move the right foot to D to form a left walking stance toward C, while executing (full facing) a horizontal strike with a twin knife-hand.'),
(992, 2, 1019, 42, 'While maintaining a left walking stance toward C, execute (full facing) a high front strike to C with the right arc-hand.'),
(993, 2, 1019, 43, 'Execute a middle front snap kick to C with the ball of the right foot, keeping the position of the hands as they were in move 42 above (a high front strike with the right arc-hand).'),
(994, 2, 1019, 44, 'Lower the right foot to C to form a right walking stance toward C, while executing (full facing) a high front strike to C with the left arc-hand.'),
(995, 2, 1019, 45, 'Execute a middle front snap kick to C with the ball of the left foot, keeping the position of the hands as they were in move 44 above (a high front strike with the left arc-hand).'),
(996, 2, 1019, 46, 'Lower the left foot to C to form a left walking stance toward C, while executing (full facing) a middle front punch to C with the right forefist. Perform moves 46 and 47 in a fast motion.'),
(997, 2, 1019, 47, 'While maintaining a left walking stance toward C, execute (full facing) a middle front punch to C with the left forefist.'),
(998, 2, 1019, 48, 'Bring the right foot to the side of the left foot to form a close stance toward C, while executing (full facing) a high crescent punch with a twin foreknuckle fist, with the under fists facing C.'),
(999, 2, 1019, 49, 'While pivoting on the ball of the right foot and turning counterclockwise, move the left foot to B to form a left walking stance toward B, while executing (half facing) a low block to B with the left knife-hand.'),
(1000, 2, 1019, 50, 'While maintaining a left walking stance toward B, execute (full facing) a high front punch to B with the right open fist.'),
(1001, 2, 1019, 51, 'Move the left foot on the AB line (half a shoulder width toward D and half a shoulder width toward A). Then, pivoting on the ball of the left foot and turning clockwise, move the right foot to A to form a right walking stance toward A, while executing (half facing) a low block to A with the right knife-hand. Perform this move in a spot-turning motion - method one.'),
(1002, 2, 1019, 52, 'While maintaining a right walking stance toward A, execute (full facing) a high front punch to A with the left open fist .'),
(1003, 2, 1019, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot to the right foot to form a close ready stance type A toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(1004, 2, 1020, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Stance with a Twin Side Elbow toward D. Remain in this parallel stance with a twin side elbow toward D until given the command to begin the pattern.'),
(1005, 2, 1020, 1, 'Move the left foot to B to form a sitting stance toward D, while executing (full facing) a parallel block with the inner forearms.'),
(1006, 2, 1020, 2, 'Standing up toward D, execute (full facing) a middle hooking block to D with the right palm.'),
(1007, 2, 1020, 3, 'Drop down to form a sitting stance toward D, while executing (full facing) a middle front punch to D with the left forefist.'),
(1008, 2, 1020, 4, 'Pull the right reverse footsword to the left knee joint to form a left one-leg stance toward D, while executing (full facing) a parallel block with the outer forearms.'),
(1009, 2, 1020, 5, 'Execute a middle side piercing kick to A with the right footsword. Then, pivoting on the ball of the left foot and turning clockwise, execute a high reverse hook kick to B with the back heel of the right foot consecutively, keeping the position of the hands as they were in move 4 above (a parallel block with the outer forearms). Perform these kicking techniques in a slow motion, and perform both techniques included in this move in a consecutive kicking motion.'),
(1010, 2, 1020, 6, 'Lower the right foot toward B in a jumping motion (about one shoulder width toward B), landing to form a right X-stance toward F, while executing (side facing) a side downward strike to B with the right backfist. Perform this move in a jumping motion.'),
(1011, 2, 1020, 7, 'Execute consecutively, a middle hooking kick to F with the side instep of the left foot, while holding both side fists up and toward F, then execute a high side piercing kick to F with the left footsword, while pulling both fists in front of the chest. Perform both kicking techniques included in this move in a consecutive kicking motion.'),
(1012, 2, 1020, 8, 'Lower the left foot to F in a stamping motion to form a sitting stance toward B, while executing (side facing) a high outward crosscut to F with the left flat fingertip. Perform this move in a stamping motion.'),
(1013, 2, 1020, 9, 'Pivot on the balls of both feet to form a left walking stance toward BF, while executing (reverse half facing) a high strike to BF with the right elbow, pressing the right side fist with the left palm.'),
(1014, 2, 1020, 10, 'Cross the left foot over the right foot to form a right X-stance toward B, while executing (full facing) a low front block to B with the left reverse knife-hand, bringing the right finger belly on the left back forearm.'),
(1015, 2, 1020, 11, 'Move the right foot to A to form a left L-stance toward A, while executing (half facing) a middle knife-hand guarding block to A.'),
(1016, 2, 1020, 12, 'While jumping toward A (about one and a half shoulder widths) and spinning counterclockwise, execute a mid-air strike to A with the left knife-hand. Then land facing toward A, while forming a right L-stance toward A with the left arm slightly bent and extended toward A. Perform this move in a jumping motion.'),
(1017, 2, 1020, 13, 'Move the right foot to A to form a sitting stance toward D, while executing (full facing) a parallel block with the inner forearms.'),
(1018, 2, 1020, 14, 'Standing up toward D, execute (full facing) a middle hooking block to D with the left palm.'),
(1019, 2, 1020, 15, 'Drop down to form a sitting stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(1020, 2, 1020, 16, 'Pull the left reverse footsword to the right knee joint to form a right one-leg stance toward D, while executing (full facing) a parallel block with the outer forearms.'),
(1021, 2, 1020, 17, 'Execute a middle side piercing kick to B with the left footsword. Then, pivoting on the ball of the right foot and turning counterclockwise, execute a high reverse hook kick to A with the back heel of the left foot consecutively, keeping the position of the hands as they were in move 16 above (a parallel block with the outer forearms). Perform these kicking techniques a slow motion, and perform both kicking techniques included in this move in a consecutive kicking motion.'),
(1022, 2, 1020, 18, 'Move the left foot toward A in a jumping motion (about one shoulder width toward A), landing to form a left X-stance toward E, while executing (side facing) a side downward strike to A with the left backfist. Perform this move in a jumping motion.'),
(1023, 2, 1020, 19, 'Execute consecutively, a middle hooking kick to E with the side instep of the right foot, while holding both side fists up and toward E, then execute a high side piercing kick with the right footsword to E, while pulling both fists in front of the chest. Perform both kicking techniques included in this move in a consecutive kicking motion.'),
(1024, 2, 1020, 20, 'Lower the right foot to E in a stamping motion to form a sitting stance toward A, while executing (side facing) a high outward crosscut to E with the right flat fingertip. Perform this move in a stamping motion.'),
(1025, 2, 1020, 21, 'Pivot on the balls of both feet to form a right walking stance toward AE, while executing (reverse half facing) a high strike to AE with the left elbow, pressing the left side fist with the right palm.'),
(1026, 2, 1020, 22, 'Cross the right foot over the left foot to form a left X-stance toward A, while executing (full facing) a low front block to A with the right reverse knife-hand, bringing the left finger belly on the right back forearm.'),
(1027, 2, 1020, 23, 'Move the left foot to B to form a right L-stance toward B, while executing (half facing) a middle knife-hand guarding block to B.'),
(1028, 2, 1020, 24, 'While jumping toward B (about one and a half shoulder widths) and spinning clockwise, execute a mid-air strike to B with the right knife-hand. Then land facing toward B, while forming a left L-stance toward B with the right arm slightly bent and extended toward B. Perform this move in a jumping motion.'),
(1029, 2, 1020, 25, 'Execute a pick-shape kick to B with the back heel of the left foot, while holding both side fists up and toward B. Then, lower the ball of the left foot to B to form a right rear foot stance toward B, while executing (half facing) a middle outer forearm guarding block.'),
(1030, 2, 1020, 26, 'Bring the right foot to the side of the left foot to form a close stance with a heaven hand toward D. Perform this move in a slow motion.'),
(1031, 2, 1020, 27, 'Move the left foot to C in a sliding motion to form a left rear foot stance toward D, while executing (half facing) a downward thrust with the right straight elbow. Perform this move in a sliding motion.'),
(1032, 2, 1020, 28, 'Slip the right foot to D to form a right walking stance toward D, while executing (full facing) a high crescent strike with the left arc-hand.'),
(1033, 2, 1020, 29, 'Move the right foot to C in a sliding motion to form a right rear foot stance toward D, while executing (half facing) a downward thrust with the left straight elbow. Perform this move in a sliding motion.'),
(1034, 2, 1020, 30, 'Slip the left foot to D to form a left walking stance toward D, while executing (full facing) a high crescent strike with the right arc-hand.'),
(1035, 2, 1020, 31, 'Move the left foot to C to form a right walking stance toward D, while executing (full facing) a high inward strike to D with a twin knife-hand.'),
(1036, 2, 1020, 32, 'Move the right foot to C to form a left walking stance toward D, while executing (full facing) a downward punch with the right forefist.'),
(1037, 2, 1020, 33, 'Move the ball of the left foot to the side rear of the right foot, then move the right foot to C in a sliding motion to form a right L-stance toward D, while executing (half facing) a downward block to D with the left outer forearm. Perform this move in a sliding motion.'),
(1038, 2, 1020, 34, 'While jumping toward C (about one and a half shoulder widths) and spinning clockwise, execute a dodging reverse turning kick to D with the back heel of the right foot, while holding both side fists up and toward D. Then, land facing toward D to form a left L-stance toward D, while executing (half facing) a middle outer forearm guarding block. Perform this move in a jumping motion.'),
(1039, 2, 1020, 35, 'Move the ball of the right foot to the side rear of the left foot, and then move the left foot to C in a sliding motion to form a left L-stance toward D, while executing (half facing) a downward block to D with the right outer forearm. Perform this move in a sliding motion.'),
(1040, 2, 1020, 36, 'While jumping toward C (about one and a half shoulder widths) and spinning counterclockwise, execute a dodging reverse turning kick to D with the back heel of the left foot, while holding both side fists up and toward D. Then, land facing toward D to form a right L-stance toward D, while executing (half facing) a middle outer forearm guarding block. Perform this move in a jumping motion.'),
(1041, 2, 1020, 37, 'Move the ball of the right foot to the side front of the left foot, then move the left foot to D in a double stepping motion. Then execute a flying two-direction kick (twisting kick with the ball of the left foot to F - side piercing with the right footsword to E) while flying to D and holding both side fists up and toward D. Perform this move in a double stepping, jumping motion.'),
(1042, 2, 1020, 38, 'Land facing toward D to form a left diagonal stance toward D, while executing (full facing) a rising block with a twin palm.'),
(1043, 2, 1020, 39, 'Move the right foot to D in a sliding motion to form a right rear foot stance toward C, while executing (half facing) a side thrust to D with the right elbow. Perform this move in a sliding motion.'),
(1044, 2, 1020, 40, 'While pivoting on the ball of the right foot and turning counterclockwise, form a right bending ready stance type B (half facing) toward C, turning the face toward C. Then execute a middle back piercing kick to D with the left footsword, keeping the hands as they were in the bending ready stance type B (fists held out to the side of the thighs). Perform this move in a slow motion.'),
(1045, 2, 1020, 41, 'Lower the left foot to D in a stamping motion to form a right L-stance toward D, while executing (half facing) a horizontal strike to D with the left backfist, keeping the left arm straight. Perform this move in a stamping motion.'),
(1046, 2, 1020, 42, 'Pull the right foot toward the left foot to form a parallel stance toward D, while executing (full facing) a high inward crosscut to D with the right flat fingertip.'),
(1047, 2, 1020, 43, 'Jump toward D, while executing (full facing) a front punch, and then an upset punch consecutively to D with the right forefist while flying to D. Then land facing toward D, while forming a close stance (full facing) toward D with the right fist extended. Perform this move in a jumping motion.'),
(1048, 2, 1020, 44, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) a front downward strike with the left knife-hand, keeping the left arm straight.'),
(1049, 2, 1020, 45, 'Move the left foot to D to form a left walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(1050, 2, 1020, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot forward onto the AB line to form a parallel stance with a twin side elbow toward D.Remain in this stance until given the at-ease command (swi-eot).'),
(1051, 2, 1021, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type C toward D. Remain in this close ready stance type C toward D until given the command to begin the pattern.'),
(1052, 2, 1021, 1, 'Move the right foot to AC to form a sitting stance toward AD, while executing (full facing) a middle side front pushing block to AD with the left palm.'),
(1053, 2, 1021, 2, 'While maintaining a sitting stance toward AD, execute (full facing) a middle front punch to AD with the right forefist.'),
(1054, 2, 1021, 3, 'Move the right foot onto the CD line to form a right L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D.'),
(1055, 2, 1021, 4, 'While maintaining a right L-stance toward D, execute (half facing) a low block to AD with the right outer forearm and a middle side block to D with the left inner forearm.'),
(1056, 2, 1021, 5, 'Move the left foot to BC to form a sitting stance toward BD, while executing (full facing) a middle side front pushing block to BD with the right palm.'),
(1057, 2, 1021, 6, 'While maintaining a sitting stance toward BD, execute (full facing) a middle front punch to BD with the left forefist.'),
(1058, 2, 1021, 7, 'Move the left foot onto the CD line to form a left L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D.'),
(1059, 2, 1021, 8, 'While maintaining a left L-stance toward D, execute (half facing) a low block to BD with the left outer forearm and a middle side block to D with the right inner forearm.'),
(1060, 2, 1021, 9, 'Pivot on the ball of the left foot to form a left bending ready stance type B (full facing) toward D, turning the face clockwise toward C.'),
(1061, 2, 1021, 10, 'Execute a middle back piercing kick to C with the right footsword, keeping the hands as they were in move 9 above (fists held out to the side of the thighs).'),
(1062, 2, 1021, 11, 'Lower the right foot to C to form a right L-stance toward D, while executing (half facing) a middle block to D with the left knife-hand.'),
(1063, 2, 1021, 12, 'Pivot on the ball of the right foot to form a right bending ready stance type B (full facing) toward D, turning the face counterclockwise toward C.'),
(1064, 2, 1021, 13, 'Execute a middle back piercing kick to C with the left footsword, keeping the hands as they were in move 12 above (fists held out to the side of the thighs).'),
(1065, 2, 1021, 14, 'Lower the left foot to C to form a left L-stance toward D, while executing (half facing) a middle block to D with the right knife-hand.'),
(1066, 2, 1021, 15, 'Move the right foot to C to form a right L-stance toward D, while executing (half facing) a downward thrust to D with a left straight elbow.'),
(1067, 2, 1021, 16, 'Move the left foot to C to form a left L-stance toward D, while executing (half facing) a downward thrust to D with a right straight elbow.'),
(1068, 2, 1021, 17, 'Move the left foot to D to form a left walking stance toward D, while executing (full facing) a pressing block to D with the right palm. Perform this move in a slow motion – sliding the left foot.'),
(1069, 2, 1021, 18, 'Move the right foot to D, to form a right walking stance toward D, while executing (full facing) a pressing block to D with the left palm. Perform this move in a slow motion – sliding the right foot.'),
(1070, 2, 1021, 19, 'Move the right foot to C to form a right L-stance toward D, while executing (half facing) a downward block to D with the left outer forearm.'),
(1071, 2, 1021, 20, 'Move the right foot to D to form a left L-stance toward D, while executing (half facing) a downward block to D with the right outer forearm.'),
(1072, 2, 1021, 21, 'Move the left foot to D to form a right rear foot stance toward D, while executing an upward block (half facing) to D with the left palm.'),
(1073, 2, 1021, 22, 'Move the right foot to D to form a left rear foot stance toward D, while executing an upward block (half facing) to D with the right palm.'),
(1074, 2, 1021, 23, 'Move the right foot to C to form a right rear foot stance toward D, then execute a middle side front snap kick to D with the ball of the left foot, keeping the position of the hands as they were in move 22 above (an upward block with the right palm).'),
(1075, 2, 1021, 24, 'Lower the left foot to D to form a left walking stance toward D, while executing (full facing) a high inward strike to D with a twin knife-hand. Perform moves 24 and 25 in a continuous motion.'),
(1076, 2, 1021, 25, 'While maintaining a left walking stance toward D, execute (full facing) a rising block to D with the left knife-hand.'),
(1077, 2, 1021, 26, 'Pull the left foot toward the right foot to form a right L-stance toward D, while executing a low knife-hand guarding block (half facing) to D.'),
(1078, 2, 1021, 27, 'Slip the left foot to D to form a left walking stance toward D, while executing (full facing) a downward front punch to D with the right forefist to D.'),
(1079, 2, 1021, 28, 'Move the ball of the left foot to the side rear of the right foot, then move the right foot to C in a sliding motion to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D. Perform this move in a double-stepping, sliding motion.'),
(1080, 2, 1021, 29, 'Jump and land on the same spot to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D. Perform this move in a jumping motion.'),
(1081, 2, 1021, 30, 'Move the right foot toward D in a jumping motion (about one and a half shoulder widths in front of the left foot), landing to form a right X-stance toward BD, while executing (half facing) a high side strike to D with the right backfist. Perform this move in a jumping motion.'),
(1082, 2, 1021, 31, 'Move the left foot to C to form a left walking stance toward C, while executing (half facing) a high side block to C with the left outer forearm.'),
(1083, 2, 1021, 32, 'Prior to moving the body, move the ball of the left foot on the CD line (half a shoulder width toward B and half a shoulder width toward D). Then, pivoting on the ball of the left foot and turning clockwise, move the right foot to C to form a right walking stance toward D, while executing (half facing) a high side block to D with the right outer forearm. Perform this move in a spot-turning motion – method one.'),
(1084, 2, 1021, 33, 'Move the left foot to D to form a right L-stance toward D, while executing (half facing) an upset punch to D with the right forefist, pulling the left side fist in front of the right shoulder.'),
(1085, 2, 1021, 34, 'Execute a middle hooking kick to A with the side instep of the right foot, while holding both side fists up and toward A.'),
(1086, 2, 1021, 35, 'Lower the right foot to A to form a left L-stance toward A, while executing (half facing) a high side cross cut to A with the right flat fingertip.');
INSERT INTO `EncyclopediaCount` (`ID`, `EncyclopediaID`, `PatternID`, `Count`, `Text`) VALUES
(1087, 2, 1021, 36, 'Bring the ball of the right foot to the side of the left foot facing D. Then, execute a middle hooking kick to B with the side instep of the left foot, while holding both side fists up and toward B.'),
(1088, 2, 1021, 37, 'Lower the left foot to B to form a right L-stance toward B, while executing (half facing) a high side cross cut to B with the left flat fingertip.'),
(1089, 2, 1021, 38, 'Bring the ball of the left foot to the side of theright foot facing D, then move the right foot to A to form a left L-stance toward A, while executing (half facing) a high knife-hand guarding block to A.'),
(1090, 2, 1021, 39, 'Bring the ball of the right foot to the side of the left foot facing D, then move the left foot to B to form a right L-stance toward B, while executing (half facing) a high knife-hand guarding block to B.'),
(1091, 2, 1021, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot back to the right foot to form a close ready stance type C toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(1092, 2, 1022, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type C toward D. Remain in this close ready stance type C toward D until given the command to begin the pattern.'),
(1093, 2, 1022, 1, 'Move the left foot to D in a sliding motion to form a right L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D. Perform this move in a sliding motion.'),
(1094, 2, 1022, 2, 'Move the right foot to D to form a right walking stance toward D, while executing (half facing) a high block to D with the right double forearm.'),
(1095, 2, 1022, 3, 'Move the left foot to D to form a left walking stance toward D, while executing (half facing) a high side block to D with the right knife-hand, bringing the left finger belly on the right back forearm.'),
(1096, 2, 1022, 4, 'Execute a middle twisting kick to AD with the ball of the right foot, keeping the position of the hands as they were in move 3 above (a high side block with the right knife-hand holding the left finger belly on the right back forearm).'),
(1097, 2, 1022, 5, 'Lower the right foot to D to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(1098, 2, 1022, 6, 'Prior to moving the body, move the ball of the right foot on the CD line (half a shoulder width toward B and half a shoulder width toward C). Then, pivoting on the ball of the right foot, move the left foot to C to form a sitting stance toward B, while executing (full facing) a middle wedging block with the reverse knife-hand. Perform this move in a spot-turning motion - method one.'),
(1099, 2, 1022, 7, 'While pivoting on the ball of the right foot, move the left foot to C to form a left walking stance toward C, while executing (full facing) a low front thrust to C with the right upset fingertip.'),
(1100, 2, 1022, 8, 'Pull the left foot toward the right foot to form a right L-stance toward C, while executing (half facing) a low block to C with the left outer forearm and a high outward block to D with the right outer forearm.'),
(1101, 2, 1022, 9, 'Move the right foot to C to form a sitting stance toward A, while executing (full facing) a middle wedging block with the reverse knife-hands.'),
(1102, 2, 1022, 10, 'Pull the right foot toward the left foot to form a left L-stance toward C, while executing (half facing) a low punch to C with the right double fist.'),
(1103, 2, 1022, 11, 'Move the left foot to C to form a left walking stance toward C, while executing (reverse half facing) a high block to BC with a double arc-hand, looking through the space between the hands.'),
(1104, 2, 1022, 12, 'Move the right foot to C to form a right walking stance toward C, while executing (full facing) a middle front punch to C with the left forefist.'),
(1105, 2, 1022, 13, 'Move the right foot on the CD line to form a right L-stance toward D, while executing (half facing) a low punch to D with the left double fist.'),
(1106, 2, 1022, 14, 'While pivoting on the ball of the right foot and turning counterclockwise, move the left foot to B to form a right L-stance toward B, while executing (half facing) a high reverse knife-hand guarding block to B.'),
(1107, 2, 1022, 15, 'Slip the left foot to B to form a left fixed stance toward B, while executing (half facing) a U-shape block to B.'),
(1108, 2, 1022, 16, 'Execute a sweeping kick to B with the right side sole. Then, lower the right foot to B to form a right fixed stance toward B, while executing (half facing) a U-shape block to B.'),
(1109, 2, 1022, 17, 'Jump and spin around counterclockwise, landing on the same spot to form a left L-stance toward B, while executing (half facing) a middle knife-hand guarding block to B. Perform this move in a jumping motion.'),
(1110, 2, 1022, 18, 'Execute a middle side piercing kick to B with the right footsword, at same time forming a knife-hand guarding block.'),
(1111, 2, 1022, 19, 'Lower the ball of the right foot to the side of the left foot, then move the left foot to A to form a left walking stance toward A, while executing (full facing) a front strike to D with the right elbow, striking the left palm and finger belly with the right elbow.'),
(1112, 2, 1022, 20, 'While pivoting on the ball of the left foot and turning counter clockwise, move the right foot to A to form a left diagonal stance toward D, while thrusting (full facing) to C with the left back elbow, at the same time supporting the left forefist with the right finger belly and turning the face to look over the left shoulder to C.'),
(1113, 2, 1022, 21, 'Pivot on the balls of both feet to form a right walking stance toward AD, while executing (full facing) a pressing block to AD with an X-fist.'),
(1114, 2, 1022, 22, 'Move the left foot to A in a stamping motion to form a sitting stance toward C, while executing (side facing) a W-shape block with the left outer forearm. Perform this move in a stamping motion.'),
(1115, 2, 1022, 23, 'Execute a middle side piercing kick to A with the left footsword, while forming a forearm guarding block toward A.'),
(1116, 2, 1022, 24, 'Lower the left foot on the AB line, then move the right foot to B to form a left L-stance toward B, while executing (half facing) a low knife-hand guarding block to B.'),
(1117, 2, 1022, 25, 'Move the left foot to B to form a right rear foot stance toward B, while executing (half facing) an upward block to B with the left palm.'),
(1118, 2, 1022, 26, 'Move the right foot to B to form a left rear foot stance toward B, while executing (half facing) a pressing block to B with a twin palm.'),
(1119, 2, 1022, 27, 'While pivoting on the ball of the right foot and turning counterclockwise, move the left foot to C in a stamping motion to form a left walking stance toward C, while executing (full facing) an upset punch to C with a twin forefist. Perform this move in a stamping motion.'),
(1120, 2, 1022, 28, 'Move the right foot to C to form a left L-stance toward C, while executing (half facing) a low block to C with the right outer forearm, pulling the left under fist under the left armpit.'),
(1121, 2, 1022, 29, 'While maintaining a left L-stance toward C, execute (half facing) a middle punch to C with the left forefist, bringing the right under fist over the left shoulder.'),
(1122, 2, 1022, 30, 'While pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a left walking stance toward D, while executing (full facing) a middle front block to D with the right outer forearm. Perform moves 30 and 31 in a continuous motion.'),
(1123, 2, 1022, 31, 'While maintaining a left walking stance toward D, execute (full facing) a high front punch to D with the left forefist.'),
(1124, 2, 1022, 32, 'Execute a low front snap kick to D with the ball of the left foot, keeping the position of the hands as they were in move 31 above (a high front punch with the left forefist).'),
(1125, 2, 1022, 33, 'Lower the left foot to D, and then move the right foot to D in a stamping motion to form a right walking stance toward D, while executing (full facing) a high vertical punch to D with a twin forefist. Perform this move in a double-stepping, stamping motion.'),
(1126, 2, 1022, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot to the right foot to form a close ready stance type C toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(1127, 2, 1023, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Warrior Ready Stance type B toward D. Remain in this warrior ready stance type B toward D until given the command to begin the pattern.'),
(1128, 2, 1023, 1, 'Move the left foot to B to form a sitting stance toward D, while extending (full facing) both elbows upward to the sides horizontally.'),
(1129, 2, 1023, 2, 'While sliding to A and maintaining a sitting stance toward D, execute (full facing) an angle punch to C with the left forefist, with the shoulders facing AD. Perform moves 2 and 3 in a fast motion, as well as performing move 2 in a sliding motion.'),
(1130, 2, 1023, 3, 'While sliding to B and maintaining a sitting stance toward D, execute (full facing) an angle punch to C with the right forefist, with the shoulders facing BD. Perform this move in a sliding motion.'),
(1131, 2, 1023, 4, 'While standing up toward D, execute (full facing) a middle hooking block to D with the right palm.'),
(1132, 2, 1023, 5, 'Drop to form a sitting stance toward D, while executing (full facing) a middle front punch to D with the left forefist.'),
(1133, 2, 1023, 6, 'While standing up toward D, execute (full facing) a middle hooking block to D with the left palm.'),
(1134, 2, 1023, 7, 'Drop to form a sitting stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(1135, 2, 1023, 8, 'Move the left foot to BD to form a left walking stance toward BD, while executing (half facing) a high side block to BD with the left outer forearm.'),
(1136, 2, 1023, 9, 'While maintaining a left walking stance toward BD, execute (reverse half facing) a circular block to D with the right inner forearm.'),
(1137, 2, 1023, 10, 'Pivot on the balls of both feet to form a sitting stance toward AD, while executing (full facing) a scooping block to AD with the left palm. Perform moves 10 and 11 in a connecting motion.'),
(1138, 2, 1023, 11, 'While maintaining a sitting stance toward AD, execute (full facing) a middle front punch to AD with the right forefist.'),
(1139, 2, 1023, 12, 'Bring the ball of the left foot to the side of the right foot, then move the right foot to AD to form a right walking stance toward AD, while executing (half facing) a high side block to AD with the right outer forearm.'),
(1140, 2, 1023, 13, 'While maintaining a right walking stance toward AD, execute (reverse half facing) a circular block to D with the left inner forearm.'),
(1141, 2, 1023, 14, 'Pivot on the balls of both feet to form a sitting stance toward BD, while executing (full facing) a scooping block to BD with the right palm. Perform moves 14 and 15 in a connecting motion.'),
(1142, 2, 1023, 15, 'While maintaining a right walking stance toward BD, execute (full facing) a middle front punch to BD with the left forefist.'),
(1143, 2, 1023, 16, 'Pivot on the balls of both feet to form a left walking stance toward BC, while executing (reverse half facing) a high hooking block to BC with the right palm. Perform moves 16 through 19 in a continuous motion.'),
(1144, 2, 1023, 17, 'Pivot on the balls of both feet to form a sitting stance toward BD, while executing (full facing) a middle front punch to BD with the left forefist.'),
(1145, 2, 1023, 18, 'Pivot on the balls of both feet to form a right walking stance toward AD, while executing (reverse half facing) a high hooking block to AD with the left palm.'),
(1146, 2, 1023, 19, 'Pivot on the balls of both feet to form a sitting stance toward BD, while executing (full facing) a middle front punch to BD with the right forefist.'),
(1147, 2, 1023, 20, 'Move the right foot to C to form a left walking stance toward D, while executing (full facing) a pressing block to D with an X-fist. Perform moves 20 and 21 in a continuous motion.'),
(1148, 2, 1023, 21, 'While maintaining a left walking stance toward D, execute (full facing) a rising block with an X-knife-hand.'),
(1149, 2, 1023, 22, 'While maintaining a left walking stance toward D, execute (full facing) a middle front punch to D with the right forefist, slipping the left finger belly up to the right elbow joint.'),
(1150, 2, 1023, 23, 'Execute a low front snap kick to D with the ball of the right foot, keeping the position of the hands as they were in move 22 above (a middle front punch with the right forefist, holding the left finger belly on the right elbow joint).'),
(1151, 2, 1023, 24, 'Lower the right foot to D, to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the left forefist.'),
(1152, 2, 1023, 25, 'While maintaining a right walking stance toward D, execute (full facing) a pressing block to D with an X-fist. Perform moves 25 and 26 in a continuous motion.'),
(1153, 2, 1023, 26, 'While maintaining a right walking stance toward D, execute (full facing) a rising block with an X-knife-hand.'),
(1154, 2, 1023, 27, 'While maintaining a right walking stance toward D, execute (full facing) a middle front punch to D with the left forefist slipping the right finger belly up to the left elbow joint.'),
(1155, 2, 1023, 28, 'Execute a low front snap kick to D with the ball of the left foot, keeping the position of the hands as they were in move 27 above (a middle front punch with the left forefist, holding the right finger belly on the left elbow joint).'),
(1156, 2, 1023, 29, 'Lower the left foot to D to form a left walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(1157, 2, 1023, 30, 'Move the right foot to D to form a left L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(1158, 2, 1023, 31, 'Move the left foot to D to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(1159, 2, 1023, 32, 'Move the left foot to C to form a left L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(1160, 2, 1023, 33, 'Move the right foot to C to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(1161, 2, 1023, 34, 'Move the right foot to D, to form a right walking stance toward D, while executing (half facing) a high block to D with the right double forearm. Perform moves 34 and 35 in a fast motion.'),
(1162, 2, 1023, 35, 'While maintaining a right walking stance toward D, execute (reverse half facing) a low block to D with the left outer forearm, keeping the right forearm as it was in move 34 above (a high right double forearm block).'),
(1163, 2, 1023, 36, 'Move the left foot to D to form a left walking stance toward D, while executing (half facing) a high block to D with the left double forearm. Perform moves 36 and 37 in a fast motion.'),
(1164, 2, 1023, 37, 'While maintaining a left walking stance toward D, execute (reverse half facing) a low block to D with the right outer forearm, keeping the left forearm as it was in move 36 above (a high left double forearm block).'),
(1165, 2, 1023, 38, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(1166, 2, 1023, 39, 'Prior to moving the body, move the ball of the left foot on the CD line (half a shoulder width toward D and half a shoulder width toward E). Then, while pivoting on the ball of the left foot and turning counterclockwise, move the right foot to D to form a right L-stance toward C, while executing (half facing) a high block to C with the left reverse knife-hand. Perform this move in a spot-turning motion - method one.'),
(1167, 2, 1023, 40, 'Bring the right foot to the side of the left foot to form a close ready stance type C toward C.'),
(1168, 2, 1023, 41, 'Move the right foot to CF in a stamping motion to form a right walking stance toward CF, while executing (full facing) an upset punch to CF with a twin forefist. Perform this move in a stamping motion.'),
(1169, 2, 1023, 42, 'Bring the right foot to the side of the left foot. Then move the left foot to CE in a stamping motion, to form a left walking stance toward CE, while executing (full facing) an upset punch to CE with a twin forefist. Perform this move in a stamping motion.'),
(1170, 2, 1023, 43, 'Bring the left foot to the side of the right foot, then move the right foot to F to form a left L-stance toward F, while executing (half facing) a middle block to F with the right inner forearm.'),
(1171, 2, 1023, 44, 'While maintaining a left L-stance toward F, execute (full facing) a middle front punch to F with the left forefist.'),
(1172, 2, 1023, 45, 'Bring the left foot to the side of the right foot to form a close stance toward C, while executing (full facing) an angle punch with the right forefist. Perform this move in a slow motion.'),
(1173, 2, 1023, 46, 'Move the left foot to E to form a right L-stance toward E, while executing (half facing) a middle block to E with the left inner forearm.'),
(1174, 2, 1023, 47, 'While maintaining a right L-stance toward E, execute (half facing) a middle front punch to E with the right forefist.'),
(1175, 2, 1023, 48, 'Bring the right foot to the side of the left foot to form a close stance toward C, while executing (full facing) an angle punch with the left forefist. Perform this move in a slow motion.'),
(1176, 2, 1023, 49, 'Move the left foot to E to form a left fixed stance toward E, while executing (half facing) a U-shape punch to E.'),
(1177, 2, 1023, 50, 'Bring the ball of the left foot to the side of the right foot, then pivoting on the ball of the left foot, move the right foot to E to form a right fixed stance toward E, while executing (half facing) a U-shape punch to E.'),
(1178, 2, 1023, 51, 'Move the right foot on the CD line in a stamping motion to form a sitting stance toward E, while executing (full facing) a high front strike to E with the right backfist, pulling the left backfist under the right elbow. Perform this move in a stamping motion.'),
(1179, 2, 1023, 52, 'Execute a waving kick to E with the right foot, keeping the position of the hands as they were in move 51 above (a high front strike with the right backfist holding the left backfist under the right elbow). Then lower the right foot to C to form a sitting stance toward E, while executing (half facing) a high outward side block to CE with the right outer forearm holding the left backfist under the right elbow.'),
(1180, 2, 1023, 53, 'Execute a waving kick to E with the left foot, keeping the position of the hands as they were in move 52 above (a high outward side block with the right outer forearm with the left backfist under the right elbow). Then lower the left foot to D to form a sitting stance toward E, while executing (full facing) high front block to ED with the right outer forearm holding the left backfist under the right elbow, with the shoulders facing ED.'),
(1181, 2, 1023, 54, 'While maintaining a sitting stance toward E, execute (side facing) a horizontal strike to C with the right backhand, keeping the right arm straight.'),
(1182, 2, 1023, 55, 'Execute a middle crescent kick to C with the sole of the left foot, striking the right palm with the left foot. Perform moves 55 and 56 in a consecutive kicking motion.'),
(1183, 2, 1023, 56, 'Execute a middle side piercing kick to C with the left footsword, forming a forearm guarding block toward C.'),
(1184, 2, 1023, 57, 'Lower the left foot to C to form a sitting stance toward B, while executing (side facing) a horizontal strike to C with the left backhand, keeping the left arm straight.'),
(1185, 2, 1023, 58, 'Execute a middle crescent kick to C with the sole of the right foot, striking the left palm with the right foot. Perform moves 58 and 59 in a consecutive kicking motion.'),
(1186, 2, 1023, 59, 'Execute a middle side piercing kick to C with the right footsword, forming a forearm guarding block toward C.'),
(1187, 2, 1023, 60, 'Lower the right foot to C to form a sitting stance toward A, while executing (full facing) a right 9-shape block.'),
(1188, 2, 1023, 61, 'While maintaining a sitting stance toward A, execute (full facing) a left 9-shape block.'),
(1189, 2, 1023, 62, 'While pivoting on the ball of the right foot and turning clockwise, move the left foot to C to form a sitting stance toward B, while executing (full facing) a right 9-shape block.'),
(1190, 2, 1023, 63, 'While maintaining a sitting stance toward B, execute (full facing) a left 9-shape block.'),
(1191, 2, 1023, 64, 'Pull the left foot toward the right foot to form a left vertical stance toward D, while executing (half facing) a side downward strike to D with the right side fist.'),
(1192, 2, 1023, 65, 'Move the right foot to A to form a left walking stance toward B, while executing (full facing) a high vertical punch to B with a twin forefist.'),
(1193, 2, 1023, 66, 'While pivoting on the ball of the left foot and turning counterclockwise, move the right foot to B to form a left walking stance toward A, while executing (full facing) a high vertical punch to A with a twin forefist.'),
(1194, 2, 1023, 67, 'Bring the right foot to the side of the left foot, then move the left foot to BD to form a right L-stance toward BD, while executing (half facing) a middle knife-hand guarding block to BD.'),
(1195, 2, 1023, 68, 'Bring the ball of the left foot to the side of the right foot, then move the right foot to AD to form a left L-stance toward AD, while executing (half facing) a middle knife-hand guarding block to AD.'),
(1196, 2, 1023, 999, 'END: When the command toreturn to the ready position (ba-ro) is given, bring the right foot back onto the AB line to form a warrior ready stance type B toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(1197, 2, 1024, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type C toward D. Remain in this close ready stance type C toward D until given the command to begin the pattern.'),
(1198, 2, 1024, 1, 'Move the left foot to D to form a right rear foot stance toward D, while executing (half facing) a middle outer forearm guarding block to D.'),
(1199, 2, 1024, 2, 'While maintaining a right rear foot stance toward D, execute (half facing) a high punch to D with the left middle knuckle fist, with the left arm straight and the left side fist facing downward.'),
(1200, 2, 1024, 3, 'Prior to moving the body, move the ball of the left foot on the CD line about 1/2 foot length toward A and 1/4 foot length toward C). Then move the right foot to C to form a left rear foot stance toward C, while executing (half facing) a middle outer forearm guarding block to C. Perform this move in a spot-turning motion - method one'),
(1201, 2, 1024, 4, 'While maintaining a left rear foot stance toward C, execute (half facing) a high punch to C with the right middle knuckle fist, with the right arm straight and the right side fist facing downward.'),
(1202, 2, 1024, 5, 'Prior to moving the body, move the ball of the right foot on the CD line (about 1/2 foot length toward A and 1/4 foot length toward D). Then move the left foot to D to form a left walking stance toward D, while executing (full facing) a rising block to D with the left knife-hand. Perform this move in a spot-turning motion - method one.'),
(1203, 2, 1024, 6, 'While maintaining a left walking stance toward D, execute (reverse half facing) a circular block to AD with the right inner forearm.'),
(1204, 2, 1024, 7, 'While maintaining a left walking stance toward D, execute (full facing) a middle front punch to D with the left forefist.'),
(1205, 2, 1024, 8, 'Prior to moving the body, move the ball of the left foot on the CD line (half a shoulder width toward A and half a shoulder width toward C). Then move the right foot to C to form a right walking stance toward C, while executing (full facing) a rising block to C with the right knife-hand. Perform this move in a spot-turning motion - method one.'),
(1206, 2, 1024, 9, 'While maintaining a right walking stance toward C, execute (reverse half facing) a circular block to AC with the left inner forearm.'),
(1207, 2, 1024, 10, 'While maintaining a right walking stance toward C, execute (full facing) a middle front punch to C with the right forefist.'),
(1208, 2, 1024, 11, 'Prior to moving the body, move the ball of the right foot on the CD line (half a shoulder width toward A and half a shoulder width toward D). Then move the left foot to D to form a right L-stance toward D, while executing (half facing) a low knife-hand guarding block to D. Perform this move in a spot-turning motion - method one.'),
(1209, 2, 1024, 12, 'Execute a middle turning kick to AD with the ball of the right foot, while holding both side fists up and toward AD. Then, lower the ball of the right foot to the side front of the left foot.'),
(1210, 2, 1024, 13, 'While pivoting on the ball of the right foot and turning counterclockwise, execute a high reverse hook kick to D with the back heel of the left foot, while holding both side fists up and toward D. Perform moves 13 and 14 in a consecutive kicking motion.'),
(1211, 2, 1024, 14, 'Execute a middle side piercing kick to D with the left footsword, pulling both hands in the opposite direction to the front of the right chest.'),
(1212, 2, 1024, 15, 'Lower the left foot to D to form a left walking stance toward D, while executing (full facing) a front strike to D with the right elbow, striking the left palm and finger belly with the right elbow.'),
(1213, 2, 1024, 16, 'Prior to moving the body, move the ball of the left foot on the CD line (half a shoulder width toward A and half a shoulder width toward C). Then move the right foot to C to form a left L-stance toward C, while executing (half facing) a low knife-hand guarding block to C. Perform this move in a spot-turning motion - method one.'),
(1214, 2, 1024, 17, 'Execute a middle turning kick to AC with the ball of the left foot, while holding both side fists up and toward AC. Then, lower the ball of the left foot to the side front of the right foot.'),
(1215, 2, 1024, 18, 'While pivoting on the ball of the left foot and turning clockwise, execute a high reverse hook kick to C with the back heel of the right foot, while holding both side fists up and toward C. Perform moves 18 and 19 in a consecutive kicking motion.'),
(1216, 2, 1024, 19, 'Execute a middle side piercing kick to C with the right footsword, pulling both hands in the opposite direction to the front of the left chest.'),
(1217, 2, 1024, 20, 'Lower the right foot to C to form a right walking stance toward C, while executing (full facing) a front strike to C with the left elbow, striking the right palm and finger belly with the left elbow.'),
(1218, 2, 1024, 21, 'Move the left foot to C to form a left walking stance toward C, while executing (full facing) a pressing block to C with the right palm. Perform moves 21 and 22 in a fast motion.'),
(1219, 2, 1024, 22, 'Move the right foot to C to form a right walking stance toward C, while executing (full facing) a pressing block to C with the left palm.'),
(1220, 2, 1024, 23, 'Move the ball of the right foot to the side rear of the left foot, then pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a left walking stance toward D, while executing (full facing) a W-shape block with the knife-hands. Perform this move in a double-stepping, turning motion.'),
(1221, 2, 1024, 24, 'Execute a middle front snap kick to D with the ball of the right foot, keeping the position of the hands as they were in move 23 above (an outward W-shape block with the knife-hands).'),
(1222, 2, 1024, 25, 'Lower the right foot to C to form a right L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D.'),
(1223, 2, 1024, 26, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) a W-shape block with the knife-hands.'),
(1224, 2, 1024, 27, 'Execute a middle front snap kick to D with the ball of the left foot, keeping the position of the hands as they were in move 26 above (an outward W-shape block with the knife-hands).'),
(1225, 2, 1024, 28, 'Lower the left foot to D to form a left L-stance toward C, while executing (half facing) a middle outer forearm guarding block to C.'),
(1226, 2, 1024, 29, 'Move the ball of the left foot to the side front of the right foot, and then pivoting on the ball of the right foot and turning clockwise, move the left foot to C in a sliding motion to form a left L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D. Perform this move in a double-stepping, turning, sliding motion.'),
(1227, 2, 1024, 30, 'Move the left foot to D to form a left walking stance toward D, while executing (full facing) a high front thrust to D with the left flat fingertip.'),
(1228, 2, 1024, 31, 'Prior to moving the body, move the ball of the left foot on the CD line (half a shoulder width toward A and half a shoulder width toward C). Then move the right foot to C to form a right walking stance toward C, while executing (full facing) a high front thrust to C with the right flat fingertip. Perform this move in a spot-turning motion – method one.'),
(1229, 2, 1024, 32, 'While pivoting on the ball of the left foot and turning clockwise, move the right foot to D to form a parallel stance toward B, while executing (full facing) a middle hooking block to B with the right palm.'),
(1230, 2, 1024, 33, 'While maintaining a parallel stance toward B, execute (full facing) a middle front punch to B with the left forefist.'),
(1231, 2, 1024, 34, 'While pivoting on the ball of the left foot and turning clockwise, form (half facing) a left bending ready stance type A toward A, while turning the face toward A.'),
(1232, 2, 1024, 35, 'Execute a middle side piercing kick to A with the right footsword, forming a forearm guarding block toward A.'),
(1233, 2, 1024, 36, 'Lower the right foot to A in a jumping motion, landing to form a right X-stance toward AD, while executing (half facing) a high side strike to A with the right backfist, bringing the left finger belly to the right side fist. Perform this move in jumping motion.'),
(1234, 2, 1024, 37, 'While pivoting on the ball of the left foot and turning clockwise, execute a high reverse hook kick to B with the back heel of the right foot, forming a forearm guarding block with the fists toward B at shoulder level.'),
(1235, 2, 1024, 38, 'Lower the right foot to B in a stamping motion to form a left L-stance toward B, while executing (half facing) a middle outward strike to B with the right knife-hand. Perform this move in a stamping motion.'),
(1236, 2, 1024, 39, 'While pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a parallel stance toward A, while executing (full facing) a middle hooking block to A with the left palm.'),
(1237, 2, 1024, 40, 'While maintaining a parallel stance toward A, execute (full facing) a middle front punch to A with the right forefist.'),
(1238, 2, 1024, 41, 'While pivoting on the ball of the right foot and turning counterclockwise, form (half facing) a right bending ready stance type A toward B, while turning the face toward B.'),
(1239, 2, 1024, 42, 'Execute a middle side piercing kick to B with the left footsword, forming a forearm guarding block toward B.'),
(1240, 2, 1024, 43, 'Lower the left foot to B in a jumping motion, landing to form a left X-stance toward BD, while executing (half facing) a high side strike to B with the left backfist, bringing the right finger belly to the left side fist. Perform this move in jumping motion.'),
(1241, 2, 1024, 44, 'While pivoting on the ball of the right foot and turning counterclockwise, execute a high reverse hook kick to A with the back heel of the left foot, forming a forearm guarding block with the fists toward A at shoulder level.'),
(1242, 2, 1024, 45, 'Lower the left foot to A in a stamping motion to form a right L-stance toward A, while executing (half facing) a middle outward strike to A with the left knife-hand. Perform this move in a stamping motion.'),
(1243, 2, 1024, 46, 'Move the right foot to A in a sliding motion to form a right fixed stance toward A, while executing (half facing) a middle punch to A with the right forefist. Perform this move in a sliding motion.'),
(1244, 2, 1024, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring right foot to the left foot to form a close ready stance type C toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(1245, 2, 1025, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Warrior Ready Stance type A toward D. Remain in this warrior ready stance type A toward D until given the command to begin the pattern.'),
(1246, 2, 1025, 1, 'Move the right foot to C in a sliding motion to form a right L-stance toward D, while executing (half facing) in a circular motion, a low reverse knife-hand guarding block to D. Perform this move in a sliding motion, as well as performing the block in this move in a circular motion.'),
(1247, 2, 1025, 2, 'While pivoting on the ball of the left foot, move the right foot to C to form a left walking stance toward D, while executing (full facing) a high front punch to D with the right long fist. Perform this move in a slow motion – sliding the right foot.'),
(1248, 2, 1025, 3, 'Move the left foot to C in a sliding motion to form a left L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D. Perform this move in a sliding motion.'),
(1249, 2, 1025, 4, 'While jumping toward D (about one and a half shoulder widths), execute a mid-air outward strike to D with the right knife-hand. Then land facing toward D, while forming a left L-stance toward D with the right knife-hand extended (half facing) to D and the right arm slightly bent at the elbow. Perform this move in jumping motion.'),
(1250, 2, 1025, 5, 'While shifting to C and maintaining a left L-stance toward D, execute (half facing) a checking block to D with an X-fist. Perform this move in a shifting motion.'),
(1251, 2, 1025, 6, 'Slip the right foot to D to form a right walking stance toward D, while executing (full facing) a high front outward cross-cut to D with the right flat fingertip.'),
(1252, 2, 1025, 7, 'Pull the right foot toward the left foot to form a left rear foot stance toward D, while executing (half facing) a downward thrust with the right straight elbow.'),
(1253, 2, 1025, 8, 'Move the left foot toward D in a jumping motion (about one and a half shoulder widths), landing to form a left X-stance toward AD, while executing (half facing) a high side strike to D with the left backfist. Perform this move in jumping motion.'),
(1254, 2, 1025, 9, 'Move the right foot to C to form a left walking stance toward D, while executing (reverse half facing) a low outward block to D with the right knife-hand.'),
(1255, 2, 1025, 10, 'Move the right foot on the AB line to form a parallel stance toward D, while executing (full facing) a middle hooking block to D with the left palm.'),
(1256, 2, 1025, 11, 'While maintaining a parallel stance toward D, execute (full facing) a middle front punch to D with the right forefist.'),
(1257, 2, 1025, 12, 'Move the left foot to C in a sliding motion to form a left L-stance toward D, while executing (half facing) in a circular motion, a low reverse knife-hand guarding block to D. Perform this move in a sliding motion, as well as performing the block in this move in a circular motion.'),
(1258, 2, 1025, 13, 'While pivoting on the ball of the right foot, move the left foot to C to form a right walking stance toward D, while executing (full facing) a high front punch to D with the left long fist. Perform this move in a slow motion – sliding the left foot.'),
(1259, 2, 1025, 14, 'Move the right foot to C in a sliding motion to form a right L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D. Perform this move in a sliding motion.'),
(1260, 2, 1025, 15, 'While jumping toward D (about one and a half shoulder widths), execute a mid-air outward strike to D with the left knife-hand. Then land facing toward D, while forming a right L-stance toward D with the left knife-hand extended (half facing) to D and the left arm slightly bent at the elbow. Perform this move in jumping motion.'),
(1261, 2, 1025, 16, 'While shifting to C and maintaining a right L-stance toward D, execute (half facing) a checking block to D with an X-fist. Perform this move in a shifting motion.'),
(1262, 2, 1025, 17, 'Slip the left foot to D to form a left walking stance toward D, while executing (full facing) a high front outward cross-cut to D with the left flat fingertip.'),
(1263, 2, 1025, 18, 'Pull the left foot toward the right foot to form a right rear foot stance toward D, while executing (half facing) a downward thrust with the left straight elbow.'),
(1264, 2, 1025, 19, 'Move the right foot toward D in a jumping motion (about one and a half shoulder widths), landing to form a right X-stance toward BD, while executing (half facing) a high side strike to D with the right backfist. Perform this move in jumping motion.'),
(1265, 2, 1025, 20, 'Move the left foot to C to form a right walking stance toward D, while executing (half facing) a low outward block to D with the left knife-hand.'),
(1266, 2, 1025, 21, 'Move the left foot on the AB line to form a parallel stance toward D, while executing (full facing) a middle hooking block to D with the right palm.'),
(1267, 2, 1025, 22, 'While maintaining a parallel stance toward D, execute (full facing) a middle front punch to D with the left forefist.'),
(1268, 2, 1025, 23, 'Move the right foot to A to form a sitting stance toward D, while executing (full facing) a W-shape block with the reverse knife-hands.'),
(1269, 2, 1025, 24, 'Cross the ball of the left foot over the right foot to form a right X-stance toward D, while executing (full facing) a horizontal thrust with a twin elbow.'),
(1270, 2, 1025, 25, 'Move the right foot to A to form a sitting stance toward D, while executing (full facing) a checking block to D with a twin straight forearm.'),
(1271, 2, 1025, 26, 'Cross the ball of the left foot over the right foot to form a right X-stance toward D, while executing (full facing) an upward punch with the right forefist, pulling the left side fist in front of the right shoulder.'),
(1272, 2, 1025, 27, 'While pivoting on the ball of the left foot and turning clockwise, execute a high reverse hook kick to B with the back heel of the right foot, while holding both side fists up and toward B.'),
(1273, 2, 1025, 28, 'Lower the ball of the right foot to B, and then pivoting on the ball of the right foot and turning clockwise, execute a high side piercing kick to B with the left footsword, pulling both hands in the opposite direction in front of the right chest.'),
(1274, 2, 1025, 29, 'Lower the left foot to B in a jumping motion, landing to form a left X-stance toward BD, while executing (half facing) a downward strike to B with the left backfist. Perform this move in a jumping motion.'),
(1275, 2, 1025, 30, 'Move the left foot to B to form a sitting stance toward D, while executing (full facing) a W-shape block with the reverse knife-hands.'),
(1276, 2, 1025, 31, 'Cross the ball of the right foot over the left foot to form a left X-stance toward D, while executing (full facing) a horizontal thrust with a twin elbow.'),
(1277, 2, 1025, 32, 'Move the left foot to B to form a sitting stance toward D, while executing (full facing) a checking block to D with a twin straight forearm.'),
(1278, 2, 1025, 33, 'Cross the ball of the right foot over the left foot to form a left X-stance toward D, while executing (full facing) an upward punch with the left forefist, pulling the right side fist in front of the left shoulder.'),
(1279, 2, 1025, 34, 'While pivoting on the ball of the right foot and turning counterclockwise, execute a high reverse hook kick to A with the back heel of the left foot, while holding both side fists up and toward A.'),
(1280, 2, 1025, 35, 'Lower the ball of the left foot to A, and then pivoting on the ball of the left foot and turning counterclockwise, execute a high side piercing kick to B with the right footsword, pulling both hands in the opposite direction in front of the left chest.'),
(1281, 2, 1025, 36, 'Lower the right foot to A in a jumping motion, landing to form a right X-stance toward AD, while executing (half facing) a downward strike to A with the right backfist. Perform this move in a jumping motion.'),
(1282, 2, 1025, 37, 'Move the left foot to C to form a left L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D.'),
(1283, 2, 1025, 38, 'While pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a left rear foot stance toward C, while executing (half facing) a waist block to C with the right inner forearm.'),
(1284, 2, 1025, 39, 'Move the right foot to C slightly, and then move the left foot to D in a stamping motion to form a right L-stance toward D, while executing (half facing) a high outward strike to D with the left knife-hand. Perform this move in a stamping motion.'),
(1285, 2, 1025, 40, 'While shifting to C and maintaining a right L-stance toward D, execute (half facing) a middle outer forearm guarding block to D. Perform this move in a shifting motion.'),
(1286, 2, 1025, 41, 'While pivoting on the ball of the left foot and turning clockwise, move the right foot to D to form a right rear foot stance toward C, while executing (half facing) a waist block to C with the left inner forearm.'),
(1287, 2, 1025, 42, 'Move the left foot to C slightly, and then move the right foot to D in a stamping motion to form a left L-stance toward D, while executing (half facing) a high outward strike to D with the right knife-hand. Perform this move in a stamping motion.'),
(1288, 2, 1025, 43, 'While pivoting on the ball of the left foot and turning counterclockwise, move the right foot to C to form a right L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D.'),
(1289, 2, 1025, 44, 'Jump and spin around clockwise, to execute a mid-air 180o back piercing kick to D with the right footsword, while holding both side fists up and toward D. Then, land facing toward D to form a left L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D. Perform this move in a jumping motion.'),
(1290, 2, 1025, 45, 'Jump and spin around counterclockwise, to execute a mid-air 180o back piercing kick to D with the left footsword, while holding both side fists up and toward D. Then, land facing toward D to form a right L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D. Perform this move in a jumping motion.'),
(1291, 2, 1025, 46, 'Slip the right foot to C to form a left walking stance toward D, while executing (full facing) a low inward block to D with the right reverse knife-hand, pulling the left side fist in front of the right shoulder.'),
(1292, 2, 1025, 47, 'Move the left foot to C in a sliding motion to form a left L-stance toward D, while thrusting (half facing) to C with the left side elbow. Perform this move in sliding motion.'),
(1293, 2, 1025, 48, 'Slip the left foot to C to form a right walking stance toward D, while executing (full facing) a low inward block to D with the left reverse knife-hand, pulling the right side fist in front of the left shoulder.'),
(1294, 2, 1025, 49, 'Move the right foot to C in a sliding motion to form a right L-stance toward D, while thrusting (half facing) to C with the right side elbow. Perform this move in sliding motion.'),
(1295, 2, 1025, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot forward onto the AB line to form a warrior ready stance type A toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(1296, 2, 1026, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Stance with an X-Backhand toward D. Remain in this parallel stance with an X-backhand toward D until given the command to begin the pattern.'),
(1297, 2, 1026, 1, 'Move the left foot to C to form a right walking stance toward D, while executing (full facing) a horizontal strike with twin side fists, keeping both arms straight.'),
(1298, 2, 1026, 2, 'Move the right foot to C to form a left walking stance toward D, while executing (full facing) a pressing block to D with an X-fist. Perform moves 2 and 3 in a continuous motion.'),
(1299, 2, 1026, 3, 'While maintaining a left walking stance toward D, execute a rising block (full facing) with an X-knife-hand.'),
(1300, 2, 1026, 4, 'While maintaining a left walking stance toward D, execute (full facing) a high front strike to D with the right knife-hand, bringing the left finger belly on the right elbow joint.'),
(1301, 2, 1026, 5, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to C to form a sitting stance toward B, while executing (side facing) a horizontal strike to C with the left backhand, keeping the left arm straight.'),
(1302, 2, 1026, 6, 'Execute a middle crescent kick to C with the sole of the right foot, striking the left palm with the right foot.'),
(1303, 2, 1026, 7, 'Lower the right foot to C to form a sitting stance toward A, while executing (full facing) a front strike to A with the right elbow, striking the left palm and finger belly with the right elbow.'),
(1304, 2, 1026, 8, 'While maintaining a sitting stance toward A, thrust (full facing) to B with the left back elbow, placing the right side fist on the left under fist.'),
(1305, 2, 1026, 9, 'While maintaining a sitting stance toward A, execute (full facing) a side back strike to B with the right backfist and extending the left arm to the side-downward.'),
(1306, 2, 1026, 10, 'Bring the left foot to the side of the right foot, to form a close stance toward D, while thrusting (full facing) with a twin side elbow.'),
(1307, 2, 1026, 11, 'Cross the left foot over the right foot, to form (full facing) a right X-stance toward D, turning the face toward A and keeping the position of the hands as they were in move 10 above (a twin side elbow thrust). Perform this move in a fast motion.'),
(1308, 2, 1026, 12, 'Execute a middle side piercing kick to A with the right footsword, keeping the position of the hands as they were in move 11 above (a twin side elbow thrust).'),
(1309, 2, 1026, 13, 'Lower the ball of the right foot to A, then cross the left foot over the right foot to form a right X-stance toward D, while executing (full facing) a horizontal thrust with a twin elbow, turning the face toward A.'),
(1310, 2, 1026, 14, 'Move the right foot to A to form the sitting stance toward D, while executing (side facing) a right horizontal punch to A with the forefists.'),
(1311, 2, 1026, 15, 'While standing up toward D, execute (full facing) a high front strike to D with right knife-hand, bringing the left backhand in front of the forehead.'),
(1312, 2, 1026, 16, 'While pivoting on the ball of the right foot, move the left foot to B to form a right L-stance toward B, while executing (half facing) a twin knife-hand block to B.'),
(1313, 2, 1026, 17, 'Jump and spin around clockwise, to execute a mid-air 180o back piercing kick to B with the right footsword, while holding both side fists up and toward B. Perform this move in a jumping motion.'),
(1314, 2, 1026, 18, 'Land facing toward B to form a right walking stance toward B, while executing (half facing) a middle block to B with the right double forearm.'),
(1315, 2, 1026, 19, 'Bring the left foot to the side of the right foot to form a (full facing) close ready stance type B toward D.'),
(1316, 2, 1026, 20, 'Move the right foot toward D in a jumping motion (about one and a half shoulder widths), landing to form a right X-stance toward BD, while executing (half facing) a high side strike to D with the right backfist, placing the left finger belly on the right side fist. Perform this move in a jumping motion.'),
(1317, 2, 1026, 21, 'Move the left foot to C to form a right walking stance toward D, while executing (full facing) a rising block with the left outer forearm.'),
(1318, 2, 1026, 22, 'Execute a middle front snap kick to D with the ball of the left foot, keeping the position of the hands as they were in move 21 above (a rising block with the left outer forearm).'),
(1319, 2, 1026, 23, 'Lower the left foot to D to form a left walking stance toward D, while executing (full facing) a high front punch to D with the right forefist.'),
(1320, 2, 1026, 24, 'Move the right foot to D to form a right walking stance toward D, while executing (full facing) a middle front thrust to D with the right straight fingertip, pulling the back of the left fingertips under the right elbow.'),
(1321, 2, 1026, 25, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a sitting stance toward A, while executing (side facing) a high side strike to D with the left backfist.');
INSERT INTO `EncyclopediaCount` (`ID`, `EncyclopediaID`, `PatternID`, `Count`, `Text`) VALUES
(1322, 2, 1026, 26, 'Pivoting on the ball of the left foot and turning counterclockwise, move the right foot to F to form a (full facing) right walking ready stance toward F.'),
(1323, 2, 1026, 27, 'Jump to execute a flying high kick to F with the ball of the right foot, while holding both side fists up and toward F. Perform this move in a jumping motion.'),
(1324, 2, 1026, 28, 'Land facing toward F to form a right fixed stance toward F, while executing (half facing) a checking block to F with an X-knife-hand.'),
(1325, 2, 1026, 29, 'Move the left foot to F to form a right L-stance toward F, while executing (half facing) a pressing block to F with an X-fist.'),
(1326, 2, 1026, 30, 'Execute a middle side front snap kick to F with the ball of the left foot, while executing (full facing) a middle wedging block with the inner forearms.'),
(1327, 2, 1026, 31, 'Lower the left foot to F to form a left walking stance toward F, while executing (full facing) a high vertical punch to F with a twin forefist.'),
(1328, 2, 1026, 32, 'Move the right foot to F to form a right fixed stance toward F, while executing (half facing) a middle outward block to F with the right knife-hand and a middle pushing block to F with the left palm.'),
(1329, 2, 1026, 33, 'Move the left foot to F in a sliding motion to form a right L-stance toward F, while executing (half facing) a middle punch to F with the left forefist. Perform this move in a sliding motion.'),
(1330, 2, 1026, 34, 'Move the ball of the left foot to the side rear of the right foot, then move the right foot to E to form aright L-stance toward F. Then, jumping toward E (about one and a half shoulder widths), land facing toward F to form a right L-stance toward F, while executing (half facing) a middle outer forearm guarding block to F. Perform this move in a double-stepping, jumping motion.'),
(1331, 2, 1026, 35, 'Execute a middle turning kick to DF with the ball of the right foot, while holding both side fists up and toward DF.'),
(1332, 2, 1026, 36, 'Lower the ball of the right foot to F with the right foot facing F, then pivoting on the ball of the right foot, execute a middle back piercing kick to F with the left footsword, while holding both side fists up and toward F.'),
(1333, 2, 1026, 37, 'Lower the left foot to F to form a right L-stance toward F, while executing (half facing) a middle outer forearm guarding block to F.'),
(1334, 2, 1026, 38, 'Move the left foot to E to form a left L-stance toward F, while executing (half facing) an upward block to F with the right palm.'),
(1335, 2, 1026, 39, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to E to form a right walking stance to E, while executing (reverse half facing) a circular block to ED with the left inner forearm.'),
(1336, 2, 1026, 40, 'Pivot on the balls of both feet to form a right walking stance toward DF, while executing (reverse half facing) a circular block to D with the right inner forearm, while forming a right walking stance toward DF.'),
(1337, 2, 1026, 41, 'Move the left foot on the EF line to form a sitting stance toward D, while executing (full facing) a middle front punch to D with the left forefist.'),
(1338, 2, 1026, 42, 'While maintaining a sitting stance toward D, execute (full facing) a middle front punch to D with the right forefist.'),
(1339, 2, 1026, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot toward the right foot to form a parallel stance with an X-backhand toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(1340, 2, 1027, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Ready Stance toward D. Remain in this parallel ready stance toward D until given the command to begin the pattern.'),
(1341, 2, 1027, 1, 'Form (half facing) a right bending ready stance type A toward B, while turning the face toward B. Perform this move in a slow motion.'),
(1342, 2, 1027, 2, 'Execute a high side piercing kick to B with the left footsword. At the same time, execute a high side punch to B with the left forefist. Perform moves 2 and 3 in a double kicking motion, as well as performing move 2 in a slow motion and move 3 at regular speed.'),
(1343, 2, 1027, 3, 'Execute a high side piercing kick to B with the left footsword. At the sa me time, execute a high side punch to B with the left forefist.'),
(1344, 2, 1027, 4, 'Lower the left foot to B to form a sitting stance toward D, while executing (full facing) a middle side front thrust to D with the right flat fingertip.'),
(1345, 2, 1027, 5, 'While pivoting on the ball of the left foot and turning clockwise, execute a high reverse hook kick to B with the back heel of the right foot, while holding both side fists up and toward B. Perform this move in a slow motion.'),
(1346, 2, 1027, 6, 'Lower the right foot to B in a jumping motion, landing to form a right X-stance toward C, while executing (side facing) a middle side strike to B with the right knife-hand. Perform this move in jumping motion.'),
(1347, 2, 1027, 7, 'Move the left foot to A to form a left walking stance toward A, while executing (full facing) a pressing block to A with the right palm.'),
(1348, 2, 1027, 8, 'Move the right foot to A to form a right walking stance toward A, while executing (full facing) a pressing block to A with the left palm.'),
(1349, 2, 1027, 9, 'Pull the left reverse footsword to the right knee joint to form a right one-leg stance toward D, while executing (full facing) a high side block to B with the left knife-hand and a low side block to A with the right knife-hand.Perform this move in a slow motion.'),
(1350, 2, 1027, 10, 'Lower the left foot to the side of the right foot, then form a left bending ready stance type A (half facing) toward A, while turning the face toward A. Perform this move in a slow motion.'),
(1351, 2, 1027, 11, 'Execute a high side piercing kick to A with the right footsword. At the same time, execute a high side punch to A with the right forefist. Perform moves 11 and 12 in a double kicking motion, as well as performing move 11 in a slow motion and move 12 at regular speed.'),
(1352, 2, 1027, 12, 'Execute a high side piercing kick to A with the right footsword. At the same time, execute a high side punch to A with the right forefist.'),
(1353, 2, 1027, 13, 'Lower the right foot to A to form a sitting stance toward D, while executing a middle side front thrust (full facing) to D with the left flat fingertip.'),
(1354, 2, 1027, 14, 'While pivoting on the ball of the right foot and turning counterclockwise, execute a high reverse hook kick to A with the back heel of the left foot, while holding both side fists up and toward A. Perform this move in a slow motion.'),
(1355, 2, 1027, 15, 'Lower the left foot to A in a jumping motion, landing to form a left X-stance toward C, while executing (side facing) a middle side strike to A with the left knife-hand. Perform this move in jumping motion.'),
(1356, 2, 1027, 16, 'Move the right foot to B to form a right walking stance toward B, while executing (full facing) a pressing block to B with the left palm.'),
(1357, 2, 1027, 17, 'Move the left foot to B to form a left walking stance toward B, while executing (full facing) a pressing block to B with the right palm.'),
(1358, 2, 1027, 18, 'Pull the right reverse footsword to the left knee joint to form a left one-leg stance toward D, while executing (full facing) a high side block to A with the right knife-hand and a low side block to B with the left knife-hand. Perform this move in a slow motion.'),
(1359, 2, 1027, 19, 'Form (full facing) a left bending ready stance type B toward D, while turning the face toward C.'),
(1360, 2, 1027, 20, 'Execute a high back piercing kick to C with the right footsword, keeping the hands as they were in move 19 above (fists held out to the side of the thighs). Perform this move in a slow motion.'),
(1361, 2, 1027, 21, 'Lower the right foot to C to form a left walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(1362, 2, 1027, 22, 'Form (full facing) a right bending ready stance type B toward D, while turning the face toward C.'),
(1363, 2, 1027, 23, 'Execute a high back piercing kick to C with the left footsword, keeping the hands as they were in move 22 above (fists held out to the side of the thighs). Perform this move in a slow motion.'),
(1364, 2, 1027, 24, 'Lower the left foot to C to form a right walking stance toward D, while executing (full facing) a middle front punch to D with the left forefist.'),
(1365, 2, 1027, 25, 'Move the right foot to C in a sliding motion to form a right rear foot stance toward D, while executing (half facing) a downward block with the left palm. Perform this move in a sliding motion.'),
(1366, 2, 1027, 26, 'Execute a middle side front snap kick to D with the ball of the left foot, keeping the position of the hands as they were in move 25 above (a downward block with the left palm).'),
(1367, 2, 1027, 27, 'Lower the ball of the left foot to D, and then move the right foot to C in a stamping motion to form a sitting stance toward A, while executing (side facing) a middle side strike to C with the right side fist. Perform this move in a stamping motion.'),
(1368, 2, 1027, 28, 'While sliding to C and maintaining a sitting stance toward A, execute (full facing) a scooping block with the left palm. Perform move 28 in a sliding motion, as well as performing moves 28 and 29 in a connecting motion.'),
(1369, 2, 1027, 29, 'While maintaining a sitting stance toward A, execute (full facing) a middle front punch to A with the right forefist.'),
(1370, 2, 1027, 30, 'While maintaining a sitting stance toward A, execute (side facing) a low side block to D with the left knife-hand.'),
(1371, 2, 1027, 31, 'Move the left foot toward C in a quick skipping motion (just beyond where the right foot had been), while executing a middle side pushing kick to C with the right footsword, while holding both side fists up and toward C. Perform this move in a skipping motion.'),
(1372, 2, 1027, 32, 'Lower the ball of the right foot to C, then pivoting on the ball of the right foot and turning counterclockwise, execute a high reverse turning kick to C with the back heel of the left foot, while holding both side fists up and toward C.'),
(1373, 2, 1027, 33, 'Lower the left foot to C to form a left walking stance toward C, while executing (half facing) a high side block to C with the left knife-hand.'),
(1374, 2, 1027, 34, 'Move the left foot to Din a sliding motion to form a left rear foot stance toward C, while executing (half facing) a downward block with the right palm. Perform this move in a sliding motion.'),
(1375, 2, 1027, 35, 'Execute a middle side front snap kick to C with the ball of the right foot, keeping the position of the hands as they were in move 34 above (a downward block with the right palm).'),
(1376, 2, 1027, 36, 'Lower the ball of the right foot to C, and then move the left foot to D in a stamping motion to form a sitting stance toward A, while executing (side facing) a middle side strike to D with the left side fist. Perform this move in a stamping motion.'),
(1377, 2, 1027, 37, 'While sliding to D and maintaining a sitting stance toward A, execute (full facing) a scooping block with the right palm. Perform move 37 in a sliding motion, as well as performing moves 37and 38 in a connecting motion.'),
(1378, 2, 1027, 38, 'While maintaining a sitting stance toward A, execute (full facing) a middle front punch to A with the left forefist.'),
(1379, 2, 1027, 39, 'While maintaining a sitting stance toward A, execute (side facing) a low side block to C with the right knife-hand.'),
(1380, 2, 1027, 40, 'Move the right foot toward D in a quick skipping motion (just beyond where the left foot had been), while executing a middle side pushing kick to D with the left footsword, while holding both side fists up and toward D. Perform this move in a skipping motion.'),
(1381, 2, 1027, 41, 'Lower the ball of the left foot to D, and then pivoting on the ball of the left foot and turning clockwise, execute a high reverse turning kick to D with the back heel of the right foot, while holding both side fists up and toward D.'),
(1382, 2, 1027, 42, 'Lower the right foot to D to form a right walking stance toward D, while executing (half facing) a high side block to D with the right knife-hand.'),
(1383, 2, 1027, 43, 'Move the left foot to D, and then execute a high twisting kick to AD with the ball of the right foot, keeping the hands as they were in move 42 above (a high side block with the right knife-hand). Perform this move in a stepping motion.'),
(1384, 2, 1027, 44, 'Lower the right foot to C to form a left walking stance toward D,while executing (half facing) a side back strike to C with the rightbackfist, extending the left fist to D.'),
(1385, 2, 1027, 45, 'While shifting to C and maintaining a left walking stance toward D,execute (full facing) a high front strike to D with the rightbackfist, pulling the left backfist under the right elbow. Perform this move in a shifting motion.'),
(1386, 2, 1027, 46, 'Move the right foot to D, and then execute a high twisting kick to BDw ith the ball of the left foot, keeping the position of the hands as they werein move 45 above (a high front strike with the right backfist with the leftbackfist under the right elbow). Perform this move in a stepping motion.'),
(1387, 2, 1027, 47, 'Lower the left foot to C to form a right walking stance toward D, while executing (half facing) a side back strike to C with the left backfist, extending the right fist to D.'),
(1388, 2, 1027, 48, 'While shifting to C and maintaining a right walking stance toward D, execute (full facing) a high front strike to D with the left backfist, pulling the right backfist under the left elbow. Perform this move in a shifting motion.'),
(1389, 2, 1027, 49, 'Execute a sweeping kick to D with the side sole of the left foot, keeping the position of the hands as they were in move 48 above (a high front strike with the left backfist with the right backfist under the left elbow).Then lower left foot to D to form a right L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D.'),
(1390, 2, 1027, 50, 'Execute a side checking kick to D with the left footsword, at the same time forming an outer forearm guarding block. Then execute a middle side thrusting kick to D with the ball of the left foot, at the same time forming an outer forearm guarding block. Perform both kicks in this move in a consecutive kicking motion.'),
(1391, 2, 1027, 51, 'Lower the left foot to D to form a right L-stance toward D, while executing (half facing) a middle outward strike to D with the left knife-hand.'),
(1392, 2, 1027, 52, 'Execute a sweeping kick to D with the side sole of the right foot, keeping the position of the hands as they were in move 51 above (a middle outward strike with the left knife-hand). Then lower the right foot to D to form a left L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D.'),
(1393, 2, 1027, 53, 'Execute a side checking kick to D with the right footsword, at thesame time forming an outer forearm guarding block.Then execute a middle sidethrusting kick to D with the ball of the right foot, at the same time forming anouter forearm guarding block. Perform both kicks in this move in a consecutive kicking motion.'),
(1394, 2, 1027, 54, 'Lower the right foot to D to form a left L-stance toward D, while executing (half facing) a middle outward strike to D with the right knife-hand.'),
(1395, 2, 1027, 55, 'Move the ball of the right foot to the side rear of the left foot, then pivoting on the ball of the right foot and turning counterclockwise, move the left foot to C to form a left walking stance toward C, while executing (full facing) a middle front punch to C with the right forefist. Perform this move in a double-stepping, turning motion.'),
(1396, 2, 1027, 56, 'Move the right foot toward C (about a shoulder width) in a jumping motion, landing to form a right X-stance toward AC, while executing (half facing) a low punch to C with the left forefist, pulling the right under fist in front of the left shoulder. Perform this move in a jumping motion.'),
(1397, 2, 1027, 57, 'Move the left foot toward D (about a shoulder width) in a jumping motion, landing to form a left X-stance toward AD, while executing (half facing) a low punch to D with the right forefist, pulling the left under fist in front of the right shoulder. Perform this move in a jumping motion.'),
(1398, 2, 1027, 58, 'Jump and spin around clockwise, to execute a mid-air 180o back piercing kick to D with the right footsword, while holding both side fists up and toward D. Perform this move in a jumping motion.'),
(1399, 2, 1027, 59, 'Land on the same spot to forma left L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D.'),
(1400, 2, 1027, 60, 'Move the right foot to the side rear of the left foot, then move the left foot to C to form a right walking stance toward D, while executing (full facing) a rising block with the left arc-hand, palm facing outward. Perform this move in a double stepping motion.'),
(1401, 2, 1027, 61, 'While maintaining a right walking stance toward D, execute (full facing) a high front punch to D with the right forefist.'),
(1402, 2, 1027, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot back onto the AB line to form a parallel ready stance toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(1403, 2, 1028, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type A toward D. Remain in this close ready stance type A toward D until given the command to begin the pattern.'),
(1404, 2, 1028, 1, 'Move the right foot to C in a sliding motion to form a right rear foot stance toward D, while executing (half facing) a middle outer forearm guarding block to D. Perform this move in a sliding motion.'),
(1405, 2, 1028, 2, 'Slip the left foot to D to form a left walking stance toward D, stance while executing (full facing) a middle vertical punch to D with the right forefist.'),
(1406, 2, 1028, 3, 'Move the left foot to C in a sliding motion to form a left rear foot stance stance toward D, while executing (half facing) a middle outer forearm stance guarding block to D. Perform this move in a sliding motion.'),
(1407, 2, 1028, 4, 'Slip the right foot to D to form a right walking stance toward D, stance while executing (full facing) a middle vertical punch to D with the left forefist.'),
(1408, 2, 1028, 5, 'Pivot on the balls of both feet to form a left walking stance toward BC, stance while executing (half facing) a high side block to B with the right knife-hand. Perform moves 5 and 6 in a fast motion.'),
(1409, 2, 1028, 6, 'Pivot on the balls of both feet to form a sitting stance toward BD, stance while executing (full facing) a middle front punch to BD with the left forefist.'),
(1410, 2, 1028, 7, 'Pivot on the balls of both feet to form a right walking stance toward D, stance while executing (half facing) a high side block to D with the left knife-hand. Perform moves 7 and 8 in a fast motion.'),
(1411, 2, 1028, 8, 'Pivot on the balls of both feet to form a sitting stance toward BD, stance while executing (full facing) a middle front punch to BD with the right forefist.'),
(1412, 2, 1028, 9, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot stance to C to form a parallel stance toward A, while executing (full facing) stance a horizontal strike with a twin knife-hand.'),
(1413, 2, 1028, 10, 'Execute a high side piercing kick to C with the right footsword, keeping stance the position of the hands as they were in move 9 above (a horizontal stance strike with a twin knife-hand). Perform move 10 and 11 in a consecutive kicking motion.'),
(1414, 2, 1028, 11, 'Execute a high turning kick to D with the ball of the right foot, while holding both side fists up and toward D.'),
(1415, 2, 1028, 12, 'Lower the right foot to D in a jumping motion, landing to form a right X-stance toward BD, while executing (half facing) a high side strike to D with the right backfist, bringing the left finger belly to the right side fist. Perform this move in a jumping motion.'),
(1416, 2, 1028, 13, 'Move the left foot to C to form a parallel stance toward B, while executing (full facing) a horizontal strike with a twin knife-hand.'),
(1417, 2, 1028, 14, 'Execute a high side piercing kick to C with the left footsword, keeping the position of the hands as they were in move 13 above (a horizontal strike with a twin knife-hand). Perform move 14 and 15 in a consecutive kicking motion.'),
(1418, 2, 1028, 15, 'Execute a high turning kick to D with the ball of the left foot, while holding both side fists up and toward D.'),
(1419, 2, 1028, 16, 'Lower the left foot to D in a jumping motion, landing to form a left X-stance toward AD, while executing (half facing) a high side strike to D with the left backfist, bringing the right finger belly to the left side fist. Perform this move in jumping motion.'),
(1420, 2, 1028, 17, 'Move the left foot to A to form a right L-stance toward A, while executing (half facing) a low punch to A with a left double fist.'),
(1421, 2, 1028, 18, 'Slip the left foot to A to form a left walking stance toward A, bringing the right finger belly on the left forefist, then (full facing) twist both hands counterclockwise until the left backfist faces downward. Perform this move in a releasing motion.'),
(1422, 2, 1028, 19, 'While maintaining a left walking stance toward A, execute (full facing) a high front punch to A with the right forefist.'),
(1423, 2, 1028, 20, 'Prior to moving the body, move the ball of the left foot on the AB line (about 2/3 shoulder width toward C and 1/2 shoulder width toward B). Then, while pivoting on the ball of the left foot and turning clockwise, move the right foot to B to form a left L-stance toward B, while executing (half facing) a low punch to B with a right double fist.'),
(1424, 2, 1028, 21, 'Slip the right foot to B to form a right walking stance toward B, bringing the left finger belly on the right forefist, then (full facing) twist both hands clockwise until the right backfist faces downward. Perform this move in a releasing motion.'),
(1425, 2, 1028, 22, 'While maintaining a right walking stance toward B, execute (full facing) a high front punch to B with the left forefist.'),
(1426, 2, 1028, 23, 'Move the left foot to B in a sliding motion to form a right L-stance toward B, while executing (full facing) an upset punch to B with the right middle knuckle fist, pulling the left side fist in front of the right shoulder. Perform this move in a sliding motion.'),
(1427, 2, 1028, 24, 'Slip the right foot to A to form a left walking stance toward B, while executing (full facing) a front strike to B with the right backfist, pulling the left backfist under the right elbow.'),
(1428, 2, 1028, 25, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to A in a sliding motion to form a left L-stance toward A, while executing (full facing) an upset punch to A with the left middle knuckle fist, pulling the right side fist in front of the left shoulder. Perform this move in a sliding motion.'),
(1429, 2, 1028, 26, 'Slip the left foot to B to form a right walking stance toward A, while executing (full facing) a front strike to A with the left backfist, pulling the right backfist under the left elbow.'),
(1430, 2, 1028, 27, 'Move the left foot to D to form a right walking ready stance (full facing) toward C.'),
(1431, 2, 1028, 28, 'Jump to execute a flying front snap kick to C with the ball of the right foot. Perform this move in a jumping motion.'),
(1432, 2, 1028, 29, 'Land facing toward C to form a left L-stance toward C, while executing (half facing) a middle knife-hand guarding block to C.'),
(1433, 2, 1028, 30, 'Move the right foot to D to form a left walking stance toward C, while executing (full facing) a high front block with the right outer forearm.'),
(1434, 2, 1028, 31, 'While shifting to C and maintaining a left walking stance toward C, execute (full facing) a middle front punch to C with the left forefist. Perform this move in a shifting motion.'),
(1435, 2, 1028, 32, 'While pivoting on the ball of the left foot and turning clockwise, move the right foot to D to form a right walking stance toward D, while executing (full facing) high front block to D with the left outer forearm.'),
(1436, 2, 1028, 33, 'While shifting to D and maintaining a right walking stance toward D, execute (full facing) a middle front punch to D with the right forefist. Perform this move in a shifting motion.'),
(1437, 2, 1028, 34, 'Pivot on the balls of both feet to form a left walking stance toward BC, while executing (reverse half facing) a middle block to BC with a double arc-hand, looking through the space between the hands.'),
(1438, 2, 1028, 35, 'While maintaining a left walking stance toward BC, execute (full facing) a high inward strike to BC with the right knife-hand, pulling the left side fist in front of the right shoulder.'),
(1439, 2, 1028, 36, 'Pivot on the balls of both feet to form a right walking stance toward D, while executing (reverse half facing) a circular block to BD with the left inner forearm.'),
(1440, 2, 1028, 37, 'While maintaining a right walking stance toward D, execute (full facing) a high front punch to D with the right forefist.'),
(1441, 2, 1028, 38, 'Execute a low front snap kick to D with the ball of the left foot, keeping the position of the hands as they were in move 37 above (a high front punch with the right forefist).'),
(1442, 2, 1028, 39, 'Lower the left foot to D to form a left walking stance toward D, while executing (full facing) a middle front punch to D with the left forefist. Perform moves 39 and 40 in a fast motion.'),
(1443, 2, 1028, 40, 'While maintaining a left walking stance toward D, execute (full facing) a middle front punch to D with the right forefist.'),
(1444, 2, 1028, 41, 'While maintaining a left walking stance toward D, execute (full facing) a rising block with an X-knife-hand.'),
(1445, 2, 1028, 42, 'Pivot on the balls of both feet to form a right walking stance toward AC, while executing (reverse half facing) a middle block to AC with a double arc-hand, looking through the space between the hands.'),
(1446, 2, 1028, 43, 'While maintaining a right walking stance toward AC, execute (full facing) a high inward strike to AC with the left knife-hand, bringing the right side fist in front of the left shoulder.'),
(1447, 2, 1028, 44, 'Pivot on the balls of both feet to form a left walking stance toward D, while executing (reverse half facing) a circular block to AD with the right inner forearm.'),
(1448, 2, 1028, 45, 'While maintaining a left walking stance toward D, execute a high front punch (full facing) to D with the left forefist.'),
(1449, 2, 1028, 46, 'Execute a low front snap kick to D with the ball of the right foot, keeping the position of the hands as they were in move 45 above (a high front punch with the left forefist).'),
(1450, 2, 1028, 47, 'Lower the right foot to D to form a right walking stance toward D, while executing a middle front punch (full facing) to D with the right forefist. Perform moves 47and 48 in a fast motion.'),
(1451, 2, 1028, 48, 'While maintaining a right walking stance toward D, execute a middle front punch (full facing) to D with the left forefist.'),
(1452, 2, 1028, 49, 'While maintaining a right walking stance toward D, execute a rising block (full facing) with an X-knife-hand.'),
(1453, 2, 1028, 50, 'Move the left foot to D, then pivoting on the ball of the left foot and turning counterclockwise, move the right foot to D in a sliding motion to form a right L-stance toward C, while executing a low knife-hand guarding block (half facing) to C. Perform this move in a sliding motion.'),
(1454, 2, 1028, 51, 'Jump toward C (one and a half shoulder widths), spinning counterclockwise. Then land forming a right L-stance toward D, while executing (half facing) a middle outer forearm guarding block to D. Perform this move in jumping motion.'),
(1455, 2, 1028, 52, 'Slip the left foot to D to form a left walking stance toward D, while executing a low block (full facing) to D with the right knife-hand, and a middle outward block to D with the left inner forearm (full facing). Perform moves 52 and 53 in a continuous motion.'),
(1456, 2, 1028, 53, 'While maintaining a left walking stance toward D, execute (full facing) a high front punch to D with the right forefist.'),
(1457, 2, 1028, 54, 'Pull the left foot toward the right foot to form a right L-stance toward D, while executing (half facing) a middle front punch to D with the left forefist.'),
(1458, 2, 1028, 55, 'Move the ball of the right foot to D, then pivoting on the ball of the right foot and turning clockwise, move the left foot to D in a sliding motion to form a left L-stance toward C, while executing a low knife-hand guarding block (half facing) to C. Perform this move in a sliding motion.'),
(1459, 2, 1028, 56, 'Jump toward C (one and a half shoulder widths), spinning clockwise. Then, land forming a left L-stance toward D, while executing a middle outer forearm guarding block (half facing) to D. Perform this move in jumping motion.'),
(1460, 2, 1028, 57, 'Slip the right foot to D to form a right walking stance toward D, while executing a low block (full facing) to D with the left knife-hand and a middle outward block (full facing) to D with the right inner forearm. Perform moves 57 and 58 in a continuous motion.'),
(1461, 2, 1028, 58, 'While maintaining a right walking stance toward D, execute a high front punch (full facing) to D with the left forefist.'),
(1462, 2, 1028, 59, 'Pull the right foot toward the left foot to form a left L-stance toward D, while executing (half facing) a middle front punch to D with the right forefist.'),
(1463, 2, 1028, 60, 'Move the ball of the right foot to the side rear of the left foot, then move the left foot to C in a sliding motion to form a left L-stance toward D, while executing (half facing) a scooping block with the right palm. Perform this move in a sliding motion.'),
(1464, 2, 1028, 61, 'While shifting to D and maintaining a left L-stance toward D, execute (half facing) a middle punch to D with the left forefist. Perform this move in a shifting motion.'),
(1465, 2, 1028, 62, 'While pivoting on the ball of the left foot and turning clockwise, form (half facing) a left bending ready stance type A toward C.'),
(1466, 2, 1028, 63, 'Execute a high side piercing kick to C with the right footsword, keeping the position of the hands as they were in move 62 above (a middle outer forearm guarding block).'),
(1467, 2, 1028, 64, 'Lower the right foot to C to form a right walking stance toward C, while executing (full facing) a middle front punch to C with the left forefist.'),
(1468, 2, 1028, 65, 'Move the right foot to D to form a right L-stance toward C, while executing (half facing) a middle knife-hand guarding block to C.'),
(1469, 2, 1028, 66, 'Move the ball of the left foot to the side rear of the right foot, then move the right foot to D in a sliding motion to form aright L-stance toward C, while executing (half facing) a scooping block with the left palm. Perform this move in a sliding motion.'),
(1470, 2, 1028, 67, 'While shifting to C and maintaining a right L-stance toward C, execute (half facing) a middle punch to C with the right forefist. Perform this move in a shifting motion.'),
(1471, 2, 1028, 68, 'Pivoting on the ball of the right foot, turn counterclockwise to form a right bending ready stance type A (half facing) toward C.'),
(1472, 2, 1028, 69, 'Execute a high side piercing kick to D with the left footsword, keeping the position of the hands as they were in move 68 above (a middle outer forearm guarding block).'),
(1473, 2, 1028, 70, 'Lower the left foot to D to form a left walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(1474, 2, 1028, 71, 'Move the left foot to C to form a left L-stance toward D, while executing (half facing) a middle knife-hand guarding block to D. Perform moves 71 and 72 in a continuous motion.'),
(1475, 2, 1028, 72, 'Slip the right foot to D to form a right walking stance toward D, while executing a high front punch (full facing) to D with the rightforefist.'),
(1476, 2, 1028, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot to the left foot to form a close ready stance type A toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(1477, 2, 1029, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Close Ready Stance type B toward D. Remain in this close ready stance type B toward D until given the command to begin the pattern.'),
(1478, 2, 1029, 1, 'Move the left foot to B to form a left walking stance toward B, while executing (half facing) a low block to B with the left outer forearm.'),
(1479, 2, 1029, 2, 'Bring the ball of the left foot to the side of the right foot, then move the right foot to A to form a left L-stance toward A, while executing (half facing) a twin forearm block.'),
(1480, 2, 1029, 3, 'Pivoting on the ball of the left foot, execute a middle side piercing kick to D with the right footsword. At the same time, execute a high side punch to D with the right forefist.'),
(1481, 2, 1029, 4, 'Lower the ball of the right foot to D, then move the left foot to F to form a left walking stance toward F, while executing (full facing) a rising block with the left outer forearm.'),
(1482, 2, 1029, 5, 'Bring the ball of the left foot to the side of the right foot, then move the right foot to E to form a sitting stance toward D, while executing (side facing) a middle side strike to E with the right knife-hand.'),
(1483, 2, 1029, 6, 'Bring the right foot to the side of the left foot, to form a (full facing) close ready stance type B toward D.'),
(1484, 2, 1029, 7, 'Move the left foot toward D in a jumping motion (about one and a half shoulder widths), landing to form a left X-stance toward DG, while executing (half facing) a high side strike to D with the left backfist, bringing the right finger belly to the left side fist. Perform this move in a jumping motion.'),
(1485, 2, 1029, 8, 'Move the right foot to G to form a right walking stance toward G, while executing a (full facing) a high front punch to G with the right forefist.'),
(1486, 2, 1029, 9, 'Prior to moving the body, move the ball of the right foot on the GH line (half a shoulder width toward D and half a shoulder width toward H). Then, while pivoting on the ball of the right foot and turning counterclockwise, move the left foot to H to form a left fixed stance toward H, while executing (half facing) a high outer forearm guarding block to H. Perform this move in a spot-turning motion - method one.'),
(1487, 2, 1029, 10, 'Move the right foot to H to form a right walking stance toward H, while executing (full facing) a middle front thrust to H with the right straight fingertip, pulling the back of the left fingertips under the right elbow.'),
(1488, 2, 1029, 11, 'Bring the ball of the right foot to the side of the left foot, then move the left foot to G to form a left walking stance toward G, while executing (half facing) a high side strike to G with the left backfist.'),
(1489, 2, 1029, 12, 'Move the left foot on the GH line to form a sitting stance toward C, while executing (full facing) a scooping block with the left palm.'),
(1490, 2, 1029, 13, 'Execute a middle turning kick to C with the ball of the left foot, while holding both side fists up and toward C.'),
(1491, 2, 1029, 14, 'Lower the left foot to C in a jumping motion, landing to form a left X-stance toward CF, while executing (half facing) a high block to C with the left double forearm. Perform this move in jumping motion.'),
(1492, 2, 1029, 15, 'Move the right foot to F to form a sitting stance toward C, while extending (full facing) the right fist horizontally to C. Perform this move in a slow motion.'),
(1493, 2, 1029, 16, 'While maintaining a sitting stance toward C, execute (full facing) a front strike to C with the left backfist, pulling the right backfist under the left elbow.'),
(1494, 2, 1029, 17, 'Bring the right foot straight behind the left foot, then move the left foot to E to form a left diagonal stance toward C, while executing (full facing) a pressing block to E with a twin palm.'),
(1495, 2, 1029, 18, 'Pivot on the balls of both feet to form a left walking stance toward CE, while executing (reverse half facing) a middle block to C with a double arc-hand, looking through the space between the hands.'),
(1496, 2, 1029, 19, 'Pull the left reverse footsword to the right knee joint to form a right one-leg stance toward C, while executing (full facing) a high side block to F with the right outer forearm and a low side block to E with the left outer forearm.'),
(1497, 2, 1029, 20, 'Lower the left foot to D to form a right walking stance toward C, while executing (full facing) a pressing block to C with the right palm. Perform this move in a slow motion – sliding the left foot.'),
(1498, 2, 1029, 21, 'Pull the left instep to the hollow of the right leg to form a right one-leg stance toward C, while executing (full facing) a high side front strike to C with the right back fist, striking the left finger belly with the right back forearm.'),
(1499, 2, 1029, 22, 'Lower the left foot to C, turning clockwise to form a right fixed stance toward D, while thrusting (half facing) to C with the left side elbow.'),
(1500, 2, 1029, 23, 'Pivoting on the ball of the left foot and turning clockwise, move the right foot to A to form a left L-stance toward A, while executing (half facing) a high knife-hand guarding block to A.'),
(1501, 2, 1029, 24, 'Bring the ball of the right foot to the side of the left foot, then move the left foot to B to form a right L-stance toward B, while executing (half facing) a middle punch to B with the right forefist.'),
(1502, 2, 1029, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the left foot to the right foot to form a close ready stance type B toward D. Remain in this stance until given the at-ease command (swi-eot).'),
(1503, 2, 1030, 0, 'On the command to assume the ready position (jun-bi), move the left foot to B to form a Parallel Stance with an Overlapped Backhand toward D. Remain in this parallel stance with an overlapped backhand toward D until given the command to begin the pattern.'),
(1504, 2, 1030, 1, 'Move the right foot to C to form a left walking stance toward D, while executing (full facing) a middle punch to D with a twin forefist. Perform this move in a slow motion – sliding the rightfoot.'),
(1505, 2, 1030, 2, 'Move the left foot to C to form a right walking stance toward D, while executing (full facing) a horizontal strike with a twin knife-hand. Perform this move in a slow motion – sliding the left foot.'),
(1506, 2, 1030, 3, 'Move the left foot to D to form a right rear foot stance toward D, while executing (half facing) a middle inward block to D with the left outer forearm.'),
(1507, 2, 1030, 4, 'Slip the right foot to C to form a left walking stance toward D, while executing (full facing) a low inward block to D with the right palm, pulling the left side fist in front of the right shoulder.'),
(1508, 2, 1030, 5, 'Move the right foot to D to form a left L-stance toward D, while executing (half facing) a middle punch to D with the right forefist. Perform move 5 and 6 in a fast motion.'),
(1509, 2, 1030, 6, 'While maintaining a left L-stance toward D, execute a middle front punch (half facing) to D with the left forefist.'),
(1510, 2, 1030, 7, 'Move the left foot to D in a stamping motion to form a right L-stance toward D, while executing (half facing) a high outward strike to D with the left backhand. Perform this move in a stamping motion.'),
(1511, 2, 1030, 8, 'Execute an inward vertical kick to D with the right reverse footsword, hitting the left palm with the right reverse footsword.'),
(1512, 2, 1030, 9, 'Lower the right foot to D in a stamping motion to form a left L-stance toward D, while executing (half facing) a high outward strike to D with the right backhand. Perform this move in a stamping motion.'),
(1513, 2, 1030, 10, 'Execute an inward vertical kick to D with the left reverse footsword, hitting the right palm with the left reverse footsword.'),
(1514, 2, 1030, 11, 'Lower the ball of the left foot to D,then slip the left foot to D to form a right L-stance toward D, while executing (half facing) a horizontal block with a twin palm. Perform this move in a slow motion – sliding the left foot.'),
(1515, 2, 1030, 12, 'Move the right foot to D to form a right walking stance toward D, while executing (half facing) a high side block to D with the right reverse knife-hand. Perform this move in a slow motion –sliding the right foot.'),
(1516, 2, 1030, 13, 'While maintaining a right walking stance toward D, execute (reverse half facing) a middle side block to D with the left reverse knife-hand. Perform this move in a slow motion.'),
(1517, 2, 1030, 14, 'While maintaining a right walking stance toward D, execute (full facing) a middle front punch to with the right forefist.'),
(1518, 2, 1030, 15, 'While maintaining a right walking stance toward D, execute (full facing) a middle front punch to D with the left forefist.'),
(1519, 2, 1030, 16, 'Pivoting on the ball of the left foot and turning clockwise, execute a downward kick to AC with the back heel of the right foot, keeping the position of the hands as they were in move 15 above (a middle front punch with the left forefist).'),
(1520, 2, 1030, 17, 'Lower the right foot to C in a stamping motion to form a left L-stance toward C, while executing (half facing) a downward strike to C with the right backfist. Perform this move in a stamping motion.'),
(1521, 2, 1030, 18, 'Pivoting on the ball of the right foot and turning counterclockwise, execute an outward vertical kick to BC with the left footsword, keeping the position of the hands as they were in move 17 above (a downward strike with the right backfist).'),
(1522, 2, 1030, 19, 'Lower the left foot to C in a stamping motion to form a right L-stance toward C, while executing (half facing) a downward strike to C with the left backfist. Perform this move in a stamping motion.'),
(1523, 2, 1030, 20, 'While pivoting on the ball of the left foot and turning clockwise, move the right foot to D to form a right walking stance toward D, while executing (full facing) a high front punch to D with the left forefist. Perform moves 20 and 21 in a fast motion.'),
(1524, 2, 1030, 21, 'While maintaining a right walking stance toward D, execute (full facing) a high front punch to D with the right forefist.'),
(1525, 2, 1030, 22, 'Move the left foot to D to form a right rear foot stance toward D, while executing (half facing) an upward block to D with the left bow wrist.'),
(1526, 2, 1030, 23, 'Move the right foot to D to form a left rear foot stance toward D, while executing (half facing) an upward block to D with the right bow wrist.'),
(1527, 2, 1030, 24, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to C to form a left walking stance toward C, while executing (full facing) a pressing block to C with the left palm. Perform this move in a slow motion –sliding the left foot.'),
(1528, 2, 1030, 25, 'Move the right foot to C to form a right walking stance toward C, while executing (full facing) a pressing block to C with the right palm. Perform this move in a slow motion – sliding the right foot.'),
(1529, 2, 1030, 26, 'Bring the left foot to the side of the right foot to form a close stance toward C, while executing (full facing) a low front block with the right knife-hand, striking the left palm with the right knife-hand (moving both hands in a circular motion).'),
(1530, 2, 1030, 27, 'Pivoting on the ball of the right foot and turning counterclockwise, move the left foot to D to form a left walking stance toward D, while executing (full facing) a rising block to D with the left knife-hand.'),
(1531, 2, 1030, 28, 'While maintaining a left walking stance toward D, execute (full facing) a high front punch to D with the right forefist.'),
(1532, 2, 1030, 29, 'Move the right foot to D in a sliding motion to form a left L-stance toward D, while executing (half facing) upset punch to D with the left forefist, pulling the right side fist in front of the left shoulder. Perform this move in a sliding motion.'),
(1533, 2, 1030, 30, 'Move the right foot to C to form a left walking stance toward D, while executing (full facing) a high front thrust to C with the right angle fingertip.'),
(1534, 2, 1030, 31, 'Prior to moving the body, move the ball of the left foot on the CD line (half a shoulder width toward B, and half a shoulder width toward C). Then, while pivoting on the ball of the left foot and turning clockwise, move the right foot to C to form a right walking stance toward C, while executing (full facing) a rising block with the right knife-hand.'),
(1535, 2, 1030, 32, 'While maintaining a right walking stance toward C, execute (full facing) a high front punch to C with the left forefist.'),
(1536, 2, 1030, 33, 'Move the left foot to C in a sliding motion to form a right L-stance toward C, while executing (half facing) an upset punch to C with the right forefist, pulling the left side fist in front of the right shoulder. Perform this move in a sliding motion.'),
(1537, 2, 1030, 34, 'Move the left foot to D to form a right walking stance toward C, while executing (full facing) a high front thrust to Cwith the left angle fingertip.'),
(1538, 2, 1030, 35, 'While pivoting on the ball of the left foot, move the right foot to C to form a left L-stance toward C, while executing (half facing) a low reverse knife-hand guarding block to C in a circular motion. Perform the block in this move in a circular motion.'),
(1539, 2, 1030, 36, 'While pivoting on the ball of the right foot, move the left foot to D to form a right L-stance toward D, while executing (half facing) a low reverse knife-hand guarding block to D in a circular motion. Perform the block in this move in a circular motion.'),
(1540, 2, 1030, 37, 'Slip the left foot to D to form a left walking stance toward D, while executing (full facing) a low block to D with the right outer forearm and a middle outward block to D with the left knife-hand.'),
(1541, 2, 1030, 38, 'Move the right foot to D in a stamping motion to form a right walking stance toward D, while executing (full facing) a high vertical punch to D with a twin forefist. Perform this move in a stamping motion.'),
(1542, 2, 1030, 39, 'Pull the right reverse footsword to the left knee joint to form a left one-leg stance toward D, while executing (full facing) a high side front strike to D with the right back fist, striking the left finger belly with the right back forearm.'),
(1543, 2, 1030, 40, 'Execute a middle back piercing kick to C with the right footsword. At the same time, pull both hands the opposite direction to the front of the left shoulder, with the left finger belly on the right back forearm.'),
(1544, 2, 1030, 41, 'Lower the right foot to C to form a sitting stance toward A, while executing (side facing) an outward W-shape block with the outer forearms.'),
(1545, 2, 1030, 42, 'While sliding to C and maintaining a sitting stance toward A, execute (side facing) an outward W-shape block with the outer forearms. Perform this move in a sliding motion.'),
(1546, 2, 1030, 43, 'Pivoting on the ball of the left foot and turning counterclockwise, move the right foot to D in a stamping motion to form a sitting stance toward B, while executing (side facing) an inward W-shape block with the right outer forearm. Perform this move in a stamping motion.'),
(1547, 2, 1030, 44, 'While sliding to C and maintaining a sitting stance toward B, execute (side facing) an outward W-shape block with the outer forearms. Perform this move in a sliding motion.'),
(1548, 2, 1030, 45, 'Pull the left reverse footsword to the right knee joint to form a right one-leg stance toward C, while executing (full facing) a high side front strike to C with the left backfist, striking the right finger belly with the left back forearm.'),
(1549, 2, 1030, 46, 'Execute a high back piercing kick to D with the left footsword. At the same time, pull both hands in the opposite direction to the front of the right shoulder, with the right finger belly on the left back forearm.'),
(1550, 2, 1030, 47, 'Lower the left foot to C in a jumping motion, landing to form a left X-stance toward C, while executing (full facing) a pressing block to C with an X-fist. Perform this move in jumping motion.'),
(1551, 2, 1030, 48, 'Move the right foot to D to form a left walking stance toward C, while executing (full facing) a high front srike to C with the left underfist.'),
(1552, 2, 1030, 49, 'Move the right foot to C to form a right walking stance toward C, while executing (full facing) a high front strike to C with the right underfist.'),
(1553, 2, 1030, 50, 'While maintaining a right walking stance toward C, execute (full facing) a middle front pushing block to C with the left palm.'),
(1554, 2, 1030, 51, 'Pivot on the balls of both feet to form a left walking stance toward AD, while executing (reverse half facing) a circular block to A with the right knife-hand.'),
(1555, 2, 1030, 52, 'Move the left foot to C to form a left walking stance toward C, while executing (full facing) a middle front pushing block to C with the right palm.');
INSERT INTO `EncyclopediaCount` (`ID`, `EncyclopediaID`, `PatternID`, `Count`, `Text`) VALUES
(1556, 2, 1030, 53, 'Pivot on the balls of both feet to form a right walking stance toward BD, while executing (reverse half facing) a circular block to B with the left knife-hand.'),
(1557, 2, 1030, 54, 'Execute a high side piercing kick to D with the right footsword, forming a forearm guarding block toward D. Then lower the right foot to side of the left foot to form a close stance toward D, while executing (full facing) a twin side back elbow thrust.'),
(1558, 2, 1030, 55, 'Move the left foot to D to form a sitting stance toward A, while executing (side facing) a middle side punch to D with the left forefist.'),
(1559, 2, 1030, 56, 'While pivoting on the ball of the left foot, move the right foot to C to form a left walking stance toward D, while executing (full facing) a middle front punch to D with the right forefist.'),
(1560, 2, 1030, 999, 'END: When the command to return to the ready position (ba-ro) is given, bring the right foot forward onto the AB line to form a Parallel Stance with an Overlapped Backhand toward D. Remain in this stance until given the at-ease command (swi-eot).');

-- 1964 CH'ON-JI
-- M.S. block=mid·section block.
INSERT INTO `EncyclopediaCount` (`EncyclopediaID`, `PatternID`, `Count`, `Text`) VALUES
(6, 1004,   0, 'P.R. stance'),
(6, 1004,   1, 'Move L. foot to ''B'' forming L.F. stance while executing L.S. block with L. forearm.'),
(6, 1004,   2, 'Move R. foot to ''B'' forming R.F. stance while executing M.S. punch with R. fist.'),
(6, 1004,   3, 'Move R. foot to ''A'' forming R.F. stance while executing L.S. block with R. forearm.'),
(6, 1004,   4, 'Move L. foot to ''A'' forming L.F. stance while executing M.S. punch with L. fist.'),
(6, 1004,   5, 'Move L. foot to ''D'' forming L.F. stance while executing L.S. block with L. forearm.'),
(6, 1004,   6, 'Move R. foot to ''D'' forming R.F. stance while executing M.S. punch with R. fist.'),
(6, 1004,   7, 'Move R. foot to ''C'' forming R.F. stance while executing R.F. block with R. forearm.'),
(6, 1004,   8, 'Move L. foot to ''C'' forming L.F. stance while executing M.S. punch with L. fist.'),
(6, 1004,   9, 'Move L. foot to ''A'' forming R.B. stance while executing M.S. block with L.I. forearm.'),
(6, 1004,  10, 'Move R. foot to ''A'' forming R.F. stance while executing M.S. punch with R fist.'),
(6, 1004,  11, 'Move R. foot to ''B'' forming L.B. stance while executing M.S. block with R.I. forearm.'),
(6, 1004,  12, 'Move L. foot to ''B'' forming L.F. stance while executing M.S. punch with L. fist.'),
(6, 1004,  13, 'Move L. foot to ''C'' forming R.B. stance wihle executing M.S. block with L.I. forearm.'),
(6, 1004,  14, 'Move R. foot to ''C'' forming R.F. stance while executing M.S. punch with R fist.'),
(6, 1004,  15, 'Move R. foot to ''D'' forming L.B. stance while executing M.S. block with R.I. forearm.'),
(6, 1004,  16, 'Move L. foot to ''D'' forming L.F. stance while executing M.S. punch with L. fist.'),
(6, 1004,  17, 'Move R. foot to ''D'' forming R.F. stance while executing M.S. punch with R. fist.'),
(6, 1004,  18, 'Move R. foot to ''C'' forming L.F. stance while executing M.S. punch with L. fist.'),
(6, 1004,  19, 'Move L. foot to ''C'' forming R.F. stance while executing M.S. punch with R. fist.'),
(6, 1004, 999, 'Bring L. foot back to ready stance.'),

-- 1964 TAN-GUN
-- M.S. strike = mid-section Strike
-- H.S. punch = high-section punch
(6, 1005,   0, 'P.R. stance'),
(6, 1005,   1, 'Move L. foot to ''B'' forming R.B. stance at the same time execute M.S. guarding block with knife-hand.'),
(6, 1005,   2, 'Move R. foot to ''B'' forming R.F. stance while executing H.S. punch with R. fist.'),
(6, 1005,   3, 'Move R. foot to ''A'' forming L.B. stance at the same lime execute M.S. guarding block with knife-hand.'),
(6, 1005,   4, 'Move L. foot to ''A'' forming L.F. stance at the same time execute H.S. punch with L. fist.'),
(6, 1005,   5, 'Move L. foot to ''D'' forming L.F. stance while executing L.S. block with L. forearm.'),
(6, 1005,   6, 'Move R. foot to ''D'' forming R.F. stance while executing H.S. punch with R. fist.'),
(6, 1005,   7, 'Move L. foot to ''D'' forming L.F. stance while executing H.S. punch with L. fist.'),
(6, 1005,   8, 'Move R. foot to ''D'' forming R.F. stance while executing H.S. punch with R. fist.'),
(6, 1005,   9, 'Move L. foot to ''E'' forming R.B. stance at the same time execute twin forearm block.'),
(6, 1005,  10, 'Move R. foot to ''E'' forming R.F. stance at the same time execute H.S. punch with R. fist.'),
(6, 1005,  11, 'Move R. foot to ''F'' forming L.B. stance while executing twin forearm block.'),
(6, 1005,  12, 'Move L. foot to ''F'' forming L.F. slance at the same time execute H.S. punch with L. fist.'),
(6, 1005,  13, 'Move L. foot to ''C'' forming L.F. stance while executing L.S. block with L. forearm.'),
(6, 1005,  14, 'Execute rising block with L. forearm. • Perfonn 13 and 14 in a fast motion.'),
(6, 1005,  15, 'Move R. foot to ''C'' forming R.F. stance while executing rising block with R. forearm.'),
(6, 1005,  16, 'Move L. foot to ''C'' forming L.F. stance while executing rising block with L. forearm.'),
(6, 1005,  17, 'Move R. foot to ''C'' forming R.F. stance while executing rising block with R. forearm.'),
(6, 1005,  18, 'Move L. foot to ''B'' forming R.B. stance at the same time exceute M.S. strike with L knife-hand.'),
(6, 1005,  19, 'Move R. foot to ''B'' forming R.F. stance while executing H.S. punch with R. fist.'),
(6, 1005,  20, 'Move R. foot to ''A'' forming L.B. stance at the same time execute M.S. strike with R. knife-hand.'),
(6, 1005,  21, 'Move L. foot to ''A'' forming L.F. slance while executing H.S. punch with L. fist.'),
(6, 1005, 999, 'Bring L. foot back to ready stance.'),

-- 1964 TO-SAN
-- R.O. forearm =  right outer forurm
-- L.O. forearm = left outer forearm
(6, 1006,   0, 'P.R. stance'),
(6, 1006,   1, 'Move L. foot to ''B'' forming L.F. stance while executing H.S. block with L.O. forearm.'),
(6, 1006,   2, 'Execute M.S. punch with R. fist.'),
(6, 1006,   3, 'Move L. foot on line ''AB'' forming R.F. stance toward ''A'' while executing H.S. block with R.O. forearm.'),
(6, 1006,   4, 'Execute M.S. punch with L. fist.'),
(6, 1006,   5, 'Move L. foot to ''D'' forming R.B. stance while executing M.S. guarding block with knife-hand.'),
(6, 1006,   6, 'Move R. foot to ''D'' forming R.F. stance while thrusting with R.S.S. finger.'),
(6, 1006,   7, 'Move L. foot to ''D'' turning counter-clockwise to form L.F. stance and execute H S. side strike with L. back fist.'),
(6, 1006,   8, 'Move R. foot to ''D'' forming R.F. stance while executing H.S. side strike with R. back fist.'),
(6, 1006,   9, 'Move L. foot to ''E'' forming L.F. stance while executing H.S. block with L.O. forearm.'),
(6, 1006,  10, 'Execute M.S. punch with R. fist.'),
(6, 1006,  11, 'Move L. foot on line ''EF'' forming R.F. stance toward ''F'' while executing H.S. block with R.O. forearm.'),
(6, 1006,  12, 'Execute M.S. punch with L. fist.'),
(6, 1006,  13, 'Move L. foot to ''CE'' forming L.F. stance at the same time execute H.S. wedging block with other forearm.'),
(6, 1006,  14, 'Execute M.S. front snap kick with R. foot keeping the position of hands as they were in 13.'),
(6, 1006,  15, 'Lower R. foot to ''CE'' forming R.F. stance while executing M.S. punch with R. fist'),
(6, 1006,  16, 'Execute M.S. punch with L. fist. * Perform 15 & 16 in a fast motion.'),
(6, 1006,  17, 'Move R. foot to ''CF'' forming R.F. stance at the same time execute H.S wedging block with outer forearm.'),
(6, 1006,  18, 'Execute M.S. front snap kick with L. foot keeping both hands as they were in 17.'),
(6, 1006,  19, 'Lower L. foot to ''CF'' forming L.F. stance while executing M.S. punch with L. fist'),
(6, 1006,  20, 'Execute M.S. punch with R. fist. * Perform 19 & 20 in a fast motion.'),
(6, 1006,  21, 'Move L. foot to ''C'' forming L.F. stance at the same time execute rising block with L. forearm.'),
(6, 1006,  22, 'Move R. foot to ''C'' forming R.F. stance at the same time execute rising block with R. forearm.'),
(6, 1006,  23, 'Move L. foot to ''B'' forming R. stance toward ''D'' at the same time execute M.S. side strike with L. knife-hand.'), -- Error!
(6, 1006,  24, 'Bring L. foot to R. foot and then move R. foot to ''A'' forming R. stance at the same time execute M.S. side strike with R. knife-hand.'), -- Error!
(6, 1006, 999, 'Bring R. foot back to ready stance.'),

-- WON-HYO
(6, 1007,   0, 'C.R. stance ''A'''),
(6, 1007,   1, 'Move L. foot to ''B'' forming R.B. stance at the same time execute twin forearm block.'),
(6, 1007,   2, 'Execute H.S. inward strike with R. knife-hand while bringing L.H. fist in front of R. shoulder.'),
(6, 1007,   3, 'Execute M.S. punch to ''B'' with L. fist while forming F. X-stance.'), -- F. X-stance == Fixed Stance?
(6, 1007,   4, 'Bring L. foot to R. foot and then move R. foot to ''A'' forming L.B. stance while executing twin forearm block.'),
(6, 1007,   5, 'Execute H.S. inward strike with L. knife-hand while bringing R.H. fist in front of L. shoulder.'),
(6, 1007,   6, 'Execute M.S. punch to ''A'' with R. fist while forming F. X·stance.'), -- F. X-stance == Fixed Stance?
(6, 1007,   7, 'Bring R. foot to L. foot and then bring L. fist on R. fist while pulling L. foot to R. knee joint.'), -- Diff
(6, 1007,   8, 'Execute M.S. side thrusting kick to ''D'' with L. foot.'), -- Diff
(6, 1007,   9, 'Lower L. foot to ''D'' forming R.B. stance while executing M.S. guarding block with knife-hand.'),
(6, 1007,  10, 'Move R. foot to ''D'' forming L.B. stance while executing M.S. guarding block with knife-hand.'),
(6, 1007,  11, 'Move L. foot to ''D'' forming R.B. stance while executing M.S. guarding block with knife-hand.'),
(6, 1007,  12, 'Move R. foot to ''D'' forming R.F. stance at the same time thrust with R.S.S. finger.'),
(6, 1007,  13, 'Move L. foot to ''E'' forming R.B. stance at the same time execute twin forearm block.'),
(6, 1007,  14, 'Execute H.S. inward strike with R. knife-hand while bringing L.H. fist in front of R. shoulder.'),
(6, 1007,  15, 'Execute M.S. punch with L. fist while forming F. X-stance.'), -- Diff
(6, 1007,  16, 'Bring L. foot to R. foot and then move R. foot to ''F'' forming L.B. stance while executing twin forearm block.'),
(6, 1007,  17, 'Execute H.S. inward strike with L. knife-hand while bringing R.H. fist in front of L. shoulder.'),
(6, 1007,  18, 'Execute M.S. punch with R. fist while forming F. X-stance.'), -- Diff
(6, 1007,  19, 'Bring R. foot to L. foot and then move L. foot to ''C'' forming L.F. stance while executing circular block with R.I. forearm.'),
(6, 1007,  20, 'Execute L.S. front snap kick with R. foot keeping the position of hands as they were in 19.'),
(6, 1007,  21, 'Lower R. foot to ''C'' forming R.F. stance at the same time execute M.S. punch with L. fist.'),
(6, 1007,  22, 'Execute circular block with L.I. forearm.'),
(6, 1007,  23, 'Execute L.S. front snap kick with L. foot keeping the position of hands as they were in 22.'),
(6, 1007,  24, 'Lower L. foot to ''C'' forming L.F. stance at the same time execute M.S. punch with R. fist.'),
(6, 1007,  25, 'Bring R. fist on L. fist while pulling R. foot to L. knee joint.'),
(6, 1007,  26, 'Execute M.S. side thrusting kick to ''C'' with R. foot.'), -- Diff
(6, 1007,  27, 'Lower R. foot to ''C'' and then move L. foot to ''B'' forming R.B. stance while executing M.S. guarding block with forearm.'),
(6, 1007,  28, 'Bring L. foot to R. foot and then move R. foot to ''A'' forming L.B. stance while executing M.S. guarding block with forearm.'),
(6, 1007, 999, 'Bring R. foot back to ready stance.'),

-- YUL-KOK
(6, 1008,   0, 'P.R. stance'),
(6, 1008,   1, 'Move L. foot to ''B'' forming R. stance while extending L. fist to ''D''.'),
(6, 1008,   2, 'Execute M.S. punch with R. fist.'),
(6, 1008,   3, 'Execute M.S. punch with L. fist.'),
(6, 1008,   4, 'Bring L. foot to R. foot and then move R. foot to ''A'' forming R. stance while extending R. fist to ''0''.'), -- TODO
(6, 1008,   5, 'Execute M.S. punch with L. fist.'),
(6, 1008,   6, 'Execute M.S. punch with R. fist. * Perform 5 & 6 in a fast motion.'),
(6, 1008,   7, 'Move R. foot to ''AD'' forming R.F. stance while executing H.S. block with R.I. forearm.'),
(6, 1008,   8, 'Execute L.S. front snap kick with L. foot keeping the position of hands as they were in 7.'),
(6, 1008,   9, 'Lower L. foot to ''AD'' forming L.F. stance at the same time execute M.S. punch with L. fist.'),
(6, 1008,  10, 'Execute M.S. punch with R. fist. * Perform 9 & 10 in a fast motion.'),
(6, 1008,  11, 'Move L. foot to ''BD'' forming L.F. stance at the same time execute H.S. block with L.I. forearm.'),
(6, 1008,  12, 'Execute L.S. front snap kick with R. foot keeping the position of hands as they were in 11.'),
(6, 1008,  13, 'Lower R. foot to ''BD'' forming R.F. stance while executing M.S. punch with R. fist.'),
(6, 1008,  14, 'Execute M.S. punch with L. fist. * Perform 13 & 14 in 4 fast motion.'),
(6, 1008,  15, 'Move R. foot to ''D'' forming R.F. stance at the same time execute H.S. hooking block with R. knife-hand'),
(6, 1008,  16, 'Execute H.S. hooking block with L. knife-hand.'),
(6, 1008,  17, 'Execute M.S. punch with R. fist. * Perform 16 & 11 in a fast motion.'),
(6, 1008,  18, 'Move L. foot to ''D'' forming L.F. stance at the same time execute H.S. hooking block with L. knife-hand.'),
(6, 1008,  19, 'Execute H.S. hooking block with R. knife-hand'),
(6, 1008,  20, 'Execute M.S. punch with L. fist. * Perform 19 & 20 in a fast motion.'),
(6, 1008,  21, 'Move R. foot to ''D'' forming R.F. stance while executing M.S. punch with R. fist.'),
(6, 1008,  22, 'Bring L. fist on R. fist while pulling L. foot to R. knee joint.'),
(6, 1008,  23, 'Execute M.S. side thrusting kick to ''D'' with L. foot.'),
(6, 1008,  24, 'Lower L. foot to ''D'' forming L.F. stance while striking L. palm with R. front elbow.'),
(6, 1008,  25, 'Bring R. fist on L. fist while pulling R. foot to L. knee and turn the face to ''C''.'),
(6, 1008,  26, 'Execute M.S. side thrusting kick to ''C'' with R. foot.'),
(6, 1008,  27, 'Lower R. foot to ''C'' forming R.F. stance while striking R. palm with L. front elbow.'),
(6, 1008,  28, 'Move L. foot to ''E'' forming R.B. stance while executing twin knife-hand block.'),
(6, 1008,  29, 'Move R. foot to ''E'' forming R.F. stance while thrusting with R.S.S. finger.'),
(6, 1008,  30, 'Move R. foot to ''F'' forming L.B. stance while executing twin knife-hand block.'),
(6, 1008,  31, 'Move L. foot to ''F'' forming L.F. stance while thrusting with L.S.S. finger.'),
(6, 1008,  32, 'Move L. foot to ''C'' forming L.F. stance at the same time execute H.S. side block with L.O. forearm.'),
(6, 1008,  33, 'Execute M.S. punch with R. fist.'),
(6, 1008,  34, 'Move R. foot to ''C'' forming R.F. stance at the same lime execute H.S. side block with R.O. forearm.'),
(6, 1008,  35, 'Execute M.S. punch with L. fist.'),
(6, 1008,  36, 'Jump to ''C'' forming L. X·stance while executing H.S. side strike with L. back fist.'),
(6, 1008,  37, 'Move R. foot to ''A'' forming R.F. stance at the same time execute H.S. block with R.D. forearm.'),
(6, 1008,  38, 'Bring R. foot to L. foot and then move L. foot to ''B'' forming L.F. stance at the same time execute H.S. block with L.D. forearm.'),
(6, 1008, 999, 'Bring L. foot back to ready stance.'),

-- CHUNG-GUN (p184)
(6, 1006,   0, 'P.R. stance'),
(6, 1006,   1, 'Move L. foot to ''B'' forming R.B. stance while executing M.S. side block with L.R. knife-hand.'),
(6, 1006,   2, 'Execute L.S. front snap kick to ''B'' with L. foot keeping both hands as they were in 1.'),
(6, 1006,   3, 'Lower L. foot to ''B'' and then move R. foot to ''B'' forming R. Rr. ft. stance while executing upward block with R palm fist'),
(6, 1006,   4, 'Move R. foot to ''A'' forming L.B. stance while executing M.S. side block with R.R. knife-hand.'),
(6, 1006,   5, ''),
(6, 1006,   6, ''),
(6, 1006,   7, ''),
(6, 1006,   8, ''),
(6, 1006,   9, ''),
(6, 1006,  10, ''),
(6, 1006,  11, ''),
(6, 1006,  12, ''),
(6, 1006,  13, ''),
(6, 1006,  14, ''),
(6, 1006,  15, ''),
(6, 1006,  16, ''),
(6, 1006,  17, ''),
(6, 1006,  18, ''),
(6, 1006,  19, ''),
(6, 1006,  20, ''),
(6, 1006,  21, ''),
(6, 1006,  22, ''),
(6, 1006,  23, ''),
(6, 1006,  24, ''),
(6, 1006,  25, ''),
(6, 1006,  26, ''),
(6, 1006,  27, ''),
(6, 1006,  28, ''),
(6, 1006,  29, ''),
(6, 1008,  30, ''),
(6, 1008,  31, ''),
(6, 1008,  32, ''),
(6, 1006, 999, 'Bring L. foot back to ready stance.'),

-- ??
(6, 1006,   0, 'P.R. stance'),
(6, 1006,   1, ''),
(6, 1006,   2, ''),
(6, 1006,   3, ''),
(6, 1006,   4, ''),
(6, 1006,   5, ''),
(6, 1006,   6, ''),
(6, 1006,   7, ''),
(6, 1006,   8, ''),
(6, 1006,   9, ''),
(6, 1006,  10, ''),
(6, 1006,  11, ''),
(6, 1006,  12, ''),
(6, 1006,  13, ''),
(6, 1006,  14, ''),
(6, 1006,  15, ''),
(6, 1006,  16, ''),
(6, 1006,  17, ''),
(6, 1006,  18, ''),
(6, 1006,  19, ''),
(6, 1006,  20, ''),
(6, 1006,  21, ''),
(6, 1006,  22, ''),
(6, 1006,  23, ''),
(6, 1006,  24, ''),
(6, 1006,  25, ''),
(6, 1006,  26, ''),
(6, 1006,  27, ''),
(6, 1006,  28, ''),
(6, 1006,  29, ''),
(6, 1008,  30, ''),
(6, 1008,  31, ''),
(6, 1008,  32, ''),
(6, 1008,  33, ''),
(6, 1008,  34, ''),
(6, 1008,  35, ''),
(6, 1008,  36, ''),
(6, 1008,  37, ''),
(6, 1008,  38, ''),
(6, 1006, 999, 'Bring L. foot back to ready stance.'),

-- CH'UNG-Mu (p190)
(6, 1006,   5, 'Move L. foot to ''D'' forming R.B. stance at the same time execute M.S. guarding block with knife-hand.'),
(6, 1006,   6, 'Bring R. fist on L. fist while pulling R. foot to L. knee joint.'),
(6, 1006,   7, 'Execute M.S. side thrusting kick to ''C'' with R. foot.'),
(6, 1006,   8, 'Lower R. foot to ''C'' forming R.B. stance toward ''D'' while executing M.S. guarding block with knife-hand.');


-- 1959 U-NAM
-- M.S. block=mid·section block.
-- NOTE: The diagram is numbered differently than subsiquent publications.
-- http://taekwondo.wikia.com/wiki/Pyung_Ahn_Sa-Dan
INSERT INTO `EncyclopediaCount` (`EncyclopediaID`, `PatternID`, `Count`, `Text`) VALUES
(7, 1031,   0, 'Ready Position: Parallel Stance with an X-Back Hand'),
(7, 1031,   1, 'SITTING STANCE, SIDE FRONT BLOCK – RIGHT FOOT'),
(7, 1031,   2, 'CHANGE HANDS POSITION'),
(7, 1031,   3, 'RIGHT FOOT – LEFT ANGLE PUNCH'),
(7, 1031,   4, 'STEP WITH LEFT FOOT TOWARDS "C", WALKING STANCE, TWIN FIST, VERTICAL PUNCH'),
(7, 1031,   5, 'STEP RIGHT FOOT TOWARDS "C", WALKING STANCE, BACK FIST, SIDE FRONT STRIKE, PULL UP LEFT FIST UNDER RIGHT ELBOW'),
(7, 1031,   6, 'PERFORM RIGHT BACK FIST, SIDE REAR STRIKE TO "D", MAINTAINING RIGHT WALKING STANCE WHILE EXTENDING LEFT HAND TO "C"'),
(7, 1031,   7, 'STEP LEFT TO "C" PERFORMING WALKING STANCE BACK FIST, SIDE FRONT STRIKE, PULL RIGHT FIST UNDER LEFT ELBOW'),
(7, 1031,   8, 'PERFORM LEFT BACK FIST, SIDE REAR STRIKE TO "D" MAINTAINING LEFT WALKING STANCE WHILE EXTENDING RIGHT HAND TO "C"'),
(7, 1031,   9, 'STEP TO "C" WITH RIGHT FOOT PERFORMING WALKING STANCE OBVERSE PUNCH'),
(7, 1031,  10, 'TURN COUNTER CLOCKWISE WITH RIGHT FOOT AND SLIDE TO "D" AND PERFORM DOUBLE FOREARM BLOCK IN WALKING STANCE'),
(7, 1031,  11, 'PERFORM LOW SIDE KICK TO "C" WITH RIGHT FOOT'),
(7, 1031,  12, 'LAND RIGHT FOOT TO "C" AND PERFORM WALKING STANCE OBVERSE PUNCH TO "C"'),
(7, 1031,  13, 'DROP LEFT KNEE AND HANDS TO "A"'),
(7, 1031,  14, 'PERFORM A HIGH TURNING KICK TO "C"'),
(7, 1031,  15, 'PUNCH TO "C" WITH THE RIGHT FIST WHILE KNEELING WITH LEFT KNEE, BRIDGE LEFT HAND ON THE FLOOR'),
(7, 1031,  16, 'STEP THE RIGHT FOOT TO "D" PERFORMING A RIGHT L-STANCE WITH LEFT SCOOPING BLOCK FACING TOWARDS "C"'),
(7, 1031,  17, 'STEP THE LEFT FOOT TO "D" PERFORMING A LEFT L-STANCE AND AN REVERSE PUNCH WITH THE RIGHT FIST TOWARDS "C"'),
(7, 1031,  18, 'STEP THE LEFT FOOT TO "C" PERFORMING X-FIST PRESSING BLOCK IN WALKING STANCE'),
(7, 1031,  19, 'KICK TO "C" WITH THE RIGHT KNEE, PULL BOTH HANDS TO LEFT HIP'),
(7, 1031,  20, 'STEP THE RIGHT FOOT TO "D" PERFORMING KNIFE HAND SIDE STRIKE TO "C" IN L-STANCE'),
(7, 1031,  21, 'DOUBLE STEP WITH THE RIGHT FOOT TOWARDS "C" AND PERFORM FRONT ELBOW STRIKE WHILE IN LEFT WALKING STANCE'),
(7, 1031,  22, 'PULL THE LEFT FOOT TO THE RIGHT KNEE WHILE PULLING BOTH FISTS TO THE RIGHT HIP IN ONE LEG STANCE'),
(7, 1031,  23, 'Same as #6 of the Pyung-Ahn 4 pattern; With right foot as is, kick with left foot(좌족도) toward A while simultaneously hitting A with left fist(좌이권).'), -- 'PERFORM A LEFT SIDE SNAP KICK AND A HORIZONTAL BACK FIST TO "A"'),
(7, 1031,  24, 'STEP THE LEFT FOOT TO "AC" AND PERFORM AN X-KNIFE HAND PRESSING BLOCK IN L-STANCE'),
(7, 1031,  25, 'MOVE THE RIGHT FOOT TO "D" AND PERFORM AN OPEN FIST PUNCH TO "C" WITH THE RIGHT HAND IN LEFT WALKING STANCE'),
(7, 1031,  26, 'PERFORM PALM HOOKING BLOCK WITH THE LEFT HAND TO "C"'),
(7, 1031,  27, 'PERFORM RIGHT FRONT SNAP KICK TO "C"'),
(7, 1031,  28, 'STEP THE RIGHT FOOT TO "C" THEN TURN COUNTER CLOCKWISE PULLING BOTH FISTS TO LEFT HIP WHILE PERFORMING A WALKING STANCE TOWARDS "D"'),
(7, 1031,  29, 'FORM A SITTING STANCE WITH THE LEFT FOOT AND PERFORM FOREARM W-SHAPE BLOCK'),
(7, 1031,  30, 'STEP THE LEFT FOOT TO "D" AND PERFORM A LEFT FOREARM RISING BLOCK TOWARDS "D"'),
(7, 1031,  31, 'SHIFT TO "C" AND PERFORM X-FIST PRESSING BLOCK IN RIGHT L-STANCE'),
(7, 1031,  32, 'STEP TO "D" WITH RIGHT FOOT AND PERFORM RIGHT RISING BLOCK IN WALKING STANCE'),
(7, 1031,  33, 'STEP TO "D" WITH LEFT FOOT AND PERFORM OBVERSE RISING BLOCK IN WALKING STANCE'),
(7, 1031,  34, 'STEP TO "D" WITH RIGHT FOOT AND PERFORM AN OBVERSE RISING BLOCK IN WALKING STANCE'),
(7, 1031,  35, 'PERFORM LEFT FRONT SNAP KICK TO "D"'),
(7, 1031,  36, 'STEP LEFT FOOT "D" AND PERFORM A REVERSE PUNCH TO "D" IN WALKING STANCE'),
(7, 1031,  37, 'PERFORM AN OBVERSE PUNCH AND A REVERSE PUNCH MAINTAINING A LEFT WALKING STANCE TO "D"'),
(7, 1031,  38, 'PIVOT ON THE FOOT TURNING CLOCKWISE AND PERFORM ELBOW STRIKE TO "D" FACING "C" IN A LEFT LOW STANCE'),
(7, 1031,  39, 'MOVE THE LEFT FOOT TO "A" AND PERFORMING LEFT LOW FOREARM BLOCK AND THEN AN OBVERSE PUNCH WITH RIGHT FIST IN L-STANCE'),
(7, 1031,  40, 'STEP WITH RIGHT FOOT "A" AND PERFORM RIGHT KNIFE-HAND LOW BLOCK IN L-STANCE AND THEN A LEFT INNER FOREARM BLOCK'),
(7, 1031,  41, 'TURN TO "B" WHILE PIVOTING WITH THE LEFT FOOT AND PERFORM KNIFE-HAND GUARDING BLOCK IN LEFT L-STANCE'),
(7, 1031,  42, 'STEP TO "B" WITH LEFT FOOT AND PERFORM A STRAIGHT FINGERTIP THRUST TO "B" WITH THE LEFT HAND IN A LEFT WALKING STANCE'),
(7, 1031, 999, 'Bring the Left Foot to Ready Stance');




-- --------------------------------------------------------

--
-- Table structure for table `PatternCount`
--

CREATE TABLE IF NOT EXISTS `PatternCount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatternID` int(11) NOT NULL,
  `Count` smallint(6) NOT NULL,
  `CountOrder` char(1) DEFAULT NULL,
  `Counted` tinyint(1) NOT NULL DEFAULT '1',
  `MotionID` int(11) DEFAULT NULL,
  `BodyMovementID` int(11) DEFAULT NULL,
  `EyesTo` enum('12:00','1:00','2:00','3:00','4:00','5:00','6:00','7:00','8:00','9:00','10:00','11:00','1:30','4:30','7:30','10:30') DEFAULT NULL,
  `EyesDiagramDirection` enum('A','B','C','D','E','F','G','H','AC','AD','AE','BC','BD','BF','CE','CF','DE','DF','DG','~A','~B','~C','~D','~E','~F') DEFAULT NULL,
  `FeetInMotion` varchar(50) DEFAULT NULL,
  `LegLR` enum('L','R') DEFAULT NULL,
  `LegSection` enum('Low','Mid','High') DEFAULT NULL,
  `LegTechniqueID` int(11) DEFAULT NULL,
  `IsLegTechniqueFlying` tinyint(1) NOT NULL DEFAULT '0',
  `LegTo` enum('12:00','1:00','2:00','3:00','4:00','5:00','6:00','7:00','8:00','9:00','10:00','11:00','1:30','4:30','7:30','10:30') DEFAULT NULL,
  `LegDiagramDirection` enum('A','B','C','D','E','F','AC','AD','BC','BD','BF','CE','CF','DE','DF','~A','~B','~C','~D','~E','~F') DEFAULT NULL,
  `LegTool` enum('Ball of Foot','Heel','Back of Heel','Instep','Side Instep','Foot Sword','Side Sole','Knee','Reverse Foot Sword','Foot','Foot Sole','Toes') DEFAULT NULL,
  `Facing` enum('F','H','S','RH','RS','&nbsp;') DEFAULT NULL,
  `ArmLR` enum('L','R') DEFAULT NULL,
  `ArmSection` enum('Low','Mid','High','L Mid+R High','R Mid+L High','Low>Mid') DEFAULT NULL,
  `ArmTechniqueID` int(11) DEFAULT NULL,
  `ArmTo` enum('12:00','1:00','2:00','3:00','4:00','5:00','6:00','7:00','8:00','9:00','10:00','11:00','1:30','4:30','7:30','10:30') DEFAULT NULL,
  `ArmDiagramDirection` enum('A','B','C','D','E','F','AC','AD','BC','BD','BF','CE','CF','DE','DF','~A','~B','~C','~D','~E','~F') DEFAULT NULL,
  `ArmTool` enum('Forefist','Side Fist','Backfist','Middle-Knuckle Fist','Foreknuckle Fist','Long Fist','Open Fist','X-Fist','Forearm','Inner Forearm','Outer Forearm','Knife-Hand','Reverse Knife-Hand','X-Knife-Hand','Palm','Palm Heel','Alternate Palm','Arc Hand','Backhand','Elbow','Side Elbow','Back Elbow','Fingertip','Straight Fingertip','Flat Fingertip','Upset Fingertip','Double Finger','Bow Wrist','Angle Fingertip','Under Fist','X-Palm','Straight Forearm','Straight Knife-Hand','Thumb Ridge','Back Forearm','Straight Elbow','Front Elbow','Finger Pincers') DEFAULT NULL,
  `IsArmToolTwin` tinyint(1) NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL,
  `OriginalTechniqueID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000000 ;

--
-- Dumping data for table `PatternCount`
--

-- Saju Jurgi (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1000, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10000, NULL, NULL, NULL),
(1000, 1, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1000, 2, 'a', 1, '9:00', 'B', 'R>L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1000, 2, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1000, 3, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1000, 4, 'a', 1, '6:00', 'C', 'R>L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1000, 4, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1000, 5, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1000, 6, 'a', 1, '3:00', 'A', 'R>L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1000, 6, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1000, 7, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1000, 999, NULL, 1, '12:00', 'D', 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10000, NULL, NULL, 'ERROR - large diag'),

(1001, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10000, NULL, NULL, NULL),
(1001, 1, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1001, 2, 'a', 1, '3:00', 'A', 'L>R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3002, NULL, NULL, NULL, NULL),
(1001, 2, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1001, 3, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1001, 4, 'a', 1, '6:00', 'C', 'L>R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3002, NULL, NULL, NULL, NULL),
(1001, 4, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1001, 5, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1001, 6, 'a', 1, '9:00', 'B', 'L>R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3002, NULL, NULL, NULL, NULL),
(1001, 6, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1001, 7, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1001, 999, NULL, 1, '12:00', 'D', 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3002, 10000, NULL, NULL, NULL);


-- Saju Makgi (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1002, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10000, NULL, NULL, NULL),
(1002, 1, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1002, 2, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1002, 3, 'a', 1, '9:00', 'B', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1002, 3, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1002, 4, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1002, 5, 'a', 1, '6:00', 'C', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1002, 5, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1002, 6, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1002, 7, 'a', 1, '3:00', 'A', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1002, 7, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1002, 8, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1002, 999, NULL, 1, '12:00', 'D', 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10000, NULL, NULL, NULL),

(1003, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10000, NULL, NULL, NULL),
(1003, 1, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1003, 2, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1003, 3, 'a', 1, '3:00', 'A', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3002, NULL, NULL, NULL, NULL),
(1003, 3, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1003, 4, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1003, 5, 'a', 1, '6:00', 'C', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3002, NULL, NULL, NULL, NULL),
(1003, 5, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1003, 6, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1003, 7, 'a', 1, '9:00', 'B', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3002, NULL, NULL, NULL, NULL),
(1003, 7, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10100, 10400, NULL, NULL),
(1003, 8, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1003, 999, NULL, 1, '12:00', 'D', 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3002, 10000, NULL, NULL, NULL);


-- Chon-Ji (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `note`, `OriginalTechniqueID`) VALUES
(1004, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10000, NULL, NULL, NULL),
(1004, 1, NULL, 1, '9:00', 'B', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3001, 10100, 10400, 'L>R?', NULL),
(1004, 2, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1004, 3, NULL, 1, '3:00', 'A', 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3004, 10100, 10400, 'R>L?', NULL),
(1004, 4, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1004, 5, NULL, 1, '12:00', 'D', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3001, 10100, 10400, NULL, NULL),
(1004, 6, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1004, 7, NULL, 1, '6:00', 'C', 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3004, 10100, 10400, 'R>L?', NULL),
(1004, 8, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1004, 9, NULL, 1, '3:00', 'A', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3001, 10104, 10400, NULL, NULL),
(1004, 10, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1004, 11, NULL, 1, '9:00', 'B', 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3004, 10104, 10400, 'R>L?', NULL),
(1004, 12, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1004, 13, NULL, 1, '6:00', 'C', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3001, 10104, 10400, NULL, NULL),
(1004, 14, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1004, 15, NULL, 1, '12:00', 'D', 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3004, 10104, 10400, 'R>L?', NULL),
(1004, 16, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1004, 17, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1004, 18, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3003, 10100, 10200, NULL, NULL),
(1004, 19, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3003, 10100, 10200, NULL, NULL),
(1004, 999, NULL, '0', NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3000, 10000, NULL, NULL, NULL);


-- Dan-Gun (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `note`, `OriginalTechniqueID`) VALUES
(1005, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10000, NULL, NULL, NULL),
(1005, 1, NULL, 1, '9:00', 'B', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3001, 10104, 10403, 'L>R?', NULL),
(1005, 2, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1005, 3, NULL, 1, '3:00', 'A', 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3004, 10104, 10403, 'R>L?', NULL),
(1005, 4, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1005, 5, NULL, 1, '12:00', 'D', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3001, 10100, 10400, NULL, NULL),
(1005, 6, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1005, 7, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1005, 8, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1005, 9, NULL, 1, '3:00', 'E', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'L Mid+R High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3005, 10104, 10400, NULL, NULL),
(1005, 10, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1005, 11, NULL, 1, '9:00', 'F', 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'R Mid+L High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3004, 10104, 10400, 'R>L?', NULL),
(1005, 12, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1005, 13, NULL, 1, '6:00', 'C', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3001, 10100, 10400, NULL, NULL),
(1005, 14, NULL, '0', NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', 2001, NULL, NULL, 10402, 'Cont not on sep line', NULL),
(1005, 15, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1005, 16, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1005, 17, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1005, 18, NULL, 1, '9:00', 'B', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3005, 10104, 10218, NULL, NULL),
(1005, 19, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1005, 20, NULL, 1, '3:00', 'A', 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3004, 10104, 10218, 'R>L?', NULL),
(1005, 21, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1005, 999, NULL, '0', '12:00', 'D', 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10000, NULL, NULL, NULL);


-- Do-San (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1006, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10000, NULL, NULL, NULL),
(1006, 1, NULL, 1, '9:00', 'B', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3001, 10100, 10400, 10491, 'L>R?'),
(1006, 2, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1006, 3, 'a', 1, '3:00', 'A', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3006, 10706, NULL, NULL, NULL),
(1006, 3, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, NULL, 10100, 10400, 10491, NULL),
(1006, 4, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1006, 5, NULL, 1, '12:00', 'D', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3001, 10104, 10403, NULL, NULL),
(1006, 6, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Straight Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1006, 6, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10407, NULL, NULL),
(1006, 7, 'a', 1, NULL, NULL, 'Lh+Rh', NULL, NULL, '0', '10:00', '~D', NULL, 'R', NULL, NULL, NULL, NULL, '0', 'H', NULL, 3039, 10700, 10604, NULL, 'releasing motion-esque'),
(1006, 7, 'b', 1, '12:00', 'D', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3047, 10100, 10205, NULL, 'L>R?? side front?'),
(1006, 8, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3000, 10100, 10205, NULL, 'side front?'),
(1006, 9, NULL, 1, '3:00', 'E', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3005, 10100, 10400, 10491, NULL),
(1006, 10, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1006, 11, 'a', 1, '9:00', 'F', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3006, 10706, NULL, NULL, NULL),
(1006, 11, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, NULL, 10100, 10400, 10491, NULL),
(1006, 12, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1006, 13, NULL, 1, '4:30', 'CE', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3102, 10100, 10404, NULL, NULL),
(1006, 14, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1006, 15, NULL, '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1006, 16, NULL, '0', NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1006, 17, NULL, 1, '7:30', 'CF', 'R>L;R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3002, 10100, 10404, NULL, NULL),
(1006, 18, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1006, 19, NULL, '0', NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1006, 20, NULL, '0', NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1006, 21, NULL, 1, '6:00', 'C', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3100, 10100, 10402, NULL, NULL),
(1006, 22, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1006, 23, NULL, 1, '9:00', 'B', 'L>R;L', NULL, NULL, '0', '12:00', 'D', NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, 3005, 10106, 10218, NULL, NULL),
(1006, 24, 'a', 1, '3:00', 'A', 'L>R', 'L', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10701, NULL, NULL, NULL),
(1006, 24, 'b', 1, NULL, NULL, 'Lh+R', NULL, NULL, '0', '12:00', 'D', NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, 3031, 10106, 10218, NULL, NULL),
(1006, 999, NULL, '0', '12:00', 'D', 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10000, NULL, NULL, NULL);


-- Won-Hyo (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1007, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10003, NULL, NULL, NULL),
(1007, 1, NULL, 1, '9:00', 'B', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'L Mid+R High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3001, 10104, 10400, NULL, NULL),
(1007, 2, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, NULL, 10215, NULL, NULL),
(1007, 2, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1007, 3, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3011, 10105, 10200, NULL, 'L>R?'),
(1007, 4, 'a', 1, '3:00', 'A', 'L>R', 'L', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10701, NULL, NULL, NULL),
(1007, 4, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'R Mid+L High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3000, 10104, 10400, NULL, NULL),
(1007, 5, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, NULL, 10215, NULL, NULL),
(1007, 5, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1007, 6, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3011, 10105, 10200, NULL, 'R>L?'),
(1007, 7, 'a', 1, '12:00', 'D', 'R>L', 'R', NULL, '0', '1:00', '~D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, 10701, NULL, NULL, NULL),
(1007, 7, 'b', 1, NULL, NULL, 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10007, NULL, NULL, NULL),
(1007, 8, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', 'L', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, NULL, 10302, 10200, NULL, NULL),
(1007, 9, NULL, '0', NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1007, 10, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1007, 11, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1007, 12, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Straight Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1007, 12, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10407, NULL, NULL),
(1007, 13, NULL, 1, '3:00', 'E', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'L Mid+R High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3005, 10104, 10400, NULL, NULL),
(1007, 14, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, NULL, 10215, NULL, NULL),
(1007, 14, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1007, 15, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3011, 10105, 10200, NULL, 'L>R?'),
(1007, 16, 'a', 1, '9:00', 'F', 'L>R', 'L', NULL, '0', '6:00', 'C', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10701, NULL, NULL, NULL),
(1007, 16, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'R Mid+L High', NULL, NULL, 'Forearm', 1, 'H', NULL, NULL, 10104, 10400, NULL, NULL),
(1007, 17, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, NULL, 10215, NULL, NULL),
(1007, 17, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1007, 18, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3011, 10105, 10200, NULL, 'R>L?'),
(1007, 19, 'a', 1, '6:00', 'C', 'R>L', NULL, NULL, '0', '7:00', '~C', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, 10720, NULL, NULL, NULL),
(1007, 19, 'b', 1, NULL, NULL, 'L+Rh', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', '8:00', 'CF', 'Inner Forearm', '0', 'RH', NULL, 3000, 10100, 10405, NULL, NULL),
(1007, 20, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1007, 21, NULL, '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1007, 22, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', '4:00', 'CE', 'Inner Forearm', '0', 'RH', NULL, NULL, NULL, 10405, NULL, NULL),
(1007, 23, NULL, 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1007, 24, NULL, '0', NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1007, 25, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3000, 10007, NULL, NULL, 'ERROR turn the face toward c?'),
(1007, 26, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, NULL, 10302, 10200, NULL, NULL),
(1007, 27, 'a', '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10702, NULL, NULL, NULL),
(1007, 27, 'b', '0', '9:00', 'B', 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3005, 10104, 10403, NULL, NULL),
(1007, 28, 'a', 1, '3:00', 'A', 'L>R', 'L', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10701, NULL, NULL, NULL),
(1007, 28, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1007, 999, NULL, '0', '12:00', 'D', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10003, NULL, NULL, NULL);


-- Yul-Gok (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1008, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10000, NULL, NULL, NULL),
(1008, 1, NULL, 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, NULL, '0', 'F', NULL, 3013, 10106, 10631, NULL, 'horo'),
(1008, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1008, 3, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1008, 4, 'a', 1, NULL, NULL, 'L>R', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3031, 10701, NULL, NULL, NULL),
(1008, 4, 'b', 1, NULL, NULL, 'Lh+R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, NULL, '0', 'F', NULL, 3031, 10106, 10631, NULL, NULL),
(1008, 5, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1008, 6, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1008, 7, NULL, 1, '1:30', 'AD', 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3101, 10100, 10400, 10491, 'R>L?'),
(1008, 8, NULL, 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1008, 9, NULL, '0', NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1008, 10, NULL, '0', NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1008, 11, NULL, 1, '10:30', 'BD', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3001, 10100, 10400, 10491, NULL),
(1008, 12, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1008, 13, NULL, '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1008, 14, NULL, '0', NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1008, 15, NULL, 1, '12:00', 'D', 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3101, 10100, 10411, NULL, 'R>L?'),
(1008, 16, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'RH', NULL, NULL, NULL, 10411, NULL, NULL),
(1008, 17, NULL, '0', NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2003, NULL, NULL, 10200, NULL, 'no diff in foot diags for connecting vs cont'),
(1008, 18, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3000, 10100, 10411, NULL, NULL),
(1008, 19, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'RH', NULL, NULL, NULL, 10411, NULL, NULL),
(1008, 20, NULL, '0', NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2003, NULL, NULL, 10200, NULL, 'no diff in foot diags for connecting vs cont, conn not on diff line'),
(1008, 21, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1008, 22, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3000, 10007, NULL, NULL, NULL),
(1008, 23, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', 'L', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, NULL, 10302, 10200, NULL, NULL),
(1008, 24, 'a', '0', NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', 'F', NULL, 3000, 10100, 10201, 10292, NULL),
(1008, 24, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10629, NULL, NULL),
(1008, 25, NULL, 1, '6:00', 'C', 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3004, 10007, NULL, NULL, NULL),
(1008, 26, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, NULL, 10302, 10200, NULL, NULL),
(1008, 27, 'a', '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Elbow', '0', 'F', NULL, 3000, 10100, 10201, 10292, NULL),
(1008, 27, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10629, NULL, NULL),
(1008, 28, NULL, 1, '3:00', 'E', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'L Mid+R High', NULL, NULL, 'Knife-Hand', 1, 'H', NULL, 3001, 10104, 10400, NULL, NULL),
(1008, 29, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Straight Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1008, 29, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10407, NULL, NULL),
(1008, 30, NULL, 1, '9:00', 'F', 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'R Mid+L High', NULL, NULL, 'Knife-Hand', 1, 'H', NULL, 3004, 10104, 10400, NULL, NULL),
(1008, 31, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Straight Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1008, 31, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10407, NULL, NULL),
(1008, 32, NULL, 1, '6:00', 'C', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3001, 10100, 10400, 10491, NULL),
(1008, 33, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1008, 34, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1008, 35, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1008, 36, NULL, 1, NULL, NULL, 'L;R', 'L', NULL, '0', '8:00', 'B', NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'S', NULL, 3019, 10109, 10205, NULL, 'ERROR in diag'),
(1008, 37, NULL, 1, '3:00', 'A', 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3016, 10100, 10400, NULL, NULL),
(1008, 38, 'a', 1, '9:00', 'B', 'R>L', 'R', NULL, '0', '1:00', '~D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, 10701, NULL, NULL, NULL),
(1008, 38, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3000, 10100, 10400, NULL, NULL),
(1008, 999, NULL, '0', '12:00', 'D', 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3002, 10000, NULL, NULL, NULL);


-- Joong-Gun (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1009, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10004, NULL, NULL, NULL),
(1009, 1, NULL, 1, '9:00', 'B', 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', NULL, 3001, 10104, 10400, NULL, NULL),
(1009, 2, NULL, 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10390, 10607, NULL, NULL),
(1009, 3, 'a', '0', NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10721, NULL, NULL, NULL),
(1009, 3, 'b', '0', NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3000, 10102, 10416, NULL, NULL),
(1009, 4, NULL, 1, '3:00', 'A', 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', NULL, 3004, 10104, 10400, NULL, NULL),
(1009, 5, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10390, 10607, NULL, NULL),
(1009, 6, 'a', '0', NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10721, NULL, NULL, NULL),
(1009, 6, 'b', '0', NULL, NULL, 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3000, 10102, 10416, NULL, NULL),
(1009, 7, NULL, 1, '12:00', 'D', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3001, 10104, 10403, NULL, 'L>R?'),
(1009, 8, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Elbow', '0', 'F', NULL, 3011, 10100, 10216, NULL, 'L>R?'),
(1009, 9, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1009, 10, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Elbow', '0', 'F', NULL, 3011, 10100, 10216, NULL, 'R>L?'),
(1009, 11, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forefist', 1, 'F', NULL, 3000, 10100, 10224, NULL, NULL),
(1009, 12, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forefist', 1, 'F', NULL, 3000, 10100, 10211, NULL, NULL),
(1009, 13, 'a', 1, '6:00', 'C', 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3017, 10706, NULL, NULL, 'ERROR in diag'),
(1009, 13, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'X-Fist', '0', 'F', NULL, NULL, 10100, 10402, NULL, NULL),
(1009, 14, NULL, 1, '3:00', 'E', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3001, 10104, 10218, NULL, NULL),
(1009, 15, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', 'F', NULL, 3011, 10100, 10601, NULL, NULL),
(1009, 16, NULL, '0', NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, 'Fast motion not on seperate line'),
(1009, 17, 'a', 1, '9:00', 'F', 'L>R', 'L', NULL, '0', '5:00', '~C', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10701, NULL, NULL, 'ERROR large diag'),
(1009, 17, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3000, 10104, 10218, NULL, NULL),
(1009, 18, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', 'H', NULL, 3011, 10100, 10601, NULL, NULL),
(1009, 19, NULL, '0', NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1009, 20, 'a', 1, '6:00', 'C', 'R>L', 'R', NULL, '0', '7:00', '~C', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, 10701, NULL, NULL, NULL),
(1009, 20, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3000, 10100, 10400, NULL, NULL),
(1009, 21, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3018, 10104, 10200, NULL, 'L>R?'),
(1009, 22, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, NULL, 10302, 10200, NULL, NULL),
(1009, 23, NULL, '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3000, 10100, 10400, NULL, NULL),
(1009, 24, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3018, 10104, 10200, NULL, NULL),
(1009, 25, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', 'L', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, NULL, 10302, 10200, NULL, NULL),
(1009, 26, NULL, '0', NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1009, 27, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Palm', '0', 'F', 2004, 3011, 10101, 10406, NULL, 'L>R?'),
(1009, 27, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1009, 28, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1009, 29, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Palm', '0', 'F', 2004, 3011, 10101, 10406, NULL, 'ERROR in diag, R>L? slow motion not on sep line'),
(1009, 29, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1009, 30, NULL, 1, '3:00', 'A', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2004, 3001, 10110, 10225, NULL, 'slow motion not on sep line'),
(1009, 31, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'R Mid+L High', NULL, NULL, 'Reverse Knife-Hand', 1, 'H', NULL, 3000, 10105, 10412, NULL, NULL),
(1009, 32, 'a', 1, '9:00', 'B', 'R>L', 'R', NULL, '0', '1:00', '~D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, 10701, NULL, NULL, NULL),
(1009, 32, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'L Mid+R High', NULL, NULL, 'Reverse Knife-Hand', 1, 'H', NULL, 3000, 10105, 10412, NULL, NULL),
(1009, 999, NULL, '0', '12:00', 'D', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3002, 10004, NULL, NULL, NULL);


-- Toi-Gye (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1010, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10004, NULL, NULL, NULL),
(1010, 1, NULL, 1, '9:00', 'B', 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3001, 10104, 10400, NULL, NULL),
(1010, 2, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Upset Fingertip', '0', 'F', NULL, 3011, 10100, 10202, NULL, NULL),
(1010, 2, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1010, 3, 'a', 1, '12:00', 'D', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', '6:00', 'C', 'Backfist', '0', 'F', 2004, 3002, 10110, 10207, NULL, NULL),
(1010, 3, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10630, NULL, NULL),
(1010, 4, NULL, 1, '3:00', 'A', 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3002, 10104, 10400, NULL, NULL),
(1010, 5, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Upset Fingertip', '0', 'F', NULL, 3011, 10100, 10202, NULL, NULL),
(1010, 5, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1010, 6, 'a', 1, '12:00', 'D', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', '6:00', 'C', 'Backfist', '0', 'F', 2004, 3001, 10110, 10207, NULL, NULL),
(1010, 6, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10630, NULL, NULL),
(1010, 7, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'F', NULL, 3000, 10100, 10406, NULL, NULL),
(1010, 8, NULL, '0', NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forefist', 1, 'F', 2001, NULL, NULL, 10224, NULL, NULL),
(1010, 9, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1010, 10, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1010, 11, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, 'missing Lh diagram'),
(1010, 12, NULL, 1, '9:00', 'F', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Elbow', 1, 'F', 2004, 3001, 10110, 10203, 10293, 'was 10201 thrust, slow motion not on sep line'),
(1010, 13, NULL, 1, '6:00', 'C', 'R!', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3001, 10106, 10417, NULL, 'Specifies right!?'),
(1010, 14, NULL, 1, '12:00', 'D', 'L!', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3004, 10106, 10417, NULL, 'Specifies left!?'),
(1010, 15, NULL, 1, '6:00', 'C', 'L!', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3004, 10106, 10417, NULL, 'Specifies left!?'),
(1010, 16, NULL, 1, '12:00', 'D', 'R!', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3012, 10106, 10417, NULL, 'Specifies right!?'),
(1010, 17, NULL, 1, '6:00', 'C', 'L!', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3004, 10106, 10417, NULL, 'Specifies left!?'),
(1010, 18, NULL, 1, '12:00', 'D', 'L!', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3004, 10106, 10417, NULL, 'Specifies left!?'),
(1010, 19, 'a', 1, NULL, NULL, 'R>L', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3032, 10701, NULL, NULL, NULL),
(1010, 19, 'b', 1, NULL, NULL, 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', 1, 'H', NULL, 3000, 10104, 10418, NULL, NULL),
(1010, 20, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, NULL, '0', 'F', NULL, 3011, 10100, 10610, NULL, 'L>R?'),
(1010, 21, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Knee', NULL, 'Mid', NULL, NULL, NULL, '0', 'F', NULL, NULL, 10303, 10606, NULL, NULL),
(1010, 22, 'a', '0', NULL, NULL, 'R>L', 'R', NULL, '0', '11:00', '~D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3032, 10701, NULL, NULL, NULL),
(1010, 22, 'b', '0', '6:00', 'C', 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3012, 10104, 10403, NULL, NULL),
(1010, 23, NULL, 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10390, 10607, NULL, NULL),
(1010, 24, NULL, '0', NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1010, 25, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1010, 26, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10390, 10607, NULL, NULL),
(1010, 27, NULL, '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1010, 28, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', '12:00', 'D', 'Backfist', '0', 'H', NULL, 3003, 10104, 10207, NULL, '2 techs 1 count'),
(1010, 28, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', NULL, NULL, NULL, NULL, 10400, NULL, 'no look on backfist!?'),
(1010, 29, 'a', 1, NULL, NULL, 'R+L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3019, NULL, NULL, NULL, '~1/2 SW shift L'),
(1010, 29, 'b', 1, '3:00', 'A', NULL, 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'F', NULL, 3001, 10109, 10406, NULL, NULL),
(1010, 30, NULL, 1, '6:00', 'C', 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3002, 10100, 10400, NULL, NULL),
(1010, 31, NULL, 1, '9:00', 'B', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3005, 10104, 10403, NULL, NULL),
(1010, 32, NULL, 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', '10:00', 'BD', 'Inner Forearm', '0', 'RH', NULL, 3011, 10100, 10405, NULL, NULL),
(1010, 33, 'a', 1, '3:00', 'A', 'L>R', 'L', NULL, '0', '11:00', '~D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10701, NULL, NULL, NULL),
(1010, 33, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1010, 34, NULL, 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', '2:00', 'AD', 'Inner Forearm', '0', 'RH', NULL, 3011, 10100, 10405, NULL, NULL),
(1010, 35, NULL, 1, '10:30', 'BD', 'Rh+Lh', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', '12:00', 'D', 'Inner Forearm', '0', 'RH', NULL, 3110, 10100, 10405, NULL, 'ERROR Not CE'),
(1010, 36, NULL, 1, '3:00', 'A', 'Rh+Lh', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', '2:00', 'AD', 'Inner Forearm', '0', 'RH', NULL, 3111, 10100, 10405, NULL, NULL),
(1010, 37, NULL, 1, '12:00', 'D', 'R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3002, 10106, 10200, NULL, NULL),
(1010, 999, NULL, '0', NULL, NULL, 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10004, NULL, NULL, NULL);


-- Saju Tulgi (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `note`, `OriginalTechniqueID`) VALUES
(1011, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10005, NULL, NULL, NULL),
(1011, 1, 'a', 1, NULL, NULL, 'R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3000, NULL, NULL, 'ERROR large diag differs', NULL),
(1011, 1, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', '6:00', 'C', NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', 'H', NULL, 3022, 10104, 10203, 'was 10201 thrust', 10293),
(1011, 2, 'a', 1, '9:00', 'B', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1011, 2, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', '3:00', 'A', NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', 'H', NULL, 3022, 10104, 10203, 'was 10201 thrust', 10293),
(1011, 3, 'a', 1, '6:00', 'C', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3001, NULL, NULL, NULL, NULL),
(1011, 3, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', '12:00', 'D', NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', NULL, NULL, 3022, 10104, 10203, 'was 10201 thrust', 10293),
(1011, 4, 'a', 1, '3:00', 'A', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3001, NULL, NULL, NULL, NULL),
(1011, 4, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', '9:00', 'B', NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', NULL, NULL, 3022, 10104, 10203, 'was 10201 thrust', 10293),
(1011, 999, NULL, '0', '12:00', 'D', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10005, NULL, NULL, NULL),

(1012, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10005, NULL, NULL, NULL),
(1012, 1, 'a', 1, NULL, NULL, 'L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3000, NULL, NULL, NULL, NULL),
(1012, 1, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', '6:00', 'C', NULL, 'L', 'Mid', NULL, NULL, 'Elbow', '0', 'H', NULL, 3022, 10104, 10203, 'was 10201 thrust', 10293),
(1012, 2, 'a', 1, '3:00', 'A', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3002, NULL, NULL, NULL, NULL),
(1012, 2, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', '9:00', 'B', NULL, 'L', 'Mid', NULL, NULL, 'Elbow', '0', NULL, NULL, 3022, 10104, 10203, 'was 10201 thrust', 10293),
(1012, 3, 'a', 1, '6:00', 'C', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3002, NULL, NULL, NULL, NULL),
(1012, 3, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', '12:00', 'D', NULL, 'L', 'Mid', NULL, NULL, 'Elbow', '0', NULL, NULL, 3022, 10104, 10203, 'was 10201 thrust', 10293),
(1012, 4, 'a', 1, '9:00', 'B', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3002, NULL, NULL, NULL, NULL),
(1012, 4, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', '3:00', 'A', NULL, 'L', 'Mid', NULL, NULL, 'Elbow', '0', NULL, NULL, 3022, 10104, 10203, 'was 10201 thrust', 10293),
(1012, 999, NULL, '0', '12:00', 'D', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3002, 10005, NULL, NULL, NULL);


-- Hwa-Rang (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `note`, `OriginalTechniqueID`) VALUES
(1013, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10005, NULL, NULL, NULL),
(1013, 1, NULL, 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3013, 10106, 10418, NULL, NULL),
(1013, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1013, 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1013, 4, NULL, 1, '3:00', 'A', 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'R Mid+L High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3002, 10104, 10400, 'R>L?', NULL),
(1013, 5, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'H', NULL, NULL, NULL, 10217, NULL, NULL),
(1013, 5, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1013, 6, NULL, 1, NULL, NULL, 'L;R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3022, 10105, 10200, 'R>L?', NULL),
(1013, 7, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3018, 10103, 10210, NULL, NULL),
(1013, 8, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1013, 9, NULL, 1, '12:00', 'D', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3001, 10100, 10400, NULL, NULL),
(1013, 10, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1013, 11, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', '11:00', '~D', NULL, 'L', NULL, NULL, NULL, NULL, '0', 'H', NULL, 3011, 10703, 10622, NULL, NULL),
(1013, 11, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10632, NULL, NULL),
(1013, 12, 'a', 1, NULL, NULL, 'Lh+R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3032, 10302, 10612, NULL, NULL),
(1013, 12, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10218, '2 techs 1 count', NULL),
(1013, 13, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1013, 14, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1013, 15, NULL, 1, '3:00', 'E', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3005, 10104, 10403, NULL, NULL),
(1013, 16, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Straight Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1013, 16, 'b', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10407, NULL, NULL),
(1013, 17, 'a', 1, '9:00', 'F', 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3017, 10706, NULL, NULL, NULL),
(1013, 17, 'b', 1, NULL, NULL, 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, 10104, 10403, NULL, NULL),
(1013, 18, 'a', 1, NULL, NULL, 'R', 'R', 'High', '0', '10:00', 'DF', 'Foot', NULL, NULL, NULL, NULL, NULL, NULL, 'H', NULL, 3032, 10304, NULL, NULL, NULL),
(1013, 18, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10706, NULL, NULL, NULL),
(1013, 19, 'a', '0', NULL, NULL, 'Rh+L', 'L', 'High', '0', '8:00', 'CF', 'Foot', NULL, NULL, NULL, NULL, NULL, NULL, 'H', 2002, 3032, 10304, NULL, NULL, NULL),
(1013, 19, 'b', '0', NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, '2 techs 1 count', NULL),
(1013, 20, NULL, 1, '6:00', 'C', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3001, 10100, 10400, NULL, NULL),
(1013, 21, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3018, 10104, 10200, NULL, NULL),
(1013, 22, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3000, 10104, 10200, NULL, NULL),
(1013, 23, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3000, 10104, 10200, NULL, NULL),
(1013, 24, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'F', NULL, 3011, 10100, 10406, NULL, NULL),
(1013, 25, 'a', 1, NULL, NULL, 'R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3000, NULL, NULL, NULL, NULL),
(1013, 25, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', '12:00', 'D', NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', 'H', NULL, 3022, 10104, 10203, 'was 10201 thrust, ~1 SW shift R', 10293),
(1013, 26, 'a', 1, '9:00', 'B', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Inner Forearm', '0', 'F', NULL, 3005, 10110, 10420, NULL, NULL),
(1013, 26, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10630, NULL, NULL),
(1013, 27, 'a', 1, NULL, NULL, 'Lh+Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Inner Forearm', '0', 'F', NULL, NULL, 10110, 10420, NULL, NULL),
(1013, 27, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10630, NULL, NULL),
(1013, 28, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1013, 29, 'a', 1, '3:00', 'A', 'L>R', 'L', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10701, NULL, NULL, NULL),
(1013, 29, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1013, 999, NULL, '0', '12:00', 'D', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10005, NULL, NULL, NULL);


-- Choong-Moo (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1014, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10000, NULL, NULL, NULL),
(1014, 1, NULL, 1, '9:00', 'B', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'L Mid+R High', NULL, NULL, 'Knife-Hand', 1, 'H', NULL, 3001, 10104, 10400, NULL, NULL),
(1014, 2, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, 3000, 10100, 10201, 10291, NULL),
(1014, 2, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10614, NULL, 'used to be a rising block in 1959'),
(1014, 3, NULL, 1, '3:00', 'A', 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3004, 10104, 10403, NULL, 'R>L?'),
(1014, 4, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1014, 5, NULL, 1, '12:00', 'D', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3001, 10104, 10403, NULL, NULL),
(1014, 6, NULL, 1, '6:00', 'C', 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3004, 10007, NULL, NULL, NULL),
(1014, 7, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, NULL, 10302, 10200, NULL, NULL),
(1014, 8, NULL, '0', '12:00', 'D', 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3012, 10104, 10403, NULL, NULL),
(1014, 9, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '&nbsp;', NULL, 3000, 10705, 10999, NULL, 'this should probabyl be to side front, as is pictured'),
(1014, 9, 'b', 1, NULL, NULL, 'L+R', 'R', 'Mid', 1, NULL, NULL, 'Foot Sword', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, 3023, 10302, 10200, NULL, 'was 10305'),
(1014, 9, 'c', 1, NULL, NULL, '&nbsp;', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3032, 10104, 10403, NULL, '3 or 2 steps?'),
(1014, 10, NULL, 1, '3:00', 'E', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3005, 10104, 10400, NULL, NULL),
(1014, 11, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, NULL, '0', 'F', NULL, 3011, 10100, 10610, NULL, 'L>R?'),
(1014, 12, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Knee', NULL, 'Mid', NULL, NULL, NULL, '0', 'F', NULL, NULL, 10303, 10606, NULL, NULL),
(1014, 13, 'a', '0', NULL, NULL, 'R>L', 'R', NULL, '0', '3:00', 'E', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 10701, 10999, NULL, NULL),
(1014, 13, 'b', '0', '9:00', 'F', 'Rh+L', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Reverse Knife-Hand', '0', 'F', NULL, 3012, 10999, 10201, 10291, NULL),
(1014, 13, 'c', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10100, 10615, NULL, '3 or 2 steps?'),
(1014, 14, 'a', 1, NULL, NULL, 'R', 'R', 'High', '0', '10:00', 'DF', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10304, NULL, NULL, NULL),
(1014, 14, 'b', 1, NULL, NULL, 'R>L', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 10701, NULL, NULL, NULL),
(1014, 15, NULL, '0', '9:00', 'F', 'Rh+L', 'L', 'Mid', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', NULL, 2002, 3047, 10306, NULL, NULL, NULL),
(1014, 16, NULL, 1, '3:00', 'E', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3004, 10104, 10403, NULL, NULL),
(1014, 17, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', '2:00', 'DE', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10304, NULL, NULL, NULL),
(1014, 18, 'a', 1, '6:00', 'C', 'L>R', 'L', NULL, '0', '4:00', '~E', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3002, 10701, NULL, NULL, NULL),
(1014, 18, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'R Mid+L High', NULL, NULL, 'Reverse Knife-Hand', 1, 'H', NULL, 3000, 10105, 10412, NULL, NULL),
(1014, 19, NULL, 1, '6:00', 'C', 'L+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3024, 10104, 10403, NULL, NULL),
(1014, 20, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Upset Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1014, 20, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1014, 21, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', '2:00', 'D', 'Backfist', '0', 'H', NULL, 3018, 10104, 10207, NULL, 'app shows backfist, but never a look!?'),
(1014, 21, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', NULL, NULL, NULL, NULL, 10400, NULL, NULL),
(1014, 22, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Straight Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1014, 22, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10407, NULL, NULL),
(1014, 23, NULL, 1, '9:00', 'B', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3005, 10100, 10400, NULL, NULL),
(1014, 24, 'a', 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1014, 24, 'b', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forearm', '0', 'F', NULL, 3031, 10106, 10410, NULL, NULL),
(1014, 24, 'c', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', '9:00', 'B', 'Backfist', '0', 'S', NULL, NULL, NULL, 10205, NULL, NULL),
(1014, 25, 'a', 1, '3:00', 'A', 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, 3001, 10302, 10200, NULL, NULL),
(1014, 25, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10704, 10999, NULL, NULL),
(1014, 26, NULL, 1, NULL, NULL, 'Rh+L', 'L', 'Mid', '0', NULL, NULL, 'Foot', 'L', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, NULL, 10302, 10200, NULL, NULL),
(1014, 27, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', '7:00', '~C', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10704, NULL, NULL, NULL),
(1014, 27, 'b', 1, '9:00', 'B', 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'X-Knife-Hand', '0', 'H', NULL, 3004, 10104, 10421, NULL, NULL),
(1014, 28, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Palm', 1, 'F', NULL, 3000, 10100, 10416, NULL, NULL),
(1014, 29, 'a', 1, '3:00', 'A', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3006, 10706, NULL, NULL, 'foot not on line AB'),
(1014, 29, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, NULL, 10100, 10402, NULL, NULL),
(1014, 30, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1014, 999, NULL, '0', '12:00', 'D', 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10000, NULL, NULL, NULL);


-- Kwang-Gae (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `note`, `OriginalTechniqueID`) VALUES
(1015, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10001, NULL, NULL, NULL),
(1015, 1, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10999, 10647, NULL, NULL),
(1015, 1, 'b', 1, NULL, NULL, 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10004, 10611, NULL, NULL),
(1015, 2, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2004, 3000, 10100, 10211, NULL, NULL),
(1015, 3, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2004, 3000, 10100, 10211, NULL, NULL),
(1015, 4, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3025, 10705, NULL, NULL, NULL),
(1015, 4, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Palm', '0', 'H', NULL, NULL, 10100, 10411, NULL, NULL),
(1015, 5, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1015, 5, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3026, 10104, 10403, NULL, NULL),
(1015, 6, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3025, 10705, NULL, NULL, NULL),
(1015, 6, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Palm', '0', 'H', NULL, NULL, 10100, 10411, NULL, NULL),
(1015, 7, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1015, 7, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3026, 10104, 10403, NULL, NULL),
(1015, 8, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10102, 10403, NULL, NULL),
(1015, 9, NULL, 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10102, 10403, NULL, NULL),
(1015, 10, 'a', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10705, 10999, NULL, NULL),
(1015, 10, 'b', 1, '6:00', 'C', 'Lh+R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, 10999, 10999, NULL, NULL),
(1015, 10, 'c', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'H', 2004, 3003, 10100, 10416, '3 parts or 2?', NULL),
(1015, 11, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'H', 2004, 3000, 10100, 10416, NULL, NULL),
(1015, 12, 'a', 1, NULL, NULL, 'L>R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, 3000, 10110, 10410, NULL, NULL),
(1015, 12, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10628, NULL, NULL),
(1015, 13, NULL, 1, '3:00', 'E', 'L', 'L', 'Low', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3001, 10307, 10607, NULL, NULL),
(1015, 14, NULL, '0', NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', 2005, NULL, 10302, 10607, NULL, NULL),
(1015, 15, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10215, NULL, NULL),
(1015, 15, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1015, 16, NULL, 1, NULL, NULL, 'L>R', NULL, NULL, '0', '6:00', 'C', NULL, 'L', 'Mid', NULL, NULL, 'Side Fist', '0', 'S', NULL, 3018, 10110, 10210, NULL, NULL),
(1015, 17, NULL, 1, '9:00', 'F', 'R', 'R', 'Low', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3004, 10307, 10607, NULL, NULL),
(1015, 18, NULL, '0', NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', 2005, NULL, 10302, 10607, NULL, NULL),
(1015, 19, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10215, NULL, NULL),
(1015, 19, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1015, 20, NULL, 1, NULL, NULL, 'R>L', NULL, NULL, '0', '6:00', 'C', NULL, 'R', 'Mid', NULL, NULL, 'Side Fist', '0', 'S', NULL, 3018, 10110, 10210, NULL, NULL),
(1015, 21, 'a', 1, '6:00', 'C', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Palm', '0', 'F', 2004, 3001, 10101, 10406, NULL, NULL),
(1015, 21, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', NULL, NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1015, 22, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Palm', '0', 'F', 2004, 3000, 10101, 10406, NULL, NULL),
(1015, 22, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', NULL, NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1015, 23, NULL, 1, '12:00', 'D', 'R!', NULL, NULL, '0', '9:00', 'F', NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'S', NULL, 3004, 10106, 10218, NULL, NULL),
(1015, 24, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forearm', 1, 'H', NULL, NULL, 10100, 10400, 'R>L?', NULL),
(1015, 25, 'a', 1, NULL, NULL, 'L+R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'RH', NULL, 3026, 10100, 10425, 'low reverse block?', 10400),
(1015, 25, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10603, 'Low block toward D yet pictured differently', NULL),
(1015, 26, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', 2004, 3011, 10101, 10202, 'R>L?', NULL),
(1015, 27, NULL, 1, '6:00', 'C', 'L!', NULL, NULL, '0', '9:00', 'F', NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'S', NULL, 3012, 10106, 10218, NULL, NULL),
(1015, 28, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forearm', 1, 'H', NULL, NULL, 10100, 10400, 'R>L?', NULL),
(1015, 29, 'a', 1, NULL, NULL, 'L+R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forearm', '0', 'RH', NULL, 3026, 10100, 10425, 'low reverse block?', 10400),
(1015, 29, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10603, 'Low block toward C yet pictured differently', NULL),
(1015, 30, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', 2004, 3011, 10101, 10202, 'L>R?', NULL),
(1015, 31, NULL, 1, NULL, NULL, 'R!', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forefist', 1, 'F', NULL, 3000, 10100, 10224, 'ERROR in diag', NULL),
(1015, 32, NULL, 1, '3:00', 'A', 'L!', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forefist', 1, 'F', NULL, 3001, 10100, 10211, 'oddly no L>R in diag', NULL),
(1015, 33, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1015, 34, 'a', 1, NULL, NULL, 'R>L', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3032, 10701, NULL, NULL, NULL),
(1015, 34, 'b', 1, '9:00', 'B', 'Rh+L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10999, NULL, NULL, NULL),
(1015, 34, 'c', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10403, '3 or 2 parts?', NULL),
(1015, 35, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1015, 36, NULL, 1, NULL, NULL, 'R!', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forefist', 1, 'F', NULL, 3000, 10100, 10211, NULL, NULL),
(1015, 37, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1015, 38, 'a', 1, NULL, NULL, 'L>R', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3032, 10701, NULL, NULL, NULL),
(1015, 38, 'b', 1, '3:00', 'A', 'Lh+R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, 10999, NULL, NULL, NULL),
(1015, 38, 'c', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10403, '3 or 2 parts?', NULL),
(1015, 39, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1015, 999, NULL, '0', '12:00', 'D', 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10001, NULL, NULL, NULL);


-- Po-Eun (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `note`, `OriginalTechniqueID`) VALUES
(1016, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10001, NULL, NULL, NULL),
(1016, 1, NULL, 1, '9:00', 'B', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3001, 10104, 10403, 'L>R?', NULL),
(1016, 2, 'a', 1, '3:00', 'A', 'R', 'L', NULL, '0', '12:00', 'D', NULL, 'L', NULL, '9:00', 'B', NULL, '0', 'S', NULL, 3004, 10111, 10600, NULL, NULL),
(1016, 2, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1016, 3, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, NULL, 10307, 10607, NULL, NULL),
(1016, 4, NULL, 1, NULL, NULL, 'R', NULL, NULL, '0', '12:00', 'D', NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, 3000, 10106, 10205, NULL, NULL),
(1016, 5, NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3001, NULL, 10225, NULL, NULL),
(1016, 6, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Inner Forearm', '0', 'F', NULL, NULL, NULL, 10420, NULL, NULL),
(1016, 6, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forefist', '0', NULL, NULL, NULL, NULL, 10406, NULL, NULL),
(1016, 7, 'a', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, NULL, 10406, NULL, NULL),
(1016, 7, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Inner Forearm', '0', NULL, NULL, NULL, NULL, 10420, NULL, NULL),
(1016, 8, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Inner Forearm', 1, 'F', 2001, NULL, NULL, 10404, NULL, NULL),
(1016, 9, 'a', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', '6:00', 'C', 'Back Elbow', '0', 'F', 2001, NULL, NULL, 10204, NULL, NULL),
(1016, 9, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10616, NULL, NULL),
(1016, 10, 'a', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, NULL, 10200, NULL, NULL),
(1016, 10, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10648, NULL, NULL),
(1016, 11, 'a', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', '6:00', 'C', 'Back Elbow', '0', 'F', 2001, NULL, NULL, 10204, NULL, NULL),
(1016, 11, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10616, NULL, NULL),
(1016, 12, NULL, '0', '3:00', 'A', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', 1, 'S', 2001, 3002, NULL, 10212, NULL, NULL),
(1016, 13, 'a', 1, '12:00', 'D', 'L', NULL, NULL, NULL, NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Outer Forearm', '0', 'F', NULL, 3001, NULL, 10410, NULL, NULL),
(1016, 13, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3031, 10109, 10618, NULL, NULL),
(1016, 14, 'a', 1, '3:00', 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3002, NULL, NULL, NULL, NULL),
(1016, 14, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'R Mid+L High', NULL, NULL, 'Reverse Knife-Hand', 1, 'H', NULL, 3000, 10104, 10413, NULL, NULL),
(1016, 15, NULL, 1, '9:00', 'B', 'L>R', NULL, NULL, '0', '12:00', 'D', NULL, NULL, 'Mid', NULL, NULL, 'Elbow', 1, 'F', 2004, 3012, 10110, 10213, NULL, NULL),
(1016, 16, 'a', 1, '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'R', 'High', '6:00', 'C', 'Backfist', '0', 'F', NULL, 3002, NULL, 10207, NULL, NULL),
(1016, 16, 'b', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3013, 10106, 10630, NULL, NULL),
(1016, 17, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Outer Forearm', '0', 'F', NULL, 3013, 10109, 10410, NULL, NULL),
(1016, 17, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10619, NULL, NULL),
(1016, 18, 'a', 1, '9:00', 'B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1016, 18, 'b', 1, NULL, NULL, 'Rh+L', NULL, NULL, '0', '12:00', 'D', NULL, NULL, 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'S', NULL, 3000, 10106, 10403, NULL, NULL),
(1016, 19, NULL, 1, '3:00', 'A', 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3004, 10104, 10403, 'R>L?', NULL),
(1016, 20, 'a', 1, '9:00', 'B', 'L', 'R', NULL, '0', '12:00', 'D', NULL, 'R', NULL, '3:00', 'A', NULL, '0', 'S', NULL, 3012, 10111, 10600, NULL, NULL),
(1016, 20, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1016, 21, NULL, 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, NULL, 10307, 10607, NULL, NULL),
(1016, 22, NULL, 1, NULL, NULL, 'L', NULL, NULL, '0', '12:00', 'D', NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, 3000, 10106, 10205, NULL, NULL),
(1016, 23, NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3002, NULL, 10225, NULL, NULL),
(1016, 24, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10406, NULL, NULL),
(1016, 24, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Inner Forearm', '0', NULL, NULL, NULL, NULL, 10420, NULL, NULL),
(1016, 25, 'a', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Inner Forearm', '0', 'F', 2001, NULL, NULL, 10420, NULL, NULL),
(1016, 25, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forefist', '0', NULL, NULL, NULL, NULL, 10406, NULL, NULL),
(1016, 26, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Inner Forearm', 1, 'F', 2001, NULL, NULL, 10404, NULL, NULL),
(1016, 27, 'a', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', '6:00', 'C', 'Back Elbow', '0', 'F', 2001, NULL, NULL, 10204, NULL, NULL),
(1016, 27, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10622, NULL, NULL),
(1016, 28, 'a', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, NULL, 10200, NULL, NULL),
(1016, 28, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10648, 'slipped', NULL),
(1016, 29, 'a', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', '6:00', 'C', 'Back Elbow', '0', 'F', 2001, NULL, NULL, 10204, NULL, NULL),
(1016, 29, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10616, 'palm or fingerbelly?', NULL),
(1016, 30, NULL, '0', '9:00', 'B', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', 1, 'S', 2001, 3001, NULL, 10212, NULL, NULL),
(1016, 31, 'a', 1, '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Outer Forearm', '0', 'F', NULL, 3002, NULL, 10410, NULL, NULL),
(1016, 31, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3013, 10109, 10618, NULL, NULL),
(1016, 32, 'a', 1, '9:00', 'B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1016, 32, 'b', 1, NULL, NULL, 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'L Mid+R High', NULL, NULL, 'Reverse Knife-Hand', 1, 'H', NULL, 3000, 10104, 10413, NULL, NULL),
(1016, 33, NULL, 1, '3:00', 'A', 'R>L', NULL, NULL, '0', '12:00', 'D', NULL, NULL, 'Mid', NULL, NULL, 'Elbow', 1, 'F', 2004, 3004, 10110, 10213, NULL, NULL),
(1016, 34, 'a', 1, '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'L', 'High', '6:00', 'C', 'Backfist', '0', 'F', NULL, 3001, NULL, 10207, NULL, NULL),
(1016, 34, 'b', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3031, 10106, 10630, NULL, NULL),
(1016, 35, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Outer Forearm', '0', 'F', NULL, 3031, 10109, 10410, NULL, NULL),
(1016, 35, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10619, NULL, NULL),
(1016, 36, 'a', 1, '3:00', 'A', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3002, NULL, NULL, NULL, NULL),
(1016, 36, 'b', 1, NULL, NULL, 'Lh+R', NULL, NULL, '0', '12:00', 'D', NULL, NULL, 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'S', NULL, 3000, 10106, 10403, NULL, NULL),
(1016, 999, NULL, '0', '12:00', 'D', 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10001, NULL, NULL, NULL);


-- Gae-Beak (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1017, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10000, NULL, NULL, NULL),
(1017, 1, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'X-Knife-Hand', '0', 'H', NULL, 3003, 10104, 10421, NULL, NULL),
(1017, 2, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'RH', NULL, NULL, 10308, 10607, NULL, NULL),
(1017, 3, NULL, '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1017, 4, NULL, '0', NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1017, 5, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3003, 10100, 10402, NULL, NULL),
(1017, 6, NULL, '0', NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', 2001, NULL, NULL, 10400, NULL, NULL),
(1017, 7, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', '1:00', 'AD', 'Arc Hand', 1, 'RH', NULL, NULL, NULL, 10425, 10400, 'no Rh?'),
(1017, 8, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3003, 10007, NULL, NULL, NULL),
(1017, 9, NULL, 1, '4:30', 'AC', 'L', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3103, 10107, 10424, NULL, NULL),
(1017, 10, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2003, NULL, 10106, 10200, NULL, NULL),
(1017, 11, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, NULL, NULL, 10201, 10291, NULL),
(1017, 11, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, NULL, 'not desc'),
(1017, 12, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10725, '0', NULL, NULL),
(1017, 12, 'b', 1, '6:00', 'C', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3101, 10104, 10403, NULL, 'L>R?'),
(1017, 13, NULL, 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10390, 10607, NULL, NULL),
(1017, 14, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, 3000, 10101, 10202, NULL, NULL),
(1017, 15, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, NULL, NULL, 10202, NULL, NULL),
(1017, 16, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, NULL, 10302, 10612, NULL, NULL),
(1017, 17, NULL, 1, '12:00', 'D', 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3012, 10104, 10403, NULL, NULL),
(1017, 18, NULL, 1, '6:00', 'C', 'R>L;R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3012, 10104, 10403, NULL, NULL),
(1017, 19, NULL, 1, '12:00', 'D', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3012, 10104, 10403, NULL, NULL),
(1017, 20, NULL, 1, '3:00', 'A', 'L', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forearm', '0', 'F', NULL, 3002, 10106, 10414, NULL, 'L>R?'),
(1017, 21, NULL, 1, '6:00', 'C', 'R>L;R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3005, 10100, 10400, NULL, NULL),
(1017, 22, 'a', 1, NULL, NULL, 'R', 'R', 'Mid', '0', '7:00', 'BC', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3032, 10304, NULL, NULL, NULL),
(1017, 22, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', '4:00', '~A', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10703, NULL, NULL, NULL),
(1017, 23, NULL, '0', NULL, NULL, 'L+R', 'R', 'Mid', 1, NULL, NULL, 'Foot Sword', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', 2002, 3019, 10302, 10200, NULL, 'was 10305'),
(1017, 24, NULL, 1, NULL, NULL, 'L;R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forefist', 1, 'F', NULL, NULL, 10100, 10224, NULL, NULL),
(1017, 25, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', '5:00', 'AC', 'Arc Hand', 1, 'RH', NULL, NULL, NULL, 10425, 10400, 'no Lh!?'),
(1017, 26, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10211, NULL, NULL),
(1017, 27, 'a', 1, '12:00', 'D', 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', 'F', NULL, 3017, 10706, 10201, 10292, NULL),
(1017, 27, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 10100, 10629, NULL, NULL),
(1017, 28, NULL, 1, NULL, NULL, 'R;L', 'R', NULL, '0', '10:00', 'BD', NULL, 'R', 'High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3019, 10109, 10400, NULL, NULL),
(1017, 29, NULL, 1, '10:30', 'BD', 'L', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3100, 10106, 10424, NULL, 'was: 10107, desc differently than #9/#10'),
(1017, 30, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2003, NULL, NULL, 10200, NULL, NULL),
(1017, 31, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, NULL, NULL, 10201, 10291, 'app shows 2 strikes and is U-Nam esque'),
(1017, 31, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, NULL, 'not desc'),
(1017, 32, 'a', 1, '6:00', 'C', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Reverse Knife-Hand', '0', 'F', NULL, 3102, 10100, 10201, 10291, NULL),
(1017, 32, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10615, NULL, NULL),
(1017, 33, NULL, 1, NULL, NULL, 'L+R', 'R', 'Mid', '0', '7:00', 'C', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3029, 10304, 10607, NULL, 'kick not pictured to C but more BC'),
(1017, 34, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', '4:00', '~A', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10703, '0', NULL, NULL),
(1017, 34, 'b', 1, '12:00', 'D', 'Rh;L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forefist', 1, 'F', NULL, 3012, 10100, 10224, NULL, NULL),
(1017, 35, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Middle-Knuckle Fist', '0', 'H', NULL, 3018, 10104, 10211, NULL, 'L>R?'),
(1017, 35, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1017, 36, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, NULL, NULL, NULL, NULL),
(1017, 36, 'b', 1, '9:00', 'B', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forearm', '0', 'F', NULL, 3001, 10106, 10414, NULL, NULL),
(1017, 37, NULL, 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'S', NULL, 3001, NULL, 10403, NULL, NULL),
(1017, 38, NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Knife-Hand', '0', 'S', 2001, 3004, NULL, 10403, NULL, NULL),
(1017, 39, NULL, 1, '3:00', 'A', 'L!', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'S', NULL, 3002, 10106, 10417, NULL, NULL),
(1017, 40, NULL, 1, '9:00', 'B', 'L!', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'S', NULL, 3004, 10106, 10417, NULL, NULL),
(1017, 41, 'a', 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1017, 41, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1017, 42, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1017, 43, 'a', 1, '12:00', 'D', 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3017, 10706, NULL, NULL, 'no X on diag'),
(1017, 43, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, NULL, 10100, 10402, NULL, NULL),
(1017, 44, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1017, 999, NULL, '0', NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3000, 10000, NULL, NULL, NULL);


-- Eui-Am (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `note`, `OriginalTechniqueID`) VALUES
(1018, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10006, NULL, NULL, NULL),
(1018, 1, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, 3003, 10100, 10409, NULL, NULL),
(1018, 1, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, 'not desc', NULL),
(1018, 2, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Outer Forearm', '0', 'RH', NULL, 3003, 10100, 10400, NULL, 10491),
(1018, 3, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1018, 4, NULL, 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'RH', NULL, NULL, 10308, 10607, NULL, NULL),
(1018, 5, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'X-Fist', '0', 'F', NULL, 3000, 10100, 10407, NULL, NULL),
(1018, 6, NULL, '0', NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'F', 2001, NULL, NULL, 10402, NULL, NULL),
(1018, 7, 'a', 1, NULL, NULL, 'R;L', 'R', NULL, '0', '10:00', 'BD', NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3019, 10109, 10205, NULL, NULL),
(1018, 7, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10619, NULL, NULL),
(1018, 8, NULL, 1, '6:00', 'C', 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3012, 10104, 10200, NULL, NULL),
(1018, 9, NULL, 1, '6:00', 'C', 'R', 'R', 'Mid', '0', '4:00', 'AC', 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3044, 10309, NULL, 'turn 300 then 60?', NULL),
(1018, 10, NULL, 1, NULL, NULL, 'R!', NULL, NULL, '0', '3:00', 'A', NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, 3000, 10106, 10205, NULL, NULL),
(1018, 11, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, NULL, 10302, 10612, NULL, NULL),
(1018, 12, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10226, NULL, NULL),
(1018, 13, NULL, 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2004, 3000, 10108, 10227, 'pulling?', NULL),
(1018, 14, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, 3003, 10100, 10409, NULL, NULL),
(1018, 14, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1018, 15, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Outer Forearm', '0', 'RH', NULL, 3003, 10100, 10400, NULL, 10491),
(1018, 16, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1018, 17, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'RH', NULL, NULL, 10308, 10607, NULL, NULL),
(1018, 18, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'X-Fist', '0', 'F', NULL, 3000, 10100, 10407, NULL, NULL),
(1018, 19, NULL, '0', NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Knife-Hand', '0', 'F', 2001, NULL, NULL, 10402, NULL, NULL),
(1018, 20, 'a', 1, NULL, NULL, 'L;R', 'L', NULL, '0', '8:00', 'BC', NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3019, 10109, 10205, 'diff diag from #7', NULL),
(1018, 20, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10619, NULL, NULL),
(1018, 21, NULL, 1, '12:00', 'D', 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3004, 10104, 10200, NULL, NULL),
(1018, 22, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', '2:00', 'AD', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3047, 10309, NULL, '300 then 60?', NULL),
(1018, 23, NULL, 1, NULL, NULL, 'L!', NULL, NULL, '0', '3:00', 'A', NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, 3000, 10106, 10205, NULL, NULL),
(1018, 24, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, NULL, 10302, 10612, NULL, NULL),
(1018, 25, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10226, NULL, NULL),
(1018, 26, NULL, 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2004, 3000, 10108, 10227, 'pulling?', NULL),
(1018, 27, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', 1, 'F', NULL, 3000, 10100, 10404, NULL, NULL),
(1018, 28, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', '11:00', 'BD', 'Reverse Knife-Hand', '0', 'RH', NULL, NULL, NULL, 10405, NULL, NULL),
(1018, 29, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Alternate Palm', 1, 'H', NULL, 3018, 10102, 10407, NULL, NULL),
(1018, 30, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3011, 10104, 10200, NULL, NULL),
(1018, 31, 'a', 1, NULL, NULL, 'L+R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', NULL, 3026, 10104, 10409, 'diag only shows about 1 FT!?', NULL),
(1018, 31, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, 'not desc', NULL),
(1018, 32, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', 1, 'F', NULL, 3000, 10100, 10404, NULL, NULL),
(1018, 33, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', '1:00', 'AD', 'Reverse Knife-Hand', '0', 'RH', NULL, NULL, NULL, 10405, NULL, NULL),
(1018, 34, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Alternate Palm', 1, 'H', NULL, 3018, 10102, 10407, NULL, NULL),
(1018, 35, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3011, 10104, 10200, NULL, NULL),
(1018, 36, 'a', 1, NULL, NULL, 'L+R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', NULL, 3026, 10104, 10409, NULL, NULL),
(1018, 36, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, 'not desc', NULL),
(1018, 37, NULL, 1, '12:00', 'D', 'R', 'R', 'High', '0', '11:00', 'BD', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3044, 10309, NULL, 'Not to front!?', NULL),
(1018, 38, NULL, '0', NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3000, 10102, 10403, NULL, NULL),
(1018, 39, NULL, 1, '12:00', 'D', 'Rh+L', 'L', 'High', '0', '1:00', 'AD', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3047, 10309, NULL, NULL, NULL),
(1018, 40, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3000, 10102, 10403, NULL, NULL),
(1018, 41, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3036, 10702, NULL, NULL, NULL),
(1018, 41, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, 10104, 10400, 'perfect example of outward block -vs- block #43!', 10425),
(1018, 42, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3018, 10100, 10200, 'L>R?', NULL),
(1018, 43, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10400, NULL, NULL),
(1018, 44, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3018, 10100, 10200, 'L>R?', NULL),
(1018, 45, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, 'no X on diags!?', NULL),
(1018, 999, NULL, '0', NULL, NULL, 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3003, 10006, NULL, NULL, NULL);


-- Choong-Jang (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `note`, `OriginalTechniqueID`) VALUES
(1019, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10003, NULL, NULL, NULL),
(1019, 1, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Inner Forearm', '0', 'F', NULL, 3031, 10106, 10420, NULL, NULL),
(1019, 1, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10630, NULL, NULL),
(1019, 2, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Inner Forearm', '0', 'F', NULL, NULL, NULL, 10420, NULL, NULL),
(1019, 2, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10630, NULL, NULL),
(1019, 3, NULL, 1, NULL, NULL, 'R>L', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2004, 3013, 10110, 10225, NULL, NULL),
(1019, 4, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Double Finger', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1019, 5, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Double Finger', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1019, 6, 'a', 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, NULL, NULL, 10201, 'ERROR in diag', 10291),
(1019, 6, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, 'not desc in text', NULL),
(1019, 7, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1019, 8, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1019, 9, 'a', 1, '12:00', 'D', 'R', 'R', NULL, '0', '5:00', '~C', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3047, 10703, NULL, NULL, NULL),
(1019, 9, 'b', 1, NULL, NULL, 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3026, 10104, 10403, NULL, NULL),
(1019, 10, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1019, 11, NULL, '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, 3000, 10101, 10202, NULL, NULL),
(1019, 12, NULL, 1, NULL, NULL, 'Lh+R', 'R', 'High', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3037, 10304, 10638, NULL, NULL),
(1019, 13, 'a', '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10153, 10200, NULL, NULL),
(1019, 13, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10623, NULL, NULL),
(1019, 14, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', '6:00', 'C', NULL, 'L', 'Mid', NULL, NULL, 'Elbow', '0', 'H', NULL, 3000, 10104, 10203, 'was 10201 thrust', 10293),
(1019, 15, NULL, 1, '12:00', 'D', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3044, 10104, 10403, NULL, NULL),
(1019, 16, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3003, 10104, 10424, NULL, NULL),
(1019, 17, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10218, NULL, NULL),
(1019, 18, NULL, 1, '6:00', 'C', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'F', NULL, 3012, 10100, 10406, 'L>R?', NULL),
(1019, 19, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Knee', NULL, NULL, NULL, NULL, 'X-Palm', '0', 'H', NULL, NULL, 10303, 10608, NULL, 10300),
(1019, 20, 'a', 1, '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3012, NULL, NULL, NULL, NULL),
(1019, 20, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10403, NULL, NULL),
(1019, 21, 'a', 1, NULL, NULL, 'R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3000, NULL, NULL, 'ERROR in diag', NULL),
(1019, 21, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', '6:00', 'C', NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', 'H', NULL, 3022, 10104, 10203, 'was 10201 thrust', 10293),
(1019, 22, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3031, 10104, 10403, 'R>L?', NULL),
(1019, 23, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, NULL, 10302, 10612, NULL, NULL),
(1019, 24, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', '8:00', '~B', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3013, 10727, NULL, NULL, NULL),
(1019, 24, 'b', 1, '6:00', 'C', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Palm', 1, 'F', NULL, 3012, 10102, 10406, NULL, NULL),
(1019, 25, 'a', 1, NULL, NULL, 'Lh;R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3000, 10100, 10410, NULL, NULL),
(1019, 25, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, NULL, NULL, 10205, NULL, NULL),
(1019, 26, NULL, 1, '12:00', 'D', 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Flat Fingertip', '0', 'H', NULL, 3012, 10104, 10202, 'L>R?', NULL),
(1019, 27, 'a', 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot', 'L', NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10603, NULL, NULL),
(1019, 27, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10620, NULL, NULL),
(1019, 28, 'a', 1, '6:00', 'C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'R', 'Mid', '12:00', 'D', 'Elbow', '0', 'F', NULL, 3012, NULL, 10204, 'was 10201 thrust', 10294),
(1019, 28, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, 2004, 3003, 10100, 10625, NULL, NULL),
(1019, 29, NULL, 1, NULL, NULL, 'L!', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Backhand', '0', 'H', NULL, 3018, 10104, 10210, 'not desc as pulling/slipping', NULL),
(1019, 30, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, NULL, NULL, 10200, NULL, NULL),
(1019, 30, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10629, NULL, NULL),
(1019, 31, NULL, 1, NULL, NULL, 'R!', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Backhand', '0', 'H', NULL, 3000, 10104, 10210, NULL, NULL),
(1019, 32, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, NULL, NULL, 10200, NULL, NULL),
(1019, 32, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10629, NULL, NULL),
(1019, 33, NULL, 1, '12:00', 'D', 'L!', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3012, 10104, 10218, NULL, NULL),
(1019, 34, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3011, 10100, 10208, 'L>R?', NULL),
(1019, 34, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10621, NULL, NULL),
(1019, 35, NULL, 1, NULL, NULL, 'R!', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10218, NULL, NULL),
(1019, 36, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3011, 10100, 10208, 'R>L?', NULL),
(1019, 36, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10621, NULL, NULL),
(1019, 37, NULL, 1, '6:00', 'C', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', NULL, 3012, 10104, 10403, 'L>R?', NULL),
(1019, 38, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forearm', '0', 'F', NULL, 3011, 10100, 10414, 'L>R?', NULL),
(1019, 39, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1019, 40, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forearm', '0', 'F', NULL, 3011, 10100, 10414, 'ERROR in diag R>L?', NULL),
(1019, 41, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', 1, 'F', NULL, 3003, 10100, 10214, NULL, NULL),
(1019, 42, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Arc Hand', '0', 'F', NULL, NULL, NULL, 10201, NULL, NULL),
(1019, 43, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1019, 44, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Arc Hand', '0', 'F', NULL, 3000, 10100, 10201, NULL, NULL),
(1019, 45, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1019, 46, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1019, 47, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1019, 48, NULL, 1, NULL, NULL, 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Foreknuckle Fist', 1, 'F', NULL, 3000, 10110, 10226, NULL, NULL),
(1019, 49, NULL, 1, '9:00', 'B', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3005, 10100, 10400, NULL, NULL),
(1019, 50, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Open Fist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1019, 51, 'a', 1, '3:00', 'A', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3006, 10706, NULL, 'left foot not on line AB', NULL),
(1019, 51, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, 10100, 10400, NULL, NULL),
(1019, 52, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Open Fist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1019, 999, NULL, 1, '12:00', 'D', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10003, NULL, NULL, NULL);


-- Juche (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1020, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10009, NULL, NULL, NULL),
(1020, 1, NULL, 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Inner Forearm', 1, 'F', NULL, 3013, 10106, 10408, NULL, NULL),
(1020, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, NULL, 10107, 10411, NULL, 'standing up'),
(1020, 3, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, 10106, 10200, NULL, NULL),
(1020, 4, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, NULL, 10111, 10408, NULL, NULL),
(1020, 5, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'S', 2005, NULL, NULL, 10607, NULL, NULL),
(1020, 5, 'b', 1, '3:00', 'A', 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', NULL, 2004, 3002, 10302, NULL, NULL, NULL),
(1020, 5, 'c', 1, '9:00', 'B', 'R', 'R', 'High', '0', NULL, NULL, 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', NULL, 2004, 3004, 10310, NULL, NULL, NULL),
(1020, 6, NULL, '0', NULL, NULL, 'L', 'R', NULL, '0', '6:00', 'F', NULL, 'R', 'Mid', NULL, NULL, 'Backfist', '0', 'S', NULL, 3019, 10109, 10210, NULL, NULL),
(1020, 7, 'a', 1, '6:00', 'F', 'L', 'L', 'Mid', '0', NULL, NULL, 'Side Instep', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3001, 10311, 10613, NULL, 'fists pulled'),
(1020, 7, 'b', 1, NULL, NULL, 'L', 'L', 'High', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', 2005, NULL, 10302, NULL, NULL, NULL),
(1020, 8, NULL, 1, NULL, NULL, 'L!', NULL, NULL, '0', '9:00', 'B', NULL, 'L', 'High', NULL, NULL, 'Flat Fingertip', '0', 'S', NULL, 3000, 10106, 10220, NULL, NULL),
(1020, 9, 'a', 1, '7:30', 'BF', 'Lh+Rh', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Elbow', '0', 'RH', NULL, 3106, 10100, 10201, NULL, NULL),
(1020, 9, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10624, NULL, NULL),
(1020, 10, 'a', 1, '9:00', 'B', 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'F', NULL, 3101, 10109, 10410, NULL, NULL),
(1020, 10, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10635, NULL, NULL),
(1020, 11, NULL, 1, '3:00', 'A', 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3004, 10104, 10403, NULL, NULL),
(1020, 12, 'a', 1, NULL, NULL, 'L+R', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, 3040, 10999, 10228, NULL, NULL),
(1020, 12, 'b', 1, NULL, NULL, NULL, 'R', NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10104, 10636, NULL, 'hands stay in prev position?'),
(1020, 13, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, NULL, NULL, NULL, NULL),
(1020, 13, 'b', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Inner Forearm', 1, 'F', NULL, 3001, 10106, 10408, NULL, NULL),
(1020, 14, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, NULL, 10107, 10411, NULL, 'standing up'),
(1020, 15, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, 10106, 10200, NULL, 'should be connecting!? conn == cont!?'),
(1020, 16, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, NULL, 10111, 10408, NULL, NULL),
(1020, 17, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'S', 2005, NULL, NULL, 10607, NULL, NULL),
(1020, 17, 'b', 1, '9:00', 'B', 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', NULL, 2004, 3001, 10302, NULL, NULL, NULL),
(1020, 17, 'c', 1, '3:00', 'A', 'L', 'L', 'High', '0', NULL, NULL, 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', NULL, 2004, 3012, 10310, NULL, NULL, NULL),
(1020, 18, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', '6:00', 'E', NULL, 'L', 'Mid', NULL, NULL, 'Backfist', '0', 'S', NULL, 3019, 10109, 10210, NULL, NULL),
(1020, 19, 'a', 1, '6:00', 'E', 'R', 'R', 'Mid', '0', NULL, NULL, 'Side Instep', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3002, 10311, 10613, NULL, NULL),
(1020, 19, 'b', 1, NULL, NULL, 'R', 'R', 'High', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', 2005, NULL, 10302, NULL, NULL, NULL),
(1020, 20, NULL, 1, NULL, NULL, 'R!', NULL, NULL, '0', '3:00', 'A', NULL, 'R', 'High', NULL, NULL, 'Flat Fingertip', '0', 'S', NULL, 3000, 10106, 10220, NULL, NULL),
(1020, 21, 'a', 1, '4:30', 'AE', 'Lh+Rh', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Elbow', '0', 'RH', NULL, 3107, 10100, 10201, NULL, NULL),
(1020, 21, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10624, NULL, NULL),
(1020, 22, 'a', 1, '3:00', 'A', 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'F', NULL, 3100, 10109, 10410, NULL, NULL),
(1020, 22, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10635, NULL, NULL),
(1020, 23, NULL, 1, '9:00', 'B', 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3012, 10104, 10403, NULL, NULL),
(1020, 24, 'a', 1, NULL, NULL, 'L+R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, 3041, 10999, 10228, NULL, NULL),
(1020, 24, 'b', 1, NULL, NULL, NULL, 'L', NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10104, 10636, NULL, NULL),
(1020, 25, 'a', 1, NULL, NULL, 'L', 'L', 'High', '0', NULL, NULL, 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3032, 10312, NULL, NULL, NULL),
(1020, 25, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3000, 10102, 10403, NULL, NULL),
(1020, 26, NULL, 1, '12:00', 'D', 'Lh+R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', 2004, 3002, 10002, NULL, NULL, NULL),
(1020, 27, NULL, 1, NULL, NULL, 'L;R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Straight Elbow', '0', 'H', NULL, 3026, 10102, 10221, NULL, NULL),
(1020, 28, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Arc Hand', '0', 'F', NULL, 3011, 10100, 10231, NULL, NULL),
(1020, 29, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1020, 29, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Straight Elbow', '0', 'H', NULL, 3026, 10102, 10221, NULL, NULL),
(1020, 30, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Arc Hand', '0', 'F', NULL, 3011, 10100, 10231, NULL, NULL),
(1020, 31, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Knife-Hand', 1, 'F', NULL, 3003, 10100, 10215, NULL, NULL),
(1020, 32, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forefist', '0', 'F', NULL, 3003, 10100, 10222, NULL, NULL),
(1020, 33, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10702, NULL, NULL, NULL),
(1020, 33, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3026, 10104, 10407, NULL, NULL),
(1020, 34, 'a', 1, NULL, NULL, 'R+L', 'R', 'Mid', 1, NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3042, 10309, 10999, NULL, NULL),
(1020, 34, 'b', 1, NULL, NULL, NULL, 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, NULL, 10104, 10403, NULL, NULL),
(1020, 35, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10702, NULL, NULL, NULL),
(1020, 35, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3026, 10104, 10407, NULL, NULL),
(1020, 36, 'a', 1, NULL, NULL, 'R+L', 'L', 'Mid', 1, NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3043, 10309, 10999, NULL, NULL),
(1020, 36, 'b', 1, NULL, NULL, NULL, 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, NULL, 10104, 10403, NULL, NULL),
(1020, 37, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3025, 10705, NULL, NULL, NULL),
(1020, 37, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3032, 10710, NULL, NULL, NULL),
(1020, 37, 'c', 1, NULL, NULL, 'L+R', 'L', 'Mid', 1, '9:00', 'F', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3019, 10308, NULL, 10391, NULL),
(1020, 37, 'd', 1, NULL, NULL, 'R', 'R', 'Mid', 1, '3:00', 'E', 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3032, 10302, NULL, 10391, NULL),
(1020, 38, NULL, '0', NULL, NULL, NULL, 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Palm', 1, 'F', NULL, NULL, 10112, 10402, NULL, NULL),
(1020, 39, NULL, 1, NULL, NULL, 'R;L', 'R', NULL, '0', '6:00', 'C', NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', 'H', NULL, 3022, 10102, 10203, NULL, NULL),
(1020, 40, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', '6:00', 'C', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', 2004, 3047, 10008, NULL, NULL, NULL),
(1020, 40, 'b', 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 10306, NULL, NULL, NULL),
(1020, 41, NULL, 1, NULL, NULL, 'L!', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Backfist', '0', 'H', NULL, 3000, 10104, 10214, NULL, NULL),
(1020, 42, NULL, 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, 3000, 10108, 10229, NULL, 'slipping?'),
(1020, 43, 'a', 1, NULL, NULL, 'L+R', NULL, NULL, 1, NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3019, 10999, 10200, NULL, NULL),
(1020, 43, 'b', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, 10999, 10211, NULL, NULL),
(1020, 43, 'c', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10110, 10607, NULL, NULL),
(1020, 44, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, 3000, 10100, 10223, NULL, NULL),
(1020, 45, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1020, 999, NULL, 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3000, 10009, NULL, NULL, NULL);


-- Ko-Dang (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1021, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10005, NULL, NULL, NULL),
(1021, 1, NULL, 1, '1:30', 'AD', 'R', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3101, 10106, 10418, NULL, NULL),
(1021, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1021, 3, NULL, 1, '12:00', 'D', 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3100, 10104, 10403, NULL, NULL),
(1021, 4, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, NULL, NULL, 10400, NULL, NULL),
(1021, 4, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', NULL, NULL, NULL, NULL, 10400, 10491, NULL),
(1021, 5, 'a', 1, NULL, NULL, 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1021, 5, 'b', 1, '10:30', 'BD', 'L', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3100, 10106, 10418, NULL, NULL),
(1021, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1021, 7, NULL, 1, '12:00', 'D', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3101, 10104, 10403, NULL, NULL),
(1021, 8, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, NULL, NULL, 10400, NULL, NULL),
(1021, 8, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Inner Forearm', '0', NULL, NULL, NULL, NULL, 10400, 10491, NULL),
(1021, 9, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1021, 9, 'b', 1, '6:00', 'C', NULL, 'L', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3004, 10008, NULL, NULL, NULL),
(1021, 10, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10306, NULL, NULL, NULL),
(1021, 11, 'a', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, NULL, NULL, NULL, NULL),
(1021, 11, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10400, NULL, NULL),
(1021, 12, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1021, 12, 'b', 1, '6:00', 'C', NULL, 'R', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3012, 10008, NULL, NULL, NULL),
(1021, 13, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10306, NULL, NULL, NULL),
(1021, 14, 'a', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, NULL, NULL, NULL, NULL),
(1021, 14, 'b', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10400, NULL, NULL),
(1021, 15, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Straight Elbow', '0', 'H', NULL, 3003, 10104, 10221, NULL, NULL),
(1021, 16, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Straight Elbow', '0', 'H', NULL, 3003, 10104, 10221, NULL, NULL),
(1021, 17, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Palm', '0', 'F', 2004, 3000, 10100, 10406, NULL, NULL),
(1021, 17, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1021, 18, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Palm', '0', 'F', 2004, 3000, 10100, 10406, NULL, NULL),
(1021, 18, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1021, 19, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3003, 10104, 10407, NULL, NULL),
(1021, 20, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3000, 10104, 10407, NULL, NULL),
(1021, 21, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3000, 10102, 10416, NULL, NULL),
(1021, 22, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3000, 10102, 10416, NULL, NULL),
(1021, 23, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3003, 10102, 10607, NULL, NULL),
(1021, 23, 'b', 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, 'should be a side front snap kick'),
(1021, 24, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Knife-Hand', 1, 'F', NULL, 3000, 10100, 10215, NULL, NULL),
(1021, 25, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Knife-Hand', '0', 'F', 2001, NULL, NULL, 10402, NULL, NULL),
(1021, 26, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3018, 10104, 10403, NULL, NULL),
(1021, 27, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forefist', '0', 'F', NULL, 3011, 10100, 10222, NULL, NULL),
(1021, 28, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10702, NULL, NULL, NULL),
(1021, 28, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3026, 10104, 10403, NULL, NULL),
(1021, 29, NULL, 1, NULL, NULL, 'L+R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3030, 10104, 10403, NULL, NULL),
(1021, 30, NULL, 1, NULL, NULL, 'R;L', 'R', NULL, '0', '11:00', 'BD', NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3019, 10109, 10205, NULL, NULL),
(1021, 31, NULL, 1, '6:00', 'C', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3012, 10100, 10400, 10491, NULL),
(1021, 32, 'a', 1, '12:00', 'D', 'L', 'L', NULL, '0', '9:00', 'B', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10731, NULL, NULL, NULL),
(1021, 32, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, NULL, 10100, 10400, 10491, NULL),
(1021, 33, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3000, 10104, 10211, NULL, NULL),
(1021, 33, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1021, 34, NULL, 1, '3:00', 'A', 'R', 'R', 'Mid', '0', NULL, NULL, 'Side Instep', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3002, 10311, NULL, NULL, 'f?'),
(1021, 35, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Flat Fingertip', '0', 'H', NULL, 3000, 10104, 10220, NULL, NULL),
(1021, 36, 'a', 1, '9:00', 'B', 'R>L', 'R', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, 10701, NULL, NULL, NULL),
(1021, 36, 'b', 1, NULL, NULL, 'Rh+L', 'L', 'Mid', '0', NULL, NULL, 'Side Instep', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10311, NULL, NULL, 'f?'),
(1021, 37, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Flat Fingertip', '0', 'H', NULL, 3000, 10104, 10220, NULL, NULL),
(1021, 38, 'a', 1, '3:00', 'A', 'L>R', 'L', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10701, '0', NULL, NULL),
(1021, 38, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, 10104, 10403, NULL, NULL),
(1021, 39, 'a', 1, '9:00', 'B', 'R>L', 'R', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, 10701, NULL, NULL, NULL),
(1021, 39, 'b', 1, NULL, NULL, 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, 10104, 10403, NULL, NULL),
(1021, 999, NULL, 1, '12:00', 'D', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3002, 10005, NULL, NULL, NULL);


-- Sam-Il (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1022, '0', NULL, '0', '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10005, NULL, NULL, NULL),
(1022, 1, NULL, 1, NULL, NULL, 'L;R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3022, 10104, 10403, NULL, NULL),
(1022, 2, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3000, 10100, 10400, NULL, NULL),
(1022, 3, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1022, 3, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10639, NULL, NULL),
(1022, 4, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', '3:00', 'A', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10304, 10603, NULL, NULL),
(1022, 5, NULL, '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1022, 6, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3018, 10706, NULL, NULL, NULL),
(1022, 6, 'b', 1, '9:00', 'B', 'Rh+L', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Reverse Knife-Hand', 1, 'F', NULL, 3001, 10106, 10404, NULL, NULL),
(1022, 7, 'a', 1, '6:00', 'C', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Upset Fingertip', '0', NULL, NULL, 3001, 10100, 10202, NULL, NULL),
(1022, 7, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1022, 8, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', '12:00', 'D', 'Outer Forearm', '0', 'H', NULL, 3018, 10104, 10425, NULL, NULL),
(1022, 8, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', NULL, NULL, NULL, NULL, 10400, NULL, NULL),
(1022, 9, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 3001, 3000, NULL, 1022, NULL, NULL),
(1022, 9, 'b', 1, '3:00', 'A', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Reverse Knife-Hand', 1, 'F', NULL, 3001, 10106, 10404, NULL, NULL),
(1022, 10, 'a', 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3002, NULL, NULL, NULL, 'ERROR in diag'),
(1022, 10, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forefist', 1, 'H', NULL, 3018, 10104, 10200, NULL, NULL),
(1022, 11, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', '7:00', 'BC', 'Arc Hand', 1, 'RH', NULL, 3000, 10100, 10425, 10400, NULL),
(1022, 12, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1022, 13, 'a', 1, '12:00', 'D', 'R', 'R', NULL, '0', '4:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3017, 10706, NULL, NULL, 'ERROR in diag'),
(1022, 13, 'b', 1, NULL, NULL, 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forefist', 1, 'H', NULL, NULL, 10104, 10200, NULL, 'changed to spot turn'),
(1022, 14, NULL, 1, '9:00', 'B', 'L>R;L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', NULL, 3001, 10104, 10403, NULL, NULL),
(1022, 15, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'L Mid+R High', NULL, NULL, 'Reverse Knife-Hand', 1, 'H', NULL, 3011, 10105, 10412, NULL, NULL),
(1022, 16, 'a', 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Side Sole', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3032, 10314, 10999, NULL, NULL),
(1022, 16, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'R Mid+L High', NULL, NULL, 'Reverse Knife-Hand', 1, 'H', NULL, 3000, 10105, 10412, NULL, NULL),
(1022, 17, NULL, 1, NULL, NULL, 'L+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3024, 10104, 10403, NULL, NULL),
(1022, 18, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, NULL, 10302, 10403, NULL, NULL),
(1022, 19, 'a', '0', '3:00', 'A', 'R>L', 'R', NULL, '0', '5:00', '~C', NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', 'F', NULL, 3012, 10701, 10201, 10292, NULL),
(1022, 19, 'b', '0', NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 10100, 10629, NULL, NULL),
(1022, 20, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', '6:00', 'C', 'Back Elbow', '0', 'F', NULL, 3000, NULL, 10204, NULL, NULL),
(1022, 20, 'b', 1, '6:00', 'C', NULL, 'L', NULL, '0', '12:00', 'D', NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3005, 10112, 10622, NULL, NULL),
(1022, 21, NULL, 1, '1:30', 'AD', 'Rh+Lh', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'F', NULL, 3104, 10100, 10406, NULL, 'pivot?'),
(1022, 22, NULL, 1, '6:00', 'C', 'L!', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3103, 10106, 10417, NULL, NULL),
(1022, 23, NULL, 1, '3:00', 'A', 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'S', NULL, 3001, 10302, 10403, NULL, NULL),
(1022, 24, 'a', 1, '9:00', 'B', 'L', 'L', NULL, '0', '6:00', '~C', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10704, NULL, NULL, 'ERROR Text doesnt match diag'),
(1022, 24, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, 10104, 10403, NULL, NULL),
(1022, 25, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3000, 10102, 10416, NULL, NULL),
(1022, 26, NULL, 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Palm', 1, 'H', NULL, 3000, 10102, 10406, NULL, NULL),
(1022, 27, NULL, 1, '6:00', 'C', 'Rh+L!', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forefist', 1, 'F', NULL, 3001, 10100, 10211, NULL, NULL),
(1022, 28, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3000, 10104, 10400, NULL, NULL),
(1022, 28, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10640, NULL, NULL),
(1022, 29, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, NULL, NULL, 10200, NULL, NULL),
(1022, 29, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10641, NULL, NULL),
(1022, 30, NULL, 1, '12:00', 'D', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forearm', '0', 'F', NULL, 3012, 10100, 10410, NULL, 'L>R?'),
(1022, 31, NULL, '0', NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, NULL, 10200, NULL, NULL),
(1022, 32, NULL, 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10603, NULL, NULL),
(1022, 33, 'a', '0', NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3025, 10705, NULL, NULL, NULL),
(1022, 33, 'b', '0', NULL, NULL, 'Lh+R!', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forefist', 1, 'F', NULL, NULL, 10100, 10224, NULL, NULL),
(1022, 999, NULL, 1, NULL, NULL, 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3000, 10005, NULL, NULL, NULL);


-- Yoo-Sin (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1023, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10011, NULL, NULL, NULL),
(1023, 1, NULL, 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Elbow', 1, 'F', NULL, 3013, 10106, 10642, NULL, NULL),
(1023, 2, 'a', 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, NULL, NULL, NULL, NULL),
(1023, 2, 'b', 1, NULL, NULL, 'L+R', NULL, NULL, '0', '12:00', 'D', NULL, 'L', 'High', '6:00', 'C', 'Forefist', '0', 'RS', NULL, 3049, 10106, 10225, NULL, NULL),
(1023, 3, 'a', '0', '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 2002, 3047, NULL, NULL, NULL, NULL),
(1023, 3, 'b', '0', NULL, NULL, 'L+R', NULL, NULL, '0', '12:00', 'D', NULL, 'R', 'High', '6:00', 'C', 'Forefist', '0', 'RS', NULL, 3048, 10106, 10225, NULL, NULL),
(1023, 4, NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3004, 10107, 10411, NULL, 'legs straight'),
(1023, 5, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, 10106, 10200, NULL, 'Not Connecting!? Not on sep line'),
(1023, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, NULL, 10107, 10411, NULL, 'legs straight'),
(1023, 7, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, 10106, 10200, NULL, 'Not Connecting!? Not on sep line'),
(1023, 8, 'a', 1, '10:30', 'BD', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3100, NULL, NULL, NULL, 'L>R? more like 45'),
(1023, 8, 'b', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1023, 9, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', '1:00', 'AD', 'Inner Forearm', '0', 'RH', NULL, NULL, NULL, 10405, NULL, NULL),
(1023, 10, NULL, 1, '1:30', 'AD', 'Lh+Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3113, 10107, 10424, NULL, 'ERROR diag doesnt show heels, more like 90'),
(1023, 11, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2003, NULL, NULL, 10200, NULL, NULL),
(1023, 12, 'a', 1, NULL, NULL, 'L>R', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 10701, NULL, NULL, NULL),
(1023, 12, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1023, 13, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', '12:00', 'D', 'Inner Forearm', '0', 'RH', NULL, NULL, NULL, 10405, NULL, NULL),
(1023, 14, NULL, 1, '10:30', 'BD', 'Lh+Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3112, 10107, 10424, NULL, 'ERROR diag doesnt show heels, more like 90'),
(1023, 15, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2003, NULL, 10106, 10200, NULL, NULL),
(1023, 16, NULL, 1, '9:00', 'BC', 'Rh', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', '9:00', 'B', 'Palm', '0', 'RH', NULL, 3108, 10100, 10411, NULL, 'ERROR No Lh!?'),
(1023, 17, NULL, '0', '10:30', 'BD', 'Lh+Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2001, 3109, 10106, 10200, NULL, NULL),
(1023, 18, NULL, '0', '1:00', 'AD', 'Lh', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', '12:00', 'D', 'Palm', '0', 'RH', 2001, 3109, 10100, 10411, NULL, 'ERROR No Rh!? Angles off'),
(1023, 19, NULL, '0', '10:30', 'BD', 'Lh+Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2001, 3108, 10106, 10200, NULL, NULL),
(1023, 20, 'a', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3101, NULL, NULL, NULL, NULL),
(1023, 20, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'F', NULL, 3003, 10100, 10406, NULL, NULL),
(1023, 21, NULL, '0', NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'X-Knife-Hand', '0', 'F', 2001, NULL, NULL, 10402, NULL, 'cont not on sep line'),
(1023, 22, 'a', 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1023, 22, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10648, NULL, NULL),
(1023, 23, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1023, 24, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1023, 25, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'F', NULL, NULL, NULL, 10406, NULL, NULL),
(1023, 26, NULL, '0', NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'X-Knife-Hand', '0', 'F', 2001, NULL, NULL, 10402, NULL, NULL),
(1023, 27, 'a', 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1023, 27, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10648, NULL, NULL),
(1023, 28, NULL, 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1023, 29, NULL, '0', NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1023, 30, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1023, 31, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1023, 32, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10403, NULL, NULL),
(1023, 33, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10403, NULL, NULL),
(1023, 34, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3000, 10100, 10400, NULL, NULL),
(1023, 35, 'a', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'RH', 2002, NULL, NULL, 10425, 10400, NULL),
(1023, 35, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10603, NULL, NULL),
(1023, 36, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3000, 10100, 10400, NULL, NULL),
(1023, 37, 'a', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forearm', '0', 'RH', 2002, NULL, NULL, 10425, 10400, NULL),
(1023, 37, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10603, NULL, NULL),
(1023, 38, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1023, 39, 'a', 1, '6:00', 'C', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3017, 10707, NULL, NULL, NULL),
(1023, 39, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', NULL, NULL, 10104, 10400, NULL, NULL),
(1023, 40, NULL, 1, NULL, NULL, 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3000, 10005, NULL, NULL, NULL),
(1023, 41, NULL, 1, '7:30', 'CF', 'R!', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forefist', 1, 'F', NULL, 3101, 10100, 10211, NULL, NULL),
(1023, 42, 'a', 1, NULL, NULL, 'R>L', NULL, NULL, '0', '7:00', '~C', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10720, NULL, NULL, NULL),
(1023, 42, 'b', 1, '4:30', 'CE', 'L!', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forefist', 1, 'F', NULL, 3001, 10100, 10211, NULL, NULL),
(1023, 43, 'a', 1, NULL, NULL, 'L>R', NULL, NULL, '0', '5:00', '~C', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10720, NULL, NULL, NULL),
(1023, 43, 'b', 1, '9:00', 'F', 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3103, 10104, 10400, NULL, NULL),
(1023, 44, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, NULL, NULL, 10200, NULL, NULL),
(1023, 45, NULL, 1, '6:00', 'C', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', '3:00', 'A', 'Forefist', '0', 'F', 2004, 3001, 10110, 10225, NULL, NULL),
(1023, 46, NULL, 1, '3:00', 'E', 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3001, 10104, 10400, NULL, NULL),
(1023, 47, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, NULL, NULL, 10200, NULL, NULL),
(1023, 48, NULL, 1, '6:00', 'C', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', '9:00', 'B', 'Forefist', '0', 'F', 2004, 3002, 10110, 10225, NULL, NULL),
(1023, 49, 'a', 1, '3:00', 'E', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1023, 49, 'b', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'L Mid+R High', NULL, NULL, 'Forefist', 1, 'H', NULL, 3000, 10105, 10232, NULL, NULL),
(1023, 50, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', '4:00', '~A', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10703, NULL, NULL, NULL),
(1023, 50, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'R Mid+L High', NULL, NULL, 'Forefist', 1, 'H', NULL, 3000, 10105, 10232, NULL, NULL),
(1023, 51, 'a', 1, NULL, NULL, 'R!', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3031, 10106, 10201, 10291, NULL),
(1023, 51, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, NULL, 'not desc'),
(1023, 52, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', '12:00', 'D', 'Side Sole', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10313, 10607, NULL, NULL),
(1023, 52, 'b', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', '4:00', 'AC', 'Outer Forearm', '0', 'F', NULL, NULL, 10106, 10425, NULL, 'is F facing per photo'),
(1023, 52, 'c', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10603, NULL, 'not desc'),
(1023, 53, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', '6:00', 'C', 'Side Sole', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10313, 10607, NULL, NULL),
(1023, 53, 'b', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', '2:00', 'DE', 'Outer Forearm', '0', 'F', NULL, NULL, 10106, 10410, NULL, 'dir desc as ED, is F facing per photo?!'),
(1023, 53, 'c', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10603, NULL, NULL),
(1023, 54, NULL, 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Backhand', '0', 'S', NULL, 3002, NULL, 10214, NULL, NULL),
(1023, 55, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot Sole', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10315, 10629, NULL, NULL),
(1023, 56, NULL, '0', NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'S', 2005, NULL, 10302, 10403, NULL, NULL),
(1023, 57, NULL, '0', NULL, NULL, 'L', NULL, NULL, '0', '9:00', 'B', NULL, 'L', 'Mid', NULL, NULL, 'Backhand', '0', 'S', NULL, 3000, 10106, 10214, NULL, NULL),
(1023, 58, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot Sole', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10315, 10629, NULL, NULL),
(1023, 59, NULL, '0', NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'S', 2005, NULL, 10302, 10403, NULL, NULL),
(1023, 60, 'a', '0', NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, NULL, NULL, NULL, NULL),
(1023, 60, 'b', 1, '3:00', 'A', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forearm', '0', 'F', NULL, 3001, 10106, 10414, NULL, NULL),
(1023, 61, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forearm', '0', 'F', NULL, NULL, NULL, 10414, NULL, NULL),
(1023, 62, NULL, 1, '9:00', 'B', 'L', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forearm', '0', 'F', NULL, 3004, 10106, 10414, NULL, NULL),
(1023, 63, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forearm', '0', 'F', NULL, NULL, NULL, 10414, NULL, NULL),
(1023, 64, 'a', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3002, NULL, NULL, NULL, 'ERROR in large diag'),
(1023, 64, 'b', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Side Fist', '0', 'H', NULL, 3011, 10103, 10210, NULL, NULL),
(1023, 65, 'a', 1, '9:00', 'B', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1023, 65, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forefist', 1, 'F', NULL, 3003, 10100, 10224, NULL, NULL),
(1023, 66, 'a', 1, '3:00', 'A', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, NULL, NULL, NULL, NULL),
(1023, 66, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3003, 10100, 10224, NULL, NULL),
(1023, 67, 'a', 1, NULL, NULL, 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10720, NULL, NULL, NULL),
(1023, 67, 'b', 1, '10:30', 'BD', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3102, 10104, 10403, NULL, NULL),
(1023, 68, 'a', 1, '1:30', 'AD', 'L>R', 'L', NULL, '0', '2:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3002, 10701, NULL, NULL, NULL),
(1023, 68, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1023, 999, NULL, 1, '12:00', 'D', 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3100, 10011, NULL, NULL, NULL);


-- Choi-Yong (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `note`, `OriginalTechniqueID`) VALUES
(1024, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10005, NULL, NULL, NULL),
(1024, 1, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3000, 10102, 10403, NULL, NULL),
(1024, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Middle-Knuckle Fist', '0', 'H', NULL, NULL, NULL, 10200, NULL, NULL),
(1024, 3, 'a', 1, '6:00', 'C', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3006, 10705, NULL, 'not 100pc happy with desc here', NULL),
(1024, 3, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, NULL, 10102, 10403, NULL, NULL),
(1024, 4, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Middle-Knuckle Fist', '0', 'H', NULL, NULL, NULL, 10200, NULL, NULL),
(1024, 5, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', '10:00', '~B', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3013, 10732, NULL, 'not 100pc happy with desc here', NULL),
(1024, 5, 'b', 1, '12:00', 'D', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, 3012, 10100, 10402, NULL, NULL),
(1024, 6, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', '1:00', 'AD', 'Inner Forearm', '0', 'RH', NULL, NULL, NULL, 10405, NULL, NULL),
(1024, 7, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1024, 8, 'a', 1, '6:00', 'C', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3006, 10706, NULL, NULL, NULL),
(1024, 8, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, NULL, 10100, 10402, NULL, NULL),
(1024, 9, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', '5:00', 'AC', 'Inner Forearm', '0', 'RH', NULL, NULL, NULL, 10405, NULL, NULL),
(1024, 10, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1024, 11, 'a', 1, '12:00', 'D', 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3017, 10706, NULL, NULL, NULL),
(1024, 11, 'b', 1, NULL, NULL, 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, 10104, 10403, NULL, NULL),
(1024, 12, 'a', 1, NULL, NULL, 'R', 'R', 'Mid', '0', '2:00', 'AD', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10304, NULL, NULL, NULL),
(1024, 12, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10705, NULL, NULL, NULL),
(1024, 13, NULL, 1, NULL, NULL, 'Rh+L', 'L', 'High', '0', NULL, NULL, 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', 'S', 2005, 3047, 10310, NULL, NULL, NULL),
(1024, 14, NULL, '0', NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', 2005, NULL, 10302, 10612, NULL, NULL),
(1024, 15, 'a', '0', NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', 'F', NULL, 3000, 10100, 10201, NULL, 10292),
(1024, 15, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10629, NULL, NULL),
(1024, 16, 'a', 1, '6:00', 'C', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3006, 10706, NULL, NULL, NULL),
(1024, 16, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, 10104, 10403, NULL, NULL),
(1024, 17, 'a', 1, NULL, NULL, 'L', 'L', 'Mid', '0', '4:00', 'AC', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10304, NULL, NULL, NULL),
(1024, 17, 'b', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10705, NULL, NULL, NULL),
(1024, 18, NULL, 1, NULL, NULL, 'Lh+R', 'R', 'High', '0', NULL, NULL, 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', 'S', 2005, 3044, 10310, NULL, NULL, NULL),
(1024, 19, NULL, '0', NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', NULL, 2005, NULL, 10302, 10612, NULL, NULL),
(1024, 20, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Elbow', '0', 'F', NULL, 3000, 10100, 10201, NULL, 10292),
(1024, 20, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10629, NULL, NULL),
(1024, 21, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Palm', '0', 'F', NULL, 3000, 10100, 10406, NULL, NULL),
(1024, 21, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', NULL, NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1024, 22, 'a', '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Palm', '0', 'F', 2002, 3000, 10100, 10406, NULL, NULL),
(1024, 22, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', NULL, NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1024, 23, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10702, NULL, NULL, NULL),
(1024, 23, 'b', 1, '12:00', 'D', 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Knife-Hand', 1, 'F', NULL, 3012, 10100, 10417, NULL, NULL),
(1024, 24, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 10300, 10603, NULL, NULL),
(1024, 25, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3003, 10104, 10403, NULL, NULL),
(1024, 26, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Knife-Hand', 1, 'F', NULL, 3000, 10100, 10417, NULL, NULL),
(1024, 27, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 10300, 10603, NULL, NULL),
(1024, 28, 'a', 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, NULL, NULL, NULL, NULL),
(1024, 28, 'b', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3003, 10104, 10403, NULL, NULL),
(1024, 29, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3025, 10705, 10999, 'diagramed differently than others with transitional ~parallel', NULL),
(1024, 29, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', '5:00', '~C', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3032, 10710, 10999, NULL, NULL),
(1024, 29, 'c', 1, '12:00', 'D', '&nbsp;', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10999, 10999, NULL, NULL),
(1024, 29, 'd', 1, NULL, NULL, 'L+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3026, 10104, 10403, NULL, NULL),
(1024, 30, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1024, 31, 'a', 1, '6:00', 'C', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3006, 10706, NULL, NULL, NULL),
(1024, 31, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, NULL, 10100, 10202, NULL, NULL),
(1024, 32, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, 'ERROR arrow direction in diag', NULL),
(1024, 32, 'b', 1, '9:00', 'B', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3002, 10108, 10411, NULL, NULL),
(1024, 33, NULL, '0', NULL, NULL, 'Lh+Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, 10108, 10200, NULL, NULL),
(1024, 34, NULL, 1, '3:00', 'A', 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3004, 10007, NULL, NULL, NULL),
(1024, 35, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'S', NULL, NULL, 10302, 10403, NULL, NULL),
(1024, 36, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', '1:00', 'AD', NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3019, 10109, 10205, NULL, NULL),
(1024, 36, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10619, NULL, NULL),
(1024, 37, NULL, 1, '9:00', 'B', 'Lh+R', 'R', 'High', '0', NULL, NULL, 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3004, 10310, NULL, NULL, NULL),
(1024, 38, NULL, '0', NULL, NULL, 'R!', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10218, NULL, NULL),
(1024, 39, 'a', 1, '3:00', 'A', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, NULL, NULL, NULL, NULL),
(1024, 39, 'b', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3003, 10108, 10411, NULL, NULL),
(1024, 40, NULL, '0', NULL, NULL, 'Lh+Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, 10108, 10200, NULL, NULL),
(1024, 41, NULL, 1, '9:00', 'B', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3012, 10007, NULL, NULL, NULL),
(1024, 42, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'S', NULL, NULL, 10302, 10403, NULL, NULL),
(1024, 43, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', '11:00', 'BD', NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3019, 10109, 10205, NULL, NULL),
(1024, 43, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10619, NULL, NULL),
(1024, 44, NULL, 1, '3:00', 'A', 'Rh+L', 'L', 'High', '0', NULL, NULL, 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3012, 10310, NULL, NULL, NULL),
(1024, 45, NULL, 1, NULL, NULL, 'L!', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10218, NULL, NULL),
(1024, 46, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, NULL, NULL, NULL, NULL),
(1024, 46, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3022, 10105, 10200, NULL, NULL),
(1024, 999, NULL, 1, '12:00', 'D', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10005, NULL, NULL, NULL);


-- Yon-Gae (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1025, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10010, NULL, NULL, NULL),
(1025, 1, 'a', 1, NULL, NULL, 'R;L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', NULL, 3026, 10104, 10403, NULL, NULL),
(1025, 1, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10611, NULL, 'preform in circular motion'),
(1025, 2, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Long Fist', '0', 'F', 2004, 3018, 10100, 10200, NULL, 'R>L? not desc as slipping!?'),
(1025, 3, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1025, 3, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3026, 10104, 10403, NULL, NULL),
(1025, 4, 'a', 1, NULL, NULL, 'L+R', NULL, NULL, 1, NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3051, 10999, 10218, NULL, NULL),
(1025, 4, 'b', 1, NULL, NULL, NULL, 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3032, 10104, 10607, NULL, NULL),
(1025, 5, NULL, 1, NULL, NULL, 'Rh;L+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'X-Fist', '0', 'H', NULL, 3026, 10104, 10421, NULL, 'diff than other diagrams for rev shift'),
(1025, 6, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, 3011, 10100, 10220, NULL, 'R>L?'),
(1025, 7, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Straight Elbow', '0', 'H', NULL, 3018, 10102, 10221, NULL, NULL),
(1025, 8, NULL, 1, NULL, NULL, 'Rh+L;R', 'L', NULL, '0', '2:00', 'AD', NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3019, 10109, 10205, NULL, 'slight (1/2 FT) R shift'),
(1025, 9, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'RH', NULL, 3003, 10100, 10425, NULL, NULL),
(1025, 10, NULL, 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3000, 10108, 10411, NULL, NULL),
(1025, 11, NULL, 1, NULL, NULL, 'Lh+Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, 10108, 10200, NULL, NULL),
(1025, 12, 'a', 1, NULL, NULL, 'L;R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', NULL, 3026, 10104, 10403, NULL, NULL),
(1025, 12, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10611, NULL, 'preform in circular motion'),
(1025, 13, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 2004, 3000, 10707, NULL, NULL, NULL),
(1025, 13, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Long Fist', '0', 'F', NULL, 3018, 10100, 10200, NULL, 'Slow motion not on seperate line'),
(1025, 14, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1025, 14, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3026, 10104, 10403, NULL, 'Left forearm!?'),
(1025, 15, 'a', 1, NULL, NULL, 'L+R', NULL, NULL, 1, NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3051, 10999, 10218, NULL, NULL),
(1025, 15, 'b', 1, NULL, NULL, NULL, 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3032, 10104, 10607, NULL, NULL),
(1025, 16, NULL, 1, NULL, NULL, 'Lh;L+R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'X-Fist', '0', 'H', NULL, 3026, 10104, 10421, NULL, NULL),
(1025, 17, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, 3011, 10100, 10220, NULL, 'L>?R?'),
(1025, 18, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Straight Elbow', '0', 'H', NULL, 3018, 10102, 10221, NULL, NULL),
(1025, 19, NULL, 1, NULL, NULL, 'Lh+R;L', 'R', NULL, '0', '10:00', 'BD', NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3019, 10109, 10205, NULL, NULL),
(1025, 20, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Knife-Hand', '0', 'RH', NULL, 3003, 10100, 10425, NULL, NULL),
(1025, 21, NULL, 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3000, 10108, 10411, NULL, NULL),
(1025, 22, NULL, 1, NULL, NULL, 'Lh+Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, 10108, 10200, NULL, NULL),
(1025, 23, NULL, 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Reverse Knife-Hand', '0', 'F', NULL, 3031, 10106, 10417, NULL, NULL),
(1025, 24, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Elbow', 1, 'F', NULL, 3031, 10109, 10213, NULL, NULL),
(1025, 25, NULL, 1, NULL, NULL, 'Lh+R', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Straight Forearm', 1, 'F', NULL, 3031, 10106, 10421, NULL, NULL),
(1025, 26, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3031, 10109, 10217, NULL, NULL),
(1025, 26, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1025, 27, NULL, 1, '9:00', 'B', 'Lh+R', 'R', 'High', '0', NULL, NULL, 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3016, 10310, NULL, NULL, NULL),
(1025, 28, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', '7:00', 'BC', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10721, NULL, NULL, NULL),
(1025, 28, 'b', 1, NULL, NULL, 'Rh+L', 'L', 'High', '0', NULL, NULL, 'Foot', 'L', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, NULL, 10302, 10200, NULL, NULL),
(1025, 29, NULL, '0', NULL, NULL, 'R', 'L', NULL, '0', '11:00', 'BD', NULL, 'L', 'Mid', NULL, NULL, 'Backfist', '0', 'H', NULL, 3019, 10109, 10210, NULL, NULL),
(1025, 30, 'a', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3002, NULL, NULL, NULL, NULL),
(1025, 30, 'b', 1, NULL, NULL, 'Rh+L', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Reverse Knife-Hand', '0', 'F', NULL, 3013, 10106, 10417, NULL, NULL),
(1025, 31, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Elbow', 1, 'F', NULL, 3013, 10109, 10213, NULL, NULL),
(1025, 32, NULL, 1, NULL, NULL, 'Rh+L', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Straight Forearm', 1, 'F', NULL, 3013, 10106, 10421, NULL, NULL),
(1025, 33, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3013, 10109, 10217, NULL, NULL),
(1025, 33, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1025, 34, NULL, 1, '3:00', 'A', 'Rh+L', 'L', 'High', '0', NULL, NULL, 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3005, 10310, NULL, NULL, NULL),
(1025, 35, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', '5:00', 'AC', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10721, NULL, NULL, NULL),
(1025, 35, 'b', 1, NULL, NULL, 'Lh+R', 'R', 'High', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, NULL, 10302, 10613, NULL, 'Pulling both fists in front of chest'),
(1025, 36, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', '1:00', 'AD', NULL, 'R', 'Mid', NULL, NULL, 'Backfist', '0', 'H', NULL, 3019, 10109, 10210, NULL, 'diagram looks to be 1 SW'),
(1025, 37, 'a', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1025, 37, 'b', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3003, 10104, 10403, NULL, NULL),
(1025, 38, NULL, 1, '6:00', 'C', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3012, 10102, 10426, NULL, NULL),
(1025, 39, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', '4:00', '~A', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10732, NULL, NULL, NULL),
(1025, 39, 'b', 1, '12:00', 'D', 'L!', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3012, 10104, 10218, NULL, NULL),
(1025, 40, NULL, 1, NULL, NULL, 'L+R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3026, 10104, 10403, NULL, NULL),
(1025, 41, NULL, 1, '6:00', 'C', 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', 'H', NULL, 3004, 10102, 10426, NULL, NULL),
(1025, 42, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', '8:00', '~B', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10732, NULL, NULL, NULL),
(1025, 42, 'b', 1, '12:00', 'D', 'R!', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3004, 10104, 10218, NULL, NULL),
(1025, 43, NULL, 1, '12:00', 'D', 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3047, 10104, 10403, NULL, NULL),
(1025, 44, 'a', 1, NULL, NULL, 'L+R', 'R', 'Mid', 1, NULL, NULL, 'Foot Sword', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, 3041, 10322, 10200, NULL, NULL),
(1025, 44, 'b', 1, NULL, NULL, NULL, 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3032, 10104, 10403, NULL, NULL),
(1025, 45, 'a', 1, NULL, NULL, 'L+R', 'L', 'Mid', 1, NULL, NULL, 'Foot Sword', 'L', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, 3040, 10322, 10200, NULL, NULL),
(1025, 45, 'b', 1, NULL, NULL, NULL, 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3032, 10104, 10403, NULL, NULL),
(1025, 46, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'F', NULL, 3018, 10100, 10409, NULL, 'R>L?'),
(1025, 46, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, 'Side fist not explicitly mentioned but in pics'),
(1025, 47, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1025, 47, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', '6:00', 'C', 'Elbow', '0', 'H', NULL, 3026, 10104, 10203, 10293, 'was 10201 thrust'),
(1025, 48, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'F', NULL, 3018, 10100, 10409, NULL, 'L>R?'),
(1025, 48, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, 'Side fist not explicitly mentioned but in pics'),
(1025, 49, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1025, 49, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', '6:00', 'C', 'Elbow', '0', 'H', NULL, 3026, 10104, 10203, 10293, 'was 10201 thrust'),
(1025, 999, NULL, 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3000, 10010, NULL, NULL, NULL);


-- Ul-Ji (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1026, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10012, NULL, NULL, NULL),
(1026, 1, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', '6:00', 'C', 'Side Fist', 1, 'F', NULL, 3003, 10100, 10214, NULL, NULL),
(1026, 2, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'F', NULL, 3003, 10100, 10406, NULL, NULL),
(1026, 3, NULL, '0', NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'X-Knife-Hand', '0', 'F', 2001, NULL, NULL, 10402, NULL, NULL),
(1026, 4, 'a', 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, NULL, NULL, 10201, NULL, NULL),
(1026, 4, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10648, NULL, NULL),
(1026, 5, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1026, 5, 'b', 1, '6:00', 'C', NULL, NULL, NULL, '0', '3:00', 'B', NULL, 'L', 'Mid', NULL, NULL, 'Backhand', '0', 'S', NULL, 3012, 10106, 10214, NULL, NULL),
(1026, 6, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot Sole', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10315, 10629, NULL, NULL),
(1026, 7, 'a', 1, '9:00', 'A', 'R', NULL, NULL, '0', '9:00', 'A', NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', 'F', NULL, 3001, 10106, 10201, 10292, NULL),
(1026, 7, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10629, NULL, NULL),
(1026, 8, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', '3:00', 'B', 'Back Elbow', '0', 'F', NULL, NULL, NULL, 10204, NULL, NULL),
(1026, 8, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10625, NULL, NULL),
(1026, 9, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', '3:00', 'B', 'Backfist', '0', 'F', NULL, NULL, NULL, 10207, NULL, NULL),
(1026, 9, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10630, NULL, NULL),
(1026, 10, NULL, 1, '12:00', 'D', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Elbow', 1, 'F', NULL, 3001, 10110, 10203, 10293, 'was 10201 thrust'),
(1026, 11, NULL, '0', '3:00', 'A', 'L', 'R', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'S', 2002, 3002, 10109, 10607, NULL, NULL),
(1026, 12, NULL, 1, NULL, NULL, 'Lh+R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, NULL, 10302, 10607, NULL, NULL),
(1026, 13, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', '11:00', '~D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10704, NULL, NULL, NULL),
(1026, 13, 'b', 1, NULL, NULL, 'Rh+L', 'R', NULL, '0', '12:00', 'D', NULL, NULL, 'Mid', NULL, NULL, 'Elbow', 1, 'S', NULL, NULL, 10109, 10213, NULL, NULL),
(1026, 14, NULL, 1, NULL, NULL, 'Lh+R', NULL, NULL, '0', '12:00', 'D', NULL, 'R', 'Mid', NULL, NULL, 'Forefist', 1, 'S', NULL, 3000, 10106, 10212, NULL, NULL),
(1026, 15, 'a', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, 3001, 10107, 10201, 10291, 'Standing Up'),
(1026, 15, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10614, NULL, NULL),
(1026, 16, NULL, 1, '3:00', 'B', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'L Mid+R High', NULL, NULL, 'Knife-Hand', 1, NULL, NULL, 3001, 10104, 10400, NULL, 'L>R?'),
(1026, 17, NULL, 1, NULL, NULL, 'L+R', 'R', 'Mid', 1, NULL, NULL, 'Foot Sword', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, 3041, 10322, 10200, NULL, NULL),
(1026, 18, NULL, '0', NULL, NULL, NULL, 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forearm', 1, 'H', NULL, NULL, 10100, 10400, NULL, 'double'),
(1026, 19, NULL, 1, '12:00', 'D', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3002, 10004, NULL, NULL, NULL),
(1026, 20, 'a', 1, NULL, NULL, 'R;L', 'R', NULL, '0', '10:00', 'BD', NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3051, 10109, 10205, NULL, NULL),
(1026, 20, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10619, NULL, NULL),
(1026, 21, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3003, 10100, 10402, NULL, NULL),
(1026, 22, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1026, 23, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1026, 24, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Straight Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1026, 24, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10407, NULL, NULL),
(1026, 25, NULL, 1, '12:00', 'D', 'L', NULL, NULL, '0', '3:00', 'A', NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'S', NULL, 3047, 10106, 10205, NULL, NULL),
(1026, 26, 'a', 1, '9:00', 'F', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1026, 26, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Forearm', 1, 'F', NULL, 3000, 10014, NULL, NULL, NULL),
(1026, 27, NULL, 1, NULL, NULL, 'L+R', 'R', 'High', 1, NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3019, 10323, NULL, NULL, 'Photo!!'),
(1026, 28, NULL, '0', NULL, NULL, NULL, 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'X-Knife-Hand', '0', 'H', NULL, NULL, 10105, 10421, NULL, NULL),
(1026, 29, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'H', NULL, 3000, 10104, 10406, NULL, NULL),
(1026, 30, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, 'Mid', NULL, NULL, 'Inner Forearm', 1, 'F', NULL, NULL, 10390, 10404, NULL, 'ERROR not actually a side front snap kick as we\'re full facing'),
(1026, 31, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forefist', 1, 'F', NULL, 3000, 10100, 10224, NULL, NULL),
(1026, 32, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10105, 10425, NULL, NULL),
(1026, 32, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10418, NULL, 'akin to U-Nam'),
(1026, 33, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, NULL, NULL, NULL, NULL),
(1026, 33, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3022, 10104, 10200, NULL, NULL),
(1026, 34, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10702, 10999, NULL, NULL),
(1026, 34, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10104, 10999, NULL, NULL),
(1026, 34, 'c', 1, NULL, NULL, 'L+R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3033, 10104, 10403, NULL, 'distance?'),
(1026, 35, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', '10:00', 'DF', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10304, NULL, NULL, NULL),
(1026, 36, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10705, NULL, NULL, NULL),
(1026, 36, 'b', 1, NULL, NULL, 'Rh+L', 'L', 'Mid', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3047, 10306, NULL, NULL, NULL),
(1026, 37, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1026, 38, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3003, 10104, 10416, NULL, NULL),
(1026, 39, 'a', 1, '3:00', 'E', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, NULL, NULL, NULL, NULL),
(1026, 39, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', '2:00', 'DE', 'Inner Forearm', '0', 'RH', NULL, 3000, 10100, 10405, NULL, 'Direction listed as ED'),
(1026, 40, NULL, 1, '10:30', 'DF', 'Rh+Lh', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', '1:00', 'DE', 'Inner Forearm', '0', 'RH', NULL, 3110, 10100, 10405, NULL, NULL),
(1026, 41, NULL, 1, '12:00', 'D', 'L', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3101, 10106, 10200, NULL, NULL),
(1026, 42, NULL, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1026, 999, NULL, 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10012, NULL, NULL, NULL);


-- Moon-Moo (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1027, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10000, NULL, NULL, NULL),
(1027, 1, NULL, 1, '9:00', 'B', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', 2004, 3001, 10007, NULL, NULL, 'Definition Bending Stance A\'s directionality!'),
(1027, 2, NULL, 1, NULL, NULL, 'L', 'L', 'High', '0', NULL, NULL, 'Foot', 'L', 'High', NULL, NULL, 'Forefist', '0', 'S', 2004, NULL, 10302, 10200, NULL, 'Only first is slow motion'),
(1027, 3, NULL, '0', NULL, NULL, 'L', 'L', 'High', '0', NULL, NULL, 'Foot', 'L', 'High', NULL, NULL, 'Forefist', '0', 'S', 2005, NULL, 10302, 10200, NULL, 'double kick'),
(1027, 4, NULL, 1, '12:00', 'D', 'L', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, 3002, 10106, 10202, NULL, NULL),
(1027, 5, NULL, 1, '9:00', 'B', 'R', 'R', 'High', '0', NULL, NULL, 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', 'S', 2004, 3016, 10310, NULL, NULL, NULL),
(1027, 6, NULL, '0', NULL, NULL, 'L', 'R', NULL, '0', '6:00', 'C', NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, 3019, 10109, 10205, NULL, NULL),
(1027, 7, 'a', 1, '3:00', 'A', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Palm', '0', 'F', NULL, 3012, 10100, 10406, NULL, NULL),
(1027, 7, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1027, 8, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Palm', '0', 'F', NULL, 3000, 10100, 10406, NULL, NULL),
(1027, 8, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1027, 9, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', '9:00', 'B', 'Knife-Hand', '0', 'F', 2004, 3000, NULL, 10400, 10491, NULL),
(1027, 9, 'b', 1, '12:00', 'D', NULL, 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', '3:00', 'A', 'Knife-Hand', '0', NULL, NULL, 3001, 10111, 10400, 10491, NULL),
(1027, 10, 'a', 1, '3:00', 'A', 'L>R', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 2004, 3002, 10701, NULL, NULL, NULL),
(1027, 10, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10007, NULL, NULL, NULL),
(1027, 11, NULL, 1, NULL, NULL, 'R', 'R', 'High', '0', NULL, NULL, 'Foot', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', 2004, NULL, 10302, 10200, NULL, 'Only first is slow motion, punch not in picture'),
(1027, 12, NULL, '0', NULL, NULL, 'R', 'R', 'High', '0', NULL, NULL, 'Foot', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', 2005, NULL, 10302, 10200, NULL, 'double kick'),
(1027, 13, NULL, 1, '12:00', 'D', 'R', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, 3001, 10106, 10202, NULL, 'Mid tech hitting high on opp'),
(1027, 14, NULL, 1, '3:00', 'A', 'L', 'L', 'High', '0', NULL, NULL, 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', 'S', 2004, 3005, 10310, NULL, NULL, NULL),
(1027, 15, NULL, '0', NULL, NULL, 'R', 'L', NULL, '0', '6:00', 'C', NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, 3019, 10109, 10205, NULL, NULL),
(1027, 16, 'a', 1, '9:00', 'B', 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Palm', '0', 'F', NULL, 3004, 10100, 10406, NULL, NULL),
(1027, 16, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1027, 17, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Palm', '0', 'F', NULL, 3000, 10100, 10406, NULL, NULL),
(1027, 17, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1027, 18, 'a', 1, '12:00', 'D', 'R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', '3:00', 'A', 'Knife-Hand', '0', 'F', 2004, 3000, NULL, 10400, 10491, NULL),
(1027, 18, 'b', 1, NULL, NULL, NULL, 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', '9:00', 'B', 'Knife-Hand', '0', NULL, NULL, 3002, 10111, 10400, 10491, NULL),
(1027, 19, NULL, 1, '6:00', 'C', NULL, 'L', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3004, 10008, NULL, NULL, NULL),
(1027, 20, NULL, 1, NULL, NULL, 'R', 'R', 'High', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', NULL, 2004, NULL, 10306, NULL, NULL, NULL),
(1027, 21, 'a', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, NULL, NULL, NULL, NULL),
(1027, 21, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3003, 10100, 10200, NULL, NULL),
(1027, 22, NULL, 1, '6:00', 'C', 'L', 'R', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3012, 10008, NULL, NULL, 'side view flipped'),
(1027, 23, NULL, 1, NULL, NULL, 'L', 'L', 'High', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'F', 2004, NULL, 10306, NULL, NULL, NULL),
(1027, 24, 'a', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, NULL, NULL, NULL, NULL),
(1027, 24, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3003, 10100, 10200, NULL, NULL),
(1027, 25, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1027, 25, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3026, 10102, 10407, NULL, NULL),
(1027, 26, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10390, 10607, NULL, NULL),
(1027, 27, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', '2:00', '~A', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10703, NULL, NULL, NULL),
(1027, 27, 'b', 1, '6:00', 'C', 'Lh+R!', NULL, NULL, '0', '3:00', 'A', NULL, 'R', 'Mid', NULL, NULL, 'Side Fist', '0', 'S', NULL, 3004, 10106, 10205, NULL, NULL),
(1027, 28, 'a', 1, '3:00', 'A', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3001, NULL, NULL, NULL, NULL),
(1027, 28, 'b', 1, NULL, NULL, 'L+R', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3049, 10106, 10424, NULL, NULL),
(1027, 29, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2003, NULL, NULL, 10200, NULL, NULL),
(1027, 30, NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, 3001, NULL, 10400, 10491, NULL),
(1027, 31, 'a', 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, NULL, NULL, NULL, NULL),
(1027, 31, 'b', 1, NULL, NULL, 'L+R', 'R', 'Mid', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3051, 10318, NULL, NULL, 'Move the R foot just beyond L Foot'),
(1027, 32, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', '3:00', 'A', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10704, NULL, NULL, NULL),
(1027, 32, 'b', 1, '6:00', 'C', 'Rh+L', 'L', 'High', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3047, 10309, NULL, NULL, NULL),
(1027, 33, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10100, 10400, 10491, NULL),
(1027, 34, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1027, 34, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3026, 10102, 10407, NULL, NULL),
(1027, 35, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10390, 10607, NULL, NULL),
(1027, 36, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', '4:00', '~A', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10703, NULL, NULL, NULL),
(1027, 36, 'b', 1, '12:00', 'D', 'Rh+L!', NULL, NULL, '0', '3:00', 'A', NULL, 'L', 'Mid', NULL, NULL, 'Side Fist', '0', 'S', NULL, 3012, 10106, 10205, NULL, NULL),
(1027, 37, 'a', 1, '3:00', 'A', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3002, NULL, NULL, NULL, NULL),
(1027, 37, 'b', 1, NULL, NULL, 'L+R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3048, 10106, 10424, NULL, NULL),
(1027, 38, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2003, NULL, NULL, 10200, NULL, NULL),
(1027, 39, NULL, 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, 3002, NULL, 10400, 10491, NULL),
(1027, 40, 'a', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, NULL, NULL, NULL, NULL),
(1027, 40, 'b', 1, NULL, NULL, 'L+R', 'L', 'Mid', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3051, 10318, NULL, NULL, 'Move the R foot just beyond L Foot'),
(1027, 41, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', '3:00', 'A', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10704, NULL, NULL, NULL),
(1027, 41, 'b', 1, '12:00', 'D', 'Lh+R', 'R', 'High', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3044, 10309, NULL, NULL, NULL),
(1027, 42, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10100, 10400, 10491, 'paired with #33'),
(1027, 43, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10705, NULL, NULL, NULL),
(1027, 43, 'b', 1, NULL, NULL, 'R', 'R', 'High', '0', '2:00', 'AD', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'RH', NULL, NULL, 10308, NULL, NULL, NULL),
(1027, 44, 'a', '0', NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', '6:00', 'C', 'Backfist', '0', 'H', NULL, 3003, 10100, 10207, NULL, NULL),
(1027, 44, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10631, NULL, 'Fist extended toward front'),
(1027, 45, 'a', 1, NULL, NULL, 'L+R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3026, 10100, 10201, 10291, 'L not described'),
(1027, 45, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, NULL, 'akin to U-Nam'),
(1027, 46, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10705, NULL, NULL, NULL),
(1027, 46, 'b', 1, NULL, NULL, 'L', 'L', 'High', '0', '10:00', 'BD', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'RH', NULL, NULL, 10308, NULL, NULL, NULL),
(1027, 47, 'a', '0', NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', '6:00', 'C', 'Backfist', '0', 'H', NULL, 3003, 10100, 10207, NULL, NULL),
(1027, 47, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10631, NULL, 'Fist extended toward front'),
(1027, 48, 'a', 1, NULL, NULL, 'L+R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3026, 10100, 10201, 10291, 'R not described'),
(1027, 48, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, NULL, NULL),
(1027, 49, 'a', 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Side Sole', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10314, 10607, NULL, NULL),
(1027, 49, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1027, 50, 'a', 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Side Sole', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 10317, NULL, NULL, NULL),
(1027, 50, 'b', 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Ball of Foot', NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', 2005, NULL, 10316, 10403, NULL, NULL),
(1027, 51, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10218, NULL, NULL),
(1027, 52, 'a', 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Side Sole', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 10314, NULL, NULL, NULL),
(1027, 52, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3000, 10104, 10403, NULL, NULL),
(1027, 53, 'a', 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Side Sole', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 10317, 10607, NULL, NULL),
(1027, 53, 'b', 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Ball of Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', 2005, NULL, 10316, NULL, NULL, NULL),
(1027, 54, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10218, NULL, NULL),
(1027, 55, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10702, NULL, NULL, NULL),
(1027, 55, 'b', 1, '6:00', 'C', 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3012, 10100, 10200, NULL, NULL),
(1027, 56, 'a', 1, NULL, NULL, 'R;L', 'R', NULL, '0', '5:00', 'AC', NULL, 'L', 'Low', NULL, NULL, 'Forefist', '0', 'H', NULL, 3019, 10109, 10200, NULL, '1/2 SW R'),
(1027, 56, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10650, NULL, NULL),
(1027, 57, 'a', 1, '12:00', 'D', 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, NULL, NULL, NULL, NULL),
(1027, 57, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', '1:00', 'AD', NULL, 'R', 'Low', NULL, NULL, 'Forefist', '0', 'H', NULL, 3051, 10109, 10200, NULL, '1/2 SW L'),
(1027, 57, 'c', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10650, NULL, NULL),
(1027, 58, NULL, 1, NULL, NULL, 'L+R', 'R', 'Mid', 1, NULL, NULL, 'Foot Sword', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, 3057, 10322, 10200, NULL, NULL),
(1027, 59, NULL, '0', NULL, NULL, NULL, 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, 10104, 10403, NULL, NULL),
(1027, 60, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3036, 10702, NULL, NULL, NULL),
(1027, 60, 'b', 1, NULL, NULL, 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Arc Hand', '0', 'F', NULL, NULL, 10100, 10402, NULL, NULL),
(1027, 61, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1027, 999, NULL, 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3003, 10000, NULL, NULL, NULL);


-- So-San (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1028, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10003, NULL, NULL, NULL),
(1028, 1, NULL, 1, NULL, NULL, 'R;L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3026, 10102, 10403, NULL, 'slides further back per diagram ~FT'),
(1028, 2, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3011, 10100, 10224, NULL, NULL),
(1028, 3, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1028, 3, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3026, 10102, 10403, NULL, 'slides further back per diagram ~FT'),
(1028, 4, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3011, 10100, 10224, NULL, NULL),
(1028, 5, NULL, 1, '7:30', 'BC', 'Lh+Rh', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'RH', NULL, 3110, 10100, 10425, 10491, 'Examples of disjointed applications'),
(1028, 6, NULL, '0', '10:00', 'BD', 'Lh+Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, 3109, 10106, 10200, NULL, 'Examples of disjointed applications'),
(1028, 7, NULL, 1, '12:00', 'D', 'Lh+Rh', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', '11:00', 'BD', 'Knife-Hand', '0', 'RH', NULL, 3109, 10100, 10425, 10491, 'Error - walking stance not pictured/diagramed as BD, see #36'),
(1028, 8, NULL, '0', '10:00', 'BD', 'Lh+Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, 3108, 10106, 10200, NULL, NULL),
(1028, 9, 'a', 1, NULL, NULL, 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3027, NULL, NULL, NULL, NULL),
(1028, 9, 'b', 1, '3:00', 'A', 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', 1, 'F', NULL, 3031, 10108, 10214, NULL, 'app shows high, sorta'),
(1028, 10, NULL, 1, '6:00', 'C', 'R', 'R', 'High', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3002, 10302, 10607, NULL, NULL),
(1028, 11, NULL, '0', '12:00', 'D', 'R', 'R', 'High', '0', '1:00', '~D', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', 2005, 3012, 10304, 10607, NULL, 'diff from #15 picts, hands sorta stay in prev position'),
(1028, 12, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', '11:00', 'BD', NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3019, 10109, 10205, NULL, NULL),
(1028, 12, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10619, NULL, NULL),
(1028, 13, NULL, 1, '9:00', 'B', 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', 1, 'F', NULL, 3001, 10108, 10214, NULL, NULL),
(1028, 14, NULL, 1, '6:00', 'C', 'L', 'L', 'High', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, 3001, 10302, 10603, NULL, NULL),
(1028, 15, NULL, '0', '12:00', 'D', 'L', 'L', 'High', '0', '11:00', '~D', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', 2005, 3004, 10304, 10607, NULL, 'hands not noted in text but pictured'),
(1028, 16, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', '1:00', 'AD', NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3019, 10109, 10205, NULL, NULL),
(1028, 16, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10619, NULL, NULL),
(1028, 17, NULL, 1, '3:00', 'A', 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Forefist', 1, 'H', NULL, 3002, 10104, 10200, NULL, 'Error bad diagram, double fist'),
(1028, 18, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', 'F', NULL, 3011, 10100, 10622, NULL, 'releasing motion'),
(1028, 18, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10601, NULL, NULL),
(1028, 19, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1028, 20, 'a', 1, '9:00', 'B', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3006, 10706, NULL, NULL, NULL),
(1028, 20, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Forefist', 1, 'H', NULL, NULL, 10104, 10200, NULL, 'double fist'),
(1028, 21, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', 'F', NULL, 3011, 10100, 10622, NULL, 'releasing motion'),
(1028, 21, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10601, NULL, NULL),
(1028, 22, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1028, 23, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Middle-Knuckle Fist', '0', 'H', NULL, 3000, NULL, 10211, NULL, NULL),
(1028, 23, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3022, 10104, 10626, NULL, NULL),
(1028, 24, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3018, 10100, 10201, NULL, 'R>L?'),
(1028, 24, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, NULL, 'L arm not described'),
(1028, 25, 'a', 1, '3:00', 'A', 'R', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Middle-Knuckle Fist', '0', 'H', NULL, 3004, NULL, 10211, NULL, NULL),
(1028, 25, 'b', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3022, 10104, 10626, NULL, NULL),
(1028, 26, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3018, 10100, 10201, NULL, 'ERROR Foot diag wrong, angles'),
(1028, 26, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, NULL, 'L>R? R arm not described, front strike'),
(1028, 27, 'a', 1, '6:00', 'C', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3002, NULL, NULL, NULL, NULL),
(1028, 27, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Forearm', 1, 'F', NULL, 3003, 10014, NULL, NULL, NULL),
(1028, 28, NULL, 1, NULL, NULL, 'L+R', 'R', NULL, 1, NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3051, 10300, NULL, NULL, NULL),
(1028, 29, NULL, '0', NULL, NULL, NULL, 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, NULL, 10104, 10403, NULL, '~1/2 SW left'),
(1028, 30, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3003, 10100, 10410, NULL, NULL),
(1028, 31, NULL, 1, NULL, NULL, 'L+R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3022, 10100, 10200, NULL, 'shifting'),
(1028, 32, NULL, 1, '12:00', 'C', 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3004, 10100, 10410, NULL, 'R>L?'),
(1028, 33, NULL, 1, NULL, NULL, 'L+R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3022, 10100, 10200, NULL, 'shifting'),
(1028, 34, NULL, 1, '7:30', 'BC', 'Lh+Rh', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Arc Hand', 1, 'RH', NULL, 3110, 10100, 10425, 10400, 'double, more like 9:00 per app'),
(1028, 35, 'a', 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, NULL, NULL, 10215, NULL, NULL),
(1028, 35, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1028, 36, NULL, 1, '12:00', 'D', 'Lh+Rh', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', '10:00', 'BD', 'Inner Forearm', '0', 'RH', NULL, 3111, 10100, 10405, NULL, NULL),
(1028, 37, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1028, 38, NULL, 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1028, 39, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1028, 40, NULL, '0', NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1028, 41, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'X-Knife-Hand', '0', 'F', NULL, NULL, NULL, 10402, NULL, NULL),
(1028, 42, NULL, 1, '4:30', 'AC', 'Lh+Rh', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Arc Hand', 1, 'RH', NULL, 3111, 10100, 10425, 10400, 'more like 3:00 A'),
(1028, 43, 'a', 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, NULL, NULL, 10215, NULL, NULL),
(1028, 43, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1028, 44, NULL, 1, '12:00', 'D', 'Lh+Rh', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', '1:00', 'AD', 'Inner Forearm', '0', 'RH', NULL, 3110, 10100, 10405, NULL, NULL),
(1028, 45, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1028, 46, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1028, 47, NULL, '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1028, 48, NULL, '0', NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1028, 49, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'X-Knife-Hand', '0', 'F', NULL, NULL, NULL, 10402, NULL, NULL),
(1028, 50, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10705, 10999, NULL, NULL),
(1028, 50, 'b', 1, '6:00', 'C', 'Lh+R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, 10999, 10999, NULL, NULL),
(1028, 50, 'c', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3026, 10104, 10403, NULL, NULL),
(1028, 51, NULL, 1, '12:00', 'D', 'L+R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3055, 10104, 10403, NULL, 'ERROR photos wrong, distance?'),
(1028, 52, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3011, 10100, 10400, NULL, 'L>R? Error - picture shows full facing, app shows diff dir'),
(1028, 52, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', NULL, NULL, NULL, NULL, 10425, NULL, NULL),
(1028, 53, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, NULL, 10200, NULL, NULL),
(1028, 54, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3018, 10104, 10200, NULL, 'L>R?'),
(1028, 55, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10705, 10999, NULL, NULL),
(1028, 55, 'b', 1, '6:00', 'C', 'Rh+L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10999, 10999, NULL, 'diff diag from #50!?'),
(1028, 55, 'c', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3026, 10104, 10403, NULL, NULL),
(1028, 56, NULL, 1, '12:00', 'D', 'L+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3056, 10104, 10403, NULL, 'distance?'),
(1028, 57, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3011, 10100, 10400, NULL, 'R>L? Error - picture shows full facing, app shows diff dir'),
(1028, 57, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Inner Forearm', '0', NULL, NULL, NULL, NULL, 10425, NULL, NULL),
(1028, 58, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', 2001, NULL, NULL, 10200, NULL, NULL),
(1028, 59, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3018, 10104, 10200, NULL, 'R>L?'),
(1028, 60, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10702, NULL, NULL, 'ERROR Diagram wring, see #66/large'),
(1028, 60, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3026, 10104, 10424, NULL, NULL),
(1028, 61, NULL, 1, NULL, NULL, 'L+R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3022, 10104, 10200, NULL, 'shifting'),
(1028, 62, NULL, 1, '6:00', 'C', 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3004, 10007, NULL, NULL, NULL),
(1028, 63, NULL, 1, NULL, NULL, 'R', 'R', 'High', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, NULL, 10302, 10607, NULL, 'ERROR in photos - hands'),
(1028, 64, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1028, 65, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10403, NULL, NULL),
(1028, 66, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10702, NULL, NULL, NULL),
(1028, 66, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3026, 10104, 10424, NULL, NULL),
(1028, 67, NULL, 1, NULL, NULL, 'L+R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3022, 10104, 10200, NULL, 'shifting'),
(1028, 68, NULL, 1, '12:00', 'D', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3012, 10007, NULL, NULL, NULL),
(1028, 69, NULL, 1, NULL, NULL, 'L', 'L', 'High', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, NULL, 10302, 10607, NULL, NULL),
(1028, 70, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1028, 71, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10403, NULL, NULL),
(1028, 72, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', 2001, 3011, 10100, 10200, NULL, 'R>L?'),
(1028, 999, NULL, 1, NULL, NULL, 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3003, 10003, NULL, NULL, NULL);


-- Se-Jong (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1029, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10004, NULL, NULL, NULL),
(1029, 1, NULL, 1, '9:00', 'B', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3001, 10100, 10400, NULL, NULL),
(1029, 2, 'a', 1, '3:00', 'A', 'L>R', 'L', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10701, NULL, NULL, NULL),
(1029, 2, 'b', 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'R Mid+L High', NULL, NULL, 'Forearm', 1, 'H', NULL, NULL, 10104, 10400, NULL, NULL),

(1029, 3, NULL, 1, '12:00', 'D', 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot', 'R', 'High', NULL, NULL, 'Forefist', '0', 'S', NULL, 3001, 10302, 10200, NULL, NULL),
(1029, 4, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', '3:00', 'A', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10704, NULL, NULL, NULL),
(1029, 4, 'b', 1, '3:00', 'F', 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3001, 10100, 10402, NULL, NULL),
(1029, 5, 'a', 1, '9:00', 'E', 'L>R', 'L', NULL, '0', '11:00', '~D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10701, NULL, NULL, NULL),
(1029, 5, 'b', 1, NULL, NULL, 'Lh+R', NULL, NULL, '0', '12:00', 'D', NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'S', NULL, NULL, 10106, 10205, NULL, 'strike to c?'),
(1029, 6, NULL, 1, '12:00', 'D', 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10004, NULL, NULL, NULL),
(1029, 7, 'a', 1, NULL, NULL, 'L;R', 'L', NULL, '0', '2:00', NULL, NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'H', NULL, 3019, 10109, 10205, NULL, NULL),
(1029, 7, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10619, NULL, NULL),
(1029, 8, NULL, 1, '3:00', 'G', 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3002, 10100, 10200, NULL, NULL),
(1029, 9, 'a', 1, '9:00', 'H', 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3017, 10706, NULL, NULL, NULL),
(1029, 9, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forearm', '0', 'H', NULL, NULL, 10105, 10403, NULL, NULL),
(1029, 10, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Straight Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1029, 10, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10407, NULL, NULL),
(1029, 11, 'a', 1, '3:00', 'G', 'R>L', 'R', NULL, '0', '8:00', '~A', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, 10701, NULL, NULL, NULL),
(1029, 11, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, NULL, 10100, 10205, NULL, 'stike to d?'),
(1029, 12, NULL, 1, '6:00', 'C', 'L', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3002, 10106, 10424, NULL, 'Foot to line GH, but off to side?!?'),
(1029, 13, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', '6:00', 'C', 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10304, NULL, NULL, 'photos show full turn to kick to C rather than 5:00'),
(1029, 14, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', '8:00', 'CF', NULL, 'L', 'High', NULL, NULL, 'Forearm', 1, 'H', NULL, 3019, 10109, 10400, NULL, 'not centered due to high tech'),
(1029, 15, NULL, 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, NULL, '0', 'F', 2004, 3031, 10106, 10631, NULL, NULL),
(1029, 16, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, NULL, NULL, 10201, 10291, NULL),
(1029, 16, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, NULL, 'not described in text'),
(1029, 17, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3013, 10709, NULL, NULL, NULL),
(1029, 17, 'b', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Palm', 1, 'F', NULL, 3013, 10112, 10406, NULL, NULL),
(1029, 18, NULL, 1, '4:30', 'CE', 'Lh+Rh', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', '6:00', 'C', 'Arc Hand', 1, 'RH', NULL, 3106, 10100, 10425, 10400, 'ERROR foot diags missing heel pivot'),
(1029, 19, 'a', 1, '6:00', 'C', 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', '9:00', 'F', 'Outer Forearm', '0', 'F', NULL, 3101, 10111, 10400, 10491, NULL),
(1029, 19, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', '3:00', 'E', 'Forearm', '0', NULL, NULL, NULL, NULL, 10400, 10491, NULL),
(1029, 20, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 2004, 3003, 10702, NULL, NULL, NULL),
(1029, 20, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Palm', '0', 'F', NULL, NULL, 10100, 10406, NULL, 'slipping?'),
(1029, 20, 'c', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1029, 21, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3000, 10111, 10201, NULL, 'described differenly but app shows backfist'),
(1029, 21, 'b', 1, NULL, NULL, NULL, 'L', NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 10708, 10649, NULL, NULL),
(1029, 22, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', '12:00', 'D', NULL, 'L', 'Mid', NULL, NULL, 'Elbow', '0', 'H', NULL, 3000, 10105, 10203, 10293, 'was 10201 thrust, no turn, though desc as clockwise?!'),
(1029, 23, NULL, 1, '3:00', 'A', 'R>L;R', 'L', NULL, '0', '3:00', 'A', NULL, NULL, 'High', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3016, 10104, 10403, NULL, 'R>L?'),
(1029, 24, 'a', 1, '9:00', 'B', 'R>L', 'R', NULL, '0', '1:00', '~D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, 10701, NULL, NULL, NULL),
(1029, 24, 'b', 1, NULL, NULL, 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, NULL, 10104, 10200, NULL, NULL),
(1029, 999, NULL, 1, '12:00', 'D', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3002, 10004, NULL, NULL, NULL);


-- U-Nam (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1031, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10003, NULL, NULL, NULL),
(1031, 1, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Inner Forearm', '0', 'F', NULL, 3031, 10106, 10420, NULL, NULL),
(1031, 1, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Forearm', '0', NULL, NULL, NULL, NULL, 10400, NULL, NULL),
(1031, 2, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Inner Forearm', '0', 'F', NULL, NULL, NULL, 10420, NULL, NULL),
(1031, 2, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forearm', '0', NULL, NULL, NULL, NULL, 10400, NULL, NULL),
(1031, 3, 'a', 1, NULL, NULL, 'R>L', NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', 'F', NULL, 3013, 10110, 10645, NULL, NULL),
(1031, 3, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10646, NULL, NULL),
(1031, 4, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forefist', 1, 'F', NULL, 3000, 10100, 10224, NULL, NULL),
(1031, 5, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3000, 10100, 10201, NULL, NULL),
(1031, 5, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, NULL, NULL),
(1031, 6, 'a', 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', '6:00', 'C', 'Backfist', '0', 'H', NULL, NULL, NULL, 10207, NULL, NULL),
(1031, 6, 'b', 1, NULL, NULL, '&nbsp;', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Low', '11:00', 'BD', 'Forearm', '0', '&nbsp;', NULL, NULL, NULL, 10400, NULL, 'was: 10425'),
(1031, 6, 'c', 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'F', 2002, NULL, NULL, 10201, NULL, NULL),
(1031, 6, 'd', 1, NULL, NULL, '&nbsp;', NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, NULL, NULL),
(1031, 7, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1031, 8, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1031, 9, 'a', 1, '12:00', 'D', 'R', 'R', NULL, '0', '5:00', '~C', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3047, 10703, NULL, NULL, NULL),
(1031, 9, 'b', 1, NULL, NULL, 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forearm', '0', 'H', NULL, 3026, 10105, 10400, NULL, NULL),
(1031, 9, 'c', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10651, NULL, NULL),
(1031, 10, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10607, NULL, NULL),
(1031, 11, NULL, '0', NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3022, 10101, 10200, NULL, NULL),
(1031, 12, NULL, 1, NULL, NULL, 'Lh+R', 'R', 'High', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3037, 10304, 10638, NULL, NULL),
(1031, 13, 'a', '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10153, 10200, NULL, NULL),
(1031, 13, 'b', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10623, NULL, NULL),
(1031, 14, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, NULL, NULL, NULL, NULL),
(1031, 14, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Elbow', '0', 'F', NULL, 3022, 10101, 10216, NULL, NULL),
(1031, 15, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10218, NULL, NULL),
(1031, 16, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3003, 10104, 10424, NULL, NULL),
(1031, 17, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10218, NULL, NULL),
(1031, 18, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'F', NULL, 3000, 10100, 10406, NULL, NULL),
(1031, 19, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Knee', NULL, NULL, NULL, NULL, 'X-Palm', '0', 'H', NULL, NULL, 10303, 10608, 10300, NULL),
(1031, 20, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3026, 10104, 10218, NULL, NULL),
(1031, 21, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, NULL, NULL, NULL, NULL),
(1031, 21, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', 'F', NULL, 3022, 10101, 10216, NULL, NULL),
(1031, 22, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', '12:00', 'D', NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10111, 10646, NULL, NULL),
(1031, 22, 'b', 1, '9:00', 'B', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', 'S', NULL, 3001, NULL, 10625, NULL, NULL),
(1031, 23, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', 'L', 'High', NULL, NULL, 'Backfist', '0', 'S', NULL, NULL, 10302, 10214, NULL, NULL),
(1031, 24, NULL, '0', '10:30', 'BD', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Palm', 1, 'F', NULL, 3101, 10104, 10406, NULL, NULL),
(1031, 25, 'a', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3101, NULL, NULL, NULL, 'R>L?'),
(1031, 25, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3000, 10100, 10410, NULL, NULL),
(1031, 25, 'c', 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', '3:00', 'A', 'Backfist', '0', 'F', NULL, NULL, NULL, 10205, NULL, NULL),
(1031, 26, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, NULL, NULL, NULL, NULL),
(1031, 26, 'b', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Flat Fingertip', '0', 'F', NULL, 3026, 10101, 10202, NULL, NULL),
(1031, 27, 'a', 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot', 'L', NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, 10603, NULL, NULL),
(1031, 27, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10620, NULL, NULL),
(1031, 28, 'a', '0', NULL, NULL, 'R', 'R', NULL, '0', '8:00', '~B', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10703, NULL, NULL, NULL),
(1031, 28, 'b', '0', '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', 'F', NULL, 3012, NULL, 10646, NULL, NULL),
(1031, 28, 'c', '0', NULL, NULL, 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10100, 10625, NULL, NULL),
(1031, 29, NULL, 1, NULL, NULL, 'R', NULL, NULL, '0', '3:00', 'A', NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3013, 10106, 10417, NULL, NULL),
(1031, 30, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1031, 31, NULL, 1, NULL, NULL, 'R;L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'H', NULL, 3026, 10104, 10406, NULL, NULL),
(1031, 32, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1031, 33, NULL, '0', NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', 2001, 3000, 10100, 10402, NULL, NULL),
(1031, 34, NULL, '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', '0', 'F', 2001, 3000, 10100, 10402, NULL, NULL),
(1031, 35, NULL, 1, NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, NULL, 10302, NULL, NULL, NULL),
(1031, 36, NULL, '0', NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1031, 37, 'a', 1, '12:00', 'D', 'R>L;R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3004, 10100, 10200, NULL, NULL),
(1031, 37, 'b', 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3032, NULL, 10200, NULL, NULL),
(1031, 38, 'a', 1, NULL, NULL, 'R+L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', '6:00', 'C', 'Back Elbow', '0', 'F', NULL, 3026, 10101, 10204, NULL, NULL),
(1031, 38, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10625, NULL, NULL),
(1031, 39, 'a', 1, '9:00', 'B', 'L>R;L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3001, 10105, 10424, NULL, NULL),
(1031, 39, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Open Fist', '0', NULL, NULL, NULL, NULL, 10200, NULL, 'from strike to punch to match Choong-Jang'),
(1031, 40, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3000, 10100, 10400, NULL, NULL),
(1031, 40, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Inner Forearm', '0', NULL, NULL, NULL, NULL, 10400, NULL, NULL),
(1031, 41, NULL, 1, '3:00', 'A', 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3004, 10104, 10400, NULL, NULL),
(1031, 42, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Straight Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1031, 42, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10407, NULL, NULL),
(1031, 999, NULL, 1, '12:00', 'D', 'L>R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10003, NULL, NULL, NULL);


-- U-Nam (Lost In Translation)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1032, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10012, NULL, NULL, NULL),
(1032, 1, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Inner Forearm', '0', 'F', NULL, 3031, 10106, 10420, NULL, NULL),
(1032, 1, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10630, NULL, NULL),
(1032, 2, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Inner Forearm', '0', 'F', NULL, NULL, NULL, 10420, NULL, NULL),
(1032, 2, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10630, NULL, NULL),
(1032, 3, NULL, 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3048, 10110, 10225, NULL, NULL),
(1032, 4, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forefist', 1, 'F', NULL, 3000, 10100, 10224, NULL, NULL),
(1032, 5, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3000, 10100, 10208, NULL, NULL),
(1032, 5, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, NULL, NULL),
(1032, 6, 'a', 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', '6:00', 'C', 'Backfist', '0', 'F', NULL, NULL, NULL, 10207, NULL, NULL),
(1032, 6, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10631, NULL, NULL),
(1032, 7, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3000, 10100, 10208, NULL, NULL),
(1032, 7, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10633, NULL, NULL),
(1032, 8, 'a', 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', '6:00', 'C', 'Backfist', '0', 'F', NULL, NULL, NULL, 10207, NULL, NULL),
(1032, 8, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10631, NULL, NULL),
(1032, 9, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1032, 10, 'a', 1, '12:00', 'D', 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3047, 10703, NULL, NULL, NULL),
(1032, 10, 'b', 1, NULL, NULL, 'L+R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3026, 10100, 10400, NULL, NULL),
(1032, 11, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'S', NULL, NULL, 10302, 10607, NULL, NULL),
(1032, 12, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1032, 13, NULL, 1, NULL, NULL, NULL, 'L', NULL, '0', '9:00', 'B', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3037, 10153, 10638, NULL, NULL),
(1032, 14, NULL, 1, NULL, NULL, 'R', 'R', 'High', '0', NULL, NULL, 'Ball of Foot', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10304, 10607, NULL, NULL),
(1032, 15, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, 10153, 10200, NULL, NULL),
(1032, 15, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10623, NULL, NULL),
(1032, 16, NULL, 1, NULL, NULL, 'Lh;Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', NULL, NULL, 'Palm', '0', 'H', NULL, 3003, 10104, 10424, NULL, NULL),
(1032, 17, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3003, 10104, 10200, NULL, NULL),
(1032, 18, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'F', NULL, 3000, 10100, 10406, NULL, NULL),
(1032, 19, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Knee', NULL, NULL, NULL, NULL, 'X-Palm', '0', 'H', NULL, NULL, 10303, 10608, NULL, NULL),
(1032, 20, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3003, 10104, 10205, NULL, NULL),
(1032, 21, 'a', 1, NULL, NULL, 'R;L+Rh', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Elbow', '0', 'F', NULL, 3025, 10100, 10201, NULL, NULL),
(1032, 21, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10629, NULL, NULL),
(1032, 22, NULL, 1, '9:00', 'B', 'L', 'R', NULL, '0', '12:00', 'D', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10111, 10644, NULL, NULL),
(1032, 23, NULL, 1, NULL, NULL, 'L', 'L', 'High', '0', NULL, NULL, 'Foot Sword', 'L', 'Mid', NULL, NULL, 'Backfist', '0', 'S', NULL, NULL, 10302, 10214, NULL, NULL),
(1032, 24, 'a', 1, '10:30', 'BD', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3101, NULL, NULL, NULL, NULL),
(1032, 24, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Palm', 1, 'H', NULL, 3000, 10104, 10406, NULL, NULL),
(1032, 25, 'a', 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3101, NULL, NULL, NULL, NULL),
(1032, 25, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Open Fist', '0', 'F', NULL, 3018, 10100, 10200, NULL, NULL),
(1032, 26, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'H', NULL, NULL, NULL, 10411, NULL, NULL),
(1032, 27, NULL, 1, NULL, NULL, 'R', 'R', 'Low', '0', NULL, NULL, 'Ball of Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, NULL, NULL, NULL),
(1032, 28, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', '11:00', '~D', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10703, NULL, NULL, NULL),
(1032, 28, 'b', 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, NULL, NULL, NULL, NULL),
(1032, 28, 'c', 1, NULL, NULL, 'L+Rh', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3003, 10100, 10643, NULL, NULL),
(1032, 29, NULL, 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3000, 10106, 10417, NULL, NULL),
(1032, 30, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1032, 31, NULL, 1, NULL, NULL, 'R;L+R', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'H', NULL, 3026, 10104, 10406, NULL, NULL),
(1032, 32, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1032, 33, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1032, 34, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forearm', '0', 'F', NULL, 3000, 10100, 10402, NULL, NULL),
(1032, 35, NULL, 1, NULL, NULL, 'L', 'L', 'Low', '0', NULL, NULL, 'Ball of Foot', NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10300, NULL, NULL, NULL),
(1032, 36, NULL, 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, 3000, 10100, 10200, NULL, NULL),
(1032, 37, 'a', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1032, 37, 'b', 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1032, 38, NULL, 1, '12:00', 'D', 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', '6:00', 'C', 'Elbow', '0', 'F', NULL, 3004, 10101, 10204, NULL, NULL),
(1032, 39, 'a', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3000, 10703, 10999, NULL, NULL),
(1032, 39, 'b', 1, '9:00', 'B', 'Rh+L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3001, 10104, 10400, NULL, NULL),
(1032, 39, 'c', 1, NULL, NULL, '&nbsp;', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', NULL, NULL, 3032, 10999, 10200, NULL, NULL),
(1032, 40, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3000, 10104, 10400, NULL, NULL),
(1032, 40, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', '8:00', 'BC', 'Inner Forearm', '0', 'H', NULL, NULL, 10999, 10400, NULL, NULL),
(1032, 41, NULL, 1, '3:00', 'A', 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', '0', 'H', NULL, 3004, 10104, 10403, NULL, NULL),
(1032, 42, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Straight Fingertip', '0', 'F', NULL, 3000, 10100, 10202, NULL, NULL),
(1032, 42, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10407, NULL, NULL),
(1032, 999, NULL, 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3001, 10012, NULL, NULL, NULL);


-- Tong-Il (fully reviewed)
INSERT INTO PatternCount (`patternid`, `count`, `countorder`, `counted`, `eyesto`, `eyesdiagramdirection`, `feetinmotion`, `leglr`, `legsection`, `islegtechniqueflying`, `legto`, `legdiagramdirection`, `legtool`, `armlr`, `armsection`, `armto`, `armdiagramdirection`, `armtool`, `isarmtooltwin`, `facing`, `motionid`, `bodymovementid`, `legtechniqueid`, `armtechniqueid`, `originaltechniqueid`, `note`) VALUES
(1030, '0', NULL, 1, '12:00', 'D', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, NULL, 10013, NULL, NULL, NULL),
(1030, 1, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Forefist', 1, 'F', 2004, 3003, 10100, 10200, NULL, NULL),
(1030, 2, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Knife-Hand', 1, 'F', 2004, 3003, 10100, 10214, NULL, NULL),
(1030, 3, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Outer Forearm', '0', 'H', NULL, 3000, 10102, 10409, NULL, NULL),
(1030, 4, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Palm', '0', 'F', NULL, 3018, 10100, 10409, NULL, 'slipping'),
(1030, 4, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10626, NULL, NULL),
(1030, 5, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3000, 10104, 10200, NULL, NULL),
(1030, 6, NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', 2002, NULL, NULL, 10200, NULL, 'fast motion desc not on sep line'),
(1030, 7, NULL, 1, NULL, NULL, 'L!', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Backhand', '0', 'H', NULL, 3000, 10104, 10218, NULL, NULL),
(1030, 8, NULL, 1, NULL, NULL, 'R', 'R', 'Mid', '0', NULL, NULL, 'Reverse Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10319, 10629, NULL, 'app shows mid'),
(1030, 9, NULL, 1, NULL, NULL, 'R!', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backhand', '0', 'H', NULL, 3000, 10104, 10218, NULL, NULL),
(1030, 10, NULL, '0', NULL, NULL, 'L', 'L', 'Mid', '0', NULL, NULL, 'Reverse Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, NULL, 10319, 10629, NULL, 'app in #8 shows mid'),
(1030, 11, 'a', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 2004, 3000, 10706, NULL, NULL, NULL),
(1030, 11, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Mid', NULL, NULL, 'Palm', 1, 'H', NULL, 3011, 10104, 10419, NULL, NULL),
(1030, 12, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', 2004, 3000, 10100, 10400, 10491, 'Error - block too far across in photo'),
(1030, 13, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Reverse Knife-Hand', '0', 'RH', 2004, NULL, NULL, 10425, 10491, NULL),
(1030, 14, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1030, 15, NULL, '0', NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, 'ERROR Foot diag missing lifted heel, though desc in text'),
(1030, 16, NULL, 1, '4:30', 'AC', 'R', 'R', 'Mid', '0', NULL, NULL, 'Back of Heel', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3103, 10321, 10607, NULL, 'ERROR large photo and foot diag wrong kick angle'),
(1030, 17, NULL, '0', '6:00', 'C', 'R!', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Backfist', '0', 'H', NULL, 3101, 10104, 10210, NULL, NULL),
(1030, 18, NULL, 1, '7:30', 'BC', 'L', 'L', 'Mid', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', 'H', NULL, 3105, 10320, 10607, NULL, 'ERROR sim to #16, made to match angles'),
(1030, 19, NULL, 1, '6:00', 'C', 'L!', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Backfist', '0', 'H', NULL, 3100, 10104, 10210, NULL, NULL),
(1030, 20, NULL, 1, '12:00', 'D', 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, 3004, 10100, 10200, NULL, 'R>L?'),
(1030, 21, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', 2002, NULL, NULL, 10200, NULL, NULL),
(1030, 22, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Bow Wrist', '0', 'H', NULL, 3000, 10102, 10416, NULL, NULL),
(1030, 23, NULL, 1, NULL, NULL, 'Lh+R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Bow Wrist', '0', 'H', NULL, 3000, 10102, 10416, NULL, NULL),
(1030, 24, 'a', 1, '6:00', 'C', 'Rh+L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'Low', NULL, NULL, 'Palm', '0', 'F', 2004, 3012, 10100, 10406, NULL, 'L>R?'),
(1030, 24, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1030, 25, 'a', '0', NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Palm', '0', 'F', 2004, 3000, 10100, 10406, NULL, 'slow motion not on sep line, cont motion?'),
(1030, 25, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', NULL, NULL, NULL, NULL, 10416, NULL, NULL),
(1030, 26, 'a', 1, NULL, NULL, 'R>L', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, 3000, 10110, 10400, NULL, 'As per Kwang-Gae #12 but described somewhat differently'),
(1030, 26, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10628, NULL, NULL),
(1030, 27, NULL, 1, '12:00', 'D', 'L', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, 3012, 10100, 10402, NULL, NULL),
(1030, 28, NULL, 1, NULL, NULL, 'Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1030, 29, 'a', 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3000, NULL, 10211, NULL, NULL),
(1030, 29, 'b', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3022, 10104, 10626, NULL, NULL),
(1030, 30, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', '9:00', 'B', 'Angle Fingertip', '0', 'F', NULL, 3003, 10100, 10202, NULL, 'app shows dir of attack'),
(1030, 31, 'a', 1, '6:00', 'C', 'L', 'L', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3006, 10706, NULL, NULL, 'ERROR left foot on line CD, which shown well off!?'),
(1030, 31, 'b', 1, NULL, NULL, 'Lh+R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Knife-Hand', '0', 'F', NULL, NULL, 10100, 10402, NULL, NULL),
(1030, 32, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, NULL, 10200, NULL, NULL),
(1030, 33, 'a', 1, NULL, NULL, 'L', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'H', NULL, 3000, NULL, 10211, NULL, NULL),
(1030, 33, 'b', 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3022, 10104, 10626, NULL, NULL),
(1030, 34, NULL, 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'High', '3:00', 'A', 'Angle Fingertip', '0', 'F', NULL, 3003, 10100, 10202, NULL, NULL),
(1030, 35, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', NULL, 3018, 10104, 10403, NULL, 'R>L? Foot moves in circular motion'),
(1030, 35, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10611, NULL, NULL),
(1030, 36, 'a', 1, '12:00', 'D', 'L', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'Reverse Knife-Hand', '0', 'H', NULL, 3012, 10104, 10403, NULL, 'L>R?'),
(1030, 36, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10611, NULL, NULL),
(1030, 37, 'a', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Low', NULL, NULL, 'Forearm', '0', 'H', NULL, 3011, 10100, 10400, NULL, 'L>R? Error - picture shows full facing, app shows diff dir'),
(1030, 37, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Knife-Hand', '0', NULL, NULL, NULL, NULL, 10425, NULL, NULL),
(1030, 38, NULL, 1, NULL, NULL, 'R!', 'R', NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Forefist', 1, 'F', NULL, 3000, 10100, 10224, NULL, NULL),
(1030, 39, 'a', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3003, 10111, 10201, NULL, 'strike described differently, but app shows backfist'),
(1030, 39, 'b', 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 10649, NULL, NULL),
(1030, 40, NULL, 1, '6:00', 'C', 'R', 'R', 'Mid', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, 10306, 10612, NULL, NULL),
(1030, 41, NULL, 1, '3:00', 'A', 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3001, 10106, 10417, NULL, NULL),
(1030, 42, NULL, 1, NULL, NULL, 'L+R', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3049, 10106, 10417, NULL, NULL),
(1030, 43, NULL, 1, '9:00', 'B', 'R!', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3012, 10106, 10417, NULL, NULL),
(1030, 44, NULL, 1, NULL, NULL, 'L+R', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'High', NULL, NULL, 'Outer Forearm', 1, 'F', NULL, 3048, 10106, 10417, NULL, NULL),
(1030, 45, 'a', 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, 'L', 'High', NULL, NULL, 'Backfist', '0', 'F', NULL, 3001, NULL, 10201, NULL, NULL),
(1030, 45, 'b', 1, NULL, NULL, 'L', 'R', NULL, '0', NULL, NULL, NULL, 'R', NULL, NULL, NULL, NULL, '0', NULL, NULL, 3003, 10111, 10649, NULL, NULL),
(1030, 46, NULL, 1, '12:00', 'D', 'L', 'L', 'High', '0', NULL, NULL, 'Foot Sword', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3012, 10306, 10612, NULL, NULL),
(1030, 47, 'a', 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3004, NULL, NULL, NULL, NULL),
(1030, 47, 'b', 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, NULL, 'Low', NULL, NULL, 'X-Fist', '0', 'F', NULL, 3019, 10109, 10406, NULL, NULL),
(1030, 48, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'L', 'High', '9:00', 'B', 'Under Fist', '0', 'F', NULL, 3003, 10100, 10201, 10291, 'app shows angle'),
(1030, 49, NULL, 1, NULL, NULL, 'R', 'R', NULL, '0', NULL, NULL, NULL, 'R', 'High', '3:00', 'A', 'Under Fist', '0', 'F', NULL, 3000, 10100, 10201, 10291, 'app shows angle'),
(1030, 50, NULL, 1, NULL, NULL, 'Lh', NULL, NULL, '0', NULL, NULL, NULL, 'L', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, NULL, NULL, 10418, NULL, NULL),
(1030, 51, NULL, 1, '1:30', 'AD', 'Lh+Rh', NULL, NULL, '0', NULL, NULL, NULL, 'R', 'Low>Mid', '3:00', 'A', 'Knife-Hand', '0', 'RH', NULL, 3110, NULL, 10405, NULL, NULL),
(1030, 52, 'a', 1, '6:00', 'C', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 3103, NULL, NULL, NULL, NULL),
(1030, 52, 'b', 1, NULL, NULL, 'L', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Palm', '0', 'F', NULL, 3000, 10100, 10418, NULL, NULL),
(1030, 53, NULL, 1, '10:30', 'BD', 'Lh+Rh', 'R', NULL, '0', NULL, NULL, NULL, 'L', 'Low>Mid', '9:00', 'B', 'Knife-Hand', '0', 'RH', NULL, 3111, 10100, 10405, NULL, NULL),
(1030, 54, 'a', 1, '12:00', 'D', 'R', 'R', 'High', '0', NULL, NULL, 'Foot', NULL, 'Mid', NULL, NULL, 'Forearm', '0', 'S', NULL, 3101, 10302, 10403, NULL, 'two movement in one count'),
(1030, 54, 'b', 1, NULL, NULL, 'R>L', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'Mid', '6:00', 'C', 'Elbow', 1, 'F', 2004, NULL, 10110, 10204, 10294, 'was 10201 thrust, only b in slow motion?'),
(1030, 55, NULL, 1, NULL, NULL, 'L', NULL, NULL, '0', '3:00', 'A', NULL, 'L', 'Mid', NULL, NULL, 'Forefist', '0', 'S', NULL, 3000, 10106, 10290, NULL, NULL),
(1030, 56, NULL, 1, NULL, NULL, 'R', 'L', NULL, '0', NULL, NULL, NULL, 'R', 'Mid', NULL, NULL, 'Forefist', '0', 'F', NULL, NULL, 10100, 10200, NULL, 'R>L?'),
(1030, 999, NULL, 1, NULL, NULL, 'R', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'F', NULL, 3000, 10013, NULL, NULL, NULL);






-- Sparring Patterns:
INSERT INTO `PatternCount` (`PatternID`, `Count`, `CountOrder`, `Counted`, `MotionID`, `BodyMovementID`, `EyesTo`, `EyesDiagramDirection`, `FeetInMotion`, `LegLR`, `LegSection`, `LegTechniqueID`, `LegTo`, `LegDiagramDirection`, `LegTool`, `Facing`, `ArmLR`, `ArmSection`, `ArmTechniqueID`, `ArmTo`, `ArmDiagramDirection`, `ArmTool`, `IsArmToolTwin`, `Note`) VALUES
(1100, 0, NULL, 0, NULL, NULL, '12:00', 'D', NULL, 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1100, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'S', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 4, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 4, 'b', 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1100, 5, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 7, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 8, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 8, 'b', 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1100, 9, NULL, 1, NULL, 3034, NULL, NULL, 'R;L', 'R', NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 10, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 11, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 12, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 12, 'b', 1, NULL, 3033, NULL, NULL, 'L+R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1100, 13, NULL, 1, NULL, 3034, NULL, NULL, 'R;L', 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 14, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 15, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 16, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 16, 'b', 1, NULL, 3033, NULL, NULL, 'L+R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1100, 17, NULL, 1, NULL, 3035, NULL, NULL, 'L;R', 'R', NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 18, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 19, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 20, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 20, 'b', 1, NULL, 3019, NULL, NULL, 'L+R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1100, 21, NULL, 1, NULL, 3035, NULL, NULL, 'L;R', 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 22, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 23, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 24, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 24, 'b', 1, NULL, 3019, NULL, NULL, 'L+R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1100, 25, NULL, 1, NULL, 3023, NULL, NULL, 'L+R', 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 26, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 27, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10152, NULL, NULL, NULL, 'RS', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 28, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'R', NULL, 10151, NULL, NULL, NULL, 'S', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1100, 28, 'b', 1, NULL, 3033, NULL, NULL, 'L+R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL);


-- Sparring Patterns:
INSERT INTO `PatternCount` (`PatternID`, `Count`, `CountOrder`, `Counted`, `MotionID`, `BodyMovementID`, `EyesTo`, `EyesDiagramDirection`, `FeetInMotion`, `LegLR`, `LegSection`, `LegTechniqueID`, `LegTo`, `LegDiagramDirection`, `LegTool`, `Facing`, `ArmLR`, `ArmSection`, `ArmTechniqueID`, `ArmTo`, `ArmDiagramDirection`, `ArmTool`, `IsArmToolTwin`, `Note`) VALUES
(1101, 0, NULL, 0, NULL, NULL, '12:00', 'D', NULL, 'L', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1101, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'S', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 4, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 4, 'b', 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1101, 5, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 7, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 8, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 8, 'b', 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1101, 9, NULL, 1, NULL, 3034, NULL, NULL, 'L;R', 'L', NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 10, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 11, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 12, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 12, 'b', 1, NULL, 3033, NULL, NULL, 'L+R', 'L', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1101, 13, NULL, 1, NULL, 3034, NULL, NULL, 'L;R', 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 14, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 15, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 16, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 16, 'b', 1, NULL, 3033, NULL, NULL, 'L+R', 'L', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1101, 17, NULL, 1, NULL, 3035, NULL, NULL, 'R;L', 'L', NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 18, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 19, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 20, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 20, 'b', 1, NULL, 3019, NULL, NULL, 'L+R', 'L', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1101, 21, NULL, 1, NULL, 3035, NULL, NULL, 'R;L', 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 22, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 23, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 24, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 24, 'b', 1, NULL, 3019, NULL, NULL, 'L+R', 'L', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1101, 25, NULL, 1, NULL, 3023, NULL, NULL, 'L+R', 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 26, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'High', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 27, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10152, NULL, NULL, NULL, 'RS', 'L', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 28, 'a', 1, NULL, NULL, NULL, NULL, NULL, 'L', NULL, 10151, NULL, NULL, NULL, 'S', 'R', 'Mid', 10200, NULL, NULL, NULL, 0, NULL),
(1101, 28, 'b', 1, NULL, 3033, NULL, NULL, 'L+R', 'L', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL);


-- Sparring Patterns:
INSERT INTO `PatternCount` (`PatternID`, `Count`, `CountOrder`, `Counted`, `MotionID`, `BodyMovementID`, `EyesTo`, `EyesDiagramDirection`, `FeetInMotion`, `LegLR`, `LegSection`, `LegTechniqueID`, `LegTo`, `LegDiagramDirection`, `LegTool`, `Facing`, `ArmLR`, `ArmSection`, `ArmTechniqueID`, `ArmTo`, `ArmDiagramDirection`, `ArmTool`, `IsArmToolTwin`, `Note`) VALUES
(1102, 0, NULL, 0, NULL, NULL, '12:00', 'D', NULL, 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 1, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 1, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 2, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 2, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 3, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 3, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 4, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 4, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 5, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 5, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 6, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 6, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 7, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 7, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 8, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 8, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),

(1102, 9, 'a', 1, NULL, 3034, NULL, NULL, 'R;L', 'L', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 9, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 10, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 10, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 11, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 11, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 12, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 12, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 12, 'c', 1, NULL, 3033, NULL, NULL, 'L+R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 13, 'a', 1, NULL, 3034, NULL, NULL, 'R;L;R', 'R', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 13, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 14, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 14, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 15, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 15, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 16, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 16, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 16, 'c', 1, NULL, 3033, NULL, NULL, 'L+R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),

(1102, 17, 'a', 1, NULL, 3022, NULL, NULL, 'L;R+L', 'L', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 17, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 18, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 18, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 19, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 19, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 20, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 20, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 20, 'c', 1, NULL, 3033, NULL, NULL, 'L+R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 21, 'a', 1, NULL, 3022, NULL, NULL, 'R;R+L', 'R', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 21, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 22, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 22, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 23, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 23, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 24, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 24, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 24, 'c', 1, NULL, 3033, NULL, NULL, 'L+R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),

(1102, 25, 'a', 1, NULL, 3019, NULL, NULL, 'R+L', 'L', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 25, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 26, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 26, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 27, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 27, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 28, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 28, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 28, 'c', 1, NULL, 3033, NULL, NULL, 'L+R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 29, 'a', 1, NULL, 3019, NULL, NULL, 'R+L', 'R', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 29, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 30, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 30, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 31, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 31, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 32, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 32, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 32, 'c', 1, NULL, 3033, NULL, NULL, 'L+R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),

(1102, 33, 'a', 1, NULL, 3023, NULL, NULL, 'R;R+L', 'R', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 33, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 34, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Mid', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 34, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 35, 'a', 1, NULL, NULL, NULL, NULL, 'R', 'R', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 35, 'b', 1, NULL, 3003, NULL, NULL, 'R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 36, 'a', 1, NULL, NULL, NULL, NULL, 'L', 'L', 'Low', 10300, NULL, NULL, NULL, 'H', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1102, 36, 'b', 1, NULL, NULL, NULL, NULL, 'L', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL),
(1102, 36, 'c', 1, NULL, 3033, NULL, NULL, 'L+R', 'R', NULL, 10151, NULL, NULL, NULL, 'H', NULL, 'Mid', 10403, NULL, NULL, NULL, 0, NULL);

-- http://www.youtube.com/watch?v=F66u7gvZuTk

/*
1030, 26, 'Bring the left foot to the side of the right foot to form a close stance toward C

1029, 24, 'Bring the ball of the right foot to the side of the left foot
1029, 11, 'Bring the ball of the right foot to the side of the left foot
1029, 6, 'Bring the right foot to the side of the left foot
1029, 5, 'Bring the ball of the left foot to the side of the right foot
1029, 2, 'Bring the ball of the left foot to the side of the right foot

1028, 66, 'Move the ball of the left foot to the side rear of the right foot
1028, 60, 'Move the ball of the right foot to the side rear of the left foot

1027, 60, 'Move the right foot to the side rear of the left foot
1027, 55, 'Move the ball of the right foot to the side rear of the left foot
1027, 10, 'Lower the left foot to the side of the right foot

1026, 34, 'Move the ball of the left foot to the side rear of the right foot
1026, 19, 'Bring the left foot to the side of the right foot to form a (full facing) close ready
1026, 10, 'Bring the left foot to the side of the right foot

1024, 29, 'Move the ball of the left foot to the side front of the right foot
1024, 23, 'Move the ball of the right foot to the side rear of the left foot
1024, 17, 'Execute a middle turning kick to AC with the ball of the left foot, while holding both side fists up and toward AC. Then, lower the ball of the left foot to the side front of the right foot.
1024, 12, 'Execute a middle turning kick to AD with the ball of the right foot, while holding both side fists up and toward AD. Then, lower the ball of the right foot to the side front of the left foot.

1023, 68, 'Bring the ball of the left foot to the side of the right foot
1023, 67, 'Bring the right foot to the side of the left foot
1023, 50, 'Bring the ball of the left foot to the side of the right foot
1023, 48, 'Bring the right foot to the side of the left foot to form a close stance toward C
1023, 45, 'Bring the left foot to the side of the right foot to form a close stance toward C
1023, 43, 'Bring the left foot to the side of the right foot
1023, 42, 'Bring the right foot to the side of the left foot
1023, 40, 'Bring the right foot to the side of the left foot to form a close ready stance type C
1023, 12, 'Bring the ball of the left foot to the side of the right foot

1022, 19, 'Lower the ball of the right foot to the side of the left foot




1021, 39, 'Bring the ball of the right foot to the side of the left foot facing D
1021, 38, 'Bring the ball of the left foot to the side of theright foot facing D
1021, 36, 'Bring the ball of the right foot to the side of the left foot facing D
1021, 28, 'Move the ball of the left foot to the side rear of the right foot

1020, 37, 'Move the ball of the right foot to the side front of the left foot
1020, 35, 'Move the ball of the right foot to the side rear of the left foot
1020, 33, 'Move the ball of the left foot to the side rear of the right foot
* 1020, 26, 'Bring the right foot to the side of the left foot to form a close stance with a heaven hand toward D

* 1019, 48, 'Bring the right foot to the side of the left foot to form a close stance toward C
* 1019, 3, 'Bring the right foot to the side of the left foot to form a close stance toward D

1018, 41, 'Move the ball of the left foot to the side rear of the right foot

* 1016, 33, 'Bring the right foot to the side of the left foot to form a close stance toward D
* 1016, 15, 'Bring the left foot to the side of the right foot to form a close stance toward D

1015, 38, 'Lower the ball of the left foot to the side front of the right foot
1015, 34, 'Lower the ball of the right foot to the side front of the left foot
* 1015, 20, 'Pull the right foot to the side of the left foot to form a close stance toward C
* 1015, 16, 'Pull the left foot to the side of the right foot to form a close stance toward C
* 1015, 12, 'Move the left foot to the side of the right foot to form a close stance toward C
1015, 10, 'Move the ball of the left foot to the side front of the right foot
1015, 6, 'Move the ball of the right foot to the side front of the left foot
1015, 4, 'Move the ball of the left foot to the side front of the right foot
* 1015, 1, 'Move the left foot to the side of the right foot (at the same time bringing both hands around in a circular motion) to form a close ready stance type B
** 1015, 10, 'Move the left foot to the side front of the right foot and then turn counter-clockwise
** 1015, 6, 'Move the right foot to the side of the left foot and then move the left foot to D
** 1015, 4, 'Move the left foot to the side front of the right foot, and then move the right foot to D


1014, 18, 'Lower the ball of the left foot to the side of the right foot
1014, 14, 'Execute a high turning kick to DF with the ball of the right foot, while holding both side fists up and toward DF. Then, lower the ball of the right foot to the side of the left foot with the right foot facing F. Perform moves 14 and 15 in a fast motion.
1014, 13, 'Lower the ball of the right foot to the side of the left foot.

1013, 29, 'Bring the ball of the left foot to the side of the right foot facing D
* 1013, 26, 'Pivoting on the ball of the right foot and turning counterclockwise, bring the left foot to the side of the right foot to form a close stance toward B

1010, 33, 'Bring the ball of the left foot to the side of the right foot facing D
1010, 22, 'Lower the ball of the right foot to the side front of the left foot
1010, 19, 'Bring the ball of the right foot to the side of the left foot facing D
* 1010, 12, 'Bring the left foot to the side of the right foot to form a close stance toward F
* 1010, 6, 'Bring the right foot to the side of the left foot to form a close stance toward D
* 1010, 3, 'Bring the left foot to the side of the right foot to form a close stance toward D

1009, 32, 'Bring the ball of the right foot to the side of the left foot facing D
* 1009, 30, 'Pivoting on the ball of the right foot, bring the left foot to the side of the right foot to form a close stance toward A
1009, 20, 'Bring the ball of the right foot to the side of the left foot facing C
1009, 17, 'Bring the ball of the left foot to the side of the right foot facing C

1008, 38, 'Bring the ball of the right foot to the side of the left foot facing D

1007, 28, 'Bring the ball of the left foot to the side of the right foot facing D
* 1007, 19, 'Bring the right foot to the side of the left foot facing C with the right arm extended to F
1007, 16, 'Bring the ball of the left foot to the side of the right foot facing C
1007, 7, 'Bring the ball of the right foot to the side rear of the left foot facing D
1007, 4, 'Bring the ball of the left foot to the side of the right foot facing D

*/

-- --------------------------------------------------------

--
-- Constraints for dumped tables
--
--
-- Constraints for table `EncyclopediaCount`
--
ALTER TABLE `EncyclopediaCount`
  ADD CONSTRAINT `EncyclopediaCount_ibfk_1` FOREIGN KEY (`EncyclopediaID`) REFERENCES `encyclopedias` (`ID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `EncyclopediaCount_ibfk_2` FOREIGN KEY (`PatternID`) REFERENCES `patterns` (`ID`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `Classes`
--
ALTER TABLE `Classes`
  ADD CONSTRAINT `Classes_ibfk_1` FOREIGN KEY (`InstructorID`) REFERENCES `instructors` (`ID`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `PatternCount`
--
ALTER TABLE `PatternCount`
  ADD CONSTRAINT `PatternCount_ibfk_1` FOREIGN KEY (`MotionID`) REFERENCES `motions` (`ID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `PatternCount_ibfk_2` FOREIGN KEY (`BodyMovementID`) REFERENCES `movements` (`ID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `PatternCount_ibfk_3` FOREIGN KEY (`LegTechniqueID`) REFERENCES `techniques` (`ID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `PatternCount_ibfk_4` FOREIGN KEY (`ArmTechniqueID`) REFERENCES `techniques` (`ID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `PatternCount_ibfk_5` FOREIGN KEY (`PatternID`) REFERENCES `patterns` (`ID`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `TechniqueLinesOfAttack`
--
ALTER TABLE `TechniqueLinesOfAttack`
  ADD CONSTRAINT `TechniqueLinesOfAttack_ibfk_1` FOREIGN KEY (`TechniqueID`) REFERENCES `Techniques` (`ID`) ON DELETE SET NULL ON UPDATE NO ACTION;




-- --------------------------------------------------------

/*
CREATE FUNCTION LineOfAttack(TechniqueID AS int(11), Tool AS VARCHAR(50), IsArmToolTwin AS tinyint(1)) RETURNS VARCHAR(10)
BEGIN
	SELECT `LineOfAttack`
		INTO @ReturnVal
		FROM `TechniqueLinesOfAttack` TLOA
		WHERE TLOA.TechniqueID = TechniqueID
			AND TLOA.Tool = Tool
			AND (TOLA.IsArmToolTwin = IsArmToolTwin OR (
				IsArmToolTwin IS NULL AND TOLA.IsArmToolTwin = 0
			))
	;

	IFNULL(@ReturnVal,
		SELECT `LineOfAttack`
			INTO @ReturnVal
			FROM `Techniques` T
			WHERE T.TechniqueID = TechniqueID
	)

	RETURN ReturnVal;
END;
*/


CREATE OR REPLACE VIEW viewPatternCountsLegInEffect AS
	SELECT
		PC.PatternId,
		PC.Count,
		PC.CountOrder,
		(
			SELECT LegTechniqueID
			FROM `PatternCount` Tech
			WHERE
				Tech.PatternID = PC.PatternID
				AND Tech.Count <= PC.Count
				AND Tech.LegTechniqueID IS NOT NULL
			ORDER BY Tech.Count DESC, Tech.CountOrder DESC
			Limit 1
		) AS LegTechniqueIDInEffect,
		(
			SELECT LegLR
			FROM `PatternCount` Tech
			WHERE
				Tech.PatternID = PC.PatternID
				AND Tech.Count <= PC.Count
				AND Tech.LegTechniqueID IS NOT NULL
			ORDER BY Tech.Count DESC, Tech.CountOrder DESC
			Limit 1
		) AS LegLRInEffect
	FROM `PatternCount` PC
;


CREATE OR REPLACE VIEW viewPatternCountsToFacing AS
	SELECT
		PC.PatternID,
		PC.Count,
		PC.CountOrder,
		IF(PC.PatternID IS NULL, 0, 1) AS IsToFacing
	FROM `PatternCount` PC
	LEFT JOIN `viewPatternCountsLegInEffect` InEffect ON
		InEffect.PatternID = PC.PatternID
		AND InEffect.Count = PC.Count
		AND (
			InEffect.CountOrder = PC.CountOrder
			OR (
				InEffect.CountOrder IS NULL
				OR PC.CountOrder IS NULL
			)
		)
	LEFT OUTER JOIN `Techniques` Arm ON
		PC.`ArmTechniqueID` = Arm.ID
	LEFT OUTER JOIN `Techniques` Leg ON
		PC.`LegTechniqueID` = Leg.ID
	WHERE
		Arm.Type IN ('Attack', 'Block')
		AND Arm.ID NOT IN (10232, 10412, 10413) -- U-Shape Punch, U-Shape Block, U-Shape Grasp, Side Thrust(10203)?, Side Back Strike(10207)?
		AND (
			(
				InEffect.`LegTechniqueIDInEffect` IN (10102, 10103, 10104) -- Rear Foot, Vertical, L-Stance
				AND (
					InEffect.LegLRInEffect = PC.ArmLR
					OR (
						PC.IsArmToolTwin = 1
						OR PC.ArmTool IN ('X-Fist','X-Knife-Hand','Alternate Palm','X-Palm')
					)
				)
			)
			OR (
				InEffect.`LegTechniqueIDInEffect` IN (10105) -- Fixed Stance
				AND (
					(PC.ArmLR IS NOT NULL AND InEffect.LegLRInEffect != PC.ArmLR)
					OR (
						PC.IsArmToolTwin = 1
						OR PC.ArmTool IN ('X-Fist','X-Knife-Hand','Alternate Palm','X-Palm')
					)
				)
			)
		)
	ORDER BY    
		PC.PatternID,
		PC.Count,
		PC.CountOrder
;


CREATE VIEW viewPattern AS
	SELECT
--		CONCAT(M.`Name`, COALESCE(CONCAT(' [', M.`ShortDescription`, ']'))) AS `Motion`, Mo.`Name` AS `BodyMovement`,
		M.`Name` AS `Motion`, Mo.`Name` AS `BodyMovement`,
		TLeg.`OfficialName` AS `LegTechniqueOfficial`, TLeg.`Type` AS `LegTechniqueType`, TLeg.`IsSectionInferred` AS `LegSectionInferred`, -- TLeg.`LineOfAttack` AS `LegLineOfAttack`,
		TArm.`OfficialName` AS `ArmTechniqueOfficial`, TArm.`Type` AS `ArmTechniqueType`, TArm.`IsSectionInferred` AS `ArmSectionInferred`, -- TArm.`LineOfAttack` AS `ArmLineOfAttack`,
		TOrg.`OfficialName` AS `OriginalTechniqueOfficial`, TOrg.`Appendage` AS `OriginalTechniqueAppendage`,
		IFNULL(TLOALeg.`LineOfAttack`, TLeg.`LineOfAttack`) AS `LegLineOfAttack`,
		IFNULL(TLOAArm.`LineOfAttack`, TArm.`LineOfAttack`) AS `ArmLineOfAttack`,
		-- LegInEffect.LegTechniqueIDInEffect,
		-- LegInEffect.LegLRInEffect,
		ToFacing.IsToFacing,
		PC.*,
		EC.`Text` AS Encyclopedia, ECL.`Text` AS Littleton

	FROM `PatternCount` PC
		LEFT JOIN `Motions` M ON
			M.ID = PC.MotionID
		LEFT JOIN `Movements` Mo ON
			Mo.ID = PC.BodyMovementID

		LEFT JOIN `Techniques` TLeg ON
			TLeg.ID = PC.LegTechniqueID
		LEFT JOIN `Techniques` TArm ON
			TArm.ID = PC.ArmTechniqueID
		LEFT JOIN `Techniques` TOrg ON
			TOrg.ID = PC.OriginalTechniqueID

		-- LEFT JOIN `viewPatternCountsLegInEffect` LegInEffect ON
		--	LegInEffect.PatternID = PC.PatternID
		--	AND LegInEffect.Count = PC.Count
		--	AND (
		--		LegInEffect.CountOrder = PC.CountOrder
		--		OR (LegInEffect.CountOrder IS NULL AND PC.CountOrder IS NULL)
		--	)
		LEFT JOIN `viewPatternCountsToFacing` ToFacing ON
			ToFacing.PatternID = PC.PatternID
			AND ToFacing.Count = PC.Count
			AND (
				ToFacing.CountOrder = PC.CountOrder
				OR (ToFacing.CountOrder IS NULL AND PC.CountOrder IS NULL)
			)
						
		LEFT JOIN `EncyclopediaCount` EC ON
			(EC.PatternID = PC.PatternID AND EC.`Count` = PC.`Count` AND EC.EncyclopediaID = 5 AND (PC.`CountOrder` IS NULL OR PC.`CountOrder` = 'a'))
		LEFT JOIN `EncyclopediaCount` ECL ON
			(ECL.PatternID = PC.PatternID AND ECL.`Count` = PC.`Count` AND ECL.EncyclopediaID = 2 AND (PC.`CountOrder` IS NULL OR PC.`CountOrder` = 'a'))

		LEFT JOIN `TechniqueLinesOfAttack` TLOALeg ON
			(TLOALeg.`TechniqueID` = PC.`LegTechniqueID` AND TLOALeg.`Tool` = PC.`LegTool`)
		LEFT JOIN `TechniqueLinesOfAttack` TLOAArm ON
			(TLOAArm.`TechniqueID` = PC.`ArmTechniqueID` AND TLOAArm.Tool = PC.LegTool AND TLOAArm.`IsArmToolTwin` = PC.`IsArmToolTwin`)

	ORDER BY PatternID, Count, CountOrder
;


CREATE OR REPLACE VIEW viewPatternTechniques AS
	(
		SELECT DISTINCT
			CONCAT('m', PC.MotionID) AS 'TechniqueID',
			PC.PatternID,
			'Motion' AS Kind,
			P.SortOrder,
			CONCAT(M.`Name`, COALESCE(CONCAT(' [', M.`ShortDescription`, ']'))) AS Description,
			NULL AS Tool,
			NULL AS Section,
			NULL AS IsArmToolTwin,
			FALSE AS IsAction
		FROM PatternCount PC
		INNER JOIN Patterns P ON PC.PatternID = P.ID
		LEFT JOIN `Motions` M ON M.ID = PC.MotionID
		WHERE PC.MotionID IS NOT NULL
	)
	UNION
	(
		SELECT DISTINCT
			CONCAT('b', PC.BodyMovementId) AS 'TechniqueID',
			PC.PatternID,
			'Body' AS Kind,
			P.SortOrder,
			Mo.`Name` AS Description,
			NULL AS Tool,
			NULL AS Section,
			NULL AS IsArmToolTwin,
			FALSE AS IsAction
		FROM PatternCount PC
		INNER JOIN Patterns P ON PC.PatternID = P.ID
		LEFT JOIN `Movements` Mo ON Mo.ID = PC.BodyMovementID
		WHERE PC.BodyMovementId IS NOT NULL
	)
	UNION
	(
		SELECT DISTINCT
			PC.LegTechniqueID AS 'TechniqueID',
			PC.PatternID,
			'Leg' AS Kind,
			P.SortOrder,
			TLeg.`OfficialName` AS Description,
			PC.LegTool AS Tool,
			PC.LegSection AS Section,
			NULL AS IsArmToolTwin,
			IF(TLeg.Type = 'Action', TRUE, FALSE) AS IsAction
		FROM PatternCount PC
		INNER JOIN Patterns P ON PC.PatternID = P.ID
		LEFT JOIN `Techniques` TLeg ON TLeg.ID = PC.LegTechniqueID
		WHERE PC.LegTechniqueId IS NOT NULL
	)
	UNION
	(
		SELECT DISTINCT
			PC.ArmTechniqueId AS 'TechniqueID',
			PC.PatternID,
			'Arm' AS Kind,
			P.SortOrder,
			TArm.`OfficialName` AS Description,
			PC.ArmTool AS Tool,
			PC.ArmSection AS Section,
			IsArmToolTwin,
			IF(TArm.Type = 'Action', TRUE, FALSE) AS IsAction
		FROM PatternCount PC
		INNER JOIN Patterns P ON PC.PatternID = P.ID
		LEFT JOIN `Techniques` TArm ON TArm.ID = PC.ArmTechniqueID
		WHERE PC.ArmTechniqueId IS NOT NULL
	)
	ORDER BY SortOrder, Kind
;


/*
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewpattern` AS select concat(`M`.`Name`,' [',`M`.`ShortDescription`,']') AS `Motion`,`Mo`.`Name` AS `BodyMovement`,`TLeg`.`OfficialName` AS `LegTechnique`,`TLeg`.`Type` AS `LegTechniqueType`,`TLeg`.`IsSectionInferred` AS `LegSectionInferred`,`TArm`.`OfficialName` AS `ArmTechnique`,`TArm`.`Type` AS `ArmTechniqueType`,`TArm`.`IsSectionInferred` AS `ArmSectionInferred`,`PC`.`ID` AS `ID`,`PC`.`PatternID` AS `PatternID`,`PC`.`Count` AS `Count`,`PC`.`CountOrder` AS `CountOrder`,`PC`.`Counted` AS `Counted`,`PC`.`MotionID` AS `MotionID`,`PC`.`BodyMovementID` AS `BodyMovementID`,`PC`.`EyesTo` AS `EyesTo`,`PC`.`EyesDiagramDirection` AS `EyesDiagramDirection`,`PC`.`FeetInMotion` AS `FeetInMotion`,`PC`.`LegLR` AS `LegLR`,`PC`.`LegSection` AS `LegSection`,`PC`.`LegTechniqueID` AS `LegTechniqueID`,`PC`.`LegTo` AS `LegTo`,`PC`.`LegDiagramDirection` AS `LegDiagramDirection`,`PC`.`LegTool` AS `LegTool`,`PC`.`Facing` AS `Facing`,`PC`.`ArmLR` AS `ArmLR`,`PC`.`ArmSection` AS `ArmSection`,`PC`.`ArmTechniqueID` AS `ArmTechniqueID`,`PC`.`ArmTo` AS `ArmTo`,`PC`.`ArmDiagramDirection` AS `ArmDiagramDirection`,`PC`.`ArmTool` AS `ArmTool`,`PC`.`IsArmToolTwin` AS `IsArmToolTwin`,`PC`.`Note` AS `Note`,`EC`.`Text` AS `Encyclopedia`,`ECL`.`Text` AS `Littleton` from ((((((`PatternCount` `PC` left join `motions` `M` on((`M`.`ID` = `PC`.`MotionID`))) left join `movements` `Mo` on((`Mo`.`ID` = `PC`.`BodyMovementID`))) left join `techniques` `TLeg` on((`TLeg`.`ID` = `PC`.`LegTechniqueID`))) left join `techniques` `TArm` on((`TArm`.`ID` = `PC`.`ArmTechniqueID`))) left join `encyclopediacount` `EC` on(((`EC`.`PatternID` = `PC`.`PatternID`) and (`EC`.`Count` = `PC`.`Count`) and (`EC`.`EncyclopediaID` = 5) and (isnull(`PC`.`CountOrder`) or (`PC`.`CountOrder` = 'a'))))) left join `encyclopediacount` `ECL` on(((`ECL`.`PatternID` = `PC`.`PatternID`) and (`ECL`.`Count` = `PC`.`Count`) and (`ECL`.`EncyclopediaID` = 2) and (isnull(`PC`.`CountOrder`) or (`PC`.`CountOrder` = 'a'))))) order by `PC`.`PatternID`,`PC`.`Count`,`PC`.`CountOrder`;
COMMIT;
*/

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


/*
-- deli miter //

-- CREATE FUNCTION `fnViewRowNumber`() RETURNS int
--    NO SQL
--    NOT DETERMINISTIC
--     begin
--	  IF @view_row_number IS NULL THEN SET @view_row_number = 0;
--      END IF;
--      SET @view_row_number := @view_row_number + 1;
--      return @view_row_number;
--     end
--     //

-- delim iter ;
*/


CREATE OR REPLACE VIEW viewPatternTechniqueCounts AS
	SELECT
		TechniqueID,
		-- PC.PatternID,
		PatternID,
		Kind,
		SortOrder,
		-- CONCAT(Description, COALESCE(CONCAT(' [', Tool, ']'), '')) AS Description,
		Section,
		Tool,
		Description,
		`IsArmToolTwin`,
		IsAction,
		-- PC.`Count`,
		-- PC.CountOrder,
		(
			SELECT COUNT(*)
			FROM viewPatternTechniques SUB
			WHERE SUB.TechniqueID = VPT.TechniqueID
				AND SUB.SortOrder < VPT.SortOrder
		) AS PreviousUseCount,
		(
			SELECT COUNT(*)
			FROM viewPatternTechniques SUB
			WHERE SUB.TechniqueID = VPT.TechniqueID
				AND SUB.SortOrder < VPT.SortOrder
				AND SUB.Tool = VPT.Tool
		) AS PreviousToolUseCount,
		(
			SELECT COUNT(*)
			FROM viewPatternTechniques SUB
			WHERE SUB.TechniqueID = VPT.TechniqueID
				AND SUB.SortOrder < VPT.SortOrder
				AND SUB.Section = VPT.Section
		) AS PreviousSectionUseCount,
		(
			SELECT COUNT(*)
			FROM viewPatternTechniques SUB
			WHERE SUB.TechniqueID = VPT.TechniqueID
				AND SUB.SortOrder < VPT.SortOrder
				AND SUB.Tool = VPT.Tool
				AND SUB.Section = VPT.Section
		) AS PreviousUseCountAll
	FROM viewPatternTechniques VPT
	ORDER BY SortOrder, Kind, PreviousUseCountAll, PreviousToolUseCount, PreviousSectionUseCount, PreviousUseCount
	-- , `Count`, CountOrder
;


CREATE OR REPLACE VIEW viewStances AS
	SELECT
		T.OfficialName AS `OfficialName`,
		T2.OfficialName AS `ParentOfficialName`,
		T.KoreanName AS `KoreanName`,
		S.*,
		T.IsFullFacing AS IsFullFacing,
		T.IsSideFacing AS IsSideFacing,
		T.IsHalfFacing AS IsHalfFacing,
		T.IsReverseHalfFacing AS IsReverseHalfFacing,
		T.IsReverseSideFacing AS IsReverseSideFacing
	FROM `Stances` S
		LEFT JOIN `Techniques` T ON
			T.ID = S.TechniqueID
		LEFT JOIN `Techniques` T2 ON
			T2.ID = S.ParentTechniqueID
	ORDER BY S.`SortOrder`
;





