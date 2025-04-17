-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 17, 2025 at 01:42 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `present` bit(1) NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnq6vm31it076obtjf2qp5coim` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
CREATE TABLE IF NOT EXISTS `branch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_code` varchar(50) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKspmmcodjifhtymlws7w5fttgl` (`branch_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `branch_code`, `branch_name`) VALUES
(1, 'C04', 'Compuer Science And Engineering'),
(2, 'E01', 'Electrical Engineering'),
(3, 'C03', 'Civil Engineering'),
(4, 'E03', 'Electronics and Telecomm Engineering'),
(6, 'M02', 'Mechanical Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `aadhar_no` varchar(255) DEFAULT NULL,
  `caste_certificate_no` varchar(255) DEFAULT NULL,
  `income_certificate_no` varchar(255) DEFAULT NULL,
  `profile_id` varchar(255) DEFAULT NULL,
  `residence_certificate_no` varchar(255) DEFAULT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK4otsglrsxqejhphs5rp0u3w46` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `aadhar_no`, `caste_certificate_no`, `income_certificate_no`, `profile_id`, `residence_certificate_no`, `student_id`) VALUES
(1, '2323213', '31231233212323222222233223', 'c323c3123', 'Pr23213', '3213c21c3213', 1),
(2, '11122222', '44446d4f45f4', 'c48t8449438', 'Pr00311111', 'R2346875347', 2),
(3, '12345760235', 's57849344545', '567406779432224', 'rp44395', '567903430485', 3),
(16, '12345760234', '11111111', '567406779432224', 'rp44395', '567903430485', 4);

-- --------------------------------------------------------

--
-- Table structure for table `scholarship`
--

DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE IF NOT EXISTS `scholarship` (
  `scholarship_id` bigint NOT NULL AUTO_INCREMENT,
  `academic_year` varchar(10) NOT NULL,
  `application_no` varchar(255) NOT NULL,
  `application_status` varchar(50) NOT NULL,
  `application_type` varchar(255) NOT NULL,
  `entitlement_amount` double NOT NULL,
  `scholar_id` varchar(255) NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`scholarship_id`),
  UNIQUE KEY `UKihrmv9yl7c7n6715hlp6d81q5` (`application_no`),
  KEY `FKoblv2513tw4q1uq64tahn4rgf` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
CREATE TABLE IF NOT EXISTS `semester` (
  `semester_id` bigint NOT NULL AUTO_INCREMENT,
  `semester_name` varchar(50) NOT NULL,
  PRIMARY KEY (`semester_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semester_id`, `semester_name`) VALUES
(1, '1st Semester'),
(2, '2st Semester'),
(3, '3st Semester'),
(4, '4th Semester'),
(5, '5th Semester'),
(6, '6th Semester');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `admission_year` varchar(10) DEFAULT NULL,
  `caste` varchar(255) NOT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `fname` varchar(255) NOT NULL,
  `mobileno` bigint DEFAULT NULL,
  `rollno` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `branch_id` bigint NOT NULL,
  `semester_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKjt33lpp20calmulkar805v2m8` (`rollno`),
  KEY `FK1c2wse5ythrh0ip3hjmeelt7b` (`branch_id`),
  KEY `FK6a999b6blihn84apfk1sacgtv` (`semester_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `address`, `admission_year`, `caste`, `gmail`, `fname`, `mobileno`, `rollno`, `sname`, `branch_id`, `semester_id`) VALUES
(1, 'Infont of polytechnic college Damoh(M.P.)', '2022', 'OBC', 'dv754440@gmail.com', 'Mr. Aman Vishwaakarma', 9993971703, '22014C04003', 'Deepak Vishwakarma', 1, 2),
(2, 'Damoh', '2022', 'OBC', 'dv845@gmail.com', 'Mr. Aman Vishwakarma', 9856321478, '22014C04009', 'Manish Vishwakarma', 1, 2),
(3, 'satna m.p', '2022', 'OBC', 'dharmendra466874@gmail.com', 'Ramdeen singh', 7415297941, '22014C04004', 'Dharmendra singh', 1, 2),
(4, 'aam chopra Damoh', '2025', 'OBC', 'rahul@Gmail.com', 'rahul lodhi', 1234567892, '22014C04002', 'rohit lodhi', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aceess` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `aceess`, `password`, `username`) VALUES
(1, 'scholarship', '$2a$10$Pb77tnScsUuKGQYnH2P03.19z/QkZUtItSHbWyvQSG0h8rPGUjSQS', 'Manish'),
(2, 'admin', '$2a$10$nLU2JACBWBKSpDPXxAcsE.SXBAIxU02HdzozoAJ858Y3QFRxHhxmq', 'Govind'),
(3, 'admin', '$2a$10$x1ccYHNUy1USpCcdeCac2ep/3WpMxJ7j3/7FTRfrC96xbiT7M3INq', 'Deepak');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `FKnq6vm31it076obtjf2qp5coim` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `FK84f9wnmr26kfd9y9e711f01sq` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `scholarship`
--
ALTER TABLE `scholarship`
  ADD CONSTRAINT `FKoblv2513tw4q1uq64tahn4rgf` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK1c2wse5ythrh0ip3hjmeelt7b` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  ADD CONSTRAINT `FK6a999b6blihn84apfk1sacgtv` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
