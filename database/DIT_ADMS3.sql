-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 03, 2024 at 08:43 AM
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
-- Database: `DIT_ADMS3`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_qualifications`
--

CREATE TABLE `academic_qualifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_qualification_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `nta_level_id` bigint(20) UNSIGNED NOT NULL,
  `no_of_students` int(11) NOT NULL,
  `year_of_study` year(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `department_id`, `nta_level_id`, `no_of_students`, `year_of_study`, `created_at`, `updated_at`) VALUES
(1, 'BENG21COE -2', 1, 2, 23, '2021', '2024-02-01 09:01:03', '2024-02-01 09:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `classes_modules`
--

CREATE TABLE `classes_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `classes_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `curricula`
--

CREATE TABLE `curricula` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `curriculum_name` varchar(255) NOT NULL,
  `nta_level_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `expiry_on` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `curricula`
--

INSERT INTO `curricula` (`id`, `curriculum_name`, `nta_level_id`, `department_id`, `expiry_on`, `created_at`, `updated_at`) VALUES
(1, 'BECOE23', 3, 1, '2024-02-17', '2024-02-01 05:59:55', '2024-02-01 05:59:55'),
(2, 'BECOE21-1', 2, 1, '2024-02-23', '2024-02-01 06:01:52', '2024-02-01 06:01:52'),
(3, 'CIVIL 23', 2, 3, '2026-06-10', '2024-02-01 06:08:47', '2024-02-01 06:08:47');

-- --------------------------------------------------------

--
-- Table structure for table `curriculum_modules`
--

CREATE TABLE `curriculum_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `curriculum_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`, `created_at`, `updated_at`) VALUES
(1, 'department of computer enginering', '2024-02-01 08:56:28', '2024-02-01 05:56:28'),
(2, 'electronics and telecommunication', '2024-02-01 09:03:35', '2024-02-01 06:03:35'),
(3, 'civil engineering', '2024-02-01 09:07:57', '2024-02-01 06:07:57');

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
-- Table structure for table `lectures`
--

CREATE TABLE `lectures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lecture_name` varchar(255) NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_id` varchar(255) NOT NULL,
  `academic_qualification_id` bigint(20) UNSIGNED NOT NULL,
  `position_id` bigint(20) UNSIGNED NOT NULL,
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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_06_192524_create_departments_table', 1),
(6, '2023_12_06_192525_create_nta_levels_table', 1),
(7, '2023_12_06_192553_create_curricula_table', 1),
(8, '2023_12_06_192829_create_modules_table', 1),
(9, '2023_12_06_192839_create_curriculum_modules_table', 1),
(10, '2023_12_06_192843_create_classes_table', 1),
(11, '2023_12_06_195030_create_classes_modules_table', 1),
(12, '2023_12_06_201945_create_academic_qualifications_table', 1),
(13, '2023_12_06_202010_create_positions_table', 1),
(14, '2023_12_06_202011_create_lectures_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `credit` int(11) NOT NULL,
  `CA` int(11) NOT NULL,
  `SE` int(11) NOT NULL,
  `module_code` varchar(255) NOT NULL,
  `learning_hours` int(11) NOT NULL,
  `practical_hours` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `department_id`, `credit`, `CA`, `SE`, `module_code`, `learning_hours`, `practical_hours`, `B`, `created_at`, `updated_at`) VALUES
(1, 'fundamental of web development', 1, 9, 60, 40, 'COUE 23', 12, 33, 4, '2024-02-01 06:00:34', '2024-02-01 06:00:34'),
(2, 'cyber security', 1, 7, 60, 40, 'COU 789', 67, 67, 8, '2024-02-01 06:03:18', '2024-02-01 06:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `nta_levels`
--

CREATE TABLE `nta_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nta_level` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nta_levels`
--

