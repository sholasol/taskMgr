-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 05, 2025 at 07:12 PM
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
-- Database: `taskmgr`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
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
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_05_110648_create_projects_table', 1),
(5, '2025_04_05_110702_create_tasks_table', 1);

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
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('active','completed','on_hold') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `user_id`, `description`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Miss Leonor Kerluke', 1, 'Molestiae quia dolorem ullam delectus voluptatem eveniet debitis. Quia esse ipsum placeat sit necessitatibus veritatis eum. Tempora vel ab facilis ut quia aliquid dignissimos.', '2014-03-05', '2024-09-11', 'active', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(2, 'Bonnie Torphy', 1, 'Blanditiis placeat velit veritatis. Quas quis ipsum non ut. Beatae accusantium dolor inventore dolores. Quasi quis magni dolores aut vero in.', '1996-08-22', '2010-05-06', 'active', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(3, 'Caden Hartmann MD', 2, 'Quasi aliquam eius quo voluptatem neque. Dolor laudantium sit sed sed eligendi officia. Possimus dolores sunt pariatur officiis nisi ut quos quod. Voluptas quis quod ut reiciendis earum.', '2022-12-14', '2020-06-13', 'active', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(4, 'Brain Cummerata', 2, 'Accusantium nemo ullam tenetur. Est in cupiditate quae et tempora illum. Distinctio quo aut consectetur pariatur.', '2015-07-22', '1987-08-27', 'completed', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(5, 'Miss Lynn Gleichner', 2, 'Quia error deserunt ad est assumenda sint et. Eos nulla qui et doloribus assumenda ut eos.', '2000-11-29', '2005-06-26', 'active', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(6, 'Patricia Dare Sr.', 3, 'Dolor laborum nesciunt voluptate. Est et sed pariatur. Et perferendis eius qui occaecati aut.', '1975-10-30', '2012-08-26', 'active', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(7, 'Gordon Cole', 4, 'Est sint qui id autem eius explicabo. Et quod qui deserunt ullam delectus porro. Quam et animi est recusandae.', '1995-02-25', '1985-10-29', 'on_hold', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(8, 'Noemi Ledner', 4, 'Enim non minus itaque esse. Quisquam exercitationem reiciendis aut assumenda eum. Quia voluptatum magni accusantium aperiam. Assumenda ratione alias aliquid dolor dignissimos.', '1990-08-17', '2011-10-05', 'completed', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(9, 'Candace Keeling', 5, 'Iusto mollitia quia dolor ad. Dolor dolorem labore fuga voluptatum quia error.', '1984-12-26', '2014-06-04', 'active', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(10, 'Mr. Unique Brekke PhD', 5, 'Tempore aut ut error provident atque labore repellendus. Porro quasi odit iste eos. Et incidunt vel reprehenderit dolore odit voluptatem. Corporis vitae modi distinctio.', '1987-02-27', '1991-10-12', 'completed', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(11, 'Margarita Kunze', 6, 'Distinctio quo qui distinctio aspernatur. Sed dolor natus minus sed explicabo vitae autem. Illum consequatur ipsam fugit quia corporis deserunt.', '2016-03-02', '1976-11-27', 'on_hold', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(12, 'Coalition task', 1, 'This a task manager tasks', NULL, '2025-04-06', 'active', '2025-04-05 12:39:38', '2025-04-05 12:39:38'),
(13, 'Project Web', 1, 'This is a new task', NULL, '2025-04-09', 'active', '2025-04-05 12:40:28', '2025-04-05 12:40:28'),
(14, 'Build Notification', 1, 'Project Notification', NULL, '2025-04-05', 'active', '2025-04-05 12:42:11', '2025-04-05 12:42:11'),
(15, 'Build Project Form', 1, 'Project Notification', NULL, '2025-04-05', 'active', '2025-04-05 12:44:08', '2025-04-05 12:44:08'),
(16, 'Test Testing Task', 1, 'Testing', NULL, '2025-04-08', 'active', '2025-04-05 15:15:00', '2025-04-05 15:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('LBh4lMJoaR4utQU2xJrYaQcfp84GG3m4n0HRUSqE', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:137.0) Gecko/20100101 Firefox/137.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibm0wNjNvZkF6OWtFeDZMTE1PS2FRU3l5NVlFT1c0OE9LVDV2emo3eCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90YXNrP3Byb2plY3RfaWQ9MSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e319', 1743869780);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `priority`, `project_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'Officiis ipsa earum est aut.', 1, 1, 'Edited Corporis cum id quis consequatur nam commodi harum sit eos molestiae.', '2025-04-05 11:01:56', '2025-04-05 15:15:13'),
(2, 'Nihil natus sit sint.', 4, 1, 'Harum dolorum vel pariatur aut omnis minima.', '2025-04-05 11:01:56', '2025-04-05 15:15:13'),
(3, 'Minima est atque dolores.', 2, 1, 'Quidem voluptatem dolore harum aut ratione quae nisi cupiditate omnis.', '2025-04-05 11:01:56', '2025-04-05 15:15:13'),
(4, 'Maxime aperiam officiis fugiat modi repellat.', 1, 2, 'Ipsam recusandae harum voluptas sequi laborum at voluptates harum illo.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(5, 'Eveniet quibusdam laboriosam.', 2, 2, 'Mollitia accusantium explicabo odio omnis a aspernatur nihil beatae.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(6, 'Deserunt pariatur est.', 3, 2, 'Maxime est ipsum repellat placeat in a.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(7, 'Ab suscipit nobis asperiores quidem.', 1, 3, 'Eum delectus et omnis sit architecto reiciendis dolore in voluptates.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(8, 'Distinctio assumenda unde ullam.', 2, 3, 'Et hic qui veniam et nesciunt maiores.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(9, 'Nesciunt vel quisquam et optio.', 3, 3, 'Necessitatibus ratione suscipit eligendi reiciendis vitae aperiam est consectetur nostrum iure animi ipsum dolorem.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(10, 'Vel delectus aut repudiandae.', 4, 3, 'Et totam ex hic eius et fugit quis est enim.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(11, 'Error provident quidem quia.', 1, 4, 'Ullam ex asperiores explicabo culpa earum quia ratione ut nihil libero et harum omnis.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(12, 'Necessitatibus ut et voluptatem pariatur ad.', 2, 4, 'A magni sint quia cupiditate aliquam molestiae corporis qui.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(13, 'Adipisci doloremque corrupti cupiditate.', 3, 4, 'Vero id voluptas et natus voluptas odio quasi dicta.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(14, 'Reiciendis ipsa alias deleniti.', 4, 4, 'Sint enim voluptates et sed sit qui cupiditate recusandae.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(15, 'Necessitatibus accusamus et amet mollitia quod.', 1, 5, 'Nihil maiores dolor nisi id nostrum vero quo tempore.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(16, 'Dolores sunt non expedita.', 2, 5, 'Voluptatibus quia adipisci harum eos voluptatibus voluptatem voluptatem.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(17, 'At quis maxime aut nostrum rerum.', 3, 5, 'Consequatur natus dolorem voluptas saepe eos consequuntur voluptas et quae.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(18, 'Laboriosam qui ipsum nemo.', 1, 6, 'Nam maiores culpa assumenda ut nulla quasi quia fugiat quo est maiores ut nobis.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(19, 'Voluptatibus tempora nisi consequuntur eius ut.', 2, 6, 'Quibusdam rerum possimus et illo aut aut nisi molestiae laudantium natus earum.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(20, 'Ad assumenda reprehenderit.', 3, 6, 'Et dicta saepe ducimus impedit eum ipsum iste harum praesentium.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(21, 'Reiciendis molestias et aliquid explicabo.', 1, 7, 'Dicta voluptate maxime temporibus quia quasi recusandae qui aliquid qui asperiores voluptatem.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(22, 'Ea accusamus expedita.', 2, 7, 'Libero optio quas nisi occaecati velit molestias earum laudantium dignissimos voluptatibus.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(23, 'Molestiae laboriosam est et ut nihil.', 3, 7, 'Voluptatum et adipisci quo atque temporibus beatae magnam nihil recusandae aliquam et.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(24, 'Pariatur et ratione odit.', 4, 7, 'Numquam non aut vero minima blanditiis facilis aut nemo soluta blanditiis voluptatem itaque.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(25, 'Quisquam ipsam quia tempore laborum dolorem.', 1, 8, 'Dolorem est quis est nisi provident dicta exercitationem in fuga.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(26, 'Suscipit itaque voluptates ea et.', 2, 8, 'Nobis aut et non voluptatibus autem nihil fugit in laudantium.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(27, 'Nihil qui modi illum.', 3, 8, 'Sit perferendis perferendis rem nesciunt beatae nihil dolores voluptas.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(28, 'Nesciunt non voluptatem et.', 4, 8, 'Aperiam illum ipsam ullam aut quaerat delectus non assumenda pariatur accusamus quas ad voluptas.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(29, 'Aut doloremque repellendus.', 5, 8, 'Similique adipisci molestiae enim in earum nisi iure ipsum fugiat velit quo autem.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(30, 'Sed incidunt enim voluptatibus.', 1, 9, 'Id placeat et ab sapiente sunt at neque.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(31, 'Et sit asperiores doloremque.', 2, 9, 'Qui iusto ratione et sint aut magnam nisi nemo tenetur corporis deleniti.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(32, 'Eos cupiditate ut.', 3, 9, 'Et sunt deleniti sed ut id nulla temporibus ut.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(33, 'Nihil voluptatibus quae consequatur adipisci.', 4, 9, 'Culpa aut ex fugit officia sapiente ipsam numquam placeat autem.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(34, 'Mollitia voluptas quo autem.', 5, 9, 'Perspiciatis aliquam est ut nisi maxime nulla pariatur quaerat id cupiditate ut sunt.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(35, 'Qui animi non sint.', 1, 10, 'Possimus id amet accusantium autem eum temporibus est omnis labore in animi id est.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(36, 'Ut officia sint modi.', 2, 10, 'Accusamus dolorum aut enim voluptatem facere iste odit.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(37, 'Veniam hic earum rerum voluptas.', 3, 10, 'Libero molestias quae cumque velit aut natus reprehenderit.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(38, 'Voluptatem ad ut.', 4, 10, 'Voluptatem non corrupti sint assumenda consequatur itaque sed.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(39, 'Et rerum dolorem vero voluptas.', 1, 11, 'Totam consequatur culpa tenetur tenetur qui et rerum.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(40, 'Laborum repellat est voluptas et.', 2, 11, 'Dicta qui est tempore quas neque nihil praesentium officiis vitae recusandae incidunt non repellendus.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(41, 'Laborum facere quae ipsum qui modi.', 3, 11, 'Voluptas quia consequatur cupiditate doloremque id vel laborum recusandae.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(42, 'Ea ratione rerum molestiae saepe.', 4, 11, 'Voluptatem porro odit quis iure numquam voluptatibus.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(43, 'Assumenda illo reprehenderit.', 5, 11, 'Numquam qui ut ipsum labore rem sit explicabo.', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(44, 'Notification Task', 2, 14, 'Create notification', '2025-04-05 12:54:53', '2025-04-05 15:04:46'),
(45, 'Modify the notification', 1, 14, 'Modification of the task', '2025-04-05 12:56:12', '2025-04-05 15:04:46'),
(46, 'New Task Added now', 1, 15, 'This comment is just added and Edited', '2025-04-05 13:38:01', '2025-04-05 13:38:20'),
(47, 'New Tasks', 2, 15, 'New Task', '2025-04-05 13:41:15', '2025-04-05 13:41:15'),
(49, 'New Testing Task', 3, 15, 'Testing', '2025-04-05 14:13:52', '2025-04-05 14:13:52'),
(50, 'Reordering', 3, 1, 'Reodering task', '2025-04-05 14:19:58', '2025-04-05 15:15:13');

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
(1, 'Admin User', 'admin@admin.com', NULL, '$2y$12$2ez6CDb01m5xicE0hje31OlXWDwENr7m3WW/Sd7fQrWGZRoHIPS9S', NULL, '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(2, 'Godfrey Kirlin', 'bcronin@example.net', '2025-04-05 11:01:56', '$2y$12$f4F.spmRiOtESy7hRb2m6OyBF29ON4n5.Hw9jM3MnqgEyljvIwY5C', 'A9JBUmBk3K', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(3, 'Neoma Daniel V', 'gusikowski.jaime@example.net', '2025-04-05 11:01:56', '$2y$12$f4F.spmRiOtESy7hRb2m6OyBF29ON4n5.Hw9jM3MnqgEyljvIwY5C', 'IAT95oO0r2', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(4, 'Audie Blick', 'gabriel.gerlach@example.org', '2025-04-05 11:01:56', '$2y$12$f4F.spmRiOtESy7hRb2m6OyBF29ON4n5.Hw9jM3MnqgEyljvIwY5C', 'Kcfj6TwTN7', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(5, 'Shawna Von DDS', 'lexie75@example.net', '2025-04-05 11:01:56', '$2y$12$f4F.spmRiOtESy7hRb2m6OyBF29ON4n5.Hw9jM3MnqgEyljvIwY5C', '1EpmKhA7Di', '2025-04-05 11:01:56', '2025-04-05 11:01:56'),
(6, 'Matteo Lockman I', 'charvey@example.com', '2025-04-05 11:01:56', '$2y$12$f4F.spmRiOtESy7hRb2m6OyBF29ON4n5.Hw9jM3MnqgEyljvIwY5C', 'DRHZ6a7Dwt', '2025-04-05 11:01:56', '2025-04-05 11:01:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
