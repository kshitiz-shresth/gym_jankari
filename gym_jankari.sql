-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2021 at 10:28 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym_jankari`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@admin.com', 'users/default.png', '$2y$10$MECknNUzhtGNqBxH06xDqeZ9ZXE360F0TDcb3e5sxYIBim77U2p3u', NULL, NULL, '2021-02-11 08:39:17', '2021-02-11 08:39:17');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `date`) VALUES
(44, 7, '2021-02-23'),
(58, 5, '2021-02-26'),
(60, 7, '2021-02-26'),
(61, 5, '2021-02-24'),
(62, 6, '2021-02-24'),
(63, 7, '2021-02-24'),
(65, 5, '2021-02-28'),
(66, 6, '2021-02-28'),
(67, 7, '2021-02-28'),
(71, 7, '2021-02-27'),
(73, 5, '2021-02-27'),
(74, 5, '2021-02-25'),
(76, 6, '2021-02-26'),
(77, 6, '2021-02-27'),
(79, 5, '2021-04-17'),
(80, 6, '2021-04-17'),
(83, 7, '2021-03-21'),
(84, 6, '2021-03-21'),
(85, 5, '2021-03-21'),
(86, 8, '2021-03-21'),
(87, 9, '2021-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-02-11 01:44:18', '2021-02-11 01:44:18'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-02-11 01:44:18', '2021-02-11 01:44:18');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'role_id', 'text', 'Role Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 4),
(60, 7, 'avatar', 'text', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 5),
(61, 7, 'password', 'password', 'Password', 0, 0, 0, 1, 1, 0, '{}', 6),
(62, 7, 'remember_token', 'text', 'Remember Token', 0, 0, 1, 1, 1, 1, '{}', 7),
(63, 7, 'settings', 'text', 'Settings', 0, 0, 1, 1, 1, 1, '{}', 8),
(64, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 9),
(65, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(66, 7, 'admin_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"admins\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(67, 7, 'admin_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"admin_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 12),
(68, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 2),
(70, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(71, 8, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 4),
(72, 8, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 5),
(73, 8, 'one_month_price', 'number', 'One Month Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":6}}', 6),
(74, 8, 'three_month_price', 'number', 'Three Month Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":6}}', 7),
(75, 8, 'six_month_price', 'number', 'Six Month Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":6}}', 8),
(76, 8, 'one_year_price', 'number', 'One Year Price', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":6}}', 9),
(77, 8, 'order', 'number', 'Order', 0, 1, 1, 1, 1, 1, '{}', 11),
(78, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(79, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 2),
(80, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(81, 9, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 6),
(82, 9, 'designation', 'text', 'Designation', 0, 1, 1, 1, 1, 1, '{}', 8),
(83, 9, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 9),
(84, 9, 'twitter', 'text', 'Twitter', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":3}}', 10),
(85, 9, 'facebook', 'text', 'Facebook', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":3}}', 11),
(86, 9, 'instagram', 'text', 'Instagram', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":3}}', 12),
(87, 9, 'linkedin', 'text', 'Linkedin', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":3}}', 13),
(88, 9, 'order', 'number', 'Order', 0, 1, 1, 1, 1, 1, '{}', 14),
(89, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(90, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 2),
(91, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(92, 10, 'day', 'select_dropdown', 'Day', 0, 1, 1, 1, 1, 1, '{\"default\":\"Sunday\",\"options\":{\"Sunday\":\"Sunday\",\"Monday\":\"Monday\",\"Tuesday\":\"Tuesday\",\"Wednesday\":\"Wednesday\",\"Thursday\":\"Thursday\",\"Friday\":\"Friday\"}}', 4),
(93, 10, 'from', 'time', 'From', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":6}}', 5),
(94, 10, 'to', 'time', 'To', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":6}}', 6),
(95, 10, 'package_id', 'text', 'Package Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(96, 10, 'schedule_belongsto_package_relationship', 'relationship', 'Package', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Package\",\"table\":\"packages\",\"type\":\"belongsTo\",\"column\":\"package_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"admin_roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(97, 10, 'schedule_belongstomany_trainer_relationship', 'relationship', 'Trainers', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Trainer\",\"table\":\"trainers\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"schedule_trainers\",\"pivot\":\"1\",\"taggable\":\"0\"}', 9),
(98, 9, 'email', 'text', 'Email', 0, 0, 1, 1, 1, 1, '{}', 4),
(99, 9, 'password', 'password', 'Password', 0, 0, 1, 1, 1, 1, '{}', 5),
(100, 9, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 7),
(101, 8, 'package_belongstomany_trainer_relationship', 'relationship', 'Trainers', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Trainer\",\"table\":\"trainers\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"package_trainers\",\"pivot\":\"1\",\"taggable\":\"0\"}', 10),
(103, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(104, 11, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(105, 11, 'date', 'text', 'Date', 0, 1, 1, 1, 1, 1, '{}', 3),
(106, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(107, 12, 'user_id', 'number', 'User', 0, 1, 1, 1, 1, 1, '{}', 2),
(108, 12, 'payment_date', 'date', 'Payment Date', 0, 1, 1, 1, 1, 1, '{}', 3),
(109, 12, 'package_id', 'number', 'Package', 0, 1, 1, 1, 1, 1, '{}', 4),
(110, 12, 'duration', 'text', 'Duration', 0, 1, 1, 1, 1, 1, '{}', 5),
(111, 12, 'expiry_date', 'date', 'Expiry Date', 0, 1, 1, 1, 1, 1, '{}', 6),
(112, 12, 'status', 'text', 'Status', 0, 0, 1, 1, 1, 1, '{}', 7);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-02-11 01:43:54', '2021-02-11 01:43:54'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-02-11 01:43:54', '2021-02-11 01:43:54'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-02-11 01:43:55', '2021-02-11 01:43:55'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-02-11 01:44:16', '2021-02-11 01:44:16'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-02-11 01:44:19', '2021-02-11 01:44:19'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-02-11 01:44:21', '2021-02-11 01:44:21'),
(7, 'admins', 'admins', 'Admin', 'Admins', 'voyager-people', 'App\\Admin', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-02-11 03:40:23', '2021-02-11 04:01:54'),
(8, 'packages', 'packages', 'Package', 'Packages', 'voyager-folder', 'App\\Package', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"title\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-02-11 04:51:30', '2021-02-24 11:45:52'),
(9, 'trainers', 'trainers', 'Trainer', 'Trainers', 'voyager-folder', 'App\\Trainer', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-02-11 05:25:07', '2021-02-13 07:24:45'),
(10, 'schedules', 'schedules', 'Schedule', 'Schedules', 'voyager-folder', 'App\\Schedule', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-02-11 05:33:48', '2021-02-24 11:47:05'),
(11, 'attendances', 'attendances', 'Attendance', 'Attendances', 'voyager-folder', 'App\\Attendance', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-02-24 12:00:28', '2021-02-24 12:00:28'),
(12, 'payments', 'payments', 'Payment', 'Payments', 'voyager-folder', 'App\\Payment', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"expiry_date\",\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-03-02 05:33:53', '2021-03-02 05:48:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-02-11 01:43:58', '2021-02-11 01:43:58');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-02-11 01:43:58', '2021-02-11 01:43:58', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 8, '2021-02-11 01:43:59', '2021-02-11 05:37:45', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 4, '2021-02-11 01:43:59', '2021-02-11 03:41:51', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-02-11 01:43:59', '2021-02-11 01:43:59', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 12, '2021-02-11 01:43:59', '2021-02-11 05:37:45', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2021-02-11 01:43:59', '2021-02-11 03:41:51', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2021-02-11 01:43:59', '2021-02-11 03:41:51', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2021-02-11 01:43:59', '2021-02-11 03:41:51', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2021-02-11 01:43:59', '2021-02-11 03:41:51', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 13, '2021-02-11 01:43:59', '2021-02-11 05:37:45', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 11, '2021-02-11 01:44:17', '2021-02-11 05:37:45', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 9, '2021-02-11 01:44:20', '2021-02-11 05:37:45', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 10, '2021-02-11 01:44:23', '2021-02-11 05:37:45', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2021-02-11 01:44:29', '2021-02-11 03:41:51', 'voyager.hooks', NULL),
(15, 1, 'Admins', '', '_self', 'voyager-people', NULL, NULL, 3, '2021-02-11 03:40:23', '2021-02-11 03:41:50', 'voyager.admins.index', NULL),
(16, 1, 'Packages', '', '_self', 'voyager-folder', NULL, NULL, 5, '2021-02-11 04:51:30', '2021-02-11 04:56:11', 'voyager.packages.index', NULL),
(17, 1, 'Trainers', '', '_self', 'voyager-folder', NULL, NULL, 6, '2021-02-11 05:25:07', '2021-02-11 05:25:19', 'voyager.trainers.index', NULL),
(18, 1, 'Schedules', '', '_self', 'voyager-folder', NULL, NULL, 7, '2021-02-11 05:33:48', '2021-02-11 05:37:45', 'voyager.schedules.index', NULL),
(19, 1, 'Attendances', '', '_self', 'voyager-folder', NULL, NULL, 14, '2021-02-24 12:00:28', '2021-02-24 12:00:28', 'voyager.attendances.index', NULL),
(20, 1, 'Payments', '', '_self', 'voyager-folder', NULL, NULL, 15, '2021-03-02 05:33:53', '2021-03-02 05:33:53', 'voyager.payments.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2021_02_11_072346_create_admins_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(29, '2021_02_11_093123_create_pivot_table_admin_roles', 3),
(30, '2021_02_11_111514_create_schedule_trainers', 4),
(35, '2021_02_11_113626_drop_column_from_admins_table', 5),
(37, '2021_02_11_142313_create_admins_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `one_month_price` double DEFAULT NULL,
  `three_month_price` double DEFAULT NULL,
  `six_month_price` double DEFAULT NULL,
  `one_year_price` double DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `created_at`, `updated_at`, `title`, `description`, `one_month_price`, `three_month_price`, `six_month_price`, `one_year_price`, `order`) VALUES
(2, '2021-02-11 05:37:26', '2021-03-01 06:23:17', 'Package 1', '<ul>\r\n<li>Sed est eiusmod ut aut sequi sint.</li>\r\n<li>Sed est eiusmod ut aut sequi sint.</li>\r\n<li>Sed est eiusmod ut aut sequi sint.</li>\r\n<li>Sed est eiusmod ut aut sequi sint.</li>\r\n<li>Sed est eiusmod ut aut sequi sint.</li>\r\n</ul>', 100, 280, 540, 1000, 1),
(3, '2021-02-11 05:37:32', '2021-02-11 11:45:37', 'Package 2', '<ul>\r\n<li>Sed est eiusmod ut aut sequi sint.</li>\r\n<li>Sed est eiusmod ut aut sequi sint.</li>\r\n<li>Sed est eiusmod ut aut sequi sint.</li>\r\n<li>Sed est eiusmod ut aut sequi sint.</li>\r\n<li>Sed est eiusmod ut aut sequi sint.</li>\r\n</ul>', 961, 856, 613, 749, 2);

-- --------------------------------------------------------

--
-- Table structure for table `package_trainers`
--

CREATE TABLE `package_trainers` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_trainers`
--

