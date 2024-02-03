-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2024 at 11:51 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cai`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `AssessmentID` int(11) NOT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `AssessmentName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`AssessmentID`, `CourseID`, `AssessmentName`) VALUES
(1, 1, 'Database Programming'),
(2, 1, 'Software Engineering'),
(3, 1, 'Cyber Security'),
(4, 1, 'Mathematics Engineering'),
(5, 1, 'Computer');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(100) DEFAULT NULL,
  `CourseCode` varchar(20) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  `Semester` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`CourseID`, `CourseName`, `CourseCode`, `Department`, `Credits`, `Semester`) VALUES
(1, 'Computer Engineering', 'CE101', 'Engineering', 4, 1),
(2, 'Electronics', 'ELEC201', 'Engineering', 3, 2),
(3, 'Civil Engineering', 'CIV101', 'Engineering', 4, 1),
(4, 'Electrical Engineering', 'EE301', 'Engineering', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `EnrollmentID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `EnrollmentDate` date DEFAULT NULL,
  `EnrollmentStatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`EnrollmentID`, `StudentID`, `CourseID`, `EnrollmentDate`, `EnrollmentStatus`) VALUES
(1, 1, 1, '2023-01-01', 'Active'),
(2, 2, 1, '2023-01-01', 'Active'),
(3, 3, 1, '2023-01-01', 'Active'),
(4, 4, 1, '2023-01-01', 'Active'),
(5, 5, 1, '2023-01-01', 'Active'),
(6, 6, 1, '2023-01-02', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `ResultID` int(11) NOT NULL,
  `AssessmentID` int(11) DEFAULT NULL,
  `EnrollmentID` int(11) DEFAULT NULL,
  `Test1` int(11) DEFAULT NULL,
  `Test2` int(11) DEFAULT NULL,
  `Practical` int(11) DEFAULT NULL,
  `Assignment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`ResultID`, `AssessmentID`, `EnrollmentID`, `Test1`, `Test2`, `Practical`, `Assignment`) VALUES
(1, 1, 1, 15, 13, 18, 8),
(2, 1, 2, 12, 14, 16, 6),
(3, 1, 3, 10, 8, 17, 7),
(4, 1, 4, 10, 8, 19, 8),
(5, 1, 5, 10, 8, 19, 5),
(6, 1, 6, 10, 8, 10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `Email`, `DateOfBirth`, `Gender`, `ContactNumber`, `Address`, `Nationality`, `password`) VALUES
(1, 'John', 'Daudi', 'john@gmail.com', '1990-05-15', 'Male', '255654738219', 'Ferry', 'Tanzanian', 'john'),
(2, 'Jane', 'Luswaga', 'jane@gmail.com', '1992-08-22', 'Female', '255654738212', 'Magomeni', 'Tanzanian', 'jane'),
(3, 'Nasr', 'Simba', 'nasr@gmail.com', '1991-03-10', 'Male', '255654738217', 'Mbezi', 'Tanzanian', 'nasr'),
(4, 'Alice', 'John', 'alice@gmail.com', '1993-12-03', 'Female', '255654738213', 'Keko', 'Tanzanian', 'alice'),
(5, 'Adam', 'Juma', 'adam@gmail.com', '1994-06-28', 'Male', '255654738214', 'Msasani', 'Tanzanian', 'adam'),
(6, 'Eddy', 'Saleh', 'eddy@gmail.com', '2002-05-04', 'Male', '255654730000', 'Ferry', 'Tanzanian', 'eddy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`AssessmentID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`ResultID`),
  ADD KEY `AssessmentID` (`AssessmentID`),
  ADD KEY `EnrollmentID` (`EnrollmentID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessments`
--
ALTER TABLE `assessments`
  MODIFY `AssessmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `ResultID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessments`
--
ALTER TABLE `assessments`
  ADD CONSTRAINT `assessments_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`AssessmentID`) REFERENCES `assessments` (`AssessmentID`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`EnrollmentID`) REFERENCES `enrollments` (`EnrollmentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
