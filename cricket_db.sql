-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 24, 2019 at 11:09 AM
-- Server version: 5.7.27
-- PHP Version: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cricket_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add user', 6, 'add_user'),
(17, 'Can change user', 6, 'change_user'),
(18, 'Can delete user', 6, 'delete_user'),
(19, 'Can add base modal', 7, 'add_basemodal'),
(20, 'Can change base modal', 7, 'change_basemodal'),
(21, 'Can delete base modal', 7, 'delete_basemodal'),
(22, 'Can add country', 8, 'add_country'),
(23, 'Can change country', 8, 'change_country'),
(24, 'Can delete country', 8, 'delete_country'),
(25, 'Can add match', 9, 'add_match'),
(26, 'Can change match', 9, 'change_match'),
(27, 'Can delete match', 9, 'delete_match'),
(28, 'Can add team', 10, 'add_team'),
(29, 'Can change team', 10, 'change_team'),
(30, 'Can delete team', 10, 'delete_team'),
(31, 'Can add match player details', 11, 'add_matchplayerdetails'),
(32, 'Can change match player details', 11, 'change_matchplayerdetails'),
(33, 'Can delete match player details', 11, 'delete_matchplayerdetails'),
(34, 'Can add score card', 12, 'add_scorecard'),
(35, 'Can change score card', 12, 'change_scorecard'),
(36, 'Can delete score card', 12, 'delete_scorecard'),
(37, 'Can add score card player', 13, 'add_scorecardplayer'),
(38, 'Can change score card player', 13, 'change_scorecardplayer'),
(39, 'Can delete score card player', 13, 'delete_scorecardplayer'),
(40, 'Can add device detail', 14, 'add_devicedetail'),
(41, 'Can change device detail', 14, 'change_devicedetail'),
(42, 'Can delete device detail', 14, 'delete_devicedetail'),
(43, 'Can view log entry', 1, 'view_logentry'),
(44, 'Can view permission', 2, 'view_permission'),
(45, 'Can view group', 3, 'view_group'),
(46, 'Can view content type', 4, 'view_contenttype'),
(47, 'Can view session', 5, 'view_session'),
(48, 'Can add country', 15, 'add_country'),
(49, 'Can change country', 15, 'change_country'),
(50, 'Can delete country', 15, 'delete_country'),
(51, 'Can view country', 15, 'view_country'),
(52, 'Can add user', 16, 'add_user'),
(53, 'Can change user', 16, 'change_user'),
(54, 'Can delete user', 16, 'delete_user'),
(55, 'Can view user', 16, 'view_user'),
(56, 'Can view match', 9, 'view_match'),
(57, 'Can view score card', 12, 'view_scorecard'),
(58, 'Can view team', 10, 'view_team'),
(59, 'Can view score card player', 13, 'view_scorecardplayer'),
(60, 'Can view match player details', 11, 'view_matchplayerdetails');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(80) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `code`, `name`, `flag`, `created_at`, `updated_at`) VALUES
(1, 'IN', 'India', NULL, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:46.895294'),
(2, 'AUS', 'Australia', NULL, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:46.895294'),
(3, 'SA', 'South Africa', NULL, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:46.895294'),
(4, 'NZ', 'New Zeeland', NULL, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:46.895294'),
(5, 'BD', 'Bangladesh', NULL, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:46.895294'),
(6, 'SL', 'Sri Lanka', NULL, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:46.895294');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-02-28 18:54:12.768369', '1', 'admin', 1, '[{\"added\": {}}]', 3, 1),
(2, '2019-02-28 18:55:15.550505', '1', 'admin@admin.com', 2, '[{\"changed\": {\"fields\": [\"image_uri\", \"user_type\", \"jersy_number\", \"player_type\"]}}]', 6, 1),
(3, '2019-02-28 18:56:20.553404', '1', 'admin@admin.com', 2, '[{\"changed\": {\"fields\": [\"groups\"]}}]', 6, 1),
(4, '2019-02-28 18:57:29.753782', '1', 'India', 1, '[{\"added\": {}}]', 8, 1),
(5, '2019-02-28 18:57:42.556006', '2', 'Australia', 1, '[{\"added\": {}}]', 8, 1),
(6, '2019-02-28 18:57:57.019258', '3', 'South Africa', 1, '[{\"added\": {}}]', 8, 1),
(7, '2019-02-28 18:58:21.706687', '4', 'New Zeeland', 1, '[{\"added\": {}}]', 8, 1),
(8, '2019-02-28 18:58:46.098547', '5', 'Bangladesh', 1, '[{\"added\": {}}]', 8, 1),
(9, '2019-02-28 18:59:07.324903', '6', 'Sri Lanka', 1, '[{\"added\": {}}]', 8, 1),
(10, '2019-02-28 19:00:05.785499', '1', 'India', 1, '[{\"added\": {}}]', 10, 1),
(11, '2019-02-28 19:01:37.408528', '2', 'Australia', 1, '[{\"added\": {}}]', 10, 1),
(12, '2019-02-28 19:02:10.760011', '3', 'South Africa', 1, '[{\"added\": {}}]', 10, 1),
(13, '2019-02-28 19:02:35.434571', '4', 'Sri Lanka', 1, '[{\"added\": {}}]', 10, 1),
(14, '2019-02-28 19:03:17.695851', '5', 'New Zeeland', 1, '[{\"added\": {}}]', 10, 1),
(15, '2019-02-28 19:43:21.920793', '18', 'mickel@dispostable.com', 2, '[{\"changed\": {\"fields\": [\"last_name\", \"image_uri\"]}}]', 6, 1),
(16, '2019-02-28 19:48:03.506817', '6', 'Bangladesh', 1, '[{\"added\": {}}]', 10, 1),
(17, '2019-02-28 19:56:02.023517', '1', 'First leauge-IND-AUS ODI series', 2, '[{\"changed\": {\"fields\": [\"match_date\", \"match_result\"]}}]', 9, 1),
(18, '2019-02-28 19:58:29.910740', '2', 'Second leauge-IND-AUS ODI series', 2, '[{\"changed\": {\"fields\": [\"match_date\", \"match_result\"]}}]', 9, 1),
(19, '2019-02-28 19:58:42.639073', '2', 'Second leauge-IND-BAN ODI series', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 9, 1),
(20, '2019-02-28 20:10:07.204641', '7', 'Saurabh', 1, '[{\"added\": {}}]', 13, 1),
(21, '2019-02-28 20:10:46.995676', '8', 'Virat', 1, '[{\"added\": {}}]', 13, 1),
(22, '2019-02-28 20:11:31.191104', '9', 'Raina', 1, '[{\"added\": {}}]', 13, 1),
(23, '2019-02-28 20:12:10.983547', '10', 'Dhawan', 1, '[{\"added\": {}}]', 13, 1),
(24, '2019-02-28 20:12:52.399348', '11', 'Dhoni', 1, '[{\"added\": {}}]', 13, 1),
(25, '2019-02-28 20:13:52.020021', '12', 'Saurabh', 1, '[{\"added\": {}}]', 13, 1),
(26, '2019-02-28 20:14:41.052785', '13', 'Virat', 1, '[{\"added\": {}}]', 13, 1),
(27, '2019-02-28 20:15:23.960551', '14', 'Raina', 1, '[{\"added\": {}}]', 13, 1),
(28, '2019-02-28 20:16:10.821123', '15', 'Dhoni', 1, '[{\"added\": {}}]', 13, 1),
(29, '2019-02-28 20:17:09.876953', '16', 'Ponting', 1, '[{\"added\": {}}]', 13, 1),
(30, '2019-02-28 20:17:49.194494', '17', 'David', 1, '[{\"added\": {}}]', 13, 1),
(31, '2019-02-28 20:21:06.918274', '18', 'Rishard', 1, '[{\"added\": {}}]', 13, 1),
(32, '2019-02-28 20:22:00.664537', '19', 'Peter', 1, '[{\"added\": {}}]', 13, 1),
(33, '2019-02-28 20:22:49.822962', '20', 'Andrew', 1, '[{\"added\": {}}]', 13, 1),
(34, '2019-02-28 20:27:05.391676', '21', 'tamim', 1, '[{\"added\": {}}]', 13, 1),
(35, '2019-02-28 20:28:06.169700', '22', 'Jahangir', 1, '[{\"added\": {}}]', 13, 1),
(36, '2019-02-28 20:29:06.464740', '23', 'Rafigul', 1, '[{\"added\": {}}]', 13, 1),
(37, '2019-02-28 20:30:01.166381', '24', 'Azhar', 1, '[{\"added\": {}}]', 13, 1),
(38, '2019-02-28 20:30:43.696731', '25', 'Ponting', 1, '[{\"added\": {}}]', 13, 1),
(39, '2019-02-28 20:31:51.236029', '26', 'David', 1, '[{\"added\": {}}]', 13, 1),
(40, '2019-02-28 20:32:41.335012', '27', 'Rishard', 1, '[{\"added\": {}}]', 13, 1),
(41, '2019-02-28 20:33:25.987887', '28', 'Andrew', 1, '[{\"added\": {}}]', 13, 1),
(42, '2019-02-28 20:35:40.096584', '29', 'K Rodes', 1, '[{\"added\": {}}]', 13, 1),
(43, '2019-02-28 20:36:29.464715', '30', 'Mickel', 1, '[{\"added\": {}}]', 13, 1),
(44, '2019-02-28 20:37:12.419178', '31', 'Alpha', 1, '[{\"added\": {}}]', 13, 1),
(45, '2019-02-28 20:38:09.302076', '32', 'Brain', 1, '[{\"added\": {}}]', 13, 1),
(46, '2019-02-28 20:38:57.449587', '33', 'Redmond', 1, '[{\"added\": {}}]', 13, 1),
(47, '2019-09-09 08:31:17.969250', '2', 'saurabh@dispostable.com', 2, '[{\"changed\": {\"fields\": [\"groups\", \"image_uri\", \"player_type\"]}}]', 6, 1),
(48, '2019-09-23 10:16:18.874007', '3', 'virat@dispostable.com', 2, '[{\"changed\": {\"fields\": [\"image_uri\", \"player_type\"]}}]', 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(15, 'core', 'country'),
(16, 'core', 'user'),
(7, 'match', 'basemodal'),
(8, 'match', 'country'),
(14, 'match', 'devicedetail'),
(9, 'match', 'match'),
(11, 'match', 'matchplayerdetails'),
(12, 'match', 'scorecard'),
(13, 'match', 'scorecardplayer'),
(10, 'match', 'team'),
(6, 'match', 'user'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-09-18 08:43:38.967242'),
(2, 'contenttypes', '0002_remove_content_type_name', '2019-09-18 08:43:39.047780'),
(3, 'auth', '0001_initial', '2019-09-18 08:43:39.090812'),
(4, 'auth', '0002_alter_permission_name_max_length', '2019-09-18 08:43:39.179815'),
(5, 'auth', '0003_alter_user_email_max_length', '2019-09-18 08:43:39.271279'),
(6, 'auth', '0004_alter_user_username_opts', '2019-09-18 08:43:39.314297'),
(7, 'auth', '0005_alter_user_last_login_null', '2019-09-18 08:43:39.361086'),
(8, 'auth', '0006_require_contenttypes_0002', '2019-09-18 08:43:39.404973'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2019-09-18 08:43:39.449308'),
(10, 'auth', '0008_alter_user_username_max_length', '2019-09-18 08:43:39.493578'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2019-09-18 08:43:39.538783'),
(12, 'auth', '0010_alter_group_name_max_length', '2019-09-18 08:43:39.581321'),
(13, 'auth', '0011_update_proxy_permissions', '2019-09-18 08:43:39.630429'),
(14, 'core', '0001_initial', '2019-09-18 08:43:39.685494'),
(15, 'admin', '0001_initial', '2019-09-18 08:43:39.743389'),
(16, 'admin', '0002_logentry_remove_auto_add', '2019-09-18 08:43:39.876208'),
(17, 'admin', '0003_logentry_add_action_flag_choices', '2019-09-18 08:43:39.930267'),
(18, 'match', '0001_initial', '2019-09-18 08:43:39.976227'),
(19, 'core', '0002_auto_20190918_0841', '2019-09-18 08:43:40.021170'),
(20, 'sessions', '0001_initial', '2019-09-18 08:43:40.063859'),
(21, 'core', '0003_auto_20190918_0844', '2019-09-18 08:44:47.907219'),
(22, 'match', '0002_auto_20190918_0844', '2019-09-18 11:08:09.948647'),
(23, 'core', '0004_auto_20190918_1122', '2019-09-18 11:22:51.682105'),
(24, 'core', '0005_remove_user_random_string', '2019-09-18 11:23:14.368233'),
(25, 'match', '0003_auto_20190918_1209', '2019-09-18 12:09:50.830271');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4dluwbgaurascufwdtt6zxc91yhzdfn0', 'MzMyZDRhZWQzMmM4OGU5OTViOTBmNTNmZTgxYzVhYTBhZGQzMmU0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTA5ZWMyNTc5MjkzNmRkYjE0ZWY0ZDdjYjUxYmYyNDhmOWI1MzgwIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2019-09-30 13:58:23.929593'),
('773o8y5dt7ecwk6d6h63jzddlzujou0m', 'MmVmMGNlMDdjMGIxNTgwNTNiYmY5NjE3MmM3YmVhNTgyZjVhMjMxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NWVlODA2NTQ2YTNhZTM0MDk1YjVlZjliYWE5YWQ5ZjNmOTJhYjNkIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2019-03-14 19:16:13.830696'),
('9ujamlirf61l2i48i03co5dy3dkcnjxo', 'ZTYwYzcyNjEwODI1Y2Q3MjRkZDZmNGYyNDUxNjNkN2QzNmZjYmFkNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNDE0MWU1ZGM5ZjQ3YzRjZTBlZTY5MmFjYTMzMGEwYjVjYzFlMWUyIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2019-09-23 08:31:29.798854'),
('fcui0vm9arczyknksrc8q3gp62aplrey', 'OGUzZjYwNGRhMzJmYmIxY2VmYWUwNWMwNzkwMTA5NDgzMDYwZTg1OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTA5ZWMyNTc5MjkzNmRkYjE0ZWY0ZDdjYjUxYmYyNDhmOWI1MzgwIn0=', '2019-09-23 08:14:53.948878'),
('kyoi4uggcajlbfq3eqce0sobpgbpfkn7', 'MzMyZDRhZWQzMmM4OGU5OTViOTBmNTNmZTgxYzVhYTBhZGQzMmU0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTA5ZWMyNTc5MjkzNmRkYjE0ZWY0ZDdjYjUxYmYyNDhmOWI1MzgwIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2019-10-01 19:13:06.823680'),
('lqj6rfqir7o5meqfympmnmxrfq7kfn0a', 'MWFkY2ZkOGQzNGJlYTEzNjJiZTBkNGU3ZjJiYTg0NjYzMDAwYzhkODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMTdmNDViMjhkNDQyM2RhMGU5YWJiOWRkOTRkODVjODQ4Mjk1NzUxIn0=', '2019-10-06 13:26:59.089033'),
('r2ljwk3etifu0gipdqz9ccnl1036uxh6', 'MWFkY2ZkOGQzNGJlYTEzNjJiZTBkNGU3ZjJiYTg0NjYzMDAwYzhkODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMTdmNDViMjhkNDQyM2RhMGU5YWJiOWRkOTRkODVjODQ4Mjk1NzUxIn0=', '2019-10-08 03:04:21.403670'),
('rnfpgbf0gushwryh7gk3ac0dbca75hrb', 'MWFkY2ZkOGQzNGJlYTEzNjJiZTBkNGU3ZjJiYTg0NjYzMDAwYzhkODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMTdmNDViMjhkNDQyM2RhMGU5YWJiOWRkOTRkODVjODQ4Mjk1NzUxIn0=', '2019-10-02 11:25:41.816157'),
('s2yhiyv6saxculmtj4ygjkldd3x6t5ks', 'MWFkY2ZkOGQzNGJlYTEzNjJiZTBkNGU3ZjJiYTg0NjYzMDAwYzhkODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMTdmNDViMjhkNDQyM2RhMGU5YWJiOWRkOTRkODVjODQ4Mjk1NzUxIn0=', '2019-10-07 05:26:41.634609'),
('ua9w35hhxv2g80friuthie4ntn4cy41z', 'MWFkY2ZkOGQzNGJlYTEzNjJiZTBkNGU3ZjJiYTg0NjYzMDAwYzhkODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMTdmNDViMjhkNDQyM2RhMGU5YWJiOWRkOTRkODVjODQ4Mjk1NzUxIn0=', '2019-10-07 06:02:23.393430'),
('vpj5osbq3tr8tsj5bk0hu1s0f7ohrazw', 'MWFkY2ZkOGQzNGJlYTEzNjJiZTBkNGU3ZjJiYTg0NjYzMDAwYzhkODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMTdmNDViMjhkNDQyM2RhMGU5YWJiOWRkOTRkODVjODQ4Mjk1NzUxIn0=', '2019-10-06 14:22:35.761855'),
('wb3xx9lx8bvhs3trtgwhbhq10dvtql3s', 'MWFkY2ZkOGQzNGJlYTEzNjJiZTBkNGU3ZjJiYTg0NjYzMDAwYzhkODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMTdmNDViMjhkNDQyM2RhMGU5YWJiOWRkOTRkODVjODQ4Mjk1NzUxIn0=', '2019-10-06 14:06:48.026623'),
('wbbzh77fdlarm5vkesnvqaw41rca5520', 'OGUzZjYwNGRhMzJmYmIxY2VmYWUwNWMwNzkwMTA5NDgzMDYwZTg1OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTA5ZWMyNTc5MjkzNmRkYjE0ZWY0ZDdjYjUxYmYyNDhmOWI1MzgwIn0=', '2019-10-01 19:08:47.574286'),
('x5wwgeiqjvnj7bvr1wj29wjfrfxs8sh9', 'MmVmMGNlMDdjMGIxNTgwNTNiYmY5NjE3MmM3YmVhNTgyZjVhMjMxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NWVlODA2NTQ2YTNhZTM0MDk1YjVlZjliYWE5YWQ5ZjNmOTJhYjNkIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2019-03-14 20:08:06.143833');

-- --------------------------------------------------------

--
-- Table structure for table `match`
--

CREATE TABLE `match` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `match_date` datetime(6) DEFAULT NULL,
  `match_result` varchar(100) DEFAULT NULL,
  `team1_id` int(11) NOT NULL,
  `team2_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT '1970-01-02 00:00:00.000000',
  `updated_at` datetime(6) NOT NULL DEFAULT '1970-01-02 00:00:00.000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `match`
--

INSERT INTO `match` (`id`, `name`, `match_date`, `match_result`, `team1_id`, `team2_id`, `created_at`, `updated_at`) VALUES
(1, 'First leauge-IND-AUS ODI series', '2019-03-02 19:55:49.000000', 'IND won by 7 wicket', 1, 2, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(2, 'Second leauge-IND-BAN ODI series', '2019-03-01 19:58:15.000000', 'BAN won by 2 runs', 1, 6, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(3, 'Third leauge AUS-NZ ODI series', NULL, NULL, 2, 5, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415');

-- --------------------------------------------------------

--
-- Table structure for table `match_player_detail`
--

CREATE TABLE `match_player_detail` (
  `id` int(11) NOT NULL,
  `match_id_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `team_id_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT '2019-09-18 08:44:45.837415',
  `updated_at` datetime(6) NOT NULL DEFAULT '2019-09-18 08:44:45.837415'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `score_card`
--

CREATE TABLE `score_card` (
  `id` int(11) NOT NULL,
  `runs` int(11) NOT NULL,
  `wicket` int(11) NOT NULL,
  `over` double NOT NULL,
  `status` varchar(10) NOT NULL,
  `point` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT '2019-09-18 08:44:45.837415',
  `updated_at` datetime(6) NOT NULL DEFAULT '2019-09-18 08:44:45.837415'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `score_card`
--

INSERT INTO `score_card` (`id`, `runs`, `wicket`, `over`, `status`, `point`, `match_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 323, 8, 50, 'won', 3, 1, 1, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(2, 320, 10, 45.4, 'loss', 0, 1, 2, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(3, 245, 5, 48.2, 'draw', 1, 2, 1, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(4, 245, 7, 50, 'draw', 1, 2, 6, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(5, 305, 10, 50, 'loss', 0, 3, 2, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(6, 311, 6, 48.3, 'won', 3, 3, 5, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415');

-- --------------------------------------------------------

--
-- Table structure for table `score_card_player`
--

CREATE TABLE `score_card_player` (
  `id` int(11) NOT NULL,
  `runs` int(11) NOT NULL,
  `wicket` int(11) NOT NULL,
  `over` double NOT NULL,
  `fifty` int(11) NOT NULL,
  `hundred` int(11) NOT NULL,
  `meadan_over` double NOT NULL,
  `fours` int(11) NOT NULL,
  `sixs` int(11) NOT NULL,
  `man_of_match` tinyint(1) NOT NULL,
  `status` varchar(10) NOT NULL,
  `player_id_id` int(11) NOT NULL,
  `score_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT '2019-09-18 08:44:45.837415',
  `updated_at` datetime(6) NOT NULL DEFAULT '2019-09-18 08:44:45.837415'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `score_card_player`
--

INSERT INTO `score_card_player` (`id`, `runs`, `wicket`, `over`, `fifty`, `hundred`, `meadan_over`, `fours`, `sixs`, `man_of_match`, `status`, `player_id_id`, `score_id`, `created_at`, `updated_at`) VALUES
(7, 60, 1, 1, 1, 0, 0, 8, 2, 0, 'out', 2, 1, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(8, 120, 1, 0, 0, 1, 0, 12, 3, 0, 'out', 3, 1, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(9, 30, 4, 7, 0, 0, 1, 1, 1, 0, 'out', 4, 1, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(10, 90, 3, 5, 1, 0, 1, 3, 2, 0, 'out', 5, 1, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(11, 120, 1, 0, 0, 1, 0, 12, 3, 0, 'out', 6, 1, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(12, 101, 1, 2, 0, 1, 0, 10, 3, 0, 'out', 2, 3, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(13, 132, 2, 5, 0, 1, 0, 12, 5, 0, 'notout', 3, 3, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(14, 86, 2, 4, 1, 0, 0, 5, 1, 0, 'out', 4, 3, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(15, 79, 1, 2, 1, 0, 0, 6, 2, 0, 'notout', 6, 3, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(16, 80, 1, 2, 1, 0, 0, 5, 1, 0, 'out', 7, 2, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(17, 102, 0, 0, 0, 1, 0, 6, 2, 0, 'notout', 8, 2, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(18, 65, 2, 8, 1, 0, 1, 4, 1, 0, 'out', 9, 2, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(19, 96, 3, 8, 1, 0, 2, 4, 1, 1, 'notout', 10, 2, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(20, 145, 1, 2, 0, 1, 0, 15, 3, 0, 'notout', 11, 2, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(21, 140, 3, 5, 1, 1, 1, 5, 2, 0, 'notout', 23, 4, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(22, 91, 2, 6, 1, 0, 0, 5, 2, 0, 'notout', 24, 4, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(23, 102, 6, 6, 1, 1, 1, 8, 2, 0, 'out', 25, 4, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(24, 125, 5, 4, 1, 1, 0, 10, 3, 0, 'out', 26, 4, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(25, 104, 0, 0, 1, 1, 0, 12, 5, 0, 'out', 7, 5, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(26, 89, 1, 5, 1, 0, 0, 9, 4, 0, 'notout', 8, 5, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(27, 84, 5, 7, 1, 1, 1, 6, 4, 1, 'notout', 9, 5, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(28, 106, 2, 5, 1, 1, 1, 8, 4, 0, 'notout', 11, 5, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(29, 150, 1, 1, 2, 1, 0, 15, 6, 1, 'out', 17, 6, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(30, 120, 6, 4, 2, 1, 1, 12, 4, 0, 'out', 18, 6, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(31, 200, 0, 0, 4, 2, 0, 25, 10, 0, 'out', 20, 6, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(32, 155, 1, 0, 3, 1, 0, 15, 5, 0, 'out', 21, 6, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(33, 111, 2, 5, 2, 1, 0, 12, 6, 0, 'out', 22, 6, '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `logo_uri` varchar(100) NOT NULL,
  `club_state` varchar(80) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT '2019-09-18 08:44:45.837415',
  `updated_at` datetime(6) NOT NULL DEFAULT '2019-09-18 08:44:45.837415'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `logo_uri`, `club_state`, `created_at`, `updated_at`) VALUES
(1, 'India', 'team_logo/india_h2kcf1K.jpeg', 'Indian Cricket team', '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(2, 'Australia', 'team_logo/austrilia_pC1V2cV.png', 'Team Austri', '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(3, 'South Africa', 'team_logo/southA.png', 'South Flag', '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(4, 'Sri Lanka', 'team_logo/sriL.png', 'Sri Lanka Fan Club', '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(5, 'New Zeeland', 'team_logo/westI.jpeg', 'New Zee Young club', '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415'),
(6, 'Bangladesh', 'team_logo/cri-logo1.jpg', 'Bangla Worriers', '2019-09-18 08:44:45.837415', '2019-09-18 08:44:45.837415');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `image_uri` varchar(100) NOT NULL,
  `user_type` varchar(15) NOT NULL,
  `jersy_number` varchar(5) NOT NULL,
  `player_type` varchar(20) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`, `image_uri`, `user_type`, `jersy_number`, `player_type`, `country_id`, `team_id`) VALUES
(1, 'pbkdf2_sha256$150000$4CWwPfgwduod$4rQtjK9AZ2rssPA1pnK9k67HnJ8gYiZlUZBi6C0D/Ls=', '2019-09-24 03:04:21.347363', 1, 'admin', '', '', 1, 1, '2019-02-28 18:53:40.000000', 'admin@admin.com', 'image_user/aus_7GHu87Z.jpeg', 'admin', '1', 'batsman', NULL, NULL),
(2, 'pbkdf2_sha256$150000$ZAIhwpXGv8tF$JC/XffNILezh9x+YYgGOxDYYpxLHjW74IUUwxY9yxH8=', '2019-09-09 08:31:29.728648', 0, 'saurabh@dispostable.com', 'Saurabh', 'Player one', 0, 1, '2019-02-28 19:12:59.000000', 'saurabh@dispostable.com', 'image_user/5b33c37a1ae6621d008b499c-750-562.jpg', 'player', '1', 'batsman', 1, 1),
(3, 'pbkdf2_sha256$150000$jGD4aoZyjoxa$Yg1rZbJdlchkVlpp4608mfOO2DdGMsoChXCBkagW2yQ=', NULL, 0, 'virat@dispostable.com', 'Virat', 'Player two', 0, 1, '2019-02-28 19:19:10.000000', 'virat@dispostable.com', 'image_user/icon87.png', 'player', '2', 'batsman', 1, 1),
(4, 'pbkdf2_sha256$150000$OxEt7H1XyNMa$XqqnvHLMGN5xWoDitCirgcGVg644PAQlLMBXUm/9P/0=', NULL, 0, 'raina@dispostable.com', 'Raina', 'Player three', 0, 1, '2019-02-28 19:25:58.119836', 'raina@dispostable.com', '', 'player', '2', 'batsman', 1, 1),
(5, 'pbkdf2_sha256$150000$LB8FiCmyR9n8$kgqQYxpE19jU6BZonQnWtaq8t3T0BKMNLgKYC2YpvZs=', NULL, 0, 'dhawan@dispostable.com', 'Dhawan', 'Player four', 0, 1, '2019-02-28 19:26:49.396913', 'dhawan@dispostable.com', '', 'player', '4', 'bowler', 1, 1),
(6, 'pbkdf2_sha256$150000$65zhvrBriXhQ$Lg5pJmSNgP9/i0brL8GnS+JQqgCZ3vBBmuMDco0TnqE=', NULL, 0, 'dhoni@dispostable.com', 'Dhoni', 'Player five', 0, 1, '2019-02-28 19:27:52.475005', 'dhoni@dispostable.com', '', 'player', '6', 'captain', 1, 1),
(7, 'pbkdf2_sha256$150000$lrZEu8ys1lti$NsuoLOqlDy8sIliIi0g9f9xsvjtj9Tou/Rfsr2F0OVU=', NULL, 0, 'ponting@dispostable.com', 'Ponting', 'Player one', 0, 1, '2019-02-28 19:28:45.877081', 'ponting@dispostable.com', '', 'player', '2', 'batsman', 2, 2),
(8, 'pbkdf2_sha256$150000$Tmf0niZm9lVf$d0xLzwMaD9LeMojM7WrcShUqhAelFzZu4HPluOyTAKE=', NULL, 0, 'david@dispostable.com', 'David', 'Player two', 0, 1, '2019-02-28 19:29:32.550954', 'david@dispostable.com', '', 'player', '7', 'captain', 2, 2),
(9, 'pbkdf2_sha256$150000$gUNZPI3OYnx6$JZXmo3BZ+kHHN5hro6w7M0SkiTmf+Jf3WA46PIpI7PA=', NULL, 0, 'richard@dispostable.com', 'Rishard', 'Player three', 0, 1, '2019-02-28 19:30:34.588914', 'richard@dispostable.com', '', 'player', '10', 'wicket keeper', 2, 2),
(10, 'pbkdf2_sha256$150000$YbFYJfVwsFbF$jJTEOiXY37jFMFbsLBuZScpkwAMB9AuiwXw8EsmS0IU=', NULL, 0, 'peter@dispostable.com', 'Peter', 'Player four', 0, 1, '2019-02-28 19:31:46.870281', 'peter@dispostable.com', '', 'player', '11', 'bowler', 2, 2),
(11, 'pbkdf2_sha256$150000$fHm3PLcQQmsY$0p7NM71H/mItAl88eIeI03J7NLJobewLPqPXHTna53c=', NULL, 0, 'andrew@dispostable.com', 'Andrew', 'Player four', 0, 1, '2019-02-28 19:32:32.537452', 'andrew@dispostable.com', '', 'player', '12', 'All rounder', 2, 2),
(12, 'pbkdf2_sha256$150000$oxbzUCrLTuXo$wqc3BThVAo8dq1GXPo9I1yscz1Fpf/iKM0pFqjUiE3U=', NULL, 0, 'peterson@dispostable.com', 'Peterson', 'Player one', 0, 1, '2019-02-28 19:34:22.075445', 'peterson@dispostable.com', '', 'player', '14', 'All rounder', 3, 3),
(13, 'pbkdf2_sha256$150000$coQCxj6u2P7e$B/ev40rn4jXkDOPpOFkGUXv/Ul8d7034cWVqmbzefAE=', NULL, 0, 'john@dispostable.com', 'John', 'Player two', 0, 1, '2019-02-28 19:35:15.435296', 'john@dispostable.com', '', 'player', '15', 'captain', 3, 3),
(14, 'pbkdf2_sha256$150000$sNetawDLYJEa$WGDl6IE+d5YqYL1dXsoEPffKfrBpd+9LsDZoAqx3QQk=', NULL, 0, 'rockey@dispostable.com', 'Rocky', 'Player three', 0, 1, '2019-02-28 19:36:52.981520', 'rockey@dispostable.com', '', 'player', '2', 'batsman', 3, 3),
(15, 'pbkdf2_sha256$150000$GryBldajoXUm$2pRuIJRokebpSr8z547eCjIoZyxO6vDHdiMfKXHzDOI=', NULL, 0, 'jonty@dispostable.com', 'Jonty', 'Player four', 0, 1, '2019-02-28 19:37:42.003677', 'jonty@dispostable.com', '', 'player', '15', 'bowler', 3, 3),
(16, 'pbkdf2_sha256$150000$V1NfauBpoXHf$djDMp1xdqHQVP94AM+SgK4lVcmw2r+mxNtMRVCkNq3s=', NULL, 0, 'gharam@dispostable.com', 'Gharam', 'Player five', 0, 1, '2019-02-28 19:38:26.064783', 'gharam@dispostable.com', '', 'player', '20', 'batsman', 3, 3),
(17, 'pbkdf2_sha256$150000$uivMJGreUu8E$Jw2V8+lfHCLx7HT3ihpVtn5sro9RzgRgjkXGXa+dCD0=', NULL, 0, 'rodes@dispostable.com', 'K Rodes', 'Player one', 0, 1, '2019-02-28 19:39:19.160852', 'rodes@dispostable.com', '', 'player', '12', 'batsman', 4, 5),
(18, 'pbkdf2_sha256$150000$0vJwYMnB6lTe$YRtHHLokO/5MP0q2TTsC7QGNbBdnjjVOGX6dYoh962g=', NULL, 0, 'mickel@dispostable.com', 'Mickel', 'Player two', 0, 1, '2019-02-28 19:40:27.000000', 'mickel@dispostable.com', 'image_user/filder.jpeg', 'player', '12', 'batsman', 4, 5),
(20, 'pbkdf2_sha256$150000$HbvwpvdiTitq$MlzYAkBpufuEr6JDbB4LyEjqIWf+V01YOBxNA+SwYi0=', NULL, 0, 'alpha@dispostable.com', 'Alpha', 'Player three', 0, 1, '2019-02-28 19:42:17.205137', 'alpha@dispostable.com', '', 'player', '12', 'bowler', 4, 5),
(21, 'pbkdf2_sha256$150000$uR2Audt9LTm4$wkaMIihfx71zzMu01aXnX/eJBzflPHY2VLU3ZLSBrmI=', NULL, 0, 'brain@dispostable.com', 'Brain', 'Player four', 0, 1, '2019-02-28 19:45:43.730305', 'brain@dispostable.com', '', 'player', '20', 'bowler', 4, 5),
(22, 'pbkdf2_sha256$150000$eqE5TxhwXhGN$qRz0sTuaTAy8E/1HRD2TUuuME+dQDP1Rkgb+nQDnRxI=', NULL, 0, 'redmond@dispostable.com', 'Redmond', 'Player five', 0, 1, '2019-02-28 19:46:55.634423', 'redmond@dispostable.com', '', 'player', '25', 'wicket keeper', 4, 5),
(23, 'pbkdf2_sha256$150000$BEZUqxSimy4C$wx5bqIPV4EhNdMhc4/whAdtjjzcs5A7SUWmMcJC4ceA=', NULL, 0, 'tamim@dispostable.com', 'tamim', 'Player one', 0, 1, '2019-02-28 19:49:27.781695', 'tamim@dispostable.com', '', 'player', '2', 'batsman', 5, 6),
(24, 'pbkdf2_sha256$150000$tuAIzdrkuQA5$8k8zEtmS/bblosFmQaOdC4/5aWjeI6lqNgBVNGX4wQs=', NULL, 0, 'jahangir@dispostable.com', 'Jahangir', 'Player two', 0, 1, '2019-02-28 19:50:52.914364', 'jahangir@dispostable.com', '', 'player', '22', 'batsman', 5, 6),
(25, 'pbkdf2_sha256$150000$GOAzcJiG0ak5$ghXK5lo8XAatfLj1RBAAxvBCHGO3Sr1JfwVTLm8eTeM=', NULL, 0, 'rafigul@dispostable.com', 'Rafigul', 'Player three', 0, 1, '2019-02-28 19:52:18.467494', 'rafigul@dispostable.com', '', 'player', '12', 'batsman', 5, 6),
(26, 'pbkdf2_sha256$150000$vkVBDnSSshs7$fZXV+8DO5wcuzao6txT7qRhligUn6SRmg3KbMZ7lrBI=', NULL, 0, 'azhar@dispostable.com', 'Azhar', 'Player four', 0, 1, '2019-02-28 19:53:09.863916', 'azhar@dispostable.com', '', 'player', '13', 'All rounder', 5, 6),
(27, '', NULL, 0, 'raj', 'Rafigul', '', 0, 1, '2019-09-23 11:49:45.911289', 'ma22hi99@gmail.com', '', 'player', '12', 'batsman', 1, 1),
(28, '', NULL, 0, 'rajes', 'rajeshs', '', 0, 1, '2019-09-23 12:46:31.293294', 'ma22hi992@gmail.com', '', 'player', '12', 'bowler', 2, 1),
(29, '', NULL, 0, 'admindas', 'ads', 'ad', 0, 1, '2019-09-23 12:47:18.101101', 'ma22hi9923@gmail.com', '', 'player', '34', 'bowler', 2, 1),
(30, '', NULL, 0, 'adminasd', 'rajesh', '', 0, 1, '2019-09-23 12:51:56.791100', 'ma22hi99ads@gmail.com', '', 'player', '45', 'batsman', 1, 1),
(31, '', NULL, 0, 'admin143', 'Rafigul', 'ad', 0, 1, '2019-09-23 12:54:17.541603', 'ma22hi99567@gmail.com', 'image_user/PAN.jpg', 'player', '35434', 'batsman', 3, 2),
(32, 'pbkdf2_sha256$150000$fwSf4Uyqmyfl$8C5Q7xF5bko+xFVmKsFHVCWftAssxWwtxjMQ61ePze0=', '2019-09-24 03:03:06.697786', 0, 'admin12', 'rajesh', 'kumar', 0, 1, '2019-09-24 03:03:06.253836', 'admin@test.com', '', 'P', '', 'all rounder', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_user_permissions`
--

CREATE TABLE `user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`id`),
  ADD KEY `match_team1_id_1702348e_fk_team_id` (`team1_id`),
  ADD KEY `match_team2_id_549268ae_fk_team_id` (`team2_id`);

--
-- Indexes for table `match_player_detail`
--
ALTER TABLE `match_player_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `match_player_detail_match_id_id_bf23b01e_fk_match_id` (`match_id_id`),
  ADD KEY `match_player_detail_player_id_f8330012_fk_user_id` (`player_id`),
  ADD KEY `match_player_detail_team_id_id_e3f8f6b6_fk_team_id` (`team_id_id`);

--
-- Indexes for table `score_card`
--
ALTER TABLE `score_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `score_card_match_id_ec31bc82_fk_match_id` (`match_id`),
  ADD KEY `score_card_team_id_8e90029d_fk_team_id` (`team_id`);

--
-- Indexes for table `score_card_player`
--
ALTER TABLE `score_card_player`
  ADD PRIMARY KEY (`id`),
  ADD KEY `score_card_player_player_id_id_5560a1c2_fk_user_id` (`player_id_id`),
  ADD KEY `score_card_player_score_id_454a2e7c_fk_score_car` (`score_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_country_id_9852a6e8_fk_country_id` (`country_id`),
  ADD KEY `user_team_id_9c9a1513_fk_team_id` (`team_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_groups_user_id_group_id_40beef00_uniq` (`user_id`,`group_id`),
  ADD KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `user_user_permissions`
--
ALTER TABLE `user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id`,`permission_id`),
  ADD KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `match`
--
ALTER TABLE `match`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `match_player_detail`
--
ALTER TABLE `match_player_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `score_card`
--
ALTER TABLE `score_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `score_card_player`
--
ALTER TABLE `score_card_player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_user_permissions`
--
ALTER TABLE `user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_team1_id_1702348e_fk_team_id` FOREIGN KEY (`team1_id`) REFERENCES `team` (`id`),
  ADD CONSTRAINT `match_team2_id_549268ae_fk_team_id` FOREIGN KEY (`team2_id`) REFERENCES `team` (`id`);

--
-- Constraints for table `match_player_detail`
--
ALTER TABLE `match_player_detail`
  ADD CONSTRAINT `match_player_detail_match_id_id_bf23b01e_fk_match_id` FOREIGN KEY (`match_id_id`) REFERENCES `match` (`id`),
  ADD CONSTRAINT `match_player_detail_player_id_f8330012_fk_user_id` FOREIGN KEY (`player_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `match_player_detail_team_id_id_e3f8f6b6_fk_team_id` FOREIGN KEY (`team_id_id`) REFERENCES `team` (`id`);

--
-- Constraints for table `score_card`
--
ALTER TABLE `score_card`
  ADD CONSTRAINT `score_card_match_id_ec31bc82_fk_match_id` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`),
  ADD CONSTRAINT `score_card_team_id_8e90029d_fk_team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);

--
-- Constraints for table `score_card_player`
--
ALTER TABLE `score_card_player`
  ADD CONSTRAINT `score_card_player_player_id_id_5560a1c2_fk_user_id` FOREIGN KEY (`player_id_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_country_id_9852a6e8_fk_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `user_team_id_9c9a1513_fk_team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);

--
-- Constraints for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_groups_user_id_abaea130_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_user_permissions`
--
ALTER TABLE `user_user_permissions`
  ADD CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
