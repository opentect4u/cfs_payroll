-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2024 at 01:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `md_bank`
--

CREATE TABLE `md_bank` (
  `sl_no` int(11) NOT NULL,
  `bank_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_bank`
--

INSERT INTO `md_bank` (`sl_no`, `bank_name`) VALUES
(1, 'Rampurhat ARDB');

-- --------------------------------------------------------

--
-- Table structure for table `md_basic_pay`
--

CREATE TABLE `md_basic_pay` (
  `effective_dt` date NOT NULL,
  `emp_cd` int(11) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `band_pay` decimal(10,2) NOT NULL,
  `grade_pay` decimal(10,2) NOT NULL,
  `ir_amt` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_branch`
--

CREATE TABLE `md_branch` (
  `id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) NOT NULL,
  `modified_dt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `md_branch`
--

INSERT INTO `md_branch` (`id`, `bank_id`, `branch_name`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(101, 1, 'Rapurhat HO', '', '2024-07-18 12:15:02', '', '2024-07-18 12:15:02'),
(102, 1, 'Mollarpur', '', '2024-07-18 12:15:02', '', '2024-07-18 12:15:02'),
(103, 1, 'Murarai', '', '2024-07-18 12:15:02', '', '2024-07-18 12:15:02'),
(104, 1, 'Nalhati', '', '2024-07-18 12:15:02', '', '2024-07-18 12:15:02');

-- --------------------------------------------------------

--
-- Table structure for table `md_caste`
--

CREATE TABLE `md_caste` (
  `id` int(11) NOT NULL,
  `caste` varchar(50) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_caste`
--

INSERT INTO `md_caste` (`id`, `caste`, `created_by`, `created_dt`, `modified_by`, `modified_at`) VALUES
(1, 'GENARAL', NULL, NULL, NULL, NULL),
(2, 'MUSLIM', NULL, NULL, NULL, NULL),
(3, 'ST', NULL, NULL, NULL, NULL),
(4, 'SC', NULL, NULL, NULL, NULL),
(6, 'OBC', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_category`
--

CREATE TABLE `md_category` (
  `id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `da` float(10,2) NOT NULL,
  `sa` float(10,2) NOT NULL,
  `hra` float(10,2) NOT NULL,
  `hra_max` float(10,2) NOT NULL,
  `pf` float(10,2) NOT NULL,
  `pf_max` float(10,2) NOT NULL,
  `pf_min` float(10,2) NOT NULL,
  `ta` float(10,2) NOT NULL,
  `ma` float(10,2) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_category`
--

INSERT INTO `md_category` (`id`, `bank_id`, `category`, `da`, `sa`, `hra`, `hra_max`, `pf`, `pf_max`, `pf_min`, `ta`, `ma`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 1, 'Permanent', 117.10, 0.00, 10.00, 0.00, 12.00, 0.00, 0.00, 0.00, 700.00, 'sss', '2023-04-21 10:21:50', 'akter', '2023-12-20 05:40:11'),
(2, 1, 'Temporary', 0.00, 0.00, 0.00, 0.00, 5.00, 0.00, 0.00, 0.00, 0.00, 'sss', '2022-09-15 02:28:31', 'akter', '2023-12-19 06:26:30'),
(3, 1, 'SPECIAL II', 197.76, 0.00, 9.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 'akter', '2023-06-22 11:31:43', 'akter', '2023-11-13 07:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `md_department`
--

CREATE TABLE `md_department` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `md_department`
--

INSERT INTO `md_department` (`id`, `name`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Manager (Admin)  (Grade-IA)', '2023-05-17 10:58:08', 'ardb_admin', '2023-11-21 10:40:15', 'akter'),
(2, 'Accountant Manager (ADMI) (Grade-IA)', '2023-05-17 10:58:16', 'ardb_admin', '2023-06-22 07:49:13', 'akter'),
(3, 'Field Executive Officer (Grade-IIA)', '2023-05-17 10:58:27', 'ardb_admin', '2023-06-22 07:51:22', 'akter'),
(4, 'Accountant (Grade-IIA)', '2023-05-17 10:58:50', 'ardb_admin', '2023-06-22 07:52:27', 'akter'),
(5, 'Accountant (Deposit Section) (Grade-IIB)', '2023-05-17 10:59:07', 'ardb_admin', '2023-06-22 07:53:44', 'akter'),
(6, 'Field Officer (Grade-IIB)', '2023-05-17 10:59:17', 'ardb_admin', '2023-06-22 07:54:12', 'akter'),
(7, 'Field Supervisor (Grade-III)', '2023-05-17 10:59:30', 'ardb_admin', '2023-05-25 04:43:11', 'ardb_admin'),
(8, 'Cashier (Grade-IIB)', '2023-05-17 11:00:28', 'ardb_admin', '2023-10-12 11:59:46', 'akter'),
(9, 'Office Assistant (Grade-III)', '2023-05-17 11:00:54', 'ardb_admin', '2023-05-25 04:43:01', 'ardb_admin'),
(10, 'Office Peon (Grade-IV)', '2023-05-17 11:01:04', 'ardb_admin', '2023-05-25 04:42:52', 'ardb_admin'),
(11, 'BRANCH MANGER(GRADE IIA)', '2023-09-15 06:03:39', 'akter', '2023-09-15 08:30:22', 'akter'),
(12, 'LOAN OFFICER (GRADE IIB)', '2023-09-15 06:04:08', 'akter', '2023-09-15 08:31:21', 'akter'),
(13, 'BRANCH CASHIER (GRADE III)', '2023-09-15 06:04:39', 'akter', '2023-09-15 08:32:03', 'akter'),
(14, 'BRANCH ACCOUNTANT (GRADE IIB)', '2023-09-15 07:31:24', 'akter', '2023-09-15 08:32:28', 'akter');

-- --------------------------------------------------------

--
-- Table structure for table `md_designation`
--

CREATE TABLE `md_designation` (
  `sl_no` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `srl_no` int(5) NOT NULL,
  `grade_pay` varchar(55) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_designation`
--

INSERT INTO `md_designation` (`sl_no`, `bank_id`, `designation`, `srl_no`, `grade_pay`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 1, 'CEO', 0, '', NULL, NULL, 'sss', '2024-07-22 08:33:09'),
(2, 1, 'MANAGER', 0, '', NULL, NULL, NULL, NULL),
(3, 1, 'ASST. MANAGER', 0, '', NULL, NULL, NULL, NULL),
(4, 1, 'CHIEF ACCOUNTANT', 0, '', NULL, NULL, NULL, NULL),
(5, 1, 'BR. MANAGER', 0, '', NULL, NULL, NULL, NULL),
(6, 1, 'ACCOUNTANT-I', 0, '', NULL, NULL, NULL, NULL),
(7, 1, 'FIELD OFFICER', 0, '', NULL, NULL, NULL, NULL),
(8, 1, 'CASHIER', 0, '', NULL, NULL, NULL, NULL),
(9, 1, 'SUPERVISOR', 0, '', NULL, NULL, NULL, NULL),
(10, 1, 'ASST./SUPERVISOR', 0, '', NULL, NULL, NULL, NULL),
(14, 1, 'LEDGER KEEPER', 0, '', NULL, NULL, NULL, NULL),
(15, 1, 'RECORD KEEPER', 0, '', NULL, NULL, NULL, NULL),
(16, 1, 'OFF. PEON', 0, '', NULL, NULL, NULL, NULL),
(17, 1, 'GROUP-D', 0, '', NULL, NULL, NULL, NULL),
(18, 1, 'ACCOUNTANT-II', 0, '', NULL, NULL, NULL, NULL),
(19, 1, 'GRADE-IIB', 0, '', NULL, NULL, NULL, NULL),
(20, 1, 'CLERK', 8, '', NULL, NULL, NULL, NULL),
(21, 1, 'ACCOUNTANT', 0, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_district`
--

CREATE TABLE `md_district` (
  `district_code` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL,
  `dist_sort_code` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `md_district`
--

INSERT INTO `md_district` (`district_code`, `district_name`, `dist_sort_code`) VALUES
(326, 'BANKURA', 'BNK'),
(327, 'DARJEELING', 'DAR'),
(328, 'JALPAIGURI', 'JPG'),
(329, 'COOCH BEHAR', 'COOH'),
(330, 'UTTAR DINAJPUR', 'NDNJ'),
(331, 'DAKSHIN DINAJPUR', 'SDNJ'),
(332, 'MALDAH', 'MLD'),
(333, 'MURSHIDABAD', 'MUR'),
(334, 'BIRBHUM', 'BRH'),
(335, 'PURBA BARDHAMAN', 'EBDN'),
(336, 'NADIA', 'NDA'),
(337, 'NORTH TWENTY FOUR PARGANAs', 'N24'),
(338, 'HOOGHLY', 'HOG'),
(339, 'BURDWAN', 'BM'),
(340, 'PURULIA', 'PUR'),
(341, 'HOWRAH', 'HWH'),
(342, 'KOLKATA', 'KOL'),
(343, 'SOUTH TWENTY FOUR PARGANAs', 'S24'),
(344, 'PASCHIM MIDNAPORE', 'WMDN'),
(345, 'PURBA MIDNAPORE', 'EMDN'),
(346, 'ALIPURDUAR', 'ALPD'),
(347, 'PASCHIM BARDHAMAN', 'WBDN'),
(348, 'JHARGRAM', 'JHG');

-- --------------------------------------------------------

--
-- Table structure for table `md_employee`
--

CREATE TABLE `md_employee` (
  `bank_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `emp_code` int(11) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `father_name` varchar(50) DEFAULT NULL,
  `emp_sex` enum('M','F','O') NOT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `emp_catg` int(11) NOT NULL,
  `caste` int(11) NOT NULL,
  `pi_no` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `join_dt` date DEFAULT NULL,
  `ret_dt` date DEFAULT NULL,
  `designation` int(11) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phn_no` varchar(14) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pan_no` varchar(50) DEFAULT NULL,
  `aadhar_no` varchar(50) DEFAULT NULL,
  `emp_addr` text DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `bank_ac_no` varchar(50) DEFAULT NULL,
  `pf_ac_no` varchar(50) DEFAULT NULL,
  `UAN` varchar(25) DEFAULT NULL,
  `basic_pay` decimal(10,2) DEFAULT 0.00,
  `hra_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `pf_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `cash_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `food_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `emp_status` char(1) DEFAULT 'A' COMMENT 'R=>Retired,A=>Active,S=>Suspended,RG=>Resigned',
  `nominee` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `md_employee`
--

INSERT INTO `md_employee` (`bank_id`, `branch_id`, `emp_code`, `emp_name`, `father_name`, `emp_sex`, `qualification`, `emp_catg`, `caste`, `pi_no`, `dob`, `join_dt`, `ret_dt`, `designation`, `department`, `phn_no`, `email`, `pan_no`, `aadhar_no`, `emp_addr`, `bank_name`, `bank_ac_no`, `pf_ac_no`, `UAN`, `basic_pay`, `hra_flag`, `pf_flag`, `cash_flag`, `food_flag`, `emp_status`, `nominee`, `remarks`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 101, 1, 'SRI ASIM RAY', 'LT.ASHUTOSH RAY', 'M', 'Master Degree', 1, 1, 'AGRI/WB/60143', '1958-07-13', '2014-06-28', '2018-07-31', 1, '', '', '', 'AKAPS7848C', '', 'PERMANENT:37/1,A.K.DEVI ROAD\nP.O.-.NAIHATI,PIN-743165\nPRESENT;DUCKBHUGLOWPARA,RAMPURHAT.', '', '2452', '', '', 21370.00, 'Y', 'Y', 'N', 'N', 'I', 'ANISH RAY -NEPHEW', '', 'sss', '2024-07-23 00:00:00', 'sss', '2016-03-22 00:00:00'),
(1, 101, 2, 'HEBJER ALI', 'LT.KHADEM ALI', 'M', 'Graduate', 1, 2, 'RD-4005,S.B.-4804', '1952-01-15', '1975-10-21', '2012-01-31', 2, '', '', '', '', '', 'VILL-BAHINA MORE,MOLLARPUR\nDIST-BIRBHUM', '', '207', '', '', 4180.00, 'Y', 'Y', 'N', 'N', 'R', '', '', 'sss', '2010-06-24 00:00:00', 'sss', '2012-02-21 00:00:00'),
(1, 101, 3, 'PARTHA CHATTERJEE', 'LT.BENILAL CHATTERJEE', 'M', 'Graduate', 1, 1, 'RD.NO.4013,S.B.-107876', '1952-05-19', '1980-01-29', '2012-05-31', 3, '', '', '', '', '', 'COLLEGE ROAD,SAINTHIA, WARD NO.14\nDIST-BIRBHUM', '', '293', '', '', 15840.00, 'Y', 'Y', 'N', 'N', 'I', 'SANDHYA CHATTERJEE', '', 'sss', '2010-06-24 00:00:00', 'sss', '2012-02-22 00:00:00'),
(1, 101, 4, 'SAMIR KUMAR BANERJEE', 'LT.NRISINGHA PR.BANERJEE', 'M', 'Hons. Graduate', 1, 1, 'R.D-4018,S.B.-107879', '1954-01-03', '1980-02-11', '2014-01-31', 3, '', '', '', '', '', 'HARISABHAPARA,,WARD NO.-12\nP.O.-RAMPURHAT,DIST-BIRBHUM', '', '1012', '', '', 16400.00, 'Y', 'Y', 'N', 'N', 'I', 'BISAKHA BANERJEE', '', 'sss', '2010-06-24 00:00:00', 'sss', '2013-06-19 00:00:00'),
(1, 101, 5, 'BABURAM MODAK', 'LT.TAMAL KRISHNA MODAK', 'M', 'Graduate', 1, 5, 'RD-4006,S.B.-106503', '1958-04-06', '1980-04-28', '2018-04-30', 2, '', '', '', '', '', 'SUKANTAPALLY,NISCHINTAPUR,WARD NO.-17\nP.O.-RAMPURHAT,DIST-BIRBHUM', '', '237', '', '', 19920.00, 'Y', 'Y', 'N', 'N', 'A', 'SHAMPA MODAK (WIFE)', '', 'sss', '2010-06-24 00:00:00', 'sss', '2018-05-21 00:00:00'),
(1, 101, 6, 'HARAN CHANDRA ROY', 'LT.GOVINDA ROY', 'M', 'Graduate', 1, 3, 'R.D-4019,S.B-106507', '1952-06-17', '1980-04-28', '2012-06-30', 2, '', '', '', 'ACY PR 5769F', '', 'VILL-CHAKLAMAATH,WARD NO.-16\nP.O.-RAMPURHAT,DIST-BIRBHUM', '', '197', '', '', 16000.00, 'Y', 'Y', 'N', 'N', 'R', 'LIPIKA ROY', '', 'sss', '2010-06-24 00:00:00', 'sss', '2012-07-24 00:00:00'),
(1, 101, 7, 'KRISHNAMOY DEY', '', 'M', 'Graduate', 1, 1, 'R.D-4017,S.B-107882', '1951-09-09', '1981-07-27', '2011-09-30', 7, '', '', '', 'ADGDD 61196', '', 'CHALDHOWANI UTTAR PAR,WARD NO.13\nP.O.-RAMPURHAT,DIST-BIRBHUM', '', '109', '', '', 3350.00, 'Y', 'Y', 'N', 'Y', 'R', '', '', 'sss', '2010-06-24 00:00:00', 'sss', '2011-11-24 00:00:00'),
(1, 101, 8, 'SOUMYA BANERJEE', 'ASOKE KUMAR BANERJEE', 'M', 'Master Degree', 1, 1, '', '1977-12-29', '2010-06-15', '1937-12-31', 16, '', '', '', '', '', '35/4/C/1,MIRPARA,BAIDYABATI\nP.O.-BAIDYABATI,DIST-HOOGHLY', '', '1589', '', '', 11680.00, 'Y', 'Y', 'N', 'Y', 'A', 'ASOKE KUMAR BANERJEE', '', 'sss', '2003-01-01 00:00:00', 'sss', '2020-09-28 00:00:00'),
(1, 101, 9, 'MD.ENAMUL HAK', 'LT.FARID SK.', 'M', '12th Stanard', 1, 2, 'S.B-4808 & R.D-4014', '1951-01-16', '1975-12-12', '2011-01-31', 15, '', '', '', 'ABK PH 9932M', '', 'VILL-SANGHATAPARA\nP.O.-RAMPURHAT', '', '', '', '', 3350.00, 'Y', 'Y', '', '', 'R', 'TOHIDA KHATUN', '', 'sss', '2003-01-01 00:00:00', 'sss', '2011-11-24 00:00:00'),
(1, 101, 10, 'SWAPAN KUMAR MUKHERJEE', 'LT.PANCHANAN MUKHERJEE', 'M', '12th Stanard', 1, 1, 'S.B-5657 & R.D-4015', '1954-10-18', '1980-11-14', '2014-10-31', 15, '', '', '', '', '', 'VILL-SANGHATAPARA\nP.O.-RAMPURHAT ,WARD NO.6', '', '', '', '', 14160.00, 'Y', 'Y', '', '', 'A', '', '', 'sss', '2003-01-01 00:00:00', 'sss', '2013-06-19 00:00:00'),
(1, 101, 11, 'KARUNA SINDHU DAS', 'LT.DIBAKAR DAS', 'M', 'Graduate', 1, 5, 'S.B.-5879 & R.D-4007', '1956-03-22', '1981-08-05', '2016-03-31', 3, '', '', '', 'AHAPD 0201B', '', 'VILL-TALBONA PUKUR PURBA PAR,\nWARD NO.-15, P.O.-RAMPURHAT ', '', '236', '', '', 15840.00, 'Y', 'Y', '', 'Y', 'I', '', '', 'sss', '2003-01-01 00:00:00', 'sss', '2014-03-14 00:00:00'),
(1, 101, 12, 'SHANTIMOY MONDAL', 'LT.DHANAPATI MONDAL', 'M', '12th Stanard', 1, 3, 'S.B.-6419 & R.D-4008', '1954-02-02', '1983-03-01', '2014-02-28', 3, '', '', '', 'AEPPM 4038M', '', 'VILL-TARACHI\nP.O.-KANACHI', '', '', '', '', 14720.00, 'Y', 'Y', '', 'N', 'A', '', '', 'sss', '2003-01-01 00:00:00', 'sss', '2013-06-19 00:00:00'),
(1, 101, 13, 'MANGAL CHARAN BANERJEE', 'LT.UMAKALI BANDYAPADHYAY', 'M', 'Graduate', 1, 1, 'S.B-5584 & R.D.-4012', '1953-03-21', '1980-04-25', '2013-03-31', 3, '', '', '', 'ADVPB 42076', '', 'VILL-NISCHINTAPUR PURBA,WARD NO.-3\nP.O.-RAMPURHAT ', '', '', '', '', 15840.00, 'Y', 'Y', '', '', 'A', '', '', 'sss', '2003-01-01 00:00:00', 'sss', '2012-02-22 00:00:00'),
(1, 101, 14, 'JYOTIPRAKASH CHAKRABARTY', 'LT.JAGESHWAR CHAKRABARTY', 'M', '12th Stanard', 1, 1, 'S.B.-5649 & R.D-4016', '1957-01-01', '1980-08-29', '2017-01-31', 18, '', '', '', '', '', '', '', '', '', '', 14160.00, 'Y', 'Y', '', '', 'A', 'DIPALI CHAKRABARTY', '', 'sss', '2003-01-01 00:00:00', 'sss', '2013-06-19 00:00:00'),
(1, 101, 15, 'FINE MARDI', 'LT.DHAJU MARDI', 'M', '10th Stanard', 1, 4, 'S.B-4810 & 4011', '1954-04-02', '1977-05-01', '2014-04-30', 7, '', '', '', 'AELPM 7693E', '', 'VILL-NALHATI BAZAR,\nP.O.-NALHATI', '', '', '', '', 14160.00, 'Y', 'Y', '', 'Y', 'A', '', '', 'sss', '2003-01-01 00:00:00', 'sss', '2013-06-19 00:00:00'),
(1, 101, 16, 'MANIK CHANDRA PANDA', 'LT.SHIBKINKAR PANDA', 'M', 'Graduate', 1, 1, 'S,B,-9107 & R.D-4040', '1957-01-04', '1989-01-18', '2017-01-31', 7, '', '', '', 'AFZ PP 5264P', '', 'VILL-DALIMBA.P.O.-B.BHATRA, BIRBHUM', '', '', '', '', 13600.00, 'Y', 'Y', '', 'Y', 'A', '', '', 'sss', '2003-01-01 00:00:00', 'sss', '2013-06-19 00:00:00'),
(1, 101, 17, 'PRADIP KUMAR OJHA', 'LT.BISWANATH OJHA', 'M', 'Graduate', 1, 1, 'S,B-5587 & R.D-4009', '1953-07-20', '1980-01-25', '2013-07-31', 3, '', '', '', '', '', 'VILL-ARUNACHAL COLONY,NALHATI\nP.O.-NALHATI T.S. ', '', '', '', '', 3830.00, 'Y', 'Y', '', 'Y', 'A', '', '', 'sss', '2003-01-01 00:00:00', 'sss', '2003-01-01 00:00:00'),
(1, 101, 18, 'AJIT KUMAR RABIDAS', 'ASWINI KUMAR RABIDAS', 'M', 'Graduate', 1, 3, 'S.B.-9106 & R.D-4038', '1958-03-22', '1989-01-19', '2018-03-31', 15, '', '', '', 'ADKPR 7911A', '', 'VILL-BHADISWAR\nP.O.-MURARAI', '', '', '', '', 13600.00, 'Y', 'Y', '', '', 'A', '', '', 'sss', '2010-07-15 00:00:00', 'sss', '2013-06-19 00:00:00'),
(1, 101, 19, 'SKYRES BOL GOLAM', 'MAMLOT HOSSAIN', 'M', 'Graduate', 1, 2, 'S.B-9105 & R.D.-4039', '1957-02-06', '1989-01-19', '2017-02-28', 4, '', '', '', 'AEX PG 4761P', '', 'MURARAI HOSPITAL,MURARAI\nP.O.-MURARAI', '', '238', '', '', 15840.00, 'Y', 'Y', '', 'N', 'I', 'HASIDA BEGAM(WIFE)', '', 'sss', '2010-07-15 00:00:00', 'sss', '2014-11-24 00:00:00'),
(1, 101, 20, 'REBINA YEASMIN', 'IDRISH ALI', 'F', 'Graduate', 1, 2, 'XXX', '1984-05-21', '2012-02-01', '1944-05-31', 11, '', '', '', '', '', 'VILL-DUNA\nP.O.-ULKUNDA, P.S-MAYURESWAR,DIST-BIRBHUM', '', '101801573', '', '', 7000.00, 'Y', 'N', 'N', 'N', 'I', 'IDRISH ALI', '', 'sss', '2012-02-18 00:00:00', 'sss', '2023-09-26 00:00:00'),
(1, 101, 21, 'SAMIR KUMAR SHARMA', 'HARI PROSAD SHARMA', 'M', '8th Stanard', 1, 1, 'XX', '1977-01-16', '2012-02-01', '1937-01-31', 14, '', '', '', '', '', 'VILL-NALHATI T.S\nP.O.+P.S-NALHATI T.S, DIST-BIRBHUM', '', '1903', '', '', 5725.00, 'Y', 'N', 'N', 'N', 'I', 'SURYA SHARMA', '', 'sss', '2012-02-18 00:00:00', 'sss', '2020-09-28 00:00:00'),
(1, 101, 22, 'SUJIT HAZRA', 'LT.LACHHU HAZRA', 'M', '8th Stanard', 1, 4, 'XX', '1978-05-31', '2012-02-01', '1938-05-31', 14, '', '', '', '', '', 'VILL-HARIJANPALLY,WARD NO.-4\nP.O.-RAMPURHAT ,DIST-BIRBHUM', '', '101100917', '', '', 5850.00, 'Y', 'N', 'N', 'N', 'A', 'NN', '', 'sss', '2012-02-18 00:00:00', 'sss', '2024-02-28 00:00:00'),
(1, 101, 23, 'PRABIR KUMAR DEY', 'LT.TARAPADA DEY', 'M', 'Graduate', 1, 1, 'XX', '1980-01-03', '2012-02-01', '1940-01-31', 14, '', '', '', '', '', 'VILL-CHAKLAMAATH,RAMPURHAT ,WARD -16\nCOLLEGE PARA,P.O-RAMPURHAT,DIST-BIRBHUM', '', '646', '', '', 5725.00, 'Y', 'Y', 'N', 'N', 'I', 'REKHA DEY', '', 'sss', '2012-02-18 00:00:00', 'sss', '2020-09-28 00:00:00'),
(1, 101, 24, 'MIHIR MONDAL', 'LT.CHANDRA BHUSAN MONDAL', 'M', '8th Stanard', 1, 3, '0', '1960-02-09', '2012-02-01', '2020-02-29', 14, '', '', '', '', '', 'VILL-RATMA\nP.O.-DAKSHINGRAM, DIST-BIRBHUM', '', '', '', '', 4635.00, 'Y', 'Y', 'N', 'N', 'I', 'LAKSHMI MONDAL-WIFE', '', 'sss', '2012-02-21 00:00:00', 'sss', '2017-02-23 00:00:00'),
(1, 101, 25, 'ASIM KR.BHATTACHARYYA', 'LT.DHANAJOY BHATTACHARYYA', 'M', '10th Stanard', 1, 1, '', '1972-03-06', '2012-02-01', '1932-03-31', 14, '', '', '', '', '', 'VILL-KANDIARA, P.O.-SEKHPUR\nP.S-MAYURESWAR,DIST-BIRBHUM', '', '2397', '', '', 5265.00, 'Y', 'Y', 'N', 'N', 'A', 'SHIPRA BHATTACHARYYA- WIFE', '', 'sss', '2012-02-22 00:00:00', 'sss', '2021-02-22 00:00:00'),
(1, 101, 26, 'SAMINA PARVIN', 'SK FAZLE RAHAMAN', 'F', 'Hons. Graduate', 1, 2, '', '1981-05-01', '2012-12-26', '1941-05-31', 18, '', '', '', '', '', 'ILORA,MADRASHA ROAD,SONATORPARA\nP.O.-SURI ,DIST-BIRBHUM,731101', '', '101802252', '', '', 8940.00, 'Y', 'Y', 'N', 'N', 'A', 'ABU NASIR-HUSBAND', '', 'sss', '2013-01-08 00:00:00', 'sss', '2023-09-26 00:00:00'),
(1, 101, 27, 'RIKTA NANDI', 'GANGESH NARAYAN NANDI', 'F', 'Hons. Graduate', 1, 5, '', '1981-01-11', '2012-12-27', '1941-01-31', 16, '', '', '', '', '', 'VII-DUBRAJPUR,P.O.-DUBRAJPUR\nDIST-BIRBHUM (ASHRAMMORE)\nPIN-731123', '', '101802239', '', '', 8940.00, 'Y', 'Y', 'N', 'N', 'I', 'RAJIB SAHA-HUSBAND', '', 'sss', '2013-01-08 00:00:00', 'sss', '2023-09-26 00:00:00'),
(1, 101, 28, 'MD.SERAJUL ISLAM', 'MD.KADAM ROSUL', 'M', 'Graduate', 1, 2, '', '1989-10-05', '2012-12-27', '1949-10-31', 16, '', '', '', '', '', 'VILL +P.O.-NINGHA,P.S-MARGRAM\nDIST-BIRBHUM.PIN-731224', '', '101802245', '', '', 8940.00, 'Y', 'Y', 'N', 'N', 'I', 'ABDUL KUDDUS-ELDER BROTHER', '', 'sss', '2013-01-08 00:00:00', 'sss', '2023-09-26 00:00:00'),
(1, 101, 29, 'KIRAN SAHA', 'HARADHAN SAHA', 'M', 'Graduate', 1, 5, '', '1987-05-12', '2013-01-07', '1947-05-31', 7, '', '', '', '', '', 'VILL-KISHORPUR, P.O.-PANCHGRAM\nDIST-MURSHIDABAD\nPIN-742184', '', '101802244', '', '', 8940.00, 'Y', 'Y', 'N', 'N', 'A', 'SHEFALI SAHA', '', 'sss', '2013-01-08 00:00:00', 'sss', '2023-09-26 00:00:00'),
(1, 101, 30, 'UTPAL PATUA', 'MANTU PATUA', 'M', 'Graduate', 1, 4, '0', '1979-04-22', '2012-12-26', '1939-04-30', 8, '', '', '', '', '', 'VILL+P.O.-AYAS\nDIST-BIRBHUM ', '', 'xx', '', '', 4410.00, 'Y', 'Y', 'N', 'N', 'E', '', '', 'sss', '2013-02-23 00:00:00', 'sss', '2019-03-27 00:00:00'),
(1, 101, 31, 'ROBIN RAJAK', 'SAHADEV RAJAK', 'M', 'Graduate', 1, 3, '', '1987-08-11', '2012-12-26', '1947-08-31', 9, '', '', '', '', '', 'VILL-RAMPURHAT SUKANTAPALLY,\nWARD NO.-17,P.O.-RAMPURHAT,DIST-BIRBHUM', '', 'nn', '', '', 7470.00, 'Y', 'Y', 'N', 'Y', 'I', '', '', 'sss', '2013-02-23 00:00:00', 'sss', '2020-09-28 00:00:00'),
(1, 101, 32, 'VISHMADEB BISWAS', 'SUNIL BISWAS', 'M', 'Graduate', 1, 3, '', '1980-04-08', '2013-01-03', '1940-04-30', 9, '', '', '', '', '', 'VILL-BELACHUAPARA,P.O.-LAAL BAZAR,\nDIST-NADIA,PIN-741163', '', '', '', '', 7470.00, 'Y', 'Y', 'N', 'Y', 'A', '', '', 'sss', '2013-02-23 00:00:00', 'sss', '2020-09-28 00:00:00'),
(1, 101, 33, 'REBINA KHATUN', 'W/O-MEHEBUB HOSSAIN', 'F', 'Graduate', 1, 2, '', '1986-05-04', '2012-12-27', '1946-05-31', 8, '', '', '', '', '', 'VILL-MARGRAM MAHIPARA,P.O.-MARGRAM,\nDIST-BIRBHUM.PIN-731217', '', '101803240', '', '', 8940.00, 'Y', 'Y', 'Y', 'N', 'A', '', '', 'sss', '2013-02-23 00:00:00', 'sss', '2023-09-26 00:00:00'),
(1, 101, 34, 'MD.SAIDUZZAMAN', 'MD.KHAIRUL BASAR', 'M', 'Graduate', 1, 2, '', '1986-04-12', '2012-12-26', '1946-04-30', 7, '', '', '', '', '', 'VILL-BHADISWAR, P.O.-MURARAI,\nDIST-BIRBHUM.PIN-731219', '', '101804091', '', '', 8940.00, 'Y', 'Y', 'N', 'Y', 'A', '', '', 'sss', '2013-02-23 00:00:00', 'sss', '2023-09-26 00:00:00'),
(1, 101, 35, 'BENOJIR SALMA', 'MD.ALI MOSTAFA', 'F', 'Graduate', 1, 2, '', '1983-06-16', '2012-12-26', '1943-06-30', 8, '', '', '', '', '', 'VILL-+P.O.-MURARAI,DIST-BIRBHUM\nPIN-731219', '', 'xx', '', '', 7000.00, 'Y', 'Y', 'N', 'N', 'A', '', '', 'sss', '2013-02-23 00:00:00', 'sss', '2020-09-29 00:00:00'),
(1, 101, 36, 'NADIR HOSSAIN', 'KAMBAR HOSSAIN', 'M', 'Graduate', 1, 2, '', '1983-04-20', '2012-12-26', '1943-04-30', 9, '', '', '', '', '', 'VILL-RUDRANAGAR(MIAPARA),\nP.O.-RUDRANAGAR,PIN-731238', '', 'xx', '', '', 7000.00, 'Y', 'Y', 'N', 'Y', 'A', '', '', 'sss', '2013-02-23 00:00:00', 'sss', '2020-09-29 00:00:00'),
(1, 101, 37, 'MRINMOY CHATTERJEE', 'TIMIR BARAN CHATTERJEE', 'M', 'Hons. Graduate', 1, 1, '', '1981-01-11', '2013-01-09', '1941-01-31', 10, '', '', '', '', '', '', '', 'xx', '', '', 4625.00, 'Y', 'Y', 'N', 'N', 'E', '', '', 'sss', '2013-02-23 00:00:00', 'sss', '2014-02-24 00:00:00'),
(1, 101, 38, 'AMIR HAMZA MOLLA', 'MD.MANSUR MOLLA', 'M', 'Graduate', 1, 2, '', '1976-04-16', '2013-04-24', '1936-04-30', 16, '', '', '', 'BB', '', 'VILL-RASULPUR,P.O.-SEKHPUR\nDIST-BIRBHUM', '', '101802292', '', '', 8940.00, 'Y', 'Y', 'N', 'N', 'I', 'BB', 'BB', 'sss', '2013-05-24 00:00:00', 'sss', '2023-09-26 00:00:00'),
(1, 101, 39, 'SRI NIRMALENDU DAS', 'SRI DULAL CH.DAS', 'M', 'Master Degree', 1, 3, 'AGRI/WB/64161', '1965-01-01', '1994-02-02', '2024-12-31', 1, '', '', '', 'ACZPD78163', '', 'VILL-MURAGACHHA, 11 MILE,P.O.-BAGULA,\nP.S-HANSKHALI, DIST-NADIA.', '', '2917', '', '', 20090.00, 'Y', 'Y', 'N', 'N', 'I', 'SUKLA DAS-WIFE', '', 'sss', '2016-03-22 00:00:00', 'sss', '2017-03-23 00:00:00'),
(1, 101, 40, 'NASHIR HOSSAIN', 'NASIMUDDIN AHAMMAD', 'M', 'Graduate', 1, 2, '0', '1975-07-31', '2016-08-01', '1935-07-31', 12, '', '', '', '0', '', 'VILL+P.O.-DADPUR, DIST-BIRBHUM', '', '2420', '', '', 4625.00, 'Y', 'Y', 'N', 'N', 'I', 'CHANDANA KHATUN,WIFE', '', 'sss', '2016-08-29 00:00:00', 'sss', '2020-09-28 00:00:00'),
(1, 101, 41, 'NAYMUR RAHAMAN', 'LATE ABDUR ROB', 'M', 'Hons. Graduate', 1, 2, 'AGR/WB/63535', '1965-04-06', '1991-10-04', '2025-04-06', 1, '', '', '', '', '', 'LALKUTHIPARA(BIDESHI PARA)\nOLD SUBURBAN SCHOOL LANE,WARD-10,SURI\nMUNICIPALITY,DIST-BIRBHUM.', '', '3031', '', '', 22160.00, 'Y', 'Y', 'N', 'N', 'I', 'RUFIA BEGAM (WIFE)', '', 'sss', '2017-06-12 00:00:00', 'sss', '2018-08-20 00:00:00'),
(1, 101, 42, 'UTTAM KUMAR MONDAL', 'SHAKTI PADA MONDAL', 'M', 'Graduate', 1, 1, '0', '1974-10-29', '2018-09-01', '1934-10-31', 10, '', '', '', 'BCQPM402C', '', 'BHARSALAPARA,NABAPALLY,RAMPURHAT,\nWARD NO-15, P.O.-RAMPURHAT,DIST-BIRBHUM.\nW.B.', '', '101803064', '', '', 4840.00, 'Y', 'Y', 'N', 'N', 'A', 'DIPTI MONDAL, WIFE', '', 'sss', '2018-09-28 00:00:00', 'sss', '2023-11-24 00:00:00'),
(1, 101, 43, 'SOURAV BHATTACHARJEE', 'SRI BISWARUP BHATTACHARYYA', 'M', 'Graduate', 1, 1, '', '1997-07-30', '2020-10-19', '1957-07-31', 14, '', '', '', '', '', 'VILL +P.O.-BARSHAL,P.S.-RAMPURHAT,\nDIST-BIRBHUM ,PIN-731233', '', '101803530', '', '', 4385.00, 'Y', 'Y', 'N', 'N', 'A', 'SRI BISWARUP BHATTACHARYYA', '', 'sss', '2020-11-25 00:00:00', 'sss', '2023-10-25 00:00:00'),
(1, 101, 44, 'SABANA AKTAR', 'EMDAD ALI', 'F', '12th Stanard', 1, 2, '', '1997-03-01', '2018-09-01', '1957-03-31', 14, '', '', '', 'CMMPA3405K', '', 'VILL-PATHRA, P.O.-SWADINPUR,P.S-RAMPURHAT\nDIST-BIRBHUM,PIN-731224', '', '101803894', '', '', 4635.00, 'Y', 'Y', 'N', 'N', 'A', 'EMDAD ALI', '', 'sss', '2021-10-27 00:00:00', 'sss', '2023-09-26 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `md_fin_year`
--

CREATE TABLE `md_fin_year` (
  `sl_no` int(11) NOT NULL,
  `fin_yr` varchar(30) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` varchar(50) DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `md_fin_year`
--

INSERT INTO `md_fin_year` (`sl_no`, `fin_yr`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, '2020-21', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_leave_allocation`
--

CREATE TABLE `md_leave_allocation` (
  `sl_no` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `start_month` int(11) NOT NULL,
  `end_month` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `credit_on` date NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_month`
--

CREATE TABLE `md_month` (
  `id` int(11) NOT NULL,
  `month_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `md_month`
--

INSERT INTO `md_month` (`id`, `month_name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `md_parameters`
--

CREATE TABLE `md_parameters` (
  `sl_no` int(11) NOT NULL,
  `param_desc` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `param_value` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_parameters`
--

INSERT INTO `md_parameters` (`sl_no`, `param_desc`, `param_value`, `modified_by`, `modified_dt`) VALUES
(1, 'DA Percentage', '3', 'sss', '2022-08-25 03:50:14'),
(2, 'HRA Percentage', '12', 'sss', '2021-02-08 07:11:09'),
(3, 'Medical Allowance', '500', 'sss', '2021-02-08 07:24:55'),
(4, 'PF Percentage', '12', 'anirbanc', '2021-04-02 06:46:28'),
(5, 'Yearly increment ', '0', 'sss', '2021-02-18 03:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `md_pay_head`
--

CREATE TABLE `md_pay_head` (
  `sl_no` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `input_flag` enum('M','A') NOT NULL,
  `pay_flag` enum('E','D','F','A') NOT NULL,
  `pay_head` varchar(100) NOT NULL,
  `acc_cd` int(11) NOT NULL,
  `percentage` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_pay_head`
--

INSERT INTO `md_pay_head` (`sl_no`, `bank_id`, `input_flag`, `pay_flag`, `pay_head`, `acc_cd`, `percentage`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(0, 1, 'A', 'F', 'Basic', 0, 0.00, 'sss', '2009-11-03', 'sss', '2024-07-24 11:14:10'),
(102, 1, 'M', 'D', 'LWP', 0, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(104, 1, 'A', 'E', 'Dearness Allowance', 0, 117.10, 'sss', '2009-11-03', 'sss', '2024-07-24 11:14:10'),
(105, 1, 'A', 'E', 'HRA', 0, 10.00, 'sss', '2009-11-03', 'sss', '2024-07-24 11:14:47'),
(106, 1, 'M', 'E', 'Cash Allowance', 0, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(107, 1, 'M', 'E', 'Medical Allowance', 0, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(108, 1, 'M', 'E', 'Special Allowance', 0, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(109, 1, 'M', 'E', 'AD.-HOC', 0, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(111, 1, 'M', 'E', 'D.Pay', 0, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(112, 1, 'M', 'E', 'Excess/Refund', 0, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(113, 1, 'M', 'E', 'Bonus', 0, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(114, 1, 'M', 'E', 'Exgratia', 0, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(115, 1, 'M', 'E', 'Incentive', 0, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(116, 1, 'M', 'E', 'Over Time', 0, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(117, 1, 'M', 'E', 'Arear DA', 0, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(201, 1, 'A', 'D', 'Provident Fund', 10716, 12.00, 'sss', '2009-11-03', 'sss', '2024-07-24 12:44:58'),
(202, 1, 'M', 'D', 'Festival Advance', 20716, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(203, 1, 'M', 'D', 'Govt. Provident Fund', 10712, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(204, 1, 'M', 'D', 'Group Insurance Premium', 10717, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(206, 1, 'M', 'D', 'LIC Premium', 10323, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(207, 1, 'M', 'D', 'Income TAX', 10720, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(208, 1, 'M', 'D', 'Medical Advance', 20722, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(209, 1, 'M', 'D', 'House Building Loan Principle', 10000, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(210, 1, 'M', 'D', 'House Building Loan Interest', 10000, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(211, 1, 'M', 'D', 'Personal Loan  Principle', 10000, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(212, 1, 'M', 'D', 'Personal Loan Interest', 10000, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(213, 1, 'M', 'D', 'Emegency Loan Principle', 10000, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(214, 1, 'M', 'D', 'Emegency Loan Interest', 10000, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(215, 1, 'A', 'D', 'Professional Tax', 10718, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(216, 1, 'M', 'D', 'Vechicle Loan Principle', 10000, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(217, 1, 'M', 'D', 'Vechicle Loan Interest', 10000, 0.00, 'sss', '2009-11-03', '', '0000-00-00 00:00:00'),
(218, 1, 'M', 'D', 'Excess Adjustment', 10000, 0.00, 'sss', '2010-03-08', '', '0000-00-00 00:00:00'),
(219, 1, 'M', 'D', 'Other Deduction', 0, 0.00, '', '0000-00-00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `md_ptax`
--

CREATE TABLE `md_ptax` (
  `id` int(11) NOT NULL,
  `st` decimal(10,2) NOT NULL DEFAULT 0.00,
  `end` decimal(10,2) NOT NULL,
  `ptax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `md_ptax`
--

INSERT INTO `md_ptax` (`id`, `st`, `end`, `ptax`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 0.00, 10000.00, 0.00, NULL, NULL, '2023-07-18 06:10:32', 'akter'),
(2, 10001.00, 15000.00, 110.00, NULL, NULL, '2023-10-10 10:43:28', 'akter'),
(3, 15001.00, 25000.00, 130.00, NULL, NULL, NULL, NULL),
(4, 25001.00, 40000.00, 150.00, NULL, NULL, NULL, NULL),
(5, 40001.00, 99999999.00, 200.00, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_ptax_slab`
--

CREATE TABLE `md_ptax_slab` (
  `effective_dt` date NOT NULL,
  `sl_no` int(11) NOT NULL,
  `from_amt` decimal(10,2) NOT NULL,
  `to_amt` decimal(10,2) NOT NULL,
  `tax_amt` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `md_ptax_slab`
--

INSERT INTO `md_ptax_slab` (`effective_dt`, `sl_no`, `from_amt`, `to_amt`, `tax_amt`) VALUES
('2017-01-01', 1, 10000.00, 15000.00, 110.00),
('2017-01-01', 2, 15001.00, 25000.00, 130.00),
('2017-01-01', 3, 25001.00, 40000.00, 150.00),
('2017-01-01', 4, 40000.00, 4000000.00, 200.00);

-- --------------------------------------------------------

--
-- Table structure for table `md_users`
--

CREATE TABLE `md_users` (
  `bank_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` enum('U','M','A','B') NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_status` char(1) NOT NULL,
  `st` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `md_users`
--

INSERT INTO `md_users` (`bank_id`, `user_id`, `password`, `user_type`, `user_name`, `user_status`, `st`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'akter', '$2y$10$.hGN2NZbdZxhvY6t4f7Xp.izntLjFMXhKAY1rIBaShZUbMdmH1KvG', 'A', 'Akter', 'A', 0, 'Synergic Softek', '2023-06-21 12:03:58', NULL, NULL),
(1, 'sss', '$2y$10$.hGN2NZbdZxhvY6t4f7Xp.izntLjFMXhKAY1rIBaShZUbMdmH1KvG', 'A', 'synergic', 'A', 0, 'Synergic Softek', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_attendance`
--

CREATE TABLE `td_attendance` (
  `trans_dt` date NOT NULL,
  `sal_year` int(11) NOT NULL,
  `sal_month` varchar(50) NOT NULL,
  `emp_cd` int(11) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_catg` varchar(30) DEFAULT NULL,
  `no_of_days` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `modified_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_audit_trail`
--

CREATE TABLE `td_audit_trail` (
  `sl_no` int(10) UNSIGNED NOT NULL,
  `login_dt` datetime DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `terminal_name` varchar(50) DEFAULT NULL,
  `logout` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `td_audit_trail`
--

INSERT INTO `td_audit_trail` (`sl_no`, `login_dt`, `user_id`, `terminal_name`, `logout`) VALUES
(1, '2021-02-24 05:52:07', 'sss', '122.176.27.53', NULL),
(2, '2021-02-24 05:53:04', 'sss', '122.176.27.53', NULL),
(3, '2021-02-24 06:00:18', 'sss', '122.176.27.53', NULL),
(4, '2021-02-24 06:52:57', 'anirbanc', '182.76.175.10', NULL),
(5, '2021-02-24 10:47:49', 'anirbanc', '182.76.175.10', NULL),
(6, '2021-02-24 11:04:27', 'sss', '122.176.27.53', NULL),
(7, '2021-02-24 02:52:10', 'anirbanc', '202.142.65.118', NULL),
(8, '2021-02-25 03:11:53', 'anirbanc', '182.76.175.10', NULL),
(9, '2021-02-25 05:08:09', 'sss', '122.176.27.53', NULL),
(10, '2021-02-25 07:06:34', 'anirbanc', '182.76.175.10', NULL),
(11, '2021-02-25 10:06:49', 'sss', '122.176.27.53', NULL),
(12, '2021-02-25 02:47:13', 'anirbanc', '202.142.65.79', NULL),
(13, '2021-02-26 05:06:10', 'anirbanc', '182.76.175.10', NULL),
(14, '2021-02-27 09:57:20', 'anirbanc', '202.142.104.143', NULL),
(15, '2021-03-01 05:08:28', 'anirbanc', '182.76.175.10', NULL),
(16, '2021-03-01 05:56:45', 'anirbanc', '182.76.175.10', NULL),
(17, '2021-03-01 09:20:12', 'sss', '122.176.27.53', NULL),
(18, '2021-03-02 06:27:07', 'anirbanc', '182.76.175.10', NULL),
(19, '2021-03-03 05:52:24', 'sss', '122.176.27.53', NULL),
(20, '2021-03-03 10:58:50', 'sss', '122.176.27.53', NULL),
(21, '2021-03-03 12:41:43', 'sss', '122.176.27.53', NULL),
(22, '2021-03-03 01:09:22', 'sss', '122.176.27.53', NULL),
(23, '2021-03-05 05:13:34', 'sss', '122.176.27.53', NULL),
(24, '2021-03-05 06:44:26', 'sss', '122.176.27.53', NULL),
(25, '2021-03-08 06:16:14', 'sss', '136.232.64.10', NULL),
(26, '2021-03-09 07:17:07', 'anirbanc', '182.76.175.10', NULL),
(27, '2021-03-09 09:01:51', 'sss', '122.176.27.53', NULL),
(28, '2021-03-09 10:38:06', 'sss', '122.176.27.53', NULL),
(29, '2021-03-10 05:10:43', 'sss', '122.176.27.53', NULL),
(30, '2021-03-10 01:13:13', 'sss', '122.176.27.53', NULL),
(31, '2021-03-25 10:07:22', 'sss', '122.176.27.53', NULL),
(32, '2021-04-02 06:03:52', 'anirbanc', '223.191.48.89', NULL),
(33, '2021-04-05 06:40:28', 'sss', '122.176.27.53', NULL),
(34, '2022-02-18 11:12:14', 'sss', '122.163.123.68', NULL),
(35, '2022-03-22 11:02:44', 'anirbanc', '103.242.190.231', NULL),
(36, '2022-08-17 11:51:17', 'sss', '::1', NULL),
(37, '2022-08-18 10:20:56', 'sss', '::1', NULL),
(38, '2022-08-18 02:27:42', 'sss', '::1', NULL),
(39, '2022-08-18 02:30:54', 'sss', '::1', NULL),
(40, '2022-08-18 02:31:03', 'sss', '::1', NULL),
(41, '2022-08-18 02:51:39', 'sss', '::1', NULL),
(42, '2022-08-18 02:51:52', 'sss', '::1', NULL),
(43, '2022-08-18 03:20:44', 'sss', '::1', NULL),
(44, '2022-08-19 11:11:53', 'sss', '::1', NULL),
(45, '2022-08-22 10:53:58', 'sss', '::1', NULL),
(46, '2022-08-22 02:42:17', 'sss', '::1', NULL),
(47, '2022-08-23 03:31:51', 'sss', '::1', NULL),
(48, '2022-08-25 11:18:45', 'sss', '::1', NULL),
(49, '2022-08-25 01:11:22', 'sss', '::1', NULL),
(50, '2022-08-25 03:49:17', 'sss', '::1', NULL),
(51, '2022-08-25 04:33:06', 'sss', '::1', NULL),
(52, '2022-08-26 10:30:55', 'sss', '::1', NULL),
(53, '2022-08-26 10:45:59', 'sss', '::1', NULL),
(54, '2022-08-30 02:24:07', 'sss', '::1', NULL),
(55, '2022-08-31 10:53:26', 'sss', '::1', NULL),
(56, '2022-08-31 03:02:43', 'sss', '::1', NULL),
(57, '2022-09-01 10:31:46', 'sss', '::1', NULL),
(58, '2022-09-02 10:32:06', 'sss', '::1', NULL),
(59, '2022-09-02 11:02:16', 'sss', '::1', NULL),
(60, '2022-09-15 07:34:26', 'sss', '127.0.0.1', NULL),
(61, '2022-09-15 08:39:55', 'sss', '127.0.0.1', NULL),
(62, '2022-09-15 08:39:59', 'sss', '127.0.0.1', NULL),
(63, '2022-09-15 08:53:21', 'sss', '127.0.0.1', NULL),
(64, '2022-09-15 11:57:35', 'sss', '127.0.0.1', NULL),
(65, '2022-09-16 07:34:17', 'sss', '127.0.0.1', NULL),
(66, '2022-09-16 12:15:36', 'sss', '127.0.0.1', NULL),
(67, '2022-09-19 07:23:05', 'sss', '127.0.0.1', NULL),
(68, '2022-09-19 11:36:35', 'sss', '127.0.0.1', NULL),
(69, '2022-09-20 07:19:35', 'sss', '127.0.0.1', NULL),
(70, '2022-09-20 11:30:51', 'sss', '127.0.0.1', '2022-09-20 01:28:11'),
(71, '2022-09-20 01:41:15', 'sss', '127.0.0.1', NULL),
(72, '2022-09-21 07:41:06', 'sss', '127.0.0.1', NULL),
(73, '2022-09-21 12:46:58', 'sss', '127.0.0.1', '2022-09-21 12:49:52'),
(74, '2022-09-22 07:39:25', 'sss', '127.0.0.1', '2022-09-22 07:59:35'),
(75, '2022-09-22 10:00:42', 'sss', '127.0.0.1', NULL),
(76, '2022-09-22 12:32:49', 'sss', '127.0.0.1', NULL),
(77, '2022-09-23 07:16:29', 'sss', '127.0.0.1', NULL),
(78, '2022-09-23 08:50:06', 'sss', '::1', NULL),
(79, '2022-09-23 08:50:33', 'sss', '::1', '2022-09-23 08:50:37'),
(80, '2022-09-23 09:25:06', 'sss', '10.65.65.246', '2022-09-23 11:07:46'),
(81, '2022-09-23 11:07:56', 'sss', '10.65.65.246', '2022-09-23 11:33:46'),
(82, '2022-09-23 11:33:51', 'sss', '10.65.65.246', NULL),
(83, '2022-09-23 01:57:57', 'sss', '122.163.123.68', NULL),
(84, '2022-09-23 01:59:52', 'sss', '122.163.123.68', NULL),
(85, '2022-09-27 07:39:42', 'sss', '103.216.205.182', '2022-09-27 07:59:18'),
(86, '2022-09-27 08:00:18', 'sss', '103.216.205.182', '2022-09-27 08:02:05'),
(87, '2022-09-27 08:02:28', 'sss', '103.216.205.182', '2022-09-27 08:02:45'),
(88, '2022-09-30 01:41:07', 'SSS', '103.216.205.182', '2022-09-30 01:47:00'),
(89, '2022-09-30 01:53:52', 'sss', '103.216.205.182', '2022-09-30 01:56:47'),
(90, '2022-10-10 12:20:25', 'sss', '136.232.64.10', NULL),
(91, '2022-10-11 06:50:53', 'sss', '122.163.123.68', NULL),
(92, '2022-10-11 07:05:48', 'sss', '103.216.205.182', '2022-10-11 07:44:04'),
(93, '2022-10-11 07:59:31', 'sss', '103.216.205.182', '2022-10-11 08:15:18'),
(94, '2022-10-11 08:16:22', 'sss', '103.216.205.182', NULL),
(95, '2022-10-11 10:04:11', 'sss', '136.233.106.234', '2022-10-11 10:22:30'),
(96, '2022-10-11 11:27:33', 'sss', '122.163.123.68', NULL),
(97, '2022-10-11 01:59:35', 'sss', '122.163.123.68', '2022-10-11 03:13:04'),
(98, '2022-10-12 09:47:09', 'sss', '122.163.123.68', NULL),
(99, '2022-10-12 01:23:59', 'sss', '136.233.106.234', '2022-10-12 02:57:33'),
(100, '2022-10-13 07:20:20', 'sss', '136.233.106.234', '2022-10-13 10:42:35'),
(101, '2022-10-13 12:41:55', 'sss', '122.163.123.68', NULL),
(102, '2022-10-13 12:46:24', 'sss', '136.232.64.10', NULL),
(103, '2022-10-14 06:52:57', 'sss', '136.233.106.234', NULL),
(104, '2022-10-14 07:23:58', 'sss', '122.163.123.68', NULL),
(105, '2022-10-14 12:25:40', 'sss', '136.233.106.234', '2022-10-14 12:41:28'),
(106, '2022-10-14 01:40:56', 'sss', '136.232.64.10', NULL),
(107, '2022-10-14 01:51:00', 'sss', '122.163.123.68', NULL),
(108, '2022-10-14 03:00:36', 'sss', '122.163.123.68', NULL),
(109, '2022-10-15 07:20:46', 'sss', '136.233.106.234', '2022-10-15 09:24:08'),
(110, '2022-10-17 07:28:40', 'sss', '122.163.123.68', NULL),
(111, '2022-10-17 09:58:58', 'sss', '136.233.106.234', '2022-10-17 02:27:48'),
(112, '2022-10-17 11:44:32', 'sss', '122.163.123.68', NULL),
(113, '2022-10-18 06:57:33', 'sss', '136.233.106.234', '2022-10-18 11:13:23'),
(114, '2022-10-18 08:40:16', 'sss', '122.163.123.68', NULL),
(115, '2022-10-18 11:15:09', 'sss', '103.216.205.182', NULL),
(116, '2022-10-18 11:39:40', 'sss', '136.233.106.234', '2022-10-18 12:47:06'),
(117, '2022-10-18 01:42:53', 'sss', '103.216.205.182', NULL),
(118, '2022-10-19 07:21:06', 'sss', '122.163.123.68', NULL),
(119, '2022-10-19 07:31:34', 'sss', '136.233.106.234', '2022-10-19 07:36:34'),
(120, '2022-10-19 12:42:10', 'sss', '103.216.205.182', NULL),
(121, '2022-10-21 07:18:59', 'sss', '136.233.106.234', NULL),
(122, '2022-10-21 12:13:51', 'sss', '136.233.106.234', '2022-10-21 01:51:58'),
(123, '2022-10-21 01:15:41', 'sss', '122.163.123.68', NULL),
(124, '2022-10-21 03:27:11', 'sss', '103.216.205.182', NULL),
(125, '2022-10-21 03:55:10', 'sss', '103.216.205.182', NULL),
(126, '2022-10-25 06:52:44', 'sss', '136.233.106.234', '2022-10-25 07:11:16'),
(127, '2022-10-25 07:10:44', 'sss', '122.163.123.68', '2022-10-25 08:41:57'),
(128, '2022-10-25 08:01:38', 'sss', '122.163.123.68', NULL),
(129, '2022-10-25 10:05:01', 'sss', '136.233.106.234', '2022-10-25 10:19:42'),
(130, '2022-10-25 11:52:51', 'sss', '136.233.106.234', '2022-10-25 01:36:50'),
(131, '2022-10-25 12:31:10', 'sss', '122.163.123.68', NULL),
(132, '2022-10-26 09:29:03', 'sss', '136.233.106.234', '2022-10-26 09:42:55'),
(133, '2022-10-28 01:51:28', 'sss', '103.216.205.182', '2022-10-28 02:14:50'),
(134, '2022-10-29 10:36:39', 'sss', '103.216.205.182', '2022-10-29 11:19:01'),
(135, '2022-10-31 06:21:04', 'sss', '103.216.205.182', NULL),
(136, '2022-10-31 10:48:41', 'sss', '103.216.205.182', NULL),
(137, '2022-11-04 06:55:49', 'sss', '136.233.106.234', '2022-11-04 06:56:49'),
(138, '2022-11-04 07:59:26', 'sss', '122.163.123.68', NULL),
(139, '2022-11-04 11:43:44', 'sss', '122.163.123.68', NULL),
(140, '2022-11-04 11:45:04', 'SSS', '136.233.106.234', '2022-11-04 11:47:01'),
(141, '2022-11-05 06:40:20', 'sss', '103.216.205.182', NULL),
(142, '2022-11-07 08:38:58', 'sss', '103.216.205.182', NULL),
(143, '2022-11-09 07:45:38', 'sss', '103.216.205.182', NULL),
(144, '2022-11-11 08:22:00', 'sss', '103.216.205.182', NULL),
(145, '2022-11-11 10:40:14', 'sss', '103.216.205.182', NULL),
(146, '2022-11-23 07:51:23', 'sss', '136.233.106.234', '2022-11-23 08:48:44'),
(147, '2022-11-24 08:10:08', 'sss', '103.216.205.182', '2022-11-24 08:24:01'),
(148, '2022-11-24 08:53:37', 'sss', '103.216.205.182', NULL),
(149, '2022-11-24 09:23:24', 'sss', '136.233.106.234', NULL),
(150, '2022-11-24 12:31:22', 'sss', '136.233.106.234', '2022-11-24 01:49:57'),
(151, '2022-11-25 06:08:59', 'sss', '103.216.205.182', NULL),
(152, '2022-11-25 06:25:04', 'sss', '136.233.106.234', '2022-11-25 06:36:32'),
(153, '2022-11-25 06:32:11', 'sss', '122.163.123.68', NULL),
(154, '2022-11-25 07:29:46', 'sss', '136.233.106.234', '2022-11-25 08:35:49'),
(155, '2022-11-29 08:00:10', 'sss', '103.216.205.182', '2022-11-29 08:09:07'),
(156, '2022-11-30 09:14:55', 'sss', '103.216.205.182', NULL),
(157, '2022-12-08 06:54:41', 'sss', '136.233.106.234', NULL),
(158, '2022-12-13 08:10:54', 'sss', '103.216.205.182', '2022-12-13 08:13:55'),
(159, '2022-12-23 06:28:14', 'sss', '103.216.205.182', NULL),
(160, '2022-12-23 07:01:58', 'sss', '136.233.106.234', '2022-12-23 07:58:07'),
(161, '2022-12-23 07:54:59', 'sss', '103.216.205.182', NULL),
(162, '2022-12-23 08:56:31', 'sss', '136.233.106.234', '2022-12-23 08:57:25'),
(163, '2022-12-26 08:46:00', 'sss', '103.216.205.182', NULL),
(164, '2022-12-26 10:34:00', 'sss', '103.216.205.182', NULL),
(165, '2022-12-30 09:29:46', 'sss', '103.216.205.182', NULL),
(166, '2023-01-03 08:22:25', 'sss', '103.216.205.182', NULL),
(167, '2023-01-03 08:29:24', 'sss', '136.233.106.234', '2023-01-03 08:31:40'),
(168, '2023-01-10 08:23:54', 'sss', '136.233.106.234', '2023-01-10 08:27:54'),
(169, '2023-01-11 06:07:06', 'sss', '136.233.106.234', '2023-01-11 06:08:14'),
(170, '2023-01-17 08:24:58', 'sss', '103.216.205.182', NULL),
(171, '2023-01-24 11:55:11', 'sss', '136.233.106.234', '2023-01-24 01:42:55'),
(172, '2023-01-24 12:00:59', 'sss', '103.216.205.182', '2023-01-24 12:10:49'),
(173, '2023-01-25 06:09:43', 'sss', '103.216.205.182', '2023-01-25 07:13:15'),
(174, '2023-01-25 07:40:56', 'sss', '103.216.205.182', '2023-01-25 07:46:20'),
(175, '2023-01-25 08:06:10', 'sss', '103.216.205.182', NULL),
(176, '2023-01-31 02:06:54', 'sss', '103.216.205.182', '2023-01-31 02:31:05'),
(177, '2023-02-02 06:14:53', 'sss', '136.233.106.234', '2023-02-02 06:15:48'),
(178, '2023-02-07 08:56:45', 'sss', '103.216.205.182', NULL),
(179, '2023-02-22 09:19:23', 'sss', '103.216.205.182', NULL),
(180, '2023-02-23 12:44:15', 'sss', '103.216.205.182', NULL),
(181, '2023-02-24 06:04:31', 'sss', '103.216.205.182', NULL),
(182, '2023-02-24 06:34:57', 'sss', '136.233.106.234', '2023-02-24 07:35:31'),
(183, '2023-02-24 06:40:03', 'sss', '103.216.205.182', NULL),
(184, '2023-02-24 07:25:48', 'sss', '103.216.205.182', NULL),
(185, '2023-02-24 07:31:34', 'sss', '103.216.205.182', '2023-02-24 07:36:47'),
(186, '2023-02-24 07:36:53', 'sss', '103.216.205.182', NULL),
(187, '2023-02-24 07:41:54', 'sss', '103.216.205.182', '2023-02-24 07:44:35'),
(188, '2023-02-24 07:47:33', 'sss', '136.233.106.234', '2023-02-24 07:54:44'),
(189, '2023-02-24 07:58:16', 'sss', '103.216.205.182', '2023-02-24 07:58:26'),
(190, '2023-02-24 08:05:41', 'sss', '122.176.27.53', NULL),
(191, '2023-02-24 08:13:56', 'sss', '136.233.106.234', '2023-02-24 08:14:58'),
(192, '2023-02-24 08:15:29', 'sss', '103.216.205.182', '2023-02-24 09:07:39'),
(193, '2023-02-24 08:20:04', 'sss', '136.233.106.234', '2023-02-24 08:25:14'),
(194, '2023-02-27 12:21:34', 'sss', '136.233.106.234', '2023-02-27 12:27:03'),
(195, '2023-03-04 06:46:13', 'sss', '103.216.205.182', NULL),
(196, '2023-03-09 10:25:09', 'sss', '103.216.205.182', '2023-03-09 11:33:22'),
(197, '2023-03-13 10:05:00', 'sss', '103.216.205.182', NULL),
(198, '2023-03-13 11:08:51', 'sss', '103.216.205.182', NULL),
(199, '2023-03-16 08:05:36', 'sss', '103.216.205.182', NULL),
(200, '2023-03-17 09:12:25', 'sss', '103.216.205.182', NULL),
(201, '2023-03-20 06:01:21', 'sss', '103.216.205.182', NULL),
(202, '2023-03-20 08:51:15', 'sss', '103.216.205.182', '2023-03-20 09:17:49'),
(203, '2023-03-22 08:58:16', 'sss', '103.216.205.182', NULL),
(204, '2023-03-22 11:50:54', 'sss', '103.216.205.182', '2023-03-22 11:51:15'),
(205, '2023-03-23 06:10:18', 'sss', '103.216.205.182', NULL),
(206, '2023-03-23 10:34:14', 'sss', '103.216.205.182', '2023-03-23 10:41:17'),
(207, '2023-03-24 05:39:42', 'sss', '136.233.106.234', '2023-03-24 09:34:50'),
(208, '2023-03-24 07:43:54', 'sss', '103.216.205.182', '2023-03-24 07:47:09'),
(209, '2023-03-24 07:47:14', 'sss', '103.216.205.182', NULL),
(210, '2023-03-24 07:53:57', 'sss', '103.216.205.182', NULL),
(211, '2023-03-24 11:24:59', 'sss', '103.216.205.182', NULL),
(212, '2023-03-24 11:36:40', 'sss', '103.216.205.182', '2023-03-24 11:38:58'),
(213, '2023-03-27 10:32:31', 'sss', '103.216.205.182', NULL),
(214, '2023-03-30 07:57:15', 'sss', '103.216.205.182', NULL),
(215, '2023-04-05 12:11:16', 'sss', '103.216.205.182', NULL),
(216, '2023-04-17 11:51:06', 'sss', '::1', NULL),
(217, '2023-04-17 11:52:52', 'sss', '::1', '2023-04-17 11:53:02'),
(218, '2023-04-17 12:00:54', 'sss', '::1', '2023-04-17 12:02:47'),
(219, '2023-04-17 12:07:15', 'sss', '::1', '2023-04-17 12:11:43'),
(220, '2023-04-17 12:12:11', 'sss', '::1', NULL),
(221, '2023-04-21 09:52:44', 'sss', '::1', NULL),
(222, '2023-04-25 10:19:54', 'sss', '127.0.0.1', NULL),
(223, '2023-05-09 01:27:19', 'sss', '::1', NULL),
(224, '2023-05-10 07:08:08', 'sss', '::1', NULL),
(225, '2023-05-10 10:15:50', 'sss', '::1', NULL),
(226, '2023-05-10 12:22:35', 'sss', '::1', NULL),
(227, '2023-05-11 07:53:33', 'sss', '::1', NULL),
(228, '2023-05-11 12:02:32', 'sss', '::1', NULL),
(229, '2023-05-11 02:21:19', 'sss', '::1', NULL),
(230, '2023-05-12 08:20:03', 'sss', '::1', '2023-05-12 09:29:54'),
(231, '2023-05-12 09:29:58', 'sss', '::1', NULL),
(232, '2023-05-15 07:20:49', 'sss', '::1', '2023-05-15 08:55:28'),
(233, '2023-05-16 10:22:54', 'sss', '122.176.27.53', '2023-05-16 10:28:15'),
(234, '2023-05-16 10:28:20', 'ardb_admin', '122.176.27.53', '2023-05-16 10:28:35'),
(235, '2023-05-17 10:41:59', 'ardb_admin', '103.2.132.100', '2023-05-17 10:54:27'),
(236, '2023-05-17 10:52:04', 'ardb_admin', '122.176.27.53', '2023-05-17 01:44:05'),
(237, '2023-05-17 10:54:51', 'ardb_admin', '103.2.132.100', '2023-05-17 01:06:34'),
(238, '2023-05-17 01:07:00', 'ardb_admin', '103.2.132.100', '2023-05-17 01:07:04'),
(239, '2023-05-18 05:47:57', 'ardb_admin', '103.2.132.100', NULL),
(240, '2023-05-20 07:07:21', 'sss', '103.87.142.92', NULL),
(241, '2023-05-22 08:09:44', 'ardb_admin', '103.2.132.100', '2023-05-22 08:15:34'),
(242, '2023-05-22 08:19:24', 'ardb_admin', '103.2.132.100', '2023-05-22 08:24:27'),
(243, '2023-05-22 08:30:25', 'ardb_admin', '103.2.132.100', '2023-05-22 08:41:46'),
(244, '2023-05-23 08:26:43', 'ardb_admin', '103.2.132.100', NULL),
(245, '2023-05-23 10:04:06', 'ardb_admin', '103.2.132.100', '2023-05-23 11:06:44'),
(246, '2023-05-23 10:06:21', 'ardb_admin', '122.176.27.53', NULL),
(247, '2023-05-25 04:32:02', 'ardb_admin', '103.2.132.100', '2023-05-25 04:40:17'),
(248, '2023-05-25 04:41:20', 'ardb_admin', '103.2.132.100', '2023-05-25 04:43:41'),
(249, '2023-05-26 07:28:50', 'ardb_admin', '103.2.132.100', '2023-05-26 07:30:41'),
(250, '2023-06-20 04:31:13', 'sss', '223.191.27.246', '2023-06-20 04:31:23'),
(251, '2023-06-20 04:34:09', 'sss', '223.191.27.246', '2023-06-20 04:37:45'),
(252, '2023-06-21 06:30:51', 'sss', '103.242.190.29', '2023-06-21 06:35:08'),
(253, '2023-06-21 06:35:23', 'akter', '103.242.190.29', '2023-06-21 06:35:26'),
(254, '2023-06-21 08:55:54', 'akter', '59.98.3.127', NULL),
(255, '2023-06-21 09:24:26', 'akter', '59.98.3.127', NULL),
(256, '2023-06-22 07:45:37', 'akter', '59.98.3.127', NULL),
(257, '2023-06-22 09:51:16', 'akter', '59.98.3.127', NULL),
(258, '2023-06-22 10:40:12', 'akter', '47.11.10.224', '2023-06-22 10:49:25'),
(259, '2023-06-22 10:49:43', 'akter', '59.98.3.127', NULL),
(260, '2023-06-22 11:04:26', 'sss', '116.193.139.86', '2023-06-22 11:24:14'),
(261, '2023-06-23 05:10:21', 'akter', '59.98.3.127', NULL),
(262, '2023-06-23 05:29:07', 'akter', '59.98.3.127', NULL),
(263, '2023-06-23 09:15:12', 'sss', '103.242.190.29', '2023-06-23 09:16:28'),
(264, '2023-06-23 09:36:10', 'sss', '103.242.190.29', '2023-06-23 10:24:12'),
(265, '2023-06-23 12:17:39', 'sss', '136.232.64.10', '2023-06-23 12:46:38'),
(266, '2023-06-23 12:47:39', 'sss', '136.232.64.10', NULL),
(267, '2023-06-23 12:48:30', 'sss', '136.232.64.10', '2023-06-23 12:56:05'),
(268, '2023-06-26 05:44:44', 'akter', '59.98.3.127', '2023-06-26 07:48:45'),
(269, '2023-06-26 06:31:19', 'sss', '103.242.190.92', '2023-06-26 06:45:15'),
(270, '2023-06-26 07:56:17', 'akter', '59.98.3.127', NULL),
(271, '2023-07-17 10:17:18', 'sss', '136.232.64.10', NULL),
(272, '2023-07-18 05:34:51', 'akter', '59.98.3.135', NULL),
(273, '2023-07-21 08:20:35', 'akter', '59.98.3.135', '2023-07-21 09:03:08'),
(274, '2023-07-21 10:40:59', 'akter', '59.98.3.135', '2023-07-21 10:45:51'),
(275, '2023-07-25 09:45:06', 'akter', '59.98.3.135', NULL),
(276, '2023-07-26 05:13:50', 'akter', '59.98.3.135', NULL),
(277, '2023-07-26 05:52:28', 'sss', '136.232.64.10', '2023-07-26 06:11:26'),
(278, '2023-07-26 06:37:32', 'sss', '136.232.64.10', '2023-07-26 07:40:57'),
(279, '2023-07-26 06:56:04', 'akter', '59.98.3.135', NULL),
(280, '2023-08-17 06:33:27', 'akter', '59.98.3.135', NULL),
(281, '2023-08-18 07:23:29', 'akter', '59.98.3.135', NULL),
(282, '2023-08-18 08:08:55', 'sss', '103.242.190.123', '2023-08-18 08:52:43'),
(283, '2023-08-18 09:23:04', 'sss', '103.242.190.123', '2023-08-18 09:25:57'),
(284, '2023-08-18 10:13:40', 'akter', '59.98.3.135', NULL),
(285, '2023-08-19 07:04:37', 'akter', '59.98.3.135', NULL),
(286, '2023-08-19 07:07:51', 'akter', '59.98.3.135', NULL),
(287, '2023-08-19 07:42:25', 'sss', '157.40.211.196', '2023-08-19 08:40:49'),
(288, '2023-08-19 07:58:15', 'akter', '59.98.3.135', NULL),
(289, '2023-08-19 08:00:43', 'akter', '59.98.3.135', NULL),
(290, '2023-08-19 08:10:38', 'akter', '59.98.3.135', NULL),
(291, '2023-08-19 09:03:07', 'akter', '59.98.3.135', NULL),
(292, '2023-08-21 05:24:34', 'akter', '59.98.3.135', NULL),
(293, '2023-08-21 05:43:10', 'sss', '103.242.190.127', '2023-08-21 05:52:53'),
(294, '2023-08-21 05:54:26', 'sss', '103.242.190.127', '2023-08-21 06:27:14'),
(295, '2023-08-21 07:17:34', 'akter', '59.98.3.135', NULL),
(296, '2023-08-21 09:11:46', 'sss', '103.242.190.79', '2023-08-21 09:33:58'),
(297, '2023-08-21 09:40:42', 'sss', '103.242.190.84', '2023-08-21 09:40:57'),
(298, '2023-08-25 08:31:48', 'akter', '59.98.3.135', NULL),
(299, '2023-08-25 09:38:35', 'akter', '59.98.3.135', NULL),
(300, '2023-08-25 09:39:58', 'akter', '59.98.3.135', NULL),
(301, '2023-08-25 09:40:10', 'akter', '59.98.3.135', '2023-08-25 09:40:17'),
(302, '2023-08-28 05:38:32', 'akter', '59.98.3.135', NULL),
(303, '2023-08-28 05:40:34', 'akter', '59.98.3.135', NULL),
(304, '2023-08-28 06:51:47', 'akter', '59.98.3.135', NULL),
(305, '2023-08-28 06:52:33', 'akter', '59.98.3.135', NULL),
(306, '2023-08-28 06:54:11', 'akter', '59.98.3.135', NULL),
(307, '2023-09-05 05:50:10', 'akter', '59.98.3.135', NULL),
(308, '2023-09-05 09:58:58', 'akter', '59.98.3.135', '2023-09-05 09:59:39'),
(309, '2023-09-05 09:59:42', 'akter', '59.98.3.135', '2023-09-05 10:00:42'),
(310, '2023-09-05 10:00:44', 'akter', '59.98.3.135', '2023-09-05 10:01:10'),
(311, '2023-09-06 05:44:19', 'akter', '59.98.3.135', NULL),
(312, '2023-09-14 09:49:16', 'akter', '59.98.3.135', NULL),
(313, '2023-09-15 04:58:31', 'akter', '59.98.3.135', NULL),
(314, '2023-09-15 06:03:08', 'akter', '59.98.3.135', NULL),
(315, '2023-09-15 10:59:49', 'akter', '59.98.3.135', '2023-09-15 11:06:16'),
(316, '2023-09-15 11:06:18', 'akter', '59.98.3.135', '2023-09-15 11:18:42'),
(317, '2023-09-15 11:18:44', 'akter', '59.98.3.135', NULL),
(318, '2023-09-16 04:53:53', 'akter', '59.98.3.135', '2023-09-16 06:05:12'),
(319, '2023-09-16 06:05:14', 'akter', '59.98.3.135', '2023-09-16 06:05:37'),
(320, '2023-09-16 06:05:38', 'akter', '59.98.3.135', '2023-09-16 06:07:11'),
(321, '2023-09-16 06:07:44', 'akter', '59.98.3.135', NULL),
(322, '2023-09-18 06:46:33', 'akter', '59.98.3.135', '2023-09-18 09:07:45'),
(323, '2023-09-18 08:42:21', 'sss', '103.242.190.117', '2023-09-18 09:08:11'),
(324, '2023-09-18 09:07:47', 'akter', '59.98.3.135', '2023-09-18 09:40:57'),
(325, '2023-09-20 09:31:07', 'akter', '59.98.3.135', NULL),
(326, '2023-09-25 10:02:04', 'akter', '59.98.3.135', NULL),
(327, '2023-09-26 11:17:48', 'akter', '59.98.3.135', NULL),
(328, '2023-09-27 06:22:52', 'akter', '59.98.3.135', NULL),
(329, '2023-10-10 05:30:43', 'sss', '115.187.33.24', '2023-10-10 05:31:35'),
(330, '2023-10-10 05:31:42', 'sss', '115.187.33.24', '2023-10-10 05:33:46'),
(331, '2023-10-10 05:31:50', 'akter', '45.123.109.143', '2023-10-10 05:32:18'),
(332, '2023-10-10 05:35:08', 'akter', '45.123.109.143', NULL),
(333, '2023-10-10 05:40:53', 'akter', '59.98.3.135', '2023-10-10 05:51:15'),
(334, '2023-10-10 06:52:10', 'akter', '59.98.3.135', NULL),
(335, '2023-10-10 09:38:39', 'akter', '59.98.3.135', '2023-10-10 10:56:18'),
(336, '2023-10-10 10:43:23', 'akter', '45.123.109.143', NULL),
(337, '2023-10-10 10:56:30', 'akter', '59.98.3.135', '2023-10-10 10:58:31'),
(338, '2023-10-10 11:02:15', 'akter', '59.98.3.135', '2023-10-10 11:05:56'),
(339, '2023-10-11 05:16:07', 'akter', '59.98.3.135', '2023-10-11 05:21:36'),
(340, '2023-10-11 09:22:52', 'akter', '59.98.3.135', '2023-10-11 09:28:19'),
(341, '2023-10-12 11:57:54', 'akter', '59.98.3.135', NULL),
(342, '2023-10-12 12:01:20', 'akter', '59.98.3.135', '2023-10-12 12:18:05'),
(343, '2023-10-13 04:30:16', 'akter', '59.98.3.135', NULL),
(344, '2023-10-13 06:11:47', 'akter', '59.98.3.135', '2023-10-13 06:17:26'),
(345, '2023-10-13 06:24:59', 'sss', '115.187.33.24', '2023-10-13 06:51:17'),
(346, '2023-10-13 06:42:24', 'akter', '59.98.3.135', '2023-10-13 06:46:21'),
(347, '2023-10-16 11:42:43', 'akter', '59.98.3.135', '2023-10-16 11:43:52'),
(348, '2023-10-18 04:44:32', 'akter', '59.98.3.135', '2023-10-18 05:32:47'),
(349, '2023-10-18 05:53:46', 'akter', '45.123.109.143', NULL),
(350, '2023-10-18 07:22:13', 'akter', '59.98.3.135', '2023-10-18 10:27:10'),
(351, '2023-10-18 10:48:55', 'akter', '59.98.3.135', '2023-10-18 10:50:56'),
(352, '2023-10-18 10:55:06', 'akter', '59.98.3.135', '2023-10-18 11:36:58'),
(353, '2023-10-19 09:10:53', 'akter', '45.123.109.143', NULL),
(354, '2023-11-10 09:49:59', 'akter', '59.98.3.135', '2023-11-10 09:52:00'),
(355, '2023-11-13 07:51:11', 'akter', '59.98.3.135', '2023-11-13 08:36:06'),
(356, '2023-11-13 09:12:44', 'akter', '59.98.3.135', '2023-11-13 09:21:41'),
(357, '2023-11-16 07:47:30', 'akter', '59.98.3.135', NULL),
(358, '2023-11-16 09:32:29', 'akter', '59.98.3.135', '2023-11-16 09:49:27'),
(359, '2023-11-16 09:49:48', 'akter', '59.98.3.135', '2023-11-16 09:50:23'),
(360, '2023-11-18 06:18:38', 'akter', '59.98.3.135', '2023-11-18 06:30:03'),
(361, '2023-11-18 06:58:59', 'akter', '59.98.3.135', '2023-11-18 07:03:26'),
(362, '2023-11-21 06:05:05', 'akter', '59.98.3.135', '2023-11-21 09:05:38'),
(363, '2023-11-21 09:05:43', 'akter', '59.98.3.135', '2023-11-21 09:20:04'),
(364, '2023-11-21 09:12:45', 'sss', '103.242.190.119', '2023-11-21 11:26:55'),
(365, '2023-11-21 09:50:52', 'akter', '59.98.3.135', '2023-11-21 10:07:45'),
(366, '2023-11-21 10:07:50', 'akter', '59.98.3.135', '2023-11-21 10:08:18'),
(367, '2023-11-21 10:39:38', 'akter', '59.98.3.135', '2023-11-21 10:46:43'),
(368, '2023-11-21 10:50:23', 'akter', '59.98.3.135', '2023-11-21 10:56:08'),
(369, '2023-11-24 05:13:24', 'akter', '59.98.3.135', NULL),
(370, '2023-11-29 08:17:54', 'akter', '59.98.3.135', '2023-11-29 08:22:16'),
(371, '2023-12-07 06:49:25', 'akter', '59.98.3.135', '2023-12-07 06:53:42'),
(372, '2023-12-07 07:20:07', 'akter', '59.98.3.135', '2023-12-07 07:20:50'),
(373, '2023-12-08 05:12:17', 'akter', '59.98.3.135', '2023-12-08 05:13:27'),
(374, '2023-12-11 08:58:56', 'akter', '59.98.3.135', NULL),
(375, '2023-12-12 11:07:48', 'akter', '59.98.3.135', NULL),
(376, '2023-12-19 06:26:01', 'akter', '59.98.3.135', NULL),
(377, '2023-12-19 06:54:59', 'akter', '59.98.3.135', NULL),
(378, '2023-12-20 04:47:48', 'akter', '59.98.3.135', NULL),
(379, '2023-12-21 04:58:12', 'akter', '59.98.3.135', NULL),
(380, '2023-12-21 05:31:30', 'akter', '106.207.68.25', '2023-12-21 06:12:11'),
(381, '2023-12-21 06:33:43', 'akter', '59.98.3.135', NULL),
(382, '2023-12-21 06:35:45', 'akter', '59.98.3.135', NULL),
(383, '2023-12-21 06:39:30', 'akter', '59.98.3.135', NULL),
(384, '2023-12-22 09:03:45', 'akter', '59.98.3.135', NULL),
(385, '2023-12-22 11:04:42', 'akter', '59.98.3.135', NULL),
(386, '2023-12-26 05:23:07', 'akter', '59.98.3.135', NULL),
(387, '2023-12-26 07:41:18', 'akter', '59.98.3.135', '2023-12-26 07:55:27'),
(388, '2023-12-26 11:06:26', 'akter', '59.98.3.135', NULL),
(389, '2023-12-27 05:15:30', 'akter', '59.98.3.135', NULL),
(390, '2023-12-28 09:20:01', 'akter', '59.98.3.135', '2023-12-28 09:25:45'),
(391, '2024-01-19 06:44:14', 'akter', '59.98.3.135', NULL),
(392, '2024-01-19 10:50:38', 'akter', '59.98.3.135', NULL),
(393, '2024-01-22 04:55:19', 'akter', '59.98.3.135', NULL),
(394, '2024-01-25 04:51:14', 'akter', '59.98.3.135', NULL),
(395, '2024-01-25 04:53:24', 'akter', '59.98.3.135', NULL),
(396, '2024-01-25 05:24:42', 'akter', '59.98.3.135', '2024-01-25 05:31:24'),
(397, '2024-01-25 07:10:34', 'sss', '103.242.190.58', '2024-01-25 07:38:22'),
(398, '2024-01-25 07:25:29', 'akter', '59.98.3.135', '2024-01-25 07:26:05'),
(399, '2024-01-25 07:26:07', 'akter', '59.98.3.135', NULL),
(400, '2024-01-25 07:38:54', 'sss', '103.242.190.58', NULL),
(401, '2024-01-25 07:52:30', 'sss', '103.242.190.58', '2024-01-25 08:09:22'),
(402, '2024-01-25 08:53:54', 'sss', '103.87.142.149', '2024-01-25 10:45:56'),
(403, '2024-02-05 07:57:25', 'sss', '136.232.64.10', '2024-02-05 07:58:12'),
(404, '2024-02-17 10:40:03', 'akter', '59.98.3.135', NULL),
(405, '2024-02-19 04:56:48', 'akter', '59.98.3.135', NULL),
(406, '2024-02-26 06:15:26', 'akter', '223.177.248.235', NULL),
(407, '2024-02-26 06:46:52', 'akter', '223.177.248.235', NULL),
(408, '2024-02-26 08:24:03', 'sss', '136.232.64.10', '2024-02-26 09:20:59'),
(409, '2024-02-26 08:38:22', 'sss', '136.232.64.10', NULL),
(410, '2024-02-27 04:54:55', 'akter', '223.177.248.235', '2024-02-27 05:47:39'),
(411, '2024-03-12 10:08:55', 'akter', '223.177.248.235', '2024-03-12 10:12:18'),
(412, '2024-03-23 06:33:20', 'akter', '223.177.248.235', NULL),
(413, '2024-03-27 07:01:21', 'akter', '223.177.248.235', NULL),
(414, '2024-03-28 04:53:24', 'akter', '223.177.248.235', NULL),
(415, '2024-03-28 07:54:39', 'akter', '223.177.248.235', NULL),
(416, '2024-03-31 06:50:41', 'akter', '223.177.248.235', '2024-03-31 06:56:17'),
(417, '2024-03-31 07:22:27', 'akter', '223.177.248.235', '2024-03-31 08:06:38'),
(418, '2024-04-02 07:42:02', 'akter', '223.177.248.235', NULL),
(419, '2024-04-04 06:32:08', 'akter', '223.177.248.235', '2024-04-04 07:05:04'),
(420, '2024-04-05 09:35:31', 'akter', '223.177.248.235', '2024-04-05 09:37:36'),
(421, '2024-04-12 11:06:23', 'akter', '223.177.248.235', '2024-04-12 11:09:30'),
(422, '2024-04-15 11:35:18', 'akter', '223.177.248.235', '2024-04-15 11:42:06'),
(423, '2024-04-16 10:34:46', 'akter', '223.177.248.235', NULL),
(424, '2024-04-24 09:16:58', 'akter', '223.177.248.235', NULL),
(425, '2024-04-24 11:09:25', 'akter', '223.177.248.235', NULL),
(426, '2024-04-24 11:49:03', 'akter', '223.177.248.235', NULL),
(427, '2024-04-25 04:34:37', 'akter', '223.177.248.235', NULL),
(428, '2024-05-16 07:03:03', 'akter', '59.98.3.135', NULL),
(429, '2024-05-28 04:55:07', 'akter', '223.177.248.235', NULL),
(430, '2024-05-28 05:34:58', 'akter', '223.177.248.235', '2024-05-28 05:52:38'),
(431, '2024-05-28 07:38:31', 'akter', '223.177.248.235', NULL),
(432, '2024-05-28 08:21:49', 'akter', '223.177.248.235', NULL),
(433, '2024-05-28 08:24:42', 'akter', '223.177.248.235', NULL),
(434, '2024-06-06 11:07:30', 'akter', '223.177.248.235', '2024-06-06 11:12:45'),
(435, '2024-06-14 09:42:12', 'akter', '223.177.248.235', NULL),
(436, '2024-06-15 06:54:44', 'akter', '223.177.248.235', '2024-06-15 06:57:01'),
(437, '2024-06-26 06:29:59', 'akter', '223.177.248.235', NULL),
(438, '2024-06-26 06:38:25', 'akter', '223.177.248.235', '2024-06-26 07:30:25'),
(439, '2024-06-26 07:33:51', 'akter', '223.177.248.235', NULL),
(440, '2024-06-26 07:37:30', 'akter', '223.177.248.235', NULL),
(441, '2024-06-26 08:27:26', 'akter', '223.177.248.235', NULL),
(442, '2024-06-26 09:37:44', 'akter', '223.177.248.235', NULL),
(443, '2024-06-26 09:38:42', 'sss', '122.176.27.53', NULL),
(444, '2024-06-27 08:09:49', 'akter', '223.177.248.235', '2024-06-27 08:10:14'),
(445, '2024-07-18 04:38:47', 'sss', '136.232.64.10', NULL),
(446, '2024-07-18 06:00:43', 'akter', '223.177.248.235', NULL),
(447, '2024-07-18 01:32:33', 'sss', '::1', '2024-07-18 01:32:49'),
(448, '2024-07-18 01:38:16', 'sss', '::1', '2024-07-18 01:59:07'),
(449, '2024-07-18 01:59:14', 'sss', '::1', '2024-07-18 03:00:53'),
(450, '2024-07-19 06:50:44', 'sss', '::1', NULL),
(451, '2024-07-22 06:49:46', 'sss', '::1', NULL),
(452, '2024-07-24 07:27:58', 'sss', '::1', '2024-07-24 08:56:15'),
(453, '2024-07-24 08:56:25', 'sss', '::1', NULL),
(454, '2024-07-25 06:48:49', 'sss', '::1', '2024-07-25 03:10:50'),
(455, '2024-07-26 06:46:29', 'sss', '::1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_deductions`
--

CREATE TABLE `td_deductions` (
  `emp_code` int(11) NOT NULL,
  `effective_date` date NOT NULL,
  `catg_id` int(11) NOT NULL,
  `gross` float(10,2) NOT NULL,
  `it` float(10,2) NOT NULL,
  `cpf` float(10,2) NOT NULL,
  `gpf` float(10,2) NOT NULL,
  `gigs` float(10,2) NOT NULL,
  `lpf` float(10,2) NOT NULL,
  `fa` float(10,2) NOT NULL,
  `gi` float(10,2) NOT NULL,
  `top` float(10,2) NOT NULL,
  `eccs` float(10,2) NOT NULL,
  `hblp` float(10,2) NOT NULL,
  `hbli` float(10,2) NOT NULL,
  `s_adv` float(10,2) NOT NULL,
  `tot_diduction` float(10,2) NOT NULL,
  `net_sal` float(10,2) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `td_deductions`
--

INSERT INTO `td_deductions` (`emp_code`, `effective_date`, `catg_id`, `gross`, `it`, `cpf`, `gpf`, `gigs`, `lpf`, `fa`, `gi`, `top`, `eccs`, `hblp`, `hbli`, `s_adv`, `tot_diduction`, `net_sal`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, '2023-06-23', 1, 74998.00, 0.00, 8506.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 8706.00, 66292.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(1, '2023-08-21', 1, 77390.00, 0.00, 8793.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 8993.00, 68397.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(1, '2023-09-18', 1, 76194.00, 0.00, 8649.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 8849.00, 67345.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(1, '2023-10-13', 1, 79089.00, 0.00, 8981.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 9181.00, 69908.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(1, '2023-11-16', 1, 83416.00, 0.00, 9500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 9700.00, 73716.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(1, '2023-12-26', 1, 81252.00, 0.00, 9241.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 9441.00, 71811.00, NULL, '2023-12-26 07:40:55', 'akter', '2023-12-26 07:53:08'),
(1, '2024-01-22', 1, 81252.00, 0.00, 9241.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 9441.00, 71811.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(1, '2024-02-26', 1, 81252.00, 0.00, 9241.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 9441.00, 71811.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(1, '2024-03-28', 1, 81252.00, 0.00, 9241.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 9441.00, 71811.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(1, '2024-04-25', 1, 81252.00, 0.00, 9241.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 9441.00, 71811.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(1, '2024-05-28', 1, 81252.00, 0.00, 9241.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 9441.00, 71811.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(1, '2024-06-26', 1, 81252.00, 0.00, 9241.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 9441.00, 71811.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(2, '2023-06-23', 1, 112691.00, 3000.00, 12821.00, 0.00, 0.00, 1386.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 17407.00, 95284.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(2, '2023-08-21', 1, 116295.00, 3000.00, 13254.00, 0.00, 0.00, 1386.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 17840.00, 98455.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(2, '2023-09-18', 1, 114493.00, 3000.00, 13037.00, 0.00, 0.00, 1386.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 17623.00, 96870.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(2, '2023-10-13', 1, 114493.00, 3000.00, 13037.00, 0.00, 0.00, 1386.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 17623.00, 96870.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(2, '2023-11-16', 1, 120775.00, 3000.00, 13791.00, 0.00, 0.00, 1386.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 18377.00, 102398.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(2, '2023-12-26', 1, 117634.00, 10000.00, 13414.00, 0.00, 0.00, 876.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 24490.00, 93144.00, NULL, '2023-12-26 07:40:55', 'akter', '2023-12-26 07:53:08'),
(2, '2024-01-22', 1, 117634.00, 10000.00, 13414.00, 0.00, 0.00, 876.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 24490.00, 93144.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(2, '2024-02-26', 1, 117634.00, 30000.00, 13414.00, 0.00, 0.00, 876.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 44490.00, 73144.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(2, '2024-03-28', 1, 117634.00, 0.00, 13414.00, 0.00, 0.00, 876.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 14490.00, 103144.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(2, '2024-04-25', 1, 117634.00, 5000.00, 13414.00, 0.00, 0.00, 876.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 19490.00, 98144.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(2, '2024-05-28', 1, 117634.00, 5000.00, 13414.00, 0.00, 0.00, 876.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 19490.00, 98144.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(2, '2024-06-26', 1, 117634.00, 5000.00, 13414.00, 0.00, 0.00, 876.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 19490.00, 98144.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(3, '2023-06-23', 1, 69300.00, 0.00, 7854.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 8054.00, 61246.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(3, '2023-08-21', 1, 71507.00, 0.00, 8118.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 8318.00, 63189.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(3, '2023-09-18', 1, 73299.00, 0.00, 8318.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 8518.00, 64781.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(3, '2023-10-13', 1, 73299.00, 0.00, 8318.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 8518.00, 64781.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(3, '2023-11-16', 1, 77306.00, 0.00, 8799.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 8999.00, 68307.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(3, '2023-12-26', 1, 75302.00, 0.00, 8558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 8758.00, 66544.00, NULL, '2023-12-26 07:40:55', 'akter', '2023-12-26 07:53:08'),
(3, '2024-01-22', 1, 75302.00, 0.00, 8558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 8758.00, 66544.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(3, '2024-02-26', 1, 75302.00, 0.00, 8558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 8758.00, 66544.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(3, '2024-03-28', 1, 75302.00, 43535.00, 8558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 52293.00, 23009.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(3, '2024-04-25', 1, 75302.00, 3500.00, 8558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 12258.00, 63044.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(3, '2024-05-28', 1, 75302.00, 3500.00, 8558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 12258.00, 63044.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(3, '2024-06-26', 1, 75302.00, 3500.00, 8558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 12258.00, 63044.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(4, '2023-06-23', 1, 100641.00, 2000.00, 11442.00, 0.00, 0.00, 627.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 14269.00, 86372.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(4, '2023-08-21', 1, 103858.00, 2000.00, 11828.00, 0.00, 0.00, 243.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 14271.00, 89587.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(4, '2023-09-18', 1, 102250.00, 2000.00, 11635.00, 0.00, 0.00, 243.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 14078.00, 88172.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(4, '2023-10-13', 1, 102250.00, 2000.00, 11635.00, 0.00, 0.00, 243.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 14078.00, 88172.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(4, '2023-11-16', 1, 107855.00, 20505.00, 12307.00, 0.00, 0.00, 243.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 33255.00, 74600.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(5, '2023-06-23', 1, 97792.00, 5000.00, 11115.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 16315.00, 81477.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(5, '2023-08-21', 1, 103812.00, 5000.00, 11822.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 17022.00, 86790.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(5, '2023-09-18', 1, 102250.00, 5000.00, 11635.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 16835.00, 85415.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(5, '2023-10-13', 1, 102250.00, 5000.00, 11635.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 16835.00, 85415.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(5, '2023-11-16', 1, 107855.00, 5000.00, 12307.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 17507.00, 90348.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(5, '2023-12-26', 1, 105052.00, 5000.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 17171.00, 87881.00, NULL, '2023-12-26 07:40:55', 'akter', '2023-12-26 07:53:08'),
(5, '2024-01-22', 1, 105052.00, 5000.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 17171.00, 87881.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(5, '2024-02-26', 1, 105052.00, 5000.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 17171.00, 87881.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(5, '2024-03-28', 1, 105052.00, 37124.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 49295.00, 55757.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(5, '2024-04-25', 1, 105052.00, 0.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 12171.00, 92881.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(5, '2024-05-28', 1, 105052.00, 0.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 12171.00, 92881.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(5, '2024-06-26', 1, 108027.00, 0.00, 12312.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 12512.00, 95515.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(6, '2023-06-23', 1, 94943.00, 0.00, 10789.00, 0.00, 0.00, 0.00, 0.00, 39826.00, 200.00, 19572.00, 2830.00, 913.00, 0.00, 74130.00, 20813.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(6, '2023-08-21', 1, 97976.00, 0.00, 11153.00, 0.00, 0.00, 0.00, 0.00, 39826.00, 200.00, 19572.00, 2830.00, 913.00, 0.00, 74494.00, 23482.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(6, '2023-09-18', 1, 96459.00, 0.00, 10971.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 11171.00, 85288.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(6, '2023-10-13', 1, 96459.00, 0.00, 10971.00, 0.00, 0.00, 0.00, 0.00, 40426.00, 200.00, 12614.00, 2830.00, 585.00, 0.00, 67626.00, 28833.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(6, '2023-11-16', 1, 104720.00, 0.00, 11947.00, 0.00, 0.00, 0.00, 0.00, 40426.00, 200.00, 20282.00, 3571.00, 432.00, 0.00, 76858.00, 27862.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(6, '2023-12-26', 1, 102077.00, 0.00, 11630.00, 0.00, 0.00, 0.00, 0.00, 41034.00, 200.00, 18263.00, 3571.00, 927.00, 0.00, 75625.00, 26452.00, NULL, '2023-12-26 07:40:55', 'akter', '2023-12-26 07:53:08'),
(6, '2024-01-22', 1, 102077.00, 0.00, 11630.00, 0.00, 0.00, 0.00, 0.00, 41342.00, 200.00, 15756.00, 3571.00, 795.00, 0.00, 73294.00, 28783.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(6, '2024-02-26', 1, 102077.00, 0.00, 11630.00, 0.00, 0.00, 0.00, 0.00, 41965.00, 200.00, 17060.00, 3571.00, 855.00, 0.00, 75281.00, 26796.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(6, '2024-03-28', 1, 102077.00, 0.00, 11630.00, 0.00, 0.00, 0.00, 0.00, 41955.00, 200.00, 18297.00, 3571.00, 911.00, 0.00, 76564.00, 25513.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(6, '2024-04-25', 1, 102077.00, 0.00, 11630.00, 0.00, 0.00, 0.00, 0.00, 42279.00, 200.00, 12298.00, 3571.00, 608.00, 0.00, 70586.00, 31491.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(6, '2024-05-28', 1, 102077.00, 0.00, 11630.00, 0.00, 0.00, 0.00, 0.00, 42597.00, 200.00, 16566.00, 3571.00, 814.00, 0.00, 75378.00, 26699.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(6, '2024-06-26', 1, 102077.00, 0.00, 11630.00, 0.00, 0.00, 0.00, 0.00, 42916.00, 200.00, 14253.00, 3571.00, 695.00, 0.00, 73265.00, 28812.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(7, '2023-06-23', 1, 49388.00, 0.00, 5574.00, 0.00, 0.00, 0.00, 0.00, 7639.00, 200.00, 8391.00, 2500.00, 807.00, 0.00, 25111.00, 24277.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(7, '2023-08-21', 1, 50954.00, 0.00, 5762.00, 0.00, 0.00, 0.00, 0.00, 7639.00, 200.00, 8391.00, 2500.00, 807.00, 0.00, 25299.00, 25655.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(7, '2023-09-18', 1, 50171.00, 0.00, 5668.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 5868.00, 44303.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(7, '2023-10-13', 1, 50171.00, 0.00, 5668.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 517.00, 0.00, 8885.00, 41286.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(7, '2023-11-16', 1, 52902.00, 0.00, 5996.00, 0.00, 0.00, 0.00, 0.00, 3963.00, 200.00, 6037.00, 2500.00, 828.00, 0.00, 19524.00, 33378.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(7, '2023-12-26', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 0.00, 0.00, 1731.00, 200.00, 8269.00, 2500.00, 744.00, 0.00, 19276.00, 32261.00, NULL, '2023-12-26 07:40:55', 'akter', '2023-12-26 07:53:08'),
(7, '2024-01-22', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 7254.00, 2500.00, 640.00, 0.00, 16426.00, 35111.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(7, '2024-02-26', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 8005.00, 2500.00, 403.00, 0.00, 16940.00, 34597.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(7, '2024-03-28', 1, 54137.00, 0.00, 6130.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 8755.00, 2500.00, 990.00, 0.00, 18575.00, 35562.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(7, '2024-04-25', 1, 54137.00, 0.00, 6130.00, 0.00, 0.00, 0.00, 0.00, 3996.00, 200.00, 6004.00, 2500.00, 667.00, 0.00, 19497.00, 34640.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(7, '2024-05-28', 1, 54137.00, 0.00, 6130.00, 0.00, 0.00, 0.00, 0.00, 1778.00, 200.00, 8222.00, 2500.00, 902.00, 0.00, 19732.00, 34405.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(7, '2024-06-26', 1, 54137.00, 0.00, 6130.00, 0.00, 0.00, 0.00, 0.00, 3000.00, 200.00, 7213.00, 2500.00, 779.00, 0.00, 19822.00, 34315.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(8, '2023-06-23', 1, 40644.00, 0.00, 4516.00, 0.00, 0.00, 0.00, 0.00, 2000.00, 200.00, 5480.00, 0.00, 0.00, 0.00, 12196.00, 28448.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(8, '2023-08-21', 1, 41914.00, 0.00, 4668.00, 0.00, 0.00, 0.00, 0.00, 2000.00, 200.00, 5480.00, 0.00, 0.00, 0.00, 12348.00, 29566.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(8, '2023-09-18', 1, 41279.00, 0.00, 4592.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 4792.00, 36487.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(8, '2023-10-13', 1, 41279.00, 0.00, 4592.00, 0.00, 0.00, 0.00, 0.00, 5147.00, 200.00, 3631.00, 2500.00, 403.00, 0.00, 16473.00, 24806.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(8, '2023-11-16', 1, 45717.00, 0.00, 5113.00, 0.00, 0.00, 0.00, 0.00, 103.00, 200.00, 5897.00, 0.00, 459.00, 0.00, 11772.00, 33945.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(8, '2023-12-26', 1, 44611.00, 0.00, 4980.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 5180.00, 39431.00, NULL, '2023-12-26 07:40:55', 'akter', '2023-12-26 07:53:08'),
(8, '2024-01-22', 1, 44611.00, 0.00, 4980.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 1275.00, 0.00, 0.00, 0.00, 6455.00, 38156.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(8, '2024-02-26', 1, 44611.00, 0.00, 4980.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 4080.00, 0.00, 0.00, 0.00, 9260.00, 35351.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(8, '2024-03-28', 1, 44611.00, 0.00, 4980.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 4463.00, 0.00, 0.00, 0.00, 9643.00, 34968.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(8, '2024-04-25', 1, 44611.00, 0.00, 4980.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 3060.00, 2500.00, 668.00, 0.00, 11408.00, 33203.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(8, '2024-05-28', 1, 44611.00, 0.00, 4980.00, 0.00, 0.00, 0.00, 0.00, 13694.00, 200.00, 16274.00, 2500.00, 903.00, 0.00, 38551.00, 6060.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(8, '2024-06-26', 1, 44611.00, 0.00, 4980.00, 0.00, 0.00, 0.00, 0.00, 13797.00, 200.00, 14203.00, 2500.00, 780.00, 0.00, 36460.00, 8151.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(9, '2023-06-23', 1, 46897.00, 0.00, 5289.00, 0.00, 0.00, 0.00, 0.00, 5487.00, 200.00, 16034.00, 2500.00, 854.00, 0.00, 30364.00, 16533.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(9, '2023-08-21', 1, 50914.00, 0.00, 5757.00, 0.00, 0.00, 0.00, 0.00, 4246.00, 200.00, 16034.00, 2500.00, 854.00, 0.00, 29591.00, 21323.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(9, '2023-09-18', 1, 50171.00, 0.00, 5668.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 5868.00, 44303.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(9, '2023-10-13', 1, 50171.00, 0.00, 5668.00, 0.00, 0.00, 0.00, 0.00, 10195.00, 200.00, 11605.00, 2500.00, 201.00, 0.00, 30369.00, 19802.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(9, '2023-11-16', 1, 52902.00, 0.00, 5996.00, 0.00, 0.00, 0.00, 0.00, 2900.00, 200.00, 18900.00, 2500.00, 1018.00, 0.00, 31514.00, 21388.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(9, '2023-12-26', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 0.00, 0.00, 4499.00, 200.00, 17301.00, 2500.00, 918.00, 0.00, 31250.00, 20287.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(9, '2024-01-22', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 0.00, 0.00, 6635.00, 200.00, 15172.00, 2500.00, 793.00, 0.00, 31132.00, 20405.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(9, '2024-02-26', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 0.00, 0.00, 5118.00, 200.00, 16689.00, 2500.00, 859.00, 0.00, 31198.00, 20339.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(9, '2024-03-28', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 0.00, 0.00, 3598.00, 200.00, 18209.00, 2500.00, 923.00, 0.00, 31262.00, 20275.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(9, '2024-04-25', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 0.00, 0.00, 9342.00, 200.00, 12465.00, 0.00, 0.00, 0.00, 27839.00, 23698.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(9, '2024-05-28', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 0.00, 0.00, 4743.00, 200.00, 17064.00, 2500.00, 1007.00, 0.00, 31346.00, 20191.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(9, '2024-06-26', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 1570.00, 0.00, 6846.00, 200.00, 14961.00, 2500.00, 820.00, 0.00, 32729.00, 18808.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(10, '2023-06-23', 1, 38013.00, 0.00, 4272.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 854.00, 0.00, 7776.00, 30237.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(10, '2023-08-21', 1, 39213.00, 0.00, 4416.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 854.00, 0.00, 7920.00, 31293.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(10, '2023-09-18', 1, 38613.00, 0.00, 4344.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4494.00, 34119.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(10, '2023-10-13', 1, 40779.00, 0.00, 4592.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 4792.00, 35987.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(10, '2023-11-16', 1, 42991.00, 0.00, 4857.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 5057.00, 37934.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(10, '2023-12-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 792.00, 0.00, 8217.00, 33668.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(10, '2024-01-22', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 806.00, 0.00, 8231.00, 33654.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(10, '2024-02-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 875.00, 0.00, 8300.00, 33585.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(10, '2024-03-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 940.00, 0.00, 8365.00, 33520.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(10, '2024-04-25', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 633.00, 0.00, 8058.00, 33827.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(10, '2024-05-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 854.00, 0.00, 8279.00, 33606.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(10, '2024-06-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 737.00, 0.00, 8162.00, 33723.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(11, '2023-06-23', 1, 38013.00, 0.00, 4272.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 902.00, 0.00, 7824.00, 30189.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(11, '2023-08-21', 1, 39213.00, 0.00, 4416.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 902.00, 0.00, 7968.00, 31245.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(11, '2023-09-18', 1, 38613.00, 0.00, 4344.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4494.00, 34119.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(11, '2023-10-13', 1, 40779.00, 0.00, 4592.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 580.00, 0.00, 7872.00, 32907.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(11, '2023-11-16', 1, 42991.00, 0.00, 4857.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 932.00, 0.00, 8489.00, 34502.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(11, '2023-12-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 450.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 839.00, 0.00, 8714.00, 33171.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(11, '2024-01-22', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 450.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 723.00, 0.00, 8598.00, 33287.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(11, '2024-02-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 450.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 921.00, 0.00, 8796.00, 33089.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(11, '2024-03-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 450.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 990.00, 0.00, 8865.00, 33020.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(11, '2024-04-25', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 450.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 667.00, 0.00, 8542.00, 33343.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(11, '2024-05-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 450.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 902.00, 0.00, 8777.00, 33108.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(11, '2024-06-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 450.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 779.00, 0.00, 8654.00, 33231.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(12, '2023-06-23', 1, 38013.00, 0.00, 4272.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4422.00, 33591.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(12, '2023-08-21', 1, 39213.00, 0.00, 4416.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4566.00, 34647.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(12, '2023-09-18', 1, 38613.00, 0.00, 4344.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4494.00, 34119.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(12, '2023-10-13', 1, 40779.00, 0.00, 4592.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 4792.00, 35987.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(12, '2023-11-16', 1, 42991.00, 0.00, 4857.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 5057.00, 37934.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(12, '2023-12-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 4925.00, 36960.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(12, '2024-01-22', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 4925.00, 36960.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(12, '2024-02-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 4925.00, 36960.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(12, '2024-03-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 4925.00, 36960.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(12, '2024-04-25', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 4925.00, 36960.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(12, '2024-05-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 4925.00, 36960.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(12, '2024-06-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 4925.00, 36960.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(13, '2023-06-23', 1, 38013.00, 0.00, 4272.00, 0.00, 0.00, 0.00, 0.00, 1389.00, 150.00, 1526.00, 2500.00, 665.00, 0.00, 10502.00, 27511.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(13, '2023-08-21', 1, 39213.00, 0.00, 4416.00, 0.00, 0.00, 0.00, 0.00, 1389.00, 150.00, 1526.00, 2500.00, 665.00, 0.00, 10646.00, 28567.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(13, '2023-09-18', 1, 38613.00, 0.00, 4344.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4494.00, 34119.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(13, '2023-10-13', 1, 40779.00, 0.00, 4592.00, 0.00, 0.00, 0.00, 0.00, 1698.00, 200.00, 1002.00, 2500.00, 230.00, 0.00, 10222.00, 30557.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(13, '2023-11-16', 1, 42991.00, 0.00, 4857.00, 0.00, 0.00, 0.00, 0.00, 1075.00, 200.00, 1625.00, 2500.00, 1018.00, 0.00, 11275.00, 31716.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(13, '2023-12-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 1219.00, 200.00, 1481.00, 2500.00, 918.00, 0.00, 11043.00, 30842.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(13, '2024-01-22', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 983.00, 200.00, 1293.00, 2500.00, 793.00, 0.00, 10494.00, 31391.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(13, '2024-02-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 1281.00, 200.00, 1419.00, 2500.00, 859.00, 0.00, 10984.00, 30901.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(13, '2024-03-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 1159.00, 200.00, 1541.00, 2500.00, 923.00, 0.00, 11048.00, 30837.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(13, '2024-04-25', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 1650.00, 200.00, 1050.00, 2500.00, 621.00, 0.00, 10746.00, 31139.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(13, '2024-05-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 1270.00, 200.00, 1430.00, 2500.00, 839.00, 0.00, 10964.00, 30921.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(13, '2024-06-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 1453.00, 200.00, 1247.00, 2500.00, 723.00, 0.00, 10848.00, 31037.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(14, '2023-06-23', 1, 38013.00, 0.00, 4272.00, 0.00, 0.00, 0.00, 0.00, 6000.00, 150.00, 13422.00, 2500.00, 649.00, 0.00, 26993.00, 11020.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(14, '2023-08-21', 1, 39213.00, 0.00, 4416.00, 0.00, 0.00, 0.00, 0.00, 6000.00, 150.00, 13422.00, 2500.00, 649.00, 0.00, 27137.00, 12076.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(14, '2023-09-18', 1, 38613.00, 0.00, 4344.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4494.00, 34119.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(14, '2023-10-13', 1, 40779.00, 0.00, 4592.00, 0.00, 0.00, 0.00, 0.00, 9364.00, 200.00, 8882.00, 2500.00, 411.00, 0.00, 25949.00, 14830.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(14, '2023-11-16', 1, 42991.00, 0.00, 4857.00, 0.00, 0.00, 0.00, 0.00, 3795.00, 200.00, 14451.00, 2500.00, 656.00, 0.00, 26459.00, 16532.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(14, '2023-12-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1047.00, 0.00, 5030.00, 200.00, 13216.00, 2500.00, 585.00, 0.00, 27303.00, 14582.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(14, '2024-01-22', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1047.00, 0.00, 5665.00, 200.00, 11578.00, 2500.00, 501.00, 0.00, 26216.00, 15669.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(14, '2024-02-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1047.00, 0.00, 5515.00, 200.00, 12731.00, 2500.00, 537.00, 0.00, 27255.00, 14630.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(14, '2024-03-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1047.00, 0.00, 4889.00, 200.00, 15510.00, 2500.00, 571.00, 0.00, 29442.00, 12443.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(14, '2024-04-25', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1047.00, 0.00, 4926.00, 200.00, 10919.00, 2500.00, 380.00, 0.00, 24697.00, 17188.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(14, '2024-05-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1047.00, 0.00, 4963.00, 200.00, 14974.00, 2500.00, 506.00, 0.00, 28915.00, 12970.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(14, '2024-06-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1047.00, 0.00, 5000.00, 200.00, 13123.00, 2500.00, 431.00, 0.00, 27026.00, 14859.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(15, '2023-06-23', 1, 38013.00, 0.00, 4272.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4422.00, 33591.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(15, '2023-08-21', 1, 39213.00, 0.00, 4416.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4566.00, 34647.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(15, '2023-09-18', 1, 38613.00, 0.00, 4344.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4494.00, 34119.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(15, '2023-10-13', 1, 40779.00, 0.00, 4592.00, 0.00, 0.00, 0.00, 0.00, 5077.00, 200.00, 4027.00, 2500.00, 601.00, 0.00, 16997.00, 23782.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(15, '2023-11-16', 1, 42991.00, 0.00, 4857.00, 0.00, 0.00, 0.00, 0.00, 2560.00, 200.00, 6544.00, 2500.00, 967.00, 0.00, 17628.00, 25363.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(15, '2023-12-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1109.00, 0.00, 3126.00, 200.00, 5978.00, 2500.00, 870.00, 0.00, 18508.00, 23377.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(15, '2024-01-22', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1109.00, 0.00, 2643.00, 200.00, 6411.00, 2500.00, 751.00, 0.00, 18339.00, 23546.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(15, '2024-02-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1109.00, 0.00, 2662.00, 200.00, 7870.00, 2500.00, 813.00, 0.00, 19879.00, 22006.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(15, '2024-03-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1109.00, 0.00, 2662.00, 200.00, 8584.00, 2500.00, 873.00, 0.00, 20653.00, 21232.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(15, '2024-04-25', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1109.00, 0.00, 2703.00, 200.00, 5871.00, 2500.00, 587.00, 0.00, 17695.00, 24190.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(15, '2024-05-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1109.00, 0.00, 2723.00, 200.00, 8050.00, 2500.00, 791.00, 0.00, 20098.00, 21787.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(15, '2024-06-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 1109.00, 0.00, 2743.00, 200.00, 7055.00, 2500.00, 719.00, 0.00, 19051.00, 22834.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(16, '2023-06-23', 1, 38013.00, 0.00, 4272.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4422.00, 33591.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(16, '2023-08-21', 1, 39213.00, 0.00, 4416.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4566.00, 34647.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(16, '2023-09-18', 1, 38613.00, 0.00, 4344.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4494.00, 34119.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(16, '2023-10-13', 1, 40779.00, 0.00, 4592.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 411.00, 0.00, 7703.00, 33076.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(16, '2023-11-16', 1, 42991.00, 0.00, 4857.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 656.00, 0.00, 8213.00, 34778.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(16, '2023-12-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 585.00, 0.00, 8010.00, 33875.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(16, '2024-01-22', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 501.00, 0.00, 7926.00, 33959.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(16, '2024-02-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 719.00, 0.00, 8144.00, 33741.00, 'akter', '2024-02-26 07:19:59', NULL, NULL),
(16, '2024-03-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 990.00, 0.00, 8415.00, 33470.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(16, '2024-04-25', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 2976.00, 2500.00, 667.00, 0.00, 11068.00, 30817.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(16, '2024-05-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 4093.00, 2500.00, 902.00, 0.00, 12420.00, 29465.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(16, '2024-06-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 3597.00, 2500.00, 779.00, 0.00, 11801.00, 30084.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(17, '2023-06-23', 1, 38013.00, 0.00, 4272.00, 0.00, 0.00, 0.00, 0.00, 4177.00, 150.00, 11975.00, 2500.00, 918.00, 0.00, 23992.00, 14021.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(17, '2023-08-21', 1, 39213.00, 0.00, 4416.00, 0.00, 0.00, 0.00, 0.00, 4177.00, 150.00, 11975.00, 2500.00, 918.00, 0.00, 24136.00, 15077.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(17, '2023-09-18', 1, 38613.00, 0.00, 4344.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4494.00, 34119.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(17, '2023-10-13', 1, 40779.00, 0.00, 4592.00, 0.00, 0.00, 0.00, 0.00, 6073.00, 200.00, 12427.00, 0.00, 0.00, 0.00, 23292.00, 17487.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(17, '2023-11-16', 1, 42991.00, 0.00, 4857.00, 0.00, 0.00, 0.00, 0.00, 2576.00, 200.00, 15924.00, 0.00, 0.00, 0.00, 23557.00, 19434.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(17, '2023-12-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 3924.00, 200.00, 14576.00, 0.00, 0.00, 0.00, 23425.00, 18460.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(17, '2024-01-22', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 5476.00, 200.00, 12781.00, 0.00, 0.00, 0.00, 23182.00, 18703.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(17, '2024-02-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 4440.00, 200.00, 14060.00, 2500.00, 1697.00, 0.00, 27622.00, 14263.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(17, '2024-03-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 2660.00, 200.00, 15340.00, 2500.00, 990.00, 0.00, 26415.00, 15470.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(17, '2024-04-25', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 7497.00, 200.00, 10503.00, 2500.00, 667.00, 0.00, 26092.00, 15793.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(17, '2024-05-28', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 6673.00, 200.00, 18937.00, 0.00, 0.00, 0.00, 30535.00, 11350.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(17, '2024-06-26', 1, 41885.00, 0.00, 4725.00, 0.00, 0.00, 0.00, 0.00, 6723.00, 200.00, 17114.00, 0.00, 0.00, 0.00, 28762.00, 13123.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(18, '2023-06-23', 1, 77847.00, 2000.00, 8832.00, 0.00, 0.00, 408.00, 0.00, 18645.00, 200.00, 12329.00, 2500.00, 805.00, 0.00, 45719.00, 32128.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(18, '2023-08-21', 1, 80330.00, 2000.00, 9130.00, 0.00, 0.00, 408.00, 0.00, 21645.00, 200.00, 12329.00, 2500.00, 805.00, 0.00, 49017.00, 31313.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(18, '2023-09-18', 1, 79089.00, 2000.00, 8981.00, 0.00, 0.00, 408.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 11589.00, 67500.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(18, '2023-10-13', 1, 79089.00, 2000.00, 8981.00, 0.00, 0.00, 408.00, 0.00, 26389.00, 200.00, 10611.00, 2500.00, 612.00, 0.00, 51701.00, 27388.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(18, '2023-11-16', 1, 83416.00, 2000.00, 9500.00, 0.00, 0.00, 408.00, 0.00, 19871.00, 200.00, 17129.00, 2500.00, 984.00, 0.00, 52592.00, 30824.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(18, '2023-12-26', 1, 81252.00, 3000.00, 9241.00, 0.00, 0.00, 408.00, 0.00, 21460.00, 200.00, 15540.00, 2500.00, 886.00, 0.00, 53235.00, 28017.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(18, '2024-01-22', 1, 84227.00, 4000.00, 9582.00, 0.00, 0.00, 408.00, 0.00, 23497.00, 200.00, 13503.00, 2500.00, 765.00, 0.00, 54455.00, 29772.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(18, '2024-02-26', 1, 84227.00, 4000.00, 9582.00, 0.00, 0.00, 408.00, 0.00, 22286.00, 200.00, 14714.00, 2500.00, 828.00, 0.00, 54518.00, 29709.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(18, '2024-03-28', 1, 84227.00, 15845.00, 9582.00, 0.00, 0.00, 408.00, 0.00, 21099.00, 200.00, 15901.00, 2500.00, 889.00, 0.00, 66424.00, 17803.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(18, '2024-04-25', 1, 84227.00, 3000.00, 9582.00, 0.00, 0.00, 408.00, 0.00, 26221.00, 200.00, 10779.00, 2500.00, 598.00, 0.00, 53288.00, 30939.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(18, '2024-05-28', 1, 84227.00, 3000.00, 9582.00, 0.00, 0.00, 408.00, 0.00, 22393.00, 200.00, 14607.00, 2500.00, 807.00, 0.00, 53497.00, 30730.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(18, '2024-06-26', 1, 84227.00, 3000.00, 9582.00, 0.00, 0.00, 0.00, 0.00, 24323.00, 200.00, 12677.00, 2500.00, 695.00, 0.00, 52977.00, 31250.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(19, '2023-06-23', 1, 28779.00, 0.00, 3215.00, 0.00, 0.00, 0.00, 0.00, 5660.00, 150.00, 4382.00, 5000.00, 557.00, 0.00, 18964.00, 9815.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(19, '2023-08-21', 1, 29683.00, 0.00, 3323.00, 0.00, 0.00, 0.00, 0.00, 5660.00, 150.00, 4382.00, 5000.00, 557.00, 0.00, 19072.00, 10611.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(19, '2023-09-18', 1, 29231.00, 0.00, 3269.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 3419.00, 25812.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(19, '2023-10-13', 1, 29231.00, 0.00, 3269.00, 0.00, 0.00, 0.00, 0.00, 7184.00, 150.00, 2858.00, 2500.00, 329.00, 0.00, 16290.00, 12941.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(19, '2023-11-16', 1, 30807.00, 0.00, 3458.00, 0.00, 0.00, 0.00, 0.00, 5429.00, 150.00, 4613.00, 5000.00, 521.00, 0.00, 19171.00, 11636.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(19, '2023-12-26', 1, 31131.00, 0.00, 3491.00, 0.00, 0.00, 0.00, 0.00, 5858.00, 150.00, 4184.00, 5500.00, 446.00, 0.00, 19629.00, 11502.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(19, '2024-01-22', 1, 31131.00, 0.00, 3491.00, 0.00, 0.00, 0.00, 0.00, 6407.00, 150.00, 3635.00, 3300.00, 777.00, 0.00, 17760.00, 13371.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(19, '2024-02-26', 1, 31131.00, 0.00, 3491.00, 0.00, 0.00, 0.00, 0.00, 6082.00, 150.00, 3960.00, 3300.00, 900.00, 0.00, 17883.00, 13248.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(19, '2024-03-28', 1, 31131.00, 0.00, 3491.00, 0.00, 0.00, 0.00, 0.00, 5763.00, 150.00, 4279.00, 3300.00, 963.00, 0.00, 17946.00, 13185.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(19, '2024-04-25', 1, 31131.00, 0.00, 3491.00, 0.00, 0.00, 0.00, 0.00, 7142.00, 150.00, 2900.00, 3500.00, 645.00, 0.00, 17828.00, 13303.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(19, '2024-05-28', 1, 31131.00, 0.00, 3491.00, 0.00, 0.00, 0.00, 0.00, 6112.00, 150.00, 3930.00, 3500.00, 865.00, 0.00, 18048.00, 13083.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(19, '2024-06-26', 1, 31131.00, 0.00, 3491.00, 0.00, 0.00, 0.00, 0.00, 6632.00, 150.00, 3410.00, 3500.00, 740.00, 0.00, 17923.00, 13208.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(20, '2023-06-23', 1, 27888.00, 0.00, 3113.00, 0.00, 0.00, 0.00, 0.00, 9169.00, 150.00, 8379.00, 2500.00, 823.00, 0.00, 24134.00, 3754.00, 'akter', '2023-06-23 07:39:49', 'akter', '2023-08-21 05:35:58'),
(20, '2023-08-21', 1, 28763.00, 0.00, 3218.00, 0.00, 0.00, 0.00, 0.00, 9169.00, 150.00, 8379.00, 2500.00, 823.00, 0.00, 24239.00, 4524.00, 'sss', '2023-08-21 09:22:22', 'akter', '2023-08-28 05:41:41'),
(20, '2023-09-18', 1, 28325.00, 0.00, 3165.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 3315.00, 25010.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(20, '2023-10-13', 1, 28325.00, 0.00, 3165.00, 0.00, 0.00, 0.00, 0.00, 12066.00, 150.00, 5482.00, 2500.00, 527.00, 0.00, 23890.00, 4435.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(20, '2023-11-16', 1, 29851.00, 0.00, 3348.00, 0.00, 0.00, 0.00, 0.00, 8684.00, 150.00, 8864.00, 2500.00, 846.00, 0.00, 24392.00, 5459.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(20, '2023-12-26', 1, 30019.00, 0.00, 3363.00, 0.00, 0.00, 0.00, 0.00, 9493.00, 150.00, 8055.00, 2500.00, 759.00, 0.00, 24320.00, 5699.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(20, '2024-01-22', 1, 30019.00, 0.00, 3363.00, 0.00, 0.00, 0.00, 0.00, 10538.00, 150.00, 7010.00, 2500.00, 653.00, 0.00, 24214.00, 5805.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(20, '2024-02-26', 1, 30019.00, 0.00, 3363.00, 0.00, 0.00, 0.00, 0.00, 9896.00, 150.00, 7652.00, 2500.00, 706.00, 0.00, 24267.00, 5752.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(20, '2024-03-28', 1, 30019.00, 0.00, 3363.00, 0.00, 0.00, 0.00, 0.00, 9263.00, 150.00, 8285.00, 2500.00, 755.00, 0.00, 24316.00, 5703.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(20, '2024-04-25', 1, 30019.00, 0.00, 3363.00, 0.00, 0.00, 0.00, 0.00, 11922.00, 150.00, 5626.00, 2500.00, 506.00, 0.00, 24067.00, 5952.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(20, '2024-05-28', 1, 30019.00, 0.00, 3363.00, 0.00, 0.00, 0.00, 0.00, 9909.00, 150.00, 7639.00, 2500.00, 604.00, 0.00, 24165.00, 5854.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(20, '2024-06-26', 1, 30019.00, 0.00, 3363.00, 0.00, 0.00, 0.00, 0.00, 10906.00, 150.00, 6642.00, 2500.00, 820.00, 0.00, 24381.00, 5638.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(21, '2023-06-23', 3, 9445.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 'akter', '2023-06-23 09:21:19', NULL, NULL),
(21, '2023-08-28', 3, 9445.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 'akter', '2023-08-28 06:52:04', NULL, NULL),
(21, '2023-09-18', 3, 9445.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 'akter', '2023-09-18 07:45:28', NULL, NULL),
(21, '2023-10-18', 3, 9445.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 'akter', '2023-10-18 10:00:20', NULL, NULL),
(21, '2023-12-26', 3, 9445.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 'akter', '2023-12-26 07:53:27', NULL, NULL),
(21, '2024-01-22', 3, 9445.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 'akter', '2024-01-22 07:08:13', NULL, NULL),
(21, '2024-02-26', 3, 9445.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 'akter', '2024-02-26 07:20:17', NULL, NULL),
(21, '2024-03-28', 3, 9445.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 'akter', '2024-03-28 06:24:57', NULL, NULL),
(21, '2024-04-25', 3, 9445.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 'akter', '2024-04-25 05:22:56', NULL, NULL),
(21, '2024-05-28', 3, 9445.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 'akter', '2024-05-28 05:30:59', NULL, NULL),
(21, '2024-06-26', 3, 9445.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 'akter', '2024-06-26 07:27:48', NULL, NULL),
(22, '2023-09-18', 1, 110935.00, 5000.00, 12630.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 93105.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(22, '2023-10-13', 1, 110935.00, 5000.00, 12630.00, 0.00, 0.00, 0.00, 0.00, 28017.00, 200.00, 2795.00, 4167.00, 264.00, 0.00, 53073.00, 57862.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(22, '2023-11-16', 1, 117020.00, 5000.00, 13360.00, 0.00, 0.00, 0.00, 0.00, 26488.00, 200.00, 4324.00, 4167.00, 403.00, 0.00, 53942.00, 63078.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(22, '2023-12-26', 1, 113977.00, 5000.00, 12995.00, 0.00, 0.00, 0.00, 0.00, 27064.00, 200.00, 3748.00, 4167.00, 343.00, 0.00, 53517.00, 60460.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(22, '2024-01-22', 1, 113977.00, 5000.00, 12995.00, 0.00, 0.00, 0.00, 0.00, 27711.00, 200.00, 3101.00, 4167.00, 278.00, 0.00, 53452.00, 60525.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(22, '2024-02-26', 1, 113977.00, 5000.00, 12995.00, 0.00, 0.00, 0.00, 0.00, 27609.00, 200.00, 3203.00, 4167.00, 281.00, 0.00, 53455.00, 60522.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(22, '2024-03-28', 1, 113977.00, 31252.00, 12995.00, 0.00, 0.00, 0.00, 0.00, 27547.00, 200.00, 3265.00, 4167.00, 280.00, 0.00, 79706.00, 34271.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(22, '2024-04-25', 1, 113977.00, 0.00, 12995.00, 0.00, 0.00, 0.00, 0.00, 28736.00, 200.00, 2076.00, 4167.00, 173.00, 0.00, 48347.00, 65630.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(22, '2024-05-28', 1, 113977.00, 0.00, 12995.00, 0.00, 0.00, 0.00, 0.00, 28192.00, 200.00, 2620.00, 4167.00, 211.00, 0.00, 48385.00, 65592.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(22, '2024-06-26', 1, 113977.00, 11000.00, 12995.00, 0.00, 0.00, 0.00, 0.00, 28711.00, 200.00, 2101.00, 4167.00, 162.00, 0.00, 59336.00, 54641.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(23, '2023-09-18', 1, 102250.00, 0.00, 11635.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 11835.00, 90415.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(23, '2023-10-13', 1, 102250.00, 0.00, 11635.00, 0.00, 0.00, 0.00, 0.00, 3630.00, 200.00, 1670.00, 0.00, 0.00, 0.00, 17135.00, 85115.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(23, '2023-11-16', 1, 107855.00, 20000.00, 12307.00, 0.00, 0.00, 0.00, 0.00, 2599.00, 200.00, 2701.00, 0.00, 0.00, 0.00, 37807.00, 70048.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(23, '2023-12-26', 1, 105052.00, 20000.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 2846.00, 200.00, 2454.00, 0.00, 0.00, 0.00, 37471.00, 67581.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(23, '2024-01-22', 1, 105052.00, 20000.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 3164.00, 200.00, 2136.00, 0.00, 0.00, 0.00, 37471.00, 67581.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(23, '2024-02-26', 1, 105052.00, 13000.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 2967.00, 200.00, 2333.00, 0.00, 0.00, 0.00, 30471.00, 74581.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(23, '2024-03-28', 1, 105052.00, 0.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 2774.00, 200.00, 2526.00, 0.00, 0.00, 0.00, 17471.00, 87581.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(23, '2024-04-25', 1, 105052.00, 0.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 3585.00, 200.00, 1715.00, 0.00, 0.00, 0.00, 17471.00, 87581.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(23, '2024-05-28', 1, 105052.00, 0.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 2970.00, 200.00, 2330.00, 0.00, 0.00, 0.00, 17471.00, 87581.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(23, '2024-06-26', 1, 105052.00, 0.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 3274.00, 200.00, 2026.00, 0.00, 0.00, 0.00, 17471.00, 87581.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(24, '2023-09-18', 1, 102250.00, 5000.00, 11635.00, 0.00, 0.00, 2362.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 19197.00, 83053.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(24, '2023-10-13', 1, 102250.00, 5000.00, 11635.00, 0.00, 0.00, 2362.00, 0.00, 15402.00, 200.00, 2326.00, 3571.00, 410.00, 0.00, 40906.00, 61344.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(24, '2023-11-16', 1, 107855.00, 5000.00, 12307.00, 0.00, 0.00, 2362.00, 0.00, 14059.00, 200.00, 3669.00, 3571.00, 646.00, 0.00, 41814.00, 66041.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39');
INSERT INTO `td_deductions` (`emp_code`, `effective_date`, `catg_id`, `gross`, `it`, `cpf`, `gpf`, `gigs`, `lpf`, `fa`, `gi`, `top`, `eccs`, `hblp`, `hbli`, `s_adv`, `tot_diduction`, `net_sal`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(24, '2023-12-26', 1, 105052.00, 5000.00, 11971.00, 0.00, 0.00, 2362.00, 0.00, 14479.00, 200.00, 3249.00, 3571.00, 570.00, 0.00, 41402.00, 63650.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(24, '2024-01-22', 1, 105052.00, 5000.00, 11971.00, 0.00, 0.00, 2362.00, 0.00, 14977.00, 200.00, 2751.00, 3571.00, 481.00, 0.00, 41313.00, 63739.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(24, '2024-02-26', 1, 105052.00, 20000.00, 11971.00, 0.00, 0.00, 2130.00, 0.00, 14810.00, 200.00, 2918.00, 3571.00, 509.00, 0.00, 56109.00, 48943.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(24, '2024-03-28', 1, 105052.00, 42124.00, 11971.00, 0.00, 0.00, 2130.00, 0.00, 14665.00, 200.00, 3063.00, 3571.00, 532.00, 0.00, 78256.00, 26796.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(24, '2024-04-25', 1, 105052.00, 5000.00, 11971.00, 0.00, 0.00, 2130.00, 0.00, 15714.00, 200.00, 2014.00, 3571.00, 349.00, 0.00, 40949.00, 64103.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(24, '2024-05-28', 1, 105052.00, 5000.00, 11971.00, 0.00, 0.00, 2130.00, 0.00, 15087.00, 200.00, 2641.00, 3571.00, 457.00, 0.00, 41057.00, 63995.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(24, '2024-06-26', 1, 105052.00, 5000.00, 11971.00, 0.00, 0.00, 2130.00, 0.00, 15515.00, 200.00, 2213.00, 3571.00, 381.00, 0.00, 40981.00, 64071.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(25, '2023-09-18', 1, 102250.00, 5000.00, 11635.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 16835.00, 85415.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(25, '2023-10-13', 1, 102250.00, 5000.00, 11635.00, 0.00, 0.00, 0.00, 0.00, 7850.00, 200.00, 2150.00, 0.00, 0.00, 0.00, 26835.00, 75415.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(25, '2023-11-16', 1, 107855.00, 5000.00, 12307.00, 0.00, 0.00, 0.00, 0.00, 6560.00, 200.00, 3440.00, 0.00, 0.00, 0.00, 27507.00, 80348.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(25, '2023-12-26', 1, 105052.00, 5000.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 14132.00, 200.00, 5696.00, 0.00, 0.00, 0.00, 36999.00, 68053.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(25, '2024-01-22', 1, 105052.00, 5000.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 32235.00, 200.00, 7765.00, 0.00, 0.00, 0.00, 57171.00, 47881.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(25, '2024-02-26', 1, 105052.00, 5000.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 31686.00, 200.00, 8314.00, 0.00, 0.00, 0.00, 57171.00, 47881.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(25, '2024-03-28', 1, 105052.00, 0.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 31180.00, 200.00, 8820.00, 0.00, 0.00, 0.00, 52171.00, 52881.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(25, '2024-04-25', 1, 105052.00, 7000.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 34137.00, 200.00, 5863.00, 0.00, 0.00, 0.00, 59171.00, 45881.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(25, '2024-05-28', 1, 105052.00, 7000.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 32216.00, 200.00, 7784.00, 0.00, 0.00, 0.00, 59171.00, 45881.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(25, '2024-06-26', 1, 105052.00, 7000.00, 11971.00, 0.00, 0.00, 0.00, 0.00, 33390.00, 200.00, 6610.00, 0.00, 0.00, 0.00, 59171.00, 45881.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(26, '2023-09-18', 1, 96459.00, 5000.00, 10971.00, 0.00, 0.00, 827.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 16998.00, 79461.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(26, '2023-10-13', 1, 99354.00, 5000.00, 11303.00, 0.00, 0.00, 827.00, 0.00, 16083.00, 200.00, 3677.00, 2500.00, 422.00, 0.00, 40012.00, 59342.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(26, '2023-11-16', 1, 104800.00, 5000.00, 11956.00, 0.00, 0.00, 827.00, 0.00, 13902.00, 200.00, 5858.00, 2500.00, 673.00, 0.00, 40916.00, 63884.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(26, '2023-12-26', 1, 102077.00, 5000.00, 11630.00, 0.00, 0.00, 827.00, 0.00, 16258.00, 200.00, 3502.00, 2500.00, 601.00, 0.00, 40518.00, 61559.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(26, '2024-01-22', 1, 102077.00, 5000.00, 11630.00, 0.00, 0.00, 827.00, 0.00, 15827.00, 200.00, 3933.00, 2500.00, 514.00, 0.00, 40431.00, 61646.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(26, '2024-02-26', 1, 102077.00, 10000.00, 11630.00, 0.00, 0.00, 827.00, 0.00, 15559.00, 200.00, 4201.00, 2500.00, 552.00, 0.00, 45469.00, 56608.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(26, '2024-03-28', 1, 102077.00, 45750.00, 11630.00, 0.00, 0.00, 827.00, 0.00, 15314.00, 200.00, 4446.00, 2500.00, 587.00, 0.00, 81254.00, 20823.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(26, '2024-04-25', 1, 102077.00, 5000.00, 11630.00, 0.00, 0.00, 827.00, 0.00, 16812.00, 200.00, 2948.00, 2500.00, 391.00, 0.00, 40308.00, 61769.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(26, '2024-05-28', 1, 102077.00, 5000.00, 11630.00, 0.00, 0.00, 827.00, 0.00, 15858.00, 200.00, 3902.00, 2500.00, 522.00, 0.00, 40439.00, 61638.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(26, '2024-06-26', 1, 102077.00, 5000.00, 11630.00, 0.00, 0.00, 827.00, 0.00, 18802.00, 200.00, 958.00, 2500.00, 445.00, 0.00, 40362.00, 61715.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(27, '2023-09-18', 1, 50171.00, 0.00, 5668.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 5868.00, 44303.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(27, '2023-10-13', 1, 50171.00, 0.00, 5668.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 612.00, 0.00, 8980.00, 41191.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(27, '2023-11-16', 1, 52902.00, 0.00, 5996.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 984.00, 0.00, 9680.00, 43222.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(27, '2023-12-26', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 886.00, 0.00, 9418.00, 42119.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(27, '2024-01-22', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 765.00, 0.00, 9297.00, 42240.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(27, '2024-02-26', 1, 51537.00, 0.00, 5832.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 828.00, 0.00, 9360.00, 42177.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(27, '2024-03-28', 1, 54137.00, 0.00, 6130.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 889.00, 0.00, 9719.00, 44418.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(27, '2024-04-25', 1, 54137.00, 0.00, 6130.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 598.00, 0.00, 9428.00, 44709.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(27, '2024-05-28', 1, 54137.00, 0.00, 6130.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 807.00, 0.00, 9637.00, 44500.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(27, '2024-06-26', 1, 54137.00, 0.00, 6130.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2500.00, 695.00, 0.00, 9525.00, 44612.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(28, '2023-09-18', 1, 36447.00, 0.00, 4095.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4245.00, 32202.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(28, '2023-10-13', 1, 36447.00, 0.00, 4095.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 422.00, 0.00, 7167.00, 29280.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(28, '2023-11-16', 1, 38421.00, 0.00, 4332.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 673.00, 0.00, 7655.00, 30766.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(28, '2023-12-26', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 601.00, 0.00, 7720.00, 31940.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(28, '2024-01-22', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 514.00, 0.00, 7633.00, 32027.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(28, '2024-02-26', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 552.00, 0.00, 7671.00, 31989.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(28, '2024-03-28', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 587.00, 0.00, 7706.00, 31954.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(28, '2024-04-25', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 391.00, 0.00, 7510.00, 32150.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(28, '2024-05-28', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 522.00, 0.00, 7641.00, 32019.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(28, '2024-06-26', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 2500.00, 445.00, 0.00, 7564.00, 32096.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(29, '2023-09-18', 1, 36447.00, 0.00, 4095.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4245.00, 32202.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(29, '2023-10-13', 1, 36447.00, 0.00, 4095.00, 0.00, 0.00, 0.00, 0.00, 404.00, 150.00, 2696.00, 0.00, 0.00, 0.00, 7345.00, 29102.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(29, '2023-11-16', 1, 38421.00, 0.00, 4332.00, 0.00, 0.00, 0.00, 0.00, 506.00, 150.00, 2594.00, 0.00, 0.00, 0.00, 7582.00, 30839.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(29, '2023-12-26', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 726.00, 150.00, 2374.00, 0.00, 0.00, 0.00, 7719.00, 31941.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(29, '2024-01-22', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 1019.00, 150.00, 2081.00, 0.00, 0.00, 0.00, 7719.00, 31941.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(29, '2024-02-26', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 812.00, 150.00, 2288.00, 0.00, 0.00, 0.00, 7719.00, 31941.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(29, '2024-03-28', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 604.00, 150.00, 2496.00, 0.00, 0.00, 0.00, 7719.00, 31941.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(29, '2024-04-25', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 1390.00, 150.00, 1710.00, 0.00, 0.00, 0.00, 7719.00, 31941.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(29, '2024-05-28', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 4619.00, 35041.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(29, '2024-06-26', 1, 39660.00, 0.00, 4469.00, 0.00, 0.00, 0.00, 0.00, 2363.00, 150.00, 9321.00, 0.00, 0.00, 0.00, 16303.00, 23357.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(30, '2023-09-18', 1, 32845.00, 0.00, 3683.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 3833.00, 29012.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(30, '2023-10-13', 1, 32845.00, 0.00, 3683.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 3013.00, 2500.00, 422.00, 0.00, 9768.00, 23077.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(30, '2023-11-16', 1, 34619.00, 0.00, 3896.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 4931.00, 2500.00, 673.00, 0.00, 12150.00, 22469.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(30, '2023-12-26', 1, 33732.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 2992.00, 150.00, 7151.00, 2500.00, 601.00, 0.00, 17183.00, 16549.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(30, '2024-01-22', 1, 33732.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 3014.00, 150.00, 7129.00, 2500.00, 515.00, 0.00, 17097.00, 16635.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(30, '2024-02-26', 1, 33732.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 2300.00, 150.00, 7843.00, 2500.00, 552.00, 0.00, 17134.00, 16598.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(30, '2024-03-28', 1, 35583.00, 0.00, 4002.00, 0.00, 0.00, 0.00, 0.00, 1585.00, 150.00, 8558.00, 2500.00, 587.00, 0.00, 17382.00, 18201.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(30, '2024-04-25', 1, 35583.00, 0.00, 4002.00, 0.00, 0.00, 0.00, 0.00, 4284.00, 150.00, 5859.00, 2500.00, 391.00, 0.00, 17186.00, 18397.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(30, '2024-05-28', 1, 35583.00, 0.00, 4002.00, 0.00, 0.00, 0.00, 0.00, 2121.00, 150.00, 8022.00, 2500.00, 522.00, 0.00, 17317.00, 18266.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(30, '2024-06-26', 1, 35583.00, 0.00, 4002.00, 0.00, 0.00, 0.00, 0.00, 3109.00, 150.00, 7034.00, 2500.00, 445.00, 0.00, 17240.00, 18343.00, 'akter', '2024-06-26 07:27:37', NULL, NULL),
(31, '2023-09-18', 1, 33345.00, 0.00, 3683.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 3833.00, 29512.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(31, '2023-10-13', 1, 33345.00, 0.00, 3683.00, 0.00, 0.00, 0.00, 0.00, 2178.00, 150.00, 1805.00, 2500.00, 580.00, 0.00, 10896.00, 22449.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(31, '2023-11-16', 1, 35119.00, 0.00, 3896.00, 0.00, 0.00, 0.00, 0.00, 1049.00, 150.00, 2934.00, 2500.00, 932.00, 0.00, 11461.00, 23658.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(31, '2023-12-26', 1, 34232.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 1302.00, 150.00, 2681.00, 2500.00, 839.00, 0.00, 11261.00, 22971.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(31, '2024-01-22', 1, 34232.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 1637.00, 150.00, 2346.00, 2500.00, 723.00, 0.00, 11145.00, 23087.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(31, '2024-02-26', 1, 34232.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 1407.00, 150.00, 2576.00, 2500.00, 782.00, 0.00, 11204.00, 23028.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(31, '2024-03-28', 1, 36083.00, 0.00, 4002.00, 0.00, 0.00, 0.00, 0.00, 1177.00, 150.00, 2806.00, 2500.00, 839.00, 0.00, 11474.00, 24609.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(31, '2024-04-25', 1, 36083.00, 0.00, 4002.00, 0.00, 0.00, 0.00, 0.00, 2066.00, 150.00, 1917.00, 2500.00, 564.00, 0.00, 11199.00, 24884.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(31, '2024-05-28', 1, 36083.00, 0.00, 4002.00, 0.00, 0.00, 0.00, 0.00, 1364.00, 150.00, 2619.00, 2500.00, 759.00, 0.00, 11394.00, 24689.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(31, '2024-06-26', 1, 36083.00, 0.00, 4002.00, 0.00, 0.00, 0.00, 0.00, 1691.00, 150.00, 2292.00, 2500.00, 653.00, 0.00, 11288.00, 24795.00, 'akter', '2024-06-26 07:27:38', NULL, NULL),
(32, '2023-09-18', 1, 31043.00, 0.00, 3476.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 3626.00, 27417.00, 'akter', '2023-09-18 09:40:25', NULL, NULL),
(32, '2023-10-13', 1, 31043.00, 0.00, 3476.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 1667.00, 307.00, 0.00, 5600.00, 25443.00, 'akter', '2023-10-13 06:06:08', 'akter', '2023-10-18 09:14:49'),
(32, '2023-11-16', 1, 32719.00, 0.00, 3678.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 1667.00, 679.00, 0.00, 6174.00, 26545.00, 'akter', '2023-11-16 08:27:56', 'akter', '2023-11-21 09:14:39'),
(32, '2023-12-26', 1, 33732.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 1667.00, 612.00, 0.00, 6218.00, 27514.00, NULL, '2023-12-26 07:40:56', 'akter', '2023-12-26 07:53:08'),
(32, '2024-01-22', 1, 33732.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 1667.00, 528.00, 0.00, 6134.00, 27598.00, 'akter', '2024-01-22 07:08:02', NULL, NULL),
(32, '2024-02-26', 1, 33732.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 1667.00, 573.00, 0.00, 6179.00, 27553.00, 'akter', '2024-02-26 07:20:00', NULL, NULL),
(32, '2024-03-28', 1, 33732.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 1667.00, 615.00, 0.00, 6221.00, 27511.00, 'akter', '2024-03-28 06:24:39', NULL, NULL),
(32, '2024-04-25', 1, 33732.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 1667.00, 414.00, 0.00, 6020.00, 27712.00, 'akter', '2024-04-25 05:22:17', NULL, NULL),
(32, '2024-05-28', 1, 33732.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 1667.00, 559.00, 0.00, 6165.00, 27567.00, 'akter', '2024-05-28 05:30:47', NULL, NULL),
(32, '2024-06-26', 1, 33732.00, 0.00, 3789.00, 0.00, 0.00, 0.00, 0.00, 0.00, 150.00, 0.00, 1667.00, 482.00, 0.00, 6088.00, 27644.00, 'akter', '2024-06-26 07:27:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_earning_deduction`
--

CREATE TABLE `td_earning_deduction` (
  `sl_no` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `effective_dt` date NOT NULL,
  `emp_no` varchar(20) NOT NULL,
  `pay_head_id` int(11) NOT NULL,
  `pay_head_type` enum('E','D') DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `created_ip` varchar(55) DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL,
  `modified_ip` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_earning_deduction`
--

INSERT INTO `td_earning_deduction` (`sl_no`, `bank_id`, `effective_dt`, `emp_no`, `pay_head_id`, `pay_head_type`, `amount`, `created_by`, `created_dt`, `created_ip`, `modified_by`, `modified_dt`, `modified_ip`) VALUES
(5, 1, '2024-07-24', '5', 104, 'E', 23326.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(6, 1, '2024-07-24', '5', 105, 'E', 1992.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(7, 1, '2024-07-24', '5', 106, 'E', 500.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(8, 1, '2024-07-24', '5', 107, 'E', 500.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(9, 1, '2024-07-24', '5', 108, 'E', 600.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(10, 1, '2024-07-24', '5', 109, 'E', 600.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(11, 1, '2024-07-24', '5', 111, 'E', 800.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(12, 1, '2024-07-24', '5', 112, 'E', 600.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(13, 1, '2024-07-24', '5', 113, 'E', 600.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(14, 1, '2024-07-24', '5', 114, 'E', 600.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(15, 1, '2024-07-24', '5', 115, 'E', 500.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(16, 1, '2024-07-24', '5', 116, 'E', 600.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(17, 1, '2024-07-24', '5', 117, 'E', 8000.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(18, 1, '2024-07-24', '5', 201, 'D', 5000.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(19, 1, '2024-07-24', '5', 102, 'D', 10.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(20, 1, '2024-07-24', '5', 202, 'D', 500.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(21, 1, '2024-07-24', '5', 204, 'D', 200.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(22, 1, '2024-07-24', '5', 207, 'D', 10.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(23, 1, '2024-07-24', '5', 208, 'D', 200.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(24, 1, '2024-07-24', '5', 209, 'D', 200.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(25, 1, '2024-07-24', '5', 210, 'D', 10.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(26, 1, '2024-07-24', '5', 211, 'D', 50.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(27, 1, '2024-07-24', '5', 210, 'D', 10.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(28, 1, '2024-07-24', '5', 212, 'D', 2.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(29, 1, '2024-07-24', '5', 213, 'D', 30.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(30, 1, '2024-07-24', '5', 214, 'D', 10.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(31, 1, '2024-07-24', '5', 215, 'D', 110.00, 'sss', '2024-07-24 12:49:14', NULL, 'sss', '2024-07-26 07:28:38', '::1'),
(55, 1, '2024-07-25', '8', 104, 'E', 13677.00, 'sss', '2024-07-25 13:25:45', NULL, 'sss', '2024-07-26 09:16:07', '::1'),
(56, 1, '2024-07-25', '8', 105, 'E', 1168.00, 'sss', '2024-07-25 13:25:45', NULL, 'sss', '2024-07-26 09:16:07', '::1'),
(57, 1, '2024-07-25', '8', 107, 'E', 1400.00, 'sss', '2024-07-25 13:25:45', NULL, 'sss', '2024-07-26 09:16:07', '::1'),
(58, 1, '2024-07-25', '8', 108, 'E', 500.00, 'sss', '2024-07-25 13:25:45', NULL, 'sss', '2024-07-26 09:16:07', '::1'),
(59, 1, '2024-07-25', '8', 201, 'D', 230.00, 'sss', '2024-07-25 13:25:45', NULL, 'sss', '2024-07-26 09:16:07', '::1'),
(60, 1, '2024-07-25', '8', 215, 'D', 210.00, 'sss', '2024-07-25 13:25:45', NULL, 'sss', '2024-07-26 09:16:07', '::1'),
(61, 1, '2024-07-25', '8', 113, 'E', 1000.00, 'sss', '2024-07-26 08:48:24', '::1', 'sss', '2024-07-26 09:16:07', '::1'),
(62, 1, '2024-07-25', '8', 207, 'D', 600.00, 'sss', '2024-07-26 08:49:30', '::1', 'sss', '2024-07-26 09:16:07', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `td_income`
--

CREATE TABLE `td_income` (
  `emp_code` int(11) NOT NULL,
  `effective_date` date NOT NULL,
  `catg_id` int(11) NOT NULL COMMENT 'md_category->id',
  `basic` float(10,2) NOT NULL DEFAULT 0.00,
  `sp` float(10,2) NOT NULL DEFAULT 0.00,
  `da` float(10,2) NOT NULL DEFAULT 0.00,
  `hra` float(10,2) NOT NULL DEFAULT 0.00,
  `ma` float(10,2) NOT NULL DEFAULT 0.00,
  `sa` float(10,2) NOT NULL DEFAULT 0.00,
  `ta` float(10,2) NOT NULL DEFAULT 0.00,
  `arrear` float(10,2) NOT NULL DEFAULT 0.00,
  `ot` float(10,2) NOT NULL DEFAULT 0.00,
  `gross` float(10,2) NOT NULL DEFAULT 0.00,
  `lwp` float(10,2) NOT NULL DEFAULT 0.00,
  `final_gross` float(10,2) NOT NULL DEFAULT 0.00,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_income`
--

INSERT INTO `td_income` (`emp_code`, `effective_date`, `catg_id`, `basic`, `sp`, `da`, `hra`, `ma`, `sa`, `ta`, `arrear`, `ot`, `gross`, `lwp`, `final_gross`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, '2023-06-23', 1, 34160.00, 0.00, 36722.00, 3416.00, 700.00, 0.00, 0.00, 1196.00, 0.00, 76194.00, 0.00, 76194.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(1, '2023-08-21', 1, 34160.00, 0.00, 37918.00, 3416.00, 700.00, 0.00, 0.00, 1196.00, 0.00, 77390.00, 0.00, 77390.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(1, '2023-09-18', 1, 34160.00, 0.00, 37918.00, 3416.00, 700.00, 0.00, 0.00, 0.00, 0.00, 76194.00, 0.00, 76194.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(1, '2023-10-12', 1, 35470.00, 0.00, 39372.00, 3547.00, 700.00, 0.00, 0.00, 0.00, 0.00, 79089.00, 0.00, 79089.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(1, '2023-11-13', 1, 35470.00, 0.00, 41535.00, 3547.00, 700.00, 0.00, 0.00, 2164.00, 0.00, 83416.00, 0.00, 83416.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(1, '2023-12-21', 1, 35470.00, 0.00, 41535.00, 3547.00, 700.00, 0.00, 0.00, 0.00, 0.00, 81252.00, 0.00, 81252.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(1, '2024-01-22', 1, 35470.00, 0.00, 41535.00, 3547.00, 700.00, 0.00, 0.00, 0.00, 0.00, 81252.00, 0.00, 81252.00, 'akter', '2024-01-22 05:23:45', 'akter', '2024-01-22 05:24:39'),
(1, '2024-02-17', 1, 35470.00, 0.00, 41535.00, 3547.00, 700.00, 0.00, 0.00, 0.00, 0.00, 81252.00, 0.00, 81252.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(1, '2024-03-23', 1, 35470.00, 0.00, 41535.00, 3547.00, 700.00, 0.00, 0.00, 0.00, 0.00, 81252.00, 0.00, 81252.00, 'akter', '2024-03-23 06:41:48', NULL, NULL),
(1, '2024-04-24', 1, 35470.00, 0.00, 41535.00, 3547.00, 700.00, 0.00, 0.00, 0.00, 0.00, 81252.00, 0.00, 81252.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(1, '2024-05-28', 1, 35470.00, 0.00, 41535.00, 3547.00, 700.00, 0.00, 0.00, 0.00, 0.00, 81252.00, 0.00, 81252.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(1, '2024-06-26', 1, 35470.00, 0.00, 41535.00, 3547.00, 700.00, 0.00, 0.00, 0.00, 0.00, 81252.00, 0.00, 81252.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(2, '2023-06-23', 1, 51490.00, 0.00, 55352.00, 5149.00, 700.00, 0.00, 0.00, 1802.00, 0.00, 114493.00, 0.00, 114493.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(2, '2023-08-21', 1, 51490.00, 0.00, 57154.00, 5149.00, 700.00, 0.00, 0.00, 1802.00, 0.00, 116295.00, 0.00, 116295.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(2, '2023-09-18', 1, 51490.00, 0.00, 57154.00, 5149.00, 700.00, 0.00, 0.00, 0.00, 0.00, 114493.00, 0.00, 114493.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(2, '2023-10-12', 1, 51490.00, 0.00, 57154.00, 5149.00, 700.00, 0.00, 0.00, 0.00, 0.00, 114493.00, 0.00, 114493.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(2, '2023-11-13', 1, 51490.00, 0.00, 60295.00, 5149.00, 700.00, 0.00, 0.00, 3141.00, 0.00, 120775.00, 0.00, 120775.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(2, '2023-12-21', 1, 51490.00, 0.00, 60295.00, 5149.00, 700.00, 0.00, 0.00, 0.00, 0.00, 117634.00, 0.00, 117634.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(2, '2024-01-22', 1, 51490.00, 0.00, 60295.00, 5149.00, 700.00, 0.00, 0.00, 0.00, 0.00, 117634.00, 0.00, 117634.00, 'akter', '2024-01-22 05:23:45', 'akter', '2024-01-22 05:24:39'),
(2, '2024-02-17', 1, 51490.00, 0.00, 60295.00, 5149.00, 700.00, 0.00, 0.00, 0.00, 0.00, 117634.00, 0.00, 117634.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(2, '2024-03-23', 1, 51490.00, 0.00, 60295.00, 5149.00, 700.00, 0.00, 0.00, 0.00, 0.00, 117634.00, 0.00, 117634.00, 'akter', '2024-03-23 06:41:48', NULL, NULL),
(2, '2024-04-24', 1, 51490.00, 0.00, 60295.00, 5149.00, 700.00, 0.00, 0.00, 0.00, 0.00, 117634.00, 0.00, 117634.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(2, '2024-05-28', 1, 51490.00, 0.00, 60295.00, 5149.00, 700.00, 0.00, 0.00, 0.00, 0.00, 117634.00, 0.00, 117634.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(2, '2024-06-26', 1, 51490.00, 0.00, 60295.00, 5149.00, 700.00, 0.00, 0.00, 0.00, 0.00, 117634.00, 0.00, 117634.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(3, '2023-06-23', 1, 31540.00, 0.00, 33906.00, 3154.00, 700.00, 0.00, 0.00, 1104.00, 0.00, 70404.00, 0.00, 70404.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(3, '2023-08-21', 1, 31540.00, 0.00, 35009.00, 3154.00, 700.00, 0.00, 0.00, 1104.00, 0.00, 71507.00, 0.00, 71507.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(3, '2023-09-18', 1, 32850.00, 0.00, 36464.00, 3285.00, 700.00, 0.00, 0.00, 0.00, 0.00, 73299.00, 0.00, 73299.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(3, '2023-10-12', 1, 32850.00, 0.00, 36464.00, 3285.00, 700.00, 0.00, 0.00, 0.00, 0.00, 73299.00, 0.00, 73299.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(3, '2023-11-13', 1, 32850.00, 0.00, 38467.00, 3285.00, 700.00, 0.00, 0.00, 2004.00, 0.00, 77306.00, 0.00, 77306.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(3, '2023-12-21', 1, 32850.00, 0.00, 38467.00, 3285.00, 700.00, 0.00, 0.00, 0.00, 0.00, 75302.00, 0.00, 75302.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(3, '2024-01-22', 1, 32850.00, 0.00, 38467.00, 3285.00, 700.00, 0.00, 0.00, 0.00, 0.00, 75302.00, 0.00, 75302.00, 'akter', '2024-01-22 05:23:45', 'akter', '2024-01-22 05:24:39'),
(3, '2024-02-17', 1, 32850.00, 0.00, 38467.00, 3285.00, 700.00, 0.00, 0.00, 0.00, 0.00, 75302.00, 0.00, 75302.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(3, '2024-03-23', 1, 32850.00, 0.00, 38467.00, 3285.00, 700.00, 0.00, 0.00, 0.00, 0.00, 75302.00, 0.00, 75302.00, 'akter', '2024-03-23 06:41:48', NULL, NULL),
(3, '2024-04-24', 1, 32850.00, 0.00, 38467.00, 3285.00, 700.00, 0.00, 0.00, 0.00, 0.00, 75302.00, 0.00, 75302.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(3, '2024-05-28', 1, 32850.00, 0.00, 38467.00, 3285.00, 700.00, 0.00, 0.00, 0.00, 0.00, 75302.00, 0.00, 75302.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(3, '2024-06-26', 1, 32850.00, 0.00, 38467.00, 3285.00, 700.00, 0.00, 0.00, 0.00, 0.00, 75302.00, 0.00, 75302.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(4, '2023-06-23', 1, 45950.00, 0.00, 49396.00, 4595.00, 700.00, 0.00, 0.00, 1608.00, 0.00, 102249.00, 0.00, 102249.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(4, '2023-08-21', 1, 45950.00, 0.00, 51005.00, 4595.00, 700.00, 0.00, 0.00, 1608.00, 0.00, 103858.00, 0.00, 103858.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(4, '2023-09-18', 1, 45950.00, 0.00, 51005.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102250.00, 0.00, 102250.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(4, '2023-10-12', 1, 45950.00, 0.00, 51005.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102250.00, 0.00, 102250.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(4, '2023-11-13', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 2803.00, 0.00, 107855.00, 0.00, 107855.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(5, '2023-06-23', 1, 44640.00, 0.00, 47988.00, 4464.00, 700.00, 0.00, 0.00, 1608.00, 0.00, 99400.00, 0.00, 99400.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(5, '2023-08-21', 1, 45950.00, 0.00, 51005.00, 4595.00, 700.00, 0.00, 0.00, 1562.00, 0.00, 103812.00, 0.00, 103812.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(5, '2023-09-18', 1, 45950.00, 0.00, 51005.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102250.00, 0.00, 102250.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(5, '2023-10-12', 1, 45950.00, 0.00, 51005.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102250.00, 0.00, 102250.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(5, '2023-11-13', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 2803.00, 0.00, 107855.00, 0.00, 107855.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(5, '2023-12-21', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(5, '2024-01-22', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-01-22 05:23:45', 'akter', '2024-01-22 05:24:39'),
(5, '2024-02-17', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(5, '2024-03-23', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(5, '2024-04-24', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(5, '2024-05-28', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(5, '2024-06-26', 1, 47260.00, 0.00, 55341.00, 4726.00, 700.00, 0.00, 0.00, 0.00, 0.00, 108027.00, 0.00, 108027.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(6, '2023-06-23', 1, 43330.00, 0.00, 46580.00, 4333.00, 700.00, 0.00, 0.00, 1517.00, 0.00, 96460.00, 0.00, 96460.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(6, '2023-08-21', 1, 43330.00, 0.00, 48096.00, 4333.00, 700.00, 0.00, 0.00, 1517.00, 0.00, 97976.00, 0.00, 97976.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(6, '2023-09-18', 1, 43330.00, 0.00, 48096.00, 4333.00, 700.00, 0.00, 0.00, 0.00, 0.00, 96459.00, 0.00, 96459.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(6, '2023-10-12', 1, 43330.00, 0.00, 48096.00, 4333.00, 700.00, 0.00, 0.00, 0.00, 0.00, 96459.00, 0.00, 96459.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(6, '2023-11-13', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 2643.00, 0.00, 104720.00, 0.00, 104720.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(6, '2023-12-21', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(6, '2024-01-22', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2024-01-22 05:23:45', 'akter', '2024-01-22 05:24:39'),
(6, '2024-02-17', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(6, '2024-03-23', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(6, '2024-04-24', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(6, '2024-05-28', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(6, '2024-06-26', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(7, '2023-06-23', 1, 22385.00, 0.00, 24064.00, 2239.00, 700.00, 0.00, 0.00, 783.00, 0.00, 50171.00, 0.00, 50171.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(7, '2023-08-21', 1, 22385.00, 0.00, 24847.00, 2239.00, 700.00, 0.00, 0.00, 783.00, 0.00, 50954.00, 0.00, 50954.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(7, '2023-09-18', 1, 22385.00, 0.00, 24847.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 50171.00, 0.00, 50171.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(7, '2023-10-12', 1, 22385.00, 0.00, 24847.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 50171.00, 0.00, 50171.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(7, '2023-11-13', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 1365.00, 0.00, 52902.00, 0.00, 52902.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(7, '2023-12-21', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(7, '2024-01-22', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2024-01-22 05:23:45', 'akter', '2024-01-22 05:24:39'),
(7, '2024-02-17', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(7, '2024-03-23', 1, 23530.00, 0.00, 27554.00, 2353.00, 700.00, 0.00, 0.00, 0.00, 0.00, 54137.00, 0.00, 54137.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(7, '2024-04-24', 1, 23530.00, 0.00, 27554.00, 2353.00, 700.00, 0.00, 0.00, 0.00, 0.00, 54137.00, 0.00, 54137.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(7, '2024-05-28', 1, 23530.00, 0.00, 27554.00, 2353.00, 700.00, 0.00, 0.00, 0.00, 0.00, 54137.00, 0.00, 54137.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(7, '2024-06-26', 1, 23530.00, 0.00, 27554.00, 2353.00, 700.00, 0.00, 0.00, 0.00, 0.00, 54137.00, 0.00, 54137.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(8, '2023-06-23', 1, 18135.00, 0.00, 19495.00, 1814.00, 700.00, 500.00, 0.00, 635.00, 0.00, 41279.00, 0.00, 41279.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(8, '2023-08-21', 1, 18135.00, 0.00, 20130.00, 1814.00, 700.00, 500.00, 0.00, 635.00, 0.00, 41914.00, 0.00, 41914.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(8, '2023-09-18', 1, 18135.00, 0.00, 20130.00, 1814.00, 700.00, 500.00, 0.00, 0.00, 0.00, 41279.00, 0.00, 41279.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(8, '2023-10-12', 1, 18135.00, 0.00, 20130.00, 1814.00, 700.00, 500.00, 0.00, 0.00, 0.00, 41279.00, 0.00, 41279.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(8, '2023-11-13', 1, 19115.00, 0.00, 22384.00, 1912.00, 700.00, 500.00, 0.00, 1106.00, 0.00, 45717.00, 0.00, 45717.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(8, '2023-12-21', 1, 19115.00, 0.00, 22384.00, 1912.00, 700.00, 500.00, 0.00, 0.00, 0.00, 44611.00, 0.00, 44611.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(8, '2024-01-22', 1, 19115.00, 0.00, 22384.00, 1912.00, 700.00, 500.00, 0.00, 0.00, 0.00, 44611.00, 0.00, 44611.00, 'akter', '2024-01-22 05:23:45', 'akter', '2024-01-22 05:24:39'),
(8, '2024-02-17', 1, 19115.00, 0.00, 22384.00, 1912.00, 700.00, 500.00, 0.00, 0.00, 0.00, 44611.00, 0.00, 44611.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(8, '2024-03-23', 1, 19115.00, 0.00, 22384.00, 1912.00, 700.00, 500.00, 0.00, 0.00, 0.00, 44611.00, 0.00, 44611.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(8, '2024-04-24', 1, 19115.00, 0.00, 22384.00, 1912.00, 700.00, 500.00, 0.00, 0.00, 0.00, 44611.00, 0.00, 44611.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(8, '2024-05-28', 1, 19115.00, 0.00, 22384.00, 1912.00, 700.00, 500.00, 0.00, 0.00, 0.00, 44611.00, 0.00, 44611.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(8, '2024-06-26', 1, 19115.00, 0.00, 22384.00, 1912.00, 700.00, 500.00, 0.00, 0.00, 0.00, 44611.00, 0.00, 44611.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(9, '2023-06-23', 1, 21240.00, 0.00, 22833.00, 2124.00, 700.00, 0.00, 0.00, 783.00, 0.00, 47680.00, 0.00, 47680.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(9, '2023-08-21', 1, 22385.00, 0.00, 24847.00, 2239.00, 700.00, 0.00, 0.00, 743.00, 0.00, 50914.00, 0.00, 50914.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(9, '2023-09-18', 1, 22385.00, 0.00, 24847.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 50171.00, 0.00, 50171.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(9, '2023-10-12', 1, 22385.00, 0.00, 24847.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 50171.00, 0.00, 50171.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(9, '2023-11-13', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 1365.00, 0.00, 52902.00, 0.00, 52902.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(9, '2023-12-21', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(9, '2024-01-22', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2024-01-22 05:23:45', 'akter', '2024-01-22 05:24:39'),
(9, '2024-02-17', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(9, '2024-03-23', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(9, '2024-04-24', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(9, '2024-05-28', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(9, '2024-06-26', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(10, '2023-06-23', 1, 17155.00, 0.00, 18442.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(10, '2023-08-21', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 39213.00, 0.00, 39213.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(10, '2023-09-18', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(10, '2023-10-12', 1, 18135.00, 0.00, 20130.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 40779.00, 0.00, 40779.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(10, '2023-11-13', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 1106.00, 0.00, 42991.00, 0.00, 42991.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(10, '2023-12-21', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(10, '2024-01-22', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-01-22 05:23:45', 'akter', '2024-01-22 05:24:39'),
(10, '2024-02-17', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(10, '2024-03-23', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(10, '2024-04-24', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(10, '2024-05-28', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(10, '2024-06-26', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(11, '2023-06-23', 1, 17155.00, 0.00, 18442.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(11, '2023-08-21', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 39213.00, 0.00, 39213.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(11, '2023-09-18', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(11, '2023-10-12', 1, 18135.00, 0.00, 20130.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 40779.00, 0.00, 40779.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(11, '2023-11-13', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 1106.00, 0.00, 42991.00, 0.00, 42991.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(11, '2023-12-21', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(11, '2024-01-22', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-01-22 05:23:45', 'akter', '2024-01-22 05:24:39'),
(11, '2024-02-17', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(11, '2024-03-23', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(11, '2024-04-24', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(11, '2024-05-28', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(11, '2024-06-26', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(12, '2023-06-23', 1, 17155.00, 0.00, 18442.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(12, '2023-08-21', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 39213.00, 0.00, 39213.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(12, '2023-09-18', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(12, '2023-10-12', 1, 18135.00, 0.00, 20130.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 40779.00, 0.00, 40779.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(12, '2023-11-13', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 1106.00, 0.00, 42991.00, 0.00, 42991.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(12, '2023-12-21', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(12, '2024-01-22', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(12, '2024-02-17', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(12, '2024-03-23', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(12, '2024-04-24', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(12, '2024-05-28', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(12, '2024-06-26', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(13, '2023-06-23', 1, 17155.00, 0.00, 18442.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(13, '2023-08-21', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 39213.00, 0.00, 39213.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(13, '2023-09-18', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(13, '2023-10-12', 1, 18135.00, 0.00, 20130.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 40779.00, 0.00, 40779.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(13, '2023-11-13', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 1106.00, 0.00, 42991.00, 0.00, 42991.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(13, '2023-12-21', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(13, '2024-01-22', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(13, '2024-02-17', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(13, '2024-03-23', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(13, '2024-04-24', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(13, '2024-05-28', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(13, '2024-06-26', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(14, '2023-06-23', 1, 17155.00, 0.00, 18442.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(14, '2023-08-21', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 39213.00, 0.00, 39213.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(14, '2023-09-18', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(14, '2023-10-12', 1, 18135.00, 0.00, 20130.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 40779.00, 0.00, 40779.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(14, '2023-11-13', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 1106.00, 0.00, 42991.00, 0.00, 42991.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(14, '2023-12-21', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(14, '2024-01-22', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(14, '2024-02-17', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(14, '2024-03-23', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(14, '2024-04-24', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(14, '2024-05-28', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(14, '2024-06-26', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(15, '2023-06-23', 1, 17155.00, 0.00, 18442.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(15, '2023-08-21', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 39213.00, 0.00, 39213.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(15, '2023-09-18', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(15, '2023-10-12', 1, 18135.00, 0.00, 20130.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 40779.00, 0.00, 40779.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(15, '2023-11-13', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 1106.00, 0.00, 42991.00, 0.00, 42991.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(15, '2023-12-21', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(15, '2024-01-22', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(15, '2024-02-17', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(15, '2024-03-23', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(15, '2024-04-24', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(15, '2024-05-28', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(15, '2024-06-26', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(16, '2023-06-23', 1, 17155.00, 0.00, 18442.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(16, '2023-08-21', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 39213.00, 0.00, 39213.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(16, '2023-09-18', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(16, '2023-10-12', 1, 18135.00, 0.00, 20130.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 40779.00, 0.00, 40779.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(16, '2023-11-13', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 1106.00, 0.00, 42991.00, 0.00, 42991.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(16, '2023-12-21', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(16, '2024-01-22', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(16, '2024-02-17', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(16, '2024-03-23', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(16, '2024-04-24', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(16, '2024-05-28', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(16, '2024-06-26', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-06-26 06:41:15', NULL, NULL),
(17, '2023-06-23', 1, 17155.00, 0.00, 18442.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(17, '2023-08-21', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 600.00, 0.00, 39213.00, 0.00, 39213.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(17, '2023-09-18', 1, 17155.00, 0.00, 19042.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 38613.00, 0.00, 38613.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(17, '2023-10-12', 1, 18135.00, 0.00, 20130.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 40779.00, 0.00, 40779.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(17, '2023-11-13', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 1106.00, 0.00, 42991.00, 0.00, 42991.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(17, '2023-12-21', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(17, '2024-01-22', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(17, '2024-02-17', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(17, '2024-03-23', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(17, '2024-04-24', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(17, '2024-05-28', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(17, '2024-06-26', 1, 18135.00, 0.00, 21236.00, 1814.00, 700.00, 0.00, 0.00, 0.00, 0.00, 41885.00, 0.00, 41885.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(18, '2023-06-23', 1, 35470.00, 0.00, 38130.00, 3547.00, 700.00, 0.00, 0.00, 1241.00, 0.00, 79088.00, 0.00, 79088.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(18, '2023-08-21', 1, 35470.00, 0.00, 39372.00, 3547.00, 700.00, 0.00, 0.00, 1241.00, 0.00, 80330.00, 0.00, 80330.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(18, '2023-09-18', 1, 35470.00, 0.00, 39372.00, 3547.00, 700.00, 0.00, 0.00, 0.00, 0.00, 79089.00, 0.00, 79089.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(18, '2023-10-12', 1, 35470.00, 0.00, 39372.00, 3547.00, 700.00, 0.00, 0.00, 0.00, 0.00, 79089.00, 0.00, 79089.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(18, '2023-11-13', 1, 35470.00, 0.00, 41535.00, 3547.00, 700.00, 0.00, 0.00, 2164.00, 0.00, 83416.00, 0.00, 83416.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(18, '2023-12-21', 1, 35470.00, 0.00, 41535.00, 3547.00, 700.00, 0.00, 0.00, 0.00, 0.00, 81252.00, 0.00, 81252.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(18, '2024-01-22', 1, 36780.00, 0.00, 43069.00, 3678.00, 700.00, 0.00, 0.00, 0.00, 0.00, 84227.00, 0.00, 84227.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(18, '2024-02-17', 1, 36780.00, 0.00, 43069.00, 3678.00, 700.00, 0.00, 0.00, 0.00, 0.00, 84227.00, 0.00, 84227.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(18, '2024-03-23', 1, 36780.00, 0.00, 43069.00, 3678.00, 700.00, 0.00, 0.00, 0.00, 0.00, 84227.00, 0.00, 84227.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(18, '2024-04-24', 1, 36780.00, 0.00, 43069.00, 3678.00, 700.00, 0.00, 0.00, 0.00, 0.00, 84227.00, 0.00, 84227.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(18, '2024-05-28', 1, 36780.00, 0.00, 43069.00, 3678.00, 700.00, 0.00, 0.00, 0.00, 0.00, 84227.00, 0.00, 84227.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(18, '2024-06-26', 1, 36780.00, 0.00, 43069.00, 3678.00, 700.00, 0.00, 0.00, 0.00, 0.00, 84227.00, 0.00, 84227.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(19, '2023-06-23', 1, 12910.00, 0.00, 13878.00, 1291.00, 700.00, 0.00, 0.00, 452.00, 0.00, 29231.00, 0.00, 29231.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(19, '2023-08-21', 1, 12910.00, 0.00, 14330.00, 1291.00, 700.00, 0.00, 0.00, 452.00, 0.00, 29683.00, 0.00, 29683.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(19, '2023-09-18', 1, 12910.00, 0.00, 14330.00, 1291.00, 700.00, 0.00, 0.00, 0.00, 0.00, 29231.00, 0.00, 29231.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(19, '2023-10-12', 1, 12910.00, 0.00, 14330.00, 1291.00, 700.00, 0.00, 0.00, 0.00, 0.00, 29231.00, 0.00, 29231.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(19, '2023-11-13', 1, 12910.00, 0.00, 15118.00, 1291.00, 700.00, 0.00, 0.00, 788.00, 0.00, 30807.00, 0.00, 30807.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(19, '2023-12-21', 1, 13400.00, 0.00, 15691.00, 1340.00, 700.00, 0.00, 0.00, 0.00, 0.00, 31131.00, 0.00, 31131.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(19, '2024-01-22', 1, 13400.00, 0.00, 15691.00, 1340.00, 700.00, 0.00, 0.00, 0.00, 0.00, 31131.00, 0.00, 31131.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(19, '2024-02-17', 1, 13400.00, 0.00, 15691.00, 1340.00, 700.00, 0.00, 0.00, 0.00, 0.00, 31131.00, 0.00, 31131.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(19, '2024-03-23', 1, 13400.00, 0.00, 15691.00, 1340.00, 700.00, 0.00, 0.00, 0.00, 0.00, 31131.00, 0.00, 31131.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(19, '2024-04-24', 1, 13400.00, 0.00, 15691.00, 1340.00, 700.00, 0.00, 0.00, 0.00, 0.00, 31131.00, 0.00, 31131.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(19, '2024-05-28', 1, 13400.00, 0.00, 15691.00, 1340.00, 700.00, 0.00, 0.00, 0.00, 0.00, 31131.00, 0.00, 31131.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(19, '2024-06-26', 1, 13400.00, 0.00, 15691.00, 1340.00, 700.00, 0.00, 0.00, 0.00, 0.00, 31131.00, 0.00, 31131.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(20, '2023-06-23', 1, 12500.00, 0.00, 13438.00, 1250.00, 700.00, 0.00, 0.00, 438.00, 0.00, 28326.00, 0.00, 28326.00, 'akter', '2023-06-23 05:27:53', 'akter', '2023-08-18 10:21:19'),
(20, '2023-08-21', 1, 12500.00, 0.00, 13875.00, 1250.00, 700.00, 0.00, 0.00, 438.00, 0.00, 28763.00, 0.00, 28763.00, 'akter', '2023-08-21 05:48:26', 'akter', '2023-08-21 07:19:56'),
(20, '2023-09-18', 1, 12500.00, 0.00, 13875.00, 1250.00, 700.00, 0.00, 0.00, 0.00, 0.00, 28325.00, 0.00, 28325.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(20, '2023-10-12', 1, 12500.00, 0.00, 13875.00, 1250.00, 700.00, 0.00, 0.00, 0.00, 0.00, 28325.00, 0.00, 28325.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(20, '2023-11-13', 1, 12500.00, 0.00, 14638.00, 1250.00, 700.00, 0.00, 0.00, 763.00, 0.00, 29851.00, 0.00, 29851.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(20, '2023-12-21', 1, 12910.00, 0.00, 15118.00, 1291.00, 700.00, 0.00, 0.00, 0.00, 0.00, 30019.00, 0.00, 30019.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(20, '2024-01-22', 1, 12910.00, 0.00, 15118.00, 1291.00, 700.00, 0.00, 0.00, 0.00, 0.00, 30019.00, 0.00, 30019.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(20, '2024-02-17', 1, 12910.00, 0.00, 15118.00, 1291.00, 700.00, 0.00, 0.00, 0.00, 0.00, 30019.00, 0.00, 30019.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(20, '2024-03-23', 1, 12910.00, 0.00, 15118.00, 1291.00, 700.00, 0.00, 0.00, 0.00, 0.00, 30019.00, 0.00, 30019.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(20, '2024-04-24', 1, 12910.00, 0.00, 15118.00, 1291.00, 700.00, 0.00, 0.00, 0.00, 0.00, 30019.00, 0.00, 30019.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(20, '2024-05-28', 1, 12910.00, 0.00, 15118.00, 1291.00, 700.00, 0.00, 0.00, 0.00, 0.00, 30019.00, 0.00, 30019.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(20, '2024-06-26', 1, 12910.00, 0.00, 15118.00, 1291.00, 700.00, 0.00, 0.00, 0.00, 0.00, 30019.00, 0.00, 30019.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(21, '2023-06-23', 3, 3030.00, 0.00, 5992.00, 273.00, 150.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 0.00, 9445.00, 'akter', '2023-06-23 09:20:55', NULL, NULL),
(21, '2023-08-28', 3, 3030.00, 0.00, 5992.00, 273.00, 150.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 0.00, 9445.00, 'akter', '2023-08-28 05:43:49', NULL, NULL),
(21, '2023-09-18', 3, 3030.00, 0.00, 5992.00, 273.00, 150.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 0.00, 9445.00, 'akter', '2023-09-18 07:40:43', NULL, NULL),
(21, '2023-10-18', 3, 3030.00, 0.00, 5992.00, 273.00, 150.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 0.00, 9445.00, 'akter', '2023-10-18 09:59:51', NULL, NULL),
(21, '2023-12-21', 3, 3030.00, 0.00, 5992.00, 273.00, 150.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 0.00, 9445.00, 'akter', '2023-12-21 06:38:23', NULL, NULL),
(21, '2024-01-22', 3, 3030.00, 0.00, 5992.00, 273.00, 150.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 0.00, 9445.00, 'akter', '2024-01-22 05:24:56', NULL, NULL),
(21, '2024-02-17', 3, 3030.00, 0.00, 5992.00, 273.00, 150.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 0.00, 9445.00, 'akter', '2024-02-17 10:51:40', 'akter', '2024-02-19 04:58:38'),
(21, '2024-03-23', 3, 3030.00, 0.00, 5992.00, 273.00, 150.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 0.00, 9445.00, 'akter', '2024-03-23 06:42:22', NULL, NULL),
(21, '2024-04-24', 3, 3030.00, 0.00, 5992.00, 273.00, 150.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 0.00, 9445.00, 'akter', '2024-04-24 11:16:03', NULL, NULL),
(21, '2024-05-28', 3, 3030.00, 0.00, 5992.00, 273.00, 150.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 0.00, 9445.00, 'akter', '2024-05-28 04:59:34', NULL, NULL),
(21, '2024-06-26', 3, 3030.00, 0.00, 5992.00, 273.00, 150.00, 0.00, 0.00, 0.00, 0.00, 9445.00, 0.00, 9445.00, 'akter', '2024-06-26 06:42:23', NULL, NULL),
(22, '2023-09-18', 1, 49880.00, 0.00, 55367.00, 4988.00, 700.00, 0.00, 0.00, 0.00, 0.00, 110935.00, 0.00, 110935.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(22, '2023-10-12', 1, 49880.00, 0.00, 55367.00, 4988.00, 700.00, 0.00, 0.00, 0.00, 0.00, 110935.00, 0.00, 110935.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(22, '2023-11-13', 1, 49880.00, 0.00, 58409.00, 4988.00, 700.00, 0.00, 0.00, 3043.00, 0.00, 117020.00, 0.00, 117020.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(22, '2023-12-21', 1, 49880.00, 0.00, 58409.00, 4988.00, 700.00, 0.00, 0.00, 0.00, 0.00, 113977.00, 0.00, 113977.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(22, '2024-01-22', 1, 49880.00, 0.00, 58409.00, 4988.00, 700.00, 0.00, 0.00, 0.00, 0.00, 113977.00, 0.00, 113977.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(22, '2024-02-17', 1, 49880.00, 0.00, 58409.00, 4988.00, 700.00, 0.00, 0.00, 0.00, 0.00, 113977.00, 0.00, 113977.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(22, '2024-03-23', 1, 49880.00, 0.00, 58409.00, 4988.00, 700.00, 0.00, 0.00, 0.00, 0.00, 113977.00, 0.00, 113977.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(22, '2024-04-24', 1, 49880.00, 0.00, 58409.00, 4988.00, 700.00, 0.00, 0.00, 0.00, 0.00, 113977.00, 0.00, 113977.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(22, '2024-05-28', 1, 49880.00, 0.00, 58409.00, 4988.00, 700.00, 0.00, 0.00, 0.00, 0.00, 113977.00, 0.00, 113977.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(22, '2024-06-26', 1, 49880.00, 0.00, 58409.00, 4988.00, 700.00, 0.00, 0.00, 0.00, 0.00, 113977.00, 0.00, 113977.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(23, '2023-09-18', 1, 45950.00, 0.00, 51005.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102250.00, 0.00, 102250.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(23, '2023-10-12', 1, 45950.00, 0.00, 51005.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102250.00, 0.00, 102250.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(23, '2023-11-13', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 2803.00, 0.00, 107855.00, 0.00, 107855.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(23, '2023-12-21', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(23, '2024-01-22', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(23, '2024-02-17', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(23, '2024-03-23', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(23, '2024-04-24', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(23, '2024-05-28', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(23, '2024-06-26', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(24, '2023-09-18', 1, 45950.00, 0.00, 51005.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102250.00, 0.00, 102250.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(24, '2023-10-12', 1, 45950.00, 0.00, 51005.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102250.00, 0.00, 102250.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(24, '2023-11-13', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 2803.00, 0.00, 107855.00, 0.00, 107855.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(24, '2023-12-21', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(24, '2024-01-22', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(24, '2024-02-17', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(24, '2024-03-23', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(24, '2024-04-24', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(24, '2024-05-28', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(24, '2024-06-26', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(25, '2023-09-18', 1, 45950.00, 0.00, 51005.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102250.00, 0.00, 102250.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(25, '2023-10-12', 1, 45950.00, 0.00, 51005.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102250.00, 0.00, 102250.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(25, '2023-11-13', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 2803.00, 0.00, 107855.00, 0.00, 107855.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(25, '2023-12-21', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(25, '2024-01-22', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(25, '2024-02-17', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(25, '2024-03-23', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(25, '2024-04-24', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(25, '2024-05-28', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(25, '2024-06-26', 1, 45950.00, 0.00, 53807.00, 4595.00, 700.00, 0.00, 0.00, 0.00, 0.00, 105052.00, 0.00, 105052.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(26, '2023-09-18', 1, 43330.00, 0.00, 48096.00, 4333.00, 700.00, 0.00, 0.00, 0.00, 0.00, 96459.00, 0.00, 96459.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(26, '2023-10-12', 1, 44640.00, 0.00, 49550.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 99354.00, 0.00, 99354.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(26, '2023-11-13', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 2723.00, 0.00, 104800.00, 0.00, 104800.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(26, '2023-12-21', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(26, '2024-01-22', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(26, '2024-02-17', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(26, '2024-03-23', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(26, '2024-04-24', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(26, '2024-05-28', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(26, '2024-06-26', 1, 44640.00, 0.00, 52273.00, 4464.00, 700.00, 0.00, 0.00, 0.00, 0.00, 102077.00, 0.00, 102077.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(27, '2023-09-18', 1, 22385.00, 0.00, 24847.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 50171.00, 0.00, 50171.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(27, '2023-10-12', 1, 22385.00, 0.00, 24847.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 50171.00, 0.00, 50171.00, 'akter', '2023-10-12 12:15:13', NULL, NULL);
INSERT INTO `td_income` (`emp_code`, `effective_date`, `catg_id`, `basic`, `sp`, `da`, `hra`, `ma`, `sa`, `ta`, `arrear`, `ot`, `gross`, `lwp`, `final_gross`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(27, '2023-11-13', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 1365.00, 0.00, 52902.00, 0.00, 52902.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(27, '2023-12-21', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(27, '2024-01-22', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(27, '2024-02-17', 1, 22385.00, 0.00, 26213.00, 2239.00, 700.00, 0.00, 0.00, 0.00, 0.00, 51537.00, 0.00, 51537.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(27, '2024-03-23', 1, 23530.00, 0.00, 27554.00, 2353.00, 700.00, 0.00, 0.00, 0.00, 0.00, 54137.00, 0.00, 54137.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(27, '2024-04-24', 1, 23530.00, 0.00, 27554.00, 2353.00, 700.00, 0.00, 0.00, 0.00, 0.00, 54137.00, 0.00, 54137.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(27, '2024-05-28', 1, 23530.00, 0.00, 27554.00, 2353.00, 700.00, 0.00, 0.00, 0.00, 0.00, 54137.00, 0.00, 54137.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(27, '2024-06-26', 1, 23530.00, 0.00, 27554.00, 2353.00, 700.00, 0.00, 0.00, 0.00, 0.00, 54137.00, 0.00, 54137.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(28, '2023-09-18', 1, 16175.00, 0.00, 17954.00, 1618.00, 700.00, 0.00, 0.00, 0.00, 0.00, 36447.00, 0.00, 36447.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(28, '2023-10-12', 1, 16175.00, 0.00, 17954.00, 1618.00, 700.00, 0.00, 0.00, 0.00, 0.00, 36447.00, 0.00, 36447.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(28, '2023-11-13', 1, 16175.00, 0.00, 18941.00, 1618.00, 700.00, 0.00, 0.00, 987.00, 0.00, 38421.00, 0.00, 38421.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(28, '2023-12-21', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(28, '2024-01-22', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(28, '2024-02-17', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(28, '2024-03-23', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(28, '2024-04-24', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(28, '2024-05-28', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(28, '2024-06-26', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(29, '2023-09-18', 1, 16175.00, 0.00, 17954.00, 1618.00, 700.00, 0.00, 0.00, 0.00, 0.00, 36447.00, 0.00, 36447.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(29, '2023-10-12', 1, 16175.00, 0.00, 17954.00, 1618.00, 700.00, 0.00, 0.00, 0.00, 0.00, 36447.00, 0.00, 36447.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(29, '2023-11-13', 1, 16175.00, 0.00, 18941.00, 1618.00, 700.00, 0.00, 0.00, 987.00, 0.00, 38421.00, 0.00, 38421.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(29, '2023-12-21', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(29, '2024-01-22', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(29, '2024-02-17', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(29, '2024-03-23', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(29, '2024-04-24', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(29, '2024-05-28', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(29, '2024-06-26', 1, 17155.00, 0.00, 20089.00, 1716.00, 700.00, 0.00, 0.00, 0.00, 0.00, 39660.00, 0.00, 39660.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(30, '2023-09-18', 1, 14545.00, 0.00, 16145.00, 1455.00, 700.00, 0.00, 0.00, 0.00, 0.00, 32845.00, 0.00, 32845.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(30, '2023-10-12', 1, 14545.00, 0.00, 16145.00, 1455.00, 700.00, 0.00, 0.00, 0.00, 0.00, 32845.00, 0.00, 32845.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(30, '2023-11-13', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 0.00, 0.00, 887.00, 0.00, 34619.00, 0.00, 34619.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(30, '2023-12-21', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 0.00, 0.00, 0.00, 0.00, 33732.00, 0.00, 33732.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(30, '2024-01-22', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 0.00, 0.00, 0.00, 0.00, 33732.00, 0.00, 33732.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(30, '2024-02-17', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 0.00, 0.00, 0.00, 0.00, 33732.00, 0.00, 33732.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(30, '2024-03-23', 1, 15360.00, 0.00, 17987.00, 1536.00, 700.00, 0.00, 0.00, 0.00, 0.00, 35583.00, 0.00, 35583.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(30, '2024-04-24', 1, 15360.00, 0.00, 17987.00, 1536.00, 700.00, 0.00, 0.00, 0.00, 0.00, 35583.00, 0.00, 35583.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(30, '2024-05-28', 1, 15360.00, 0.00, 17987.00, 1536.00, 700.00, 0.00, 0.00, 0.00, 0.00, 35583.00, 0.00, 35583.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(30, '2024-06-26', 1, 15360.00, 0.00, 17987.00, 1536.00, 700.00, 0.00, 0.00, 0.00, 0.00, 35583.00, 0.00, 35583.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(31, '2023-09-18', 1, 14545.00, 0.00, 16145.00, 1455.00, 700.00, 500.00, 0.00, 0.00, 0.00, 33345.00, 0.00, 33345.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(31, '2023-10-12', 1, 14545.00, 0.00, 16145.00, 1455.00, 700.00, 500.00, 0.00, 0.00, 0.00, 33345.00, 0.00, 33345.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(31, '2023-11-13', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 500.00, 0.00, 887.00, 0.00, 35119.00, 0.00, 35119.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(31, '2023-12-21', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 500.00, 0.00, 0.00, 0.00, 34232.00, 0.00, 34232.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(31, '2024-01-22', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 500.00, 0.00, 0.00, 0.00, 34232.00, 0.00, 34232.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(31, '2024-02-17', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 500.00, 0.00, 0.00, 0.00, 34232.00, 0.00, 34232.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(31, '2024-03-23', 1, 15360.00, 0.00, 17987.00, 1536.00, 700.00, 500.00, 0.00, 0.00, 0.00, 36083.00, 0.00, 36083.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(31, '2024-04-24', 1, 15360.00, 0.00, 17987.00, 1536.00, 700.00, 500.00, 0.00, 0.00, 0.00, 36083.00, 0.00, 36083.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(31, '2024-05-28', 1, 15360.00, 0.00, 17987.00, 1536.00, 700.00, 500.00, 0.00, 0.00, 0.00, 36083.00, 0.00, 36083.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(31, '2024-06-26', 1, 15360.00, 0.00, 17987.00, 1536.00, 700.00, 500.00, 0.00, 0.00, 0.00, 36083.00, 0.00, 36083.00, 'akter', '2024-06-26 06:41:16', NULL, NULL),
(32, '2023-09-18', 1, 13730.00, 0.00, 15240.00, 1373.00, 700.00, 0.00, 0.00, 0.00, 0.00, 31043.00, 0.00, 31043.00, 'akter', '2023-09-18 09:03:21', 'akter', '2023-09-18 09:30:06'),
(32, '2023-10-12', 1, 13730.00, 0.00, 15240.00, 1373.00, 700.00, 0.00, 0.00, 0.00, 0.00, 31043.00, 0.00, 31043.00, 'akter', '2023-10-12 12:15:13', NULL, NULL),
(32, '2023-11-13', 1, 13730.00, 0.00, 16078.00, 1373.00, 700.00, 0.00, 0.00, 838.00, 0.00, 32719.00, 0.00, 32719.00, 'akter', '2023-11-13 09:21:35', 'akter', '2023-11-16 07:52:11'),
(32, '2023-12-21', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 0.00, 0.00, 0.00, 0.00, 33732.00, 0.00, 33732.00, 'akter', '2023-12-21 06:38:10', NULL, NULL),
(32, '2024-01-22', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 0.00, 0.00, 0.00, 0.00, 33732.00, 0.00, 33732.00, 'akter', '2024-01-22 05:23:46', 'akter', '2024-01-22 05:24:39'),
(32, '2024-02-17', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 0.00, 0.00, 0.00, 0.00, 33732.00, 0.00, 33732.00, 'akter', '2024-02-17 10:51:26', 'akter', '2024-02-26 06:16:40'),
(32, '2024-03-23', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 0.00, 0.00, 0.00, 0.00, 33732.00, 0.00, 33732.00, 'akter', '2024-03-23 06:41:49', NULL, NULL),
(32, '2024-04-24', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 0.00, 0.00, 0.00, 0.00, 33732.00, 0.00, 33732.00, 'akter', '2024-04-24 11:15:12', NULL, NULL),
(32, '2024-05-28', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 0.00, 0.00, 0.00, 0.00, 33732.00, 0.00, 33732.00, 'akter', '2024-05-28 04:59:10', NULL, NULL),
(32, '2024-06-26', 1, 14545.00, 0.00, 17032.00, 1455.00, 700.00, 0.00, 0.00, 0.00, 0.00, 33732.00, 0.00, 33732.00, 'akter', '2024-06-26 06:41:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_leave_dtls`
--

CREATE TABLE `td_leave_dtls` (
  `trans_dt` date NOT NULL,
  `trans_cd` int(11) NOT NULL,
  `trans_type` varchar(1) NOT NULL,
  `emp_no` varchar(50) NOT NULL,
  `emp_name` varchar(120) NOT NULL,
  `docket_no` varchar(100) NOT NULL,
  `leave_type` varchar(5) NOT NULL,
  `leave_mode` varchar(1) NOT NULL,
  `from_dt` date NOT NULL,
  `to_dt` date NOT NULL,
  `no_of_days` decimal(4,1) NOT NULL DEFAULT 0.0,
  `remarks` tinytext NOT NULL,
  `approval_status` varchar(1) NOT NULL,
  `approved_dt` date NOT NULL,
  `approved_by` varchar(50) NOT NULL,
  `rollback_reason` tinytext NOT NULL,
  `roll_dt` date DEFAULT NULL,
  `roll_by` varchar(50) DEFAULT NULL,
  `cl_bal` decimal(4,1) NOT NULL DEFAULT 0.0,
  `el_bal` decimal(4,1) NOT NULL DEFAULT 0.0,
  `ml_bal` decimal(4,1) NOT NULL DEFAULT 0.0,
  `od_bal` decimal(4,1) NOT NULL DEFAULT 0.0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_leave_mat`
--

CREATE TABLE `td_leave_mat` (
  `trans_dt` date NOT NULL,
  `trans_cd` int(11) NOT NULL,
  `emp_no` varchar(50) NOT NULL,
  `emp_name` varchar(120) NOT NULL,
  `docket_no` varchar(100) NOT NULL,
  `from_dt` date NOT NULL,
  `to_dt` date NOT NULL,
  `no_of_days` float(3,1) NOT NULL,
  `remarks` tinytext NOT NULL,
  `approval_status` varchar(1) NOT NULL,
  `approved_dt` date NOT NULL,
  `approved_by` varchar(50) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_pay_slip`
--

CREATE TABLE `td_pay_slip` (
  `id` int(10) NOT NULL,
  `bank_id` int(5) NOT NULL,
  `trans_dt` date NOT NULL,
  `trans_no` int(10) NOT NULL,
  `sal_month` int(4) NOT NULL,
  `sal_year` int(5) NOT NULL,
  `emp_code` varchar(55) NOT NULL,
  `catg_id` int(10) NOT NULL,
  `pay_head_id` int(10) NOT NULL,
  `pay_head_type` enum('E','D','F') DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_by` varchar(55) NOT NULL,
  `created_dt` date NOT NULL,
  `created_ip` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_pay_slip`
--

INSERT INTO `td_pay_slip` (`id`, `bank_id`, `trans_dt`, `trans_no`, `sal_month`, `sal_year`, `emp_code`, `catg_id`, `pay_head_id`, `pay_head_type`, `amount`, `created_by`, `created_dt`, `created_ip`) VALUES
(1, 1, '2024-07-25', 1, 7, 2024, '5', 1, 0, 'E', 19920.00, 'sss', '2024-07-25', '::1'),
(2, 1, '2024-07-25', 1, 7, 2024, '5', 1, 104, 'E', 23326.00, 'sss', '2024-07-25', '::1'),
(3, 1, '2024-07-25', 1, 7, 2024, '5', 1, 105, 'E', 1992.00, 'sss', '2024-07-25', '::1'),
(4, 1, '2024-07-25', 1, 7, 2024, '5', 1, 106, 'E', 500.00, 'sss', '2024-07-25', '::1'),
(5, 1, '2024-07-25', 1, 7, 2024, '5', 1, 107, 'E', 500.00, 'sss', '2024-07-25', '::1'),
(6, 1, '2024-07-25', 1, 7, 2024, '5', 1, 108, 'E', 600.00, 'sss', '2024-07-25', '::1'),
(7, 1, '2024-07-25', 1, 7, 2024, '5', 1, 109, 'E', 600.00, 'sss', '2024-07-25', '::1'),
(8, 1, '2024-07-25', 1, 7, 2024, '5', 1, 111, 'E', 600.00, 'sss', '2024-07-25', '::1'),
(9, 1, '2024-07-25', 1, 7, 2024, '5', 1, 112, 'E', 600.00, 'sss', '2024-07-25', '::1'),
(10, 1, '2024-07-25', 1, 7, 2024, '5', 1, 113, 'E', 600.00, 'sss', '2024-07-25', '::1'),
(11, 1, '2024-07-25', 1, 7, 2024, '5', 1, 114, 'E', 600.00, 'sss', '2024-07-25', '::1'),
(12, 1, '2024-07-25', 1, 7, 2024, '5', 1, 115, 'E', 500.00, 'sss', '2024-07-25', '::1'),
(13, 1, '2024-07-25', 1, 7, 2024, '5', 1, 116, 'E', 600.00, 'sss', '2024-07-25', '::1'),
(14, 1, '2024-07-25', 1, 7, 2024, '5', 1, 117, 'E', 8000.00, 'sss', '2024-07-25', '::1'),
(15, 1, '2024-07-25', 1, 7, 2024, '5', 1, 201, 'D', 5000.00, 'sss', '2024-07-25', '::1'),
(16, 1, '2024-07-25', 1, 7, 2024, '5', 1, 102, 'D', 10.00, 'sss', '2024-07-25', '::1'),
(17, 1, '2024-07-25', 1, 7, 2024, '5', 1, 202, 'D', 500.00, 'sss', '2024-07-25', '::1'),
(18, 1, '2024-07-25', 1, 7, 2024, '5', 1, 204, 'D', 200.00, 'sss', '2024-07-25', '::1'),
(19, 1, '2024-07-25', 1, 7, 2024, '5', 1, 207, 'D', 10.00, 'sss', '2024-07-25', '::1'),
(20, 1, '2024-07-25', 1, 7, 2024, '5', 1, 208, 'D', 200.00, 'sss', '2024-07-25', '::1'),
(21, 1, '2024-07-25', 1, 7, 2024, '5', 1, 209, 'D', 500.00, 'sss', '2024-07-25', '::1'),
(22, 1, '2024-07-25', 1, 7, 2024, '5', 1, 210, 'D', 10.00, 'sss', '2024-07-25', '::1'),
(23, 1, '2024-07-25', 1, 7, 2024, '5', 1, 211, 'D', 50.00, 'sss', '2024-07-25', '::1'),
(24, 1, '2024-07-25', 1, 7, 2024, '5', 1, 210, 'D', 10.00, 'sss', '2024-07-25', '::1'),
(25, 1, '2024-07-25', 1, 7, 2024, '5', 1, 212, 'D', 2.00, 'sss', '2024-07-25', '::1'),
(26, 1, '2024-07-25', 1, 7, 2024, '5', 1, 213, 'D', 30.00, 'sss', '2024-07-25', '::1'),
(27, 1, '2024-07-25', 1, 7, 2024, '5', 1, 214, 'D', 10.00, 'sss', '2024-07-25', '::1'),
(28, 1, '2024-07-25', 1, 7, 2024, '5', 1, 215, 'D', 110.00, 'sss', '2024-07-25', '::1'),
(29, 1, '2024-07-25', 1, 7, 2024, '8', 1, 0, 'E', 11680.00, 'sss', '2024-07-25', '::1'),
(30, 1, '2024-07-25', 1, 7, 2024, '8', 1, 104, 'E', 13677.00, 'sss', '2024-07-25', '::1'),
(31, 1, '2024-07-25', 1, 7, 2024, '8', 1, 105, 'E', 1168.00, 'sss', '2024-07-25', '::1'),
(32, 1, '2024-07-25', 1, 7, 2024, '8', 1, 107, 'E', 700.00, 'sss', '2024-07-25', '::1'),
(33, 1, '2024-07-25', 1, 7, 2024, '8', 1, 108, 'E', 600.00, 'sss', '2024-07-25', '::1'),
(34, 1, '2024-07-25', 1, 7, 2024, '8', 1, 201, 'D', 800.00, 'sss', '2024-07-25', '::1'),
(35, 1, '2024-07-25', 1, 7, 2024, '8', 1, 215, 'D', 100.00, 'sss', '2024-07-25', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `td_salary`
--

CREATE TABLE `td_salary` (
  `bank_id` int(10) NOT NULL,
  `trans_date` date NOT NULL,
  `trans_no` int(11) NOT NULL,
  `sal_month` int(11) NOT NULL,
  `sal_year` int(11) NOT NULL,
  `catg_cd` int(11) NOT NULL,
  `approval_status` varchar(1) NOT NULL DEFAULT 'U',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL,
  `approved_by` varchar(50) DEFAULT NULL,
  `approved_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `td_salary`
--

INSERT INTO `td_salary` (`bank_id`, `trans_date`, `trans_no`, `sal_month`, `sal_year`, `catg_cd`, `approval_status`, `created_by`, `created_dt`, `modified_by`, `modified_dt`, `approved_by`, `approved_dt`) VALUES
(1, '2024-07-25', 1, 7, 2024, 1, 'A', 'sss', '2024-07-25 01:26:13', NULL, NULL, 'sss', '2024-07-26 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `td_stop_salary`
--

CREATE TABLE `td_stop_salary` (
  `trans_dt` date NOT NULL,
  `emp_no` int(11) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL,
  `remarks` text NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tm_pf_dtls`
--

CREATE TABLE `tm_pf_dtls` (
  `trans_dt` date NOT NULL,
  `trans_no` int(11) NOT NULL DEFAULT 0,
  `sal_month` varchar(10) NOT NULL,
  `sal_year` int(11) NOT NULL,
  `emp_no` int(11) NOT NULL,
  `employee_cntr` decimal(10,2) NOT NULL DEFAULT 0.00,
  `employer_cntr` decimal(10,2) NOT NULL DEFAULT 0.00,
  `balance` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `md_bank`
--
ALTER TABLE `md_bank`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `md_basic_pay`
--
ALTER TABLE `md_basic_pay`
  ADD PRIMARY KEY (`effective_dt`,`emp_cd`);

--
-- Indexes for table `md_branch`
--
ALTER TABLE `md_branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_caste`
--
ALTER TABLE `md_caste`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_category`
--
ALTER TABLE `md_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `md_department`
--
ALTER TABLE `md_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_designation`
--
ALTER TABLE `md_designation`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `md_district`
--
ALTER TABLE `md_district`
  ADD PRIMARY KEY (`district_code`);

--
-- Indexes for table `md_employee`
--
ALTER TABLE `md_employee`
  ADD PRIMARY KEY (`emp_code`);

--
-- Indexes for table `md_fin_year`
--
ALTER TABLE `md_fin_year`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `md_leave_allocation`
--
ALTER TABLE `md_leave_allocation`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `md_month`
--
ALTER TABLE `md_month`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_parameters`
--
ALTER TABLE `md_parameters`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `md_pay_head`
--
ALTER TABLE `md_pay_head`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `md_ptax`
--
ALTER TABLE `md_ptax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_ptax_slab`
--
ALTER TABLE `md_ptax_slab`
  ADD PRIMARY KEY (`effective_dt`,`sl_no`);

--
-- Indexes for table `md_users`
--
ALTER TABLE `md_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `td_attendance`
--
ALTER TABLE `td_attendance`
  ADD PRIMARY KEY (`trans_dt`,`sal_year`,`sal_month`,`emp_cd`);

--
-- Indexes for table `td_audit_trail`
--
ALTER TABLE `td_audit_trail`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `td_deductions`
--
ALTER TABLE `td_deductions`
  ADD PRIMARY KEY (`emp_code`,`effective_date`,`catg_id`) USING BTREE;

--
-- Indexes for table `td_earning_deduction`
--
ALTER TABLE `td_earning_deduction`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `td_income`
--
ALTER TABLE `td_income`
  ADD PRIMARY KEY (`emp_code`,`effective_date`,`catg_id`) USING BTREE;

--
-- Indexes for table `td_leave_dtls`
--
ALTER TABLE `td_leave_dtls`
  ADD PRIMARY KEY (`trans_dt`,`trans_cd`) USING BTREE;

--
-- Indexes for table `td_leave_mat`
--
ALTER TABLE `td_leave_mat`
  ADD PRIMARY KEY (`trans_cd`,`trans_dt`) USING BTREE;

--
-- Indexes for table `td_pay_slip`
--
ALTER TABLE `td_pay_slip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_salary`
--
ALTER TABLE `td_salary`
  ADD PRIMARY KEY (`trans_date`,`trans_no`,`sal_month`,`sal_year`,`catg_cd`) USING BTREE;

--
-- Indexes for table `td_stop_salary`
--
ALTER TABLE `td_stop_salary`
  ADD PRIMARY KEY (`trans_dt`,`emp_no`) USING BTREE;

--
-- Indexes for table `tm_pf_dtls`
--
ALTER TABLE `tm_pf_dtls`
  ADD PRIMARY KEY (`trans_dt`,`emp_no`,`sal_month`,`sal_year`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `md_bank`
--
ALTER TABLE `md_bank`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `md_branch`
--
ALTER TABLE `md_branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `md_caste`
--
ALTER TABLE `md_caste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `md_category`
--
ALTER TABLE `md_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `md_department`
--
ALTER TABLE `md_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `md_designation`
--
ALTER TABLE `md_designation`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `md_district`
--
ALTER TABLE `md_district`
  MODIFY `district_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;

--
-- AUTO_INCREMENT for table `md_fin_year`
--
ALTER TABLE `md_fin_year`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `md_leave_allocation`
--
ALTER TABLE `md_leave_allocation`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_month`
--
ALTER TABLE `md_month`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `md_parameters`
--
ALTER TABLE `md_parameters`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `md_pay_head`
--
ALTER TABLE `md_pay_head`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=421;

--
-- AUTO_INCREMENT for table `md_ptax`
--
ALTER TABLE `md_ptax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `td_audit_trail`
--
ALTER TABLE `td_audit_trail`
  MODIFY `sl_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=456;

--
-- AUTO_INCREMENT for table `td_earning_deduction`
--
ALTER TABLE `td_earning_deduction`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `td_pay_slip`
--
ALTER TABLE `td_pay_slip`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
