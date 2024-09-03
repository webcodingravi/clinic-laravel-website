-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2024 at 02:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_headers`
--

CREATE TABLE `account_headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('Debit','Credit') NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `application_settings`
--

CREATE TABLE `application_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_short_name` varchar(255) NOT NULL,
  `item_version` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_email` varchar(255) DEFAULT NULL,
  `company_address` text DEFAULT NULL,
  `developed_by` varchar(255) DEFAULT NULL,
  `developed_by_href` varchar(255) DEFAULT NULL,
  `developed_by_title` varchar(255) DEFAULT NULL,
  `developed_by_prefix` varchar(255) DEFAULT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `is_demo` enum('0','1') NOT NULL DEFAULT '0',
  `time_zone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `application_settings`
--

INSERT INTO `application_settings` (`id`, `item_name`, `item_short_name`, `item_version`, `company_name`, `company_email`, `company_address`, `developed_by`, `developed_by_href`, `developed_by_title`, `developed_by_prefix`, `support_email`, `logo`, `favicon`, `language`, `is_demo`, `time_zone`, `created_at`, `updated_at`) VALUES
(1, 'iDentSoft', 'iDentSoft', '2.0', 'ambitiousit', 'bd.ambitiousit@gmail.com', 'Natore, Bangladesh', 'Ambitiousit', 'http://ambitiousit.net/', 'Your hope our goal', 'Developed by', 'bd.ambitiousit@gmail.com', NULL, NULL, 'en', '0', 'Asia/Dhaka', '2024-09-03 03:22:45', '2024-09-03 03:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `domain` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `domain`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'identsoft.ambitiousit.net', 1, '2024-09-03 03:22:45', '2024-09-03 03:22:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `rate` double(15,8) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 0,
  `precision` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `symbol_first` varchar(255) DEFAULT NULL,
  `decimal_mark` varchar(255) DEFAULT NULL,
  `thousands_separator` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `company_id`, `name`, `code`, `rate`, `enabled`, `precision`, `symbol`, `symbol_first`, `decimal_mark`, `thousands_separator`, `created_at`, `updated_at`) VALUES