INSERT INTO `package_trainers` (`id`, `package_id`, `trainer_id`) VALUES
(1, 2, 1),
(2, 2, 3),
(3, 3, 3),
(4, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-02-11 01:44:24', '2021-02-11 01:44:24');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` mediumint(9) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `payment_date`, `package_id`, `duration`, `expiry_date`, `status`) VALUES
(1, 6, '2021-03-02', 2, 'one_month', '2021-04-01', 0),
(2, 6, '2021-03-30', 2, 'one_month', '2021-05-01', 1),
(3, 7, '2021-03-02', 2, 'six_month', '2021-08-29', 1),
(5, 8, '2021-03-02', 2, 'one_month', '2021-04-01', 0),
(6, 8, '2021-04-02', 2, 'one_month', '2021-05-01', 1),
(7, 9, '2021-03-21', 2, 'one_month', '2021-04-20', 0),
(8, 9, '2021-04-17', 2, 'one_month', '2021-05-20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-02-11 01:44:00', '2021-02-11 01:44:00'),
(2, 'browse_bread', NULL, '2021-02-11 01:44:01', '2021-02-11 01:44:01'),
(3, 'browse_database', NULL, '2021-02-11 01:44:01', '2021-02-11 01:44:01'),
(4, 'browse_media', NULL, '2021-02-11 01:44:01', '2021-02-11 01:44:01'),
(5, 'browse_compass', NULL, '2021-02-11 01:44:01', '2021-02-11 01:44:01'),
(6, 'browse_menus', 'menus', '2021-02-11 01:44:01', '2021-02-11 01:44:01'),
(7, 'read_menus', 'menus', '2021-02-11 01:44:01', '2021-02-11 01:44:01'),
(8, 'edit_menus', 'menus', '2021-02-11 01:44:01', '2021-02-11 01:44:01'),
(9, 'add_menus', 'menus', '2021-02-11 01:44:01', '2021-02-11 01:44:01'),
(10, 'delete_menus', 'menus', '2021-02-11 01:44:01', '2021-02-11 01:44:01'),
(11, 'browse_roles', 'roles', '2021-02-11 01:44:02', '2021-02-11 01:44:02'),
(12, 'read_roles', 'roles', '2021-02-11 01:44:02', '2021-02-11 01:44:02'),
(13, 'edit_roles', 'roles', '2021-02-11 01:44:02', '2021-02-11 01:44:02'),
(14, 'add_roles', 'roles', '2021-02-11 01:44:02', '2021-02-11 01:44:02'),
(15, 'delete_roles', 'roles', '2021-02-11 01:44:02', '2021-02-11 01:44:02'),
(16, 'browse_users', 'users', '2021-02-11 01:44:02', '2021-02-11 01:44:02'),
(17, 'read_users', 'users', '2021-02-11 01:44:02', '2021-02-11 01:44:02'),
(18, 'edit_users', 'users', '2021-02-11 01:44:02', '2021-02-11 01:44:02'),
(19, 'add_users', 'users', '2021-02-11 01:44:02', '2021-02-11 01:44:02'),
(20, 'delete_users', 'users', '2021-02-11 01:44:02', '2021-02-11 01:44:02'),
(21, 'browse_settings', 'settings', '2021-02-11 01:44:02', '2021-02-11 01:44:02'),
(22, 'read_settings', 'settings', '2021-02-11 01:44:02', '2021-02-11 01:44:02'),
(23, 'edit_settings', 'settings', '2021-02-11 01:44:03', '2021-02-11 01:44:03'),
(24, 'add_settings', 'settings', '2021-02-11 01:44:03', '2021-02-11 01:44:03'),
(25, 'delete_settings', 'settings', '2021-02-11 01:44:03', '2021-02-11 01:44:03'),
(26, 'browse_categories', 'categories', '2021-02-11 01:44:17', '2021-02-11 01:44:17'),
(27, 'read_categories', 'categories', '2021-02-11 01:44:17', '2021-02-11 01:44:17'),
(28, 'edit_categories', 'categories', '2021-02-11 01:44:17', '2021-02-11 01:44:17'),
(29, 'add_categories', 'categories', '2021-02-11 01:44:18', '2021-02-11 01:44:18'),
(30, 'delete_categories', 'categories', '2021-02-11 01:44:18', '2021-02-11 01:44:18'),
(31, 'browse_posts', 'posts', '2021-02-11 01:44:21', '2021-02-11 01:44:21'),
(32, 'read_posts', 'posts', '2021-02-11 01:44:21', '2021-02-11 01:44:21'),
(33, 'edit_posts', 'posts', '2021-02-11 01:44:21', '2021-02-11 01:44:21'),
(34, 'add_posts', 'posts', '2021-02-11 01:44:21', '2021-02-11 01:44:21'),
(35, 'delete_posts', 'posts', '2021-02-11 01:44:21', '2021-02-11 01:44:21'),
(36, 'browse_pages', 'pages', '2021-02-11 01:44:23', '2021-02-11 01:44:23'),
(37, 'read_pages', 'pages', '2021-02-11 01:44:23', '2021-02-11 01:44:23'),
(38, 'edit_pages', 'pages', '2021-02-11 01:44:24', '2021-02-11 01:44:24'),
(39, 'add_pages', 'pages', '2021-02-11 01:44:24', '2021-02-11 01:44:24'),
(40, 'delete_pages', 'pages', '2021-02-11 01:44:24', '2021-02-11 01:44:24'),
(41, 'browse_hooks', NULL, '2021-02-11 01:44:29', '2021-02-11 01:44:29'),
(42, 'browse_admins', 'admins', '2021-02-11 03:40:23', '2021-02-11 03:40:23'),
(43, 'read_admins', 'admins', '2021-02-11 03:40:23', '2021-02-11 03:40:23'),
(44, 'edit_admins', 'admins', '2021-02-11 03:40:23', '2021-02-11 03:40:23'),
(45, 'add_admins', 'admins', '2021-02-11 03:40:23', '2021-02-11 03:40:23'),
(46, 'delete_admins', 'admins', '2021-02-11 03:40:23', '2021-02-11 03:40:23'),
(47, 'browse_packages', 'packages', '2021-02-11 04:51:30', '2021-02-11 04:51:30'),
(48, 'read_packages', 'packages', '2021-02-11 04:51:30', '2021-02-11 04:51:30'),
(49, 'edit_packages', 'packages', '2021-02-11 04:51:30', '2021-02-11 04:51:30'),
(50, 'add_packages', 'packages', '2021-02-11 04:51:30', '2021-02-11 04:51:30'),
(51, 'delete_packages', 'packages', '2021-02-11 04:51:30', '2021-02-11 04:51:30'),
(52, 'browse_trainers', 'trainers', '2021-02-11 05:25:07', '2021-02-11 05:25:07'),
(53, 'read_trainers', 'trainers', '2021-02-11 05:25:07', '2021-02-11 05:25:07'),
(54, 'edit_trainers', 'trainers', '2021-02-11 05:25:07', '2021-02-11 05:25:07'),
(55, 'add_trainers', 'trainers', '2021-02-11 05:25:07', '2021-02-11 05:25:07'),
(56, 'delete_trainers', 'trainers', '2021-02-11 05:25:07', '2021-02-11 05:25:07'),
(57, 'browse_schedules', 'schedules', '2021-02-11 05:33:48', '2021-02-11 05:33:48'),
(58, 'read_schedules', 'schedules', '2021-02-11 05:33:48', '2021-02-11 05:33:48'),
(59, 'edit_schedules', 'schedules', '2021-02-11 05:33:48', '2021-02-11 05:33:48'),
(60, 'add_schedules', 'schedules', '2021-02-11 05:33:48', '2021-02-11 05:33:48'),
(61, 'delete_schedules', 'schedules', '2021-02-11 05:33:48', '2021-02-11 05:33:48'),
(62, 'browse_attendances', 'attendances', '2021-02-24 12:00:28', '2021-02-24 12:00:28'),
(63, 'read_attendances', 'attendances', '2021-02-24 12:00:28', '2021-02-24 12:00:28'),
(64, 'edit_attendances', 'attendances', '2021-02-24 12:00:28', '2021-02-24 12:00:28'),
(65, 'add_attendances', 'attendances', '2021-02-24 12:00:28', '2021-02-24 12:00:28'),
(66, 'delete_attendances', 'attendances', '2021-02-24 12:00:28', '2021-02-24 12:00:28'),
(67, 'browse_payments', 'payments', '2021-03-02 05:33:53', '2021-03-02 05:33:53'),
(68, 'read_payments', 'payments', '2021-03-02 05:33:53', '2021-03-02 05:33:53'),
(69, 'edit_payments', 'payments', '2021-03-02 05:33:53', '2021-03-02 05:33:53'),
(70, 'add_payments', 'payments', '2021-03-02 05:33:53', '2021-03-02 05:33:53'),
(71, 'delete_payments', 'payments', '2021-03-02 05:33:53', '2021-03-02 05:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
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
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(41, 2),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
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
(68, 1),
(69, 1),
(70, 1),
(71, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-02-11 01:44:00', '2021-02-11 01:44:00'),
(2, 'user', 'Normal User', '2021-02-11 01:44:00', '2021-02-11 01:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `created_at`, `updated_at`, `day`, `from`, `to`, `package_id`) VALUES
(1, '2021-02-11 05:39:42', '2021-02-13 06:11:05', 'Tuesday', '06:10:00', '07:10:00', 2),
(4, '2021-02-11 08:53:07', '2021-02-13 06:10:58', 'Monday', '20:22:00', '20:29:00', 2),
(5, '2021-02-11 08:53:28', '2021-02-13 06:10:52', 'Sunday', '20:23:00', '20:26:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_trainers`
--

CREATE TABLE `schedule_trainers` (
  `schedule_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedule_trainers`
--

INSERT INTO `schedule_trainers` (`schedule_id`, `trainer_id`, `id`) VALUES
(1, 2, 1),
(3, 1, 2),
(3, 3, 3),
(1, 1, 4),
(1, 3, 5),
(4, 2, 6),
(5, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Gym Jankari', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', 'nul', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Gym Jankari', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Gym Jankari', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', 'null', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trainers`
--

INSERT INTO `trainers` (`id`, `created_at`, `updated_at`, `name`, `designation`, `description`, `twitter`, `facebook`, `instagram`, `linkedin`, `order`, `email`, `password`, `image`) VALUES
(1, '2021-02-11 05:36:45', '2021-02-13 07:25:51', 'Ajeeb Rimal', 'Designation', '<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Possimus, libero.</p>', '#', '#', '#', '#', 2, 'er.ajeebrimal@gmail.com', '$2y$10$I.Rx5eNLSrSlhBhp75/7yeY0N0GlN7kpC8bOKXvWohwi.oZPLm196', 'trainers\\February2021\\iU9GmY6p4ERrxdLCby8I.jpg'),
(2, '2021-02-11 05:36:52', '2021-02-13 07:25:30', 'Kshitiz Shrestha', 'Designation', '<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Possimus, libero.</p>', '#', '#', '#', '#', 1, 'er.kshitizshrestha@gmail.com', '$2y$10$gjB6KFBNGpY4ZYXqg7ewc.McQrDeuvPuKY7mDh4bXUVRaUorfqR1.', 'trainers\\February2021\\1K87bUNzvZI4ReYYhuna.jpg'),
(3, '2021-02-11 05:45:55', '2021-02-13 07:25:59', 'Utsav Bhandari', 'Designation', '<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Possimus, libero.</p>', '#', '#', '#', '#', 3, 'utsav.bhandari@gmail.com', '$2y$10$QkX5hPnvUjbtbKBOO8PEIOl2DMzGXzLSooNaUOZB7O7xrvVRTDecm', 'trainers\\February2021\\4M6W4r4xBJBHjyvPqZMn.jpg'),
(4, '2021-02-23 04:36:54', '2021-02-23 04:36:54', 'Trainer', 'Designation', '<p>Description</p>', '#', '#', '#', '#', 1, 'trainer@email.com', '$2y$10$C9Wq1A/uhQdJxIHZm7SiEOtENojWTmjjcSoKWVt68Qy8DqvgvEmHS', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-02-11 01:44:24', '2021-02-11 01:44:24'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-02-11 01:44:24', '2021-02-11 01:44:24'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-02-11 01:44:24', '2021-02-11 01:44:24'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-02-11 01:44:25', '2021-02-11 01:44:25'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-02-11 01:44:25', '2021-02-11 01:44:25'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-02-11 01:44:25', '2021-02-11 01:44:25'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-02-11 01:44:25', '2021-02-11 01:44:25'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-02-11 01:44:25', '2021-02-11 01:44:25'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-02-11 01:44:25', '2021-02-11 01:44:25'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-02-11 01:44:25', '2021-02-11 01:44:25'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-02-11 01:44:25', '2021-02-11 01:44:25'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-02-11 01:44:26', '2021-02-11 01:44:26'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-02-11 01:44:26', '2021-02-11 01:44:26'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-02-11 01:44:26', '2021-02-11 01:44:26'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-02-11 01:44:26', '2021-02-11 01:44:26'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-02-11 01:44:26', '2021-02-11 01:44:26'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-02-11 01:44:26', '2021-02-11 01:44:26'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-02-11 01:44:26', '2021-02-11 01:44:26'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-02-11 01:44:26', '2021-02-11 01:44:26'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-02-11 01:44:26', '2021-02-11 01:44:26'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-02-11 01:44:27', '2021-02-11 01:44:27'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-02-11 01:44:27', '2021-02-11 01:44:27'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-02-11 01:44:27', '2021-02-11 01:44:27'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-02-11 01:44:27', '2021-02-11 01:44:27'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-02-11 01:44:27', '2021-02-11 01:44:27'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-02-11 01:44:27', '2021-02-11 01:44:27'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-02-11 01:44:27', '2021-02-11 01:44:27'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-02-11 01:44:27', '2021-02-11 01:44:27'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-02-11 01:44:27', '2021-02-11 01:44:27'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-02-11 01:44:27', '2021-02-11 01:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `health_condition` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `gender`, `dob`, `address`, `contact`, `emergency_contact`, `health_condition`, `package_id`) VALUES
(5, NULL, 'User 1', 'rixalo9186@combcub.com', 'users/default.png', NULL, '$2y$10$tCxiAQTDHI3nx4oZHVk2vuDTwgzDuzlAZGWhPF/ibkcObtGhJfPki', NULL, NULL, '2021-02-13 06:18:38', '2021-02-13 06:18:38', 'Male', '2021-02-08', 'Address 1', 'Contact 1', 'Emergency Contact 1', 'Health Condition 1', 2),
(6, NULL, 'Kshitiz', 'er.kshitizshrestha@gmail.com', 'users/default.png', NULL, '$2y$10$wsb7.kxu5jn1hQEYOW7mM.cq3C7faNfJp.mmZnp4CqHzwbMdm1Yvi', NULL, NULL, '2021-02-23 04:34:47', '2021-03-01 06:59:02', 'Male', '2011-02-01', 'Nagarjun / Hetauda', '988888020', '98455805900', 'Very Good', 3),
(7, NULL, 'Ajeeb Rimal', 'er.ajeebrimal@gmail.com', 'users/default.png', NULL, '$2y$10$g4VKqOZyGJEwudTv3HGyiOegPO9wjln3MTw39pGFt/KR1Ptk40XBq', NULL, NULL, '2021-02-26 10:53:30', '2021-02-26 10:53:30', 'Male', '2021-02-25', 'Kathmandu', '9845580590', '9845580590', 'Good', 3),
(8, NULL, 'Ram Prasad', 'ram@gmail.com', 'users/default.png', NULL, '$2y$10$8F/ayDBg/N0TIhODbsCf4.dUTcLFJ3Bpdpkx5zeJb1pNcUQvuLUoy', NULL, NULL, '2021-03-02 04:11:26', '2021-03-02 04:11:26', 'Male', '2004-06-08', 'Syuchatar', '123123213', '123123123', 'Good', 2),
(9, NULL, 'Aakriti Koirala', 'test@test.com', 'users/default.png', NULL, '$2y$10$GrOpNh4cSKUnsCvi10htGO9kc7ibjVeY.jp7v2qiGEHxnRV7EDh2a', NULL, NULL, '2021-03-20 19:25:40', '2021-03-20 19:25:40', 'Female', '2012-12-12', 'Maitidevi', '12346', '21546', 'very good', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_role_id_foreign` (`role_id`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_trainers`
--
ALTER TABLE `package_trainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_trainers`
--
ALTER TABLE `schedule_trainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_trainers`
--
ALTER TABLE `package_trainers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schedule_trainers`
--
ALTER TABLE `schedule_trainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