INSERT INTO `nta_levels` (`id`, `nta_level`, `created_at`, `updated_at`) VALUES
(1, 6, '2024-02-01 08:57:48', '2024-02-01 08:57:48'),
(2, 7, '2024-02-01 08:57:48', '2024-02-01 08:57:48'),
(3, 8, '2024-02-01 08:57:48', '2024-02-01 08:57:48'),
(4, 9, '2024-02-01 08:57:48', '2024-02-01 08:57:48');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '86e4ae7f13b7a253c365b42c6de6b353672c2402780091ba54a55de38ef49229', '[\"*\"]', NULL, NULL, '2024-02-01 05:55:46', '2024-02-01 05:55:46'),
(2, 'App\\Models\\User', 1, 'auth_token', '5bcb813659dcc84e594f4c5b539ffd80a47bae02adf9b9807ea21b07788ac997', '[\"*\"]', NULL, NULL, '2024-02-01 05:55:58', '2024-02-01 05:55:58'),
(3, 'App\\Models\\User', 2, 'auth_token', '75ad55bfae41f1d5b36e3bfb6c5bc31b6ef9470eca984928bef6e8bc88c5f536', '[\"*\"]', NULL, NULL, '2024-02-01 06:07:20', '2024-02-01 06:07:20'),
(4, 'App\\Models\\User', 2, 'auth_token', '02be6fb335ac854b64589088bc2ac838e9025cc167d9e36c5b534ac1a89bac32', '[\"*\"]', NULL, NULL, '2024-02-01 06:07:37', '2024-02-01 06:07:37');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `position_name` varchar(255) NOT NULL,
  `position_hour` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'shad', 'a@b.c', NULL, '$2y$12$tduwd61bYDSlf4EioTCZN.tYH.NpNmHEmb0MODpfJSAy6LSUM1HqK', NULL, '2024-02-01 05:55:46', '2024-02-01 05:55:46'),
(2, 'shad', 'shadrack@gmail.com', NULL, '$2y$12$N28v0iwUBJvxFuW/tz9ycul.wvJ2JAiMn.Cc3JWrrBPKkuaALQxDO', NULL, '2024-02-01 06:07:20', '2024-02-01 06:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `users_adms`
--

CREATE TABLE `users_adms` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_qualifications`
--
ALTER TABLE `academic_qualifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_department_id_foreign` (`department_id`),
  ADD KEY `classes_nta_level_id_foreign` (`nta_level_id`);

--
-- Indexes for table `classes_modules`
--
ALTER TABLE `classes_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_modules_classes_id_foreign` (`classes_id`),
  ADD KEY `classes_modules_module_id_foreign` (`module_id`);

--
-- Indexes for table `curricula`
--
ALTER TABLE `curricula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `curricula_nta_level_id_foreign` (`nta_level_id`),
  ADD KEY `curricula_department_id_foreign` (`department_id`);

--
-- Indexes for table `curriculum_modules`
--
ALTER TABLE `curriculum_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `curriculum_modules_curriculum_id_foreign` (`curriculum_id`),
  ADD KEY `curriculum_modules_module_id_foreign` (`module_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lectures_department_id_foreign` (`department_id`),
  ADD KEY `lectures_academic_qualification_id_foreign` (`academic_qualification_id`),
  ADD KEY `lectures_position_id_foreign` (`position_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_department_id_foreign` (`department_id`);

--
-- Indexes for table `nta_levels`
--
ALTER TABLE `nta_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_adms`
--
ALTER TABLE `users_adms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_qualifications`
--
ALTER TABLE `academic_qualifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `classes_modules`
--
ALTER TABLE `classes_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `curricula`
--
ALTER TABLE `curricula`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `curriculum_modules`
--
ALTER TABLE `curriculum_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nta_levels`
--
ALTER TABLE `nta_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_adms`
--
ALTER TABLE `users_adms`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_nta_level_id_foreign` FOREIGN KEY (`nta_level_id`) REFERENCES `nta_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classes_modules`
--
ALTER TABLE `classes_modules`
  ADD CONSTRAINT `classes_modules_classes_id_foreign` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `curricula`
--
ALTER TABLE `curricula`
  ADD CONSTRAINT `curricula_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `curricula_nta_level_id_foreign` FOREIGN KEY (`nta_level_id`) REFERENCES `nta_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `curriculum_modules`
--
ALTER TABLE `curriculum_modules`
  ADD CONSTRAINT `curriculum_modules_curriculum_id_foreign` FOREIGN KEY (`curriculum_id`) REFERENCES `curricula` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `curriculum_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lectures`
--
ALTER TABLE `lectures`
  ADD CONSTRAINT `lectures_academic_qualification_id_foreign` FOREIGN KEY (`academic_qualification_id`) REFERENCES `academic_qualifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lectures_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lectures_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
