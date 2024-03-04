-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2024 at 09:35 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prokash`
--

-- --------------------------------------------------------

--
-- Table structure for table `approve_vote`
--

CREATE TABLE `approve_vote` (
  `approve_vote_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prb_id` int(11) NOT NULL,
  `vote` tinyint(1) NOT NULL,
  `vote_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Transportation'),
(2, 'Institution'),
(3, 'Illegal Occurrence'),
(4, 'Natural'),
(5, 'Pollution'),
(6, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `district_id`) VALUES
(1, 'Adabor', 1),
(2, 'Uttar Khan', 1),
(3, 'Uttara', 1),
(4, 'Kadamtali', 1),
(5, 'Kalabagan', 1),
(6, 'Kafrul', 1),
(7, 'Kamrangirchar', 1),
(8, 'Cantonment', 1),
(9, 'Kotwali', 1),
(10, 'Khilkhet', 1),
(11, 'Khilgaon', 1),
(12, 'Gulshan', 1),
(13, 'Gendaria', 1),
(14, 'Chawkbazar', 1),
(15, 'Demra', 1),
(16, 'Turag', 1),
(17, 'Tejgaon', 1),
(18, 'Tejgaon I/A', 1),
(19, 'Dakshinkhan', 1),
(20, 'Darus Salam', 1),
(21, 'Dhanmondi', 1),
(22, 'New Market', 1),
(23, 'Paltan', 1),
(24, 'Pallabi', 1),
(25, 'Bangshal', 1),
(26, 'Badda', 1),
(27, 'Bimanbandar', 1),
(28, 'Motijheel', 1),
(29, 'Mirpur', 1),
(30, 'Mohammadpur', 1),
(31, 'Jatrabari', 1),
(32, 'Ramna', 1),
(33, 'Rampura', 1),
(34, 'Lalbagh', 1),
(35, 'Shah Ali', 1),
(36, 'Shahbagh', 1),
(37, 'Sher-e-Bangla Nagar', 1),
(38, 'Shyampur', 1),
(39, 'Sabujbagh', 1),
(40, 'Sutrapur', 1),
(41, 'Hazaribagh', 1),
(42, 'Keraniganj', 1),
(43, 'Nawabganj', 1),
(44, 'Dohar', 1),
(45, 'Dhamrai', 1),
(46, 'Savar', 1),
(47, 'Atigram', 2),
(48, 'Krishnapur', 2),
(49, 'Garpara', 2),
(50, 'Jaigir', 2),
(51, 'Dighi', 2),
(52, 'Nabagram', 2),
(53, 'Putail', 2),
(54, 'Betila Mitara', 2),
(55, 'Bhararia', 2),
(56, 'Hatipara', 2),
(57, 'Gomastapur', 3),
(58, 'Nawabganj Sadar', 3),
(59, 'Nachole', 3),
(60, 'Bholahat', 3),
(61, 'Shibganj', 3),
(62, 'Narsingdi Sadar', 4),
(63, 'Palash', 4),
(64, 'Belabo', 4),
(65, 'Monohardi', 4),
(66, 'Raipura', 4),
(67, 'Shibpur', 4),
(68, 'Kapasia', 5),
(69, 'Kaliakair', 5),
(70, 'Kaliganj', 5),
(71, 'Gazipur Sadar', 5),
(72, 'Sreepur', 5),
(73, 'Amtali', 48),
(74, 'Bamna', 48),
(75, 'Barguna Sadar', 48),
(76, 'Betagi', 48),
(77, 'Patharghata', 48),
(78, 'Taltali', 48),
(79, 'Agailjhara', 46),
(80, 'Babuganj', 46),
(81, 'Bakerganj', 46),
(82, 'Banaripara', 46),
(83, 'Gaurnadi', 46),
(84, 'Hizla', 46),
(85, 'Barishal Sadar', 46),
(86, 'Mehendiganj', 46),
(87, 'Muladi', 46),
(88, 'Wazirpur', 46),
(89, 'Bhola Sadar', 47),
(90, 'Burhanuddin', 47),
(91, 'Char Fasson', 47),
(92, 'Daulatkhan', 47),
(93, 'Lalmohan', 47),
(94, 'Manpura', 47),
(95, 'Tazumuddin', 47),
(96, 'Jhalokati Sadar', 43),
(97, 'Kathalia', 43),
(98, 'Nalchity', 43),
(99, 'Rajapur', 43),
(100, 'Bauphal', 44),
(101, 'Dashmina', 44),
(102, 'Galachipa', 44),
(103, 'Kalapara', 44),
(104, 'Mirzaganj', 44),
(105, 'Patuakhali Sadar', 44),
(106, 'Rangabali', 44),
(107, 'Dumki', 44),
(108, 'Bhandaria', 45),
(109, 'Kawkhali', 45),
(110, 'Mathbaria', 45),
(111, 'Nazirpur', 45),
(112, 'Pirojpur Sadar', 45),
(113, 'Nesarabad (Swarupkati)', 45),
(114, 'Zianagar', 45),
(115, 'Ali Kadam', 24),
(116, 'Bandarban Sadar', 24),
(117, 'Lama', 24),
(118, 'Naikhongchhari', 24),
(119, 'Rowangchhari', 24),
(120, 'Ruma', 24),
(121, 'Thanchi', 24),
(122, 'Akhaura', 16),
(123, 'Bancharampur', 16),
(124, 'Brahmanbaria Sadar', 16),
(125, 'Kasba', 16),
(126, 'Nabinagar', 16),
(127, 'Nasirnagar', 16),
(128, 'Sarail', 16),
(129, 'Ashuganj', 16),
(130, 'Bijoynagar', 16),
(131, 'Chandpur Sadar', 19),
(132, 'Faridganj', 19),
(133, 'Haimchar', 19),
(134, 'Haziganj', 19),
(135, 'Kachua', 19),
(136, 'Matlab Dakshin', 19),
(137, 'Matlab Uttar', 19),
(138, 'Shahrasti', 19),
(139, 'Anwara', 21),
(140, 'Banshkhali', 21),
(141, 'Boalkhali', 21),
(142, 'Chandanaish', 21),
(143, 'Fatikchhari', 21),
(144, 'Hathazari', 21),
(145, 'Karnaphuli', 21),
(146, 'Lohagara', 21),
(147, 'Mirsharai', 21),
(148, 'Patiya', 21),
(149, 'Rangunia', 21),
(150, 'Raozan', 21),
(151, 'Sandwip', 21),
(152, 'Satkania', 21),
(153, 'Sitakunda', 21),
(154, 'Bandar Thana', 21),
(155, 'Chandgaon Thana', 21),
(156, 'Double Mooring Thana', 21),
(157, 'Kotwali Thana', 21),
(158, 'Pahartali Thana', 21),
(159, 'Panchlaish Thana', 21),
(160, 'Bhujpur Thana', 21),
(161, 'Barura', 14),
(162, 'Brahmanpara', 14),
(163, 'Burichang', 14),
(164, 'Chandina', 14),
(165, 'Chauddagram', 14),
(166, 'Daudkandi', 14),
(167, 'Debidwar', 14),
(168, 'Homna', 14),
(169, 'Laksam', 14),
(170, 'Muradnagar', 14),
(171, 'Nangalkot', 14),
(172, 'Cumilla Adarsha Sadar', 14),
(173, 'Meghna', 14),
(174, 'Titas', 14),
(175, 'Monohargonj', 14),
(176, 'Cumilla Sadar Dakshin', 14),
(177, 'Chakaria', 22),
(178, 'Cox Bazar Sadar', 22),
(179, 'Kutubdia', 22),
(180, 'Maheshkhali', 22),
(181, 'Ramu', 22),
(182, 'Teknaf', 22),
(183, 'Ukhia', 22),
(184, 'Pekua', 22),
(185, 'Chhagalnaiya', 15),
(186, 'Daganbhuiyan', 15),
(187, 'Feni Sadar', 15),
(188, 'Parshuram', 15),
(189, 'Sonagazi', 15),
(190, 'Fulgazi', 15),
(191, 'Dighinala', 23),
(192, 'Khagrachhari', 23),
(193, 'Lakshmichhari', 23),
(194, 'Mahalchhari', 23),
(195, 'Manikchhari', 23),
(196, 'Matiranga', 23),
(197, 'Panchhari', 23),
(198, 'Ramgarh', 23),
(199, 'Lakshmipur Sadar', 20),
(200, 'Raipur', 20),
(201, 'Ramganj', 20),
(202, 'Ramgati', 20),
(203, 'Kamalnagar', 20),
(204, 'Begumganj', 18),
(205, 'Noakhali Sadar', 18),
(206, 'Chatkhil', 18),
(207, 'Companiganj', 18),
(208, 'Hatiya', 18),
(209, 'Senbagh', 18),
(210, 'Sonaimuri', 18),
(211, 'Subarnachar', 18),
(212, 'Kabirhat', 18),
(213, 'Bagaichhari', 17),
(214, 'Barkal', 17),
(215, 'Kawkhali (Betbunia)', 17),
(216, 'Belaichhari', 17),
(217, 'Kaptai', 17),
(218, 'Juraichhari', 17),
(219, 'Langadu', 17),
(220, 'Naniyachar', 17),
(221, 'Rajasthali', 17),
(222, 'Rangamati Sadar', 17),
(223, 'Alfadanga', 13),
(224, 'Bhanga', 13),
(225, 'Boalmari', 13),
(226, 'Charbhadrasan', 13),
(227, 'Faridpur Sadar', 13),
(228, 'Madhukhali', 13),
(229, 'Nagark', 13),
(230, 'Nagarkanda', 13),
(231, 'Sadarpur', 13),
(232, 'Saltha', 13),
(233, 'Gazipur Sadar', 5),
(234, 'Kaliakair', 5),
(235, 'Kaliganj', 5),
(236, 'Kapasia', 5),
(237, 'Sreepur', 5),
(238, 'Gopalganj Sadar', 12),
(239, 'Kashiani', 12),
(240, 'Kotalipara', 12),
(241, 'Muksudpur', 12),
(242, 'Tungipara', 12),
(243, 'Austagram', 8),
(244, 'Bajitpur', 8),
(245, 'Bhairab', 8),
(246, 'Hossainpur', 8),
(247, 'Itna', 8),
(248, 'Karimganj', 8),
(249, 'Katiadi', 8),
(250, 'Kishoreganj Sadar', 8),
(251, 'Kuliarchar', 8),
(252, 'Mithamain', 8),
(253, 'Nikli', 8),
(254, 'Pakundia', 8),
(255, 'Rajoir', 11),
(256, 'Madaripur Sadar', 11),
(257, 'Kalkini', 11),
(258, 'Shibchar', 11),
(259, 'Gazaria', 9),
(260, 'Lohajang', 9),
(261, 'Munshiganj Sadar', 9),
(262, 'Sirajdikhan', 9),
(263, 'Sreenagar', 9),
(264, 'Tongibari', 9),
(265, 'Gazaria', 4),
(266, 'Lohajang', 4),
(267, 'Munshiganj Sadar', 4),
(268, 'Sirajdikhan', 4),
(269, 'Sreenagar', 4),
(270, 'Tongibari', 4),
(271, 'Baliakandi', 10),
(272, 'Goalandaghat', 10),
(273, 'Pangsha', 10),
(274, 'Rajbari Sadar', 10),
(275, 'Kalukhali', 10),
(276, 'Bhedarganj', 6),
(277, 'Damudya', 6),
(278, 'Gosairhat', 6),
(279, 'Naria', 6),
(280, 'Shariatpur Sadar', 6),
(281, 'Zajira', 6),
(282, 'Shakhipur', 6),
(283, 'Gopalpur', 7),
(284, 'Basail', 7),
(285, 'Bhuapur', 7),
(286, 'Delduar', 7),
(287, 'Ghatail', 7),
(288, 'Kalihati', 7),
(289, 'Madhupur', 7),
(290, 'Mirzapur', 7),
(291, 'Nagarpur', 7),
(292, 'Sakhipur', 7),
(293, 'Dhanbari', 7),
(294, 'Tangail Sadar', 7),
(295, 'Bagerhat Sadar', 41),
(296, 'Chitalmari', 41),
(297, 'Fakirhat', 41),
(298, 'Kachua', 41),
(299, 'Mollahat', 41),
(300, 'Mongla', 41),
(301, 'Morrelganj', 41),
(302, 'Rampal', 41),
(303, 'Sarankhola', 41),
(304, 'Alamdanga', 37),
(305, 'Chuadanga Sadar', 37),
(306, 'Damurhuda', 37),
(307, 'Jibannagar', 37),
(308, 'Abhaynagar', 33),
(309, 'Bagherpara', 33),
(310, 'Chaugachha', 33),
(311, 'Jhikargachha', 33),
(312, 'Keshabpur', 33),
(313, 'Jashore Sadar', 33),
(314, 'Manirampur', 33),
(315, 'Sharsha', 33),
(316, 'Harinakunda', 42),
(317, 'Jhenaidah Sadar', 42),
(318, 'Kaliganj', 42),
(319, 'Kotchandpur', 42),
(320, 'Maheshpur', 42),
(321, 'Shailkupa', 42),
(322, 'Batiaghata', 40),
(323, 'Dacope', 40),
(324, 'Dumuria', 40),
(325, 'Dighalia', 40),
(326, 'Koyra', 40),
(327, 'Paikgachha', 40),
(328, 'Phultala', 40),
(329, 'Rupsha', 40),
(330, 'Terokhada', 40),
(331, 'Daulatpur Thana', 40),
(332, 'Khalishpur Thana', 40),
(333, 'Khan Jahan Ali Thana', 40),
(334, 'Kotwali Thana', 40),
(335, 'Sonadanga Thana', 40),
(336, 'Harintana Thana', 40),
(337, 'Bheramara', 38),
(338, 'Daulatpur', 38),
(339, 'Khoksa', 38),
(340, 'Kumarkhali', 38),
(341, 'Kushtia Sadar', 38),
(342, 'Mirpur', 38),
(343, 'Magura Sadar', 39),
(344, 'Mohammadpur', 39),
(345, 'Shalikha', 39),
(346, 'Sreepur', 39),
(347, 'Gangni', 35),
(348, 'Meherpur Sadar', 35),
(349, 'Mujibnagar', 35),
(350, 'Kalia', 36),
(351, 'Lohagara', 36),
(352, 'Narail Sadar', 36),
(353, 'Naragati Thana', 36),
(354, 'Assasuni', 34),
(355, 'Debhata', 34),
(356, 'Kalaroa', 34),
(357, 'Kaliganj', 34),
(358, 'Satkhira Sadar', 34),
(359, 'Shyamnagar', 34),
(360, 'Tala', 34),
(361, 'Baksiganj', 63),
(362, 'Dewanganj', 63),
(363, 'Islampur', 63),
(364, 'Jamalpur Sadar', 63),
(365, 'Madarganj', 63),
(366, 'Melandaha', 63),
(367, 'Sarishabari', 63),
(368, 'Trishal', 62),
(369, 'Dhobaura', 62),
(370, 'Fulbaria', 62),
(371, 'Gaffargaon', 62),
(372, 'Gauripur', 62),
(373, 'Haluaghat', 62),
(374, 'Ishwarganj', 62),
(375, 'Mymensingh Sadar', 62),
(376, 'Muktagachha', 62),
(377, 'Nandail', 62),
(378, 'Phulpur', 62),
(379, 'Atpara', 64),
(380, 'Durgapur', 64),
(381, 'Khaliajuri', 64),
(382, 'Kalmakanda', 64),
(383, 'Kendua', 64),
(384, 'Madan', 64),
(385, 'Netrokona Sadar', 64),
(386, 'Purbadhala', 64),
(387, 'Jhenaigati', 61),
(388, 'Nakla', 61),
(389, 'Nalitabari', 61),
(390, 'Sherpur Sadar', 61),
(391, 'Akheriganj', 27),
(392, 'Bogra Sadar', 27),
(393, 'Adamdighi', 27),
(394, 'Dhunat', 27),
(395, 'Dupchanchia', 27),
(396, 'Gabtali', 27),
(397, 'Kahaloo', 27),
(398, 'Nandigram', 27),
(399, 'Sariakandi', 27),
(400, 'Sonatala', 27),
(401, 'Shajahanpur', 27),
(402, 'Shibganj', 27),
(403, 'Akkelpur', 30),
(404, 'Joypurhat Sadar', 30),
(405, 'Kalai', 30),
(406, 'Khetlal', 30),
(407, 'Panchbibi', 30),
(408, 'Ahsanganj', 32),
(409, 'Badalgachhi', 32),
(410, 'Dhamoirhat', 32),
(411, 'Mahadebpur', 32),
(412, 'Naogaon Sadar', 32),
(413, 'Niamatpur', 32),
(414, 'Patnitala', 32),
(415, 'Porsha', 32),
(416, 'Raninagar', 32),
(417, 'Sapahar', 32),
(418, 'Bagatipara', 29),
(419, 'Baraigram', 29),
(420, 'Lalpur', 29),
(421, 'Natore Sadar', 29),
(422, 'Singra', 29),
(423, 'Atgharia', 26),
(424, 'Bera', 26),
(425, 'Ishwardi', 26),
(426, 'Pabna Sadar', 26),
(427, 'Sujanagar', 26),
(428, 'Chatmohar', 26),
(429, 'Faridpur', 26),
(430, 'Santhia', 26),
(431, 'Bagha', 28),
(432, 'Bagmara', 28),
(433, 'Charghat', 28),
(434, 'Durgapur', 28),
(435, 'Godagari', 28),
(436, 'Mohanpur', 28),
(437, 'Paba', 28),
(438, 'Puthia', 28),
(439, 'Tanore', 28),
(440, 'Boalia Thana', 28),
(441, 'Matihar Thana', 28),
(442, 'Rajpara Thana', 28),
(443, 'Belkuchi', 25),
(444, 'Chauhali', 25),
(445, 'Kamarkhanda', 25),
(446, 'Kazipur', 25),
(447, 'Raiganj', 25),
(448, 'Shahjadpur', 25),
(449, 'Sirajganj Sadar', 25),
(450, 'Tarash', 25),
(451, 'Ullahpara', 25),
(452, 'Ajmiriganj', 51),
(453, 'Baniachang', 51),
(454, 'Chunarughat', 51),
(455, 'Habiganj Sadar', 51),
(456, 'Lakhai', 51),
(457, 'Madhabpur', 51),
(458, 'Nabiganj', 51),
(459, 'Barlekha', 50),
(460, 'Juri', 50),
(461, 'Kamalganj', 50),
(462, 'Kulaura', 50),
(463, 'Moulvibazar Sadar', 50),
(464, 'Rajnagar', 50),
(465, 'Sreemangal', 50),
(466, 'Balaganj', 49),
(467, 'Bianibazar', 49),
(468, 'Beanibazar', 49),
(469, 'Companiganj', 49),
(470, 'Fenchuganj', 49),
(471, 'Golapganj', 49),
(472, 'Gowainghat', 49),
(473, 'Jaintiapur', 49),
(474, 'Kanaighat', 49),
(475, 'Zakiganj', 49),
(476, 'Sylhet Sadar', 49),
(477, 'Bishwamvarpur', 52),
(478, 'Chhatak', 52),
(479, 'Dharampasha', 52),
(480, 'Duara bazar', 52),
(481, 'Jamalganj', 52),
(482, 'Sullah', 52),
(483, 'Sunamganj Sadar', 52),
(484, 'Tahirpur', 52),
(485, 'Bishwanath', 52);

