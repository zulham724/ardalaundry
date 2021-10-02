-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Okt 2021 pada 06.02
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ardalaundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `master_id` bigint(20) UNSIGNED NOT NULL,
  `slave_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `branches`
--

INSERT INTO `branches` (`id`, `master_id`, `slave_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'Cabang Jakarta', NULL, '2021-09-30 23:23:53', '2021-09-30 23:23:53'),
(2, 2, 4, 'Cabang Bali', NULL, '2021-09-30 23:43:00', '2021-09-30 23:45:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
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
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-09-27 21:24:44', '2021-09-27 21:24:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_rows`
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
-- Dumping data untuk tabel `data_rows`
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
(103, 14, 'service_belongsto_service_category_relationship', 'relationship', 'Kategori', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\ServiceCategory\",\"table\":\"service_categories\",\"type\":\"belongsTo\",\"column\":\"service_category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attendances\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_types`
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
-- Dumping data untuk tabel `data_types`
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
(15, 'service_categories', 'service-categories', 'Kategori Layanan', 'Kategori Layanan', 'voyager-new', 'App\\Models\\ServiceCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-10-01 19:25:49', '2021-10-01 19:25:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-09-27 21:24:35', '2021-09-27 21:24:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_items`
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
-- Dumping data untuk tabel `menu_items`
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
(19, 1, 'Kategori Layanan', '', '_self', 'voyager-new', NULL, NULL, 20, '2021-10-01 19:25:49', '2021-10-01 19:25:49', 'voyager.service-categories.index', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
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
(77, '2021_10_02_021406_add_shop_id_in_services_table', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_access_tokens`
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
-- Dumping data untuk tabel `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('078e34db948a8c33900996560ddc7809898a306c0ad075a9670878642c2a17d148497bfd1e7b7df0', 1, 2, NULL, '[]', 0, '2021-09-28 18:55:01', '2021-09-28 18:55:01', '2022-09-29 01:55:01'),
('13e29324146feb5f16efdea4b29aaddf2c9debc1f68404ec3a75b7b64d2cf1e79a4470e2b5010ae5', 1, 2, NULL, '[]', 0, '2021-09-28 19:08:57', '2021-09-28 19:08:57', '2022-09-29 02:08:57'),
('16170c7fd64a388b5f11f135ce0155e0bcbd5685d212bed335ea004d9fd599031e7abf9438961446', 1, 2, NULL, '[]', 0, '2021-09-30 18:53:09', '2021-09-30 18:53:09', '2022-10-01 01:53:09'),
('16da2fd6e0b19b8fb7741cc2795fc76812b98187de27ae5a7bff680400616ae958eaf9b6b4a754d2', 1, 2, NULL, '[]', 0, '2021-09-28 01:33:41', '2021-09-28 01:33:41', '2022-09-28 08:33:41'),
('1d2be9f833062e2ec33bdc4e70dc298492c6885dd83e942068f4963d422061ca98026e4ce724c224', 2, 2, NULL, '[]', 0, '2021-09-30 18:53:29', '2021-09-30 18:53:29', '2022-10-01 01:53:29'),
('1e8e0ac60aff80d7bde8e98893bae57245e20a1129a21483640b16266e2aa4fe2f6925fcec26c475', 1, 2, NULL, '[]', 0, '2021-09-30 18:52:40', '2021-09-30 18:52:40', '2022-10-01 01:52:40'),
('2d06c4dbffb0e9aa6a681609b6fcd7ce4698abeaabbbeeed51db1c51a246acf542172385568e1182', 1, 2, NULL, '[]', 0, '2021-09-30 19:31:53', '2021-09-30 19:31:53', '2022-10-01 02:31:53'),
('302e402a964ecdea790d1437a345e96cb00e7167efeca9ac409244020245dbe516c5cd3e6e78d7da', 1, 2, NULL, '[]', 0, '2021-09-28 19:33:43', '2021-09-28 19:33:43', '2022-09-29 02:33:43'),
('395f035a2b7db86d56e95666e2fc7024cceb95cf01d24056062dab5826d6cda72deb853fc819bbac', 1, 2, NULL, '[]', 0, '2021-09-30 18:35:47', '2021-09-30 18:35:47', '2022-10-01 01:35:47'),
('43818df7484f582a4702f1903a8da3665b8baefc785e60255fb7271cd5ced65c08261ea3ee317748', 1, 2, NULL, '[]', 0, '2021-09-28 19:04:38', '2021-09-28 19:04:38', '2022-09-29 02:04:38'),
('45686e91e8d49d92ff163a2314a055f7a797033afba5fcd2924fd4ae652e3e0b4ee72e873ae659c2', 1, 2, NULL, '[]', 0, '2021-09-30 21:00:15', '2021-09-30 21:00:15', '2022-10-01 04:00:15'),
('4ba749760a27edefe3854f9889b99df4a1d1aff47b2cb0fc4f0432678981b6385d7fd61893c9a05e', 1, 2, NULL, '[]', 0, '2021-09-28 01:33:57', '2021-09-28 01:33:57', '2022-09-28 08:33:57'),
('4cc78d6e0229c5b7c011bc5dc09215f5208d9ee5f68814fffd13439fcbd722f431ded7f2f23e61af', 1, 2, NULL, '[]', 0, '2021-09-30 18:52:14', '2021-09-30 18:52:14', '2022-10-01 01:52:14'),
('51b122a0243eb4108b6031b1d7bb02fea0a77a29fd5ec8511ab959b6e57b3a9bd2d549f274ab76c1', 1, 2, NULL, '[]', 0, '2021-09-28 19:08:25', '2021-09-28 19:08:25', '2022-09-29 02:08:25'),
('58dc337d1219e605d9e8d0aa63ba948050434f52901265492b70b7e6dbb0694467b8d9ddb8f41604', 1, 2, NULL, '[]', 0, '2021-09-28 20:13:38', '2021-09-28 20:13:38', '2022-09-29 03:13:38'),
('5d8a16031a42a555d13eddd48944a604411f111daa131ce41e940da71b3b1d00024cb549a713a940', 1, 2, NULL, '[]', 0, '2021-09-28 01:32:14', '2021-09-28 01:32:14', '2022-09-28 08:32:14'),
('5ed09663750912cd56f9ba09e72eba5d54eb6dc51d3e0e72110bfd4c2a90028e06d363d02f1677c6', 1, 2, NULL, '[]', 0, '2021-09-28 20:13:15', '2021-09-28 20:13:15', '2022-09-29 03:13:15'),
('620846a1438755a06d1ebfed38cb464b4d30ab364eb4c6ca9012a87666333204bb0413ceeeae0fa8', 1, 2, NULL, '[]', 0, '2021-09-28 01:31:40', '2021-09-28 01:31:40', '2022-09-28 08:31:40'),
('6adad9e1bb85ec963eb668cc8875c7f8b8ac1cf5f79c9a3a5f82e901f10a3effc0c79efad2b95852', 2, 2, NULL, '[]', 0, '2021-09-30 23:08:16', '2021-09-30 23:08:16', '2022-10-01 06:08:16'),
('7b86dadf93ecfe5740f8a2dec133bb0c7628970bd4ace3865417a74981075cbb830bc0fc7cecd5e9', 2, 2, NULL, '[]', 0, '2021-09-28 21:30:08', '2021-09-28 21:30:08', '2022-09-29 04:30:08'),
('86d946e2a888843a0cbba5f821c5dd4d3c9ccb174f483a8c9461fbaa492d2a7c204ca32af6662d71', 1, 2, NULL, '[]', 0, '2021-09-28 19:12:06', '2021-09-28 19:12:06', '2022-09-29 02:12:06'),
('8fc2b29c2dbdceffef348f50548ae587a493b5b24b4acf3aecc49dc9ba7a8933163c073e1389a8dc', 1, 2, NULL, '[]', 0, '2021-09-28 01:32:53', '2021-09-28 01:32:53', '2022-09-28 08:32:53'),
('970eca226033604b91d9aa435b99bc4d7847efbd33cf8a73cd400e7e9b1219eaa9f4369b33cbd4aa', 1, 2, NULL, '[]', 0, '2021-09-28 01:30:49', '2021-09-28 01:30:49', '2022-09-28 08:30:49'),
('98e82605e654e571345e8bc8ef377c33e733b75c48447da2db5b4e4d664fb5020c91c2d0872f5f14', 1, 2, NULL, '[]', 0, '2021-09-28 01:32:50', '2021-09-28 01:32:50', '2022-09-28 08:32:50'),
('a5eb6e445fd8a6ae3169fd6bf9836b0a934c2ab1db753c0a5bee5defad72f792d4aa20946e7f6a3d', 1, 2, NULL, '[]', 0, '2021-09-28 19:29:16', '2021-09-28 19:29:16', '2022-09-29 02:29:16'),
('adafe751ebeb30f2728b21b48cbdcb6ae06e2589c99329da21f86f63153a8bd7245e40838a476c7f', 1, 2, NULL, '[]', 0, '2021-09-28 01:30:14', '2021-09-28 01:30:14', '2022-09-28 08:30:14'),
('c0eeb17868ec92c080c7d266d5166af22926755126a949e00c70210e0f0afe9d54251911ffb3ac0d', 1, 2, NULL, '[]', 0, '2021-09-28 19:30:19', '2021-09-28 19:30:19', '2022-09-29 02:30:19'),
('cc89048718faea03881ac7592ecc2bad249f47a49b2ab5d9c5b7947f384694bfd0f17e23ca0a7fd2', 1, 2, NULL, '[]', 0, '2021-09-28 19:09:03', '2021-09-28 19:09:03', '2022-09-29 02:09:03'),
('d391e716f3e9f563d83c935921a4dff7d6d8f5d2e52acd0c80c5b848cb712f0673f29744b8b04771', 1, 2, NULL, '[]', 0, '2021-09-28 01:34:19', '2021-09-28 01:34:19', '2022-09-28 08:34:19'),
('dbf52c1a8b75d5e8fd3a87e51aa73a2372b105a9ffedd0fc733d5d90d488e9ec99e3c067ea124a33', 1, 2, NULL, '[]', 0, '2021-09-28 01:26:05', '2021-09-28 01:26:05', '2022-09-28 08:26:05'),
('e12a8fa03be12bc5613c259b3fc7048c4196c41b09ac20e367201c01c54a62c77fde3da8f9d32a04', 1, 2, NULL, '[]', 0, '2021-09-30 23:04:38', '2021-09-30 23:04:38', '2022-10-01 06:04:38'),
('e4e9e3d8d7178af78e4d49f2557ccf0e255600467d330ae44f3f34682ae96b00c40b52c3c7eb824a', 1, 2, NULL, '[]', 0, '2021-09-28 01:26:44', '2021-09-28 01:26:44', '2022-09-28 08:26:44'),
('efec00ccf321e4dc6ea1a42ce7cce55cba2f2baa513f53e2ed44165046063438e1725178db28f6ff', 1, 2, NULL, '[]', 0, '2021-09-28 19:12:35', '2021-09-28 19:12:35', '2022-09-29 02:12:35'),
('f605bdfb526ae6e4df5a2da8c3018c0a66917add6ddb940216f8f9f2c1668b2f5f9bf018a820bf94', 1, 2, NULL, '[]', 0, '2021-09-28 18:54:37', '2021-09-28 18:54:37', '2022-09-29 01:54:37'),
('fa82077c1cce2ac38a8b47a2f6ebe7fd09557195cda1457e88a85ee4cd1cc266809df93a986c68da', 2, 2, NULL, '[]', 0, '2021-09-30 21:00:33', '2021-09-30 21:00:33', '2022-10-01 04:00:33'),
('ffd0193f1674ba463b72e3dbfc2b9cd9725faaae5746e3edf635ea22e05d768214bc96240e29df89', 1, 2, NULL, '[]', 0, '2021-09-30 18:47:52', '2021-09-30 18:47:52', '2022-10-01 01:47:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_auth_codes`
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
-- Struktur dari tabel `oauth_clients`
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
-- Dumping data untuk tabel `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'chTxiTZVDBoa0KI8HgNpCDg3vbqI5S8QG4bC5cpJ', NULL, 'http://localhost', 1, 0, 0, '2021-09-27 21:26:19', '2021-09-27 21:26:19'),
(2, NULL, 'Laravel Password Grant Client', 'N62KQsBzDyc4npIW1pIMkBRygQgRuyyNxas0P3PK', 'users', 'http://localhost', 0, 1, 0, '2021-09-27 21:26:19', '2021-09-27 21:26:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-09-27 21:26:19', '2021-09-27 21:26:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('02de212e0dde6bbc35b3b45f68ebfd82f18b9f51414dbef49e9de9ea67f1eadbfee0a42c795d2f32', '13e29324146feb5f16efdea4b29aaddf2c9debc1f68404ec3a75b7b64d2cf1e79a4470e2b5010ae5', 0, '2022-09-29 02:08:57'),
('07ca7bff8bdc738b23689ddf6437e67160fc95195a44f1c4cd602761235c4fdaf3fcd033dd8115cb', '5d8a16031a42a555d13eddd48944a604411f111daa131ce41e940da71b3b1d00024cb549a713a940', 0, '2022-09-28 08:32:14'),
('0d86dd57d77f37f4f51a0ac022b8b72315593e0d4d3caffeded603225b2a70fc00e49d12b0c2c856', '45686e91e8d49d92ff163a2314a055f7a797033afba5fcd2924fd4ae652e3e0b4ee72e873ae659c2', 0, '2022-10-01 04:00:15'),
('0daf505554adcdfd2430ea0b1a9509540c089673c8d91c55be942869c918c3ea8feb275ceab313a9', '6adad9e1bb85ec963eb668cc8875c7f8b8ac1cf5f79c9a3a5f82e901f10a3effc0c79efad2b95852', 0, '2022-10-01 06:08:16'),
('17aef2b64fad3ad11567f52c095c0d3cf17bf9964cff69a92dfa3fc9402a6c7a4458b8849daf656e', 'd391e716f3e9f563d83c935921a4dff7d6d8f5d2e52acd0c80c5b848cb712f0673f29744b8b04771', 0, '2022-09-28 08:34:19'),
('23c0079730d95a3351e7bd1eefe460afa0304afab6a2245ee82ada0fd652ee42b0a5b4401096e105', '395f035a2b7db86d56e95666e2fc7024cceb95cf01d24056062dab5826d6cda72deb853fc819bbac', 0, '2022-10-01 01:35:47'),
('25232077309d4105623d45f85e38b185bbc3b7eec0475c31cc745f08129fd1df2901a9f82d08c2b5', '43818df7484f582a4702f1903a8da3665b8baefc785e60255fb7271cd5ced65c08261ea3ee317748', 0, '2022-09-29 02:04:38'),
('31840b32bda9434461425dc832f44714c6d98f591199ed422b524aba327b76a8362b772862dbf6ca', '4cc78d6e0229c5b7c011bc5dc09215f5208d9ee5f68814fffd13439fcbd722f431ded7f2f23e61af', 0, '2022-10-01 01:52:14'),
('3eff491537aee61e37c95e3e450dd5f17c175276e148fd037be839bec687979587ee040c77837c8c', '7b86dadf93ecfe5740f8a2dec133bb0c7628970bd4ace3865417a74981075cbb830bc0fc7cecd5e9', 0, '2022-09-29 04:30:08'),
('4687e0fb949d5f0a39752759352b608217118410c6ed4d46c923639c42d32dfdd26f68d7150abdaf', 'efec00ccf321e4dc6ea1a42ce7cce55cba2f2baa513f53e2ed44165046063438e1725178db28f6ff', 0, '2022-09-29 02:12:35'),
('4af732ab9f4b3cf3f00171a196fe27fcbae26bd88b8e921389b2596f812ffcf0b7aff88eb2d34d8c', '1d2be9f833062e2ec33bdc4e70dc298492c6885dd83e942068f4963d422061ca98026e4ce724c224', 0, '2022-10-01 01:53:29'),
('5e4dc19eead0482f422392b00cb5ec2feebd315a231c2ccb0807bd6cc8aaf9fe5355879fce0a2b71', '86d946e2a888843a0cbba5f821c5dd4d3c9ccb174f483a8c9461fbaa492d2a7c204ca32af6662d71', 0, '2022-09-29 02:12:06'),
('6000a9f48ed69ff50ae5808f8cdb2512b70ef060ebff1eb5b8a2d6cf0eb686f3282de6937fd1cb45', 'dbf52c1a8b75d5e8fd3a87e51aa73a2372b105a9ffedd0fc733d5d90d488e9ec99e3c067ea124a33', 0, '2022-09-28 08:26:05'),
('6b93249b8b944e7302d525a04c7abae5aa0bcd38aa9fbfa58c125367d4ec9a8f8622aa23b61e6235', '98e82605e654e571345e8bc8ef377c33e733b75c48447da2db5b4e4d664fb5020c91c2d0872f5f14', 0, '2022-09-28 08:32:50'),
('799837fb0c5443963bb108d9a39dd1f9b4deed48c64938cab2dced05698daad442e6000e6cc222df', 'e4e9e3d8d7178af78e4d49f2557ccf0e255600467d330ae44f3f34682ae96b00c40b52c3c7eb824a', 0, '2022-09-28 08:26:44'),
('7b1ff5197c630660569afdeb974b75ecf4d019c3a70222d897ab5c57a0e2d9920d19bf2bfab0bef0', '302e402a964ecdea790d1437a345e96cb00e7167efeca9ac409244020245dbe516c5cd3e6e78d7da', 0, '2022-09-29 02:33:43'),
('7d5fbad62c71bcfea082467c2f5b7d9380f0dda1e0d85497ee1491592dfac03b601762d709a1de7d', 'fa82077c1cce2ac38a8b47a2f6ebe7fd09557195cda1457e88a85ee4cd1cc266809df93a986c68da', 0, '2022-10-01 04:00:33'),
('80fa8dd02c410a9dd65ff712afae0a0777b701acaebd971e4075106c8301a152a6da74d2b0b3293a', '16da2fd6e0b19b8fb7741cc2795fc76812b98187de27ae5a7bff680400616ae958eaf9b6b4a754d2', 0, '2022-09-28 08:33:41'),
('85ff37778ff10b9dc8d04b4844de3f29a784dabb9d094bf656bd3540de84bc557daf4eb01f36b61f', 'ffd0193f1674ba463b72e3dbfc2b9cd9725faaae5746e3edf635ea22e05d768214bc96240e29df89', 0, '2022-10-01 01:47:52'),
('8a9c0f9afbe0a6ce50d00001677032723129ed4d6835d9b0588ecfceba1a8e585f84e58b73c7dacf', '8fc2b29c2dbdceffef348f50548ae587a493b5b24b4acf3aecc49dc9ba7a8933163c073e1389a8dc', 0, '2022-09-28 08:32:53'),
('918a6bef1d311c8dca731bb56bca0e2300800b445e24acf87962ef6d875681f461266b082f7f9e62', 'c0eeb17868ec92c080c7d266d5166af22926755126a949e00c70210e0f0afe9d54251911ffb3ac0d', 0, '2022-09-29 02:30:19'),
('91e35c912c7dbe08d1f2956a877db390d52a565988ef9ef56891b73a5e5d9b1e67e55728e886cc6a', '4ba749760a27edefe3854f9889b99df4a1d1aff47b2cb0fc4f0432678981b6385d7fd61893c9a05e', 0, '2022-09-28 08:33:57'),
('93f5ea29753370baeecee3a1c9c66ad8e77abc39ff68557631253835c5670c8858d6207a7f3efec2', '5ed09663750912cd56f9ba09e72eba5d54eb6dc51d3e0e72110bfd4c2a90028e06d363d02f1677c6', 0, '2022-09-29 03:13:15'),
('a079fbecb521f358fd82fad660faad64bc9d5f6ea6ca68ecfcf676976d0a0cd63f3f71d7d388b011', '970eca226033604b91d9aa435b99bc4d7847efbd33cf8a73cd400e7e9b1219eaa9f4369b33cbd4aa', 0, '2022-09-28 08:30:49'),
('a1464ab4423cbc86eae4102757d563c337245354ced0b832cf274d1ca9e7068cb1ee3d66568d1a82', '620846a1438755a06d1ebfed38cb464b4d30ab364eb4c6ca9012a87666333204bb0413ceeeae0fa8', 0, '2022-09-28 08:31:40'),
('a566432419155cd20b51314268ff784b3e677da122d80fc69e22499ac3ec2334b3bfddd338be93d5', 'f605bdfb526ae6e4df5a2da8c3018c0a66917add6ddb940216f8f9f2c1668b2f5f9bf018a820bf94', 0, '2022-09-29 01:54:37'),
('ac67c488227aaad3c47f59c9929bdf557155484fb04ac4fce7c7dbb4f402165e001b7b1bda1e6e2a', '51b122a0243eb4108b6031b1d7bb02fea0a77a29fd5ec8511ab959b6e57b3a9bd2d549f274ab76c1', 0, '2022-09-29 02:08:25'),
('aec413d2b198924e94abd3d2ac5d05316a3ebb52b9659b7324456d34e8de0cff0f726b4fbe00d784', 'cc89048718faea03881ac7592ecc2bad249f47a49b2ab5d9c5b7947f384694bfd0f17e23ca0a7fd2', 0, '2022-09-29 02:09:03'),
('b5011522164544b95e5eeb28ee3d7e69de5a73b2f9685013e3c0281c6937d302fd623958dbcfcd9e', '58dc337d1219e605d9e8d0aa63ba948050434f52901265492b70b7e6dbb0694467b8d9ddb8f41604', 0, '2022-09-29 03:13:38'),
('b8e351ac188a1477352b5527607be1b5f696eb4c0d8fe0f5862f4b80f7ab2e33a49f3f854af3b650', 'e12a8fa03be12bc5613c259b3fc7048c4196c41b09ac20e367201c01c54a62c77fde3da8f9d32a04', 0, '2022-10-01 06:04:38'),
('bc6648eee4b4d8551b206a48571535cc299905067fb499828ebd80b57828576957ee8d47723a2d8c', 'a5eb6e445fd8a6ae3169fd6bf9836b0a934c2ab1db753c0a5bee5defad72f792d4aa20946e7f6a3d', 0, '2022-09-29 02:29:16'),
('c0c2b5e29df4c04114cb4cf3128f08e2ae92d12924d82fe02e09374c42e5348f302ea701df19e97b', '2d06c4dbffb0e9aa6a681609b6fcd7ce4698abeaabbbeeed51db1c51a246acf542172385568e1182', 0, '2022-10-01 02:31:53'),
('dcbaa5fadd07c994a44fdcaff0473e8b6720aa873a2f67d36baa3507a830df29b4e0ac0f3c265605', '1e8e0ac60aff80d7bde8e98893bae57245e20a1129a21483640b16266e2aa4fe2f6925fcec26c475', 0, '2022-10-01 01:52:40'),
('e79b58a3f849fede208d345434adfea8cca5cfeaea8e15052e02adfcdf3ef8c3e037216c10d92f0e', 'adafe751ebeb30f2728b21b48cbdcb6ae06e2589c99329da21f86f63153a8bd7245e40838a476c7f', 0, '2022-09-28 08:30:14'),
('f69b3a65a9357e96adec8a51dd16bd5c9451d8f83ead6636ff551edfeccd2cb83d38812f86682120', '078e34db948a8c33900996560ddc7809898a306c0ad075a9670878642c2a17d148497bfd1e7b7df0', 0, '2022-09-29 01:55:01'),
('fdeb22501e2e2e6a76b62dd1dec93438c8e02984575462cdaed0a46c3182bc01c9a1476343f088d7', '16170c7fd64a388b5f11f135ce0155e0bcbd5685d212bed335ea004d9fd599031e7abf9438961446', 0, '2022-10-01 01:53:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_servioces`
--

CREATE TABLE `order_servioces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Paket Free', 'Paket Gratis untuk Coba-coba', '2021-09-30 19:12:00', '2021-09-30 19:12:51'),
(2, 'Paket Premium', NULL, '2021-09-30 19:12:00', '2021-09-30 19:13:14'),
(3, 'Paket Enterpreneur', NULL, '2021-09-30 19:13:09', '2021-09-30 19:13:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `package_users`
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
-- Dumping data untuk tabel `package_users`
--

INSERT INTO `package_users` (`id`, `user_id`, `package_id`, `created_at`, `updated_at`, `expired_date`) VALUES
(1, 2, 1, '2021-10-01 03:11:00', '2021-09-30 20:11:59', '2021-12-24 03:11:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
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
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-09-27 21:24:44', '2021-09-27 21:24:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
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
(70, 'delete_service_categories', 'service_categories', '2021-10-01 19:25:49', '2021-10-01 19:25:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permission_role`
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
(70, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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
-- Struktur dari tabel `posts`
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
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-27 21:24:44', '2021-09-27 21:24:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(2, 'user', 'Normal User', '2021-09-27 21:24:35', '2021-09-27 21:24:35'),
(3, 'master', 'Master Akun', '2021-09-28 21:22:45', '2021-09-28 21:23:02'),
(4, 'slave', 'Cabang', '2021-09-28 21:22:53', '2021-09-28 21:22:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `services`
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
-- Dumping data untuk tabel `services`
--

INSERT INTO `services` (`id`, `service_category_id`, `name`, `description`, `price`, `process_time`, `is_available`, `created_at`, `updated_at`, `shop_id`) VALUES
(1, 2, 'Layanan Express', NULL, 55000, 24, 1, '2021-10-01 19:29:24', '2021-10-01 19:29:24', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'kg', 'Kiloan', '2021-10-01 19:27:48', '2021-10-01 19:27:48'),
(2, 'pcs', 'Satuan', '2021-10-01 19:28:04', '2021-10-01 19:28:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
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
-- Dumping data untuk tabel `settings`
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
-- Struktur dari tabel `shops`
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
-- Dumping data untuk tabel `shops`
--

INSERT INTO `shops` (`id`, `user_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 3, 'Laundry Sukses', 'Laundry di Gunungpati', '2021-09-30 23:15:46', '2021-09-30 23:15:46'),
(2, 4, 'Laundry Makmur', NULL, '2021-09-30 23:47:36', '2021-09-30 23:47:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `translations`
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
-- Dumping data untuk tabel `translations`
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
-- Struktur dari tabel `users`
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$d/ZjvgxQ1E3ox2vuo4puUOzQzde4RLx84.8dphsJtGr2Amp361BKK', 'hISfZ9AKFSOGNfhS8XbCYnCi4jsSpxGc5BvYQCukbO6lU5rq3VBivh7sGXoD', NULL, '2021-09-27 21:24:44', '2021-09-27 21:24:44'),
(2, 3, 'master1', 'master1@master1.com', 'users/default.png', NULL, '$2y$10$LP4sk6YygrIVAHi5L7b93.WVzt8taQUF02cIyfQ6yBzpW6wZPSITy', NULL, '{\"locale\":\"en\"}', '2021-09-28 21:23:20', '2021-09-30 19:14:06'),
(3, 4, 'Slave 1', 'slave1@slave1.com', 'users/default.png', NULL, '$2y$10$xqCuae2Lvfn6SPWi0x0knuWbuYVYfzFDHklop8/WqDeRWGRUWJQae', NULL, NULL, '2021-09-30 23:15:20', '2021-09-30 23:15:20'),
(4, 4, 'Slave 2', 'slave2@slave@.com', 'users/default.png', NULL, '$2y$10$qcNMbDfIdHzTnoP5wY/qJeiYvScZPSc40i/AleKMDt2ZQhSGA6urC', NULL, NULL, '2021-09-30 23:43:05', '2021-09-30 23:43:05'),
(5, 3, 'Master 2', 'master2@master2.com', 'users/default.png', NULL, '$2y$10$bVJGWGwUFYPrPNDK8IDFaeT5rugCU82DtI6D82Xye7vWwGfY.NpsS', NULL, NULL, '2021-09-30 23:44:43', '2021-09-30 23:44:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_master_id_foreign` (`master_id`),
  ADD KEY `branches_slave_id_foreign` (`slave_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indeks untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indeks untuk tabel `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indeks untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_shop_id_foreign` (`shop_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_employee_id_foreign` (`employee_id`);

--
-- Indeks untuk tabel `order_servioces`
--
ALTER TABLE `order_servioces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_servioces_order_id_foreign` (`order_id`),
  ADD KEY `order_servioces_service_id_foreign` (`service_id`);

--
-- Indeks untuk tabel `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `package_users`
--
ALTER TABLE `package_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_users_user_id_foreign` (`user_id`),
  ADD KEY `package_users_package_id_foreign` (`package_id`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_payment_type_payment_id_index` (`payment_type`,`payment_id`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indeks untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indeks untuk tabel `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_service_category_id_foreign` (`service_category_id`),
  ADD KEY `services_shop_id_foreign` (`shop_id`);

--
-- Indeks untuk tabel `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indeks untuk tabel `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT untuk tabel `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `order_servioces`
--
ALTER TABLE `order_servioces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `package_users`
--
ALTER TABLE `package_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_master_id_foreign` FOREIGN KEY (`master_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branches_slave_id_foreign` FOREIGN KEY (`slave_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_servioces`
--
ALTER TABLE `order_servioces`
  ADD CONSTRAINT `order_servioces_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_servioces_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `package_users`
--
ALTER TABLE `package_users`
  ADD CONSTRAINT `package_users_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `package_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ketidakleluasaan untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