(1, 1, 'US Dollar', 'USD', 1.00000000, 1, '2', '$', '1', '.', ',', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(2, 1, 'Euro', 'EUR', 1.25000000, 0, '2', '€', '1', ',', '.', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(3, 1, 'British Pound', 'GBP', 1.60000000, 0, '2', '£', '1', '.', ',', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(4, 1, 'Turkish Lira', 'TRY', 0.80000000, 0, '2', '₺', '1', ',', '.', '2024-09-03 03:22:45', '2024-09-03 03:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_details`
--

CREATE TABLE `doctor_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hospital_department_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `specialist` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `biography` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctor_details`
--

INSERT INTO `doctor_details` (`id`, `hospital_department_id`, `user_id`, `specialist`, `designation`, `biography`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Outpatient Department', 'MBBS', '<p><br></p>', '2021-12-06 01:18:05', '2021-12-06 02:20:28'),
(2, 1, 7, 'Orthopedics', 'M.D, M.S.', '<p><br></p>', '2021-12-06 01:25:04', '2021-12-06 01:25:04'),
(3, 2, 8, 'Pediatricians', 'M.D.', '<p><br></p>', '2021-12-06 01:29:05', '2021-12-06 01:29:05'),
(4, 2, 9, 'Gynecologist/Oncologist', 'FCPS', '<p><br></p>', '2021-12-06 01:33:10', '2021-12-06 01:33:10'),
(5, 3, 10, 'Neurosurgery', 'MBBS', '<p><br></p>', '2021-12-06 01:41:28', '2021-12-06 01:41:28'),
(6, 3, 11, 'Cardiovascular', 'FCPS', '<p><br></p>', '2021-12-06 01:44:19', '2021-12-06 01:44:19'),
(7, 5, 12, 'Psychiatry', 'MBBS', '<p><br></p>', '2021-12-06 01:47:19', '2021-12-06 01:47:19'),
(8, 5, 13, 'Pediatric Anesthesiologist', 'MBBS', '<p><br></p>', '2021-12-06 01:58:36', '2021-12-06 01:58:36'),
(9, 6, 14, 'Cardiologists', 'MBBS', '<p><br></p>', '2021-12-06 02:01:31', '2021-12-06 02:01:31'),
(10, 6, 15, 'Cardiovascular Surgeons', 'MCH', '<p><br></p>', '2021-12-06 02:04:01', '2021-12-06 02:04:01'),
(11, 7, 16, 'Otolaryngologist', 'MD', '<p><br></p>', '2021-12-06 02:07:06', '2021-12-06 02:08:14'),
(12, 7, 17, 'Pharmacy', 'MBBS', '<p><br></p>', '2021-12-06 02:10:13', '2021-12-06 02:10:13'),
(13, 8, 18, 'Radiology & Imaging', 'MBBS, DMRD, MD (Radiology)', '<p><br></p>', '2021-12-06 02:13:45', '2021-12-06 02:13:45'),
(14, 8, 19, 'Radiology & Imaging', 'Professor, Department of Radiology', '<p><br></p>', '2021-12-06 02:17:13', '2021-12-06 02:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedules`
--

CREATE TABLE `doctor_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `weekday` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `avg_appointment_duration` int(11) NOT NULL DEFAULT 5,
  `serial_type` enum('Sequential','Timestamp') NOT NULL DEFAULT 'Sequential',
  `status` enum('0','1') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctor_schedules`
--

INSERT INTO `doctor_schedules` (`id`, `user_id`, `weekday`, `start_time`, `end_time`, `avg_appointment_duration`, `serial_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 'Wednesday', '05:00:00', '23:59:00', 30, 'Sequential', '1', '2021-12-06 02:38:06', '2024-09-03 05:28:12'),
(2, 2, 'Saturday', '00:00:00', '23:59:00', 30, 'Timestamp', '1', '2021-12-06 02:38:43', '2021-12-06 02:38:52'),
(3, 2, 'Sunday', '00:00:00', '23:59:00', 30, 'Sequential', '1', '2021-12-06 02:40:58', '2021-12-06 02:40:58'),
(4, 2, 'Monday', '00:00:00', '23:59:00', 30, 'Timestamp', '1', '2021-12-06 02:41:27', '2021-12-06 02:41:27'),
(5, 2, 'Tuesday', '00:00:00', '23:59:00', 30, 'Sequential', '1', '2021-12-06 02:42:21', '2021-12-06 02:42:21'),
(6, 2, 'Wednesday', '00:00:00', '23:59:00', 30, 'Timestamp', '1', '2021-12-06 02:43:23', '2021-12-06 02:43:23'),
(7, 2, 'Thursday', '00:00:00', '23:59:00', 30, 'Timestamp', '1', '2021-12-06 02:44:02', '2021-12-06 02:44:02'),
(8, 7, 'Monday', '12:00:00', '14:00:00', 30, 'Sequential', '1', '2024-09-03 05:30:28', '2024-09-03 05:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `email_campaigns`
--

CREATE TABLE `email_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `email_template_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text NOT NULL,
  `schedule_time` datetime NOT NULL,
  `contact_type` varchar(255) NOT NULL,
  `status` enum('Pending','Processing','Completed','Failed') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_campaign_logs`
--

CREATE TABLE `email_campaign_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `email_campaign_id` bigint(20) UNSIGNED NOT NULL,
  `smtp_configuration_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_ends`
--

CREATE TABLE `front_ends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`content`)),
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_ends`
--

INSERT INTO `front_ends` (`id`, `page`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'home', '{\"topAddress\":\"Dolor sit, #PTH, 55080, 4300 Honey Street\",\"topEmail\":\"rkdesigner@gmail.com\",\"questionCall\":\"121-345-64369\",\"headline\":\"Creating The Healthy Smile You Want Through Science And Artistry.\",\"tagline\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit sunt in culpa qui officia sed deserunt mollit anim id est laborum mollit anim id est nulla.\",\"welcome\":\"Welcome To Our Clinic\",\"welCol1\":\"Ea consequuntur illum facere aperiam sequi optio consectetur adipisicing elitFuga, suscipit totam animi consequatur saepe blanditiis.Lorem ipsum dolor sit amet,Ea consequuntur illum facere aperiam sequi optio consectetur adipisicing elit. Fuga, suscipit totam animi consequatur saepe blanditiis.\",\"welCol2\":\"Ea consequuntur illum facere aperiam sequi optio consectetur adipisicing elitFuga, suscipit totam animi consequatur saepe blanditiis.Lorem ipsum dolor sit amet,Ea consequuntur illum facere aperiam sequi optio consectetur adipisicing elit. Fuga, suscipit totam animi consequatur saepe blanditiis.\",\"caring\":\"Caring Technologies For Your Health\",\"appointmentCount\":\"165\",\"clientCount\":\"563\",\"caringText\":\"Lorem illum facere aperiam sequi optio consectetur adipisicing elitFuga, suscipit totam animi consequatur saepe blanditiis.Lorem ipsum dolor sit amet\",\"appointmentText\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit\",\"clientText\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit\",\"services\":[\"Family & general dentistry\",\"Implant dentistry\",\"Cosmetic dentistry\",\"Using Best Quality tools.\"],\"images\":[\"storage\\/front-end\\/bdTShfdTVlZSKVTGa5yVjlfMUKVJU3EdT5r6HmcG.png\",\"storage\\/front-end\\/MD3p8FxVuC8infeYvM96ICanJL51ExhDG0hA80vo.png\",\"storage\\/front-end\\/F2CYTyTe9tmGw13a6PXjMJ4v7W9hp8foGGUHVeze.png\"],\"review\":[\"Phillip Hunt\",\"Sara Grant\",\"Luke Jacobs\"],\"company\":[\"Example Company\",\"Example Company\",\"Example Company\"],\"reviewText\":[\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea sit id accusantium officia quod quasi necessitatibus perspiciatis.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat\",\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea sit id accusantium officia quod quasi necessitatibus perspiciatis.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat\",\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea sit id accusantium officia quod quasi necessitatibus perspiciatis.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat\"],\"bottomTagLine\":\"Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\",\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/?lang=en\",\"google\":\"https:\\/\\/myaccount.google.com\\/profile\",\"monday_s\":\"09:00 \\u2013 17:00\",\"tuesday_s\":\"09:00 \\u2013 17:00\",\"wednesday_s\":\"09:00 \\u2013 17:00\",\"thursday_s\":\"09:00 \\u2013 17:00\",\"friday_s\":\"09:00 \\u2013 17:00\",\"saturday_s\":\"Closed\",\"sunday_s\":\"Closed\"}', '1', '2022-01-04 07:24:46', '2024-09-03 03:30:40'),
(2, 'about', '{\"teams\": [\"Theresa Cruz\", \"Scott Colon\", \"Bertha Sherman\", \"\"], \"_token\": \"7msBu459N5WsBCQ2jvd7VI1b67ah2wBCaXMbeOhq\", \"images\": [\"storage/front-end/EiEYayKsz2eSgLjwwIjNVpsb8FrdRszj1eSDN1DN.png\", \"storage/front-end/D0tjlYRpRPrwlOVByAl6QisgUXD4TL9eMXA52zRm.png\", \"storage/front-end/ZGZllUYFTDJTQlJgPpK6EmjUIZBnkq1UDXHh3yNA.png\", \"storage/front-end/WB8qs5iwzlkdXSLmGyHQ5r1kEdrtUTwRDJg69NbN.png\", \"storage/front-end/0psE1Ii058UnVKXqNuDnV1gZOCTR4CbysjPz5qkd.png\", \"storage/front-end/UpX7UOaCgIRZryGePHjrhsHAEHPQuKyllWpIwDzV.png\", \"storage/front-end/S3rAwz9bG5u1713RWhfCjznt0kQeMXyxMusxFsAN.png\"], \"_method\": \"PUT\", \"services\": [\"Cosmetic Dentistry\", \"Dental Implants\", \"Pediatric Dentistry\", \"Periodontal Therapy\"], \"teamPost\": [\"President & CEO\", \"Doctor\", \"Doctor\", \"\"], \"aboutOurTeam\": \"Lorem ipsum dolor sit amet consectetur adipisicing elit sunt in culpa qui officia sed deserunt mollit anim id est laborum mollit anim id est nulla.\", \"aboutHelpHand\": \"Lorem ipsum dolor sit amet,Ea consequuntur illum facere aperiam sequi optio consectetur adipisicing elit.\", \"aboutWorkHeart\": \"Lorem ipsum dolor sit amet,Ea consequuntur illum facere aperiam sequi optio consectetur adipisicing elit.\", \"aboutAnnualCheck\": \"Lorem ipsum dolor sit amet,Ea consequuntur illum facere aperiam sequi optio consectetur adipisicing elit.\", \"aboutWhyChooseUs\": \"Excepteur sint occaecat non proident, sunt in culpa quis. Phasellus lacinia id erat eu ullamcorper. Nunc id ipsum fringilla, gravida felis vitae. Phasellus lacinia id, sunt in culpa quis. Phasellus lacinia\"}', '1', '2022-01-04 07:24:46', '2022-01-05 03:30:05'),
(3, 'services', '{\"open\": \"Lorem ipsum dolor sit amet,Ea consequuntur illum facere.\", \"work\": \"Lorem ipsum dolor sit amet,Ea consequuntur illum facere.\", \"check\": \"Lorem ipsum dolor sit amet,Ea consequuntur illum facere.\", \"smile\": \"Lorem ipsum dolor sit amet,Ea consequuntur illum facere.\", \"_token\": \"7msBu459N5WsBCQ2jvd7VI1b67ah2wBCaXMbeOhq\", \"images\": [\"storage/front-end/CwDwjKlWjZTdClJIOEA1IDWeYBeaKF6PgqBqdZeG.png\", \"storage/front-end/nfpiaOHKdIUBRZgEYHVcHhtPOBDz64i3jDDB0LmD.png\", \"storage/front-end/gBX6w1woQtoacyB8BMvNtTfM8ZvmdcqXE5blsMOn.png\", \"storage/front-end/Np6z6FY7kGv1BCafEQIdmopJYQ3Axtu4lvdywD0C.png\", \"storage/front-end/ue7E5yXYblngXOXr5kIN5xNMAsOKS2nuZbfIsvac.png\", \"storage/front-end/dnqypvqByTZ9YiyVM1hIyk768FevOOO1GWnXjJzB.png\"], \"_method\": \"PUT\", \"feature\": \"mmmmm facere aperiam consectetur adipisicing elit\", \"serviceName\": [\"Cosmetic Dentistry\", \"Pediatric Dentistry\", \"Dental Implants\", \"Preventive Dentistry\", \"Periodontal Therapy\", \"Teeth Whitening\"], \"serviceText\": \"Lorem illum facere aperiam consectetur adipisicing elit\", \"serviceDescription\": [\"Maecenas sodales eu velit in varius. vitae sem vitae urna tempus commodo.\", \"Maecenas sodales eu velit in varius. vitae sem vitae urna tempus commodo.\", \"Maecenas sodales eu velit in varius. vitae sem vitae urna tempus commodo.\", \"Maecenas sodales eu velit in varius. vitae sem vitae urna tempus commodo.\", \"Maecenas sodales eu velit in varius. vitae sem vitae urna tempus commodo.\", \"Maecenas sodales eu velit in varius. vitae sem vitae urna tempus commodo.\"]}', '1', '2022-01-04 07:24:46', '2022-01-05 06:20:23'),
(4, 'contact', '{\"_token\": \"qvooAwV2jsm4WUW5MPPlWlVW8sgUZuoqcwSRXQ0X\", \"_method\": \"PUT\", \"contactMail\": \"mail@example.com\", \"contactPhone\": \"+44 7834 857829\", \"contactAddress\": \"4885 Pretty View Lane, New York, USA\", \"contactGoogleMap\": \"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.1841333896177!2d-73.98773128504497!3d40.75797467932691!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25855c6480299%3A0x55194ec5a1ae072e!2sTimes%20Square!5e0!3m2!1sen!2sin!4v1641384795502!5m2!1sen!2sin\"}', '1', '2022-01-04 07:24:46', '2022-01-05 06:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_departments`
--

CREATE TABLE `hospital_departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hospital_departments`
--

INSERT INTO `hospital_departments` (`id`, `company_id`, `name`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Outpatient department (OPD)', '<p><span style=\"color: rgb(32, 33, 34);\">An&nbsp;</span>outpatient department&nbsp;or&nbsp;outpatient clinic&nbsp;is the part of a hospital&nbsp;designed for the treatment of outpatients, people with health problems who visit the hospital for diagnosis or treatment, but do not at this time require a bed or to be admitted for overnight care. Modern outpatient departments offer a wide range of treatment services, diagnostic tests and minor surgical procedures.</p>', '1', '2021-12-02 05:47:52', '2021-12-02 05:47:52', NULL),
(2, 1, 'Inpatient Service (IP)', '<p><span style=\"color: rgb(33, 37, 41);\">Inpatient care requires overnight hospitalization. Patients must stay at the medical facility where their procedure was done (which is usually a hospital) for at least one night. During this time, they remain under the supervision of a nurse or doctor.</span></p>', '1', '2021-12-02 05:50:55', '2021-12-02 05:50:55', NULL),
(3, 1, 'Medical Department', '<p><span style=\"color: rgb(32, 33, 36);\">Medical Department. The medical department has within it the various clinical services. They are:&nbsp;medicine, surgery, gynaecology, obstetrics, paediatrics, eye, ENT, dental, orthopaedics, neurology, cardiology, psychiatry, skin, V.D., plastic surgery, nuclear medicine, infectious disease etc.</span></p>', '1', '2021-12-02 06:24:29', '2021-12-02 06:24:29', NULL),
(4, 1, 'Nursing Department', '<p><span style=\"color: rgb(0, 0, 0);\">Medical-surgical nursing is one of the most common types of nursing. Not so long ago, all nursing grads started out as a medical-surgical nurse. However, today the nursing specialty path is not so straight forward. A medical-surgical nurse typically manages a patient load of five to seven patients throughout their shift.</span></p>', '1', '2021-12-02 06:27:47', '2021-12-02 06:27:47', NULL),
(5, 1, 'Paramedical Department', '<p><span style=\"color: rgb(32, 33, 34);\">A&nbsp;paramedic&nbsp;is a health care professional whose primary role is to provide advanced&nbsp;</span>emergency medical care<span style=\"color: rgb(32, 33, 34);\">&nbsp;for critical and emergent patients who access the emergency medical system.</span></p>', '1', '2021-12-02 06:29:24', '2021-12-02 06:29:24', NULL),
(6, 1, 'Operation Theatre Complex (OT)', '<p><span style=\"color: rgb(51, 51, 51);\">An operation theatre complex is the \"heart\" of any major surgical hospital. An operating theatre, operating room, surgery suite or a surgery centre is a room within a hospital within which surgical and other operations are carried out. Operating theatres were so-called in the United Kingdom because they traditionally consisted of semi-cir-cular amphitheatres to allow students to observe the medi-cal procedures</span></p>', '1', '2021-12-02 06:31:17', '2021-12-02 06:31:17', NULL),
(7, 1, 'Pharmacy Department', '<p><span style=\"color: rgb(5, 5, 5);\">The Department of Pharmacy at Southeast University was established in May, 2002. The aim of the introduction of Pharmacy program in Southeast University is to prepare students to be the most competent, responsible and caring Pharmacist/Pharmaceutical Scientist. The curriculum is designed to produce skilled and efficient professionals to manage pharmaceutical industries, hospital pharmacy, community pharmacy service and other government bodies related to health service and to be very competitive with other national and international universities.</span></p>', '1', '2021-12-02 06:32:25', '2021-12-02 06:32:25', NULL),
(8, 1, 'Radiology Department (X-ray)', '<p><span style=\"color: rgb(0, 0, 0);\">Although better known as the ‘X-ray Department’, we do a lot more than just take X-rays! We offer almost all of the latest types of medical imaging techniques to support Doctors, Nurses and other Healthcare Professional to diagnose and work with you to treat you in the best possible way. We are located on the ground floor of the main hospital building.</span></p>', '1', '2021-12-02 06:33:54', '2021-12-02 06:33:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `insurances`
--

CREATE TABLE `insurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `service_tax` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `description` text DEFAULT NULL,
  `insurance_no` varchar(255) DEFAULT NULL,
  `insurance_code` varchar(255) DEFAULT NULL,
  `disease_charge` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`disease_charge`)),
  `hospital_rate` double DEFAULT 0,
  `insurance_rate` double DEFAULT 0,
  `total` double DEFAULT 0,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `insurance_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `total` double NOT NULL DEFAULT 0,
  `vat_percentage` double NOT NULL DEFAULT 0,
  `total_vat` double NOT NULL DEFAULT 0,
  `discount_percentage` double NOT NULL DEFAULT 0,
  `total_discount` double NOT NULL DEFAULT 0,
  `grand_total` double NOT NULL DEFAULT 0,
  `paid` double NOT NULL DEFAULT 0,
  `due` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `account_type` enum('Debit','Credit') NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_reports`
--

CREATE TABLE `lab_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lab_report_template_id` bigint(20) UNSIGNED DEFAULT NULL,
  `report` text NOT NULL,
  `photo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`photo`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_report_templates`
--

CREATE TABLE `lab_report_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_09_05_085144_create_application_settings_table', 1),
(4, '2019_09_30_063819_create_smtp_configurations_table', 1),
(5, '2020_02_05_062638_create_permission_tables', 1),
(6, '2020_02_12_092736_create_companies_table', 1),
(7, '2020_02_12_092955_create_settings_table', 1),
(8, '2020_02_12_093220_create_currencies_table', 1),
(9, '2020_02_12_093436_create_taxes_table', 1),
(10, '2020_02_13_060212_create_user_companies_table', 1),
(11, '2021_10_05_114751_create_doctor_details_table', 1),
(12, '2021_10_05_114802_create_hospital_departments_table', 1),
(13, '2021_10_05_120426_create_patient_case_studies_table', 1),
(14, '2021_10_14_124949_create_doctor_schedules_table', 1),
(15, '2021_10_17_084944_create_patient_appointments_table', 1),
(16, '2021_10_18_112558_create_lab_reports_table', 1),
(17, '2021_10_18_112856_create_lab_report_templates_table', 1),
(18, '2021_10_25_070421_create_prescriptions_table', 1),
(19, '2021_10_26_092119_create_insurances_table', 1),
(20, '2021_10_31_064744_create_account_headers_table', 1),
(21, '2021_10_31_122553_create_sms_apis_table', 1),
(22, '2021_11_01_065738_create_payments_table', 1),
(23, '2021_11_01_143907_create_sms_templates_table', 1),
(24, '2021_11_02_144014_create_invoices_table', 1),
(25, '2021_11_03_055549_create_invoice_items_table', 1),
(26, '2021_11_07_101030_create_sms_campaigns_table', 1),
(27, '2021_11_14_090009_create_job_batches_table', 1),
(28, '2021_11_14_090406_create_jobs_table', 1),
(29, '2021_11_14_130648_create_failed_jobs_table', 1),
(30, '2021_11_15_105421_create_sms_campaign_logs_table', 1),
(31, '2021_11_20_060744_create_email_templates_table', 1),
(32, '2021_11_20_062213_create_email_campaigns_table', 1),
(33, '2021_11_27_063831_create_email_campaign_logs_table', 1),
(34, '2022_01_03_120906_create_front_ends_table', 1),
(35, '2022_01_05_121719_create_contact_us_table', 1),
(36, '2022_08_31_160521_add_file_to_patient_case_studies', 1),
(37, '2023_04_10_094814_add_company_id_to_patient_appointments_table', 1),
(38, '2023_04_10_112126_create_updates_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16),
(2, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 18),
(2, 'App\\Models\\User', 19),
(4, 'App\\Models\\User', 20);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_appointments`
--

CREATE TABLE `patient_appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `sequence` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `appointment_date` date NOT NULL,
  `problem` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_appointments`
--

INSERT INTO `patient_appointments` (`id`, `user_id`, `doctor_id`, `sequence`, `start_time`, `end_time`, `appointment_date`, `problem`, `created_at`, `updated_at`, `company_id`) VALUES
(1, 1, 1, 5, '02:00:00', '02:30:00', '2021-12-10', 'Matha Betha', '2021-12-06 02:46:46', '2021-12-06 02:46:46', 1),
(2, 1, 1, 17, '08:00:00', '08:30:00', '2021-12-11', 'Jor Jor Vab', '2021-12-06 02:47:37', '2021-12-06 02:47:37', 1),
(3, 1, 1, 13, '06:00:00', '06:30:00', '2021-12-14', 'BP Problem', '2021-12-06 02:48:39', '2021-12-06 02:48:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient_case_studies`
--

CREATE TABLE `patient_case_studies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `food_allergy` varchar(255) DEFAULT NULL,
  `heart_disease` varchar(255) DEFAULT NULL,
  `high_blood_pressure` varchar(255) DEFAULT NULL,
  `diabetic` varchar(255) DEFAULT NULL,
  `surgery` varchar(255) DEFAULT NULL,
  `accident` varchar(255) DEFAULT NULL,
  `others` varchar(255) DEFAULT NULL,
  `family_medical_history` varchar(255) DEFAULT NULL,
  `current_medication` varchar(255) DEFAULT NULL,
  `pregnancy` varchar(255) DEFAULT NULL,
  `breastfeeding` varchar(255) DEFAULT NULL,
  `health_insurance` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_type` enum('Credit','Debit') NOT NULL,
  `payment_date` date NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-read', 'Role', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(2, 'role-create', 'Role', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(3, 'role-update', 'Role', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(4, 'role-delete', 'Role', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(5, 'user-read', 'User', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(6, 'user-create', 'User', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(7, 'user-update', 'User', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(8, 'user-delete', 'User', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(9, 'smtp-read', 'SMTP', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(10, 'smtp-create', 'SMTP', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(11, 'smtp-update', 'SMTP', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(12, 'smtp-delete', 'SMTP', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(13, 'company-read', 'Company', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(14, 'company-create', 'Company', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(15, 'company-update', 'Company', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(16, 'company-delete', 'Company', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(17, 'currencies-read', 'Currencies', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(18, 'currencies-create', 'Currencies', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(19, 'currencies-update', 'Currencies', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(20, 'currencies-delete', 'Currencies', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(21, 'tax-rate-read', 'Tax Rate', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(22, 'tax-rate-create', 'Tax Rate', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(23, 'tax-rate-update', 'Tax Rate', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(24, 'tax-rate-delete', 'Tax Rate', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(25, 'profile-read', 'Profile', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(26, 'profile-update', 'Profile', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(27, 'hospital-department-read', 'Hospital Department', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(28, 'hospital-department-create', 'Hospital Department', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(29, 'hospital-department-update', 'Hospital Department', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(30, 'hospital-department-delete', 'Hospital Department', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(31, 'doctor-detail-read', 'Doctor Detail', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(32, 'doctor-detail-create', 'Doctor Detail', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(33, 'doctor-detail-update', 'Doctor Detail', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(34, 'doctor-detail-delete', 'Doctor Detail', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(35, 'patient-detail-read', 'Patient Detail', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(36, 'patient-detail-create', 'Patient Detail', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(37, 'patient-detail-update', 'Patient Detail', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(38, 'patient-detail-delete', 'Patient Detail', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(39, 'patient-case-studies-read', 'Patient Case Studies', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(40, 'patient-case-studies-create', 'Patient Case Studies', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(41, 'patient-case-studies-update', 'Patient Case Studies', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(42, 'patient-case-studies-delete', 'Patient Case Studies', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(43, 'insurance-read', 'Insurance', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(44, 'insurance-create', 'Insurance', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(45, 'insurance-update', 'Insurance', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(46, 'insurance-delete', 'Insurance', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(47, 'lab-report-read', 'Lab Report', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(48, 'lab-report-create', 'Lab Report', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(49, 'lab-report-update', 'Lab Report', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(50, 'lab-report-delete', 'Lab Report', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(51, 'lab-report-template-read', 'Lab Report Template', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(52, 'lab-report-template-create', 'Lab Report Template', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(53, 'lab-report-template-update', 'Lab Report Template', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(54, 'lab-report-template-delete', 'Lab Report Template', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(55, 'sms-template-read', 'SMS Template', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(56, 'sms-template-create', 'SMS Template', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(57, 'sms-template-update', 'SMS Template', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(58, 'sms-template-delete', 'SMS Template', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(59, 'email-template-read', 'Email Template', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(60, 'email-template-create', 'Email Template', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(61, 'email-template-update', 'Email Template', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(62, 'email-template-delete', 'Email Template', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(63, 'email-campaign-read', 'Email Campaign', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(64, 'email-campaign-create', 'Email Campaign', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(65, 'email-campaign-update', 'Email Campaign', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(66, 'email-campaign-delete', 'Email Campaign', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(67, 'doctor-schedule-read', 'Doctor Schedule', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(68, 'doctor-schedule-create', 'Doctor Schedule', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(69, 'doctor-schedule-update', 'Doctor Schedule', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(70, 'doctor-schedule-delete', 'Doctor Schedule', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(71, 'patient-appointment-read', 'Patient Appointment', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(72, 'patient-appointment-create', 'Patient Appointment', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(73, 'patient-appointment-update', 'Patient Appointment', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(74, 'patient-appointment-delete', 'Patient Appointment', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(75, 'prescription-read', 'Prescription', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(76, 'prescription-create', 'Prescription', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(77, 'prescription-update', 'Prescription', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(78, 'prescription-delete', 'Prescription', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(79, 'sms-api-read', 'SMS Api', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(80, 'sms-api-update', 'SMS Api', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(81, 'sms-campaign-read', 'SMS Campaign', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(82, 'sms-campaign-create', 'SMS Campaign', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(83, 'sms-campaign-update', 'SMS Campaign', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(84, 'sms-campaign-delete', 'SMS Campaign', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(85, 'account-header-read', 'Account Header', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(86, 'account-header-create', 'Account Header', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(87, 'account-header-update', 'Account Header', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(88, 'account-header-delete', 'Account Header', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(89, 'invoice-read', 'Invoice', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(90, 'invoice-create', 'Invoice', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(91, 'invoice-update', 'Invoice', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(92, 'invoice-delete', 'Invoice', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(93, 'payment-read', 'Payment', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(94, 'payment-create', 'Payment', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(95, 'payment-update', 'Payment', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(96, 'payment-delete', 'Payment', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(97, 'financial-report-read', 'Financial Report', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(98, 'front-end-read', 'Front End', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(99, 'front-end-create', 'Front End', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(100, 'front-end-update', 'Front End', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(101, 'front-end-delete', 'Front End', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(102, 'contact-us-read', 'Contact Us', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(103, 'contact-us-delete', 'Contact Us', 'web', '2024-09-03 03:22:46', '2024-09-03 03:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `weight` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `chief_complaint` text DEFAULT NULL,
  `medicine_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`medicine_info`)),
  `diagnosis_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`diagnosis_info`)),
  `note` text DEFAULT NULL,
  `prescription_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `validity` varchar(255) DEFAULT NULL,
  `is_default` enum('0','1') NOT NULL DEFAULT '0',
  `role_for` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `price`, `validity`, `is_default`, `role_for`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', NULL, NULL, '1', '0', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(2, 'Doctor', 'web', NULL, NULL, '1', '1', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(3, 'Patient', 'web', NULL, NULL, '1', '1', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(4, 'Accountant', 'web', NULL, NULL, '1', '1', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(5, 'Laboratorist', 'web', NULL, NULL, '1', '1', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(6, 'Receptionist', 'web', NULL, NULL, '1', '1', '2024-09-03 03:22:46', '2024-09-03 03:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(31, 3),
(31, 5),
(31, 6),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(35, 3),
(35, 5),
(35, 6),
(36, 1),
(36, 6),
(37, 1),
(37, 6),
(38, 1),
(38, 6),
(39, 1),
(39, 2),
(39, 3),
(39, 5),
(39, 6),
(40, 1),
(40, 2),
(40, 6),
(41, 1),
(41, 2),
(41, 6),
(42, 1),
(42, 2),
(42, 6),
(43, 1),
(43, 3),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(47, 2),
(47, 3),
(47, 5),
(47, 6),
(48, 1),
(48, 5),
(49, 1),
(49, 5),
(50, 1),
(50, 5),
(51, 1),
(51, 5),
(52, 1),
(52, 5),
(53, 1),
(53, 5),
(54, 1),
(54, 5),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(67, 2),
(67, 3),
(67, 6),
(68, 1),
(68, 6),
(69, 1),
(69, 6),
(70, 1),
(70, 6),
(71, 1),
(71, 2),
(71, 3),
(71, 6),
(72, 1),
(72, 6),
(73, 1),
(73, 6),
(74, 1),
(74, 6),
(75, 1),
(75, 2),
(75, 3),
(75, 6),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(85, 4),
(86, 1),
(86, 4),
(87, 1),
(87, 4),
(88, 1),
(88, 4),
(89, 1),
(89, 3),
(89, 4),
(90, 1),
(90, 4),
(91, 1),
(91, 4),
(92, 1),
(92, 4),
(93, 1),
(93, 4),
(94, 1),
(94, 4),
(95, 1),
(95, 4),
(96, 1),
(96, 4),
(97, 1),
(97, 4),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `company_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'general.company_name', 'ambitiousit', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(2, 1, 'general.company_email', 'bd.ambitiousit@gmail.com', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(3, 1, 'general.default_locale', 'en-GB', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(4, 1, 'general.financial_start', '03-09', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(5, 1, 'general.timezone', 'Europe/London', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(6, 1, 'general.date_format', 'd M Y', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(7, 1, 'general.date_separator', 'space', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(8, 1, 'general.percent_position', 'after', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(9, 1, 'general.default_payment_method', 'offlinepayment.cash.1', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(10, 1, 'general.email_protocol', 'mail', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(11, 1, 'general.email_sendmail_path', '/usr/sbin/sendmail -bs', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(12, 1, 'general.send_item_reminder', '0', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(13, 1, 'general.schedule_time', '09:00', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(14, 1, 'general.admin_theme', 'skin-green-light', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(15, 1, 'general.list_limit', '25', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(16, 1, 'general.use_gravatar', '0', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(17, 1, 'general.session_handler', 'file', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(18, 1, 'general.session_lifetime', '30', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(19, 1, 'general.file_size', '2', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(20, 1, 'general.file_types', 'pdf,jpeg,jpg,png', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(21, 1, 'general.wizard', '0', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(22, 1, 'general.company_address', 'Natore, Bangladesh<br>', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(23, 1, 'general.company_logo', '', '2024-09-03 03:22:46', '2024-09-03 03:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `sms_apis`
--

CREATE TABLE `sms_apis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `gateway` enum('twilio','nexmo','plivo','clickatell') NOT NULL,
  `auth_id` varchar(255) DEFAULT NULL,
  `auth_token` varchar(255) DEFAULT NULL,
  `api_id` varchar(255) DEFAULT NULL,
  `sender_number` varchar(255) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_apis`
--

INSERT INTO `sms_apis` (`id`, `company_id`, `gateway`, `auth_id`, `auth_token`, `api_id`, `sender_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'twilio', '', '', '', '', '0', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(2, 1, 'nexmo', '', '', '', '', '0', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(3, 1, 'plivo', '', '', '', '', '0', '2024-09-03 03:22:45', '2024-09-03 03:22:45'),
(4, 1, 'clickatell', '', '', '', '', '0', '2024-09-03 03:22:45', '2024-09-03 03:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `sms_campaigns`
--

CREATE TABLE `sms_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `sms_template_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text NOT NULL,
  `schedule_time` datetime NOT NULL,
  `contact_type` varchar(255) NOT NULL,
  `status` enum('Pending','Processing','Completed','Failed') NOT NULL DEFAULT 'Pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_campaign_logs`
--

CREATE TABLE `sms_campaign_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sms_campaign_id` bigint(20) UNSIGNED NOT NULL,
  `sms_api_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_id` varchar(255) DEFAULT NULL,
  `status` enum('0','1') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smtp_configurations`
--

CREATE TABLE `smtp_configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `sender_email` varchar(255) NOT NULL,
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` varchar(255) NOT NULL,
  `smtp_user` varchar(255) NOT NULL,
  `smtp_type` enum('default','tls','ssl') NOT NULL DEFAULT 'default',
  `smtp_password` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` double(15,4) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `launched` varchar(255) NOT NULL,
  `old_version` varchar(255) DEFAULT NULL,
  `new_version` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `name`, `launched`, `old_version`, `new_version`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'V 1.0', '1 February 2022', 'Not Available', 'V 1.0', 'Initial Release', '1', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(2, 'V 1.1', '24 February 2022', 'V 1.0', 'V 1.1', 'RTL Support, Arabic Support, Front-end Language Support', '1', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(3, 'V 1.2', '1 September 2022', 'V 1.1', 'V 1.2', 'Add file or image file on patient case study, Role Change for doctor, Invoice select problem solved', '1', '2024-09-03 03:22:46', '2024-09-03 03:22:46'),
(4, 'V 2.0', '1 April 2023', 'V 1.2', 'V 2.0', 'Install problem solved, image & file upload issue solved, Add Role Base Permission, Add Calender Appointment view for Doctor & Patient', '1', '2024-09-03 03:22:46', '2024-09-03 03:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `blood_group` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `address`, `photo`, `locale`, `date_of_birth`, `gender`, `blood_group`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'admin', 'admin@gmail.com', NULL, '$2y$10$UUCsvd39iKGfVmvioHlBm.VUgBa/CoaFyGe1pK.DuS9xVyJVB4Gsa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'G3CjAxbd99im17jHwrBmcgCV1ccGa2ZA0hD8Kv4dRo6Q3GfNz9fGNUQYnFvn', '2024-09-03 03:22:46', '2024-09-03 03:22:46', NULL),
(7, 1, 'Dr. Abdu', 'dr.abdu@gmail.com', NULL, '$2y$10$Co3AM93V.ovtn7wVK8yorecZ6skNEs3sWL4nTmbGOLLxNVH18q5A6', '(833) 286-7393', NULL, 'storage/user-images/TV3dVzPIvKR5xssGl1vmdEMPUmMkaOCjlXK7PG2y.png', NULL, '1965-01-04', 'male', 'A+', '1', NULL, '2021-12-06 01:25:04', '2021-12-06 02:22:13', NULL),
(8, 1, 'Dr. Myles', 'dr.myles@gmail.com', NULL, '$2y$10$QQDiuMl9e9Cvw4sgJIXtT.hSV0/zLCVeBOWZ/8N44dBoM4xQgPoIm', '07700 900461', NULL, 'storage/user-images/g771C5GiQAiYvgq29aYZp8cyLoZCJCHNI1nehhAq.png', NULL, '1960-02-04', 'male', 'A-', '1', NULL, '2021-12-06 01:29:05', '2021-12-06 02:22:56', NULL),
(9, 1, 'Dr. Fouad', 'dr.fouad@gmail.com', NULL, '$2y$10$IWSg7hlSHRtGnX4wO4iPBOpK33oGVxmgGdrh64eSYIZBidtYB1zC2', '818-836-8040', NULL, 'storage/user-images/45wO54FnhiHBfErLkHXUS67tBiAyHS1gsT1hrkrP.jpg', NULL, '1975-03-01', 'male', 'B+', '1', NULL, '2021-12-06 01:33:10', '2021-12-06 02:23:26', NULL),
(10, 1, 'Dr. Khalid Abbed', 'dr.khalid@gmail.com', NULL, '$2y$10$g2Y68SHtQZ8XixudB8aNCuk1wCTz6VHcciC8Xw10jzX8pmNZghxh6', '678-999-8212', NULL, 'storage/user-images/Bdlj0yEukn6wj0ArxyHL2JkcnHzAkgjEbHh2zPfK.png', NULL, '1970-12-23', 'male', 'B-', '1', NULL, '2021-12-06 01:41:28', '2021-12-06 01:41:57', NULL),
(11, 1, 'Dr. Naresh', 'dr.naresh@gmail.com', NULL, '$2y$10$qfBU.uGXm2UsjnjMK33FregDZzrIUt3Dcc5oi4PMXgEtz6.8pUvZm', '800-273-8255', NULL, 'storage/user-images/yckyfTc4ClFCU6irIfJzmk0CX5CU7g8CECbWp9ZJ.jpg', NULL, '1980-05-20', 'male', 'O+', '1', NULL, '2021-12-06 01:44:19', '2021-12-06 01:44:19', NULL),
(12, 1, 'Dr. Arthur Reese Abright', 'dr.arthur@gmail.com', NULL, '$2y$10$UOF9CccK46mYPzGi4O487.sXbp6maCZhLEeDskvNzvazwYxI2SBNK', '(214) 748-3647', NULL, 'storage/user-images/YnQNoCt9olEr1Zu2G8hjRHbNBGvlaeB7sFHuHVlU.png', NULL, '1882-06-10', 'female', 'AB+', '1', NULL, '2021-12-06 01:47:19', '2021-12-06 02:24:00', NULL),
(13, 1, 'Dr. Corrie', 'dr.corrie@gmail.com', NULL, '$2y$10$WhLgoSMiomFwLn2FnsZgvODAdyki24hX/5FDvyOWcWPIW40DqM0Fu', '(281) 330-8004', NULL, 'storage/user-images/4VcJeF2xXsx7Pwn7swxxu9YurhIkluASjYVr1eW8.jpg', NULL, '1975-07-10', 'male', 'AB-', '1', NULL, '2021-12-06 01:58:36', '2021-12-06 01:58:36', NULL),
(14, 1, 'Dr. Mark', 'dr.mark@gmail.com', NULL, '$2y$10$ogrmSeUhW619bXKRyX6cN.FWw4M7DoqbN7Msm55krRrrUHcR2vOem', '678-999-8212', NULL, 'storage/user-images/tx3AOLGot8YXJBGA3XOqQTsJyKynDK76WaQnNp7g.jpg', NULL, '1980-12-10', 'male', 'B+', '1', NULL, '2021-12-06 02:01:31', '2021-12-06 02:01:31', NULL),
(15, 1, 'Dr. Sudhansu', 'dr.sudhansu@gmail.com', NULL, '$2y$10$KloLUDP/YzRzb7kCxz3ZmOmvQRzZgRJxkUZqHsPOO7GSE4KNwr.xW', '800-273-8255', NULL, 'storage/user-images/jdDeTO8YUH5dYedJUvBGq1FencQkROkBogfPPx40.jpg', NULL, '1988-07-07', 'male', 'B+', '1', NULL, '2021-12-06 02:04:00', '2021-12-06 02:05:01', NULL),
(16, 1, 'Dr.Mona', 'dr.mona@gmail.com', NULL, '$2y$10$5za8txiorLMBIUScRtUakOmpK1iz9eU8pj4fxIzUIGBKJmNy91m.m', NULL, NULL, 'storage/user-images/VNmzH6TLFcJ4BLtqBS5Tgrrdw4eK8iHCZMrP1OLn.jpg', NULL, '1990-10-04', 'female', 'A+', '1', NULL, '2021-12-06 02:07:06', '2021-12-06 02:08:14', NULL),
(17, 1, 'Dr. Abaza', 'dr.abaza@gmail.com', NULL, '$2y$10$Xf4SwAQK0Echo3CCvqBvYuL295roEyKCyY4evmzMSdqXuvNkiswli', '(214) 748-3647', NULL, 'storage/user-images/RFGG7qqwOtallJG5XMlNcWOWBFKi54PJoY9HklQY.jpg', NULL, '1986-09-19', NULL, NULL, '1', NULL, '2021-12-06 02:10:13', '2021-12-06 02:27:07', NULL),
(18, 1, 'Dr. Abu Saleh Mohiuddin', 'dr.abusaleh@gmail.com', NULL, '$2y$10$bIDPjQX.E8AGvy2F9PNct.HxnKq/jYvVJRO3vUNOAIQweNJkRTWiS', '+880-2-9350383', NULL, 'storage/user-images/eiHSiFGac7FmaxzC7NG5MJG1gcJJ2NDULgHJ0IGv.jpg', NULL, '1977-10-10', 'male', 'B+', '1', NULL, '2021-12-06 02:13:45', '2021-12-06 02:26:37', NULL),
(19, 1, 'Dr. Enamul Haque Chowdhury', 'dr.enamul@gmail.com', NULL, '$2y$10$GO6D4C2W2ba7afcbZ2KhjeiXBXMdTcVREvQGJwu3yEICNFk25FrFW', '880-2-9122689', NULL, 'storage/user-images/rR1p2J2WroxnwTHA5kKEWUHgPsHUYOlrHjtoXra5.png', NULL, '1984-08-09', 'male', 'B+', '1', NULL, '2021-12-06 02:17:13', '2024-09-03 06:12:44', NULL),
(20, 1, 'Ravi kumar', 'rav@gmail.comd', NULL, '12345678', '98754693254', 'lsfjslfsfos', NULL, NULL, '2024-09-10', 'male', 'A+', '1', NULL, '2024-09-03 04:34:17', '2024-09-03 06:08:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_companies`
--

CREATE TABLE `user_companies` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_companies`
--

INSERT INTO `user_companies` (`user_id`, `company_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\User'),
(7, 1, 'App\\Models\\User'),
(8, 1, 'App\\Models\\User'),
(9, 1, 'App\\Models\\User'),
(10, 1, 'App\\Models\\User'),
(11, 1, 'App\\Models\\User'),
(12, 1, 'App\\Models\\User'),
(13, 1, 'App\\Models\\User'),
(14, 1, 'App\\Models\\User'),
(15, 1, 'App\\Models\\User'),
(16, 1, 'App\\Models\\User'),
(17, 1, 'App\\Models\\User'),
(18, 1, 'App\\Models\\User'),
(19, 1, 'App\\Models\\User'),
(20, 1, 'App\\Models\\User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_headers`
--
ALTER TABLE `account_headers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `application_settings`
--
ALTER TABLE `application_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_company_id_code_unique` (`company_id`,`code`),
  ADD KEY `currencies_company_id_index` (`company_id`);

--
-- Indexes for table `doctor_details`
--
ALTER TABLE `doctor_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_campaigns`
--
ALTER TABLE `email_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_campaign_logs`
--
ALTER TABLE `email_campaign_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_templates_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `front_ends`
--
ALTER TABLE `front_ends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `front_ends_page_unique` (`page`);

--
-- Indexes for table `hospital_departments`
--
ALTER TABLE `hospital_departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hospital_departments_name_unique` (`name`);

--
-- Indexes for table `insurances`
--
ALTER TABLE `insurances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `insurances_name_unique` (`name`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_reports`
--
ALTER TABLE `lab_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_report_templates`
--
ALTER TABLE `lab_report_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lab_report_templates_name_unique` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patient_appointments`
--
ALTER TABLE `patient_appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_case_studies`
--
ALTER TABLE `patient_case_studies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_company_id_key_unique` (`company_id`,`key`),
  ADD KEY `settings_company_id_index` (`company_id`);

--
-- Indexes for table `sms_apis`
--
ALTER TABLE `sms_apis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_campaigns`
--
ALTER TABLE `sms_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_campaign_logs`
--
ALTER TABLE `sms_campaign_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sms_templates_name_unique` (`name`);

--
-- Indexes for table `smtp_configurations`
--
ALTER TABLE `smtp_configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_company_id_index` (`company_id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_companies`
--
ALTER TABLE `user_companies`
  ADD PRIMARY KEY (`user_id`,`company_id`,`user_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_headers`
--
ALTER TABLE `account_headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `application_settings`
--
ALTER TABLE `application_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doctor_details`
--
ALTER TABLE `doctor_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_campaigns`
--
ALTER TABLE `email_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_campaign_logs`
--
ALTER TABLE `email_campaign_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_ends`
--
ALTER TABLE `front_ends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hospital_departments`
--
ALTER TABLE `hospital_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `insurances`
--
ALTER TABLE `insurances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_reports`
--
ALTER TABLE `lab_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_report_templates`
--
ALTER TABLE `lab_report_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `patient_appointments`
--
ALTER TABLE `patient_appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient_case_studies`
--
ALTER TABLE `patient_case_studies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `sms_apis`
--
ALTER TABLE `sms_apis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sms_campaigns`
--
ALTER TABLE `sms_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_campaign_logs`
--
ALTER TABLE `sms_campaign_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smtp_configurations`
--
ALTER TABLE `smtp_configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
