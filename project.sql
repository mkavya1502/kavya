-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2023 at 04:25 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: 'Umkc'
--

-- --------------------------------------------------------

--
-- Table structure for table faculty
--

CREATE TABLE faculty (
  faculty_id int(11) NOT NULL,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  department varchar(255) NOT NULL,
  phone varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table faculty
--

INSERT INTO faculty (faculty_id, name, email, password, department, phone) VALUES
(1, 'test', 'test@gmail.com', '12345', 'my', '9090909090');

-- --------------------------------------------------------

--
-- Table structure for table jobs
--

CREATE TABLE jobs (
  id int(11) NOT NULL,
  jobtitle varchar(255) NOT NULL,
  graduation varchar(50) NOT NULL,
  skillrequired varchar(255) NOT NULL,
  graduateStd tinyint(1) NOT NULL,
  contact_details varchar(255) NOT NULL,
  profile text NOT NULL,
  company varchar(255) NOT NULL,
  place varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table jobs
--

INSERT INTO jobs (id, jobtitle, graduation, skillrequired, graduateStd, contact_details, profile, company, place) VALUES
(1, 'Engineer', 'BE', 'C,Java', 0, 'dkfkj', 'jkl', 'jlk', 'jk');

-- --------------------------------------------------------

--
-- Table structure for table job_applications
--

CREATE TABLE job_applications (
  id int(11) NOT NULL,
  job_id int(11) DEFAULT NULL,
  student_id int(11) DEFAULT NULL,
  apply_date date DEFAULT NULL,
  personal_info text DEFAULT NULL,
  resume text DEFAULT NULL,
  status tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table job_applications
--

INSERT INTO job_applications (id, job_id, student_id, apply_date, personal_info, resume, status) VALUES
(6, 1, 3, '2023-12-02', 'asdf', 'resume/CSEE GTA Application.docx', 1),
(7, 1, 4, '2023-12-02', 'asdf', 'resume/CSEE GTA Application.docx', 1);

-- --------------------------------------------------------

--
-- Table structure for table registration_table
--

CREATE TABLE registration_table (
  id int(11) NOT NULL,
  first_name varchar(50) NOT NULL,
  sur_name varchar(50) NOT NULL,
  student_id varchar(20) NOT NULL,
  umkc_email varchar(100) NOT NULL,
  current_level varchar(20) NOT NULL,
  semester varchar(20) NOT NULL,
  umkc_gps varchar(20) NOT NULL,
  hours_completed int(11) NOT NULL,
  undergraduate_degree varchar(50) NOT NULL,
  applying_for varchar(50) NOT NULL,
  email varchar(100) NOT NULL,
  password varchar(255) NOT NULL,
  age int(11) NOT NULL,
  date_of_birth date NOT NULL,
  phone varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table regstudent
--

CREATE TABLE regstudent (
  id int(11) NOT NULL,
  name varchar(255) NOT NULL,
  lastname varchar(255) NOT NULL,
  mailid varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  graduation_level varchar(50) NOT NULL,
  major varchar(255) NOT NULL,
  date_of_birth date NOT NULL,
  IntStudent tinyint(1) NOT NULL,
  toefl_score int(11) DEFAULT NULL,
  grad_asst_score int(11) DEFAULT NULL,
  phone varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table regstudent
--

INSERT INTO regstudent (id, name, lastname, mailid, password, graduation_level, major, date_of_birth, IntStudent, toefl_score, grad_asst_score, phone) VALUES
(3, 'test', 't', 'test@gmail.com', 'test', 'Graduate', 'Engineering', '2006-12-31', 1, 16, 9, '9090909090'),
(4, 'krish', 'k', 'krish@gmail.com', '123', 'Undergraduate', 'Computer Science', '2014-01-01', 1, 4, 34, '8932423423');

--
-- Indexes for dumped tables
--

--
-- Indexes for table faculty
--
ALTER TABLE faculty
  ADD PRIMARY KEY (faculty_id),
  ADD UNIQUE KEY email (email);

--
-- Indexes for table jobs
--
ALTER TABLE jobs
  ADD PRIMARY KEY (id);

--
-- Indexes for table job_applications
--
ALTER TABLE job_applications
  ADD PRIMARY KEY (id),
  ADD KEY job_id (job_id),
  ADD KEY student_id (student_id);

--
-- Indexes for table registration_table
--
ALTER TABLE registration_table
  ADD PRIMARY KEY (id);

--
-- Indexes for table regstudent
--
ALTER TABLE regstudent
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY mailid (mailid);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table faculty
--
ALTER TABLE faculty
  MODIFY faculty_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table jobs
--
ALTER TABLE jobs
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table job_applications
--
ALTER TABLE job_applications
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table registration_table
--
ALTER TABLE registration_table
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table regstudent
--
ALTER TABLE regstudent
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table job_applications
--
ALTER TABLE job_applications
  ADD CONSTRAINT job_applications_ibfk_1 FOREIGN KEY (job_id) REFERENCES jobs (id),
  ADD CONSTRAINT job_applications_ibfk_2 FOREIGN KEY (student_id) REFERENCES regstudent (id);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;