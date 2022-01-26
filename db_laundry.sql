-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2022 at 03:12 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `in_at` timestamp NULL DEFAULT NULL,
  `out_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `created_at`, `updated_at`, `shop_id`, `in_at`, `out_at`) VALUES
(17, 38, '2021-10-13 04:14:53', NULL, 1, NULL, NULL),
(18, 8, '2021-10-13 04:18:16', NULL, 1, NULL, NULL),
(19, 35, '2021-10-13 04:20:18', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `master_id` bigint(20) UNSIGNED NOT NULL,
  `slave_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `master_id`, `slave_id`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '2021-09-30 23:23:53', '2021-09-30 23:23:53'),
(16, 2, 54, NULL, NULL),
(17, 2, 57, NULL, NULL);

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
(1, NULL, 1, 'Category 1', 'category-1', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-09-27 21:24:44', '2021-09-27 21:24:44');

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
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
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
(57, 7, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'name', 'text', 'Nama Toko', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(60, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(61, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(62, 7, 'shop_belongsto_user_relationship', 'relationship', 'Pemilik Cabang', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"attendances\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(63, 1, 'user_belongstomany_package_relationship', 'relationship', 'Paket', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Package\",\"table\":\"packages\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"package_users\",\"pivot\":\"1\",\"taggable\":\"on\"}', 13),
(64, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(65, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(66, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(67, 10, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(68, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(69, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(70, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(71, 11, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(72, 11, 'package_id', 'text', 'Package Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(73, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(74, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(75, 11, 'expired_date', 'timestamp', 'Expired Date', 0, 1, 1, 1, 1, 1, '{}', 6),
(76, 11, 'package_user_belongsto_user_relationship', 'relationship', 'Customer', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"attendances\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(77, 11, 'package_user_belongsto_package_relationship', 'relationship', 'Paket', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Package\",\"table\":\"packages\",\"type\":\"belongsTo\",\"column\":\"package_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attendances\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(78, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(79, 13, 'master_id', 'text', 'Master Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(80, 13, 'slave_id', 'text', 'Slave Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(81, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(82, 13, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 5),
(83, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(84, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(85, 13, 'branch_belongsto_user_relationship', 'relationship', 'Customer', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"master_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"attendances\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(86, 13, 'branch_belongsto_user_relationship_1', 'relationship', 'Cabang', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"slave_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"attendances\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(87, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(88, 14, 'service_category_id', 'text', 'Service Category Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(89, 14, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(90, 14, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(91, 14, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 5),
(92, 14, 'process_time', 'text', 'Process Time', 0, 1, 1, 1, 1, 1, '{}', 6),
(93, 14, 'is_available', 'text', 'Is Available', 1, 1, 1, 1, 1, 1, '{}', 7),
(94, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(95, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(96, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(97, 15, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(98, 15, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(99, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(100, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(101, 14, 'shop_id', 'text', 'Shop Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(102, 14, 'service_belongsto_shop_relationship', 'relationship', 'Nama Toko', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Shop\",\"table\":\"shops\",\"type\":\"belongsTo\",\"column\":\"shop_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attendances\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(103, 14, 'service_belongsto_service_category_relationship', 'relationship', 'Kategori', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\ServiceCategory\",\"table\":\"service_categories\",\"type\":\"belongsTo\",\"column\":\"service_category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attendances\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(104, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(105, 17, 'shop_id', 'text', 'Shop Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(106, 17, 'customer_id', 'text', 'Customer Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(107, 17, 'employee_id', 'text', 'Employee Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(108, 17, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 5),
(109, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(110, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(111, 17, 'order_belongsto_shop_relationship', 'relationship', 'Nama Toko', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Shop\",\"table\":\"shops\",\"type\":\"belongsTo\",\"column\":\"shop_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attendances\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(112, 17, 'order_belongsto_user_relationship', 'relationship', 'Nama Karyawan', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"employee_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"attendances\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(113, 17, 'order_belongsto_user_relationship_1', 'relationship', 'Nama Pelanggan', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"customer_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"attendances\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10);

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
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-09-27 21:24:35', '2021-09-30 19:05:09'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(7, 'shops', 'shops', 'Toko', 'Toko', 'voyager-shop', 'App\\Models\\Shop', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-09-27 23:18:21', '2021-09-27 23:23:21'),
(10, 'packages', 'packages', 'Paket', 'Paket', 'voyager-news', 'App\\Models\\Package', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-09-30 19:10:59', '2021-09-30 19:10:59'),
(11, 'package_users', 'package-users', 'Paket User', 'Paket User', 'voyager-check', 'App\\Models\\PackageUser', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-09-30 20:09:16', '2021-09-30 20:11:36'),
(13, 'branches', 'branches', 'Cabang', 'Cabang', 'voyager-new', 'App\\Models\\Branch', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-09-30 23:22:01', '2021-09-30 23:23:33'),
(14, 'services', 'services', 'Layanan', 'Layanan', 'voyager-new', 'App\\Models\\Service', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-10-01 19:12:47', '2021-10-01 19:28:44'),
(15, 'service_categories', 'service-categories', 'Kategori Layanan', 'Kategori Layanan', 'voyager-new', 'App\\Models\\ServiceCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-10-01 19:25:49', '2021-10-01 19:25:49'),
(17, 'orders', 'orders', 'Order', 'Orders', 'voyager-basket', 'App\\Models\\Order', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-10-01 21:49:11', '2021-10-02 05:32:48');

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
(1, 'admin', '2021-09-27 21:24:35', '2021-09-27 21:24:35');

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
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-09-27 21:24:35', '2021-09-27 21:24:35', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-09-27 21:24:35', '2021-09-27 21:24:35', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-09-27 21:24:35', '2021-09-27 21:24:35', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-09-27 21:24:35', '2021-09-27 21:24:35', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-09-27 21:24:35', '2021-09-27 21:24:35', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-09-27 21:24:35', '2021-09-27 21:24:35', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-09-27 21:24:35', '2021-09-27 21:24:35', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-09-27 21:24:35', '2021-09-27 21:24:35', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-09-27 21:24:35', '2021-09-27 21:24:35', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-09-27 21:24:35', '2021-09-27 21:24:35', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2021-09-27 21:24:44', '2021-09-27 21:24:44', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2021-09-27 21:24:44', '2021-09-27 21:24:44', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2021-09-27 21:24:44', '2021-09-27 21:24:44', 'voyager.pages.index', NULL),
(14, 1, 'Toko', '', '_self', 'voyager-shop', NULL, NULL, 15, '2021-09-27 23:18:21', '2021-09-27 23:18:21', 'voyager.shops.index', NULL),
(15, 1, 'Paket', '', '_self', 'voyager-news', NULL, NULL, 16, '2021-09-30 19:10:59', '2021-09-30 19:10:59', 'voyager.packages.index', NULL),
(16, 1, 'Paket User', '', '_self', 'voyager-check', NULL, NULL, 17, '2021-09-30 20:09:16', '2021-09-30 20:09:16', 'voyager.package-users.index', NULL),
(17, 1, 'Cabang', '', '_self', 'voyager-new', NULL, NULL, 18, '2021-09-30 23:22:01', '2021-09-30 23:22:01', 'voyager.branches.index', NULL),
(18, 1, 'Layanan', '', '_self', 'voyager-new', NULL, NULL, 19, '2021-10-01 19:12:47', '2021-10-01 19:12:47', 'voyager.services.index', NULL),
(19, 1, 'Kategori Layanan', '', '_self', 'voyager-new', NULL, NULL, 20, '2021-10-01 19:25:49', '2021-10-01 19:25:49', 'voyager.service-categories.index', NULL),
(20, 1, 'Orders', '', '_self', NULL, NULL, NULL, 21, '2021-10-01 21:49:11', '2021-10-01 21:49:11', 'voyager.orders.index', NULL);

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
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(29, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(30, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(31, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(32, '2016_06_01_000004_create_oauth_clients_table', 3),
(33, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3),
(64, '2021_09_28_043516_create_attendances_table', 4),
(65, '2021_09_28_043536_create_branches_table', 4),
(66, '2021_09_28_043556_create_shops_table', 4),
(67, '2021_09_28_043614_create_packages_table', 4),
(68, '2021_09_28_043630_create_package_users_table', 4),
(69, '2021_09_28_043714_create_service_categories_table', 4),
(70, '2021_09_28_043731_create_services_table', 4),
(71, '2021_09_28_043746_create_orders_table', 4),
(72, '2021_09_28_043802_create_order_servioces_table', 4),
(73, '2021_09_28_043826_create_payments_table', 4),
(75, '2021_09_29_014358_add_expired_date_to_package_users_table', 5),
(77, '2021_10_02_021406_add_shop_id_in_services_table', 6),
(79, '2021_10_04_015055_drop_name_desc_column_from_branches_table', 7),
(80, '2021_10_04_035755_create_shop_employees_table', 8),
(81, '2021_10_04_035812_create_shop_customers_table', 8),
(84, '2021_10_04_055424_remake_order_services_table', 9),
(86, '2021_10_06_084012_add_contactnumber_and_homeaddress_in_user_table', 10),
(87, '2021_10_06_085134_change_nullable_password_user_table', 11),
(97, '2021_10_08_111624_create_order_statuses_table', 12),
(100, '2021_10_08_130207_change_status_in_orders_table', 13),
(102, '2021_10_12_114848_add_shop_id_in_attendances_table', 14),
(103, '2021_10_13_131213_add_desc_in_orders_table', 15),
(104, '2021_10_21_142745_create_package_contents_table', 16),
(105, '2021_10_22_081856_add_price_in_packages_table', 16),
(106, '2021_10_25_084809_create_package_limits_table', 16),
(108, '2021_12_16_142249_add_value_in_orders_table', 17),
(109, '2022_01_13_133600_create_service_units_table', 17),
(110, '2022_01_13_133927_add_service_unit_id_in_service_categories_table', 18),
(111, '2022_01_13_145208_add_shop_id_in_service_categories_table', 19),
(112, '2022_01_14_093506_add_in_at_out_at_in_attendances_table', 20),
(113, '2022_01_20_142630_create_service_statuses_table', 21),
(114, '2022_01_20_142845_add_service_status_id_in_order_services_table', 22),
(116, '2022_01_21_094814_add_delete_at_in_orders_table', 23);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0023aaa458d02a605a874408278b5eb1cb9b75986c7c623ad22c72911b3d7b54361912e525028c9e', 2, 2, NULL, '[]', 0, '2021-12-31 12:18:01', '2021-12-31 12:18:01', '2022-12-31 19:18:01'),
('0146b37caa664416be5e6f6f1727beba72b00830fe3af1954b9f62b26c585d400660d6928ff8c9df', 3, 2, NULL, '[]', 0, '2022-01-13 02:48:24', '2022-01-13 02:48:24', '2023-01-13 09:48:24'),
('01a91f98af1bd840505457c3b4e5c45aa8e85e4e3bb689090b565a12265f8f90a020cbc6e2b10452', 3, 2, NULL, '[]', 0, '2021-10-05 17:52:17', '2021-10-05 17:52:17', '2022-10-06 00:52:17'),
('01f2202bdb81cb50186e0060809075c9c9254f166052eabadf270bab9ac6ccf3f28626e0e356a0a5', 3, 2, NULL, '[]', 0, '2022-01-20 02:50:14', '2022-01-20 02:50:14', '2023-01-20 09:50:14'),
('020b1855aa151b96b5272e4297fe5a77743363eb005f4add64ca95a44500b5257f7aff63b638be1b', 3, 2, NULL, '[]', 0, '2022-01-13 03:45:39', '2022-01-13 03:45:39', '2023-01-13 10:45:39'),
('02c1a2a042080a01a5ba97529b83b9241bdb5872bf9a1aca5f6b67ea6e90c6ad3b1dd19d4ab3d327', 3, 2, NULL, '[]', 0, '2021-10-05 01:30:57', '2021-10-05 01:30:57', '2022-10-05 08:30:57'),
('0320fa30d51d456799bba0e5fdcaf5861a847154cf69b4dcd113d61ccc9ea1addbd5158437bf5a1f', 3, 2, NULL, '[]', 0, '2021-10-13 03:24:08', '2021-10-13 03:24:08', '2022-10-13 10:24:08'),
('0379e750cf1460b5c0f04d1cc56250b13c36fb96f216a09e51e95f9b568696ad7684a0494a969a89', 3, 2, NULL, '[]', 0, '2022-01-13 02:51:47', '2022-01-13 02:51:47', '2023-01-13 09:51:47'),
('04b7b9e938474fe156a4a35cfe559b6ace0a36c1b3c4314ca0dde337170657430731f737e478de52', 3, 2, NULL, '[]', 0, '2022-01-13 01:49:51', '2022-01-13 01:49:51', '2023-01-13 08:49:51'),
('06bc82485ef71025382f3eb35a066ff0f40376a835698a071e5c0620a70e4c1b076db4ae0d700a59', 3, 2, NULL, '[]', 0, '2022-01-13 02:59:58', '2022-01-13 02:59:58', '2023-01-13 09:59:58'),
('075b633b60dba91f37d911edc5ec8c00c72d6610be3b9be4039c9e2aaeb5e56d4472d9d3a919510e', 3, 2, NULL, '[]', 0, '2022-01-13 01:35:04', '2022-01-13 01:35:04', '2023-01-13 08:35:04'),
('078e34db948a8c33900996560ddc7809898a306c0ad075a9670878642c2a17d148497bfd1e7b7df0', 1, 2, NULL, '[]', 0, '2021-09-28 18:55:01', '2021-09-28 18:55:01', '2022-09-29 01:55:01'),
('0840618b5e32ec3df7dbd21f171a62051ad6c385812eb0e8838c1ced4227852360ff191c610d4bae', 2, 2, NULL, '[]', 0, '2021-12-17 07:44:12', '2021-12-17 07:44:12', '2022-12-17 14:44:12'),
('08c4af3240eea6a40e729d32ae149553778178daff8c8fe89371d0f9d8cf1746908f2559c6a3e4a7', 3, 2, NULL, '[]', 0, '2022-01-17 02:38:52', '2022-01-17 02:38:52', '2023-01-17 09:38:52'),
('0985fa28365c3f4419387a81ac2e31ef0a2806f1f47f5ea5bbbb428dd248f8ed4d0a0ea4e9db00a4', 3, 2, NULL, '[]', 0, '2022-01-13 04:01:20', '2022-01-13 04:01:20', '2023-01-13 11:01:20'),
('0a50ccc3c5a61b01777d55e6006c5a428b3605f92f72208aed84f93ed57cef73e7316b3bbeca5bbc', 2, 2, NULL, '[]', 0, '2021-10-04 21:23:10', '2021-10-04 21:23:10', '2022-10-05 04:23:10'),
('0abfd1ca96a0142ec3f0d27d42a7afd11ec6f512b6438b5bd730eee353ac0222b8d63fc11a06299e', 50, 2, NULL, '[]', 0, '2021-12-13 11:35:12', '2021-12-13 11:35:12', '2022-12-13 18:35:12'),
('0aced43ba7910ea3b289d7c94b461c9f54ba0c6d7018319715fb8974b23e375327941e98afadd2e4', 2, 2, NULL, '[]', 0, '2021-12-17 07:11:44', '2021-12-17 07:11:44', '2022-12-17 14:11:44'),
('0b62d988efa5834d3a63e841f42834d82c81a69e2ee70433160fa664b8e723a0baa716b3624f9493', 3, 2, NULL, '[]', 0, '2022-01-13 02:15:47', '2022-01-13 02:15:47', '2023-01-13 09:15:47'),
('0dda552a60b845dc9ab391621740de863e4f161c1f067b533d3b5fa8b4f37a355fe710a4a3bcae36', 3, 2, NULL, '[]', 0, '2022-01-13 08:20:51', '2022-01-13 08:20:51', '2023-01-13 15:20:51'),
('0e3f9265271505c9db380921de10d0b5173e2c341474e71f7c07287c824836c7a254ff47c5f71206', 3, 2, NULL, '[]', 0, '2022-01-23 02:02:09', '2022-01-23 02:02:09', '2023-01-23 09:02:09'),
('0e8e26b7c125152261de502543b179965209ede1ad58a1f07f4b94992911449811720437fff0fe05', 3, 2, NULL, '[]', 0, '2022-01-13 03:08:15', '2022-01-13 03:08:15', '2023-01-13 10:08:15'),
('0f24c6f116d0221efd64abf8a1263acfdcc8320b7f11bfc46a1c01bb6f5d6a84017d25c3aebb3395', 3, 2, NULL, '[]', 0, '2022-01-13 02:15:12', '2022-01-13 02:15:12', '2023-01-13 09:15:12'),
('101968f46f4a112e70502e6cb4327fa13fec3b3d11ff662fa2467614a8f0c708b4ba5898073eaf3f', 2, 2, NULL, '[]', 0, '2021-10-01 21:33:38', '2021-10-01 21:33:38', '2022-10-02 04:33:38'),
('102c1d9dc2de58888928122c64b54da9200cfc8fbc756da6e112a4f794dc9c66140a77e8fdf01530', 3, 2, NULL, '[]', 0, '2022-01-13 04:18:12', '2022-01-13 04:18:12', '2023-01-13 11:18:12'),
('1059b546409aa5b86487fbbbb4d1b532206c58374dbf30fe482ebe9fd5491a20fb6cbb2a7323da73', 3, 2, NULL, '[]', 0, '2022-01-13 03:04:17', '2022-01-13 03:04:17', '2023-01-13 10:04:17'),
('10f6992c767a672b8a8f476a522527057439ae1c787f7294ec9e818be24ec88b68d7a674a7eb0735', 3, 2, NULL, '[]', 0, '2021-10-05 00:26:31', '2021-10-05 00:26:31', '2022-10-05 07:26:31'),
('10ff1d0ef17a8fe74cc25717619dfe47fb59fe364e5a99941ffbf67cd5ca3f18907b2d14135cc253', 3, 2, NULL, '[]', 0, '2022-01-13 03:36:12', '2022-01-13 03:36:12', '2023-01-13 10:36:12'),
('112497d2bedc793006bc233558acb46539d8142258131e902b52cbe2dd975674bd5d6b011bd79af7', 3, 2, NULL, '[]', 0, '2022-01-13 04:00:51', '2022-01-13 04:00:51', '2023-01-13 11:00:51'),
('13690f66add44db9c0ee8af9fdc0f9f459f872ea99e96900b269231d30d05b2226f2ecd66c0be5f1', 3, 2, NULL, '[]', 0, '2022-01-18 02:25:02', '2022-01-18 02:25:02', '2023-01-18 09:25:02'),
('13e29324146feb5f16efdea4b29aaddf2c9debc1f68404ec3a75b7b64d2cf1e79a4470e2b5010ae5', 1, 2, NULL, '[]', 0, '2021-09-28 19:08:57', '2021-09-28 19:08:57', '2022-09-29 02:08:57'),
('151b405915611be0f08552e609a7ec4c094c289a7a8d284a5ab283d1e95b765f23f89375fe18550c', 3, 2, NULL, '[]', 0, '2022-01-21 06:14:23', '2022-01-21 06:14:23', '2023-01-21 13:14:23'),
('16170c7fd64a388b5f11f135ce0155e0bcbd5685d212bed335ea004d9fd599031e7abf9438961446', 1, 2, NULL, '[]', 0, '2021-09-30 18:53:09', '2021-09-30 18:53:09', '2022-10-01 01:53:09'),
('1642fca8f3013f4da77c7f2bffb5d2ebfd475726959a58c71f8b7b314e67d141719c8068d39eefa6', 2, 2, NULL, '[]', 0, '2021-10-03 19:46:46', '2021-10-03 19:46:46', '2022-10-04 02:46:46'),
('16da2fd6e0b19b8fb7741cc2795fc76812b98187de27ae5a7bff680400616ae958eaf9b6b4a754d2', 1, 2, NULL, '[]', 0, '2021-09-28 01:33:41', '2021-09-28 01:33:41', '2022-09-28 08:33:41'),
('1996935eb04bb12d969af3401f647f647e11ca507791ef6d48b05c7316471ae40620be797d2be3a7', 2, 2, NULL, '[]', 0, '2021-12-13 07:23:28', '2021-12-13 07:23:28', '2022-12-13 14:23:28'),
('1b46a024259212e0163ceb60d61b70af6cdd4c1074c3b6bc3f59d243272bd8e569f143b82f8e6874', 3, 2, NULL, '[]', 0, '2022-01-13 03:11:15', '2022-01-13 03:11:15', '2023-01-13 10:11:15'),
('1c9ce5228662a1b42e30b617427b85ec3ab8abfc6964c9fa8a4328c2f738cf4499e63d6baf780ba7', 3, 2, NULL, '[]', 0, '2022-01-13 04:06:33', '2022-01-13 04:06:33', '2023-01-13 11:06:33'),
('1d2be9f833062e2ec33bdc4e70dc298492c6885dd83e942068f4963d422061ca98026e4ce724c224', 2, 2, NULL, '[]', 0, '2021-09-30 18:53:29', '2021-09-30 18:53:29', '2022-10-01 01:53:29'),
('1d46ba991d22710e81a2c280e050d3ffa0d6ab7e66436b6217a636f92d31e1d61b282c5ea4642448', 3, 2, NULL, '[]', 0, '2022-01-13 03:58:56', '2022-01-13 03:58:56', '2023-01-13 10:58:56'),
('1e008c81cc49fc014bf79bfd2c75c7c3258facff17bb22e62b95e157292eca764d29540e84c6a55c', 3, 2, NULL, '[]', 0, '2022-01-13 03:59:05', '2022-01-13 03:59:05', '2023-01-13 10:59:05'),
('1e8e0ac60aff80d7bde8e98893bae57245e20a1129a21483640b16266e2aa4fe2f6925fcec26c475', 1, 2, NULL, '[]', 0, '2021-09-30 18:52:40', '2021-09-30 18:52:40', '2022-10-01 01:52:40'),
('1f46d49f43f2dc9bb9b090a100cb517b8f14e884087dcc6429c4d12b4cc98ad310a07bba0187a2d6', 50, 2, NULL, '[]', 0, '2021-12-13 11:31:17', '2021-12-13 11:31:17', '2022-12-13 18:31:17'),
('1f6da10f1657680f432a3f50cc9cb0d964ecf1dd7a9e3ba3b2adad0cc20379580518d49a27848399', 2, 2, NULL, '[]', 0, '2022-01-23 01:57:55', '2022-01-23 01:57:55', '2023-01-23 08:57:55'),
('21ecf5f713ec74fa6be4fca3c6782dcad7ff4a8dfa220bcf2be066e1faef851adb95462e88d800a2', 3, 2, NULL, '[]', 0, '2022-01-13 02:22:06', '2022-01-13 02:22:06', '2023-01-13 09:22:06'),
('22542e56029a25e916cdf4f174200ce7ef67211cb841f07a175217dff763021450955304f5f77304', 2, 2, NULL, '[]', 0, '2021-12-13 07:20:48', '2021-12-13 07:20:48', '2022-12-13 14:20:48'),
('22952d6183c64982ea97cb36a2d300aeb66b4dcc60e793f4a7ab6217b3c3cbece5875fc527e086ae', 3, 2, NULL, '[]', 0, '2022-01-24 14:49:44', '2022-01-24 14:49:44', '2023-01-24 21:49:44'),
('235db04a34a0f718be42f0132f3914a313c4ab54c1f8ae1fc26181788eaccd089461b685d8a23ade', 3, 2, NULL, '[]', 0, '2022-01-13 02:40:08', '2022-01-13 02:40:08', '2023-01-13 09:40:08'),
('238a411419591d82fa3d54880f2c74bc8ef1025bea7dfcd28f0690307d7d11f70b0fd4df2dd2b2de', 50, 2, NULL, '[]', 0, '2021-12-13 11:41:39', '2021-12-13 11:41:39', '2022-12-13 18:41:39'),
('242e10527df2c00ff763a6fd0807d48e31e1cd1e14d7f90a78c7ea56088b48fc972fe641d339b6bb', 3, 2, NULL, '[]', 0, '2022-01-13 02:51:34', '2022-01-13 02:51:34', '2023-01-13 09:51:34'),
('250a3e40b848f555fa1d374599d9755d9816b5aea69ff6b789d5d9e14ad29a1c5dcf598d90e0df9e', 3, 2, NULL, '[]', 0, '2022-01-13 04:18:08', '2022-01-13 04:18:08', '2023-01-13 11:18:08'),
('2511fbe752413b5cabebf6a7f93ed9ad10f7dbad3318be6293a8f7ab61280c72d22f2ceadf356bc8', 3, 2, NULL, '[]', 0, '2022-01-13 04:09:18', '2022-01-13 04:09:18', '2023-01-13 11:09:18'),
('2544ab0d2ae461fb4477801f9dd7897f01cd26cf01eff6672c072cc245d8097a1816ef63dd7c7004', 50, 2, NULL, '[]', 0, '2021-12-13 11:36:05', '2021-12-13 11:36:05', '2022-12-13 18:36:05'),
('2688284c01042ebdee9d32e29525b5fdc5c7c9ebd91f2b62d4bf3e3aad0a0a4fac965f0d4f01e43d', 3, 2, NULL, '[]', 0, '2022-01-19 04:51:21', '2022-01-19 04:51:21', '2023-01-19 11:51:21'),
('268d763b25e74ad897e7ecfdd32404849a47b63ebaff97ecb39c277753d6d2d41b23d480ddf395fa', 3, 2, NULL, '[]', 0, '2022-01-13 08:18:39', '2022-01-13 08:18:39', '2023-01-13 15:18:39'),
('29c6b657ae0313d96f3b5ccbe6712d054225364ec094998f2fc39d18693fe62d208670e056b98cc0', 3, 2, NULL, '[]', 0, '2022-01-23 01:36:12', '2022-01-23 01:36:12', '2023-01-23 08:36:12'),
('29daf75c0f084238a5f7a9f1f8a7894ec64418974b2e2dddcc68a64c5b676b237abf552da2550d20', 3, 2, NULL, '[]', 0, '2022-01-13 02:51:14', '2022-01-13 02:51:14', '2023-01-13 09:51:14'),
('2aaf52cbb668a570ccf0248c14c91a017ac0b0401c8edd1222a07ae81033fae9adc19380c9b8758b', 3, 2, NULL, '[]', 0, '2022-01-13 02:21:18', '2022-01-13 02:21:18', '2023-01-13 09:21:18'),
('2aba2ff777fd1cfc5c67680952faa33c3f476c21a2855fdf7e7468ae0513b88010f8c4c778194761', 3, 2, NULL, '[]', 0, '2022-01-19 06:44:14', '2022-01-19 06:44:14', '2023-01-19 13:44:14'),
('2ae50434949d2cfb9c3daff6c793294ccfc7ba4e91f7723a5d83a118f820f1c83566f6b9fb558354', 2, 2, NULL, '[]', 0, '2021-10-01 21:43:26', '2021-10-01 21:43:26', '2022-10-02 04:43:26'),
('2af21be172028253b564330b7dde09114469bedf8b9bb596c09c2a855d8defd75fa508b644014293', 3, 2, NULL, '[]', 0, '2022-01-21 03:37:55', '2022-01-21 03:37:55', '2023-01-21 10:37:55'),
('2be1682752e6760b4682cd790088ab264045f49674c085204da7ed269e0c154b28c06bfd9e4ce10a', 2, 2, NULL, '[]', 0, '2021-12-31 12:19:00', '2021-12-31 12:19:00', '2022-12-31 19:19:00'),
('2c8dfc771a55cb42b26d85dd1064019fdd9ab1db8d323b8d3e5e8ef5a91b989cb40bdf69f15f8e2a', 3, 2, NULL, '[]', 0, '2022-01-13 01:36:52', '2022-01-13 01:36:52', '2023-01-13 08:36:52'),
('2ced7b95a31ed845515ef7950e84b52cc19504ebbd39bfd2c912a4d7abbb73f992e398af611d9b70', 3, 2, NULL, '[]', 0, '2022-01-14 04:15:49', '2022-01-14 04:15:49', '2023-01-14 11:15:49'),
('2d06c4dbffb0e9aa6a681609b6fcd7ce4698abeaabbbeeed51db1c51a246acf542172385568e1182', 1, 2, NULL, '[]', 0, '2021-09-30 19:31:53', '2021-09-30 19:31:53', '2022-10-01 02:31:53'),
('2d5ad4de5fff0f3e402b5f574ade8230a61945d41faf6c8f754df2eedc605e6b5b15ed1dcfa6abc2', 49, 2, NULL, '[]', 0, '2021-12-13 08:21:21', '2021-12-13 08:21:21', '2022-12-13 15:21:21'),
('2e8f2efed62cb4ec5d01269954cef8c06bd08efc88ea280aae08d1ea1857a2509ccaf0d8f8646f3f', 3, 2, NULL, '[]', 0, '2022-01-20 01:34:21', '2022-01-20 01:34:21', '2023-01-20 08:34:21'),
('302e402a964ecdea790d1437a345e96cb00e7167efeca9ac409244020245dbe516c5cd3e6e78d7da', 1, 2, NULL, '[]', 0, '2021-09-28 19:33:43', '2021-09-28 19:33:43', '2022-09-29 02:33:43'),
('30762b85714e5283f877df42578d93e093fc57546145d7a7e3fbe9c1a52bcd4c59e959b6f6d87271', 3, 2, NULL, '[]', 0, '2022-01-13 03:18:05', '2022-01-13 03:18:05', '2023-01-13 10:18:05'),
('318c70509e035377298a23e071a31c5d9864191fe279694d91e5f225a17fa3fc0ff3b56c470c676e', 3, 2, NULL, '[]', 0, '2021-10-05 18:23:28', '2021-10-05 18:23:28', '2022-10-06 01:23:28'),
('32d570ea660858afc6e931bd0d3d0209da8ab19134d10d0c5794ef54f69f4f9e68231431f38f164b', 3, 2, NULL, '[]', 0, '2022-01-13 03:04:23', '2022-01-13 03:04:23', '2023-01-13 10:04:23'),
('330b17d9237ce722cedce35e99528a896a27d3f266cf9a3bc162d177ba2f4c2342f128b887a7195c', 3, 2, NULL, '[]', 0, '2022-01-13 03:43:09', '2022-01-13 03:43:09', '2023-01-13 10:43:09'),
('359759e8e73e707e4a0f120115777866e3eea6cf80df33673f18484db1edc627beb2c1df28c2417f', 3, 2, NULL, '[]', 0, '2022-01-13 04:16:03', '2022-01-13 04:16:03', '2023-01-13 11:16:03'),
('3671c4b1ebc0d6602dbbc5b853ff6b54e4a3b16e545a9bbb5c53ed971b6b955f007f4d668cdf865c', 3, 2, NULL, '[]', 0, '2022-01-14 02:53:25', '2022-01-14 02:53:25', '2023-01-14 09:53:25'),
('367e8c4d05c4a10c17d2bb726d69f3e5fcb7e795c96f36430fada6bf4f22446e68b33b58e8386360', 3, 2, NULL, '[]', 0, '2022-01-13 03:03:29', '2022-01-13 03:03:29', '2023-01-13 10:03:29'),
('37718647266a9ba6b20d841d69b64355aa11db275cd3c7f3f5001db2bf8c1a8f9c3a2e3c1112a797', 62, 2, NULL, '[]', 0, '2022-01-25 00:59:43', '2022-01-25 00:59:43', '2023-01-25 07:59:43'),
('37e0d8986ab6be2ce0bed4efbce5c8cea6bbfd2092805cbc11cc63f4ba87e8f58974c5db08c5af94', 3, 2, NULL, '[]', 0, '2021-10-05 05:49:56', '2021-10-05 05:49:56', '2022-10-05 12:49:56'),
('3837e07f6014a2f842cd3a4fccbca1c6afa6d465e79498f64918fa9dcaaef008252a7f7e1148dd01', 3, 2, NULL, '[]', 0, '2022-01-13 07:15:30', '2022-01-13 07:15:30', '2023-01-13 14:15:30'),
('3932e46c4a33447bf10afa930842a74b6713e5356fdf72161b71ed9063d325e180ddb75e33393e52', 3, 2, NULL, '[]', 0, '2022-01-13 02:41:35', '2022-01-13 02:41:35', '2023-01-13 09:41:35'),
('395f035a2b7db86d56e95666e2fc7024cceb95cf01d24056062dab5826d6cda72deb853fc819bbac', 1, 2, NULL, '[]', 0, '2021-09-30 18:35:47', '2021-09-30 18:35:47', '2022-10-01 01:35:47'),
('396b763c0d3c28700ac9a85bdf6c34c62b77426992e77afe1644d8a3ea88e67f23b2f16d1b883bee', 3, 2, NULL, '[]', 0, '2022-01-13 03:36:21', '2022-01-13 03:36:21', '2023-01-13 10:36:21'),
('39cd00f059186236deeeab987baba017095fe96235cfeefdaa999b75ce5841f8caf994b779cc7022', 3, 2, NULL, '[]', 0, '2022-01-21 04:44:56', '2022-01-21 04:44:56', '2023-01-21 11:44:56'),
('3bb7575740579c09d467531083c5bd939fcfb6b5cc000b78c672435ca24ed4d5755420d34eff9205', 2, 2, NULL, '[]', 0, '2021-12-13 07:24:02', '2021-12-13 07:24:02', '2022-12-13 14:24:02'),
('3c4e287320d369d514b2111196b7db462dae3d1246c034ddf7afed9703a29b686f89a4ce339267e3', 49, 2, NULL, '[]', 0, '2021-12-31 12:10:24', '2021-12-31 12:10:24', '2022-12-31 19:10:24'),
('3d6e624265b6c7a1c3affc993f605962f4fcbbe00ff65e48c7ab04d5651d9a23778a55e6c228a5cc', 3, 2, NULL, '[]', 0, '2022-01-13 03:18:12', '2022-01-13 03:18:12', '2023-01-13 10:18:12'),
('3e34b4bd13dae8525356a759c34a37075ba799189de9d08593de10f5869c76b5c21ba717aa3f6c89', 3, 2, NULL, '[]', 0, '2022-01-21 04:37:51', '2022-01-21 04:37:51', '2023-01-21 11:37:51'),
('3eecebaabfe2be8eb124c7546a0f309e201b7a1229591689ba6262c9b0c2f94af5372ca7ab6bd3b6', 3, 2, NULL, '[]', 0, '2022-01-13 03:25:56', '2022-01-13 03:25:56', '2023-01-13 10:25:56'),
('3f4cb98e4776aec2267fb9861e7cbb48d905b7dbb6c3e718c5da453bb8772b664fb8c50e9a9e731e', 2, 2, NULL, '[]', 0, '2021-12-13 07:12:52', '2021-12-13 07:12:52', '2022-12-13 14:12:52'),
('3f6d8a54557bc3389895f27e4ce0d68333b6b90e30446e3afde17ba9237fecee7d74a1dcd5441ed3', 3, 2, NULL, '[]', 0, '2022-01-13 03:59:51', '2022-01-13 03:59:51', '2023-01-13 10:59:51'),
('3f933e39d7b5bf1311161727af8e8931a1c24cea8d40a7dbda0fdb2133fef267dc29a99b9a6c206c', 3, 2, NULL, '[]', 0, '2022-01-13 04:20:34', '2022-01-13 04:20:34', '2023-01-13 11:20:34'),
('40ac98b13e3996fd887936ef9d36dccad044ead2547dc47e0fa929fbb0d9036dcb66735ac6ab0cb5', 68, 2, NULL, '[]', 0, '2022-01-25 00:16:43', '2022-01-25 00:16:43', '2023-01-25 07:16:43'),
('40eee0497fa356d8999f6ae3203a338fd20438c66860d4f4f1e7e2e0c2a50bc60883014b0f2b0cb7', 3, 2, NULL, '[]', 0, '2022-01-13 04:50:41', '2022-01-13 04:50:41', '2023-01-13 11:50:41'),
('411d7036427a8b50c61855d8b4d8c1bf7d8ba5a58920db610c364fdb9549fcb0b39f4407e0b8d162', 3, 2, NULL, '[]', 0, '2022-01-22 02:44:36', '2022-01-22 02:44:36', '2023-01-22 09:44:36'),
('423f708510b227f87eda973d77d2237b3074b50458382cf299fd2add3a7c9fb8a8f29376d04360ea', 3, 2, NULL, '[]', 0, '2022-01-13 02:51:02', '2022-01-13 02:51:02', '2023-01-13 09:51:02'),
('42af4ec61464fab55054a38c66086553e06168021e6ee49241cd74b03ef45ddeb541ffe930e08769', 3, 2, NULL, '[]', 0, '2021-10-08 03:57:05', '2021-10-08 03:57:05', '2022-10-08 10:57:05'),
('43818df7484f582a4702f1903a8da3665b8baefc785e60255fb7271cd5ced65c08261ea3ee317748', 1, 2, NULL, '[]', 0, '2021-09-28 19:04:38', '2021-09-28 19:04:38', '2022-09-29 02:04:38'),
('43f81d9886148251daf5d7d8a6ecf0b9b6bd2f193c54eaa348c906aba77824feef614a1e920478d7', 2, 2, NULL, '[]', 0, '2022-01-08 09:24:30', '2022-01-08 09:24:30', '2023-01-08 16:24:30'),
('45686e91e8d49d92ff163a2314a055f7a797033afba5fcd2924fd4ae652e3e0b4ee72e873ae659c2', 1, 2, NULL, '[]', 0, '2021-09-30 21:00:15', '2021-09-30 21:00:15', '2022-10-01 04:00:15'),
('45bdbed0a944b0e3693328ec70ea4a2318edf56553d94bdb96d90c127416aa3f637a012c83cab33a', 3, 2, NULL, '[]', 0, '2022-01-13 02:41:42', '2022-01-13 02:41:42', '2023-01-13 09:41:42'),
('45f5805cd2ef093b9f74c2d0c034e39762dc64c3e6a95aad638f8c6ddfe0ca5616adcd376e88ff78', 3, 2, NULL, '[]', 0, '2022-01-13 03:59:02', '2022-01-13 03:59:02', '2023-01-13 10:59:02'),
('495c6b68b280351264fc22c7a80c8560fc87ffb4a4e36c9eb6f2bbd393ce17e206e708046fb7482c', 2, 2, NULL, '[]', 0, '2021-12-13 07:25:55', '2021-12-13 07:25:55', '2022-12-13 14:25:55'),
('499cc549099320d9141c71af00addbea74b3d8f83d86e226aea16feb1ca2c5fd5771e5d4ef9e6033', 3, 2, NULL, '[]', 0, '2022-01-20 02:22:46', '2022-01-20 02:22:46', '2023-01-20 09:22:46'),
('49cc13e342d624477cc6a38b6ef61890428d8d42684fbf3357759c53ee6a4066fcc13577cfec96c4', 3, 2, NULL, '[]', 0, '2021-10-13 03:25:01', '2021-10-13 03:25:01', '2022-10-13 10:25:01'),
('4a970c8a21d56dd18e9233fd9cb0dfd09716535226350f5bbe9f9809bbb62681774ba4c1f02edc5d', 2, 2, NULL, '[]', 0, '2021-12-31 12:15:10', '2021-12-31 12:15:10', '2022-12-31 19:15:10'),
('4b431ac335999167f1d16dbd406e8baacb28da249b1138f081c80e6616c2601efc8a526f7e523e26', 3, 2, NULL, '[]', 0, '2022-01-13 03:13:24', '2022-01-13 03:13:24', '2023-01-13 10:13:24'),
('4ba749760a27edefe3854f9889b99df4a1d1aff47b2cb0fc4f0432678981b6385d7fd61893c9a05e', 1, 2, NULL, '[]', 0, '2021-09-28 01:33:57', '2021-09-28 01:33:57', '2022-09-28 08:33:57'),
('4c41cb2494ca9a28c3b24e1fffc6434f9c6dca4692819cf2ad7653ae2f98de9cc0b8599607daa86f', 3, 2, NULL, '[]', 0, '2021-10-05 01:58:07', '2021-10-05 01:58:07', '2022-10-05 08:58:07'),
('4cc78d6e0229c5b7c011bc5dc09215f5208d9ee5f68814fffd13439fcbd722f431ded7f2f23e61af', 1, 2, NULL, '[]', 0, '2021-09-30 18:52:14', '2021-09-30 18:52:14', '2022-10-01 01:52:14'),
('4f6193120cd34797c68a0c692ca182870ffb86139d2bf90c7576f2ef3a6f9eb83960563d18272832', 2, 2, NULL, '[]', 0, '2022-01-01 03:35:33', '2022-01-01 03:35:33', '2023-01-01 10:35:33'),
('4ffa308d70fe95dc2f581b55d1a07d72144c877441abbf5236850a90e04e958b2784c74f6fbb9354', 2, 2, NULL, '[]', 0, '2021-12-13 07:14:02', '2021-12-13 07:14:02', '2022-12-13 14:14:02'),
('50d2417b9218e1ec9995c783b9700a5cd4912ec1aa1f95426de3bb9076d75fd91c65811c071d0008', 3, 2, NULL, '[]', 0, '2022-01-13 03:00:18', '2022-01-13 03:00:18', '2023-01-13 10:00:18'),
('518ed3179f20c74e9e0e7a41db0a6bd6b482c973b8db594a0f9addc09ed9593509a674adab9db997', 3, 2, NULL, '[]', 0, '2022-01-20 02:44:54', '2022-01-20 02:44:54', '2023-01-20 09:44:54'),
('51b122a0243eb4108b6031b1d7bb02fea0a77a29fd5ec8511ab959b6e57b3a9bd2d549f274ab76c1', 1, 2, NULL, '[]', 0, '2021-09-28 19:08:25', '2021-09-28 19:08:25', '2022-09-29 02:08:25'),
('52ecc916961fdad9370e04189da21f1a3c81a0b251f9126da81d35319376e7a162c59909c53307f5', 3, 2, NULL, '[]', 0, '2022-01-13 02:31:35', '2022-01-13 02:31:35', '2023-01-13 09:31:35'),
('5337f7da7d94e5f835cfc9a7743cc791e18a7db050cf5c94436b5f68c7e799968090dfc84a5a8c13', 3, 2, NULL, '[]', 0, '2021-12-17 03:50:26', '2021-12-17 03:50:26', '2022-12-17 10:50:26'),
('5369f878c60491b57285e965eb8836483798b795713b72ebb76955a9f9bd683519203a772b635c45', 3, 2, NULL, '[]', 0, '2022-01-13 03:50:12', '2022-01-13 03:50:12', '2023-01-13 10:50:12'),
('545136ea905b74113ab7256aeaae5e41d1651f6ccdc0a8560cea63261ecdbd5605f801527107d15a', 3, 2, NULL, '[]', 0, '2022-01-13 02:43:35', '2022-01-13 02:43:35', '2023-01-13 09:43:35'),
('5564b2283b33005776c4edf16ebe79e99ee34687d044d07e5dd8a67034afa83a6923ed79726014bd', 3, 2, NULL, '[]', 0, '2022-01-17 04:07:42', '2022-01-17 04:07:42', '2023-01-17 11:07:42'),
('562f8cf586f9b5c89f148382f459b1f722f23983adbec1b9344596eeabeb1a0f5751aa880ea8f833', 3, 2, NULL, '[]', 0, '2022-01-13 02:46:39', '2022-01-13 02:46:39', '2023-01-13 09:46:39'),
('5755740051112fb520fa471a744fb9a2f7ff6baab80ba0e720e1803830dcbfc37a8ec299e0aafedb', 3, 2, NULL, '[]', 0, '2021-10-08 03:55:28', '2021-10-08 03:55:28', '2022-10-08 10:55:28'),
('57cf9418d32e62db7d7376dcf89edadbd004fd547cd9d940b10530cdb88088992c631ce13039feb3', 3, 2, NULL, '[]', 0, '2022-01-19 06:44:20', '2022-01-19 06:44:20', '2023-01-19 13:44:20'),
('57d46a5f8aa173f67d564116c6987dad7a54d15361cbd3b5a263973296b9a0e67ae6ad657107a417', 3, 2, NULL, '[]', 0, '2022-01-13 02:43:11', '2022-01-13 02:43:11', '2023-01-13 09:43:11'),
('586414a2612da1b10ac2ac4f5e5dae252074e984f6fc1648118dd781c5e7e62226f6ee83c1808618', 3, 2, NULL, '[]', 0, '2022-01-13 02:50:31', '2022-01-13 02:50:31', '2023-01-13 09:50:31'),
('588a6b2056f6b390a01ac7ca126bf454e0030cb513bbfb72b7ed68dc745c19f6cc3f2821b5dc726c', 2, 2, NULL, '[]', 0, '2021-12-21 07:45:47', '2021-12-21 07:45:47', '2022-12-21 14:45:47'),
('58dc337d1219e605d9e8d0aa63ba948050434f52901265492b70b7e6dbb0694467b8d9ddb8f41604', 1, 2, NULL, '[]', 0, '2021-09-28 20:13:38', '2021-09-28 20:13:38', '2022-09-29 03:13:38'),
('596613b5202535dc9e782ae38dd9913c02538fd84f245dca770adfbb46a5f0f01498f039906c404f', 3, 2, NULL, '[]', 0, '2022-01-21 04:45:23', '2022-01-21 04:45:23', '2023-01-21 11:45:23'),
('59b705b5d2e676ec71ccdb0e2bfd1e10b94606f19cff26c9082e64f6d5acf691189d3a2a23fc58dc', 50, 2, NULL, '[]', 0, '2021-12-13 11:25:58', '2021-12-13 11:25:58', '2022-12-13 18:25:58'),
('5a294e1a4c79eedac2aa8d51fc119dcf19245c22b0babf3f9a3c04e3c1ba828cd5313600058bab17', 3, 2, NULL, '[]', 0, '2022-01-13 03:13:18', '2022-01-13 03:13:18', '2023-01-13 10:13:18'),
('5a67564d5657d884e4c88d88ad65f9d7e2409e37b6b1411434e0a3203f61a07a26d29c469471877c', 2, 2, NULL, '[]', 0, '2021-10-04 21:23:49', '2021-10-04 21:23:49', '2022-10-05 04:23:49'),
('5b9bf80e5315d37751d36aa5a774273f86131ca2f6a4e12817cf3245dd56e532dd7610786a0461a0', 3, 2, NULL, '[]', 0, '2022-01-13 03:58:30', '2022-01-13 03:58:30', '2023-01-13 10:58:30'),
('5d8a16031a42a555d13eddd48944a604411f111daa131ce41e940da71b3b1d00024cb549a713a940', 1, 2, NULL, '[]', 0, '2021-09-28 01:32:14', '2021-09-28 01:32:14', '2022-09-28 08:32:14'),
('5ed09663750912cd56f9ba09e72eba5d54eb6dc51d3e0e72110bfd4c2a90028e06d363d02f1677c6', 1, 2, NULL, '[]', 0, '2021-09-28 20:13:15', '2021-09-28 20:13:15', '2022-09-29 03:13:15'),
('5ed90da8e42739c35d9fb466578123d125c2ab7617faa888f66e1bc5db6c9270a397f32cb10c44a7', 3, 2, NULL, '[]', 0, '2022-01-13 02:10:54', '2022-01-13 02:10:54', '2023-01-13 09:10:54'),
('5ee680eaf8519fca986d0b0474212200ee2b553d2a7b29cf6ba29b3f5fd7d5b2cea785e3b968cb71', 3, 2, NULL, '[]', 0, '2022-01-13 02:27:53', '2022-01-13 02:27:53', '2023-01-13 09:27:53'),
('5fd058ede530bbacbbc7770c132c5913f9cf195bd39483023e36f155d350990529cbba2dfff2ee96', 2, 2, NULL, '[]', 0, '2022-01-14 10:50:34', '2022-01-14 10:50:34', '2023-01-14 17:50:34'),
('620846a1438755a06d1ebfed38cb464b4d30ab364eb4c6ca9012a87666333204bb0413ceeeae0fa8', 1, 2, NULL, '[]', 0, '2021-09-28 01:31:40', '2021-09-28 01:31:40', '2022-09-28 08:31:40'),
('625993f357632df0bc17b747f0b578b3ccf4c0f648ba5f1e5410ff7e3ae0da77202239c84fd98c1e', 50, 2, NULL, '[]', 0, '2021-12-13 11:37:12', '2021-12-13 11:37:12', '2022-12-13 18:37:12'),
('6486c720b44523f750686ead9f77eac675ab2d81d32cb8372dc224082ee40abef3bbda5c44612b39', 3, 2, NULL, '[]', 0, '2022-01-19 01:32:52', '2022-01-19 01:32:52', '2023-01-19 08:32:52'),
('679da67345b51bcc6094065f358769fc055296de64764f0624382f79f326f803db6de2dded74e774', 3, 2, NULL, '[]', 0, '2021-10-04 21:21:05', '2021-10-04 21:21:05', '2022-10-05 04:21:05'),
('685e2adafd90d891e8af795ede5316ef55252fa739874235b618970f9e56fab244b05f7be3766631', 50, 2, NULL, '[]', 0, '2021-12-17 03:51:31', '2021-12-17 03:51:31', '2022-12-17 10:51:31'),
('6864dcb74f2286bf426565e79297e731f2742c326b4b08e23b13eb7f1fc268ff77aef57c202aeb78', 3, 2, NULL, '[]', 0, '2022-01-19 06:44:07', '2022-01-19 06:44:07', '2023-01-19 13:44:07'),
('688f97916ceb31bc51e0e74685c0cdeb17ab1b89d16748c518f584e5d1068680e9d81993ca1c13f5', 3, 2, NULL, '[]', 0, '2021-10-05 20:04:10', '2021-10-05 20:04:10', '2022-10-06 03:04:10'),
('68c64ba9f584ec90905a8b47f66713e3e769236963851cdd85ad369470965062aafa3e239d9ca07c', 3, 2, NULL, '[]', 0, '2022-01-13 01:36:51', '2022-01-13 01:36:51', '2023-01-13 08:36:51'),
('69ffca399b2473cff23910713377733f0df284f9e98ffb3504b2726faf75f24e4608b540673735c3', 2, 2, NULL, '[]', 0, '2021-12-31 12:07:36', '2021-12-31 12:07:36', '2022-12-31 19:07:36'),
('6a9d46940f1d35ac2e28141e4afe808ad31cfea5a810a6c24426aa53c5d3cf9ff19dc7d1841ed2ab', 3, 2, NULL, '[]', 0, '2022-01-20 02:40:14', '2022-01-20 02:40:14', '2023-01-20 09:40:14'),
('6abe45b25c29755412d79cc970a84c24b2713ae662ee6a10e2e831fd0eae72767d0541d47fba1eba', 2, 2, NULL, '[]', 0, '2021-12-31 12:18:21', '2021-12-31 12:18:21', '2022-12-31 19:18:21'),
('6adad9e1bb85ec963eb668cc8875c7f8b8ac1cf5f79c9a3a5f82e901f10a3effc0c79efad2b95852', 2, 2, NULL, '[]', 0, '2021-09-30 23:08:16', '2021-09-30 23:08:16', '2022-10-01 06:08:16'),
('6c088064bd12bf3fffc716cd554cce97df283679c3e2e00aaf67d8582f444bd86fd42c25a9dd2ac8', 3, 2, NULL, '[]', 0, '2022-01-23 01:46:35', '2022-01-23 01:46:35', '2023-01-23 08:46:35'),
('6c5d55456395b4c163c22b3dc9c89ecba0c491c05631a6dae0d22e662a9af2fdf451ea7abfbc408a', 50, 2, NULL, '[]', 0, '2021-12-17 03:57:52', '2021-12-17 03:57:52', '2022-12-17 10:57:52'),
('6c7543f824eef19321418370cbc43f56ef7b9543e73ac8f2268f08af777d0101fce9adc5b3d58493', 3, 2, NULL, '[]', 0, '2022-01-14 01:13:03', '2022-01-14 01:13:03', '2023-01-14 08:13:03'),
('6e186bdd1dfc98a2cfdad7959f6a2be3772757969a4d16fb774ada7f89fb9ac8ff2155f509486c87', 3, 2, NULL, '[]', 0, '2021-10-04 21:43:59', '2021-10-04 21:43:59', '2022-10-05 04:43:59'),
('6e270181298b2ee0e6374e850e68f8581665e735cb204b59b89a44ee28d6b17655e7bc1ed3377932', 3, 2, NULL, '[]', 0, '2022-01-13 03:22:44', '2022-01-13 03:22:44', '2023-01-13 10:22:44'),
('71a171661582efde2b9884268598051cd318c96e8280aca8013b69606b7a72d3ae5fc06272564d52', 3, 2, NULL, '[]', 0, '2021-10-13 03:13:57', '2021-10-13 03:13:57', '2022-10-13 10:13:57'),
('7323106e6b1debfe2a2cf5b99949f106cf2f084373491424ee104372034fdad841d789c96259ecef', 62, 2, NULL, '[]', 0, '2022-01-23 02:06:06', '2022-01-23 02:06:06', '2023-01-23 09:06:06'),
('732e145f00fe274d3ec48d2b3f55d88d7240e3a52a33ee5780a25f8f944251643a88480772db4cf0', 50, 2, NULL, '[]', 0, '2021-12-13 11:26:49', '2021-12-13 11:26:49', '2022-12-13 18:26:49'),
('73b14e3cc13700b93482995afa296d252e588af88a216aa3b0b434cdf72a501555b8f91541d67ad6', 3, 2, NULL, '[]', 0, '2022-01-13 03:26:26', '2022-01-13 03:26:26', '2023-01-13 10:26:26'),
('73eaafdbd8ed155de18e614bdb8790cc64c45d1b735631adc355b463776d648ec244abc74e6b5b72', 2, 2, NULL, '[]', 0, '2021-12-31 12:08:03', '2021-12-31 12:08:03', '2022-12-31 19:08:03'),
('755c3bbf5bf3f33767199f7b5876d4fc7a517e5a41d67c0b3ec1961eaec06a57362afbfa3e8ba49c', 3, 2, NULL, '[]', 0, '2022-01-13 02:52:25', '2022-01-13 02:52:25', '2023-01-13 09:52:25'),
('7574760069e9275307eefeb2d8360005af8278d574bbf5f1edf157bc1cc5048fc18f3368c15a7c8e', 3, 2, NULL, '[]', 0, '2022-01-13 03:08:09', '2022-01-13 03:08:09', '2023-01-13 10:08:09'),
('766ede1fd863dfe4d4428af3bfd16fd612f46a5a17a31f3b89faa19d399ba6fb09f602dba7e6c60e', 3, 2, NULL, '[]', 0, '2021-10-05 01:39:11', '2021-10-05 01:39:11', '2022-10-05 08:39:11'),
('7714788d6d42a927f7de09507fc15882fb179aee3fd5d8a16d03c6f9830b7a721a3b1039e2d4c20b', 3, 2, NULL, '[]', 0, '2022-01-13 01:50:33', '2022-01-13 01:50:33', '2023-01-13 08:50:33'),
('771d98a9640c1c28c32078d88b80320acd68b602f8fc6e6327f672346303660640a45bfc94283844', 3, 2, NULL, '[]', 0, '2022-01-13 03:59:48', '2022-01-13 03:59:48', '2023-01-13 10:59:48'),
('778647ed1c12e0ddc54e52dad2020fba53fd4ab5817a125c19623854251cc5ba1024bc499f35a155', 3, 2, NULL, '[]', 0, '2021-10-05 05:34:46', '2021-10-05 05:34:46', '2022-10-05 12:34:46'),
('7787eefe7ed1d2212b6def842e747519dbb391a2d2abf348411e1007377b031a882786295c2665da', 46, 2, NULL, '[]', 0, '2022-01-23 01:37:31', '2022-01-23 01:37:31', '2023-01-23 08:37:31'),
('77b5b542ca8a102ef44d5e2efc4377e9ab6145e918439ce23ad8da8c96a7b5553c1fae2dfa41236b', 3, 2, NULL, '[]', 0, '2022-01-22 02:52:46', '2022-01-22 02:52:46', '2023-01-22 09:52:46'),
('78bf4fc11b5fdd378ba0e440526e7ca5b4dd45d2bfd54d60ae68ab88865eb3ece3e821238ee41046', 2, 2, NULL, '[]', 0, '2021-12-13 07:56:43', '2021-12-13 07:56:43', '2022-12-13 14:56:43'),
('79092e8f8d1b8d56c519f1cb7311a52a1a7fbe4aa0600dad6ba2b2943757ba472156966294dfad01', 3, 2, NULL, '[]', 0, '2022-01-13 04:01:40', '2022-01-13 04:01:40', '2023-01-13 11:01:40'),
('790c4bd472624495ac2374ff8c2d6ddc268acb1ea7f9b9140ec1ec7fd1e377c37bb4d971e145d6f1', 3, 2, NULL, '[]', 0, '2022-01-13 02:54:04', '2022-01-13 02:54:04', '2023-01-13 09:54:04'),
('79701e83ca3037828469584a96ed728f09b67640cd3899dc797177599fd6b0f7b8994bfedf771773', 3, 2, NULL, '[]', 0, '2022-01-13 03:23:31', '2022-01-13 03:23:31', '2023-01-13 10:23:31'),
('7b071eef90f10c6b4109b49639ed578d4ca188dfa725460f13c9ba3855e57a8075f16c6596f34ea4', 3, 2, NULL, '[]', 0, '2021-10-05 00:36:00', '2021-10-05 00:36:00', '2022-10-05 07:36:00'),
('7b86dadf93ecfe5740f8a2dec133bb0c7628970bd4ace3865417a74981075cbb830bc0fc7cecd5e9', 2, 2, NULL, '[]', 0, '2021-09-28 21:30:08', '2021-09-28 21:30:08', '2022-09-29 04:30:08'),
('7b96fbf4dcd476bf92e284975335b7b2d9f8a2e68f69ae03c5d7a02a23d79bf08ff4d8b6f57c3dce', 2, 2, NULL, '[]', 0, '2021-12-13 07:18:57', '2021-12-13 07:18:57', '2022-12-13 14:18:57'),
('7d571ac186824d0d3dbc556321bd8b58703f2f10969e8e2a1c6f85deb3ba2b0ce34b865c44473aeb', 3, 2, NULL, '[]', 0, '2022-01-13 04:08:56', '2022-01-13 04:08:56', '2023-01-13 11:08:56'),
('7d5f141eae9f2ec3b29c8e5e53b4ba0946d6876f7e5aef8fdc4e97b59e2ffda50107ebf6dadf88fa', 3, 2, NULL, '[]', 0, '2022-01-13 03:20:31', '2022-01-13 03:20:31', '2023-01-13 10:20:31'),
('7d8d252fe5110419ad31e3c08de95f2f93e000ab8876cfed8623c462e1dd072bd1717d101a82f738', 3, 2, NULL, '[]', 0, '2022-01-13 08:09:54', '2022-01-13 08:09:54', '2023-01-13 15:09:54'),
('7dfd2468d657bbe6db5a3e8d72a28bce6ea6bdb70b9fd6b60517940226ec922eb9572ede940fe5be', 2, 2, NULL, '[]', 0, '2021-10-04 05:21:02', '2021-10-04 05:21:02', '2022-10-04 12:21:02'),
('7f5317612909e3d6b534744f57a317147eb9b090bde3afdc032c86893ab7111889478cf959b788b7', 3, 2, NULL, '[]', 0, '2022-01-13 03:14:34', '2022-01-13 03:14:34', '2023-01-13 10:14:34'),
('82ea9e70f8d6b95d49ae2bb66a620e17506d0b82c98120f562c5660e3cf25ccaaf184b89f575418c', 3, 2, NULL, '[]', 0, '2022-01-13 03:58:58', '2022-01-13 03:58:58', '2023-01-13 10:58:58'),
('82ef463815f8e7063720d33158cbe427e95e4c82ff0d8c3b988fcf14209e7689b3eea211d6b35db6', 2, 2, NULL, '[]', 0, '2021-10-04 21:22:22', '2021-10-04 21:22:22', '2022-10-05 04:22:22'),
('845381a9dd5d576e251a8328d929a875a8a5026c68a7361bade309f96a9e9dfb60ae4fb6b9d2380d', 3, 2, NULL, '[]', 0, '2022-01-13 03:34:31', '2022-01-13 03:34:31', '2023-01-13 10:34:31'),
('8573106236a3eb6ae05d8a84b2cfb9a1db8d66071fde303fddad31c5b1792e1bd1490de9a29e2854', 3, 2, NULL, '[]', 0, '2022-01-13 03:25:00', '2022-01-13 03:25:00', '2023-01-13 10:25:00'),
('85cef7a9a9e9adab4ba19149d18b0e7a2ec0b7edb41c96096a34f0d1ac6464c19d2febc1a2a4bddf', 62, 2, NULL, '[]', 0, '2022-01-23 02:10:55', '2022-01-23 02:10:55', '2023-01-23 09:10:55'),
('86d946e2a888843a0cbba5f821c5dd4d3c9ccb174f483a8c9461fbaa492d2a7c204ca32af6662d71', 1, 2, NULL, '[]', 0, '2021-09-28 19:12:06', '2021-09-28 19:12:06', '2022-09-29 02:12:06'),
('87077394001418050ed626cd5ed07e2ef2536b22a5c17dd61abd60ded8f0ba1c3e6098f6a6966278', 2, 2, NULL, '[]', 0, '2021-12-31 11:31:32', '2021-12-31 11:31:32', '2022-12-31 18:31:32'),
('8711438d519947c74b4fcd78c5caf0f0490dfa785e06d024675a40bd5097f953175ffaaa937d0ab5', 3, 2, NULL, '[]', 0, '2022-01-13 03:23:05', '2022-01-13 03:23:05', '2023-01-13 10:23:05'),
('87272fd4c0f18870bdab6d4c347eaa91938593d38313428926bcd376375c9d7dd5d6b432fef468dc', 3, 2, NULL, '[]', 0, '2021-12-17 10:58:09', '2021-12-17 10:58:09', '2022-12-17 17:58:09'),
('8763b7330501170a1e6433d454f64666f9c1701b05d694eb8e5dfdb1cfa5275c67927971bfd0c80d', 2, 2, NULL, '[]', 0, '2021-12-13 08:14:28', '2021-12-13 08:14:28', '2022-12-13 15:14:28'),
('880c85ffdba4813677764c5e17bc8a62e8d99c7fd68faa30d45ea1b228e76848faa61e8782a2c5ef', 3, 2, NULL, '[]', 0, '2022-01-13 03:45:29', '2022-01-13 03:45:29', '2023-01-13 10:45:29'),
('88aa28e17cd3f562074f289236e52666cf4a3688a288f47ae68b560421ccd415c646253925f1750b', 3, 2, NULL, '[]', 0, '2022-01-13 03:03:01', '2022-01-13 03:03:01', '2023-01-13 10:03:01'),
('892a2dd0739b45b45ad5529fd81205b6f3b832ce0a7a18395a43f3cfc65db223be64445871f07b28', 3, 2, NULL, '[]', 0, '2022-01-13 03:11:10', '2022-01-13 03:11:10', '2023-01-13 10:11:10'),
('8a633d157bdf81251b9403acc091de8ee5d17c2953e273f6aaae6ae2b509f9ef3712706cbb23221a', 50, 2, NULL, '[]', 0, '2021-12-17 03:52:33', '2021-12-17 03:52:33', '2022-12-17 10:52:33'),
('8d3983937ea7303b4bd75ff95c404e91d1a8d72dc884e2fc65b4f36cf6ae6f4bfe867ba109cb7d26', 3, 2, NULL, '[]', 0, '2022-01-13 02:38:40', '2022-01-13 02:38:40', '2023-01-13 09:38:40'),
('8e9005e6bbc5b1608ec81d8cf9735d3ee86423d6efbd48d366d11dfdac166068bc49f92cec364684', 3, 2, NULL, '[]', 0, '2022-01-13 03:34:22', '2022-01-13 03:34:22', '2023-01-13 10:34:22'),
('8f19eda68a439eb611e1e86c5d38758c4371391bde77255c21cd99b682435120f66df2edfec06144', 3, 2, NULL, '[]', 0, '2022-01-13 03:28:04', '2022-01-13 03:28:04', '2023-01-13 10:28:04'),
('8fb84dc59b6a97f9a26e18daccc301f34f3e41624a8af08e880ac3f72c39be5a1bada87479376769', 3, 2, NULL, '[]', 0, '2021-10-04 18:43:18', '2021-10-04 18:43:18', '2022-10-05 01:43:18'),
('8fc2b29c2dbdceffef348f50548ae587a493b5b24b4acf3aecc49dc9ba7a8933163c073e1389a8dc', 1, 2, NULL, '[]', 0, '2021-09-28 01:32:53', '2021-09-28 01:32:53', '2022-09-28 08:32:53'),
('914c0b33e23baa0efc4b484c6f234557cfe35ce5cedf60c47687d0e0a1d2427ec06164df40ff769d', 3, 2, NULL, '[]', 0, '2021-10-05 05:26:49', '2021-10-05 05:26:49', '2022-10-05 12:26:49'),
('92afdc4757ce705657091adf3a5b43dcaccd0583034de97cf8ebfdb8acbb21d533d97dd566284ab4', 50, 2, NULL, '[]', 0, '2021-12-17 03:53:04', '2021-12-17 03:53:04', '2022-12-17 10:53:04'),
('92d46f087c10c4a7512e9d925d623c3863d1ffd1da190864cbb764e953ec96aae353b64b8af4e0f0', 3, 2, NULL, '[]', 0, '2022-01-13 04:23:05', '2022-01-13 04:23:05', '2023-01-13 11:23:05'),
('95796fa42b5d50b788a4889a9108b57c649a61c78a7780d53216c7cdd289113a52a50c83f1662f9d', 2, 2, NULL, '[]', 0, '2022-01-13 11:29:48', '2022-01-13 11:29:48', '2023-01-13 18:29:48'),
('95c91a898a449e8a0e53e9f217a3ac7c2529dfac809d86d8546792b5e14a53f474d4525e7d3de475', 2, 2, NULL, '[]', 0, '2021-12-31 12:15:54', '2021-12-31 12:15:54', '2022-12-31 19:15:54'),
('9611d2ec2d3796c518903aadc70a96e0376a94f98be41d5e2cd09e0bf771021795f280e70fe4eedb', 2, 2, NULL, '[]', 0, '2021-10-04 21:24:19', '2021-10-04 21:24:19', '2022-10-05 04:24:19'),
('970eca226033604b91d9aa435b99bc4d7847efbd33cf8a73cd400e7e9b1219eaa9f4369b33cbd4aa', 1, 2, NULL, '[]', 0, '2021-09-28 01:30:49', '2021-09-28 01:30:49', '2022-09-28 08:30:49'),
('98e82605e654e571345e8bc8ef377c33e733b75c48447da2db5b4e4d664fb5020c91c2d0872f5f14', 1, 2, NULL, '[]', 0, '2021-09-28 01:32:50', '2021-09-28 01:32:50', '2022-09-28 08:32:50'),
('991c602850f6ec5b980af524da333c1b9c8174ec431ac76eb0c21ac639b5106e6e17a49ede31733b', 50, 2, NULL, '[]', 0, '2021-12-13 11:23:44', '2021-12-13 11:23:44', '2022-12-13 18:23:44'),
('9936aa077a311dc9707d2409ca30d60cc3ab524a40d280fab63d73422f4c266ac25ba67e3f32495c', 3, 2, NULL, '[]', 0, '2022-01-13 04:46:52', '2022-01-13 04:46:52', '2023-01-13 11:46:52'),
('99c9918416232fc4de034e8fc08381da00f6770218977ec79d2f94580c5661f751f3703606d74a6c', 3, 2, NULL, '[]', 0, '2021-10-05 01:51:52', '2021-10-05 01:51:52', '2022-10-05 08:51:52'),
('9a6b8945ac42a5538e306609b6bfb6c8fc0c811da8682e31bf1ab226e5a1a56187fe617d269d5a11', 3, 2, NULL, '[]', 0, '2022-01-13 02:59:00', '2022-01-13 02:59:00', '2023-01-13 09:59:00'),
('9a717dabfdcb2378680a7fee93d7edaa5747b4631ce62d54b2cd1682419276372cf429a463f4886c', 2, 2, NULL, '[]', 0, '2021-12-28 11:22:11', '2021-12-28 11:22:11', '2022-12-28 18:22:11'),
('9cb1651976ca2d6819ee3a02566dd673973a4e31156ba210f8feb4adf2b574d7c3f5c5648ad0018e', 3, 2, NULL, '[]', 0, '2022-01-13 02:15:46', '2022-01-13 02:15:46', '2023-01-13 09:15:46'),
('9e1dbcef9fce07f0cddc1f22543f5b7c7f7b8db077924debc769f0182c9a35a08f4509dbd103cd55', 3, 2, NULL, '[]', 0, '2022-01-13 08:23:00', '2022-01-13 08:23:00', '2023-01-13 15:23:00'),
('9ee23e04b6ff9613731b44a6eef82b641097ab007c73b66046b93bcaa8e39d6c090fd09c90be9d9a', 3, 2, NULL, '[]', 0, '2021-10-13 03:33:20', '2021-10-13 03:33:20', '2022-10-13 10:33:20'),
('9f1f27db57ae08a99c127e2bf8cbbd9fbf6bd12844ad25db70749765fb1f27c67b9132a86cacc663', 3, 2, NULL, '[]', 0, '2021-10-05 01:31:37', '2021-10-05 01:31:37', '2022-10-05 08:31:37'),
('a05f95a8940912850b2bc59b7be2453ef63297b9b6a145a067f3452edb5c1c849c102a7abcf28efc', 3, 2, NULL, '[]', 0, '2021-10-05 01:36:09', '2021-10-05 01:36:09', '2022-10-05 08:36:09'),
('a0b6f03047ce8adba0f1448c194a645bac9d6b5afb96db0f1102cd887246f8fb530e75f0879a3220', 2, 2, NULL, '[]', 0, '2021-12-13 08:13:47', '2021-12-13 08:13:47', '2022-12-13 15:13:47'),
('a1d76b32afec38d85116dbe5d8444e4fc51ab20023f05917a2c306f6a82dce2474c457312c1c2dc1', 50, 2, NULL, '[]', 0, '2021-12-13 11:30:53', '2021-12-13 11:30:53', '2022-12-13 18:30:53'),
('a2905da78e9a00a74eb5095225f2909bbd8a3dbdde905b2ba43ad6eb1493aecaaee8f995aa08ecb9', 3, 2, NULL, '[]', 0, '2021-10-04 20:55:37', '2021-10-04 20:55:37', '2022-10-05 03:55:37'),
('a5a2a1012631ed07331ddd883c1d40c3fbf34edc66320673c7d6cea8fef6eff56c20d29153516233', 3, 2, NULL, '[]', 0, '2021-10-05 01:40:04', '2021-10-05 01:40:04', '2022-10-05 08:40:04'),
('a5eb6e445fd8a6ae3169fd6bf9836b0a934c2ab1db753c0a5bee5defad72f792d4aa20946e7f6a3d', 1, 2, NULL, '[]', 0, '2021-09-28 19:29:16', '2021-09-28 19:29:16', '2022-09-29 02:29:16'),
('a626956201769b1a51cdef33a9080a1d083bf06839dda3f5e7979dd71e106ecf1886a2dc17944d08', 3, 2, NULL, '[]', 0, '2022-01-13 02:15:48', '2022-01-13 02:15:48', '2023-01-13 09:15:48'),
('a720e6ef9458d8f1d71b96fefec549b5717a30e785f064f79c2c6a3d48c2df361075efaf452b9d3b', 3, 2, NULL, '[]', 0, '2021-10-04 18:24:18', '2021-10-04 18:24:18', '2022-10-05 01:24:18'),
('a736f4e5969dfab6d8ca62b001de34561faeece2f48ea751b9b5ca60555fa5ec672b465ea1aa2d96', 3, 2, NULL, '[]', 0, '2022-01-13 03:47:10', '2022-01-13 03:47:10', '2023-01-13 10:47:10'),
('a85586abf452d731e37558c5fd276187f02439d71a11717d515db62652e64af8e1f65916db35df1b', 50, 2, NULL, '[]', 0, '2021-12-13 11:37:49', '2021-12-13 11:37:49', '2022-12-13 18:37:49'),
('a92eac6d07607a2cdcae1439c068945ec53089ab0374cb56a21f096e169d9fd3f9728b4d1d3a192c', 2, 2, NULL, '[]', 0, '2022-01-11 06:44:23', '2022-01-11 06:44:23', '2023-01-11 13:44:23'),
('a9f76f8d3aec9a7bd8284456929ec1bad82b92f336d8fcd4a54ad7d52d8fdb6ae27b08666975205a', 3, 2, NULL, '[]', 0, '2022-01-20 06:05:14', '2022-01-20 06:05:14', '2023-01-20 13:05:14'),
('ab473e09ec9f496d698b672b4bb23b61e6b2cc36c90e2673d31d95558a52d09e4839e637fb24a9f7', 3, 2, NULL, '[]', 0, '2022-01-25 00:59:13', '2022-01-25 00:59:13', '2023-01-25 07:59:13'),
('acb2d39fa94d58b0dfff9dfa876f7eff68e8801b70a57ba35241a3eb083cdf445c89cee20211b1a5', 3, 2, NULL, '[]', 0, '2022-01-13 02:28:44', '2022-01-13 02:28:44', '2023-01-13 09:28:44'),
('ad01317cd3918d4c58eb52be9c37dbdd0a344196c28fc0ad88205ea3519647f9e587a6684d16b478', 3, 2, NULL, '[]', 0, '2022-01-13 03:46:12', '2022-01-13 03:46:12', '2023-01-13 10:46:12'),
('ad57a3abd5581bb8a15d401936bb0a6057f0a240aa662d888652276ef44e5cf3edb129af03738c3f', 3, 2, NULL, '[]', 0, '2021-10-05 19:03:29', '2021-10-05 19:03:29', '2022-10-06 02:03:29'),
('adafe751ebeb30f2728b21b48cbdcb6ae06e2589c99329da21f86f63153a8bd7245e40838a476c7f', 1, 2, NULL, '[]', 0, '2021-09-28 01:30:14', '2021-09-28 01:30:14', '2022-09-28 08:30:14'),
('ae6a513032d288f4206b89a372076122995d558c828d5da9f0510a436c03aafcc15006b9aaa291a0', 3, 2, NULL, '[]', 0, '2022-01-13 02:32:02', '2022-01-13 02:32:02', '2023-01-13 09:32:02'),
('aee66725be6df7c671e70668b2383fc7e7d1050e13af0289804a37c7ac7d3757f90cfd373f648d57', 50, 2, NULL, '[]', 0, '2021-12-17 03:50:37', '2021-12-17 03:50:37', '2022-12-17 10:50:37'),
('af542ae9ad5b44f44a7c8f2966a50cd5077d95fc0fdb017797dc87b838e084ba20481adf493eeedb', 2, 2, NULL, '[]', 0, '2022-01-23 02:01:33', '2022-01-23 02:01:33', '2023-01-23 09:01:33'),
('b115ca4ba30cc96563f4f7d5e56e778d17dc96b9adae589c22d316887e1225514f9d0e4419dee6fd', 3, 2, NULL, '[]', 0, '2022-01-13 03:20:48', '2022-01-13 03:20:48', '2023-01-13 10:20:48'),
('b293d4914dc3ff761d8fa655865734915696d2ca5e6b0140268bc69eb4941c8df2a2f97f38ac88b0', 3, 2, NULL, '[]', 0, '2022-01-19 01:06:01', '2022-01-19 01:06:01', '2023-01-19 08:06:01'),
('b48a2f7774fed2da1a4f75012f5e231e6756c6f388d5b05b4a3f89380dbfee42eaf933083d4642f6', 3, 2, NULL, '[]', 0, '2022-01-22 02:52:50', '2022-01-22 02:52:50', '2023-01-22 09:52:50'),
('b67555089a0f6b2fcc54341893d4adc0900f71aa7c154d3c5b6cbb3e2f40cabd29d12ea0d96c75ee', 3, 2, NULL, '[]', 0, '2022-01-22 13:35:53', '2022-01-22 13:35:53', '2023-01-22 20:35:53'),
('b6f0a4a2d809a71817c18d6de11de9adda5ce1f496efbe908bae64a71665bfab2a649105a0af266c', 2, 2, NULL, '[]', 0, '2022-01-23 01:55:02', '2022-01-23 01:55:02', '2023-01-23 08:55:02'),
('b708e0e49b3f4fab1780f5df0b424ca4a6812cf10ef80b9cc876ca9b5886dcf9f2211f95237f74fd', 3, 2, NULL, '[]', 0, '2022-01-13 03:00:25', '2022-01-13 03:00:25', '2023-01-13 10:00:25'),
('b782906fa99a77ec0ad31be85e1625fc18f88690af1c9eb1cda5ec5ea23378218fdfa16ce82123b2', 3, 2, NULL, '[]', 0, '2022-01-13 04:21:47', '2022-01-13 04:21:47', '2023-01-13 11:21:47'),
('b8d9337be4fa8e7df83930f4b49a8e60289672e6aaa8749a790469120778080b02593b9b8953521f', 3, 2, NULL, '[]', 0, '2022-01-13 02:40:19', '2022-01-13 02:40:19', '2023-01-13 09:40:19'),
('bb0c03d9e8ac09676d3b12125b2f6a0a78a16d6947abac1c00bb2381f27d2e96efc9a18edadaad6a', 3, 2, NULL, '[]', 0, '2021-10-05 19:04:15', '2021-10-05 19:04:15', '2022-10-06 02:04:15'),
('bc5186cadf4300c4798141df2e425f9bbee5c416bfab39f7447e0fd3f639d34c2776bb0fc1cc66fb', 3, 2, NULL, '[]', 0, '2021-10-05 01:30:04', '2021-10-05 01:30:04', '2022-10-05 08:30:04'),
('bd937c2087091cf578078a0157f35f062b46babd3654933471e1a1cc59ffe1c2279b4465e0ca6dff', 3, 2, NULL, '[]', 0, '2022-01-13 03:57:04', '2022-01-13 03:57:04', '2023-01-13 10:57:04'),
('c02ba6e281001f5d6c0d99c86370a64051de20cf57424a2a428e6737c365d85f3cad2b961254e14f', 3, 2, NULL, '[]', 0, '2022-01-13 04:46:28', '2022-01-13 04:46:28', '2023-01-13 11:46:28'),
('c05219a6cb097838a0c08615459ccbc2c7a1f2ea8776bf2320583c95f0c0e554c793c62c47d3419f', 3, 2, NULL, '[]', 0, '2022-01-13 02:08:31', '2022-01-13 02:08:31', '2023-01-13 09:08:31'),
('c0eeb17868ec92c080c7d266d5166af22926755126a949e00c70210e0f0afe9d54251911ffb3ac0d', 1, 2, NULL, '[]', 0, '2021-09-28 19:30:19', '2021-09-28 19:30:19', '2022-09-29 02:30:19'),
('c18afe7460dc1e95fff7bb00f71048101a841d923cb33b35116930d22982c68b4dfbecf6528ce361', 3, 2, NULL, '[]', 0, '2022-01-13 02:17:06', '2022-01-13 02:17:06', '2023-01-13 09:17:06'),
('c44044b34857882e4cea4b8e0ee6e0d3eeeec69666521ada6a8b97fa0fbd7f36e598b86b42a357c3', 3, 2, NULL, '[]', 0, '2021-10-05 01:30:17', '2021-10-05 01:30:17', '2022-10-05 08:30:17'),
('c5cb2f3234388ca52706e5f1ca9f632bb3606579f63c6a40fabd4921e01ea2ea70d8a6f6fdacc14e', 2, 2, NULL, '[]', 0, '2021-12-31 12:08:54', '2021-12-31 12:08:54', '2022-12-31 19:08:54'),
('c66667350f342ee4e920d801e620aa5516e00fbee99a8d28429ca10f42389b861aaeeb476d7d33fe', 3, 2, NULL, '[]', 0, '2021-10-13 03:23:03', '2021-10-13 03:23:03', '2022-10-13 10:23:03'),
('c667b9c60312af80d2a3bc0175fb9ae0ae46422b0cb66bda01e8d4b600b5624562f2e72a7ec800b0', 3, 2, NULL, '[]', 0, '2022-01-22 01:38:16', '2022-01-22 01:38:16', '2023-01-22 08:38:16'),
('c730372a912a441a577cb8c8c80c814efdd6926da1088c50bafcf069f9de3122f1e5d40d4a3e29c2', 3, 2, NULL, '[]', 0, '2021-10-05 00:30:43', '2021-10-05 00:30:43', '2022-10-05 07:30:43'),
('c816bf8cf78e09954e34f05e946f8edb9e6ec9f6fd22ede5f42b75fd3c4b56ced4076f8974ca265d', 3, 2, NULL, '[]', 0, '2022-01-15 01:18:50', '2022-01-15 01:18:50', '2023-01-15 08:18:50'),
('c82464d11a50f9a1c63adcbcf104d2a6c73791cd53e2d5039ebe4f43ed71f1f1429579416f25b034', 3, 2, NULL, '[]', 0, '2022-01-13 03:25:37', '2022-01-13 03:25:37', '2023-01-13 10:25:37'),
('c84dad2bf6cd248d742b46b248cb562e74b49d7ea5ea10310a9ee41c921af1b5f78562656b52478e', 3, 2, NULL, '[]', 0, '2022-01-13 01:36:50', '2022-01-13 01:36:50', '2023-01-13 08:36:50'),
('c9366423f7f3d2e0759f6800f64468e1ff87568102cd1bfc5be2f8c9c25bcf100ae663e9c9d12b18', 2, 2, NULL, '[]', 0, '2021-10-04 21:22:41', '2021-10-04 21:22:41', '2022-10-05 04:22:41'),
('c9438ffe303837ea9b148b3343a650024af88bf3fcf6dbd073b84f9d0767438832ceb85405c936e7', 2, 2, NULL, '[]', 0, '2021-12-13 07:24:42', '2021-12-13 07:24:42', '2022-12-13 14:24:42'),
('cc4fc518adcd11ff4b2d8faf7b89b513378ca3c79375663da707ac366be8d7d63048ee24f7ba91fd', 3, 2, NULL, '[]', 0, '2022-01-13 02:14:30', '2022-01-13 02:14:30', '2023-01-13 09:14:30'),
('cc89048718faea03881ac7592ecc2bad249f47a49b2ab5d9c5b7947f384694bfd0f17e23ca0a7fd2', 1, 2, NULL, '[]', 0, '2021-09-28 19:09:03', '2021-09-28 19:09:03', '2022-09-29 02:09:03'),
('ccad46bd72b5d93e5c34a092b09cca020e355e1e02930889f03c7d1682d781a305fe416377db1de6', 3, 2, NULL, '[]', 0, '2021-10-05 01:29:08', '2021-10-05 01:29:08', '2022-10-05 08:29:08'),
('ccc8525ca19a5bbfdba422deadaa686526a6069248f1af46b374cbf166bfe404f794706c8e5c9140', 3, 2, NULL, '[]', 0, '2021-10-13 03:13:39', '2021-10-13 03:13:39', '2022-10-13 10:13:39'),
('cd15c4c7ddba30a7f85a714b8cbaf97c6e13c2760c2b2ff098472b22f5b3d513e7d7e52a095c4669', 3, 2, NULL, '[]', 0, '2022-01-13 02:51:56', '2022-01-13 02:51:56', '2023-01-13 09:51:56'),
('cdc64f603c1c732a7fa98eb6d5fd795f9abb9c1cc185441796a7283b19d0478e8284d36ee4d44402', 3, 2, NULL, '[]', 0, '2022-01-14 02:52:30', '2022-01-14 02:52:30', '2023-01-14 09:52:30'),
('ce9e9ff3e58d952008e8abbc75b4c2c365d639de00f8ece0b5e54bc654192cfdf1f0d84ab6e00881', 3, 2, NULL, '[]', 0, '2021-10-05 01:41:17', '2021-10-05 01:41:17', '2022-10-05 08:41:17'),
('cf342aef4e5550ff76a7e49a0cfb31469c407cfc94239790b873100ef97d91857c40f422fe2ebeff', 3, 2, NULL, '[]', 0, '2022-01-15 00:55:48', '2022-01-15 00:55:48', '2023-01-15 07:55:48'),
('cf7da064aaacfab20e973beb759cf7801408510c3a41e31bc13b6d563ceca35e935757dc5fc50100', 3, 2, NULL, '[]', 0, '2022-01-13 02:53:57', '2022-01-13 02:53:57', '2023-01-13 09:53:57'),
('cfc6ab599e619005635e18d55ef000a2042ce847eccedfd6f4bdd20de8036eb777fb2887ad253ea9', 2, 2, NULL, '[]', 0, '2022-01-23 02:00:42', '2022-01-23 02:00:42', '2023-01-23 09:00:42'),
('cfed9fac3cfb702f7f9c0c6d458e1b5bf41ee5ba37e94c974e6398f62ab4db2268242ceeacdbe4f9', 3, 2, NULL, '[]', 0, '2022-01-13 02:46:30', '2022-01-13 02:46:30', '2023-01-13 09:46:30'),
('d02d29139d8427e3b885c0044e6b074f9a3488ddab3fbcd978f437aad1873c58cd2245eca55f6ca6', 3, 2, NULL, '[]', 0, '2022-01-13 01:48:55', '2022-01-13 01:48:55', '2023-01-13 08:48:55'),
('d076cf1d183f6ad5c1f328677b9324395b0a39718ad77bd4fe5aa236a67e0cbd164e4565e93bb1de', 3, 2, NULL, '[]', 0, '2021-10-13 03:32:00', '2021-10-13 03:32:00', '2022-10-13 10:32:00'),
('d08e658d20d97c20d7ad68f8a349ca96a5e404c12a589ae8e6f1429eaa69647e188094689252e52b', 3, 2, NULL, '[]', 0, '2022-01-13 03:52:24', '2022-01-13 03:52:24', '2023-01-13 10:52:24'),
('d14308d1fc1d2d2aace634187328ecf8e5d3bed7d6bac302cc7e82c2ae86498dcc1ef2fb38f7e82a', 3, 2, NULL, '[]', 0, '2022-01-23 01:34:20', '2022-01-23 01:34:20', '2023-01-23 08:34:20'),
('d1d3286a0010f549ba868ab8b9cd293ca170856a34abcb457807e7a58b7699c1b98f9023bd09e51a', 3, 2, NULL, '[]', 0, '2022-01-13 02:16:28', '2022-01-13 02:16:28', '2023-01-13 09:16:28'),
('d35911b96db0ed4e29f9a6bb8204e66658e7f16d65754ab4f530bb3304f1ef86ddcc8a1f4bd5740a', 3, 2, NULL, '[]', 0, '2022-01-13 03:25:13', '2022-01-13 03:25:13', '2023-01-13 10:25:13'),
('d391e716f3e9f563d83c935921a4dff7d6d8f5d2e52acd0c80c5b848cb712f0673f29744b8b04771', 1, 2, NULL, '[]', 0, '2021-09-28 01:34:19', '2021-09-28 01:34:19', '2022-09-28 08:34:19'),
('d55daa6dc32f09ca6c602434ba1408754820b31877f34e454720bcf71663c4d5b4096d98eef1712a', 3, 2, NULL, '[]', 0, '2022-01-13 04:06:57', '2022-01-13 04:06:57', '2023-01-13 11:06:57'),
('d65ca5e31843d0a9a9214e182d5932d394b4d64f3677159d8d463f98e110e0097740497077a437d6', 3, 2, NULL, '[]', 0, '2022-01-13 03:26:57', '2022-01-13 03:26:57', '2023-01-13 10:26:57'),
('d6a568a2bcb55ecbf6c0745f59fa08c5cfd51c0703339bf4d62f8a6cb01babc9c497b022e56aed97', 3, 2, NULL, '[]', 0, '2022-01-13 02:15:45', '2022-01-13 02:15:45', '2023-01-13 09:15:45'),
('d86efddec53f0d10e1a50c4c61351bba93f1f43f4e8289ae8dd97acf8dc126e4825435ba6aaabd67', 3, 2, NULL, '[]', 0, '2022-01-13 03:08:25', '2022-01-13 03:08:25', '2023-01-13 10:08:25'),
('d88217568b595c2f07630a6bdaa1195ab2a07ad5c033077cd53acb147846b9688feed6202517fe0f', 2, 2, NULL, '[]', 0, '2021-12-17 07:19:36', '2021-12-17 07:19:36', '2022-12-17 14:19:36'),
('da39902cfc10a3234ab08769bd2afdd81dec46420729d60589c0d51ad932c903d7e6facd03b1ebf1', 3, 2, NULL, '[]', 0, '2022-01-13 03:24:30', '2022-01-13 03:24:30', '2023-01-13 10:24:30'),
('da724c4c9ac460b22a7fe32caa92383b6587fd6ee24cb7217016f75e66430f1df6f7c1868d207e06', 2, 2, NULL, '[]', 0, '2022-01-23 01:55:30', '2022-01-23 01:55:30', '2023-01-23 08:55:30'),
('daa0b2fa6f7047447c1842f55cc58c93c20ee8d0cc3472d7a9b5646a2493f3b0ea71eea8f44a8202', 2, 2, NULL, '[]', 0, '2022-01-23 01:56:54', '2022-01-23 01:56:54', '2023-01-23 08:56:54'),
('db76c86dc1ce5cef4768a5968e08918c1f75bc71ab9ae35c4551ccc9a4b5b8e702a62c46d150d6d1', 3, 2, NULL, '[]', 0, '2022-01-13 04:01:27', '2022-01-13 04:01:27', '2023-01-13 11:01:27'),
('dbc0229e02d36425c9a5fcc5ff17d4ff269c099a712155da3fe0dd592bb0711b275b4a5973624a4a', 3, 2, NULL, '[]', 0, '2022-01-13 02:38:31', '2022-01-13 02:38:31', '2023-01-13 09:38:31');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('dbe7f787719affcf91e1041a98361b71d8f61b4b80c2dfdd8f736086bb54a92dd7bdf26e883270f6', 2, 2, NULL, '[]', 0, '2021-12-13 08:12:40', '2021-12-13 08:12:40', '2022-12-13 15:12:40'),
('dbf52c1a8b75d5e8fd3a87e51aa73a2372b105a9ffedd0fc733d5d90d488e9ec99e3c067ea124a33', 1, 2, NULL, '[]', 0, '2021-09-28 01:26:05', '2021-09-28 01:26:05', '2022-09-28 08:26:05'),
('dd50135f590b1944e54fe85efe0b4b4a7d835059d6cd2dd4f40a1a89123c553b5f8948765771616b', 1, 2, NULL, '[]', 0, '2022-01-14 03:17:04', '2022-01-14 03:17:04', '2023-01-14 10:17:04'),
('de1a2ceeb37dbd1a96f8ab3f85a67f40a1406d00f7292415e9d4d0ff07028c920199678a35c0ac70', 3, 2, NULL, '[]', 0, '2022-01-13 01:36:52', '2022-01-13 01:36:52', '2023-01-13 08:36:52'),
('de9177ad6a3da39476b92c4fd841b77c188f8fed30a931fe874b498691d43b7ef59886e6d1646ced', 3, 2, NULL, '[]', 0, '2022-01-13 03:29:15', '2022-01-13 03:29:15', '2023-01-13 10:29:15'),
('dfea0a3e697ed94a5d9511a06ee6c082732bc763c692536d332c1bc1ec7b7637c861306802b2ad6c', 3, 2, NULL, '[]', 0, '2021-10-05 01:45:01', '2021-10-05 01:45:01', '2022-10-05 08:45:01'),
('e12a8fa03be12bc5613c259b3fc7048c4196c41b09ac20e367201c01c54a62c77fde3da8f9d32a04', 1, 2, NULL, '[]', 0, '2021-09-30 23:04:38', '2021-09-30 23:04:38', '2022-10-01 06:04:38'),
('e248ef41e25240836ca389d9529f54a5e42006b9d2bfedcd972dacf99f2e1f74db1653ad6ad8ed66', 3, 2, NULL, '[]', 0, '2022-01-13 02:48:29', '2022-01-13 02:48:29', '2023-01-13 09:48:29'),
('e2722156b6e047c7e44e5dcabfa4ad4b2aa25e92b0b158e69ae63d5a17d646e3856d96bc50bb2299', 3, 2, NULL, '[]', 0, '2022-01-18 01:44:18', '2022-01-18 01:44:18', '2023-01-18 08:44:18'),
('e296a7b3790ae4a8c68caa54c6e516a5d2aaa0f81404ad021f3dcd1a7bb0e76bc17fc85f02db17d7', 3, 2, NULL, '[]', 0, '2022-01-21 08:58:24', '2022-01-21 08:58:24', '2023-01-21 15:58:24'),
('e2dd7bbd96cf426257ba23d805399cf01a84ec225be50ae0fdfc1940cff3d94cd642aa7280e0d34c', 3, 2, NULL, '[]', 0, '2022-01-13 02:13:29', '2022-01-13 02:13:29', '2023-01-13 09:13:29'),
('e3870cfe87c6977e15afea1b3b04a2719bbebcc7e3c3f39d40fe452648e1030cca708df8a9718718', NULL, 2, NULL, '[]', 0, '2021-12-13 07:58:37', '2021-12-13 07:58:37', '2022-12-13 14:58:37'),
('e402d8e8aa3191914c926de3e75ba73f1b984e7fe8e879eda972bedcf368f1bfce741b8060c8e0f9', 2, 2, NULL, '[]', 0, '2022-01-03 03:09:08', '2022-01-03 03:09:08', '2023-01-03 10:09:08'),
('e4825acc1d3bb2ce0362372dcc0190175fc1aa60ad7c4bc2adeb7bd9dab7b246f3e478977620b6a3', 3, 2, NULL, '[]', 0, '2022-01-13 02:58:49', '2022-01-13 02:58:49', '2023-01-13 09:58:49'),
('e4e9e3d8d7178af78e4d49f2557ccf0e255600467d330ae44f3f34682ae96b00c40b52c3c7eb824a', 1, 2, NULL, '[]', 0, '2021-09-28 01:26:44', '2021-09-28 01:26:44', '2022-09-28 08:26:44'),
('e54be4045ffa2f94059bf3b23667f380a420da5caeeb8f08fa8336d61a2b0374cfc7c9c63605b15c', 3, 2, NULL, '[]', 0, '2021-10-05 01:39:34', '2021-10-05 01:39:34', '2022-10-05 08:39:34'),
('e58c2352092a4e4aa08ae6306584e93e326b8fa02fde271e5679e1eeacf041193a2e3624cf6958ff', 3, 2, NULL, '[]', 0, '2022-01-13 08:13:09', '2022-01-13 08:13:09', '2023-01-13 15:13:09'),
('e82ad046ac0c7f915162908a1528331794af8f769bc90d526a157688c8dd2d4392d90e2adcc33cac', 3, 2, NULL, '[]', 0, '2022-01-21 03:39:49', '2022-01-21 03:39:49', '2023-01-21 10:39:49'),
('e8c9a5828d6e3c429eedf3c602a806af7e87879f9439665da5dbadc30511dc802ebe56b32b12cfec', 3, 2, NULL, '[]', 0, '2022-01-13 04:00:16', '2022-01-13 04:00:16', '2023-01-13 11:00:16'),
('ea2d01919189e08271f56fbfe3b9c80d1a1e7f812f8d1f293a88c2d552ed3bd896ead1b0abea0927', 3, 2, NULL, '[]', 0, '2022-01-13 02:15:48', '2022-01-13 02:15:48', '2023-01-13 09:15:48'),
('eafa84cc97becb43ea5deb86cb165debc14818e4a45c23aff7d1cffd81f974723e422f72fc625e6f', 2, 2, NULL, '[]', 0, '2021-10-04 21:22:23', '2021-10-04 21:22:23', '2022-10-05 04:22:23'),
('ecb64e2a4c5b3698a3ff0136e547b3dddc385d718f2612ab072673c6571d0395bfa3f2579fad14eb', 3, 2, NULL, '[]', 0, '2022-01-13 04:09:35', '2022-01-13 04:09:35', '2023-01-13 11:09:35'),
('ed00731de266c90a6345f5c2c5af15bb3cb6940ed77db42e057365465a4152dedc5119b33a602248', 3, 2, NULL, '[]', 0, '2022-01-13 04:30:34', '2022-01-13 04:30:34', '2023-01-13 11:30:34'),
('edb361d3061003d92385c089682995430ed6e10dbf19c663ee25933abc9aef261982e324ffab6e9f', 3, 2, NULL, '[]', 0, '2022-01-13 01:36:53', '2022-01-13 01:36:53', '2023-01-13 08:36:53'),
('edc364c71c0f718764d7a88860f8ff8057ded70e519be0f604c114ac5b4ec775f5cb01116bde4460', 3, 2, NULL, '[]', 0, '2022-01-13 03:03:11', '2022-01-13 03:03:11', '2023-01-13 10:03:11'),
('ee963bbb675458fd6ca3dc171522bc194b35bac1e7c77f65bdb82d486ce320fe565615b500d8ac70', 3, 2, NULL, '[]', 0, '2022-01-13 02:13:14', '2022-01-13 02:13:14', '2023-01-13 09:13:14'),
('ef444621c962201e07276f91a5d94478efbc6b7f933e39299e9db9e4101a1a2f9283c292e09aa037', 3, 2, NULL, '[]', 0, '2022-01-13 01:23:15', '2022-01-13 01:23:15', '2023-01-13 08:23:15'),
('efec00ccf321e4dc6ea1a42ce7cce55cba2f2baa513f53e2ed44165046063438e1725178db28f6ff', 1, 2, NULL, '[]', 0, '2021-09-28 19:12:35', '2021-09-28 19:12:35', '2022-09-29 02:12:35'),
('f06c80a805e2c14c0667f85b7044a05747eeff3d51b27811a4c1cdaa04e37ed611cd2c9aa499a0dd', 3, 2, NULL, '[]', 0, '2022-01-13 03:14:18', '2022-01-13 03:14:18', '2023-01-13 10:14:18'),
('f0aa38719bc0682e6854a015566f0a3cf441356e6c433172c2b453f1d83147b4ced45decef0851f9', 3, 2, NULL, '[]', 0, '2022-01-23 01:35:19', '2022-01-23 01:35:19', '2023-01-23 08:35:19'),
('f3ea85b1c5b51727e090f35c74aece4cb5355c075aef5b74241fcaf542be746dbf16cde823eac24c', 3, 2, NULL, '[]', 0, '2022-01-13 03:59:35', '2022-01-13 03:59:35', '2023-01-13 10:59:35'),
('f417d07e3fd337caec8ccdb66004a0d7074051614a3c3ad693a256a0ed50c809cfa663d01ee1cc76', 3, 2, NULL, '[]', 0, '2022-01-13 01:40:05', '2022-01-13 01:40:05', '2023-01-13 08:40:05'),
('f605bdfb526ae6e4df5a2da8c3018c0a66917add6ddb940216f8f9f2c1668b2f5f9bf018a820bf94', 1, 2, NULL, '[]', 0, '2021-09-28 18:54:37', '2021-09-28 18:54:37', '2022-09-29 01:54:37'),
('f68580e02eac23dd9426c65461ddabf08f9ad1b031e1eb6f677d323425a6f7a1ad446944e7ab203d', 3, 2, NULL, '[]', 0, '2022-01-13 03:57:47', '2022-01-13 03:57:47', '2023-01-13 10:57:47'),
('f7401128eff4d40dcb05d29070c5b608b2e07ed7b7f079df0d83160d8f7b9e95dca4d49252656bc6', 3, 2, NULL, '[]', 0, '2022-01-14 03:18:27', '2022-01-14 03:18:27', '2023-01-14 10:18:27'),
('f74864c5d0f5a56c587a62e134f3df225e5b64546e78e47740cd6c9d9d0e954101f449489ab9e47a', 3, 2, NULL, '[]', 0, '2022-01-23 01:37:00', '2022-01-23 01:37:00', '2023-01-23 08:37:00'),
('f877435f1a28bb589ab968b4ef9915fe36e2d511298a8ce3139c6e198b9b05f57ee92622fc66ff01', 3, 2, NULL, '[]', 0, '2021-10-05 18:55:02', '2021-10-05 18:55:02', '2022-10-06 01:55:02'),
('f8935a3943673d4a2e394f82b3a69d27c505efef32a120f3b8847c3300e0905acbcbd5128ee49f32', 3, 2, NULL, '[]', 0, '2022-01-19 04:48:35', '2022-01-19 04:48:35', '2023-01-19 11:48:35'),
('f8c303f7f7fcbb10a9a46da14590bba2bd812a413aa34656f8ce6ce1c5ff042347cff4ebb6d3b0f9', 3, 2, NULL, '[]', 0, '2022-01-23 02:00:07', '2022-01-23 02:00:07', '2023-01-23 09:00:07'),
('f8db3b61c8760347a6f2114aaa731c4ff437b849579bf2ec143b2d56ddff8906b057ede327794ee3', 3, 2, NULL, '[]', 0, '2022-01-13 03:54:30', '2022-01-13 03:54:30', '2023-01-13 10:54:30'),
('f8f5d109855dadca6ad581e78bd0c91ea12979f0c2e9730889f34a5212a73fa634ba9edc983927ce', 3, 2, NULL, '[]', 0, '2022-01-13 02:43:40', '2022-01-13 02:43:40', '2023-01-13 09:43:40'),
('f929a813b12a61e65a53679d0fef392c8bcc0e712a937c102be0e54485242316c362689d83dd3a5f', 3, 2, NULL, '[]', 0, '2022-01-22 02:28:36', '2022-01-22 02:28:36', '2023-01-22 09:28:36'),
('f9c4ba9b7fe9bd2f7e47f6eb2950adb8221fd4a5f454688b7071dd1257dda64cc0b9f5d4088d0d48', 3, 2, NULL, '[]', 0, '2022-01-13 03:49:39', '2022-01-13 03:49:39', '2023-01-13 10:49:39'),
('fa82077c1cce2ac38a8b47a2f6ebe7fd09557195cda1457e88a85ee4cd1cc266809df93a986c68da', 2, 2, NULL, '[]', 0, '2021-09-30 21:00:33', '2021-09-30 21:00:33', '2022-10-01 04:00:33'),
('fb420ebbcea441d0eb29510073c652e9d4da198cde0a7fc5bc80ecdfcb165b90cbae30df4c02c43a', 3, 2, NULL, '[]', 0, '2022-01-13 03:59:03', '2022-01-13 03:59:03', '2023-01-13 10:59:03'),
('fd448e787436333fd8dcec66595d47dacbb617811b336d2746cd3e478c2d12cacf9e0f5c2e4d3d27', 3, 2, NULL, '[]', 0, '2022-01-13 03:59:00', '2022-01-13 03:59:00', '2023-01-13 10:59:00'),
('fdb346dcaa89576eadc6c9c90d883895fb3a3b135d249def8385e90f8c4424fb0723ef1b4d2b3771', 3, 2, NULL, '[]', 0, '2021-12-17 06:42:36', '2021-12-17 06:42:36', '2022-12-17 13:42:36'),
('fedce9590227840da349f796e623e463fe191f23497d86da3f3ee0ac84b93577a5793cda706e93e9', 3, 2, NULL, '[]', 0, '2022-01-13 03:22:24', '2022-01-13 03:22:24', '2023-01-13 10:22:24'),
('ffd0193f1674ba463b72e3dbfc2b9cd9725faaae5746e3edf635ea22e05d768214bc96240e29df89', 1, 2, NULL, '[]', 0, '2021-09-30 18:47:52', '2021-09-30 18:47:52', '2022-10-01 01:47:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'chTxiTZVDBoa0KI8HgNpCDg3vbqI5S8QG4bC5cpJ', NULL, 'http://localhost', 1, 0, 0, '2021-09-27 21:26:19', '2021-09-27 21:26:19'),
(2, NULL, 'Laravel Password Grant Client', 'N62KQsBzDyc4npIW1pIMkBRygQgRuyyNxas0P3PK', 'users', 'http://localhost', 0, 1, 0, '2021-09-27 21:26:19', '2021-09-27 21:26:19'),
(3, NULL, 'Laravel Personal Access Client', '7fUnwRRLHQNs8FahTKZ9hh5s1fFTvgE7rHEDjtX0', NULL, 'http://localhost', 1, 0, 0, '2021-10-01 21:27:01', '2021-10-01 21:27:01'),
(4, NULL, 'Laravel Password Grant Client', 'hzX7hxbZQr8rZ1M1EK0wAccBT1Vw9RQZaTfaJzg4', 'users', 'http://localhost', 0, 1, 0, '2021-10-01 21:27:01', '2021-10-01 21:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-09-27 21:26:19', '2021-09-27 21:26:19'),
(2, 3, '2021-10-01 21:27:01', '2021-10-01 21:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('019e2b6fb175a15f1027a2c8ab57b4db5a07e38355f83db81b585bce86d2f9acba71b2383fd9e4ea', 'd1d3286a0010f549ba868ab8b9cd293ca170856a34abcb457807e7a58b7699c1b98f9023bd09e51a', 0, '2023-01-13 09:16:28'),
('026f21944791bbee5c787678c28cfba30fe00b32225cbf3c137455bc4dcbe04d66cd962c48e082d7', '69ffca399b2473cff23910713377733f0df284f9e98ffb3504b2726faf75f24e4608b540673735c3', 0, '2022-12-31 19:07:36'),
('02de212e0dde6bbc35b3b45f68ebfd82f18b9f51414dbef49e9de9ea67f1eadbfee0a42c795d2f32', '13e29324146feb5f16efdea4b29aaddf2c9debc1f68404ec3a75b7b64d2cf1e79a4470e2b5010ae5', 0, '2022-09-29 02:08:57'),
('03a933b6b8c777836f2d982ff60fed6ef834b55e8119346f71590b01e5823de70c0662c8e4a7a224', '01f2202bdb81cb50186e0060809075c9c9254f166052eabadf270bab9ac6ccf3f28626e0e356a0a5', 0, '2023-01-20 09:50:14'),
('041a1321bbaab0ce98bb77264fe7d091adcab1925ab237a652686a3bd28c28ad2ad92f78d159492b', '880c85ffdba4813677764c5e17bc8a62e8d99c7fd68faa30d45ea1b228e76848faa61e8782a2c5ef', 0, '2023-01-13 10:45:29'),
('04abc548781a1992ea70147b86829feee564ece864b68d16c62b7ebe6cdf6bc201fab6d7b7283ddd', '87077394001418050ed626cd5ed07e2ef2536b22a5c17dd61abd60ded8f0ba1c3e6098f6a6966278', 0, '2022-12-31 18:31:32'),
('04ca42dfe9a9a011133e87c29029f57a041b48d1a8388057affa9ae7d3b99fff42bf4cd169867616', '3c4e287320d369d514b2111196b7db462dae3d1246c034ddf7afed9703a29b686f89a4ce339267e3', 0, '2022-12-31 19:10:24'),
('05b3dbd33648aec0ec0245c0389bf689631a6c1286910d307060604ce268218f2ca4ab1e06cdc271', '8763b7330501170a1e6433d454f64666f9c1701b05d694eb8e5dfdb1cfa5275c67927971bfd0c80d', 0, '2022-12-13 15:14:28'),
('06e8d171b2439e09a9c78b7518621d521292784a5b636be6dcdf7900234c37350a717a1b6055e104', 'cd15c4c7ddba30a7f85a714b8cbaf97c6e13c2760c2b2ff098472b22f5b3d513e7d7e52a095c4669', 0, '2023-01-13 09:51:56'),
('0714682129de85817a29a4fb072b4840195c4e56fbc4e14620788c7f588bb889529307cde09db6fc', '5ee680eaf8519fca986d0b0474212200ee2b553d2a7b29cf6ba29b3f5fd7d5b2cea785e3b968cb71', 0, '2023-01-13 09:27:53'),
('07ca7bff8bdc738b23689ddf6437e67160fc95195a44f1c4cd602761235c4fdaf3fcd033dd8115cb', '5d8a16031a42a555d13eddd48944a604411f111daa131ce41e940da71b3b1d00024cb549a713a940', 0, '2022-09-28 08:32:14'),
('0a342d41f453e9f651210d863fa791477142c388ea36af122819294975394674e00427edb96b2abd', '2ced7b95a31ed845515ef7950e84b52cc19504ebbd39bfd2c912a4d7abbb73f992e398af611d9b70', 0, '2023-01-14 11:15:49'),
('0a9b6794e76f0f0796f6f4ff27bc81bc964c78b3689fbd96f961e809d8b309cea5a484aba0a6494a', 'ad57a3abd5581bb8a15d401936bb0a6057f0a240aa662d888652276ef44e5cf3edb129af03738c3f', 0, '2022-10-06 02:03:29'),
('0b2d9b5d8e1c3d3973b17946b3f945b147c20b6dff2ed1271ccfb46a6c9e156845ee47de0b7bb1a1', '2c8dfc771a55cb42b26d85dd1064019fdd9ab1db8d323b8d3e5e8ef5a91b989cb40bdf69f15f8e2a', 0, '2023-01-13 08:36:52'),
('0b7b28c20c51876c9b2b1e5a6d1bb3c52b9ad8c9f220ed3c3b43af452ec50f21c8731f2c3570d04d', '32d570ea660858afc6e931bd0d3d0209da8ab19134d10d0c5794ef54f69f4f9e68231431f38f164b', 0, '2023-01-13 10:04:23'),
('0c03ebcb261b9ac54fcf587e1621c9b4cda871fd7a1c6e8b677e10c762f689bc416b73646f875d69', 'f877435f1a28bb589ab968b4ef9915fe36e2d511298a8ce3139c6e198b9b05f57ee92622fc66ff01', 0, '2022-10-06 01:55:02'),
('0c3a443ff71182c84aa1b491575d877602c007d8e570975e678b2c6736253f4804ed31eea3a803eb', '771d98a9640c1c28c32078d88b80320acd68b602f8fc6e6327f672346303660640a45bfc94283844', 0, '2023-01-13 10:59:48'),
('0d10f141670330893ea4dd1fecb79741a381a596a59af50df721b1cc52c30b73e5c47f5fb5044478', '7787eefe7ed1d2212b6def842e747519dbb391a2d2abf348411e1007377b031a882786295c2665da', 0, '2023-01-23 08:37:31'),
('0d86dd57d77f37f4f51a0ac022b8b72315593e0d4d3caffeded603225b2a70fc00e49d12b0c2c856', '45686e91e8d49d92ff163a2314a055f7a797033afba5fcd2924fd4ae652e3e0b4ee72e873ae659c2', 0, '2022-10-01 04:00:15'),
('0daf505554adcdfd2430ea0b1a9509540c089673c8d91c55be942869c918c3ea8feb275ceab313a9', '6adad9e1bb85ec963eb668cc8875c7f8b8ac1cf5f79c9a3a5f82e901f10a3effc0c79efad2b95852', 0, '2022-10-01 06:08:16'),
('0e4b2294c0c4a254c13ceb8156170efe602fdc60fcabdd7a5a0e4d1b70917a09b9d0b121f088989a', 'edb361d3061003d92385c089682995430ed6e10dbf19c663ee25933abc9aef261982e324ffab6e9f', 0, '2023-01-13 08:36:53'),
('0ea038d6a7d750d929f71fd8f65dd2a07e1210481bcf001a894d421bf9658a1fdc3cc05d78323757', 'ee963bbb675458fd6ca3dc171522bc194b35bac1e7c77f65bdb82d486ce320fe565615b500d8ac70', 0, '2023-01-13 09:13:14'),
('0f3c3b3511b77d64ceedf503c5608da80d7f271f124440c9782c9e84b673e0993e0850eedd85e76f', 'e2722156b6e047c7e44e5dcabfa4ad4b2aa25e92b0b158e69ae63d5a17d646e3856d96bc50bb2299', 0, '2023-01-18 08:44:18'),
('1165df1eef06fc086bec8f302c69eee6c98fd5854058d5dc99d9cfbb0563c20a485e0d5dd725032c', 'ccad46bd72b5d93e5c34a092b09cca020e355e1e02930889f03c7d1682d781a305fe416377db1de6', 0, '2022-10-05 08:29:08'),
('12b4f1c88e1d4aa98ba68b15391b4a0291a9714b12accc562ba09129c485aab0b2bdbf1ecaad62ee', '790c4bd472624495ac2374ff8c2d6ddc268acb1ea7f9b9140ec1ec7fd1e377c37bb4d971e145d6f1', 0, '2023-01-13 09:54:04'),
('142791eb4f66a905904325553669560a07f36868361faf064e0484fa5a3bcf982a2f33c4a97275cd', 'c02ba6e281001f5d6c0d99c86370a64051de20cf57424a2a428e6737c365d85f3cad2b961254e14f', 0, '2023-01-13 11:46:28'),
('145abdbb9f117175c9c041587902c00effa5e0bae8cf78d56bfb949208895a12b9e953a1fefa8425', '0146b37caa664416be5e6f6f1727beba72b00830fe3af1954b9f62b26c585d400660d6928ff8c9df', 0, '2023-01-13 09:48:24'),
('152ee1a96d354320e1e86568fd18c1b130e65cf6567553b9a611c9ff87d52dd96e2d6087da5f99d6', '4f6193120cd34797c68a0c692ca182870ffb86139d2bf90c7576f2ef3a6f9eb83960563d18272832', 0, '2023-01-01 10:35:33'),
('155d097892965ce88aec2b01df5c00d02911ad4fcb4f24557a85efccce539681c04d68c83d04ed53', '1996935eb04bb12d969af3401f647f647e11ca507791ef6d48b05c7316471ae40620be797d2be3a7', 0, '2022-12-13 14:23:28'),
('15c214c4e4e5c2ef64aa3f0602aee82cc4c751984f57f1691da9191bb997ecf6965a52ca426ab90f', 'b67555089a0f6b2fcc54341893d4adc0900f71aa7c154d3c5b6cbb3e2f40cabd29d12ea0d96c75ee', 0, '2023-01-22 20:35:53'),
('15c2170a04db1f2da8062ed084aecb31467123dd6b3980f79358b5530f61edd43ea0be10fc780a71', 'edc364c71c0f718764d7a88860f8ff8057ded70e519be0f604c114ac5b4ec775f5cb01116bde4460', 0, '2023-01-13 10:03:11'),
('15e61c4d6d5dc07429f2eae0f7cf57bfcdb256cb31d9e94906fa1236b15c3d9f4a86d72a6a2bb691', '43f81d9886148251daf5d7d8a6ecf0b9b6bd2f193c54eaa348c906aba77824feef614a1e920478d7', 0, '2023-01-08 16:24:31'),
('15f3e28e575830c90663768224ddd14778b65065008a7c455345363c80290a21833411a59dfa12e9', '3d6e624265b6c7a1c3affc993f605962f4fcbbe00ff65e48c7ab04d5651d9a23778a55e6c228a5cc', 0, '2023-01-13 10:18:12'),
('166900b64f081c65cccdf2fbcabe3efc0d0f7d33dc924f6ac8c4a7430481da6732fa701f5d590f2c', '755c3bbf5bf3f33767199f7b5876d4fc7a517e5a41d67c0b3ec1961eaec06a57362afbfa3e8ba49c', 0, '2023-01-13 09:52:25'),
('16d143ff3212215c580533988a4284a432931969cdd045201933a0253803bcb6057818ccc881b0dc', '5ed90da8e42739c35d9fb466578123d125c2ab7617faa888f66e1bc5db6c9270a397f32cb10c44a7', 0, '2023-01-13 09:10:54'),
('17aef2b64fad3ad11567f52c095c0d3cf17bf9964cff69a92dfa3fc9402a6c7a4458b8849daf656e', 'd391e716f3e9f563d83c935921a4dff7d6d8f5d2e52acd0c80c5b848cb712f0673f29744b8b04771', 0, '2022-09-28 08:34:19'),
('17c6770d1fc1ebb46e43a32000557e2896e1cab4fefbd60a66c504714c9dbd1b7efd75d8d6db61d4', 'e54be4045ffa2f94059bf3b23667f380a420da5caeeb8f08fa8336d61a2b0374cfc7c9c63605b15c', 0, '2022-10-05 08:39:34'),
('17d6414a1c74e396d579f041ad8fe6050cf8740687a111dc6a28dbd175f3d6f8452544f5822d7c7c', 'a92eac6d07607a2cdcae1439c068945ec53089ab0374cb56a21f096e169d9fd3f9728b4d1d3a192c', 0, '2023-01-11 13:44:23'),
('1c4034233970089fba3b851d890f2ce4fe99d79835c75093ed8781bb5a4d69529b1da6e9400751e4', '57cf9418d32e62db7d7376dcf89edadbd004fd547cd9d940b10530cdb88088992c631ce13039feb3', 0, '2023-01-19 13:44:20'),
('1cb6ed9c3ef31e50995f843c590a9fd8a1501af717d8233558f42a65f92cb7f6542c095c63153103', 'b8d9337be4fa8e7df83930f4b49a8e60289672e6aaa8749a790469120778080b02593b9b8953521f', 0, '2023-01-13 09:40:19'),
('1d1b94e3e71611c497fe8ef169c29e798f863e0ca7c65f99403605b80413de4784e793d0cdaf1fd7', '2e8f2efed62cb4ec5d01269954cef8c06bd08efc88ea280aae08d1ea1857a2509ccaf0d8f8646f3f', 0, '2023-01-20 08:34:21'),
('1ebdb6bd9b5e0cd85b5a0daedd176e7a532359768fda33b9d471ad9a0287d263b051d88a5468ad24', 'b115ca4ba30cc96563f4f7d5e56e778d17dc96b9adae589c22d316887e1225514f9d0e4419dee6fd', 0, '2023-01-13 10:20:48'),
('1ed9409553f60c102d09f6bd21829a668e50681b5c2b0eb6ceb38813cb84b2661208c32f89f4a3f6', '40eee0497fa356d8999f6ae3203a338fd20438c66860d4f4f1e7e2e0c2a50bc60883014b0f2b0cb7', 0, '2023-01-13 11:50:41'),
('1f073b649f3d3146671b882c12e277a103c9ead7488a67433a120e4bbf8832e6e145ae2e9fa872bc', '7b071eef90f10c6b4109b49639ed578d4ca188dfa725460f13c9ba3855e57a8075f16c6596f34ea4', 0, '2022-10-05 07:36:00'),
('1fced6768fa208059b7dbe901ac2a1d38cb36e117b21f6c045a93dce28b53f25d27aa9b085b20257', '359759e8e73e707e4a0f120115777866e3eea6cf80df33673f18484db1edc627beb2c1df28c2417f', 0, '2023-01-13 11:16:03'),
('229278fc6b43ccfa59b4b0afdfef9c0054febaa9bb899460e8051d9c71f9370571e25900552cf072', '518ed3179f20c74e9e0e7a41db0a6bd6b482c973b8db594a0f9addc09ed9593509a674adab9db997', 0, '2023-01-20 09:44:54'),
('22ad7e6aaedd7b974325df4aacfdc99b0d6808956ad50154bac86285f429d0e7aa5868aab2072a0e', '1c9ce5228662a1b42e30b617427b85ec3ab8abfc6964c9fa8a4328c2f738cf4499e63d6baf780ba7', 0, '2023-01-13 11:06:33'),
('23c0079730d95a3351e7bd1eefe460afa0304afab6a2245ee82ada0fd652ee42b0a5b4401096e105', '395f035a2b7db86d56e95666e2fc7024cceb95cf01d24056062dab5826d6cda72deb853fc819bbac', 0, '2022-10-01 01:35:47'),
('24177902b8e5333b2195e9edf955568d8dfec8302ad48f52597da8136ce4a5d68632b26e338102b8', '8711438d519947c74b4fcd78c5caf0f0490dfa785e06d024675a40bd5097f953175ffaaa937d0ab5', 0, '2023-01-13 10:23:05'),
('25232077309d4105623d45f85e38b185bbc3b7eec0475c31cc745f08129fd1df2901a9f82d08c2b5', '43818df7484f582a4702f1903a8da3665b8baefc785e60255fb7271cd5ced65c08261ea3ee317748', 0, '2022-09-29 02:04:38'),
('26121ae1a1998d54864a64317f65e7c6ca7750fae8b41e4baaf05d634c6fff3aa932bdce447e314f', 'de9177ad6a3da39476b92c4fd841b77c188f8fed30a931fe874b498691d43b7ef59886e6d1646ced', 0, '2023-01-13 10:29:15'),
('277000c09c34765ae3e1030a0226d8d96ad753fbac1426f89e3ef2469535c4c13de44af39d23751b', '9a6b8945ac42a5538e306609b6bfb6c8fc0c811da8682e31bf1ab226e5a1a56187fe617d269d5a11', 0, '2023-01-13 09:59:00'),
('27b6607ab05b4c8b0e9a86ee39e920dbe263d0005a0c1f9ef6a8efcf04622f4d0101338a848022dd', 'd14308d1fc1d2d2aace634187328ecf8e5d3bed7d6bac302cc7e82c2ae86498dcc1ef2fb38f7e82a', 0, '2023-01-23 08:34:20'),
('29625769236bdc67bbe9ec8d07cc0da34d86c45587e9af7b76c77eed9c271bbbe0853e525947ac6a', 'db76c86dc1ce5cef4768a5968e08918c1f75bc71ab9ae35c4551ccc9a4b5b8e702a62c46d150d6d1', 0, '2023-01-13 11:01:27'),
('2a08ec531b5f5489b1f9d4b77aa0c5ecc5f82fca731491de7b335a33582ec33c5b8f54d9f7f385d2', '1d46ba991d22710e81a2c280e050d3ffa0d6ab7e66436b6217a636f92d31e1d61b282c5ea4642448', 0, '2023-01-13 10:58:56'),
('2afb2f214f33879907a85cca1b37212f010816fd1380c7e6b106252f99c040503221714705613fb8', 'af542ae9ad5b44f44a7c8f2966a50cd5077d95fc0fdb017797dc87b838e084ba20481adf493eeedb', 0, '2023-01-23 09:01:33'),
('2b296271dc1d713ad81efa50d5fb4a51236e848232010886ad35648e4ac9072d293f9706c8a150c2', '3f6d8a54557bc3389895f27e4ce0d68333b6b90e30446e3afde17ba9237fecee7d74a1dcd5441ed3', 0, '2023-01-13 10:59:51'),
('2e8f791bc6cf930d48ed8db3082593699e966a08283b5c80231a53833bb20218bc73f3216fee5ed5', 'a9f76f8d3aec9a7bd8284456929ec1bad82b92f336d8fcd4a54ad7d52d8fdb6ae27b08666975205a', 0, '2023-01-20 13:05:14'),
('306e68b53d18a01ce4280bcf7a6415964eb513b96deb11e12d39bad6cb857f13975ba1388deef8be', '95796fa42b5d50b788a4889a9108b57c649a61c78a7780d53216c7cdd289113a52a50c83f1662f9d', 0, '2023-01-13 18:29:48'),
('31840b32bda9434461425dc832f44714c6d98f591199ed422b524aba327b76a8362b772862dbf6ca', '4cc78d6e0229c5b7c011bc5dc09215f5208d9ee5f68814fffd13439fcbd722f431ded7f2f23e61af', 0, '2022-10-01 01:52:14'),
('31c4a8c4042831c2979b87610d83c29b58e47e15149d1ad1e00aa4f7feb5bf8ae3078a83745e2857', 'f68580e02eac23dd9426c65461ddabf08f9ad1b031e1eb6f677d323425a6f7a1ad446944e7ab203d', 0, '2023-01-13 10:57:47'),
('32517b5a19b4edd9b08e775bdbc2c98e1bc6db8e9105b39679892132305b7efb1f47afc39743ec05', 'a85586abf452d731e37558c5fd276187f02439d71a11717d515db62652e64af8e1f65916db35df1b', 0, '2022-12-13 18:37:49'),
('332f7ccaecdf51616be1a4297224f76fd6299d345c3cc364ec0e7a0577d054db66924b659c6a9707', 'cc4fc518adcd11ff4b2d8faf7b89b513378ca3c79375663da707ac366be8d7d63048ee24f7ba91fd', 0, '2023-01-13 09:14:30'),
('3371231a8d0c744cbe3df33bab73e87dd8b9eab3d87f30791bf060dfb16ad47657a7e1e87453ddb1', '9cb1651976ca2d6819ee3a02566dd673973a4e31156ba210f8feb4adf2b574d7c3f5c5648ad0018e', 0, '2023-01-13 09:15:46'),
('337fe1ebc7e43389c92d470cd7c293dc46868d122806d27457e95943b791ebb626536605c2e33ad0', 'a720e6ef9458d8f1d71b96fefec549b5717a30e785f064f79c2c6a3d48c2df361075efaf452b9d3b', 0, '2022-10-05 01:24:18'),
('33b27e37ac794fe62df5e5e807573a7f1b5b09fb2324915015356e2ff4629c4d77b607cf586b3e0b', '991c602850f6ec5b980af524da333c1b9c8174ec431ac76eb0c21ac639b5106e6e17a49ede31733b', 0, '2022-12-13 18:23:44'),
('34541f652c254daed312c0638a2cd4c9747977a293dc78e2a01b03cb948b010d1aa8e2eabce1cdec', 'eafa84cc97becb43ea5deb86cb165debc14818e4a45c23aff7d1cffd81f974723e422f72fc625e6f', 0, '2022-10-05 04:22:23'),
('34beaf217801bd5ea0c5b90181469acd2eeed4ee1e94faa2f44fa310354161643794119b80e73cb5', 'c9366423f7f3d2e0759f6800f64468e1ff87568102cd1bfc5be2f8c9c25bcf100ae663e9c9d12b18', 0, '2022-10-05 04:22:41'),
('34d60a1ecdc8847ddb1bc6d4e1c8e81c4e53331c808b42c0b6950d0cd59288b718a5101931800af9', '45bdbed0a944b0e3693328ec70ea4a2318edf56553d94bdb96d90c127416aa3f637a012c83cab33a', 0, '2023-01-13 09:41:42'),
('35a3deb234125136a8db4d06bf64b3cf5c953518e51518bf6a39d59367fade1614197da3f99e8ba6', '112497d2bedc793006bc233558acb46539d8142258131e902b52cbe2dd975674bd5d6b011bd79af7', 0, '2023-01-13 11:00:51'),
('365d832c627c5d7112ff11195306685dc8c350da0c0f420b5bcb9a20a9b6914c5f2a4a72f021cb43', 'fd448e787436333fd8dcec66595d47dacbb617811b336d2746cd3e478c2d12cacf9e0f5c2e4d3d27', 0, '2023-01-13 10:59:00'),
('3b2fe7b2dcf0783e6d5aa0e8ba714f3e7e87ba3aad01f07aa178976b07a3ab0fdfdbc019a153cb40', 'cfed9fac3cfb702f7f9c0c6d458e1b5bf41ee5ba37e94c974e6398f62ab4db2268242ceeacdbe4f9', 0, '2023-01-13 09:46:30'),
('3b84078deb4510ee4fc50e144a25ab19574adbd1824afda483e7a1f1a0117f44929493f523e2b0b9', '2ae50434949d2cfb9c3daff6c793294ccfc7ba4e91f7723a5d83a118f820f1c83566f6b9fb558354', 0, '2022-10-02 04:43:26'),
('3bdd1e84779d62219d23831138bcae31ba726934cb1ef99fc5bac901dd8dd0173362317ad7dc20ce', 'c9438ffe303837ea9b148b3343a650024af88bf3fcf6dbd073b84f9d0767438832ceb85405c936e7', 0, '2022-12-13 14:24:42'),
('3c58ba43b718bfe8a7b93cd52f43ea9e39022ff587c41c54eac73c438949eb47d0d264867967d0ce', '4c41cb2494ca9a28c3b24e1fffc6434f9c6dca4692819cf2ad7653ae2f98de9cc0b8599607daa86f', 0, '2022-10-05 08:58:07'),
('3c71c56163d6a22225a29b54127558960f9cb6ed350eb401ad166f86b8df3e87a0bca31e660cf9e4', 'fdb346dcaa89576eadc6c9c90d883895fb3a3b135d249def8385e90f8c4424fb0723ef1b4d2b3771', 0, '2022-12-17 13:42:36'),
('3c9b61f82153c546aeaac457f812ea9df36688b861d124b320fcef11ccfd74528ad162030ad290b9', 'cf7da064aaacfab20e973beb759cf7801408510c3a41e31bc13b6d563ceca35e935757dc5fc50100', 0, '2023-01-13 09:53:57'),
('3ca1d40a542f046ed7fa7d056a2e2da994c5adb001d2f0f44a6f5d7ba2fc80088b84867432749352', 'f8935a3943673d4a2e394f82b3a69d27c505efef32a120f3b8847c3300e0905acbcbd5128ee49f32', 0, '2023-01-19 11:48:35'),
('3cc8187fd7fe5d8f30a2dbaeecd5151af5561261f4e048c4b29a69c3ff1ef64a6961fc89069623d4', '0aced43ba7910ea3b289d7c94b461c9f54ba0c6d7018319715fb8974b23e375327941e98afadd2e4', 0, '2022-12-17 14:11:44'),
('3de8e59e7f57955ad7ae04996150d073130743925f8068de32d68af5fedc7f506fa91e5599ba497d', '22952d6183c64982ea97cb36a2d300aeb66b4dcc60e793f4a7ab6217b3c3cbece5875fc527e086ae', 0, '2023-01-24 21:49:44'),
('3e6ca6b992025cbab899a1c55de22c077122cf2a268c9cdbb18e8c6df4ec222ea9d70756c5be0e2f', '3932e46c4a33447bf10afa930842a74b6713e5356fdf72161b71ed9063d325e180ddb75e33393e52', 0, '2023-01-13 09:41:35'),
('3eff491537aee61e37c95e3e450dd5f17c175276e148fd037be839bec687979587ee040c77837c8c', '7b86dadf93ecfe5740f8a2dec133bb0c7628970bd4ace3865417a74981075cbb830bc0fc7cecd5e9', 0, '2022-09-29 04:30:08'),
('3f116cbabc5fe0eec8cb7a4a06e7151c079a1bd8365bc54e452d4720db81232cfe57e5f9497c87c4', 'b293d4914dc3ff761d8fa655865734915696d2ca5e6b0140268bc69eb4941c8df2a2f97f38ac88b0', 0, '2023-01-19 08:06:02'),
('3fe1a2440139112859e8b23da17b503de726cbed52b31119e522a4f73197c11a7506a63322ae0143', '45f5805cd2ef093b9f74c2d0c034e39762dc64c3e6a95aad638f8c6ddfe0ca5616adcd376e88ff78', 0, '2023-01-13 10:59:02'),
('448f020ab6643990ba6d010666c239b8a130277e4b1af3b4321f277ca891d9d9763e6f8e82a1b078', '2af21be172028253b564330b7dde09114469bedf8b9bb596c09c2a855d8defd75fa508b644014293', 0, '2023-01-21 10:37:55'),
('452a26daac67044a3057978282d62a7ab3a3167ba32cbbb66d520fc80ca6868c60e04e25bb50759f', '0985fa28365c3f4419387a81ac2e31ef0a2806f1f47f5ea5bbbb428dd248f8ed4d0a0ea4e9db00a4', 0, '2023-01-13 11:01:20'),
('45e105d9aaeb085638d68f867b689c5e8ef020c9c34ff3bc9749e26c32f416e1073a1b04ce2aa498', 'f8f5d109855dadca6ad581e78bd0c91ea12979f0c2e9730889f34a5212a73fa634ba9edc983927ce', 0, '2023-01-13 09:43:40'),
('4687e0fb949d5f0a39752759352b608217118410c6ed4d46c923639c42d32dfdd26f68d7150abdaf', 'efec00ccf321e4dc6ea1a42ce7cce55cba2f2baa513f53e2ed44165046063438e1725178db28f6ff', 0, '2022-09-29 02:12:35'),
('46bdcf156bb75cb1738b06b929b900f1d65f9b26e590798b6862d9d0693c834a5808d7dbbc12cc9c', '73b14e3cc13700b93482995afa296d252e588af88a216aa3b0b434cdf72a501555b8f91541d67ad6', 0, '2023-01-13 10:26:26'),
('4742a929cb9cca46e00cc710593cd113d10106ec7df99d6f0a05ad3dad1ee7112629ea839161621f', '7dfd2468d657bbe6db5a3e8d72a28bce6ea6bdb70b9fd6b60517940226ec922eb9572ede940fe5be', 0, '2022-10-04 12:21:02'),
('48124e22b5aa878614b09c67bf5dd857d897dba02932b3fe1aa214b4bc06320dcc0f2613c1ec62b8', '29daf75c0f084238a5f7a9f1f8a7894ec64418974b2e2dddcc68a64c5b676b237abf552da2550d20', 0, '2023-01-13 09:51:14'),
('483f6bf9389248716e975aeb650a8c84d9baca1326d2bed8ec2883e267f56a9786d67d503ba4538c', 'acb2d39fa94d58b0dfff9dfa876f7eff68e8801b70a57ba35241a3eb083cdf445c89cee20211b1a5', 0, '2023-01-13 09:28:44'),
('48493c7fc14286761008bb6638b677579d6eade682c5f61d467b1dae5afd93738f971f77698d5958', 'f74864c5d0f5a56c587a62e134f3df225e5b64546e78e47740cd6c9d9d0e954101f449489ab9e47a', 0, '2023-01-23 08:37:00'),
('492e6c7394456427b27811461f191465e703797ab27ed35cca51ee181ba2e84da4ce9514936f06e9', '330b17d9237ce722cedce35e99528a896a27d3f266cf9a3bc162d177ba2f4c2342f128b887a7195c', 0, '2023-01-13 10:43:09'),
('49f33586dd8d271da0b646e63bbd93cf8b45e200d6575f69f572f11c3a83cd6efd66834b4ba0a2ac', '88aa28e17cd3f562074f289236e52666cf4a3688a288f47ae68b560421ccd415c646253925f1750b', 0, '2023-01-13 10:03:01'),
('4af732ab9f4b3cf3f00171a196fe27fcbae26bd88b8e921389b2596f812ffcf0b7aff88eb2d34d8c', '1d2be9f833062e2ec33bdc4e70dc298492c6885dd83e942068f4963d422061ca98026e4ce724c224', 0, '2022-10-01 01:53:29'),
('4b36a18adde216434b3cae43b606a60999060695eb60b6beb3cc41a7d2dbf6cb6c37c537f1c09611', 'de1a2ceeb37dbd1a96f8ab3f85a67f40a1406d00f7292415e9d4d0ff07028c920199678a35c0ac70', 0, '2023-01-13 08:36:52'),
('4b45acd52f5cedced366317d14ff06bbae0da0c11ceeef932ff85743d4b8c053885fdf91f320d1be', '9611d2ec2d3796c518903aadc70a96e0376a94f98be41d5e2cd09e0bf771021795f280e70fe4eedb', 0, '2022-10-05 04:24:19'),
('4bb8b5da7f52134ed6e61d5a8757f522316d4e18b1721809e23c556eb07d7502dfcc9f7b455ce4c8', '0abfd1ca96a0142ec3f0d27d42a7afd11ec6f512b6438b5bd730eee353ac0222b8d63fc11a06299e', 0, '2022-12-13 18:35:12'),
('50cab1c410399df58f88075ab04fb0e31738f8af099c03231085f490c9db9b5aa324540be33a83e7', '4b431ac335999167f1d16dbd406e8baacb28da249b1138f081c80e6616c2601efc8a526f7e523e26', 0, '2023-01-13 10:13:24'),
('5112343303b6b048821ae341cca9c72fcd9c940a227a85c1b0bf28ffabef593a4d5ee32bded56947', '08c4af3240eea6a40e729d32ae149553778178daff8c8fe89371d0f9d8cf1746908f2559c6a3e4a7', 0, '2023-01-17 09:38:52'),
('5166ca4209315c08d4110cfc4395ea480efac3e5b6306bac4c592764b1eb278ab9e21aea83b852f7', 'ce9e9ff3e58d952008e8abbc75b4c2c365d639de00f8ece0b5e54bc654192cfdf1f0d84ab6e00881', 0, '2022-10-05 08:41:17'),
('52291f1fa8f63d4a8531aef913b333f8bcd42ba8ec514f3eb04d4a944991285fb8de761ee8e8bc5a', '22542e56029a25e916cdf4f174200ce7ef67211cb841f07a175217dff763021450955304f5f77304', 0, '2022-12-13 14:20:48'),
('530bc0536823bb1d92481e7fbce4b9720b4c883e00c9de9abf6b32822c878c06ba86d1f5c6d5ac49', '0f24c6f116d0221efd64abf8a1263acfdcc8320b7f11bfc46a1c01bb6f5d6a84017d25c3aebb3395', 0, '2023-01-13 09:15:12'),
('53bd3354968b67709313ef8a73c92ba386bcf24b1ce8f230bd8e0435136ea13183fb576c6cb14826', '37718647266a9ba6b20d841d69b64355aa11db275cd3c7f3f5001db2bf8c1a8f9c3a2e3c1112a797', 0, '2023-01-25 07:59:43'),
('54ed0d00c76068a1d6e3d4d3c1acb93cf9150b988ddfd66c2ad5f3751d9825361ade47ed51024641', '892a2dd0739b45b45ad5529fd81205b6f3b832ce0a7a18395a43f3cfc65db223be64445871f07b28', 0, '2023-01-13 10:11:10'),
('56829d6c93457e810d5e547cbd7ceef58b0212960b2bbfb22c24ab9e276c3e82f87605a9662e16f6', '71a171661582efde2b9884268598051cd318c96e8280aca8013b69606b7a72d3ae5fc06272564d52', 0, '2022-10-13 10:13:57'),
('56a845f4ec0b9163aed3eedcd3864b048bec5e5d42ad298aaf10ad996bbd40d657e54fb08bce4bd7', '68c64ba9f584ec90905a8b47f66713e3e769236963851cdd85ad369470965062aafa3e239d9ca07c', 0, '2023-01-13 08:36:51'),
('58c46741811994a8b0e05089bb3b5d43bfb3be210e89d07704f3a6ffe686e7e53c4c01f591ab757f', '238a411419591d82fa3d54880f2c74bc8ef1025bea7dfcd28f0690307d7d11f70b0fd4df2dd2b2de', 0, '2022-12-13 18:41:39'),
('59ef16c030dcbff12da27521f32a70320c286d8607a7d5c58e4b6b320945cd4b8cffce791f6261ae', 'c18afe7460dc1e95fff7bb00f71048101a841d923cb33b35116930d22982c68b4dfbecf6528ce361', 0, '2023-01-13 09:17:06'),
('5a55ca37eaa25f70f9a02bca3f913cf013451789af3e52aa47d392cf8aa1a551ed4466e43644911e', '242e10527df2c00ff763a6fd0807d48e31e1cd1e14d7f90a78c7ea56088b48fc972fe641d339b6bb', 0, '2023-01-13 09:51:34'),
('5b369abf3c72edd661306ca969cc582a51b81e3bc0d5f855853738f12e082e359241cd5eaf0ce64b', '075b633b60dba91f37d911edc5ec8c00c72d6610be3b9be4039c9e2aaeb5e56d4472d9d3a919510e', 0, '2023-01-13 08:35:04'),
('5bd2fb6995c6c3176f546d2d6d8a1751f486df727f2672503538c7ccfd1f89487ce1bd5a96f0c1d8', 'a736f4e5969dfab6d8ca62b001de34561faeece2f48ea751b9b5ca60555fa5ec672b465ea1aa2d96', 0, '2023-01-13 10:47:10'),
('5be420dee4bdc4bbc9d8824814022652a28fccb4cb39d0761dec040028be028ce834047dac6ce548', '52ecc916961fdad9370e04189da21f1a3c81a0b251f9126da81d35319376e7a162c59909c53307f5', 0, '2023-01-13 09:31:35'),
('5d1636a01443faff2a79ffaaa17e6d5240094db0899bcdd59252429bfa82f3e8b5389ab89f6565e6', 'cf342aef4e5550ff76a7e49a0cfb31469c407cfc94239790b873100ef97d91857c40f422fe2ebeff', 0, '2023-01-15 07:55:48'),
('5d8b4008ed4cf070889ed695dc03445b18835961102cc9eaf10495ce9bdd57b5c4e292133e02a70c', 'c5cb2f3234388ca52706e5f1ca9f632bb3606579f63c6a40fabd4921e01ea2ea70d8a6f6fdacc14e', 0, '2022-12-31 19:08:54'),
('5e33d41a2915e2886886ed9c1f905e99025c8574055b531f0a9399416be57a97bb561a8932955391', '411d7036427a8b50c61855d8b4d8c1bf7d8ba5a58920db610c364fdb9549fcb0b39f4407e0b8d162', 0, '2023-01-22 09:44:36'),
('5e4dc19eead0482f422392b00cb5ec2feebd315a231c2ccb0807bd6cc8aaf9fe5355879fce0a2b71', '86d946e2a888843a0cbba5f821c5dd4d3c9ccb174f483a8c9461fbaa492d2a7c204ca32af6662d71', 0, '2022-09-29 02:12:06'),
('5ef8f05ba3b37a0f7114864ccb5d6f4d785feba6283be60e0aed6c4bde78867bba7280f7148e2fdb', '5369f878c60491b57285e965eb8836483798b795713b72ebb76955a9f9bd683519203a772b635c45', 0, '2023-01-13 10:50:12'),
('5f1912416baeb410fb39e78977a2932d006fcc0281e02a7e916a3602f7292177762cb11e04e20f41', '914c0b33e23baa0efc4b484c6f234557cfe35ce5cedf60c47687d0e0a1d2427ec06164df40ff769d', 0, '2022-10-05 12:26:49'),
('6000a9f48ed69ff50ae5808f8cdb2512b70ef060ebff1eb5b8a2d6cf0eb686f3282de6937fd1cb45', 'dbf52c1a8b75d5e8fd3a87e51aa73a2372b105a9ffedd0fc733d5d90d488e9ec99e3c067ea124a33', 0, '2022-09-28 08:26:05'),
('6030fc651879338b12965cdba65e17bda8cac0beaa0dad963feed22766a73237352655d735a04874', '0e3f9265271505c9db380921de10d0b5173e2c341474e71f7c07287c824836c7a254ff47c5f71206', 0, '2023-01-23 09:02:09'),
('61773683b7c37c48b79a63cd82fd24b4d4802b7deb5f7effc9e986575c01f6b1ad98c6e5451bf60d', 'f7401128eff4d40dcb05d29070c5b608b2e07ed7b7f079df0d83160d8f7b9e95dca4d49252656bc6', 0, '2023-01-14 10:18:27'),
('619e73182e9df6eaef96d9d38d0386e391b3c8479e9e675c2bc22254225074cca5745d0b8b73e1fa', '01a91f98af1bd840505457c3b4e5c45aa8e85e4e3bb689090b565a12265f8f90a020cbc6e2b10452', 0, '2022-10-06 00:52:17'),
('61f38cedc1c8d9f6f98821f76600c8a6be99f3b947745467ae1c670a5072d3597b15e7afe9c2a082', '732e145f00fe274d3ec48d2b3f55d88d7240e3a52a33ee5780a25f8f944251643a88480772db4cf0', 0, '2022-12-13 18:26:49'),
('625594c62581835d884b7fc6fed695924de346fbc29a853777429504d777b8ad7df2d1c20ec95f74', 'ef444621c962201e07276f91a5d94478efbc6b7f933e39299e9db9e4101a1a2f9283c292e09aa037', 0, '2023-01-13 08:23:16'),
('62edb50bd44c97b127e847d974923048ac6cfdf9b83c4976c5b9c9d1b4ab3174f4a4d55503d449c3', 'd08e658d20d97c20d7ad68f8a349ca96a5e404c12a589ae8e6f1429eaa69647e188094689252e52b', 0, '2023-01-13 10:52:24'),
('633d3907c3d02ad110bbb1f21628cbba56f24b91ddafaf955f919cc3e691e2229deec21974026900', '5564b2283b33005776c4edf16ebe79e99ee34687d044d07e5dd8a67034afa83a6923ed79726014bd', 0, '2023-01-17 11:07:42'),
('64104aa3ce5fca5dc1dcef8c787412986f1ee9864129b01c0894547967351079c072d823a629c722', '396b763c0d3c28700ac9a85bdf6c34c62b77426992e77afe1644d8a3ea88e67f23b2f16d1b883bee', 0, '2023-01-13 10:36:21'),
('6441ef379b326db2fed585f0a0138ea754d2303aea6ef37539784f5d5a905a05a497ac2d23b5745f', '3e34b4bd13dae8525356a759c34a37075ba799189de9d08593de10f5869c76b5c21ba717aa3f6c89', 0, '2023-01-21 11:37:51'),
('646d210550f4c1ae3c6bbce931575f7c183b7178aa7b9a7179475b881f3ffed949bd88e8dd20a618', '13690f66add44db9c0ee8af9fdc0f9f459f872ea99e96900b269231d30d05b2226f2ecd66c0be5f1', 0, '2023-01-18 09:25:02'),
('6489b622581a39e63a9bbf372d312e9befd359b417cfe34c5b73358d7e7d94af68b35d9d2ec60e33', '5a67564d5657d884e4c88d88ad65f9d7e2409e37b6b1411434e0a3203f61a07a26d29c469471877c', 0, '2022-10-05 04:23:49'),
('65a26fb1e2936a476821268b2777504926d6af87353e3e32d092a74ea22e231943a33ea26706eadf', '10ff1d0ef17a8fe74cc25717619dfe47fb59fe364e5a99941ffbf67cd5ca3f18907b2d14135cc253', 0, '2023-01-13 10:36:12'),
('660f75186ab8491076626cce9428a021939266d8be19ecfd481621e6f1da1127fcd4488a6d5c274b', '102c1d9dc2de58888928122c64b54da9200cfc8fbc756da6e112a4f794dc9c66140a77e8fdf01530', 0, '2023-01-13 11:18:12'),
('662a82314ca04c1e160b09f972136cb8b7febb85b64a31a01f6b626874e8c7aaba31e269f2ec9bcb', '9ee23e04b6ff9613731b44a6eef82b641097ab007c73b66046b93bcaa8e39d6c090fd09c90be9d9a', 0, '2022-10-13 10:33:21'),
('66f36222bc96ef9627a2e9558a3aea974580e22291da0c871cc4de3d439632516edb18b299557a26', '596613b5202535dc9e782ae38dd9913c02538fd84f245dca770adfbb46a5f0f01498f039906c404f', 0, '2023-01-21 11:45:23'),
('6765cb742e7c7a1614ce1fb8c4e35914ee7f802b4bbdc4e5c2bd47d0fb222357b7decb9fc17000ca', '8a633d157bdf81251b9403acc091de8ee5d17c2953e273f6aaae6ae2b509f9ef3712706cbb23221a', 0, '2022-12-17 10:52:33'),
('6ad052b906a49f9e739aa0d9f03c90a89f183b0c54f4f305095c79a832f7b91b091d0c5e677ff244', 'f8db3b61c8760347a6f2114aaa731c4ff437b849579bf2ec143b2d56ddff8906b057ede327794ee3', 0, '2023-01-13 10:54:30'),
('6b2d15d23a54ee41851bc1145f394bed56f53e9dbfac6b752b582de23eecb375a4dc14c58c0d40e5', 'bb0c03d9e8ac09676d3b12125b2f6a0a78a16d6947abac1c00bb2381f27d2e96efc9a18edadaad6a', 0, '2022-10-06 02:04:15'),
('6b6c46576b3039576c2cbca5b58dc8ed7682ff1123df0be7cefa5a1c84886a466b6bb7365994dbe0', 'e82ad046ac0c7f915162908a1528331794af8f769bc90d526a157688c8dd2d4392d90e2adcc33cac', 0, '2023-01-21 10:39:49'),
('6b93249b8b944e7302d525a04c7abae5aa0bcd38aa9fbfa58c125367d4ec9a8f8622aa23b61e6235', '98e82605e654e571345e8bc8ef377c33e733b75c48447da2db5b4e4d664fb5020c91c2d0872f5f14', 0, '2022-09-28 08:32:50'),
('6da1ba2c5a3c32026ad68c21a37be0f6d79f486f9b77dc7a4c5a7fdf9d74dbbab5ba2cee0532f72b', 'b6f0a4a2d809a71817c18d6de11de9adda5ce1f496efbe908bae64a71665bfab2a649105a0af266c', 0, '2023-01-23 08:55:02'),
('6efdd55416f242ebe3e2fd18f029b596ae128d191eb0f8378d13c95fe9572a50c7b8fe53c0ed7730', 'a0b6f03047ce8adba0f1448c194a645bac9d6b5afb96db0f1102cd887246f8fb530e75f0879a3220', 0, '2022-12-13 15:13:47'),
('6f4e0478d2984924bf1116198688a42a720451083a0cbeea1b6a0e04c1535dea2eff784fea9eccc1', '545136ea905b74113ab7256aeaae5e41d1651f6ccdc0a8560cea63261ecdbd5605f801527107d15a', 0, '2023-01-13 09:43:35'),
('6fd747b016618057a747d2b6f24bb0297ef491e20011be8f66530bebb459841c17d8e046c17c7ae9', '2544ab0d2ae461fb4477801f9dd7897f01cd26cf01eff6672c072cc245d8097a1816ef63dd7c7004', 0, '2022-12-13 18:36:05'),
('6fecfb0f4114391ab9a70aae952be59d24ff10904ef2a3e7617793db24779a2e59e91c9444e1cde3', 'b782906fa99a77ec0ad31be85e1625fc18f88690af1c9eb1cda5ec5ea23378218fdfa16ce82123b2', 0, '2023-01-13 11:21:47'),
('700d661487f68a708ec15f4c845cf3d2fd8e5d5e8c230d838a24b03894cffcd19a7b432b094e77e3', 'c05219a6cb097838a0c08615459ccbc2c7a1f2ea8776bf2320583c95f0c0e554c793c62c47d3419f', 0, '2023-01-13 09:08:31'),
('701140b9be53e8a29f7f32f90aec3bcf6fabc11f859ba9d80ffd09f6eb67f649c82edb522a9f91d8', '6e186bdd1dfc98a2cfdad7959f6a2be3772757969a4d16fb774ada7f89fb9ac8ff2155f509486c87', 0, '2022-10-05 04:43:59'),
('7047f884c019fc809d07b2e3b809e5940d729e4c295d8d3848d1c5e5d5ab910975d7e6232fcd3c8f', 'f9c4ba9b7fe9bd2f7e47f6eb2950adb8221fd4a5f454688b7071dd1257dda64cc0b9f5d4088d0d48', 0, '2023-01-13 10:49:39'),
('70cbcb1f22b41b9be8ad04dc37f7acbd0eddf8d30405c0d4a011d12da75198f43b79e2a06647115e', '495c6b68b280351264fc22c7a80c8560fc87ffb4a4e36c9eb6f2bbd393ce17e206e708046fb7482c', 0, '2022-12-13 14:25:55'),
('71865c8db9590e456528829eccd9e717afeeaf1068d0c666b0417bad38fc9a0e504c814ecca343b1', 'c66667350f342ee4e920d801e620aa5516e00fbee99a8d28429ca10f42389b861aaeeb476d7d33fe', 0, '2022-10-13 10:23:03'),
('736fd5b1e5482d9caf31e666553b7575958196d4ee2d32bac8b7e4175ad3d483a64cf37891cc9732', '79701e83ca3037828469584a96ed728f09b67640cd3899dc797177599fd6b0f7b8994bfedf771773', 0, '2023-01-13 10:23:31'),
('73b774afa81e2b02f9958b53bedf8c5e7e7f225c6b7238bc8672113ac20368b3efaa9bcf62c30b9f', '679da67345b51bcc6094065f358769fc055296de64764f0624382f79f326f803db6de2dded74e774', 0, '2022-10-05 04:21:05'),
('740eb909f3c96a7e3a37c7b8d94a54aa62a177386195e17e337ce2dc07cd8ee016f0a0ae1586ced8', '2511fbe752413b5cabebf6a7f93ed9ad10f7dbad3318be6293a8f7ab61280c72d22f2ceadf356bc8', 0, '2023-01-13 11:09:18'),
('768554437a7b44b1b06448a00b656a2a36d7897168bb24a44f8e90cd6b50a33425f73236604d6d4a', 'b48a2f7774fed2da1a4f75012f5e231e6756c6f388d5b05b4a3f89380dbfee42eaf933083d4642f6', 0, '2023-01-22 09:52:50'),
('76bedb44a7e03ecaeb3c405c00fd78076065e7fa60108418334dff3be931696ea6b6ea96f5cd18e6', '10f6992c767a672b8a8f476a522527057439ae1c787f7294ec9e818be24ec88b68d7a674a7eb0735', 0, '2022-10-05 07:26:31'),
('77788f86aafedaa02fa52206abd76b15f816ad5981a6c6082d55b806298b421416f287d6617d6843', '0a50ccc3c5a61b01777d55e6006c5a428b3605f92f72208aed84f93ed57cef73e7316b3bbeca5bbc', 0, '2022-10-05 04:23:11'),
('77dc11dc48c03b17bcc9d18beae16f366feb17e1e882ac503ffdaf2a7966be2ca52eb236fe4f133b', '8573106236a3eb6ae05d8a84b2cfb9a1db8d66071fde303fddad31c5b1792e1bd1490de9a29e2854', 0, '2023-01-13 10:25:00'),
('78479f348522bb5e0e8a2fc910d1b9c306c20d79e6ece5d4afaf716023d38f9caf0ffff8a98a533a', 'd55daa6dc32f09ca6c602434ba1408754820b31877f34e454720bcf71663c4d5b4096d98eef1712a', 0, '2023-01-13 11:06:57'),
('78df9c399a949e1f084d1be382816a2d9804b3d4b7c60759c9a470a262fd12e7d99fbef0eb7788e3', '59b705b5d2e676ec71ccdb0e2bfd1e10b94606f19cff26c9082e64f6d5acf691189d3a2a23fc58dc', 0, '2022-12-13 18:25:58'),
('797d1df06ce1e587def5d98b0edc2c92658104afa231de617a55cb8d73736b356a7293dd6880c2db', 'cdc64f603c1c732a7fa98eb6d5fd795f9abb9c1cc185441796a7283b19d0478e8284d36ee4d44402', 0, '2023-01-14 09:52:30'),
('799837fb0c5443963bb108d9a39dd1f9b4deed48c64938cab2dced05698daad442e6000e6cc222df', 'e4e9e3d8d7178af78e4d49f2557ccf0e255600467d330ae44f3f34682ae96b00c40b52c3c7eb824a', 0, '2022-09-28 08:26:44'),
('79f97dfa19ad3a80a0e93c9986f92fc1057b94d2181e9c5cb4a9a0109a778f90ccfc445cb7fcf2c7', 'e8c9a5828d6e3c429eedf3c602a806af7e87879f9439665da5dbadc30511dc802ebe56b32b12cfec', 0, '2023-01-13 11:00:16'),
('7b1ff5197c630660569afdeb974b75ecf4d019c3a70222d897ab5c57a0e2d9920d19bf2bfab0bef0', '302e402a964ecdea790d1437a345e96cb00e7167efeca9ac409244020245dbe516c5cd3e6e78d7da', 0, '2022-09-29 02:33:43'),
('7cfc775f89d529445a2d291a4ba213184abdcc256bbd6a25241570b18a03e4e387bb823f696db45f', 'd88217568b595c2f07630a6bdaa1195ab2a07ad5c033077cd53acb147846b9688feed6202517fe0f', 0, '2022-12-17 14:19:36'),
('7d08f5ebe5e04541f76632f557a3db7e43164bf5a1d151d47c6dff9a5981ab85ab6b8819b09f3afb', '9a717dabfdcb2378680a7fee93d7edaa5747b4631ce62d54b2cd1682419276372cf429a463f4886c', 0, '2022-12-28 18:22:11'),
('7d5fbad62c71bcfea082467c2f5b7d9380f0dda1e0d85497ee1491592dfac03b601762d709a1de7d', 'fa82077c1cce2ac38a8b47a2f6ebe7fd09557195cda1457e88a85ee4cd1cc266809df93a986c68da', 0, '2022-10-01 04:00:33'),
('7f8859091a5166113a82f035d7aeb3da48a68087ae36f5b38150406a73716a57f08c57d293f060dc', 'c44044b34857882e4cea4b8e0ee6e0d3eeeec69666521ada6a8b97fa0fbd7f36e598b86b42a357c3', 0, '2022-10-05 08:30:17'),
('80fa8dd02c410a9dd65ff712afae0a0777b701acaebd971e4075106c8301a152a6da74d2b0b3293a', '16da2fd6e0b19b8fb7741cc2795fc76812b98187de27ae5a7bff680400616ae958eaf9b6b4a754d2', 0, '2022-09-28 08:33:41'),
('819aa7837c69c295eb69fec647911297649f2dacdf5a7a30be9b97b65e60ecf445e6e6348745493c', 'e402d8e8aa3191914c926de3e75ba73f1b984e7fe8e879eda972bedcf368f1bfce741b8060c8e0f9', 0, '2023-01-03 10:09:08'),
('81b623900c2dbdb13d2b2991d4a328d47843bd5cced59cf3c452bf840669fe36f617d6556ef82e9d', '06bc82485ef71025382f3eb35a066ff0f40376a835698a071e5c0620a70e4c1b076db4ae0d700a59', 0, '2023-01-13 09:59:58'),
('8300c904b09d8455f643a75574a6fb695bca571c93080822e5592bbce409cd32a8ac5160c6dff79d', 'aee66725be6df7c671e70668b2383fc7e7d1050e13af0289804a37c7ac7d3757f90cfd373f648d57', 0, '2022-12-17 10:50:37'),
('8429d0d7efeb47eea0ea31ec73fa463f5b05c7d38d66cea73194c39e50b8fe8e13d29cbe489eb545', 'ed00731de266c90a6345f5c2c5af15bb3cb6940ed77db42e057365465a4152dedc5119b33a602248', 0, '2023-01-13 11:30:34'),
('8492d85b9f64734c029018dd9a15286ef3d12d43f12fb701c2cb95d06e009bd265b2c818c3b11b06', '40ac98b13e3996fd887936ef9d36dccad044ead2547dc47e0fa929fbb0d9036dcb66735ac6ab0cb5', 0, '2023-01-25 07:16:43'),
('84a61eecceeadd14dc9600259069e2204b37a95239e77d2ad4baf014abcc981d05b263beb1daa2ad', '8f19eda68a439eb611e1e86c5d38758c4371391bde77255c21cd99b682435120f66df2edfec06144', 0, '2023-01-13 10:28:04'),
('8528c0ffa8c7216e585d121d40979217b12b1380d489401c142b4c737293f3cf097de6f1e072119e', 'a05f95a8940912850b2bc59b7be2453ef63297b9b6a145a067f3452edb5c1c849c102a7abcf28efc', 0, '2022-10-05 08:36:09'),
('85ce030f370652aee60cf0ba030e6899f408ecb4772b72aadb7e38a897d866900c0a1703e7318ce6', '3f4cb98e4776aec2267fb9861e7cbb48d905b7dbb6c3e718c5da453bb8772b664fb8c50e9a9e731e', 0, '2022-12-13 14:12:52'),
('85ff37778ff10b9dc8d04b4844de3f29a784dabb9d094bf656bd3540de84bc557daf4eb01f36b61f', 'ffd0193f1674ba463b72e3dbfc2b9cd9725faaae5746e3edf635ea22e05d768214bc96240e29df89', 0, '2022-10-01 01:47:52'),
('8638c30b2301f7da112c78f0727fcb83d056dc44f0dfcca04e668f992d925d78dc008ef4d6a87276', 'fb420ebbcea441d0eb29510073c652e9d4da198cde0a7fc5bc80ecdfcb165b90cbae30df4c02c43a', 0, '2023-01-13 10:59:03'),
('86f078071bd20a2e7610e742f25ed6bcec8f5227c66b3dc851cbd3d2f9b32510f0cd5969bb7e4442', '1f6da10f1657680f432a3f50cc9cb0d964ecf1dd7a9e3ba3b2adad0cc20379580518d49a27848399', 0, '2023-01-23 08:57:55'),
('8721ec4eea9449e36047e1c40a5f7249bc6f8e5fe5e16e798917ef3585245cefd85e824810df2ea9', '3bb7575740579c09d467531083c5bd939fcfb6b5cc000b78c672435ca24ed4d5755420d34eff9205', 0, '2022-12-13 14:24:02'),
('874fa39458faa7a824c09498ec94f3897dd1acbac5f4c03ac812bab5a6e24fac85a366c77872ff66', '4a970c8a21d56dd18e9233fd9cb0dfd09716535226350f5bbe9f9809bbb62681774ba4c1f02edc5d', 0, '2022-12-31 19:15:10'),
('87b6729e69b4bb0cbe48dae5d50cc80c2f1f35289a79165e7990c43cf3dd37d28715014157714f2b', '92d46f087c10c4a7512e9d925d623c3863d1ffd1da190864cbb764e953ec96aae353b64b8af4e0f0', 0, '2023-01-13 11:23:05'),
('87e1c7475fc8e7478dd915d1a7ff1f3f5fe4cec91428d478aab568876e718b4a022fe92006b5d0b5', '318c70509e035377298a23e071a31c5d9864191fe279694d91e5f225a17fa3fc0ff3b56c470c676e', 0, '2022-10-06 01:23:28'),
('88ac6c8687e1a5679ddbdc2a14af2c140ec9de8e3e43fe419089500ca0ed08e441f9e4a28476f554', 'd02d29139d8427e3b885c0044e6b074f9a3488ddab3fbcd978f437aad1873c58cd2245eca55f6ca6', 0, '2023-01-13 08:48:55'),
('8932d6bbb6d1146ba4a8153770969df207a06c34c2e87749baafabebb01dd91820eba9d0b9fe6537', 'e296a7b3790ae4a8c68caa54c6e516a5d2aaa0f81404ad021f3dcd1a7bb0e76bc17fc85f02db17d7', 0, '2023-01-21 15:58:24'),
('89d3d18e968075c2cdb585d17be0e14636c745b7c2002047091ed17d2cf40f60a74f53cda7bdfc5a', 'e58c2352092a4e4aa08ae6306584e93e326b8fa02fde271e5679e1eeacf041193a2e3624cf6958ff', 0, '2023-01-13 15:13:09'),
('89eb7d93839096599091b7438d05444163c13fd85a60a0868c88d6dac4fa9e27ad1e2033292f7b34', 'c816bf8cf78e09954e34f05e946f8edb9e6ec9f6fd22ede5f42b75fd3c4b56ced4076f8974ca265d', 0, '2023-01-15 08:18:50'),
('8a07b3a9e903d216f03f304bf5bc62796065f0c4c237f8ae2b780ddb76877b14610d9a4d10a6a1c3', '7574760069e9275307eefeb2d8360005af8278d574bbf5f1edf157bc1cc5048fc18f3368c15a7c8e', 0, '2023-01-13 10:08:09'),
('8a18f3d449e7504f356bbc13a4ff615b1c8b548b280e1e2c52f826e0b9c77a89b89f73da85d557bf', '49cc13e342d624477cc6a38b6ef61890428d8d42684fbf3357759c53ee6a4066fcc13577cfec96c4', 0, '2022-10-13 10:25:01'),
('8a9c0f9afbe0a6ce50d00001677032723129ed4d6835d9b0588ecfceba1a8e585f84e58b73c7dacf', '8fc2b29c2dbdceffef348f50548ae587a493b5b24b4acf3aecc49dc9ba7a8933163c073e1389a8dc', 0, '2022-09-28 08:32:53'),
('8c0e91a7c2f922362b3e0e0566d19729ccca82d4c9233d130d2d4a9c1ed9499382a0cf8ec942cf94', 'a5a2a1012631ed07331ddd883c1d40c3fbf34edc66320673c7d6cea8fef6eff56c20d29153516233', 0, '2022-10-05 08:40:04'),
('8c274c3c19c398d1213bd313e095609cc1cf9f8f5092f32727d61de0a49d3f961d0b1b981561ee75', '3f933e39d7b5bf1311161727af8e8931a1c24cea8d40a7dbda0fdb2133fef267dc29a99b9a6c206c', 0, '2023-01-13 11:20:34'),
('8cbaf95316da19590ba9ef87d7f68c57c1ace83fca1dfaa5ada25097f59a9248c4a442ec40b76416', '562f8cf586f9b5c89f148382f459b1f722f23983adbec1b9344596eeabeb1a0f5751aa880ea8f833', 0, '2023-01-13 09:46:39'),
('8d9cd0e1c9390c08a11a37929152d75ecb47c4160226798a7f8dd1492fc4e0144512f793d0788bcc', '02c1a2a042080a01a5ba97529b83b9241bdb5872bf9a1aca5f6b67ea6e90c6ad3b1dd19d4ab3d327', 0, '2022-10-05 08:30:57'),
('8efd2eb4eda1baa02952f2f005e654a14de7af0936305cf041f79c0a923cad4d140b62a52010a014', '6abe45b25c29755412d79cc970a84c24b2713ae662ee6a10e2e831fd0eae72767d0541d47fba1eba', 0, '2022-12-31 19:18:21'),
('8f75290ae253521b56175a2640fafe9e0f751bb37872bcde194b25152d32b55e634a6d3b896a0328', '6e270181298b2ee0e6374e850e68f8581665e735cb204b59b89a44ee28d6b17655e7bc1ed3377932', 0, '2023-01-13 10:22:44'),
('90436a1270002645540235bedbaecac887d43e71c2a70464900073bf107f539987fde7d5f3da18fc', 'bd937c2087091cf578078a0157f35f062b46babd3654933471e1a1cc59ffe1c2279b4465e0ca6dff', 0, '2023-01-13 10:57:04'),
('90f58b52393c1b29e80a200f65b3766d0af6803a57b1cf74027780712502402841daf48e476c3608', '101968f46f4a112e70502e6cb4327fa13fec3b3d11ff662fa2467614a8f0c708b4ba5898073eaf3f', 0, '2022-10-02 04:33:38'),
('917e25949b92060de050517ec1f6adfeeadef983b97d266fb0807399d414b3198a2ebc31922d70aa', '7d8d252fe5110419ad31e3c08de95f2f93e000ab8876cfed8623c462e1dd072bd1717d101a82f738', 0, '2023-01-13 15:09:54'),
('918630bf93e74c583c756cca2ad5ad93d51c4e497a0a8cf853f300a3d0982c829e3ba5f4f3b3d778', '0b62d988efa5834d3a63e841f42834d82c81a69e2ee70433160fa664b8e723a0baa716b3624f9493', 0, '2023-01-13 09:15:47'),
('918a6bef1d311c8dca731bb56bca0e2300800b445e24acf87962ef6d875681f461266b082f7f9e62', 'c0eeb17868ec92c080c7d266d5166af22926755126a949e00c70210e0f0afe9d54251911ffb3ac0d', 0, '2022-09-29 02:30:19'),
('91e35c912c7dbe08d1f2956a877db390d52a565988ef9ef56891b73a5e5d9b1e67e55728e886cc6a', '4ba749760a27edefe3854f9889b99df4a1d1aff47b2cb0fc4f0432678981b6385d7fd61893c9a05e', 0, '2022-09-28 08:33:57'),
('92d26a61b1092afa9b1bb6a67baa0ecbe7f0f6cae2c8bcc9df1b4231540cdc90d55cdb46931ca49e', '8d3983937ea7303b4bd75ff95c404e91d1a8d72dc884e2fc65b4f36cf6ae6f4bfe867ba109cb7d26', 0, '2023-01-13 09:38:40'),
('933923a88b28f30fe8f7bb9323c99ad40c0c4ef1c27b0d2c32e3035376485e72031944f850dbab63', 'b708e0e49b3f4fab1780f5df0b424ca4a6812cf10ef80b9cc876ca9b5886dcf9f2211f95237f74fd', 0, '2023-01-13 10:00:25'),
('937f85c84483df644af4846fe68dd946ca51e86e8e92af0192b03883196a0b3d7b32488dc6bc0dc7', 'f0aa38719bc0682e6854a015566f0a3cf441356e6c433172c2b453f1d83147b4ced45decef0851f9', 0, '2023-01-23 08:35:19'),
('93f5ea29753370baeecee3a1c9c66ad8e77abc39ff68557631253835c5670c8858d6207a7f3efec2', '5ed09663750912cd56f9ba09e72eba5d54eb6dc51d3e0e72110bfd4c2a90028e06d363d02f1677c6', 0, '2022-09-29 03:13:15'),
('94cf484370497a9a615b2dafe419b9169c954ce17bb9b8cb77a1e6e1cf5ad43cdc9efd05c86a4a99', '766ede1fd863dfe4d4428af3bfd16fd612f46a5a17a31f3b89faa19d399ba6fb09f602dba7e6c60e', 0, '2022-10-05 08:39:11'),
('95016abe6901c4c2c37d2c53775a82eb8a29c4238e62b1eb4e4df5c15cf814dc022ece898f94ac8e', 'd35911b96db0ed4e29f9a6bb8204e66658e7f16d65754ab4f530bb3304f1ef86ddcc8a1f4bd5740a', 0, '2023-01-13 10:25:13'),
('95587e46be0a3bd6654dbf0d02e95b3b0947d039a63e814221f94fb15ecbe206cbd088b8f83ff41f', '423f708510b227f87eda973d77d2237b3074b50458382cf299fd2add3a7c9fb8a8f29376d04360ea', 0, '2023-01-13 09:51:02'),
('955c89cec1682e2de10b3015b909f418d5c914cbff788db0dca4285149ab77f68961a6affbdf091b', '95c91a898a449e8a0e53e9f217a3ac7c2529dfac809d86d8546792b5e14a53f474d4525e7d3de475', 0, '2022-12-31 19:15:54'),
('9603f8d127fab17e965f63d54d8902459fd81745d507595254872f670dedf5dfe282a965c80aebf1', '2be1682752e6760b4682cd790088ab264045f49674c085204da7ed269e0c154b28c06bfd9e4ce10a', 0, '2022-12-31 19:19:00'),
('96895aadca4c947efdd01a58f79c1a8941aaae4146fa7094981f1f88c09b0d91e90f45334d5d9491', '39cd00f059186236deeeab987baba017095fe96235cfeefdaa999b75ce5841f8caf994b779cc7022', 0, '2023-01-21 11:44:56'),
('96faa7c3893f2ab5340b7573a81c18c2ec413a11c4db1d0aca9551b12399287c3da181b9231e64e2', '79092e8f8d1b8d56c519f1cb7311a52a1a7fbe4aa0600dad6ba2b2943757ba472156966294dfad01', 0, '2023-01-13 11:01:40'),
('97449bf6eb5e4e0f2da2b3c0fb513ade3f21a9189f2c7ffcd873d56606945818097b0b5c74afc5a1', '29c6b657ae0313d96f3b5ccbe6712d054225364ec094998f2fc39d18693fe62d208670e056b98cc0', 0, '2023-01-23 08:36:12'),
('97ad89af4bccf6e31bd6b7b056ff034780f6183aa145b57b974db7c16735a5964fd51b72716e5c91', '9f1f27db57ae08a99c127e2bf8cbbd9fbf6bd12844ad25db70749765fb1f27c67b9132a86cacc663', 0, '2022-10-05 08:31:37'),
('9806e9318d176dea52ab53970a553741a86cd0fde230e7a996f58c5e3ff4c57720cf08af6103939e', '268d763b25e74ad897e7ecfdd32404849a47b63ebaff97ecb39c277753d6d2d41b23d480ddf395fa', 0, '2023-01-13 15:18:39'),
('988513439202437644a9d36eb6470776904a381abeb9724a7d0a0268298b379b10a3b617562829d6', 'da39902cfc10a3234ab08769bd2afdd81dec46420729d60589c0d51ad932c903d7e6facd03b1ebf1', 0, '2023-01-13 10:24:30'),
('9a053c1223c42a163337374392f1ae87a1c782c8b50ccb10963d9695605fda9e0d07068916efad90', '588a6b2056f6b390a01ac7ca126bf454e0030cb513bbfb72b7ed68dc745c19f6cc3f2821b5dc726c', 0, '2022-12-21 14:45:47'),
('9baad3a9fa8c9f0811b65bdf0cebd0eaf692cebe6ccc6d164ef6e40d1227dfcfeea979989767eca9', '586414a2612da1b10ac2ac4f5e5dae252074e984f6fc1648118dd781c5e7e62226f6ee83c1808618', 0, '2023-01-13 09:50:31'),
('9c8a0f12225de11a4ae4b91691f728a3a8f9acd7661a853dfa05945c648ccd98e9820866dc44213e', '0023aaa458d02a605a874408278b5eb1cb9b75986c7c623ad22c72911b3d7b54361912e525028c9e', 0, '2022-12-31 19:18:01'),
('9c92dd19a8a5baa6d8a19251362cc9363787f73b2849619d3a15556515fe5d354630a56878b42189', '0320fa30d51d456799bba0e5fdcaf5861a847154cf69b4dcd113d61ccc9ea1addbd5158437bf5a1f', 0, '2022-10-13 10:24:08'),
('9cf2071378eb8f87c4b854d0dc6963db247956397d87051a2afc64137efb6fe415614cd9c95bcac3', '2aba2ff777fd1cfc5c67680952faa33c3f476c21a2855fdf7e7468ae0513b88010f8c4c778194761', 0, '2023-01-19 13:44:14'),
('9d1220146a59cc4fe099e022b7b3c3d0b31b47895e59b46d3dce476e51ffde8df5f0eafc1681d0ed', '5337f7da7d94e5f835cfc9a7743cc791e18a7db050cf5c94436b5f68c7e799968090dfc84a5a8c13', 0, '2022-12-17 10:50:26'),
('9d249450d302f8ff83d50bb7d769213bc0c7e6389b393ffdf8fcd95a96d129eddeb13f9f8fee0765', '9e1dbcef9fce07f0cddc1f22543f5b7c7f7b8db077924debc769f0182c9a35a08f4509dbd103cd55', 0, '2023-01-13 15:23:00'),
('9db11b92b75d2e86c8f91633faf6e69d37fa828fb60a9048f5ea049dd8eb65120e227b30e6d4829f', '845381a9dd5d576e251a8328d929a875a8a5026c68a7361bade309f96a9e9dfb60ae4fb6b9d2380d', 0, '2023-01-13 10:34:31'),
('9f5abad0155c16fa59cd105be7d6333a3aab77a214ba3a20144b643bf33ad054e33804d1ac8cf1a2', 'ab473e09ec9f496d698b672b4bb23b61e6b2cc36c90e2673d31d95558a52d09e4839e637fb24a9f7', 0, '2023-01-25 07:59:13'),
('9f6eb4ba16bbc0ed6dd8d98b18f943bd6303481f7cbcbf3cf3c86b3bab37f32ff7de0b1b5f6e66c1', '2d5ad4de5fff0f3e402b5f574ade8230a61945d41faf6c8f754df2eedc605e6b5b15ed1dcfa6abc2', 0, '2022-12-13 15:21:21'),
('9fb8eb0fb2d3681e6a2373f64d6436d749f7c30c885c9b8cbe814ea8f0250375f6097d4bf4281c28', '367e8c4d05c4a10c17d2bb726d69f3e5fcb7e795c96f36430fada6bf4f22446e68b33b58e8386360', 0, '2023-01-13 10:03:30'),
('a079fbecb521f358fd82fad660faad64bc9d5f6ea6ca68ecfcf676976d0a0cd63f3f71d7d388b011', '970eca226033604b91d9aa435b99bc4d7847efbd33cf8a73cd400e7e9b1219eaa9f4369b33cbd4aa', 0, '2022-09-28 08:30:49'),
('a102f4daab2d51c67d18d6b5f7c6eb2b8260848619940898e8910ae5eaebc5932e6967a51b1dd35c', 'daa0b2fa6f7047447c1842f55cc58c93c20ee8d0cc3472d7a9b5646a2493f3b0ea71eea8f44a8202', 0, '2023-01-23 08:56:54'),
('a12b132024d762d4b1384277d21b11e28e7f5e78c33fa822ed169a40d494fb586b0ed9bbdeab2a3b', '685e2adafd90d891e8af795ede5316ef55252fa739874235b618970f9e56fab244b05f7be3766631', 0, '2022-12-17 10:51:31'),
('a1464ab4423cbc86eae4102757d563c337245354ced0b832cf274d1ca9e7068cb1ee3d66568d1a82', '620846a1438755a06d1ebfed38cb464b4d30ab364eb4c6ca9012a87666333204bb0413ceeeae0fa8', 0, '2022-09-28 08:31:40'),
('a242da2a90d36cec30b629e06d8adb412227f0d4db9f2d9cc0bd47bdb9d2f480c9014b4e662dd07f', '77b5b542ca8a102ef44d5e2efc4377e9ab6145e918439ce23ad8da8c96a7b5553c1fae2dfa41236b', 0, '2023-01-22 09:52:46'),
('a250128ebd4dabb9609c49d4a10808df67f476241820de44437b07f943f7b69257cb75d77c07fabc', 'd65ca5e31843d0a9a9214e182d5932d394b4d64f3677159d8d463f98e110e0097740497077a437d6', 0, '2023-01-13 10:26:57'),
('a265738fbb77131e0f181d53f5aa9a42ad9bbab45c9b028f4899c482c456d56a8722c152d33fea3a', '8fb84dc59b6a97f9a26e18daccc301f34f3e41624a8af08e880ac3f72c39be5a1bada87479376769', 0, '2022-10-05 01:43:18'),
('a28c34431a4796101dede0f4a8cf29e3923deccffe68b69594a126dc782745c66499c13d94787416', 'bc5186cadf4300c4798141df2e425f9bbee5c416bfab39f7447e0fd3f639d34c2776bb0fc1cc66fb', 0, '2022-10-05 08:30:04'),
('a3b545a074dea393550f40204f477221032a51d08ec86a882b2d7497aa2f9b45a21d57e434767396', 'c667b9c60312af80d2a3bc0175fb9ae0ae46422b0cb66bda01e8d4b600b5624562f2e72a7ec800b0', 0, '2023-01-22 08:38:18'),
('a4491661bf8026b043cacfa0877d52f933e2b0610a2c7927f23a4400556aade83f98fff2ab4c59fc', '1f46d49f43f2dc9bb9b090a100cb517b8f14e884087dcc6429c4d12b4cc98ad310a07bba0187a2d6', 0, '2022-12-13 18:31:17'),
('a4bc0091b297796ac79675cbd14290cd13db3683ab212c7fe74329e6da5e3a942cb5614bb1f80781', '4ffa308d70fe95dc2f581b55d1a07d72144c877441abbf5236850a90e04e958b2784c74f6fbb9354', 0, '2022-12-13 14:14:02'),
('a566432419155cd20b51314268ff784b3e677da122d80fc69e22499ac3ec2334b3bfddd338be93d5', 'f605bdfb526ae6e4df5a2da8c3018c0a66917add6ddb940216f8f9f2c1668b2f5f9bf018a820bf94', 0, '2022-09-29 01:54:37'),
('a5848b261fc22fe59bef4b7a16f6014e63af50daa9f404b4b824c900a79e2a26094d4425f136e2af', '04b7b9e938474fe156a4a35cfe559b6ace0a36c1b3c4314ca0dde337170657430731f737e478de52', 0, '2023-01-13 08:49:51'),
('a601e5856befe64c328386317194cc818588121626075112b485376cb2328c664a2193d44c573438', 'c730372a912a441a577cb8c8c80c814efdd6926da1088c50bafcf069f9de3122f1e5d40d4a3e29c2', 0, '2022-10-05 07:30:43'),
('a69764bd018bf13d3028a67b3340287942057e049da92a35470f04bfd2870d73e4883902735e476f', '688f97916ceb31bc51e0e74685c0cdeb17ab1b89d16748c518f584e5d1068680e9d81993ca1c13f5', 0, '2022-10-06 03:04:10'),
('a70b2966f33cc0d53fa84217df9c03b3a2d8d6dc5521a7dab4e10af35a8462246885728261c3a9b9', '6486c720b44523f750686ead9f77eac675ab2d81d32cb8372dc224082ee40abef3bbda5c44612b39', 0, '2023-01-19 08:32:52'),
('a7187794cbc2f27c6c5898bf49436d49566d445ef2b63cf275929d962eae7ad08ed736bf65281263', '85cef7a9a9e9adab4ba19149d18b0e7a2ec0b7edb41c96096a34f0d1ac6464c19d2febc1a2a4bddf', 0, '2023-01-23 09:10:55'),
('a8a8790576a351b32163b91eb54745daba2dc8e1acacf4e17909952512e55609e6f25f169a554ddc', '5b9bf80e5315d37751d36aa5a774273f86131ca2f6a4e12817cf3245dd56e532dd7610786a0461a0', 0, '2023-01-13 10:58:30'),
('a8a90b0773f8c25ac34b657690ed1cbff32cf8f04f8f81d7c26b9504e93b480a6d0e76bf46be0992', '5755740051112fb520fa471a744fb9a2f7ff6baab80ba0e720e1803830dcbfc37a8ec299e0aafedb', 0, '2022-10-08 10:55:28'),
('aa77efa2f2229a7950785503a6e977e52b3919a00c91db264e196bf3b4823e0a94098d5a244b327c', 'dbc0229e02d36425c9a5fcc5ff17d4ff269c099a712155da3fe0dd592bb0711b275b4a5973624a4a', 0, '2023-01-13 09:38:31'),
('abb48781eb115aff0419f83b47199e76b04402c060e742db8c1a3381e8856140ccc01f4773d2ca1c', '7d5f141eae9f2ec3b29c8e5e53b4ba0946d6876f7e5aef8fdc4e97b59e2ffda50107ebf6dadf88fa', 0, '2023-01-13 10:20:31'),
('ac67c488227aaad3c47f59c9929bdf557155484fb04ac4fce7c7dbb4f402165e001b7b1bda1e6e2a', '51b122a0243eb4108b6031b1d7bb02fea0a77a29fd5ec8511ab959b6e57b3a9bd2d549f274ab76c1', 0, '2022-09-29 02:08:25'),
('ad5d3867a8fac42997543f0543c77260509900a85c27fc7d6bcf8591f40a62e4f208bcab60d10dd1', '7f5317612909e3d6b534744f57a317147eb9b090bde3afdc032c86893ab7111889478cf959b788b7', 0, '2023-01-13 10:14:34'),
('adb5f736735073bd85b9064d9a531d4a60bc2a03dcb608ce905e14b57550dc0c0ff455a397be01ac', 'c84dad2bf6cd248d742b46b248cb562e74b49d7ea5ea10310a9ee41c921af1b5f78562656b52478e', 0, '2023-01-13 08:36:50'),
('aec413d2b198924e94abd3d2ac5d05316a3ebb52b9659b7324456d34e8de0cff0f726b4fbe00d784', 'cc89048718faea03881ac7592ecc2bad249f47a49b2ab5d9c5b7947f384694bfd0f17e23ca0a7fd2', 0, '2022-09-29 02:09:03'),
('aed22d95b2d4e11ffa7ef87d8c02d5b0562b3e0313e1a15586932df284584f53a471ae4ba46ea1e4', 'f929a813b12a61e65a53679d0fef392c8bcc0e712a937c102be0e54485242316c362689d83dd3a5f', 0, '2023-01-22 09:28:36'),
('af956ef8eb86ff818d78a9384e1fd7200c469dddae4a5e627544828e3dcbde62976fc8dcf82fe0d7', 'f8c303f7f7fcbb10a9a46da14590bba2bd812a413aa34656f8ce6ce1c5ff042347cff4ebb6d3b0f9', 0, '2023-01-23 09:00:07'),
('b259398ded556869d2f82f5b697df7f87d20f916f08f5a8bb4b2a714e59453a9883027b2b9903713', '82ef463815f8e7063720d33158cbe427e95e4c82ff0d8c3b988fcf14209e7689b3eea211d6b35db6', 0, '2022-10-05 04:22:22');
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('b2c4252e7a5ec1121cedf6fa0cab9055506b9030d37a4a35a66b4f36bd6722560752a6061ace4682', '778647ed1c12e0ddc54e52dad2020fba53fd4ab5817a125c19623854251cc5ba1024bc499f35a155', 0, '2022-10-05 12:34:46'),
('b2e0a05e8ac427d7776a0df5f92066f8983551d6eed3c1f247d8e45c50a3940d5ca91c44bb45f995', 'ccc8525ca19a5bbfdba422deadaa686526a6069248f1af46b374cbf166bfe404f794706c8e5c9140', 0, '2022-10-13 10:13:39'),
('b2f1fb3b2d87a7810e260146c99bae60593973339fc27f0a965a04ecd4222a6d4c38632a639ec0d7', '7b96fbf4dcd476bf92e284975335b7b2d9f8a2e68f69ae03c5d7a02a23d79bf08ff4d8b6f57c3dce', 0, '2022-12-13 14:18:57'),
('b2fe224e7e0decd569cf3d4d7c26218d4dabc337494d57c94e51640a2b038b620dc4d5a8f06fb012', '625993f357632df0bc17b747f0b578b3ccf4c0f648ba5f1e5410ff7e3ae0da77202239c84fd98c1e', 0, '2022-12-13 18:37:12'),
('b31373c1ac528e62e52aea37c62088d6be721cf0490c1ca66fb64e31469d50ee65f3371545f4f81b', '250a3e40b848f555fa1d374599d9755d9816b5aea69ff6b789d5d9e14ad29a1c5dcf598d90e0df9e', 0, '2023-01-13 11:18:08'),
('b4a763cf516014f7778fff6706f88b6b5e7f736a30b093524f190edb308ce297e206a49e44cfc567', '8e9005e6bbc5b1608ec81d8cf9735d3ee86423d6efbd48d366d11dfdac166068bc49f92cec364684', 0, '2023-01-13 10:34:22'),
('b5011522164544b95e5eeb28ee3d7e69de5a73b2f9685013e3c0281c6937d302fd623958dbcfcd9e', '58dc337d1219e605d9e8d0aa63ba948050434f52901265492b70b7e6dbb0694467b8d9ddb8f41604', 0, '2022-09-29 03:13:38'),
('b66fb5dd3c29c09a145fbdfdf2dbf04993b9d18f95725d27e23a99a2fe3fcb927650ae5ab81ecbfb', '78bf4fc11b5fdd378ba0e440526e7ca5b4dd45d2bfd54d60ae68ab88865eb3ece3e821238ee41046', 0, '2022-12-13 14:56:43'),
('b7f29ebd39c8b193ff5da88adde1e3fcbab021f72a63db897f18e039af83f1d84ab7160d7257ab2b', '6c7543f824eef19321418370cbc43f56ef7b9543e73ac8f2268f08af777d0101fce9adc5b3d58493', 0, '2023-01-14 08:13:03'),
('b8892889e1f08319b95be4040147feef301dc71d487a2a35fa61365dfe240bf6295caa962f082c86', '82ea9e70f8d6b95d49ae2bb66a620e17506d0b82c98120f562c5660e3cf25ccaaf184b89f575418c', 0, '2023-01-13 10:58:58'),
('b8e351ac188a1477352b5527607be1b5f696eb4c0d8fe0f5862f4b80f7ab2e33a49f3f854af3b650', 'e12a8fa03be12bc5613c259b3fc7048c4196c41b09ac20e367201c01c54a62c77fde3da8f9d32a04', 0, '2022-10-01 06:04:38'),
('b8faff8b8a99e02122756cd573f35fbad22d99b79ae413d1de7fdde7c6469514118449a60e49daa1', '0dda552a60b845dc9ab391621740de863e4f161c1f067b533d3b5fa8b4f37a355fe710a4a3bcae36', 0, '2023-01-13 15:20:51'),
('b9a1c888aad23b794dc1bdf6a6518f1fcf1f7109a11e0c6d1e03cf2611ddaa0e87a91163a2227479', '7714788d6d42a927f7de09507fc15882fb179aee3fd5d8a16d03c6f9830b7a721a3b1039e2d4c20b', 0, '2023-01-13 08:50:33'),
('b9e6bf7d8d6a5442c0e80d40305a2223e26b3e80986027299e5407ba556c12f01cc4130020b2088f', '0840618b5e32ec3df7dbd21f171a62051ad6c385812eb0e8838c1ced4227852360ff191c610d4bae', 0, '2022-12-17 14:44:12'),
('baf92fe17fe6fb2d2f455d3448e7b24804292679e858a4bb8b4101da3338f2c738efd93d20c70da8', '99c9918416232fc4de034e8fc08381da00f6770218977ec79d2f94580c5661f751f3703606d74a6c', 0, '2022-10-05 08:51:52'),
('bc6648eee4b4d8551b206a48571535cc299905067fb499828ebd80b57828576957ee8d47723a2d8c', 'a5eb6e445fd8a6ae3169fd6bf9836b0a934c2ab1db753c0a5bee5defad72f792d4aa20946e7f6a3d', 0, '2022-09-29 02:29:16'),
('bd4c2fb19e18ef29f3c32d8fa3f17999f66882cb78bb9248e21001c00233f61d387872d6d0334e68', '7d571ac186824d0d3dbc556321bd8b58703f2f10969e8e2a1c6f85deb3ba2b0ce34b865c44473aeb', 0, '2023-01-13 11:08:56'),
('be6380b06a7c730dd7ba3f171c3863e6eebdbe1bcfc49b39efaf90461dbf5a94d4752ce958bff4aa', 'ae6a513032d288f4206b89a372076122995d558c828d5da9f0510a436c03aafcc15006b9aaa291a0', 0, '2023-01-13 09:32:02'),
('c0c2b5e29df4c04114cb4cf3128f08e2ae92d12924d82fe02e09374c42e5348f302ea701df19e97b', '2d06c4dbffb0e9aa6a681609b6fcd7ce4698abeaabbbeeed51db1c51a246acf542172385568e1182', 0, '2022-10-01 02:31:53'),
('c12f6972b5f29d87a6d5b9b38781349ff66e1dbf1fb60e3d4c9514c33030814f4430627efef34375', '6c088064bd12bf3fffc716cd554cce97df283679c3e2e00aaf67d8582f444bd86fd42c25a9dd2ac8', 0, '2023-01-23 08:46:35'),
('c5423bc47dbe4d6310603be6003f701633b855f161eb7150a6961bef8366f81e41d280da131450b8', '30762b85714e5283f877df42578d93e093fc57546145d7a7e3fbe9c1a52bcd4c59e959b6f6d87271', 0, '2023-01-13 10:18:05'),
('c60a111f6f8edfc182da326166f78a81e9c6f98badd7ee47ababd8e35fc6bd9ffe6d77636b52fe34', '9936aa077a311dc9707d2409ca30d60cc3ab524a40d280fab63d73422f4c266ac25ba67e3f32495c', 0, '2023-01-13 11:46:52'),
('c6b8469ad6ed70817d2c28f9942cda71e0da82af98af9138934cfe75eecc06c04448cea9ce0d0e40', 'a626956201769b1a51cdef33a9080a1d083bf06839dda3f5e7979dd71e106ecf1886a2dc17944d08', 0, '2023-01-13 09:15:48'),
('c7d8d6acc0a3ba6e4817ba7832be68a8e621fce7d83ad2ab6cabc82e560a8ed0cfb486d6ef4a347a', 'dd50135f590b1944e54fe85efe0b4b4a7d835059d6cd2dd4f40a1a89123c553b5f8948765771616b', 0, '2023-01-14 10:17:04'),
('c910c1f6d2ac63ce94bcbae8833fe5644e88c2fb06ef135d152f6d90c6938e873b58ca1b56e76969', 'd86efddec53f0d10e1a50c4c61351bba93f1f43f4e8289ae8dd97acf8dc126e4825435ba6aaabd67', 0, '2023-01-13 10:08:25'),
('ca2c1581a0b2320187c4c6bc1c8cc90cb9c7a72c383f486fe7f6759a65422bc0b1451259b3ce9c3f', 'ad01317cd3918d4c58eb52be9c37dbdd0a344196c28fc0ad88205ea3519647f9e587a6684d16b478', 0, '2023-01-13 10:46:12'),
('ceb55650ecb1da8a061cac0e433ff05ab132d3279850709bb7896d23f8ea1a9939a421d1c4f34255', '6c5d55456395b4c163c22b3dc9c89ecba0c491c05631a6dae0d22e662a9af2fdf451ea7abfbc408a', 0, '2022-12-17 10:57:52'),
('cf52f8636326e32a4ff3d6462a1c317f090274430d0cc6ee22f75e0cd9ab39a9b5ded562b70ca412', 'cfc6ab599e619005635e18d55ef000a2042ce847eccedfd6f4bdd20de8036eb777fb2887ad253ea9', 0, '2023-01-23 09:00:42'),
('d60cd88803d9d32e58f68b439c07d8f7885fc2fe62f360e44c40fd42e01bb097d6c935e684c9f5b3', '2aaf52cbb668a570ccf0248c14c91a017ac0b0401c8edd1222a07ae81033fae9adc19380c9b8758b', 0, '2023-01-13 09:21:18'),
('d8057b93f16ba7633af2e45c19716801f4338db02475844c1448fd2c10c608b40536095d44f130d5', 'f3ea85b1c5b51727e090f35c74aece4cb5355c075aef5b74241fcaf542be746dbf16cde823eac24c', 0, '2023-01-13 10:59:35'),
('d8fd3ec0aa95a112a4a1a7265b5f41fc44833a3c8aab3034962978999efa46c8d2964af37157bc16', '50d2417b9218e1ec9995c783b9700a5cd4912ec1aa1f95426de3bb9076d75fd91c65811c071d0008', 0, '2023-01-13 10:00:18'),
('daa7be83b70b803d0a39647e8cc568fa7b5e918d9e20f84803713b3e1e004ae97ce8f25bfc9c0fc4', 'a1d76b32afec38d85116dbe5d8444e4fc51ab20023f05917a2c306f6a82dce2474c457312c1c2dc1', 0, '2022-12-13 18:30:53'),
('dadcb02242613c80a66dd942b7c2fd34c344fd0ae58658c9c77ab8998e805da73d37ffb7593aa2bd', '3671c4b1ebc0d6602dbbc5b853ff6b54e4a3b16e545a9bbb5c53ed971b6b955f007f4d668cdf865c', 0, '2023-01-14 09:53:25'),
('dcbaa5fadd07c994a44fdcaff0473e8b6720aa873a2f67d36baa3507a830df29b4e0ac0f3c265605', '1e8e0ac60aff80d7bde8e98893bae57245e20a1129a21483640b16266e2aa4fe2f6925fcec26c475', 0, '2022-10-01 01:52:40'),
('dd88a1476ed4628c5c96970ea0106ce2e2af43b09f53f0a9dac8d19fc0a1a69cbcd3aa1167deecd1', '3837e07f6014a2f842cd3a4fccbca1c6afa6d465e79498f64918fa9dcaaef008252a7f7e1148dd01', 0, '2023-01-13 14:15:30'),
('de4be88c877bfa8c0d325ec2ca543a59ab7e3aad5c73629577f4c6b4dcdea3ddd00503adafa5bfd8', 'dfea0a3e697ed94a5d9511a06ee6c082732bc763c692536d332c1bc1ec7b7637c861306802b2ad6c', 0, '2022-10-05 08:45:01'),
('de9b52fdf9e8ef209c626024c02cfddcb3c924c3a12ea9470acad15384beffd584f883cf66014156', 'd6a568a2bcb55ecbf6c0745f59fa08c5cfd51c0703339bf4d62f8a6cb01babc9c497b022e56aed97', 0, '2023-01-13 09:15:45'),
('e1884cfc332ed19207becc4ad9cb5f200fbe7bda44230bd0d9530f90172755cebef984af66d2389d', '2688284c01042ebdee9d32e29525b5fdc5c7c9ebd91f2b62d4bf3e3aad0a0a4fac965f0d4f01e43d', 0, '2023-01-19 11:51:21'),
('e2b002399ddbb866bcbdc236b76197e7562cac1026b3769b71e4664026b8165059fc2b91a248269d', 'ea2d01919189e08271f56fbfe3b9c80d1a1e7f812f8d1f293a88c2d552ed3bd896ead1b0abea0927', 0, '2023-01-13 09:15:48'),
('e2b2af6282f1ac3c522864982a14e601961d4b7298b745e58562f4d5eb1f4c7e621a0ff46e5c7ecc', '87272fd4c0f18870bdab6d4c347eaa91938593d38313428926bcd376375c9d7dd5d6b432fef468dc', 0, '2022-12-17 17:58:09'),
('e2f03f352f8687a7fcdd25ab3ac119c5bf896b8a72e3468f80304c3a06404820fb9f7cc4b7ad45d9', '0e8e26b7c125152261de502543b179965209ede1ad58a1f07f4b94992911449811720437fff0fe05', 0, '2023-01-13 10:08:15'),
('e3a09153da47b3c9acdf4ac23a9617fee3b8aa29bf95dd85b9d79285d21fa0169bbe8a98bedcaa22', '42af4ec61464fab55054a38c66086553e06168021e6ee49241cd74b03ef45ddeb541ffe930e08769', 0, '2022-10-08 10:57:05'),
('e440b9237b53d52e10161b9cb10cd58767c9c7532cb78ed53eecc679d0a991fc1adc6b825cc6a7c4', '020b1855aa151b96b5272e4297fe5a77743363eb005f4add64ca95a44500b5257f7aff63b638be1b', 0, '2023-01-13 10:45:39'),
('e4e39d302dd74819be406d829574eb5fc35a7cb179e2a5e5569cdc3a239de5e21ca728b081a36858', '1059b546409aa5b86487fbbbb4d1b532206c58374dbf30fe482ebe9fd5491a20fb6cbb2a7323da73', 0, '2023-01-13 10:04:17'),
('e517cbe850132924cc230395ab91b6bf08b5c2adaaa9f99a243b3c60ba45ca366c1ea3ffff8623c2', '57d46a5f8aa173f67d564116c6987dad7a54d15361cbd3b5a263973296b9a0e67ae6ad657107a417', 0, '2023-01-13 09:43:11'),
('e69e5b25190b34e868243058de7645d3ea47761cf25992fc626e08149d60711106d9dc56764c28c4', '7323106e6b1debfe2a2cf5b99949f106cf2f084373491424ee104372034fdad841d789c96259ecef', 0, '2023-01-23 09:06:06'),
('e748baa69b10cad1eb226cbe1f50c4d91eeba44a68f8ae7b2c1b331b7609d83df1a05019247d1d61', 'd076cf1d183f6ad5c1f328677b9324395b0a39718ad77bd4fe5aa236a67e0cbd164e4565e93bb1de', 0, '2022-10-13 10:32:00'),
('e79b58a3f849fede208d345434adfea8cca5cfeaea8e15052e02adfcdf3ef8c3e037216c10d92f0e', 'adafe751ebeb30f2728b21b48cbdcb6ae06e2589c99329da21f86f63153a8bd7245e40838a476c7f', 0, '2022-09-28 08:30:14'),
('e9844dda58c1878e7a37238742b6cba97152be530660ee29bf8228802373013eab5f3f27bad8b6d1', '5fd058ede530bbacbbc7770c132c5913f9cf195bd39483023e36f155d350990529cbba2dfff2ee96', 0, '2023-01-14 17:50:34'),
('eacc8a911c01904207800e3ebc422f94465944c6138dc9eea1d01c5000b68641a1f34b91b75f9c9e', '6864dcb74f2286bf426565e79297e731f2742c326b4b08e23b13eb7f1fc268ff77aef57c202aeb78', 0, '2023-01-19 13:44:07'),
('ebafef540b2e32f99f198a1b57eab6f8c94c069683e410514283023ac7a064ee5f99ef9388178072', '37e0d8986ab6be2ce0bed4efbce5c8cea6bbfd2092805cbc11cc63f4ba87e8f58974c5db08c5af94', 0, '2022-10-05 12:49:56'),
('ec6107b683df5e48473139cc3ab7534a92b35d5b5535b45408a64e4d67ddfab2a170d8bc2bd1649f', '3eecebaabfe2be8eb124c7546a0f309e201b7a1229591689ba6262c9b0c2f94af5372ca7ab6bd3b6', 0, '2023-01-13 10:25:56'),
('ec7b0ed1cc1348a116a704a470a892bfd42ff158486ea90c572ff36de5fe897add605dec6f5b6018', '499cc549099320d9141c71af00addbea74b3d8f83d86e226aea16feb1ca2c5fd5771e5d4ef9e6033', 0, '2023-01-20 09:22:46'),
('ed51b208612736a07cc144cfb68eea538e6292d02dc70881ed27aa86763b01c6eb87a679907fca2f', 'e4825acc1d3bb2ce0362372dcc0190175fc1aa60ad7c4bc2adeb7bd9dab7b246f3e478977620b6a3', 0, '2023-01-13 09:58:49'),
('ef33b083cc9508c78ab3ba917f9b5dce84d8aff96a099bd4cf792224547e52c52cd2e780cae5202b', '92afdc4757ce705657091adf3a5b43dcaccd0583034de97cf8ebfdb8acbb21d533d97dd566284ab4', 0, '2022-12-17 10:53:04'),
('efa4d84c2df11469b82d1c06d5443b3753f4accdbefcaeaa0c02ce5c7a1b4f5119abbd54479707ae', '235db04a34a0f718be42f0132f3914a313c4ab54c1f8ae1fc26181788eaccd089461b685d8a23ade', 0, '2023-01-13 09:40:08'),
('efb0355e503ec8e7c090447e6661e9a39960341342ea5b3f6dfad272239feb872ea43aadb7f3a7be', 'a2905da78e9a00a74eb5095225f2909bbd8a3dbdde905b2ba43ad6eb1493aecaaee8f995aa08ecb9', 0, '2022-10-05 03:55:37'),
('f0faf3c68e80d082d753f514506ae6c0ec5253858778c37ccaa818c4e6390fe757e8b9a6d87d9c1d', 'dbe7f787719affcf91e1041a98361b71d8f61b4b80c2dfdd8f736086bb54a92dd7bdf26e883270f6', 0, '2022-12-13 15:12:40'),
('f26e7e832a867e9f44186a4347d880060f019e6057bc7f4430554e08bfcc42c8e69df56eeccf25b4', '0379e750cf1460b5c0f04d1cc56250b13c36fb96f216a09e51e95f9b568696ad7684a0494a969a89', 0, '2023-01-13 09:51:47'),
('f2cd29a62d1766d29fbce69796fa16e132fe4e73a27ddddb52e98400a3121dc1bf4093fc9a2dca07', 'da724c4c9ac460b22a7fe32caa92383b6587fd6ee24cb7217016f75e66430f1df6f7c1868d207e06', 0, '2023-01-23 08:55:30'),
('f336ccf3565cc5249c1b97e64e02d509a3fc7a2c13288de2606690957191bd3031cc6b70bc7bebd2', '5a294e1a4c79eedac2aa8d51fc119dcf19245c22b0babf3f9a3c04e3c1ba828cd5313600058bab17', 0, '2023-01-13 10:13:18'),
('f5d9a799be6b62f4a180f88a79831e4bc6a3a8a3790a0b155d05e5137e491d3a52fb777612121dd1', 'c82464d11a50f9a1c63adcbcf104d2a6c73791cd53e2d5039ebe4f43ed71f1f1429579416f25b034', 0, '2023-01-13 10:25:37'),
('f66fb79844875ac69624f5c0f6338635a37e071d1041408716b9ebb00fd740ac7d640e2485d87960', '1e008c81cc49fc014bf79bfd2c75c7c3258facff17bb22e62b95e157292eca764d29540e84c6a55c', 0, '2023-01-13 10:59:05'),
('f69b3a65a9357e96adec8a51dd16bd5c9451d8f83ead6636ff551edfeccd2cb83d38812f86682120', '078e34db948a8c33900996560ddc7809898a306c0ad075a9670878642c2a17d148497bfd1e7b7df0', 0, '2022-09-29 01:55:01'),
('f75b3ecccab38ca2ec002f7bce26c29fbfff59c15a359018a090008ab12e6fa5db3219f5776a0fbe', 'f417d07e3fd337caec8ccdb66004a0d7074051614a3c3ad693a256a0ed50c809cfa663d01ee1cc76', 0, '2023-01-13 08:40:06'),
('f8396d13ba8425675cf7102c475bc4bdd21c6b32c95399cbd471713aa63496e909055e6b0e3a4430', '6a9d46940f1d35ac2e28141e4afe808ad31cfea5a810a6c24426aa53c5d3cf9ff19dc7d1841ed2ab', 0, '2023-01-20 09:40:14'),
('f8d3f4b52e33bd0c9cec953e488567c0a51c835f7cdec7072b6320ae1cef4e654efaebd9fd361144', 'e2dd7bbd96cf426257ba23d805399cf01a84ec225be50ae0fdfc1940cff3d94cd642aa7280e0d34c', 0, '2023-01-13 09:13:29'),
('f9721104ced23f9991350bf3dc24c2c53faf6488b45cf9fd3ded226771204ff2b1dbca1e817489ef', '1b46a024259212e0163ceb60d61b70af6cdd4c1074c3b6bc3f59d243272bd8e569f143b82f8e6874', 0, '2023-01-13 10:11:15'),
('fa1780396eef5bc3b5f832fa7ba18212b4531011ab5bf27156b53f361276d27f297543f4d88c51ec', '151b405915611be0f08552e609a7ec4c094c289a7a8d284a5ab283d1e95b765f23f89375fe18550c', 0, '2023-01-21 13:14:23'),
('fa46276c69149598bf0b5e76c96285cf96e34aec1c203654f578aea2ba0bae0e24460b6338178b7b', '73eaafdbd8ed155de18e614bdb8790cc64c45d1b735631adc355b463776d648ec244abc74e6b5b72', 0, '2022-12-31 19:08:03'),
('fa5fade519b0c5f5c61c0ae234d8dc42a6849daceafed74d9256aa71d44a301b14fc8e6a6f3475bc', '1642fca8f3013f4da77c7f2bffb5d2ebfd475726959a58c71f8b7b314e67d141719c8068d39eefa6', 0, '2022-10-04 02:46:46'),
('fb24ed75f7f1c7f1b4b406681ec19af46b037aa3fb1d2412932b7e63203190c9f7a98474b677f146', 'fedce9590227840da349f796e623e463fe191f23497d86da3f3ee0ac84b93577a5793cda706e93e9', 0, '2023-01-13 10:22:24'),
('fbe45faa51c904fab473d409613accc9e63172d7912fcebaac69d80e8b460eb03c2372e45c0acec4', '21ecf5f713ec74fa6be4fca3c6782dcad7ff4a8dfa220bcf2be066e1faef851adb95462e88d800a2', 0, '2023-01-13 09:22:06'),
('fcfd09917143665152386c3be4018f80f57039ceabbabd48098f4b5bb8dc558d29151056c10438e8', 'ecb64e2a4c5b3698a3ff0136e547b3dddc385d718f2612ab072673c6571d0395bfa3f2579fad14eb', 0, '2023-01-13 11:09:35'),
('fdeb22501e2e2e6a76b62dd1dec93438c8e02984575462cdaed0a46c3182bc01c9a1476343f088d7', '16170c7fd64a388b5f11f135ce0155e0bcbd5685d212bed335ea004d9fd599031e7abf9438961446', 0, '2022-10-01 01:53:09'),
('fea5a6584584946e0dc552a4b541154d9a2f3a833d626671899d825fbad404cbbaea44b39e89986f', 'f06c80a805e2c14c0667f85b7044a05747eeff3d51b27811a4c1cdaa04e37ed611cd2c9aa499a0dd', 0, '2023-01-13 10:14:18'),
('feced44f6d922659b793684b47fdc5986770d16000f18d0f00910c465f772f4dc033db92cab1b263', 'e248ef41e25240836ca389d9529f54a5e42006b9d2bfedcd972dacf99f2e1f74db1653ad6ad8ed66', 0, '2023-01-13 09:48:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `shop_id`, `customer_id`, `employee_id`, `created_at`, `updated_at`, `order_status_id`, `description`, `value`, `deleted_at`) VALUES
(1, 1, 6, 8, '2021-10-02 05:49:00', '2021-10-13 03:58:36', 3, NULL, NULL, NULL),
(3, 1, 7, 38, '2021-10-07 00:07:28', '2021-10-07 00:07:28', NULL, NULL, NULL, NULL),
(4, 1, 7, 38, '2021-10-07 00:08:11', '2021-10-07 00:08:11', NULL, NULL, NULL, NULL),
(5, 1, 7, 8, '2021-10-07 00:12:29', '2021-10-07 00:12:29', NULL, NULL, NULL, NULL),
(6, 1, 7, 8, '2021-10-07 00:12:51', '2021-10-07 00:12:51', NULL, NULL, NULL, NULL),
(7, 1, 7, 8, '2021-10-07 00:13:42', '2021-10-07 00:13:42', NULL, NULL, NULL, NULL),
(8, 1, 7, 38, '2021-10-07 00:20:25', '2021-10-07 00:20:25', NULL, NULL, NULL, NULL),
(9, 1, 7, 38, '2021-10-07 00:20:59', '2021-10-07 00:20:59', NULL, NULL, NULL, NULL),
(10, 1, 7, 38, '2021-10-07 00:22:03', '2021-10-07 00:22:03', NULL, NULL, NULL, NULL),
(11, 1, 7, 38, '2021-10-07 00:22:55', '2021-10-07 00:22:55', NULL, NULL, NULL, NULL),
(12, 1, 7, 38, '2021-10-07 00:24:46', '2021-10-07 00:24:46', NULL, NULL, NULL, NULL),
(13, 1, 7, 38, '2021-10-07 00:25:34', '2021-10-07 00:25:34', NULL, NULL, NULL, NULL),
(14, 1, 7, 38, '2021-10-07 00:27:08', '2021-10-07 00:27:08', NULL, NULL, NULL, NULL),
(15, 1, 7, 38, '2021-10-07 07:28:06', '2021-10-07 07:28:06', NULL, NULL, NULL, NULL),
(16, 1, 7, 38, '2021-10-07 07:29:36', '2021-10-07 07:29:36', NULL, NULL, NULL, NULL),
(17, 1, 7, 38, '2021-10-07 07:30:03', '2021-10-07 07:30:03', NULL, NULL, NULL, NULL),
(18, 1, 6, 38, '2021-10-07 07:31:15', '2021-10-07 07:31:15', NULL, NULL, NULL, NULL),
(19, 1, 6, 38, '2021-10-07 07:31:42', '2021-10-07 07:31:42', NULL, NULL, NULL, NULL),
(20, 1, 7, 8, '2021-10-07 07:33:25', '2021-10-07 07:33:25', NULL, NULL, NULL, NULL),
(21, 1, 6, 38, '2021-10-07 07:44:39', '2021-10-07 07:44:39', NULL, NULL, NULL, NULL),
(22, 1, 7, 8, '2021-10-07 07:45:35', '2021-10-07 07:45:35', NULL, NULL, NULL, NULL),
(23, 1, 6, 38, '2021-10-07 08:12:19', '2021-10-07 08:12:19', NULL, NULL, NULL, NULL),
(24, 1, 7, 38, '2021-10-07 08:13:21', '2021-10-07 08:13:21', NULL, NULL, NULL, NULL),
(25, 1, 6, 38, '2021-10-07 08:14:00', '2021-10-07 08:14:00', NULL, NULL, NULL, NULL),
(26, 1, 6, 38, '2021-10-07 08:15:25', '2021-10-07 08:15:25', NULL, NULL, NULL, NULL),
(27, 1, 6, 38, '2021-10-07 08:16:03', '2021-10-07 08:16:03', NULL, NULL, NULL, NULL),
(28, 1, 6, 46, '2021-10-07 08:20:50', '2021-10-07 08:20:50', NULL, NULL, NULL, NULL),
(29, 1, 6, 8, '2021-10-07 08:25:00', '2021-10-07 08:25:00', NULL, NULL, NULL, NULL),
(30, 1, 7, 8, '2021-10-07 08:25:55', '2021-10-07 08:25:55', NULL, NULL, NULL, NULL),
(31, 1, 6, 8, '2021-10-07 08:30:05', '2021-10-07 08:30:05', NULL, NULL, NULL, NULL),
(32, 1, 6, 8, '2021-10-07 08:33:04', '2021-10-07 08:33:04', NULL, NULL, NULL, NULL),
(33, 1, 6, 8, '2021-10-07 08:34:17', '2021-10-07 08:34:17', NULL, NULL, NULL, NULL),
(34, 1, 6, 8, '2021-10-07 08:34:31', '2021-10-07 08:34:31', NULL, NULL, NULL, NULL),
(35, 1, 6, 8, '2021-10-07 08:36:10', '2021-10-08 08:11:16', 3, NULL, NULL, NULL),
(36, 1, 6, 38, '2021-10-08 02:03:44', '2021-10-08 02:03:44', NULL, NULL, NULL, NULL),
(37, 1, 6, 38, '2021-10-08 02:05:24', '2021-10-08 02:05:24', NULL, NULL, NULL, NULL),
(38, 1, 6, 8, '2021-10-08 02:08:46', '2021-10-08 02:08:46', NULL, NULL, NULL, NULL),
(39, 1, 6, 8, '2021-10-08 02:10:02', '2021-10-08 02:10:02', NULL, NULL, NULL, NULL),
(40, 1, 6, 8, '2021-10-08 02:11:45', '2021-10-08 02:11:45', NULL, NULL, NULL, NULL),
(41, 1, 6, 8, '2021-10-09 01:41:03', '2021-10-09 01:49:44', 3, NULL, NULL, NULL),
(42, 1, 6, 38, '2021-10-11 02:54:39', '2021-10-11 02:55:14', 4, NULL, NULL, NULL),
(43, 1, 6, 8, '2021-10-11 03:02:22', '2021-10-11 03:02:22', NULL, NULL, NULL, NULL),
(44, 1, 6, 38, '2021-10-11 03:05:21', '2021-10-11 03:05:21', NULL, NULL, NULL, NULL),
(45, 1, 6, 8, '2021-10-11 03:30:46', '2021-10-11 03:30:46', NULL, NULL, NULL, NULL),
(46, 1, 6, 8, '2021-10-11 03:31:06', '2021-10-11 03:31:06', NULL, NULL, NULL, NULL),
(47, 1, 6, 8, '2021-10-11 06:27:30', '2021-10-11 06:27:30', NULL, NULL, NULL, NULL),
(48, 1, 7, 8, '2021-10-11 07:03:01', '2021-10-11 07:03:01', NULL, NULL, NULL, NULL),
(49, 1, 6, 8, '2021-10-11 07:04:29', '2021-10-11 07:04:29', NULL, NULL, NULL, NULL),
(50, 1, 6, 8, '2021-10-11 07:11:50', '2021-10-11 07:11:50', NULL, NULL, NULL, NULL),
(51, 1, 6, 8, '2021-10-11 07:24:29', '2021-10-11 07:24:29', NULL, NULL, NULL, NULL),
(52, 1, 6, 8, '2021-10-11 07:57:51', '2021-10-11 07:57:51', NULL, NULL, NULL, NULL),
(53, 1, 6, 8, '2021-10-11 08:16:11', '2021-10-11 08:16:11', NULL, NULL, NULL, NULL),
(54, 1, 6, 8, '2021-10-11 08:17:58', '2021-10-11 08:17:58', NULL, NULL, NULL, NULL),
(55, 1, 6, 8, '2021-10-11 08:22:40', '2021-10-11 08:22:40', NULL, NULL, NULL, NULL),
(56, 1, 6, 8, '2021-10-11 08:23:44', '2021-10-11 08:23:44', NULL, NULL, NULL, NULL),
(57, 1, 7, 8, '2021-10-11 08:25:48', '2021-10-11 08:25:48', NULL, NULL, NULL, NULL),
(58, 1, 6, 8, '2021-10-11 08:32:10', '2021-10-11 08:32:10', NULL, NULL, NULL, NULL),
(59, 1, 6, 8, '2021-10-11 08:34:51', '2021-10-11 08:34:51', NULL, NULL, NULL, NULL),
(60, 1, 7, 8, '2021-10-11 08:36:07', '2021-10-11 08:36:07', NULL, NULL, NULL, NULL),
(61, 1, 6, 8, '2021-10-11 08:42:54', '2021-10-11 08:42:54', NULL, NULL, NULL, NULL),
(62, 1, 7, 8, '2021-10-11 08:52:44', '2021-10-11 08:52:44', NULL, NULL, NULL, NULL),
(63, 1, 6, 8, '2021-10-11 08:54:55', '2021-10-11 08:54:55', NULL, NULL, NULL, NULL),
(64, 1, 6, 8, '2021-10-11 08:56:13', '2021-10-11 08:56:13', NULL, NULL, NULL, NULL),
(65, 1, 6, 8, '2021-10-11 08:58:12', '2021-10-11 08:58:12', NULL, NULL, NULL, NULL),
(66, 1, 6, 8, '2021-10-11 08:58:43', '2021-10-11 08:58:43', NULL, NULL, NULL, NULL),
(67, 1, 6, 8, '2021-10-11 11:27:08', '2021-12-18 06:34:46', 4, NULL, NULL, NULL),
(68, 1, 6, 8, '2021-10-12 01:20:25', '2021-10-12 01:20:53', 2, NULL, NULL, NULL),
(69, 1, 6, 8, '2021-10-12 01:41:38', '2021-10-12 01:41:38', NULL, NULL, NULL, NULL),
(70, 1, 6, 8, '2021-10-13 03:56:22', '2021-10-13 03:56:22', NULL, NULL, NULL, NULL),
(71, 1, 6, 8, '2021-10-13 06:17:43', '2021-10-13 06:17:43', NULL, NULL, NULL, NULL),
(72, 1, 6, 8, '2021-10-13 06:19:18', '2021-10-13 06:19:18', NULL, 'di rak no.4', NULL, NULL),
(73, 1, 6, 8, '2021-10-13 06:21:47', '2021-10-13 06:21:47', NULL, 'di rak nomor 1', NULL, NULL),
(75, 1, 50, 8, '2021-12-16 07:25:07', '2021-12-16 07:25:07', 1, 'tes', NULL, NULL),
(76, 1, 50, 8, '2021-12-16 10:56:39', '2021-12-16 10:56:39', 1, 'tes 2', NULL, NULL),
(77, 1, 50, 8, '2021-12-16 11:07:40', '2021-12-16 11:07:40', 1, 'tes 2', NULL, NULL),
(78, 1, 50, 8, '2021-12-16 11:10:41', '2021-12-16 11:10:41', 1, 'tes 2', NULL, NULL),
(79, 1, 50, 8, '2021-12-17 04:03:05', '2021-12-18 06:37:10', 4, 'tes 3', NULL, NULL),
(80, 1, 6, 8, '2022-01-17 03:09:29', '2022-01-17 03:09:29', NULL, 'Coba pesan', NULL, NULL),
(81, 1, 6, 8, '2022-01-17 03:09:44', '2022-01-17 03:09:44', NULL, 'Coba pesan', NULL, NULL),
(83, 1, 6, 8, '2022-01-17 03:11:21', '2022-01-17 03:11:21', 1, 'Coba pesan', NULL, NULL),
(85, 1, 6, 8, '2022-01-17 03:30:06', '2022-01-17 03:30:06', 1, 'Coba pesan', NULL, NULL),
(86, 1, 6, 8, '2022-01-17 03:32:07', '2022-01-17 03:32:07', 1, 'Coba pesan', NULL, NULL),
(87, 1, 6, 8, '2022-01-18 01:46:19', '2022-01-18 01:46:19', NULL, 'Pakaian halus', NULL, NULL),
(88, 1, 6, 8, '2022-01-18 02:25:42', '2022-01-18 02:25:42', NULL, 'tes', NULL, NULL),
(89, 1, 6, 8, '2022-01-18 02:27:45', '2022-01-18 02:27:45', NULL, 'tes', NULL, NULL),
(90, 1, 6, 8, '2022-01-18 03:00:18', '2022-01-18 03:00:18', NULL, 'tes', NULL, NULL),
(91, 1, 6, 8, '2022-01-20 04:54:39', '2022-01-23 01:13:26', 2, 'Coba pesan', NULL, NULL),
(92, 1, 6, 8, '2022-01-20 06:04:56', '2022-01-22 15:49:56', 4, 'Coba pesan', NULL, NULL),
(93, 1, 6, 8, '2022-01-20 06:46:40', '2022-01-20 06:46:40', 4, 'Coba qr', NULL, NULL),
(94, 1, 6, 8, '2022-01-22 01:59:21', '2022-01-22 01:59:21', 1, 'Coba printer', NULL, NULL),
(95, 1, 6, 8, '2022-01-22 02:46:28', '2022-01-22 02:46:28', 1, 'Coba fitur print', NULL, NULL),
(96, 1, 6, 8, '2022-01-22 03:57:04', '2022-01-22 03:57:04', 1, 'sadsfg', NULL, NULL),
(97, 1, 6, 8, '2022-01-22 04:32:35', '2022-01-22 04:32:35', 1, 'asdfs', NULL, NULL),
(98, 1, 62, 8, '2022-01-23 02:48:41', '2022-01-23 02:48:41', 1, 'Coba pesan 1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_services`
--

CREATE TABLE `order_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` bigint(20) NOT NULL DEFAULT 0,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `service_status_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_services`
--

INSERT INTO `order_services` (`id`, `order_id`, `service_id`, `quantity`, `start_at`, `end_at`, `created_at`, `updated_at`, `service_status_id`) VALUES
(1, 1, 1, 4, NULL, NULL, NULL, NULL, 1),
(3, 5, 7, 11, NULL, NULL, NULL, NULL, 1),
(4, 5, 1, 22, NULL, NULL, NULL, NULL, 1),
(5, 6, 7, 11, NULL, NULL, NULL, NULL, 1),
(6, 6, 1, 22, NULL, NULL, NULL, NULL, 1),
(7, 7, 7, 11, NULL, NULL, NULL, NULL, 1),
(8, 7, 1, 22, NULL, NULL, NULL, NULL, 1),
(9, 8, 6, 20, '0000-00-00 00:00:00', NULL, NULL, NULL, 1),
(10, 8, 1, 11, '0000-00-00 00:00:00', NULL, NULL, NULL, 1),
(11, 9, 6, 20, '0000-00-00 00:00:00', NULL, NULL, NULL, 1),
(12, 9, 1, 11, '0000-00-00 00:00:00', NULL, NULL, NULL, 1),
(13, 10, 6, 20, '2021-10-06 17:00:00', NULL, NULL, NULL, 1),
(14, 10, 1, 11, '2021-10-06 17:00:00', NULL, NULL, NULL, 1),
(15, 11, 6, 20, '2021-10-07 00:00:00', NULL, NULL, NULL, 1),
(16, 11, 1, 11, '2021-10-07 00:00:00', NULL, NULL, NULL, 1),
(17, 12, 6, 20, '2021-10-07 00:00:00', NULL, NULL, NULL, 1),
(18, 12, 1, 11, '2021-10-07 00:00:00', NULL, NULL, NULL, 1),
(19, 13, 6, 20, '2021-10-07 00:00:00', NULL, NULL, NULL, 1),
(20, 13, 1, 11, '2021-10-07 00:00:00', NULL, NULL, NULL, 1),
(21, 14, 6, 20, '2021-10-07 00:27:08', NULL, NULL, NULL, 1),
(22, 14, 1, 11, '2021-10-07 00:27:08', NULL, NULL, NULL, 1),
(23, 15, 6, 20, '2021-10-07 07:28:06', NULL, NULL, NULL, 1),
(24, 15, 1, 11, '2021-10-07 07:28:06', NULL, NULL, NULL, 1),
(25, 17, 6, 20, '2021-10-07 07:30:03', '2021-10-07 08:30:03', NULL, NULL, 1),
(26, 17, 1, 11, '2021-10-07 07:30:04', '2021-10-08 07:30:04', NULL, NULL, 1),
(27, 18, 6, 11, '2021-10-07 07:31:15', '2021-10-07 08:31:15', NULL, NULL, 1),
(28, 18, 1, 12, '2021-10-07 07:31:15', '2021-10-08 07:31:15', NULL, NULL, 1),
(29, 19, 6, 11, '2021-10-07 07:31:42', '2021-10-07 08:31:42', NULL, NULL, 1),
(30, 19, 1, 12, '2021-10-07 07:31:42', '2021-10-08 07:31:42', NULL, NULL, 1),
(31, 20, 1, 11, '2021-10-07 07:33:25', '2021-10-08 07:33:25', NULL, NULL, 1),
(32, 20, 6, 22, '2021-10-07 07:33:25', '2021-10-07 08:33:25', NULL, NULL, 1),
(33, 21, 1, 11, '2021-10-07 07:44:39', '2021-10-08 07:44:39', NULL, NULL, 1),
(34, 21, 6, 22, '2021-10-07 07:44:39', '2021-10-07 08:44:39', NULL, NULL, 1),
(35, 22, 6, 22, '2021-10-07 07:45:35', '2021-10-07 08:45:35', NULL, NULL, 1),
(36, 22, 1, 11, '2021-10-07 07:45:35', '2021-10-08 07:45:35', NULL, NULL, 1),
(37, 23, 6, 10, '2021-10-07 08:12:19', '2021-10-07 09:12:19', NULL, NULL, 1),
(38, 24, 6, 10, '2021-10-07 08:13:21', '2021-10-07 09:13:21', NULL, NULL, 1),
(39, 25, 6, 10, '2021-10-07 08:14:00', '2021-10-07 09:14:00', NULL, NULL, 1),
(40, 26, 6, 10, '2021-10-07 08:15:25', '2021-10-07 09:15:25', NULL, NULL, 1),
(41, 27, 6, 10, '2021-10-07 08:16:03', '2021-10-07 09:16:03', NULL, NULL, 1),
(42, 28, 1, 10, '2021-10-07 08:20:50', '2021-10-08 08:20:50', NULL, NULL, 1),
(43, 29, 6, 10, '2021-10-07 08:25:00', '2021-10-07 09:25:00', NULL, NULL, 1),
(44, 30, 1, 10, '2021-10-07 08:25:55', '2021-10-08 08:25:55', NULL, NULL, 1),
(45, 31, 6, 20, '2021-10-07 08:30:05', '2021-10-07 09:30:05', NULL, NULL, 1),
(46, 32, 1, 10, '2021-10-07 08:33:04', '2021-10-08 08:33:04', NULL, NULL, 1),
(47, 33, 1, 10, '2021-10-07 08:34:17', '2021-10-08 08:34:17', NULL, NULL, 1),
(48, 34, 1, 10, '2021-10-07 08:34:31', '2021-10-08 08:34:31', NULL, NULL, 1),
(49, 35, 1, 10, '2021-10-07 08:36:10', '2021-10-08 08:36:10', NULL, NULL, 1),
(50, 36, 6, 10, '2021-10-08 02:03:44', '2021-10-08 03:03:44', NULL, NULL, 1),
(51, 37, 1, 10, '2021-10-08 02:05:24', '2021-10-09 02:05:24', NULL, NULL, 1),
(52, 38, 1, 10, '2021-10-08 02:08:46', '2021-10-09 02:08:46', NULL, NULL, 1),
(53, 39, 1, 10, '2021-10-08 02:10:02', '2021-10-09 02:10:02', NULL, NULL, 1),
(54, 40, 7, 10, '2021-10-08 02:11:45', '2021-10-08 14:11:45', NULL, NULL, 1),
(55, 41, 6, 20, '2021-10-09 01:41:03', '2021-10-09 02:41:03', NULL, NULL, 1),
(56, 41, 1, 10, '2021-10-09 01:41:03', '2021-10-10 01:41:03', NULL, NULL, 1),
(57, 42, 6, 10, '2021-10-11 02:54:39', '2021-10-11 03:54:39', NULL, NULL, 1),
(58, 42, 7, 20, '2021-10-11 02:54:39', '2021-10-11 14:54:39', NULL, NULL, 1),
(59, 44, 1, 20, '2021-10-11 03:05:21', '2021-10-12 03:05:21', NULL, NULL, 1),
(60, 44, 7, 20, '2021-10-11 03:05:21', '2021-10-11 15:05:21', NULL, NULL, 1),
(61, 44, 8, 10, '2021-10-11 03:05:21', '2021-10-11 14:05:21', NULL, NULL, 1),
(62, 44, 1, 20, '2021-10-11 03:05:21', '2021-10-12 03:05:21', NULL, NULL, 1),
(63, 45, 6, 10, '2021-10-11 03:30:46', '2021-10-11 04:30:46', NULL, NULL, 1),
(64, 45, 7, 20, '2021-10-11 03:30:46', '2021-10-11 15:30:46', NULL, NULL, 1),
(65, 46, 1, 10, '2021-10-11 03:31:06', '2021-10-12 03:31:06', NULL, NULL, 1),
(66, 46, 1, 10, '2021-10-11 03:31:06', '2021-10-12 03:31:06', NULL, NULL, 1),
(67, 47, 1, 10, '2021-10-11 06:27:30', '2021-10-12 06:27:30', NULL, NULL, 1),
(68, 48, 1, 10, '2021-10-11 07:03:01', '2021-10-12 07:03:01', NULL, NULL, 1),
(69, 49, 1, 10, '2021-10-11 07:04:29', '2021-10-12 07:04:29', NULL, NULL, 1),
(70, 50, 1, 10, '2021-10-11 07:11:50', '2021-10-12 07:11:50', NULL, NULL, 1),
(71, 51, 7, 10, '2021-10-11 07:24:29', '2021-10-11 19:24:29', NULL, NULL, 1),
(72, 52, 7, 10, '2021-10-11 07:57:51', '2021-10-11 19:57:51', NULL, NULL, 1),
(73, 53, 7, 10, '2021-10-11 08:16:11', '2021-10-11 20:16:11', NULL, NULL, 1),
(74, 54, 8, 10, '2021-10-11 08:17:58', '2021-10-11 19:17:58', NULL, NULL, 1),
(75, 55, 1, 10, '2021-10-11 08:22:40', '2021-10-12 08:22:40', NULL, NULL, 1),
(76, 56, 6, 200, '2021-10-11 08:23:44', '2021-10-11 09:23:44', NULL, NULL, 1),
(77, 57, 1, 10, '2021-10-11 08:25:48', '2021-10-12 08:25:48', NULL, NULL, 1),
(78, 58, 1, 10, '2021-10-11 08:32:10', '2021-10-12 08:32:10', NULL, NULL, 1),
(79, 59, 7, 10, '2021-10-11 08:34:51', '2021-10-11 20:34:51', NULL, NULL, 1),
(80, 60, 7, 10, '2021-10-11 08:36:07', '2021-10-11 20:36:07', NULL, NULL, 1),
(81, 61, 7, 10, '2021-10-11 08:42:54', '2021-10-11 20:42:54', NULL, NULL, 1),
(82, 62, 1, 10, '2021-10-11 08:52:44', '2021-10-12 08:52:44', NULL, NULL, 1),
(83, 63, 7, 10, '2021-10-11 08:54:55', '2021-10-11 20:54:55', NULL, NULL, 1),
(84, 64, 7, 10, '2021-10-11 08:56:13', '2021-10-11 20:56:13', NULL, NULL, 1),
(85, 65, 7, 10, '2021-10-11 08:58:12', '2021-10-11 20:58:12', NULL, NULL, 1),
(86, 66, 6, 10, '2021-10-11 08:58:43', '2021-10-11 09:58:43', NULL, NULL, 1),
(87, 67, 7, 20, '2021-10-11 11:27:08', '2021-10-11 23:27:08', NULL, NULL, 1),
(88, 68, 7, 20, '2021-10-12 01:20:25', '2021-10-12 13:20:25', NULL, NULL, 1),
(89, 69, 6, 10, '2021-10-12 01:41:38', '2021-10-12 02:41:38', NULL, NULL, 1),
(90, 70, 1, 10, '2021-10-13 03:56:22', '2021-10-14 03:56:22', NULL, NULL, 1),
(91, 71, 8, 10, '2021-10-13 06:17:43', '2021-10-13 17:17:43', NULL, NULL, 1),
(92, 72, 6, 10, '2021-10-13 06:19:18', '2021-10-13 07:19:18', NULL, NULL, 1),
(93, 73, 8, 10, '2021-10-13 06:21:47', '2021-10-13 17:21:47', NULL, NULL, 1),
(95, 75, 1, 1, '2021-12-16 07:25:07', '2021-12-17 07:25:07', NULL, NULL, 1),
(96, 76, 1, 1, '2021-12-16 10:56:39', '2021-12-17 10:56:39', NULL, NULL, 1),
(97, 77, 1, 1, '2021-12-16 11:07:40', '2021-12-17 11:07:40', NULL, NULL, 1),
(98, 78, 1, 1, '2021-12-16 11:10:41', '2021-12-17 11:10:41', NULL, NULL, 1),
(99, 79, 6, 1, '2021-12-17 04:03:05', '2021-12-17 05:03:05', NULL, NULL, 1),
(102, 83, 6, 1, '2022-01-17 03:11:21', '2022-01-18 03:11:21', NULL, NULL, 1),
(108, 85, 6, 1, '2022-01-17 03:30:06', '2022-01-18 03:30:06', NULL, NULL, 1),
(114, 91, 14, 12, '2022-01-20 04:54:39', '2022-01-20 05:54:39', NULL, NULL, 1),
(115, 92, 15, 4, '2022-01-20 06:04:56', '2022-01-20 07:04:56', NULL, '2022-01-22 13:48:06', 3),
(116, 92, 16, 1, '2022-01-20 06:04:56', '2022-01-20 16:04:56', NULL, '2022-01-22 13:23:11', 3),
(117, 93, 13, 1, '2022-01-20 06:46:40', '2022-01-20 16:46:40', NULL, '2022-01-21 06:17:01', 2),
(118, 94, 13, 1, '2022-01-22 01:59:21', '2022-01-22 11:59:21', NULL, NULL, NULL),
(119, 95, 15, 15, '2022-01-22 02:46:28', '2022-01-22 03:46:28', NULL, NULL, NULL),
(120, 95, 13, 2, '2022-01-22 02:46:28', '2022-01-22 12:46:28', NULL, NULL, NULL),
(121, 96, 16, 14, '2022-01-22 03:57:04', '2022-01-22 04:57:04', NULL, NULL, NULL),
(122, 97, 16, 1, '2022-01-22 04:32:35', '2022-01-22 05:32:35', NULL, NULL, 1),
(123, 98, 13, 1, '2022-01-23 02:48:41', '2022-01-23 12:48:41', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'pending', 'Cucian itu sudah masuk tapi belum dikerjakan', NULL, NULL),
(2, 'onProcess', 'Cucian sedang dikerjakan', NULL, NULL),
(3, 'complete', 'Cucian sudah selesai dikerjakan, tapi belum diambil', NULL, NULL),
(4, 'accepted', 'Cucian sudah di ambil', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `created_at`, `updated_at`, `price`) VALUES
(1, 'Paket Reguler', 'Paket Gratis untuk Coba-coba', '2021-09-30 19:12:00', '2021-09-30 19:12:51', 50000),
(2, 'Paket Premium', NULL, '2021-09-30 19:12:00', '2021-09-30 19:13:14', 100000),
(3, 'Paket Enterpreneur', NULL, '2021-09-30 19:13:09', '2021-09-30 19:13:09', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `package_contents`
--

CREATE TABLE `package_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_contents`
--

INSERT INTO `package_contents` (`id`, `package_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, '1 cabang', NULL, NULL),
(2, 1, 'unlimited transaksi', NULL, NULL),
(3, 1, 'unlimited  employee', NULL, NULL),
(4, 1, 'unlimited Customer', NULL, NULL),
(5, 1, '3 paket', NULL, NULL),
(6, 2, '5 cabang', NULL, NULL),
(7, 2, 'unlimited  transaksi', NULL, NULL),
(8, 2, 'unlimited employee', NULL, NULL),
(9, 2, 'unlimited Customer', NULL, NULL),
(10, 2, '10 paket', NULL, NULL),
(11, 3, '10 cabang', NULL, NULL),
(12, 3, 'unlimited transaksi', NULL, NULL),
(13, 3, 'unlimited employee', NULL, NULL),
(14, 3, 'unlimited customer', NULL, NULL),
(15, 3, 'unlimited paket', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_limits`
--

CREATE TABLE `package_limits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `entity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit` bigint(20) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_limits`
--

INSERT INTO `package_limits` (`id`, `package_id`, `entity`, `limit`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 'slaves_count', 5, 'Limit Cabang', NULL, NULL),
(2, 1, 'slaves_count', 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_users`
--

CREATE TABLE `package_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expired_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_users`
--

INSERT INTO `package_users` (`id`, `user_id`, `package_id`, `created_at`, `updated_at`, `expired_date`) VALUES
(1, 2, 2, '2021-10-01 03:11:00', '2021-09-30 20:11:59', '2021-12-24 03:11:00'),
(2, 6, 1, NULL, NULL, NULL),
(3, 7, 1, NULL, NULL, NULL),
(4, 8, 1, NULL, NULL, NULL),
(5, 2, 2, '2021-12-13 07:19:10', '2021-12-13 07:19:10', '2022-01-12 07:19:10'),
(7, 56, 1, '2021-12-31 12:06:45', '2021-12-31 12:06:45', '2022-01-07 12:06:45'),
(8, 2, 2, '2022-01-01 03:03:59', '2022-01-01 03:03:59', '2022-01-31 03:03:59'),
(9, 2, 2, '2022-01-01 03:04:32', '2022-01-01 03:04:32', '2022-01-31 03:04:32'),
(10, 2, 2, '2022-01-01 03:05:48', '2022-01-01 03:05:48', '2022-01-31 03:05:48'),
(11, 2, 2, '2022-01-01 03:10:27', '2022-01-01 03:10:27', '2022-01-31 03:10:27'),
(12, 2, 2, '2022-01-01 03:10:53', '2022-01-01 03:10:53', '2022-01-31 03:10:53'),
(13, 2, 2, '2022-01-01 03:13:09', '2022-01-01 03:13:09', '2022-01-31 03:13:09'),
(14, 2, 3, '2022-01-01 03:18:12', '2022-01-01 03:18:12', '2022-01-31 03:18:12'),
(15, 2, 1, '2022-01-01 03:30:46', '2022-01-01 03:30:46', '2022-01-31 03:30:46'),
(16, 63, 1, '2022-01-25 00:13:03', '2022-01-25 00:13:03', '2022-02-01 00:13:03'),
(17, 65, 1, '2022-01-25 00:13:37', '2022-01-25 00:13:37', '2022-02-01 00:13:37'),
(18, 67, 1, '2022-01-25 00:15:56', '2022-01-25 00:15:56', '2022-02-01 00:15:56'),
(19, 68, 1, '2022-01-25 00:16:32', '2022-01-25 00:16:32', '2022-02-01 00:16:32');

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
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-09-27 21:24:44', '2021-09-27 21:24:44');

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` bigint(20) NOT NULL DEFAULT 0,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `value`, `status`, `payment_type`, `payment_id`, `created_at`, `updated_at`) VALUES
(1, 'Pembayaran Lunas', 500000, 'success', 'App\\Models\\Order', 35, NULL, NULL),
(2, 'Pembayaran Lunaas', 50000, 'success', 'App\\Models\\Order', 34, '2021-10-08 01:54:18', '2021-10-08 01:54:18'),
(3, 'Pembayaran Lunaas', 50000, 'success', 'App\\Models\\Order', 34, '2021-10-08 01:54:43', '2021-10-08 01:54:43'),
(4, NULL, 0, '', 'App\\Models\\Order', 37, '2021-10-08 02:05:28', '2021-10-08 02:05:28'),
(5, 'Pembayaran Lunas', 550000, 'success', 'App\\Models\\Order', 39, '2021-10-08 02:10:05', '2021-10-08 02:10:05'),
(6, 'Pembayaran Lunas', 100000, 'success', 'App\\Models\\Order', 40, '2021-10-08 02:11:47', '2021-10-08 02:11:47'),
(7, 'Pembayaran Lunaas', 50000, 'success', 'App\\Models\\Order', 34, '2021-10-08 03:52:37', '2021-10-08 03:52:37'),
(8, 'Pembayaran Lunaas', 50000, 'success', 'App\\Models\\Order', 34, '2021-10-08 03:52:50', '2021-10-08 03:52:50'),
(9, 'Pembayaran Lunas', 950000, 'success', 'App\\Models\\Order', 41, '2021-10-09 01:41:08', '2021-10-09 01:41:08'),
(10, 'Pembayaran Lunas', 400000, 'success', 'App\\Models\\Order', 42, '2021-10-11 02:54:44', '2021-10-11 02:54:44'),
(11, 'Pelunasan', 0, '', 'App\\Models\\Order', 52, '2021-10-11 07:59:50', '2021-10-11 07:59:50'),
(12, 'Pelunasan', 200000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:01:16', '2021-10-11 08:01:16'),
(13, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:01:53', '2021-10-11 08:01:53'),
(14, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:02:07', '2021-10-11 08:02:07'),
(15, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:02:52', '2021-10-11 08:02:52'),
(16, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:03:32', '2021-10-11 08:03:32'),
(17, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:04:09', '2021-10-11 08:04:09'),
(18, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:05:14', '2021-10-11 08:05:14'),
(19, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:05:54', '2021-10-11 08:05:54'),
(20, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:06:54', '2021-10-11 08:06:54'),
(21, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:06:59', '2021-10-11 08:06:59'),
(22, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:08:04', '2021-10-11 08:08:04'),
(23, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:09:30', '2021-10-11 08:09:30'),
(24, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:09:52', '2021-10-11 08:09:52'),
(25, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:10:26', '2021-10-11 08:10:26'),
(26, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:10:37', '2021-10-11 08:10:37'),
(27, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:10:53', '2021-10-11 08:10:53'),
(28, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:11:42', '2021-10-11 08:11:42'),
(29, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:12:29', '2021-10-11 08:12:29'),
(30, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:12:36', '2021-10-11 08:12:36'),
(31, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 52, '2021-10-11 08:15:06', '2021-10-11 08:15:06'),
(32, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 53, '2021-10-11 08:16:18', '2021-10-11 08:16:18'),
(33, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 53, '2021-10-11 08:17:00', '2021-10-11 08:17:00'),
(34, 'DP', 100000, 'success', 'App\\Models\\Order', 54, '2021-10-11 08:18:43', '2021-10-11 08:18:43'),
(35, '1', 150000, 'success', 'App\\Models\\Order', 54, '2021-10-11 08:21:46', '2021-10-11 08:21:46'),
(36, 'Pelunasan', 200000, 'success', 'App\\Models\\Order', 54, '2021-10-11 08:22:21', '2021-10-11 08:22:21'),
(37, '1', 500000, 'success', 'App\\Models\\Order', 55, '2021-10-11 08:22:52', '2021-10-11 08:22:52'),
(38, '1', 3900000, 'success', 'App\\Models\\Order', 56, '2021-10-11 08:24:01', '2021-10-11 08:24:01'),
(39, '2', 3950000, 'success', 'App\\Models\\Order', 56, '2021-10-11 08:25:09', '2021-10-11 08:25:09'),
(40, 'Pelunasan', 4000000, 'success', 'App\\Models\\Order', 56, '2021-10-11 08:25:24', '2021-10-11 08:25:24'),
(41, '1', 5000, 'success', 'App\\Models\\Order', 57, '2021-10-11 08:28:24', '2021-10-11 08:28:24'),
(42, '2', 50000, 'success', 'App\\Models\\Order', 57, '2021-10-11 08:28:40', '2021-10-11 08:28:40'),
(43, 'DP 3', 455000, 'success', 'App\\Models\\Order', 57, '2021-10-11 08:31:08', '2021-10-11 08:31:08'),
(44, 'DP 4', 515000, 'success', 'App\\Models\\Order', 57, '2021-10-11 08:31:32', '2021-10-11 08:31:32'),
(45, 'DP 1', 10000, 'success', 'App\\Models\\Order', 58, '2021-10-11 08:32:17', '2021-10-11 08:32:17'),
(46, 'DP 2', 60000, 'success', 'App\\Models\\Order', 58, '2021-10-11 08:32:30', '2021-10-11 08:32:30'),
(47, 'DP 3', 120000, 'success', 'App\\Models\\Order', 58, '2021-10-11 08:32:44', '2021-10-11 08:32:44'),
(48, 'DP 3', 240000, 'success', 'App\\Models\\Order', 58, '2021-10-11 08:33:19', '2021-10-11 08:33:19'),
(49, 'DP 0', 10000, 'success', 'App\\Models\\Order', 59, '2021-10-11 08:35:00', '2021-10-11 08:35:00'),
(50, 'DP 1', 20000, 'success', 'App\\Models\\Order', 59, '2021-10-11 08:35:09', '2021-10-11 08:35:09'),
(51, 'DP 2', 40000, 'success', 'App\\Models\\Order', 59, '2021-10-11 08:35:15', '2021-10-11 08:35:15'),
(52, 'DP 0', 10000, 'success', 'App\\Models\\Order', 60, '2021-10-11 08:39:53', '2021-10-11 08:39:53'),
(53, 'DP 1', 20000, 'success', 'App\\Models\\Order', 60, '2021-10-11 08:40:01', '2021-10-11 08:40:01'),
(54, 'DP 2', 40000, 'success', 'App\\Models\\Order', 60, '2021-10-11 08:40:06', '2021-10-11 08:40:06'),
(55, 'DP 1', 1000, 'success', 'App\\Models\\Order', 61, '2021-10-11 08:46:17', '2021-10-11 08:46:17'),
(56, 'DP 2', 2000, 'success', 'App\\Models\\Order', 61, '2021-10-11 08:46:27', '2021-10-11 08:46:27'),
(57, 'DP 3', 4000, 'success', 'App\\Models\\Order', 61, '2021-10-11 08:46:33', '2021-10-11 08:46:33'),
(58, 'DP 4', 8000, 'success', 'App\\Models\\Order', 61, '2021-10-11 08:48:57', '2021-10-11 08:48:57'),
(59, 'DP 5', 15000, 'success', 'App\\Models\\Order', 61, '2021-10-11 08:52:25', '2021-10-11 08:52:25'),
(60, 'DP 1', 0, 'success', 'App\\Models\\Order', 62, '2021-10-11 08:52:51', '2021-10-11 08:52:51'),
(61, 'DP 2', 50000, 'success', 'App\\Models\\Order', 62, '2021-10-11 08:53:26', '2021-10-11 08:53:26'),
(62, 'DP 3', 50000, 'success', 'App\\Models\\Order', 62, '2021-10-11 08:53:31', '2021-10-11 08:53:31'),
(63, 'DP 4', 50000, 'success', 'App\\Models\\Order', 62, '2021-10-11 08:53:38', '2021-10-11 08:53:38'),
(64, 'DP 5', 350000, 'success', 'App\\Models\\Order', 62, '2021-10-11 08:54:08', '2021-10-11 08:54:08'),
(65, 'DP 1', 50000, 'success', 'App\\Models\\Order', 63, '2021-10-11 08:54:59', '2021-10-11 08:54:59'),
(66, 'DP 2', 50000, 'success', 'App\\Models\\Order', 63, '2021-10-11 08:55:10', '2021-10-11 08:55:10'),
(67, 'DP 1', 50000, 'success', 'App\\Models\\Order', 64, '2021-10-11 08:56:19', '2021-10-11 08:56:19'),
(68, 'DP 2', 50000, 'success', 'App\\Models\\Order', 64, '2021-10-11 08:56:23', '2021-10-11 08:56:23'),
(69, 'DP 1', 50000, 'success', 'App\\Models\\Order', 65, '2021-10-11 08:58:19', '2021-10-11 08:58:19'),
(70, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 65, '2021-10-11 08:58:22', '2021-10-11 08:58:22'),
(71, 'DP 1', 50000, 'success', 'App\\Models\\Order', 66, '2021-10-11 08:58:50', '2021-10-11 08:58:50'),
(72, 'DP 2', 50000, 'success', 'App\\Models\\Order', 66, '2021-10-11 08:58:53', '2021-10-11 08:58:53'),
(73, 'DP 3', 50000, 'success', 'App\\Models\\Order', 66, '2021-10-11 08:58:56', '2021-10-11 08:58:56'),
(74, 'Pelunasan', 200000, 'success', 'App\\Models\\Order', 66, '2021-10-11 08:59:01', '2021-10-11 08:59:01'),
(75, 'DP 1', 10000, 'success', 'App\\Models\\Order', 67, '2021-10-11 11:27:17', '2021-10-11 11:27:17'),
(76, 'DP 2', 100000, 'success', 'App\\Models\\Order', 67, '2021-10-11 13:16:39', '2021-10-11 13:16:39'),
(77, 'Pelunasan', 200000, 'success', 'App\\Models\\Order', 67, '2021-10-11 13:17:18', '2021-10-11 13:17:18'),
(78, 'DP 1', 10000, 'success', 'App\\Models\\Order', 68, '2021-10-12 01:20:36', '2021-10-12 01:20:36'),
(79, 'DP 2', 90000, 'success', 'App\\Models\\Order', 68, '2021-10-12 01:22:43', '2021-10-12 01:22:43'),
(80, 'Pelunasan', 100000, 'success', 'App\\Models\\Order', 68, '2021-10-12 03:39:31', '2021-10-12 03:39:31'),
(81, 'Pelunasan', 550000, 'success', 'App\\Models\\Order', 70, '2021-10-13 03:56:34', '2021-10-13 03:56:34'),
(82, 'Pelunasan', 50000, 'success', 'App\\Models\\Order', 35, '2021-10-13 06:04:15', '2021-10-13 06:04:15'),
(83, 'Pelunasan', 200000, 'success', 'App\\Models\\Order', 71, '2021-10-13 06:17:48', '2021-10-13 06:17:48'),
(84, 'Pelunasan', 200000, 'success', 'App\\Models\\Order', 72, '2021-10-13 06:19:22', '2021-10-13 06:19:22'),
(85, 'Lunas', 0, 'success', 'App\\Models\\PackageUser', 5, '2021-12-13 07:19:10', '2021-12-13 07:19:10'),
(86, 'Pembayaran 1', 0, 'success', 'App\\Models\\Order', 78, '2021-12-16 11:10:42', '2021-12-16 11:10:42'),
(87, 'Pembayaran 1', 0, 'success', 'App\\Models\\Order', 79, '2021-12-17 04:03:05', '2021-12-17 04:03:05'),
(88, 'Lunas', 100000, 'success', 'App\\Models\\PackageUser', 9, '2022-01-01 03:04:32', '2022-01-01 03:04:32'),
(89, 'Lunas', 100000, 'pending', 'App\\Models\\PackageUser', 10, '2022-01-01 03:05:48', '2022-01-01 03:05:48'),
(90, 'Lunas', 100000, 'pending', 'App\\Models\\PackageUser', 11, '2022-01-01 03:10:27', '2022-01-01 03:10:27'),
(91, 'Lunas', 100000, 'pending', 'App\\Models\\PackageUser', 12, '2022-01-01 03:10:53', '2022-01-01 03:10:53'),
(92, 'Lunas', 100000, 'pending', 'App\\Models\\PackageUser', 13, '2022-01-01 03:13:09', '2022-01-01 03:13:09'),
(93, 'Lunas', 150000, 'pending', 'App\\Models\\PackageUser', 14, '2022-01-01 03:18:12', '2022-01-01 03:18:12'),
(94, 'Lunas', 50000, 'success', 'App\\Models\\PackageUser', 15, '2022-01-01 03:30:46', '2022-01-01 03:30:46'),
(95, 'Pelunasan', 80000, 'success', 'App\\Models\\Order', 89, '2022-01-18 02:27:46', '2022-01-18 02:27:46'),
(96, 'Lunas', 0, 'success', 'App\\Models\\PackageUser', 19, '2022-01-25 00:16:32', '2022-01-25 00:16:32');

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
(1, 'browse_admin', NULL, '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(2, 'browse_bread', NULL, '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(3, 'browse_database', NULL, '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(4, 'browse_media', NULL, '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(5, 'browse_compass', NULL, '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(6, 'browse_menus', 'menus', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(7, 'read_menus', 'menus', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(8, 'edit_menus', 'menus', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(9, 'add_menus', 'menus', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(10, 'delete_menus', 'menus', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(11, 'browse_roles', 'roles', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(12, 'read_roles', 'roles', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(13, 'edit_roles', 'roles', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(14, 'add_roles', 'roles', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(15, 'delete_roles', 'roles', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(16, 'browse_users', 'users', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(17, 'read_users', 'users', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(18, 'edit_users', 'users', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(19, 'add_users', 'users', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(20, 'delete_users', 'users', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(21, 'browse_settings', 'settings', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(22, 'read_settings', 'settings', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(23, 'edit_settings', 'settings', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(24, 'add_settings', 'settings', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(25, 'delete_settings', 'settings', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(26, 'browse_categories', 'categories', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(27, 'read_categories', 'categories', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(28, 'edit_categories', 'categories', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(29, 'add_categories', 'categories', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(30, 'delete_categories', 'categories', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(31, 'browse_posts', 'posts', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(32, 'read_posts', 'posts', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(33, 'edit_posts', 'posts', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(34, 'add_posts', 'posts', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(35, 'delete_posts', 'posts', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(36, 'browse_pages', 'pages', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(37, 'read_pages', 'pages', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(38, 'edit_pages', 'pages', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(39, 'add_pages', 'pages', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(40, 'delete_pages', 'pages', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(41, 'browse_shops', 'shops', '2021-09-27 23:18:21', '2021-09-27 23:18:21'),
(42, 'read_shops', 'shops', '2021-09-27 23:18:21', '2021-09-27 23:18:21'),
(43, 'edit_shops', 'shops', '2021-09-27 23:18:21', '2021-09-27 23:18:21'),
(44, 'add_shops', 'shops', '2021-09-27 23:18:21', '2021-09-27 23:18:21'),
(45, 'delete_shops', 'shops', '2021-09-27 23:18:21', '2021-09-27 23:18:21'),
(46, 'browse_packages', 'packages', '2021-09-30 19:10:59', '2021-09-30 19:10:59'),
(47, 'read_packages', 'packages', '2021-09-30 19:10:59', '2021-09-30 19:10:59'),
(48, 'edit_packages', 'packages', '2021-09-30 19:10:59', '2021-09-30 19:10:59'),
(49, 'add_packages', 'packages', '2021-09-30 19:10:59', '2021-09-30 19:10:59'),
(50, 'delete_packages', 'packages', '2021-09-30 19:10:59', '2021-09-30 19:10:59'),
(51, 'browse_package_users', 'package_users', '2021-09-30 20:09:16', '2021-09-30 20:09:16'),
(52, 'read_package_users', 'package_users', '2021-09-30 20:09:16', '2021-09-30 20:09:16'),
(53, 'edit_package_users', 'package_users', '2021-09-30 20:09:16', '2021-09-30 20:09:16'),
(54, 'add_package_users', 'package_users', '2021-09-30 20:09:16', '2021-09-30 20:09:16'),
(55, 'delete_package_users', 'package_users', '2021-09-30 20:09:16', '2021-09-30 20:09:16'),
(56, 'browse_branches', 'branches', '2021-09-30 23:22:01', '2021-09-30 23:22:01'),
(57, 'read_branches', 'branches', '2021-09-30 23:22:01', '2021-09-30 23:22:01'),
(58, 'edit_branches', 'branches', '2021-09-30 23:22:01', '2021-09-30 23:22:01'),
(59, 'add_branches', 'branches', '2021-09-30 23:22:01', '2021-09-30 23:22:01'),
(60, 'delete_branches', 'branches', '2021-09-30 23:22:01', '2021-09-30 23:22:01'),
(61, 'browse_services', 'services', '2021-10-01 19:12:47', '2021-10-01 19:12:47'),
(62, 'read_services', 'services', '2021-10-01 19:12:47', '2021-10-01 19:12:47'),
(63, 'edit_services', 'services', '2021-10-01 19:12:47', '2021-10-01 19:12:47'),
(64, 'add_services', 'services', '2021-10-01 19:12:47', '2021-10-01 19:12:47'),
(65, 'delete_services', 'services', '2021-10-01 19:12:47', '2021-10-01 19:12:47'),
(66, 'browse_service_categories', 'service_categories', '2021-10-01 19:25:49', '2021-10-01 19:25:49'),
(67, 'read_service_categories', 'service_categories', '2021-10-01 19:25:49', '2021-10-01 19:25:49'),
(68, 'edit_service_categories', 'service_categories', '2021-10-01 19:25:49', '2021-10-01 19:25:49'),
(69, 'add_service_categories', 'service_categories', '2021-10-01 19:25:49', '2021-10-01 19:25:49'),
(70, 'delete_service_categories', 'service_categories', '2021-10-01 19:25:49', '2021-10-01 19:25:49'),
(71, 'browse_orders', 'orders', '2021-10-01 21:49:11', '2021-10-01 21:49:11'),
(72, 'read_orders', 'orders', '2021-10-01 21:49:11', '2021-10-01 21:49:11'),
(73, 'edit_orders', 'orders', '2021-10-01 21:49:11', '2021-10-01 21:49:11'),
(74, 'add_orders', 'orders', '2021-10-01 21:49:11', '2021-10-01 21:49:11'),
(75, 'delete_orders', 'orders', '2021-10-01 21:49:11', '2021-10-01 21:49:11');

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
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-27 21:24:44', '2021-09-27 21:24:44');

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
(1, 'admin', 'Administrator', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(2, 'user', 'Normal User', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(3, 'master', 'Master Akun', '2021-09-28 21:22:45', '2021-09-28 21:23:02'),
(4, 'slave', 'Cabang', '2021-09-28 21:22:53', '2021-09-28 21:22:53'),
(5, 'employee', 'employee', '2021-10-02 08:22:40', '2021-10-02 08:22:59'),
(6, 'customer', 'customer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` bigint(20) NOT NULL DEFAULT 0,
  `process_time` bigint(20) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_category_id`, `name`, `description`, `price`, `process_time`, `is_available`, `created_at`, `updated_at`, `shop_id`) VALUES
(1, 2, 'Layanan Express', NULL, 55000, 24, 1, '2021-10-01 19:29:24', '2021-10-01 19:29:24', 1),
(6, 1, 'Layanan 4', NULL, 20000, NULL, 1, '2021-10-06 00:53:04', '2021-10-06 00:53:04', 1),
(7, 1, 'Layanan ex5', NULL, 10000, 12, 1, '2021-10-06 00:58:37', '2021-10-06 00:58:37', 1),
(8, 1, 'layanan ex6', NULL, 20000, 11, 1, '2021-10-06 01:07:51', '2021-10-06 01:07:51', 1),
(13, 8, 'Reguler Baru', NULL, 10000, 10, 1, '2022-01-19 04:23:29', '2022-01-19 04:23:29', 1),
(14, 8, 'Reguler 1', NULL, 1000, 1, 1, '2022-01-19 04:25:03', '2022-01-19 04:25:03', 1),
(15, 3, 'Reguler 2', NULL, 1000, 1, 1, '2022-01-19 04:25:23', '2022-01-19 04:25:23', 1),
(16, 4, 'Reguler 3', NULL, 1000, 1, 1, '2022-01-19 04:25:42', '2022-01-19 04:25:42', 1),
(17, 4, 'Reguler 4', NULL, 1000, 1, 1, '2022-01-19 04:26:04', '2022-01-19 04:26:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `service_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `description`, `created_at`, `updated_at`, `service_unit_id`, `shop_id`) VALUES
(1, 'Selimut ', '', '2021-10-01 19:27:48', '2021-10-01 19:27:48', 2, NULL),
(2, 'Pakaian Halus', '', '2021-10-01 19:28:00', '2021-10-02 09:22:58', 1, NULL),
(3, 'Selimut Halus', NULL, '2022-01-13 08:13:38', '2022-01-13 08:13:38', 1, 1),
(4, 'Pakaian Halus', NULL, '2022-01-13 08:42:31', '2022-01-13 08:42:31', 1, 1),
(5, 'Pakaian Halus', NULL, '2022-01-13 08:43:54', '2022-01-13 08:43:54', 1, 1),
(8, 'Karpet kasar', NULL, '2022-01-19 02:06:54', '2022-01-19 02:06:54', 2, 1),
(10, 'jeans', NULL, '2022-01-20 02:35:01', '2022-01-20 02:35:01', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_statuses`
--

CREATE TABLE `service_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_statuses`
--

INSERT INTO `service_statuses` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Pending', NULL, NULL, NULL),
(2, 'OnProcess', NULL, NULL, NULL),
(3, 'Complete', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_units`
--

CREATE TABLE `service_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_units`
--

INSERT INTO `service_units` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Kg', NULL, NULL, NULL),
(2, 'Pcs', NULL, NULL, NULL);

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
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `user_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 3, 'Laundry Sukses', 'Laundry di Gunungpati', '2021-09-30 23:15:46', '2021-09-30 23:15:46'),
(14, 54, 'Laundry maju jaya', 'toko cabang baru', '2021-12-31 11:58:40', '2021-12-31 11:58:40'),
(15, 57, 'Laundry Baru', 'Cabang baru di daerah semarang', '2022-01-14 11:28:07', '2022-01-14 11:28:07');

-- --------------------------------------------------------

--
-- Table structure for table `shop_customers`
--

CREATE TABLE `shop_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_customers`
--

INSERT INTO `shop_customers` (`id`, `shop_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 6, NULL, NULL),
(2, 1, 7, NULL, NULL),
(8, 1, 50, NULL, NULL),
(9, 1, 59, NULL, NULL),
(12, 1, 62, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_employees`
--

CREATE TABLE `shop_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_employees`
--

INSERT INTO `shop_employees` (`id`, `shop_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 8, NULL, NULL),
(4, 1, 38, NULL, NULL),
(7, 1, 46, NULL, NULL);

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
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-09-27 21:24:44', '2021-09-27 21:24:44');

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
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `home_address`, `contact_number`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$d/ZjvgxQ1E3ox2vuo4puUOzQzde4RLx84.8dphsJtGr2Amp361BKK', 'hISfZ9AKFSOGNfhS8XbCYnCi4jsSpxGc5BvYQCukbO6lU5rq3VBivh7sGXoD', NULL, '2021-09-27 21:24:44', '2021-09-27 21:24:44', NULL, NULL),
(2, 3, 'master1', 'master1@master1.com', 'users/default.png', NULL, '$2y$10$LP4sk6YygrIVAHi5L7b93.WVzt8taQUF02cIyfQ6yBzpW6wZPSITy', NULL, '{\"locale\":\"en\"}', '2021-09-28 21:23:20', '2021-09-30 19:14:06', NULL, NULL),
(3, 4, 'Slave 1', 'slave1@slave1.com', 'users/default.png', NULL, '$2y$10$xqCuae2Lvfn6SPWi0x0knuWbuYVYfzFDHklop8/WqDeRWGRUWJQae', NULL, NULL, '2021-09-30 23:15:20', '2021-09-30 23:15:20', NULL, NULL),
(5, 3, 'Master 2', 'master2@master2.com', 'users/default.png', NULL, '$2y$10$bVJGWGwUFYPrPNDK8IDFaeT5rugCU82DtI6D82Xye7vWwGfY.NpsS', NULL, NULL, '2021-09-30 23:44:43', '2021-09-30 23:44:43', NULL, NULL),
(6, 6, 'Roni', 'roni@gmail.com', 'users/default.png', NULL, '$2y$10$Jb7wPPsB9u7W4ZPNAfZQpeYCZBlDXQQ7v.Uf4EWZbe2sJbASVoCKO', NULL, NULL, '2021-10-02 08:23:41', '2022-01-22 15:30:35', 'Gunung pati', '08728272811'),
(7, 6, 'Customer2edit', 'customer2@gmail.com', 'users/default.png', NULL, '$2y$10$pVWCtQNW9gg5ctwSi1LrfOpgZMQll88KVwORg8kjkQg.Li2ZROTSm', NULL, NULL, '2021-10-02 08:24:14', '2021-10-06 20:10:53', 'Semarang', '816128'),
(8, 5, 'Roland', 'Rol@gmail.com', 'users/default.png', NULL, '$2y$10$J7ockx3YOI75eFsuVAxc9.2Q7AmtCUEY8ugGz/H7UMUHJHQk07EV6', NULL, NULL, '2021-10-02 08:24:46', '2022-01-22 12:02:44', 'semarang', '082772819182'),
(11, 4, 'slave3', 'slave3@gmail.com', 'users/default.png', NULL, '$2y$10$aKn3XRI8vQ7ZRs85go6FheRcizogBlg3SSTg7kRe2OoYy5TpR3QVe', NULL, NULL, '2021-10-03 18:37:00', '2021-10-03 18:37:00', NULL, NULL),
(13, 4, 'slave4', 'slave4@gmail.com', 'users/default.png', NULL, '$2y$10$GyTCd9iDc/.ZF8HsK98PWu8FsKKJ/xgnv0jm/w7Qozl9ZerbE5/Lm', NULL, NULL, '2021-10-03 18:40:44', '2021-10-03 18:40:44', NULL, NULL),
(14, 4, 'slave5', 'slave5@gmail.com', 'users/default.png', NULL, '$2y$10$615d3G29yLhzuNADojTKKu30Ss1nsKfbVUlFt/kA14BQ3vivFCxr.', NULL, NULL, '2021-10-03 18:42:10', '2021-10-03 18:42:10', NULL, NULL),
(35, 5, 'employee5', 'employee5@employee5.com', 'users/default.png', NULL, '$2y$10$oJq1/hLktasJeZFcKEfMquTmkWbSwa1z/HhKwLKp/dTpCAMRPkcWC', NULL, NULL, '2021-10-05 18:01:24', '2021-10-05 18:01:24', NULL, NULL),
(38, 5, 'Henri', 'henri@gmail.com', 'users/default.png', NULL, '$2y$10$5sRJwFvv6nDaTH258hUT6eyNcqKigChH.EwrROPaaYsaNF4Xj3yMe', NULL, NULL, '2021-10-05 18:24:13', '2022-01-22 11:57:55', NULL, '08273771881912'),
(46, 5, 'Rudi', 'Rudi@gmail.com', 'users/default.png', NULL, '$2y$10$yd.qKEa8iKL.ryDXpqHkEO8JF.oZS307sb3zz2LpXY.zbrL6THELK', NULL, NULL, '2021-10-06 20:26:23', '2022-01-22 12:03:05', 'seamrang', '08272617171'),
(49, 3, 'masterrr', 'master@master.com', 'users/default.png', NULL, '$2y$10$ERhKuS4HTCTBeZnCipvK5uhJkCZyDCcsQmnKgutWKJThKa3U7dr/O', NULL, NULL, '2021-12-13 08:21:05', '2021-12-13 08:21:05', 'Semarang', '98765'),
(50, 6, 'customer baruu', 'customer20@customer.com', 'users/default.png', NULL, '$2y$10$d7LLc.8wvd6O/J3sNaj0yOOGTCOfGZsSXODA8DjRzy0ju4E6B1/OC', NULL, NULL, '2021-12-13 11:22:37', '2021-12-14 11:20:55', 'Semarang', '98765456789'),
(54, 4, 'Slave2', 'slave2@slave2.com', 'users/default.png', NULL, '$2y$10$MJ0QB4m3PDk7fe6dpuIRxODj7xWcZAB.4GHz/ShRRetcTutG8Gh5q', NULL, NULL, '2021-12-31 11:58:40', '2021-12-31 11:58:40', NULL, NULL),
(56, 3, 'Master3', 'master3@master3.com', 'users/default.png', NULL, '$2y$10$6r89S3zhE.cbiAFrIHmIPe2l4tkVIAv40dzNMal2i5jCVwBIJt9pS', NULL, NULL, '2021-12-31 12:06:45', '2021-12-31 12:06:45', 'Jl. No 3 Semarang', '86373738'),
(57, 4, 'Cabang baru', 'newslave@slave.com', 'users/default.png', NULL, '$2y$10$k6ai3svsvS6LiR4qpK7HoOUZHp.yuxCXK6e1VVEpj.WXAsgqXrCN6', NULL, NULL, '2022-01-14 11:28:07', '2022-01-14 11:28:07', NULL, NULL),
(59, 6, 'Customer 3', 'customer3@gmail.com', 'users/default.png', NULL, NULL, NULL, NULL, '2022-01-20 04:09:23', '2022-01-20 04:09:23', 'Semarang', '09876543'),
(62, 6, 'Sulis', 'sulis@gmail.com', 'users/default.png', NULL, '$2y$10$8pJ7PDOCpGpVLry8fYZoKu6OCY1iJEMVmKqEs51Vo5hQkpAnYimkm', NULL, NULL, '2022-01-23 02:05:39', '2022-01-23 02:05:39', 'Semarang', '08292728291'),
(63, 3, 'tes', 'tes@gmail.com', 'users/default.png', NULL, '$2y$10$zGLntPJ0.h6MKgAV9h1xg.tZ9od6kp/bnPjApcZTAhHhYcB1Oar8e', NULL, NULL, '2022-01-25 00:13:03', '2022-01-25 00:13:03', 'Semarang', '087292711'),
(65, 3, 'tes', 'tes1@gmail.com', 'users/default.png', NULL, '$2y$10$TpB6iSm0j4ckLHf.UH/qyu6YmWWcKDZd8UHM8q.wGkhohMZEeHpDe', NULL, NULL, '2022-01-25 00:13:37', '2022-01-25 00:13:37', 'Semarang', '087292711'),
(67, 3, 'tes', 'tes2@gmail.com', 'users/default.png', NULL, '$2y$10$RpxNk7a1VFc5Skd/iwHzc.kRC8a2O.wM6DI8mUIbBRYmfUlolLdH6', NULL, NULL, '2022-01-25 00:15:56', '2022-01-25 00:15:56', 'Semarang', '087292711'),
(68, 3, 'tes', 'tes3@gmail.com', 'users/default.png', NULL, '$2y$10$Pg0CELNzoAgj8u8i67YisuEGWBrkj2LRDNqSpSGdVxkBHRPOpM6Ri', NULL, NULL, '2022-01-25 00:16:32', '2022-01-25 00:16:32', 'Semarang', '087292711');

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
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_user_id_foreign` (`user_id`),
  ADD KEY `attendances_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_master_id_foreign` (`master_id`),
  ADD KEY `branches_slave_id_foreign` (`slave_id`);

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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_shop_id_foreign` (`shop_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_employee_id_foreign` (`employee_id`),
  ADD KEY `orders_order_status_id_foreign` (`order_status_id`);

--
-- Indexes for table `order_services`
--
ALTER TABLE `order_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_services_order_id_foreign` (`order_id`),
  ADD KEY `order_services_service_id_foreign` (`service_id`),
  ADD KEY `order_services_service_status_id_foreign` (`service_status_id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_contents`
--
ALTER TABLE `package_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_contents_package_id_foreign` (`package_id`);

--
-- Indexes for table `package_limits`
--
ALTER TABLE `package_limits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_limits_package_id_foreign` (`package_id`);

--
-- Indexes for table `package_users`
--
ALTER TABLE `package_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_users_user_id_foreign` (`user_id`),
  ADD KEY `package_users_package_id_foreign` (`package_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_payment_type_payment_id_index` (`payment_type`,`payment_id`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_service_category_id_foreign` (`service_category_id`),
  ADD KEY `services_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_categories_service_unit_id_foreign` (`service_unit_id`),
  ADD KEY `service_categories_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `service_statuses`
--
ALTER TABLE `service_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_units`
--
ALTER TABLE `service_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_user_id_foreign` (`user_id`);

--
-- Indexes for table `shop_customers`
--
ALTER TABLE `shop_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_customers_shop_id_foreign` (`shop_id`),
  ADD KEY `shop_customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `shop_employees`
--
ALTER TABLE `shop_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_employees_shop_id_foreign` (`shop_id`),
  ADD KEY `shop_employees_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `order_services`
--
ALTER TABLE `order_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_contents`
--
ALTER TABLE `package_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `package_limits`
--
ALTER TABLE `package_limits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package_users`
--
ALTER TABLE `package_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `service_statuses`
--
ALTER TABLE `service_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_units`
--
ALTER TABLE `service_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `shop_customers`
--
ALTER TABLE `shop_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shop_employees`
--
ALTER TABLE `shop_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_master_id_foreign` FOREIGN KEY (`master_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branches_slave_id_foreign` FOREIGN KEY (`slave_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_services`
--
ALTER TABLE `order_services`
  ADD CONSTRAINT `order_services_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_services_service_status_id_foreign` FOREIGN KEY (`service_status_id`) REFERENCES `service_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `package_contents`
--
ALTER TABLE `package_contents`
  ADD CONSTRAINT `package_contents_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `package_limits`
--
ALTER TABLE `package_limits`
  ADD CONSTRAINT `package_limits_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `package_users`
--
ALTER TABLE `package_users`
  ADD CONSTRAINT `package_users_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `package_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD CONSTRAINT `service_categories_service_unit_id_foreign` FOREIGN KEY (`service_unit_id`) REFERENCES `service_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_categories_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_customers`
--
ALTER TABLE `shop_customers`
  ADD CONSTRAINT `shop_customers_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shop_customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop_employees`
--
ALTER TABLE `shop_employees`
  ADD CONSTRAINT `shop_employees_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shop_employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
