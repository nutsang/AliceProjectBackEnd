-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2023 at 11:02 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alice_database_mobile`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` bigint(255) NOT NULL,
  `uid` text NOT NULL,
  `role_account` int(6) NOT NULL,
  `username` text NOT NULL,
  `email` text NOT NULL,
  `login_count` int(1) NOT NULL,
  `lock_account` int(1) NOT NULL,
  `ban_account` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=tis620 COLLATE=tis620_thai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `episode`
--

CREATE TABLE `episode` (
  `id` bigint(255) NOT NULL,
  `jwp_id` text NOT NULL,
  `media_id` bigint(255) NOT NULL,
  `episode_at` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620 COLLATE=tis620_thai_ci;

--
-- Dumping data for table `episode`
--

INSERT INTO `episode` (`id`, `jwp_id`, `media_id`, `episode_at`) VALUES
(1, 'udLjsK0X', 1, 1),
(2, 'o3un9Jx6', 1, 2),
(3, 'q16VNvnv', 1, 3),
(4, 'ci5iAUza', 1, 4),
(5, 'wGvxu6v1', 1, 5),
(6, 'iSiLRhwx', 1, 6),
(7, 'cU32g1pM', 1, 7),
(8, 'neynGxD9', 1, 8),
(9, 'KMYSw3d5', 1, 9),
(10, 'izvv255g', 1, 10),
(11, 'CHQoJLF8', 1, 11),
(12, 'FPddepCs', 1, 12),
(13, 'ho7XYmG7', 1, 13),
(14, 'njYzGmB2', 1, 14),
(15, 'sGvUpTQA', 1, 15),
(16, '3tU08plF', 1, 16),
(17, 'sA18Cfxy', 1, 17),
(18, 'AqAvhyB5', 1, 18),
(19, '0EAwZLNl', 1, 19),
(20, 'Iqw3ZHEi', 1, 20),
(21, 'TDmWP1Nr', 1, 21),
(22, '2MworNt5', 1, 22),
(23, 'HFIIIgTr', 1, 23),
(24, 'EWruyD1S', 1, 24),
(25, 'h7xjGl1I', 2, 1),
(26, 'TqhDPze0', 2, 2),
(27, 'Z0Tl5Jez', 2, 3),
(28, 'tSomsONi', 2, 4),
(29, '8abGo0Dy', 2, 5),
(30, 'ln9hDezz', 2, 6),
(31, 'j2GyjQUC', 2, 7),
(32, 'rbw3nN9O', 2, 8),
(33, '9zSETz0r', 2, 8),
(34, '80LDl5vN', 2, 10),
(35, 'H44LCBH7', 2, 11),
(36, 'PWu5Dr5C', 2, 12),
(37, 'GsiE8Yup', 2, 13),
(38, '64K7EC1U', 2, 14),
(39, 'wo8fZKM9', 2, 15),
(40, 'HlTNdcMQ', 2, 16),
(41, 'WUddYYKN', 2, 17),
(42, 'mgXWlmVL', 2, 18),
(43, 'XIRNePb6', 2, 19),
(44, 'QhM8OE0G', 2, 20),
(45, 'QNMhrhiV', 2, 21),
(46, 'KP7qsX4H', 2, 22),
(47, 'wd9GWNTg', 2, 23),
(48, 'bUyFgFF3', 2, 24),
(51, '6YJwNa3U', 3, 1),
(52, 'PtrdFW3y', 3, 2),
(53, 'GPaSpmss', 3, 3),
(54, 'sImXPh8q', 3, 4),
(55, 'zrLEKIjz', 3, 5),
(56, 'otWnnZGE', 3, 6),
(57, 'Iqgss7P6\r\n', 3, 7),
(58, 'JXmHwPZw\r\n', 3, 8),
(59, 'ShOJldnw', 3, 9),
(60, 'rQKUZi85', 3, 10),
(61, 'PrpTlZ3u', 3, 11),
(62, 'aHYGZHNn', 3, 12),
(63, 'gE8sPJvn', 4, 1),
(64, '6imXDZFI', 4, 2),
(65, '1s3FcrDD', 4, 3),
(66, 'WAB0Fd3e', 4, 4),
(67, 'R1JyX6Sl', 4, 5),
(68, '8qxZ58b6', 4, 6),
(69, 'z5yzcpx4', 4, 7),
(70, 'toWcang1', 4, 8),
(71, 'oMTyh1K0', 4, 9),
(72, 'otPUEsRd', 4, 10),
(73, 'mR5g04Jh', 4, 11),
(74, 'SQvBDf3q', 4, 12),
(75, 'a88WV3o2', 5, 1),
(76, 'R0vTJasH', 5, 2),
(77, 'TRb6K34G', 5, 3),
(78, 'QDNxnlD9', 5, 4),
(79, 'IF78DR4e', 5, 5),
(80, 'k5dpUiDd', 5, 6),
(81, 'dG5eznIg', 5, 7),
(82, 'cjzF9Jq6', 5, 8),
(83, 'xJAfqlXK', 5, 9),
(84, 'tdrsCNdX', 5, 10),
(85, 'cdv0OeN7', 5, 11),
(86, 'xh5g7ZQI', 5, 12),
(87, 'qLIMPeCZ', 6, 1),
(88, 'Ku1hpFSC', 6, 2),
(89, 'AKvBHGRS', 6, 3),
(90, 'YvbZuQFm', 6, 4),
(91, '66naWaGy', 6, 5),
(92, 'r6GAon8w', 6, 6),
(93, 'gdV0c9sh', 6, 7),
(94, 'qEouq4eB', 6, 8),
(95, 'BITkR46q', 6, 9),
(96, 'KYUvbmq7', 6, 10),
(97, 'sF9lpuZV', 6, 11),
(98, 'aM83yJO5', 6, 12),
(99, 'qxOVlg65', 7, 1),
(100, 'WUMC90Iu', 7, 2),
(101, 'KFjIlxgz', 7, 3),
(102, 'T94Kwcb2', 7, 4),
(103, 'MXhOrYvb', 7, 5),
(104, 'si0ybeSr', 7, 6),
(105, 'bNEW8KDE', 7, 7),
(106, 'kDf3WAZz', 7, 8),
(107, 'aaNVt52K', 7, 9),
(108, 'blDP3m9x', 7, 10),
(109, 'o2H2UDY7', 7, 11),
(110, 'qMV3KgCA', 7, 12),
(111, 'ggueqKQ1', 7, 13),
(112, '6NSeLpi5', 7, 14),
(113, '8xadT1Yq', 7, 15),
(114, 'i5dQYcut', 7, 16),
(115, 'f2QNfvys', 7, 17),
(116, '9fq0R7Oc', 7, 18),
(117, 'Mdlwxfbs', 7, 19),
(118, 'LaKke8tT', 7, 20),
(119, 'icPp6V4W', 7, 21),
(120, 'LJZkmfFa', 7, 22),
(121, 'fXUsnANB', 7, 23),
(122, 'ppHURS4o', 7, 24),
(123, '7H0Cmw3L', 7, 25),
(124, '2EUzP6Dp', 7, 27),
(125, 'wnzTw4Sr', 8, 1),
(126, 'uFyatl1V', 8, 2),
(127, '2XXe5YdP', 8, 3),
(128, 'aoyEgHAs', 8, 4),
(129, 'UvpQVdr9', 8, 5),
(130, 'EszDSAZ3', 8, 6),
(131, 'KGMWaxnG', 8, 7),
(132, 'kyJkxFAn', 8, 8),
(133, 'ghnIOKrt', 8, 9),
(134, '0jqTXkFZ', 8, 10),
(135, 'df6lzsnm', 8, 11),
(136, 'SjZEfcmg', 8, 12),
(137, 'dpKCL7A8', 8, 13),
(138, 'hwICRk3I', 8, 14),
(139, '4sZwzOhm', 8, 15),
(140, 'tuOYucOC', 8, 15),
(141, 'hMWOEkGp', 8, 16),
(142, 'viMrsqnz', 8, 17),
(143, 'rZeQgkl0', 8, 18),
(144, 'Y8m2uOC0', 8, 19),
(145, 'g3lr0Hyj', 8, 20),
(146, '9nlM04yA', 8, 21),
(147, 'bGZfCYya', 8, 22),
(148, 'YAnpCQDD', 8, 23),
(149, 'oupRICJE', 8, 24),
(150, 'df3E9M1W', 9, 1),
(151, 'kJwxSh2B', 10, 1),
(152, 'YC9qjdQF', 10, 2),
(153, 'DSAHrV4k', 10, 3),
(154, 'vHgrQ0U9', 10, 4),
(155, 'OomxBuSh', 10, 5),
(156, 'LKxyPZqT', 10, 6),
(157, '4KPfFTjL', 10, 7),
(158, 'iwNKTvcP', 10, 8),
(159, 'yUcJEFNX', 10, 9),
(160, '2TbOMnkb', 10, 10),
(161, '64CmqS66', 10, 11),
(162, '7TCORbfd', 10, 12),
(163, '6o41ZCVJ', 11, 1),
(164, 'ya7JMWv2', 11, 2),
(165, 'tUDIOT3Y', 11, 3),
(166, 'a3SZD57B', 11, 4),
(167, 'NSJ2KmA6', 11, 5),
(168, '1BXGJYSj', 11, 6),
(169, 'fL3F4Hhv', 11, 7),
(170, 'lqkRIg3m', 11, 8),
(171, 'S1BV6S67', 11, 9),
(172, 'NNZ4Ukfv', 11, 10),
(173, '7uUxwae0', 11, 11),
(174, '9Attol1u', 11, 12),
(175, 'JaT69Ivm', 12, 1),
(176, 'NYk1ULlM', 12, 2),
(177, 'e04bxjlc', 12, 3),
(178, 'alEKrO6a', 12, 4),
(179, 'TQC1pr04', 12, 5),
(180, '1KwjPbie', 12, 6),
(181, 'XZJiRc0g', 12, 7),
(182, 'rQMBf3h3', 12, 8),
(183, 'psj2DnrD', 12, 9),
(184, 'ZZlO39Qx', 12, 10),
(185, 'gB72hQcC', 12, 11),
(186, 'iGUGkx35', 12, 12),
(187, '5dN2RAqD', 13, 1),
(188, 'ETEEmBKF', 13, 2),
(189, '7zSG0qtD', 13, 3),
(190, 'XKFv4eu0', 13, 4),
(191, 'Hh2svnhg', 13, 5),
(192, 'O8dS5Ncp', 13, 6),
(193, 'W0YuUXAn', 13, 7),
(194, '6yJx211m', 13, 8),
(195, 'S4scFEdx', 13, 9),
(196, 'GJeyZkYa', 13, 10),
(197, 'E84QR1aS', 13, 11),
(198, 'LlPDmeut', 13, 12);

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` bigint(255) NOT NULL,
  `account_id` bigint(255) NOT NULL,
  `friend_id` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620 COLLATE=tis620_thai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(255) NOT NULL COMMENT 'รหัสสื่อ',
  `cover_photo` text NOT NULL COMMENT 'ภาพปก',
  `title` text NOT NULL COMMENT 'ชื่อเรื่อง',
  `synopsis` text NOT NULL COMMENT 'เรื่องย่อ',
  `dubbed` varchar(30) NOT NULL COMMENT 'เสียงพากย์',
  `subtitle` varchar(30) NOT NULL COMMENT 'คำบรรยาย',
  `linked_to` text NOT NULL COMMENT 'ลิงก์ไปยัง',
  `popularity` bigint(255) NOT NULL COMMENT 'แต้มความนิยม',
  `preference` bigint(255) NOT NULL COMMENT 'แต้มความชอบ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'สร้างขึ้นเมื่อ',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'ปรับปรุงเมื่อ'
) ENGINE=InnoDB DEFAULT CHARSET=tis620 COLLATE=tis620_thai_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `cover_photo`, `title`, `synopsis`, `dubbed`, `subtitle`, `linked_to`, `popularity`, `preference`, `created_at`, `updated_at`) VALUES
(1, '1Vh7fSu1gPdX793ThHa0DVAUZeyHHsROS', 'Tensei shitara Slime Datta Ken เกิดใหม่ทั้งทีก็เป็นสไลม์ไปซะแล้ว(ภาค1)', 'มิคามิ ซาโตรุ หนุ่มโสด ไม่เคยมีแฟน วัย 37 ปี ถูกแทงตายเพราะช่วยเพื่อนจากคนร้าย เขาได้เกิดใหม่ในต่างโลกด้วยร่างของสไลม์ ได้พบมังกร เวรุโดร่า ผู้ถูกผนึกมาร่วม 3 ร้อยปีและรู้ว่าเขามาจากต่างโลก ด้วยความเบื่อหน่ายในชีวิตจึงยอมเป็นเพื่อนกับสไลม์ ตั้งชื่อให้เขา \"ริมุรุ\" และให้เขากลืนตนเข้าไปในร่าง ด้วย2 ความสามารถ \"นักล่า\" ที่ทำให้เขาสามารถชิงความสามารถของผู้ถูกกลืน และ \"ปราชญ์ผู้ยิ่งใหญ่\" ทำให้เขาเข้าใจเรื่องราวในโลกใหม่ ส่งผลให้เขาพัฒนาเป็นสไลม์ที่น่าเกรงขามต่อเหล่ามอนสเตอร์ทั่วไป จนกลายเป็นปีศาจที่ยิ่งใหญ่ในภายหลัง', 'ไทย', 'ไม่มี', 'Tensei-shitara-Slime-Datta-Ken-เกิดใหม่ทั้งทีก็เป็นสไลม์ไปซะแล้ว(ภาค1)', 0, 0, '2023-10-30 11:24:26', '2023-11-02 17:56:03'),
(2, '1KLRMeqbN9MCy4hE5aigtumSwNKSyjSoN', 'Tensei shitara Slime Datta Ken 2nd Season เกิดใหม่ทั้งทีก็เป็นสไลม์ไปซะแล้ว(ภาค2) ', 'เกิดใหม่เป็นสไลม์ - มิคามิ ซาโตรุ ชายหนุ่มโสดไม่เคยมีแฟน วัย 37 ปี ถูกแทงเสียชีวิตเพราะกำลังช่วยเหลือเพื่อนจากคนร้าย เขาเกิดใหม่ในอีกโลกหนึ่งในร่างของสไลม์ พบกับมังกรเวรูโดร่าที่ถูกผนึกมาเป็นเวลา 300 ปี และได้รู้ว่าเขามาจากอีกโลกหนึ่ง ด้วยความเบื่อหน่ายกับชีวิตเขาจึงตกลงที่จะเป็นเพื่อนกับสไลม์ ตั้งชื่อเขาว่า \"ริมูรุ\" และให้เขากลืนตัวเองด้วยความสามารถสองอย่าง ได้แก่ \"ฮันเตอร์\" ที่ทำให้เขาขโมยความสามารถของคนที่ถูกกลืนกิน และ \"มหาปราชญ์\" ที่ทำให้เขาเข้าใจเรื่องราวของโลกใหม่ได้ เป็นผลให้เขาพัฒนาเป็นสไลม์ที่น่าเกรงขามสำหรับมอนสเตอร์ธรรมดา จนกลายมาเป็นจอมมารผู้ยิ่งใหญ่ในเวลาต่อมา', 'ไทย', 'ไม่มี', 'Tensei-shitara-Slime-Datta-Ken-2nd-Season-เกิดใหม่ทั้งทีก็เป็นสไลม์ไปซะแล้ว(ภาค2) ', 0, 0, '2023-10-30 12:58:19', '2023-11-02 17:56:13'),
(3, '1BPvH_fx6vczlYBpWATHywsd4WBlZJ-eg', 'Kenja no Deshi wo Nanoru Kenja ฉันเป็นศิษย์จอมปราชญ์จริงๆ นะ', 'ซากิโมริ คางามิ ผู้สวมบทบาทเป็นนักอัญเชิญผู้น่าเกรงขามและหนึ่งในเก้าจอมปราชญ์นาม \"ดัมเบิลดัฟ\" ในเกมแนว VRMMO ชื่อ \"อาร์คเอิร์ธออนไลน์\" เผลอหลับไประหว่างเล่นและถูกส่งไปยังโลกที่เกมกลายเป็นความจริง มิหนำซ้ำ เขายังไม่ได้อยู่ในร่างนักปราชญ์ชรา แต่เป็นร่างของสาวน้อยหน้าตาน่ารักจิ้มลิ้ม...แบบนี้ก็เสียภาพพจน์ของนักปราชญ์สุดเคร่งขรึมที่อุตส่าห์สร้างมาหมดน่ะสิ! ซากิโมริ คางามิ (ดัมเบิลดัล์ฟ) ที่คิดเช่นนั้นเลือกที่จะอ้างตัวเป็นลูกศิษย์ของจอมปราชญ์ภายใต้ชื่อ \"มิร่า\" แต่ทว่าการผจญภัยเกิดใหม่เป็นสาวน้อยในโลกแฟนตาซี เปิดม่านขึ้นแล้วอย่างงดงาม!', 'ไทย', 'ไม่มี', 'Kenja-no-Deshi-wo-Nanoru-Kenja-ฉันเป็นศิษย์จอมปราชญ์จริงๆนะ', 0, 0, '2023-10-30 13:18:40', '2023-11-02 17:56:51'),
(4, '17GmJKBXTEAUvK1ALlkHQf7sbJGUjoMQg', 'Itai no wa Iya nano de น้องโล่สายแทงค์ แกร่งเกินร้อย(ภาค1)', 'น้องโล่สายแทงก์ แกร่งเกินร้อย ฮอนโจ คาเอเดะ (เมเปิ้ล) สาวน่ารักที่ถูกเพื่อน ชิโรมิเนะ ริสะ (ซารี่) ชวนมาเล่นเกมในโลกเสมือนจริง VRMMORPG แต่มือใหม่แบบเธอ ไม่อยากเจ็บตัว จึงเน้นเรื่องการป้องกันเป็นพิเศษ เน้นค่า VIT ไม่อัพค่าอื่น แต่ศัตรูทำ Damage ไม่เข้า พร้อมมีสกิลการป้องกันสมบูรณ์แบบ เธอได้ออกผจญภัย รู้จักผู้เล่นคนอื่นๆ และกลายเป็นที่รู้จักในภายหลัง', 'ไทย', 'ไม่มี', 'Itai-no-wa-Iya-nano-de-น้องโล่สายแทงค์-แกร่งเกินร้อย(ภาค1)', 0, 0, '2023-10-30 13:28:18', '2023-11-02 14:56:48'),
(5, '1ySdsk-mCUBqoPRXX6DSius6s4QO_nA4t', 'Itai no wa Iya nano de Season 2 น้องโล่สายแทงค์ แกร่งเกินร้อย(ภาค2)', 'ฮอนโจ คาเอเดะ (เมเปิล) สาวน่ารักที่ถูกเพื่อน ชิโรมิเนะ ริสะ (แซลลี่) ชวนมาเล่นเกมในโลกเสมือนจริง VRMMO \"นิวเวิร์ลด์ออนไลน์\" (NewWorld Online) แล้วต้องเล่นตามลำพังก่อน แต่ด้วยอุปนิสัยที่กังวลกับการโดนโจมตี ไม่อยากเจ็บตัว จึงขอเล่นสายประหลาด อัพแต่ค่า VIT เพื่อให้ถึกยิ่งขึ้น จนศัตรูทำ Damage ไม่ได้แลกกับไม่มีพลังโจมตี แล้วยังโชคดี ด้วยการเล่นที่พิศดารกว่าคนทั่วไป ทำให้ได้สกิลแปลกที่นำมาใช้คู่กันได้ ทั้งสกิลโจมตีที่รุนแรง พิษที่ทรงพลัง จนกลายเป็นผู้เล่นระดับท็อปอย่างรวดเร็ว พร้อมสร้างความปวดหัวให้กับเหล่า GM ผู้ดูแลเกม เธอยังได้เพื่อนฝูงที่นิสัยแตกต่างกัน ก่อตั้งกิลด์ ต้นเมเปิล (Maple Tree) แล้วร่วมสำรวจเกมที่มีหลายสิ่งให้ค้นหา', 'ไทย', 'ไม่มี', 'Itai-no-wa-Iya-nano-de-Season2-น้องโล่สายแทงค์ แกร่งเกินร้อย(ภาค2)', 0, 0, '2023-10-30 13:39:29', '2023-11-02 17:56:22'),
(6, '1wWdiyjLd5TZz9pxBb9sYqycSUICTLN5e', 'Tondemo Skill de Isekai Hourou Meshi สกิลสุดพิสดารกับมื้ออาหารในต่างโลก', 'มุโคดะ สึโยชิ ถูกอัญเชิญจากญี่ปุ่นมายังโลกแฟนตาซีพร้อมอีก 3 คน แต่เขากลับมีพลังระดับคนธรรมดา จึงขอออกผจญภัยตามลำพัง มีเพียงสกิลเดียวที่ติดตัวมา \"เน็ตซูเปอร์\" ที่สามารถสั่งซื้อของจากซูเปอร์มาเก็ตจากญี่ปุ่นได้ด้วยเงินของโลกแฟนตาซี อีกทั้งเขาสามารถทำอาหารได้ดี ทำให้เขาทั้งสามารถหาเงินจากการขายอาหาร ซึ่งช่วยให้เขาเป็นที่รู้จักและหาพรรคพวกที่แข็งแกร่งได้', 'ไทย', 'ไม่มี', 'Tondemo-Skill-de-Isekai-Hourou-Meshi-สกิลสุดพิสดารกับมื้ออาหารในต่างโลก', 0, 0, '2023-10-30 13:47:21', '2023-11-02 14:54:40'),
(7, '17S3S1zJN2ehzFKoWzkhV4czRAn-Kgs8Y', 'Sword Art Online ซอร์ดอาร์ตออนไลน์ (ภาค1)', 'คิริงายะ คาสึโตะ เขาได้เข้าร่วมเล่น เกม เสมือนจริงที่มีชื่อว่า Sword Art Online หรือ SAO ซึ่งเมื่อเขาเล่นเกมส์ ต้อง พบว่าตนเอง ไม่สามารถลอ็กเอาท์ออกจากเกมได้ เหล่าผู้เล่นเกมทั้งหมดต้องติด อยู่ภายในเกม โดยไม่มีใครรู้ว่าผู้พัฒนาเกมมีเป้าหมายที่แท้จริงอย่างไรกันแน่!!! แต่ทางออกจากเกมนี้ไปได้มีเพียงต้องเคลียร์เกมได้สำเร็จ หรือโอเวอร์ในเกม ก็หมาย ถึง การตายของผู้เล่นที่เกิดขึ้นจริง ดังนั้นเพื่อตอบสนองเงื่อนไขของการเคลียร์เกมนี้และ ออก จากโลกเสมือนจริง คาสึโตะจึงต้องเคลียร์เกมนี้ให้สำเร็จให้ได้ หรือเขาต้องพบ กับความตาย!', 'ไทย', 'ไม่มี', 'Sword-Art-Online-ซอร์ดอาร์ตออนไลน์(ภาค1)', 0, 0, '2023-10-31 03:17:54', '2023-11-02 14:54:37'),
(8, '1yIy-4gRlk_6sS_wUssAqXas1ZGCMowBD', 'Sword Art Online Anime ซอร์ดอาร์ตออนไลน์  (ภาค2)\r\n', 'หนึ่ง ปีผ่านไปหลังจากเกิดคดีใน Sword Art Online คิริโตะได้รับการไหว้วานจาก คิคุโอกะ เซจิโร่ แห่ง \"กองเวอร์ชวล\" กระทรวงกิจการภายในและการสื่อสาร ในการค้นหา \"Death Gun\" ที่อยู่ในโลกของ Gun Gale Online ซึ่งผู้เล่นใดก็ตามที่ถูกอวาตาร์ลึกลับยิงด้วยปืนสีดำจะต้องสูญเสียชีวิตใน โลกแห่งความเป็นจริงไปด้วย คิริโตะเองไม่ได้ปักใจเชื่อว่าผลกระทบของโลกเสมือนจริงนี้จะส่งผลต่อชีวิต ของผู้เล่นในโลกจริงได้ การเดินทางเพื่อตามหาเบาะแสของ \"Death Gun\" จึงได้เริ่มต้นขึ้น ซึ่งการผจญภัยครั้งนี้คิริโตะได้เพื่อนร่วมเดินทางเป็นมือปืนสไนเปอร์สาวนาม ว่า ชินอน ด้วยความช่วยเหลือของเธอในครั้งนี้ คิริโตะจึงได้ตัดสินใจที่จะเข้าร่วมในการแข่งทัวนาเม้นท์ \"Bullet of Bullets\" เพื่อคัดเลือกผู้ใช้ปืนที่ทรงพลังที่สุดในโลก Gun Gale Online เพื่อที่จะได้เป็นเป้าหมายของอวาตาร์ลึกลับผู้ใช้ \"Death Gun\"', 'ไทย', 'ไม่มี', 'Sword-Art-Online-Anime-ซอร์ดอาร์ตออนไลน์ (ภาค2)', 0, 0, '2023-10-31 03:25:36', '2023-11-02 19:12:42'),
(9, '1PCRu_fWOZFR1NkjDqwt7U1FejRJfgALN', 'Sword Art Online The Movie Ordinal Scale (2017) ซอร์ดอาร์ตออนไลน์ เดอะมูฟวี่ ออร์ดินอลสเกล', 'ในภาคนี้ได้กล่าวถึงสังคมที่ผู้คนได้มีการใช้งานระบบ Visual Reality เพื่อการสร้างความบันเทิงในชีวิตจริงๆ จนเป็นกิจวัตร จนทำให้มีการพัฒนาเกมออนไลน์ที่สามารถเล่นได้โดยไม่ต้องพึ่งพา PC ส่วนตัวอย่าง \"Ordinal Scale\" ซึ่งเป็นเกมแนว ARMMO RPG (Augmented Reality Multi Massive Online RPG) ที่ต้องใช้อุปกรณ์คล้ายกับบลูทูธในการเข้าเล่นอย่าง Augma ในการเข้าเล่นซึ่งแน่นอนว่า \"คิริโตะ\" และบรรดากลุ่มเพื่อนสนิทได้เข้าร่วมเล่นเกม Ordinal Scale ด้วย ซึ่งกฎกติกาของเกมนี้ดูเรียบง่าย?เพียงแค่ไล่ล่าเหล่ามอนสเตอร์ ค้นหาไอเท็มต่างๆ ในเกม เพื่อเพิ่ม Ranking ของตนเอง ทว่ามีบางอย่างเกิดขึ้น เมื่อพวกคิริโตะได้พบว่ามีในเกมนี้มีมอนสเตอร์ระดับบอสจากในเกม Sword Art Online ซึ่งมันมาจากเกมที่เคยได้กักขังพวกเขาเมื่อ 2 ปี เป็นบอสอีเว้นท์ภายในเกมนี้คำตอบของเรื่องนี้คืออะไรกันแน่', 'ไทย', 'ไม่มี', 'Sword-Art-Online-The-Movie-Ordinal-Scale(2017)-ซอร์ดอาร์ตออนไลน์-เดอะมูฟวี่-ออร์ดินอลสเกล', 0, 0, '2023-10-31 15:15:46', '2023-11-02 15:03:36'),
(10, '1vQHkEam5zi1T3u56oDV1VR2OwiNDUzaI', 'Youkoso Jitsuryoku Shijou Shugi no Kyoushitsu e ขอต้อนรับสู่ห้องเรียนนิยม (เฉพาะ) ยอดคน', 'โรงเรียน คิโด อิคุเซย์ มีชื่อเสียงจากนักเรียนแทบจะร้อยเปอร์เซนต์ที่สามารถหางานทำหรือเข้าเรียนต่อมหาวิทยาลัยได้ มีชื่อเสียงเรื่องการปล่อยนักเรียนได้รับอิสระหลายอย่างในระหว่างที่อยู่โรงเรียน จนเหมือนเป็นโรงเรียนในฝันที่เหล่าวัยรุ่นอยากเข้าไปเรียน แต่ในความเป็นจริง มีเพียงนักเรียนห้อง A ที่ได้รับการสิทธิพิเศษ อายาโนโคจิ คิโยทากะ นักเรียนชายที่ผลการเรียนระดับไม่ค่อยเด่น ได้มาเรียนในห้อง D หลังได้พบกับคนอื่นและเข้าใจถึงระบบแต้มในการเลื่อนห้องที่เพิ่มหรือลดชั้นได้ ทำให้วิถีชีวิตเขาเริ่มเปลื่ยนไป', 'ไม่มี', 'ไทย', 'Youkoso-Jitsuryoku-Shijou-Shugi-no-Kyoushitsu-e-ขอต้อนรับสู่ห้องเรียนนิยม(เฉพาะ)ยอดคน', 0, 0, '2023-10-31 15:25:39', '2023-11-02 14:52:38'),
(11, '1STPvF7AczRqWdFBiqjWq3zsGyizvqU_F', 'Shijou Saikyou no Daimaou, Murabito A ni Tensei suru ชีวิตใหม่ไม่ธรรมดาของราชาปีศาจขี้เหงา', 'ชีวิตใหม่ไม่ธรรมดาของราชาปีศาจขี้เหงา ในอดีต วาร์วาทอส จอมราชาปีศาจสุดแข็งแกร่ง เป็นที่หวาดกลัวจนไม่มีใครกล้าเข้าใกล้ ตัวเขาไม่ชอบชีวิตแบบนี้ จึงตัดสินใจเกิดใหม่ด้วยตนเอง ฐานะ อาร์ด ชาวบ้านธรรมดา ได้เกิดในยุคที่เวทมนตร์เสื่อมถอย ตัวเขาที่มีพลังมากกวาคนทั่วไป ถึงมุ่งมั่นที่จะใช้ชีวิตแบบปกติ แต่ไม่ได้ง่ายอย่างที่คิด', 'ไม่มี', 'ไทย', 'Shijou-Saikyou-no-Daimaou,Murabito-A-ni-Tensei-suru-ชีวิตใหม่ไม่ธรรมดาของราชาปีศาจขี้เหงา', 0, 0, '2023-10-31 15:34:58', '2023-10-31 15:34:58'),
(12, '18eTqNkq4KhlqM4bv0Kt0ek3a7W0dxvF2', 'Gaikotsu Kishi-sama บันทึกการเดินทางต่างโลกของท่านอัศวินกระดูก', 'บันทึกการเดินทางต่างโลกของท่านอัศวินกระดูก เมื่อ \"อาร์ค\" ลืมตาตื่นขึ้นมาอีกที เขาก็อยู่ในต่างมิติด้วยร่างกายของตัวละครที่เขาเคยใช้ในเกม MMORPG เสียแล้ว ซึ่งร่างนั้นคือ \"อัศวินกระดูก\" ที่ภายในสวมใส่เกราะ และเป็นกระดูกทั่วร่างนั่นเอง ถ้ามีใครรู้เรื่องนี้ มีหวังถูกเข้าใจผิดว่าเป็นมอนเตอร์จนถูกไล่ล่าแน่นอน!? อาร์คจึงได้ตัดสินใจที่จะใช้ชีวิตในฐานะทหารรับจ้าง ทว่าเขาก็ไม่ใช่ผู้ชายที่จะมองข้ามเรื่องเลวร้ายที่เกิดขึ้นตรงหน้าไปได้หน้าตายเฉย! เรื่องราวแฟนตาซีการ \"กอบกู้โลก\" ต่างมิติ โดยไม่รู้ตัวของอัศวินโครงกระดูก กำลังจะเปิดม่านแล้ว!!', 'ไม่มี', 'ไทย', 'Gaikotsu-Kishi-sama-บันทึกการเดินทางต่างโลกของท่านอัศวินกระดูก', 0, 0, '2023-10-31 15:45:46', '2023-10-31 15:45:46'),
(13, '1Q9_z5lDM7qpfdTNBgfsmucKZ1qYC6uMi', 'NP-Completeness 1: ประสิทธิภาพของอัลกอริทึมและรูปแบบปัญหา', '', 'ไทย', 'ไม่มี', 'NP-Completeness1-ประสิทธิภาพของอัลกอริทึมและรูปแบบปัญหา', 0, 0, '2023-10-31 15:54:55', '2023-11-02 15:06:10');

-- --------------------------------------------------------

--
-- Table structure for table `media_genre`
--

CREATE TABLE `media_genre` (
  `id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `genre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620 COLLATE=tis620_thai_ci;

--
-- Dumping data for table `media_genre`
--

INSERT INTO `media_genre` (`id`, `media_id`, `genre`) VALUES
(1, 1, 'ต่อสู้'),
(2, 1, 'ผจญภัย'),
(3, 1, 'ต่างโลก'),
(4, 1, 'แฟนตาซี'),
(5, 1, 'ตลก'),
(6, 2, 'ต่อสู้'),
(7, 2, 'ผจญภัย'),
(8, 2, 'แฟนตาซี'),
(9, 2, 'ตลก'),
(10, 2, 'ต่างโลก'),
(11, 3, 'ผจญภัย'),
(12, 3, 'แฟนตาซี'),
(13, 4, 'ต่อสู้'),
(14, 4, 'แฟนตาซี'),
(15, 4, 'ผจญภัย'),
(16, 4, 'ตลก'),
(17, 4, 'ไซ-ไฟ'),
(18, 5, 'ต่อสู้'),
(19, 5, 'ผจญภัย'),
(20, 5, 'ตลก'),
(21, 5, 'แฟนตาซี'),
(22, 5, 'ไซ-ไฟ'),
(23, 6, 'ผจญภัย'),
(24, 6, 'ตลก'),
(25, 6, 'แฟนตาซี'),
(26, 6, 'ต่างโลก'),
(27, 6, 'อาหาร'),
(28, 7, 'ต่อสู้'),
(29, 7, 'ผจญภัย'),
(30, 7, 'แฟนตาซี'),
(31, 7, 'เกม'),
(32, 7, 'โรแมนติก'),
(33, 8, 'ต่อสู้'),
(34, 8, 'แฟนตาซี'),
(35, 8, 'ผจญภัย'),
(36, 8, 'เกม'),
(37, 8, 'โรแมนติก'),
(38, 9, 'ต่อสู้'),
(39, 9, 'ผจญภัย'),
(40, 9, 'แฟนตาซี'),
(41, 9, 'เกม'),
(42, 9, 'โรแมนติก'),
(43, 10, 'ดราม่า'),
(44, 10, 'จิตวิทยา'),
(45, 10, 'โรงเรียน'),
(46, 10, 'ชีวิตประจำวัน'),
(47, 11, 'ต่อสู้'),
(48, 11, 'แฟนตาซี'),
(49, 12, 'ต่อสู้'),
(50, 12, 'แฟนตาซี'),
(51, 12, 'ต่างโลก');

-- --------------------------------------------------------

--
-- Table structure for table `popularity`
--

CREATE TABLE `popularity` (
  `id` bigint(20) NOT NULL,
  `account_email` text NOT NULL,
  `media_id` bigint(20) NOT NULL,
  `point` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620 COLLATE=tis620_thai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preference`
--

CREATE TABLE `preference` (
  `id` bigint(255) NOT NULL,
  `account_uid` text NOT NULL,
  `media_id` bigint(255) NOT NULL,
  `public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620 COLLATE=tis620_thai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` bigint(255) NOT NULL,
  `friend_id` bigint(255) NOT NULL,
  `account_id` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620 COLLATE=tis620_thai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `episode`
--
ALTER TABLE `episode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_genre`
--
ALTER TABLE `media_genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `popularity`
--
ALTER TABLE `popularity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preference`
--
ALTER TABLE `preference`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `episode`
--
ALTER TABLE `episode`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสื่อ', AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `media_genre`
--
ALTER TABLE `media_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `popularity`
--
ALTER TABLE `popularity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `preference`
--
ALTER TABLE `preference`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