-- --------------------------------------------------------

--
-- Table structure for table `complaint_list`
--

CREATE TABLE `complaint_list` (
  `prb_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `prb_title` varchar(150) NOT NULL,
  `category` int(11) NOT NULL,
  `sub_category` int(11) NOT NULL,
  `prb_address` varchar(200) NOT NULL,
  `prb_state` int(11) NOT NULL,
  `prb_district` int(11) NOT NULL,
  `prb_area` int(11) NOT NULL,
  `submit_date` datetime NOT NULL DEFAULT current_timestamp(),
  `prb_desc` varchar(500) NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `next_show_date` datetime DEFAULT '2000-09-19 21:38:19',
  `solved_date` datetime DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT 0,
  `is_solved` tinyint(1) NOT NULL DEFAULT 0,
  `prb_medianame` varchar(255) NOT NULL,
  `prb_mediatype` varchar(50) NOT NULL,
  `prb_mediapath` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaint_list`
--

INSERT INTO `complaint_list` (`prb_id`, `user_id`, `prb_title`, `category`, `sub_category`, `prb_address`, `prb_state`, `prb_district`, `prb_area`, `submit_date`, `prb_desc`, `approved_date`, `next_show_date`, `solved_date`, `is_valid`, `is_solved`, `prb_medianame`, `prb_mediatype`, `prb_mediapath`) VALUES
(1, 2, 'Buriganga', 1, 3, 'Babu bazar Bridge', 1, 1, 25, '2023-07-10 21:10:05', 'It\'s beyond frustrating being stuck in this endless traffic jam on the Buriganga Bridge in Dhaka. Commuters are stranded for hours, causing immense inconvenience and delays.', '2023-06-22 21:07:55', '2023-07-22 21:07:55', NULL, 1, 0, 'sdgs', 'gsgsg', 'sggsgs'),
(16, 15, 'Poor Bus Vehicles', 1, 2, 'Bahadur Shah Park', 1, 1, 25, '2023-08-01 22:43:46', 'There is a bus station near the campus where there are many damaged buses which are not fit for transportation.', '2023-08-17 22:46:54', '2023-11-16 22:46:54', NULL, 1, 0, 'bus.jpg', 'image/jpeg', 'Complaint_Media/64e242c2eea19_bus.jpg'),
(17, 15, 'Air Pollution', 5, 20, 'Dholaikhal', 1, 1, 25, '2023-08-03 22:46:10', 'As there are some bus station near the campus,air pollution level of that place is so high. This area is suffocating under thick smog and toxic fumes. The air quality is hazardous, putting lives at risk.', '2023-08-16 22:47:42', '2023-11-15 22:47:42', NULL, 1, 0, 'air.jpg', 'image/jpeg', 'Complaint_Media/64e2435248f18_air.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `state_id`) VALUES
(1, 'Dhaka', 1),
(2, 'Manikganj', 1),
(3, 'Narayanganj', 1),
(4, 'Narsingdi', 1),
(5, 'Gazipur', 1),
(6, 'Shariatpur', 1),
(7, 'Tangail', 1),
(8, 'Kishoreganj', 1),
(9, 'Munshiganj', 1),
(10, 'Rajbari', 1),
(11, 'Madaripur', 1),
(12, 'Gopalganj', 1),
(13, 'Faridpur', 1),
(14, 'Cumilla', 2),
(15, 'Feni', 2),
(16, 'Brahmanbaria', 2),
(17, 'Rangamati', 2),
(18, 'Noakhali', 2),
(19, 'Chandpur', 2),
(20, 'Lakshmipur', 2),
(21, 'Chattogram', 2),
(22, 'Cox\'s bazar', 2),
(23, 'Khagrachhari', 2),
(24, 'Bandarban', 2),
(25, 'Sirajganj', 3),
(26, 'Pabna', 3),
(27, 'Bogura', 3),
(28, 'Rajshahi', 3),
(29, 'Natore', 3),
(30, 'Joypurhat', 3),
(31, 'Chapainawabganj', 3),
(32, 'Naogaon', 3),
(33, 'Jashore', 4),
(34, 'Satkhira', 4),
(35, 'Meherpur', 4),
(36, 'Narail', 4),
(37, 'Chuadanga', 4),
(38, 'Kushtia', 4),
(39, 'Magura', 4),
(40, 'Khulna', 4),
(41, 'Bagerhat', 4),
(42, 'Jhenaidah', 4),
(43, 'Jhalakathi', 5),
(44, 'Patuakhali', 5),
(45, 'Pirojpur', 5),
(46, 'Barishal', 5),
(47, 'Bhola', 5),
(48, 'Barguna', 5),
(49, 'Sylhet', 6),
(50, 'Moulvibazar', 6),
(51, 'Habiganj', 6),
(52, 'Sunamganj', 6),
(53, 'Panchagarh', 7),
(54, 'Dinajpur', 7),
(55, 'Lalmonirhat', 7),
(56, 'Nilphamari', 7),
(57, 'Gaibandha', 7),
(58, 'Thakurgaon', 7),
(59, 'Rangpur', 7),
(60, 'Kurigram', 7),
(61, 'Sherpur', 8),
(62, 'Mymensingh', 8),
(63, 'Jamalpur', 8),
(64, 'Netrokona', 8);

-- --------------------------------------------------------

--
-- Table structure for table `forum_comment`
--

CREATE TABLE `forum_comment` (
  `comment_id` int(11) NOT NULL,
  `comment_date` datetime NOT NULL DEFAULT current_timestamp(),
  `prb_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `likes` int(10) NOT NULL,
  `dislikes` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `forum_comment`
--

INSERT INTO `forum_comment` (`comment_id`, `comment_date`, `prb_id`, `user_id`, `comment`, `likes`, `dislikes`) VALUES
(1, '2023-08-20 11:05:22', 1, 2, 'hello', 1, 0),
(2, '2023-08-20 23:12:36', 16, 16, 'We should implement traffic rules strictly', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reviewed_list`
--

CREATE TABLE `reviewed_list` (
  `user_id` int(11) NOT NULL,
  `prb_id` int(11) NOT NULL,
  `is_solved` tinyint(1) NOT NULL,
  `review_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `solve_vote`
--

CREATE TABLE `solve_vote` (
  `solve_vote_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prb_id` int(11) NOT NULL,
  `vote` tinyint(1) NOT NULL,
  `vote_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `solve_vote`
--

INSERT INTO `solve_vote` (`solve_vote_id`, `user_id`, `prb_id`, `vote`, `vote_date`) VALUES
(11, 7, 1, 1, '2023-07-17 18:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(1, 'Dhaka'),
(2, 'Chittagong'),
(3, 'Rajshahi'),
(4, 'Khulna'),
(5, 'Barisal'),
(6, 'Sylhet'),
(7, 'Rangpur'),
(8, 'Mymensingh');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `name`, `category_id`) VALUES
(1, 'Damaged Road', 1),
(2, 'Damaged Vehicles', 1),
(3, 'Traffic Jam', 1),
(4, 'Lack of Roads', 1),
(5, 'Lack of Bridges', 1),
(6, 'Poor Drainage System', 1),
(7, 'Lack of Hospital/Health Center', 2),
(8, 'Lack of Educational Institute', 2),
(9, 'Lack of Park/Playground', 2),
(10, 'Poor Infrastructure', 2),
(11, 'Poor Hospital/Health Center facilities', 2),
(12, 'Poor Educational Institute Facilities', 2),
(13, 'Poor Playground/Park Management', 2),
(14, 'Plastic Factory', 3),
(15, 'Food Adulteration', 3),
(16, 'Price Hiking', 3),
(17, 'Deforestation', 4),
(18, 'Mosquito', 4),
(19, 'Dustbin (Cleanliness)', 4),
(20, 'Air', 5),
(21, 'Water', 5),
(22, 'Others', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `mobile_no` varchar(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  `address` varchar(150) NOT NULL,
  `nid` varchar(20) NOT NULL,
  `state` varchar(30) NOT NULL,
  `area` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `user_medianame` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `full_name`, `user_name`, `email`, `mobile_no`, `password`, `address`, `nid`, `state`, `area`, `district`, `user_medianame`) VALUES
(2, 'Tawhid Mirza Mahib', 'mirzatawhid', 'mahib@gmail.com', '1222333111', '12345678', '21/ Mohiuddin Lane', '123456789', 'Chawkbazar', 'Lalbag', 'Dhaka', NULL),
(3, 'Akash', 'akash', 'akash@gmail.com', '01887799445', '1234', 'Jagannath University', '123456789', 'Lokkhibazar', 'Dhaka', 'Dhaka', NULL),
(6, 'Mirza Ali Sultan', 'mirzasultan', 'sultan@gmail.com', '01924496919', '12345678', 'Imamgonj', '1122334455', 'Chawkbazar', 'Dhaka', 'Dhaka', NULL),
(7, 'Tawhid Mirza Mahib', 'admin', 'admin@gmail.com', '01222222222', '11223344', 'test', '12345678', '1', '1', '1', 'mahibdp.jpg'),
(8, 'Douglas Hamill', 'Braeden.Wehner90', 'your.email+fakedata55669@gmail.com', '258', 'XRXReyCh2DJO3BI', '20414 Roscoe Skyway', '61', '1', '2', '1', NULL),
(9, 'Rebekah Mayer', 'Hilbert.Padberg', 'your.email+fakedata97372@gmail.com', '542', 'UFiMKYNanlsMsYu', '968 Myra Stravenue', '110', '1', '3', '1', NULL),
(10, 'Fritz Welch', 'Kiara30', 'your.email+fakedata15837@gmail.com', '579', 'leKusBEiMnAkHMe', '55751 Kautzer Pine', '137', '1', '4', '1', NULL),
(11, 'Markus Gerhold', 'Dorthy26', 'your.email+fakedata58347@gmail.com', '316', 'A6OWTerNvt9DMDb', '54336 Velda Avenue', '545', '1', '5', '1', NULL),
(12, 'Cordie Mann', 'Mustafa_Marquardt54', 'your.email+fakedata59010@gmail.com', '139', 'G17FtUkigvrHN7K', '1561 Maurice Manors', '336', '1', '7', '1', NULL),
(13, 'Cameron Kirlin', 'Vita_Dach', 'your.email+fakedata60200@gmail.com', '379', 'sdgDvSB2qlvpTfm', '5867 Narciso Track', '645', '1', '14', '1', NULL),
(14, 'Keegan Lynch', 'Dixie_Will', 'your.email+fakedata11326@gmail.com', '61', 'T6_6KQsvuJZPJsQ', '3033 Waters Field', '21', '1', '25', '1', NULL),
(15, 'Prokash', 'prokash', 'prokash@gmail.com', '01234567890', '12345678', 'Jagannath University', '987456321', '1', '25', '1', 'mapping.png'),
(16, 'Abdul Karim', 'adbulkarim', 'abdul@gmail.com', '0165478l912', '12345678', 'Jagannath University', '87469213', '1', '25', '1', 'sagor.jpg'),
(17, 'Maria Aktar Abin', 'admin2', 'admin2@gmail.com', '01234567821', '11223344', 'Mohammadpur', '1111222233', '1', '1', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verified_list`
--

CREATE TABLE `verified_list` (
  `user_id` int(11) NOT NULL,
  `prb_id` int(11) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `verify_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verify_vote`
--

CREATE TABLE `verify_vote` (
  `verify_vote_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prb_id` int(11) NOT NULL,
  `vote` tinyint(1) NOT NULL,
  `vote_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approve_vote`
--
ALTER TABLE `approve_vote`
  ADD PRIMARY KEY (`approve_vote_id`),
  ADD KEY `approve_vote_prb_cons` (`prb_id`),
  ADD KEY `approve_vote_user_cons` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_constraint` (`district_id`);

--
-- Indexes for table `complaint_list`
--
ALTER TABLE `complaint_list`
  ADD PRIMARY KEY (`prb_id`),
  ADD KEY `user_cons` (`user_id`),
  ADD KEY `state_cons` (`prb_state`),
  ADD KEY `district_cons` (`prb_district`),
  ADD KEY `area_cons` (`prb_area`),
  ADD KEY `category_cons` (`category`),
  ADD KEY `subcategory_cons` (`sub_category`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `forum_comment`
--
ALTER TABLE `forum_comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comment_prb` (`prb_id`),
  ADD KEY `coomet_user` (`user_id`);

--
-- Indexes for table `reviewed_list`
--
ALTER TABLE `reviewed_list`
  ADD KEY `rev_prb` (`prb_id`),
  ADD KEY `rev_user` (`user_id`);

--
-- Indexes for table `solve_vote`
--
ALTER TABLE `solve_vote`
  ADD PRIMARY KEY (`solve_vote_id`),
  ADD KEY `solve_vote_prb_cons` (`prb_id`),
  ADD KEY `solve_vote_user_cons` (`user_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `MOBILE_UNIQUE` (`mobile_no`),
  ADD UNIQUE KEY `USERNAME_UNIQUE` (`user_name`) USING BTREE;

--
-- Indexes for table `verified_list`
--
ALTER TABLE `verified_list`
  ADD KEY `ver_prb` (`prb_id`),
  ADD KEY `ver_user` (`user_id`);

--
-- Indexes for table `verify_vote`
--
ALTER TABLE `verify_vote`
  ADD PRIMARY KEY (`verify_vote_id`),
  ADD KEY `verify_vote_prb_cons` (`prb_id`),
  ADD KEY `verify_vote_user_cons` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approve_vote`
--
ALTER TABLE `approve_vote`
  MODIFY `approve_vote_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=486;

--
-- AUTO_INCREMENT for table `complaint_list`
--
ALTER TABLE `complaint_list`
  MODIFY `prb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `forum_comment`
--
ALTER TABLE `forum_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `solve_vote`
--
ALTER TABLE `solve_vote`
  MODIFY `solve_vote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `verify_vote`
--
ALTER TABLE `verify_vote`
  MODIFY `verify_vote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `approve_vote`
--
ALTER TABLE `approve_vote`
  ADD CONSTRAINT `approve_vote_prb_cons` FOREIGN KEY (`prb_id`) REFERENCES `complaint_list` (`prb_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `approve_vote_user_cons` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `district_constraint` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`);

--
-- Constraints for table `complaint_list`
--
ALTER TABLE `complaint_list`
  ADD CONSTRAINT `area_cons` FOREIGN KEY (`prb_area`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_cons` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `district_cons` FOREIGN KEY (`prb_district`) REFERENCES `districts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `state_cons` FOREIGN KEY (`prb_state`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subcategory_cons` FOREIGN KEY (`sub_category`) REFERENCES `sub_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_cons` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `forum_comment`
--
ALTER TABLE `forum_comment`
  ADD CONSTRAINT `comment_prb` FOREIGN KEY (`prb_id`) REFERENCES `complaint_list` (`prb_id`),
  ADD CONSTRAINT `coomet_user` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`);

--
-- Constraints for table `reviewed_list`
--
ALTER TABLE `reviewed_list`
  ADD CONSTRAINT `rev_prb` FOREIGN KEY (`prb_id`) REFERENCES `complaint_list` (`prb_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rev_user` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `solve_vote`
--
ALTER TABLE `solve_vote`
  ADD CONSTRAINT `solve_vote_prb_cons` FOREIGN KEY (`prb_id`) REFERENCES `complaint_list` (`prb_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solve_vote_user_cons` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `verified_list`
--
ALTER TABLE `verified_list`
  ADD CONSTRAINT `ver_prb` FOREIGN KEY (`prb_id`) REFERENCES `complaint_list` (`prb_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ver_user` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `verify_vote`
--
ALTER TABLE `verify_vote`
  ADD CONSTRAINT `verify_vote_prb_cons` FOREIGN KEY (`prb_id`) REFERENCES `complaint_list` (`prb_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `verify_vote_user_cons` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
