-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2023 at 09:32 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

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
(72, 'Sreepur', 5);

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
  `next_show_date` datetime DEFAULT NULL,
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
(1, 2, 'Buriganga', 1, 3, 'Babubazar Bridge', 1, 1, 1, '2023-07-10 21:10:05', 'very very very heavy traffic jam.', '2023-06-22 21:07:55', '2023-07-22 21:07:55', NULL, 1, 0, 'sdgs', 'gsgsg', 'sggsgs'),
(12, 7, 'Drainage', 1, 6, 'Imamgonj', 1, 1, 34, '2023-08-09 19:33:10', 'drain issue', NULL, NULL, NULL, 0, 0, 'Screenshot (42).png', 'image/png', 'Complaint_Media/64d39596d06a3_Screenshot (42).png'),
(13, 15, 'Broken Chair', 2, 12, 'Jagannath University', 1, 1, 25, '2023-08-20 13:13:12', 'There are some broken chairs in the VC room in the Dept of CSE at Jagannath University.', NULL, NULL, NULL, 0, 0, 'IMG_20230820_130654.jpg', 'image/jpeg', 'Complaint_Media/64e1bd08353ce_IMG_20230820_130654.jpg'),
(14, 15, 'Poor Wall Painting', 2, 10, 'Ahsan Manzil', 1, 1, 25, '2023-08-20 13:32:32', 'The wall Paint turns out to fade day by day. Authority should check the matter', NULL, NULL, NULL, 0, 0, 'ahsan.jpg', 'image/jpeg', 'Complaint_Media/64e1c19087ea4_ahsan.jpg');

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
(1, '2023-08-20 11:05:22', 1, 2, 'hello', 1, 0);

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
(7, 'admin', 'admin', 'admin@gmail.com', '01222222222', '11223344', 'test', '12345678', '1', '1', '1', 'peter.jpg'),
(8, 'Douglas Hamill', 'Braeden.Wehner90', 'your.email+fakedata55669@gmail.com', '258', 'XRXReyCh2DJO3BI', '20414 Roscoe Skyway', '61', '1', '2', '1', NULL),
(9, 'Rebekah Mayer', 'Hilbert.Padberg', 'your.email+fakedata97372@gmail.com', '542', 'UFiMKYNanlsMsYu', '968 Myra Stravenue', '110', '1', '3', '1', NULL),
(10, 'Fritz Welch', 'Kiara30', 'your.email+fakedata15837@gmail.com', '579', 'leKusBEiMnAkHMe', '55751 Kautzer Pine', '137', '1', '4', '1', NULL),
(11, 'Markus Gerhold', 'Dorthy26', 'your.email+fakedata58347@gmail.com', '316', 'A6OWTerNvt9DMDb', '54336 Velda Avenue', '545', '1', '5', '1', NULL),
(12, 'Cordie Mann', 'Mustafa_Marquardt54', 'your.email+fakedata59010@gmail.com', '139', 'G17FtUkigvrHN7K', '1561 Maurice Manors', '336', '1', '7', '1', NULL),
(13, 'Cameron Kirlin', 'Vita_Dach', 'your.email+fakedata60200@gmail.com', '379', 'sdgDvSB2qlvpTfm', '5867 Narciso Track', '645', '1', '14', '1', NULL),
(14, 'Keegan Lynch', 'Dixie_Will', 'your.email+fakedata11326@gmail.com', '61', 'T6_6KQsvuJZPJsQ', '3033 Waters Field', '21', '1', '25', '1', NULL),
(15, 'Prokash', 'prokash', 'prokash@gmail.com', '01234567890', '12345678', 'Jagannath University', '987456321', '1', '25', '1', 'mapping.png');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `complaint_list`
--
ALTER TABLE `complaint_list`
  MODIFY `prb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `forum_comment`
--
ALTER TABLE `forum_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `verify_vote`
--
ALTER TABLE `verify_vote`
  MODIFY `verify_vote_id` int(11) NOT NULL AUTO_INCREMENT;

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
