-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2023 at 03:42 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eisenhowermatrix_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add tasks', 7, 'add_tasks'),
(26, 'Can change tasks', 7, 'change_tasks'),
(27, 'Can delete tasks', 7, 'delete_tasks'),
(28, 'Can view tasks', 7, 'view_tasks'),
(29, 'Can add user', 8, 'add_users'),
(30, 'Can change user', 8, 'change_users'),
(31, 'Can delete user', 8, 'delete_users'),
(32, 'Can view user', 8, 'view_users');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'EisenHowerApp', 'tasks'),
(8, 'EisenHowerApp', 'users'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-12-16 22:58:43.360950'),
(2, 'auth', '0001_initial', '2022-12-16 22:59:16.615440'),
(3, 'admin', '0001_initial', '2022-12-16 22:59:23.172891'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-12-16 22:59:23.293822'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-16 22:59:23.447738'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-12-16 22:59:25.704497'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-12-16 22:59:32.951084'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-12-16 22:59:33.281468'),
(9, 'auth', '0004_alter_user_username_opts', '2022-12-16 22:59:33.355447'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-12-16 22:59:34.582886'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-12-16 22:59:34.705823'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-12-16 22:59:34.899738'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-12-16 22:59:35.110610'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-12-16 22:59:35.452444'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-12-16 22:59:35.771582'),
(16, 'auth', '0011_update_proxy_permissions', '2022-12-16 22:59:35.856535'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-12-16 22:59:36.042426'),
(18, 'sessions', '0001_initial', '2022-12-16 22:59:37.343722'),
(19, 'EisenHowerApp', '0001_initial', '2022-12-16 23:04:36.417213'),
(20, 'EisenHowerApp', '0002_tasks_user_alter_tasks_created_at', '2022-12-17 00:01:09.297011'),
(21, 'EisenHowerApp', '0003_alter_tasks_created_at_alter_tasks_user', '2022-12-17 00:07:16.165441'),
(22, 'EisenHowerApp', '0004_tasks_description_tasks_updated_at_and_more', '2022-12-17 00:53:34.406746'),
(23, 'EisenHowerApp', '0005_alter_tasks_created_at_alter_tasks_title_and_more', '2022-12-17 01:40:01.213362'),
(24, 'EisenHowerApp', '0006_tasks_isupdated_alter_tasks_created_at_and_more', '2023-01-15 00:49:56.886845');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `eisenhowerapp_tasks`
--

CREATE TABLE `eisenhowerapp_tasks` (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `quadrant` varchar(8) NOT NULL,
  `status` varchar(13) NOT NULL,
  `created_At` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `updated_At` datetime(6) NOT NULL,
  `isUpdated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eisenhowerapp_tasks`
--

INSERT INTO `eisenhowerapp_tasks` (`id`, `title`, `quadrant`, `status`, `created_At`, `user_id`, `description`, `updated_At`, `isUpdated`) VALUES
(1, 'preparing for ReactJS test', 'do_first', 'done', '2022-11-27 20:13:53.000000', 1, 'Returns true when ALL of the submitted keys are currently pressed. Uses API calls and does not rely on the console. It works in all PowerShell Hosts. including ISE and VSCode/EditorServices.', '2023-01-15 00:51:00.122440', 1),
(2, 'Filming a video', 'schedule', 'in_progress', '2022-11-27 20:13:53.000000', 1, 'No description', '2022-12-17 00:53:28.679068', 0),
(3, 'Do some web research for my next podcast', 'delegate', 'done', '2022-11-27 20:13:53.000000', 1, 'No description', '2022-12-17 00:53:28.679068', 0),
(4, 'Watching Netflix', 'dont_do', 'in_progress', '2022-11-27 20:13:53.000000', 1, 'No description', '2022-12-17 00:53:28.679068', 0),
(33, 'The nextElementSibling returns the next sibling of', 'delegate', 'in_progress', '2022-11-27 22:08:10.128307', 1, 'No description', '2022-12-17 00:53:28.679068', 0),
(39, 'do homework', 'schedule', 'done', '2022-12-03 22:20:58.964946', 1, 'No description', '2022-12-17 00:53:28.679068', 0),
(40, 'preparing for c++ test', 'do_first', 'done', '2022-12-03 22:20:58.964946', 1, 'No description', '2022-12-17 00:53:28.679068', 0),
(41, 'Task 1', 'do_first', 'done', '2022-12-17 00:04:51.668145', 2, 'No description', '2022-12-17 00:53:28.679068', 0),
(71, 'Task 7', 'delegate', 'in_progress', '2023-01-14 22:22:14.643526', 1, '', '2023-01-14 22:22:14.643526', 0),
(72, 'Task 5', 'dont_do', 'done', '2023-01-14 22:22:14.643526', 1, '', '2023-01-14 22:22:14.643526', 0),
(81, 'task with image', 'do_first', 'in_progress', '2023-01-16 01:14:08.970527', 1, '<p style=\"text-align: center;\">this is an image:&nbsp;</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEBLAEsAAD/4QB4RXhpZgAASUkqAAgAAAABAA4BAgBWAAAAGgAAAAAAAABWZWN0b3IgYWJzdHJhY3QgYmFja2dyb3VuZCBzaG93cyB0aGUgaW5ub3ZhdGlvbiBvZiB0ZWNobm9sb2d5IGFuZCB0ZWNobm9sb2d5IGNvbmNlcHRzLv/hBYRodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+Cjx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iPgoJPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KCQk8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtbG5zOklwdGM0eG1wQ29yZT0iaHR0cDovL2lwdGMub3JnL3N0ZC9JcHRjNHhtcENvcmUvMS4wL3htbG5zLyIgICB4bWxuczpHZXR0eUltYWdlc0dJRlQ9Imh0dHA6Ly94bXAuZ2V0dHlpbWFnZXMuY29tL2dpZnQvMS4wLyIgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bWxuczpwbHVzPSJodHRwOi8vbnMudXNlcGx1cy5vcmcvbGRmL3htcC8xLjAvIiAgeG1sbnM6aXB0Y0V4dD0iaHR0cDovL2lwdGMub3JnL3N0ZC9JcHRjNHhtcEV4dC8yMDA4LTAyLTI5LyIgeG1sbnM6eG1wUmlnaHRzPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvcmlnaHRzLyIgcGhvdG9zaG9wOkNyZWRpdD0iR2V0dHkgSW1hZ2VzL2lTdG9ja3Bob3RvIiBHZXR0eUltYWdlc0dJRlQ6QXNzZXRJRD0iMTE0ODAwNjEzOCIgeG1wUmlnaHRzOldlYlN0YXRlbWVudD0iaHR0cHM6Ly93d3cuaXN0b2NrcGhvdG8uY29tL2xlZ2FsL2xpY2Vuc2UtYWdyZWVtZW50P3V0bV9tZWRpdW09b3JnYW5pYyZhbXA7dXRtX3NvdXJjZT1nb29nbGUmYW1wO3V0bV9jYW1wYWlnbj1pcHRjdXJsIiA+CjxkYzpjcmVhdG9yPjxyZGY6U2VxPjxyZGY6bGk+UkFQRUVQT04gQk9PTlNPTkdTVVdBTjwvcmRmOmxpPjwvcmRmOlNlcT48L2RjOmNyZWF0b3I+PGRjOmRlc2NyaXB0aW9uPjxyZGY6QWx0PjxyZGY6bGkgeG1sOmxhbmc9IngtZGVmYXVsdCI+VmVjdG9yIGFic3RyYWN0IGJhY2tncm91bmQgc2hvd3MgdGhlIGlubm92YXRpb24gb2YgdGVjaG5vbG9neSBhbmQgdGVjaG5vbG9neSBjb25jZXB0cy48L3JkZjpsaT48L3JkZjpBbHQ+PC9kYzpkZXNjcmlwdGlvbj4KPHBsdXM6TGljZW5zb3I+PHJkZjpTZXE+PHJkZjpsaSByZGY6cGFyc2VUeXBlPSdSZXNvdXJjZSc+PHBsdXM6TGljZW5zb3JVUkw+aHR0cHM6Ly93d3cuaXN0b2NrcGhvdG8uY29tL3Bob3RvL2xpY2Vuc2UtZ20xMTQ4MDA2MTM4LT91dG1fbWVkaXVtPW9yZ2FuaWMmYW1wO3V0bV9zb3VyY2U9Z29vZ2xlJmFtcDt1dG1fY2FtcGFpZ249aXB0Y3VybDwvcGx1czpMaWNlbnNvclVSTD48L3JkZjpsaT48L3JkZjpTZXE+PC9wbHVzOkxpY2Vuc29yPgoJCTwvcmRmOkRlc2NyaXB0aW9uPgoJPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KPD94cGFja2V0IGVuZD0idyI/Pgr/7QCwUGhvdG9zaG9wIDMuMAA4QklNBAQAAAAAAJMcAlAAFlJBUEVFUE9OIEJPT05TT05HU1VXQU4cAngAVlZlY3RvciBhYnN0cmFjdCBiYWNrZ3JvdW5kIHNob3dzIHRoZSBpbm5vdmF0aW9uIG9mIHRlY2hub2xvZ3kgYW5kIHRlY2hub2xvZ3kgY29uY2VwdHMuHAJuABhHZXR0eSBJbWFnZXMvaVN0b2NrcGhvdG8A/9sAQwAKBwcIBwYKCAgICwoKCw4YEA4NDQ4dFRYRGCMfJSQiHyIhJis3LyYpNCkhIjBBMTQ5Oz4+PiUuRElDPEg3PT47/9sAQwEKCwsODQ4cEBAcOygiKDs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7/8IAEQgBMgJkAwERAAIRAQMRAf/EABoAAQEBAQEBAQAAAAAAAAAAAAABAgMEBQb/xAAZAQEBAQEBAQAAAAAAAAAAAAAAAQIDBAX/2gAMAwEAAhADEAAAAfx9kIUAAAAICkBQAAAAACAAACgAAhSAAAAKAAAAAAAAAAAIAAEBSACkKCFAAAAAAABaIAABSAABUQAAAAAgCghSFAAAApAEBakCioAAAAAAAAqoAAKAihQAAQCUQAAKJAAAAAgUAAAAUgCAAUAAAtCFAAQAACgUSgAtgpAWxLASUARUCFIAFggAAAARSAoA0kIUgKAAWiAUAEAAAKBVQDViygkpFUqWwDM1ILAUgJKAIqFIgJKAAABACgFIQoAALQqLBSFBTMsKABRBQWidNYtEtc8bFS2a1N3IhjO85sUDesyWElkKSwktskozKCiQAABFFQCkAAABbBbNIWFFgGZQBQAC0QU6b52qls5Y6VBrU3c61mkOeN5lksUdNYzNQkslAkRogGc6gAEsAABFqAUgAAFItg1YLRBbEqs5oAAFFgoRXXeNWVLZx59LRKb3nprFSLyxuS5mpBem8SBiaSrJLJYpJKMyyUABLAACFAKQhQC0QUFstgAAAAAKQDVhLQ3rNS2Ws5tom7kpN6zJeWdiS5ltauczVTE1nOrZJZKIFkQ1ZJbZnOgIFkAAACAopGrLYNWQpbAMZ0LRNWasIMzWZaKqdN4tlIas1c2zSZl6bzU66x5eXfGdKR0uN3NThnqO2uY4zpjOuOOiWAElAtdNc4ts542BJZLmUAQKKkKAUtmtTv04yXljos1YIZzoC2budWRRjOpKsFOu+dqpDVmrLZqzMvTWLZU8/PtJd6zmWx31y7Xn83l7B33yqc28Z3x59BCS0hJRbN6yOu8efl1tmrMy4xuSwHTWOedxRUAFolNaz7fR5ueN+fl1tauVJeedUtnq7cPNy7dNYtSOedyUC2dunMES61nprNsRbN6zDR5uXWS71My5l7XnxnTMtPX08/Obqc878+O0iKBJbZzxu2dd88zVTnnds1ZjOszUi0jMoEWhBaILWrn1duGc6446DVza3cWtXPm5dt6ki1q5zLmaAka1N3KqDVzbKmrPTrjKxN+rXD5/L1dWOmsead/Q48p0zNcpveserXDrrHzuXskvPOhJczXr7efnNo83LuTrvnJrMuZaWyS4zpZTM1IEC6RYNWC0SS+vv5851w59O3Tn6N8ued7uN6zia5Z6Wzljpq51ZbIDOdYmqnfpyy1qyRyx01c0765Q9F5DzO3v6eTtefW8+Lr4Mev3a8vndeOeu5j2b8/u7+X894vsebn27dOWc6446dunPGdZmuu+ds8nD0UG9ZzL01jnncXdxvWeWOkjE1JqQKLBqyiwSX19/PjOuWOnTeNXNBq59GuXDPRbxx0qWhIVnOsy2z0dOUNakzeOOmrCaT2b82ZrDXfXKavfXHrceZ21hK887ei8dSfZ7/NxvXzeHt+N5fo73nGN5lyvp6cfPz7evt5/Ny7cefS1mW2Jd6xvWeed9+nKHl4egWzGdSUUWDVlspbJL6e3DGdcsdPodvHhotRWmctE4465mliXKjMqLXbpz2xLcy8sdKlspbNJ0uN6z01hpu5yvHn17dOWJq5efHXjz6RZLbMTWki4zr29fN03jlnfm598y6szLmWnXfOmJczWrOPPoJLBEXprKwdd4ksAjK0tn0evj5OkrUmGlDbPm59qlqRFAksXrvnbKZl0zlqSjWs9WMrU6ax13iKMZ121z5zWZrlOnDn1zLUzNa1mxyzuR01lVTprHDn23rHPO8Z1TpvnqwvLG9XMWSyXMuZZLvWbZqz09eHPO8Z3q53c3UGZZL01nrefHPTrcc5upzmtamrksJm9NYqDE3mXE3Wctezp58XUNs8Mdet58p01c99c+uufXWMS4zvesyXhnpjO7ZmXVnDPXGNZliyLUl1rPXWMZ1FtkjM1qzesYzvVz01nE1nNzLma48+gpDVm9ZtmrLZu4W9t8ued8sb7a5+nfHScJ0io1Z01i1xm4vPG+++XViyeadi+bn23rO7j0a4+jXLxz0+q8PDz9NNM6s3vGtTozhc41rURlcy1MTdTz568ufUQAGrO3Tny57tgGrN3MjlnpiaxnUlglhJRRVTpvFS0Tes6s6756TjjoNWVMtERbOu8WzVmJrjjp01jM1I6XPDHWpFh9Dp5PTrj4Z6foXycp0+bz9uJrWs71nprFIdpz9GuOJrx59NTSZli5mvJy771kYmpKN3O9ZzLaBPRrlu55zfOa446csdBJRUzNZl3Ys3rPXfPVmrMy+rfCyb1nF1xx0LmWHW45N5mkdd47a5XU7zl4efq6axFzLmaxnUUZl9PTjpkubeHPqN3PW8+TfTeakXrOf09+Hx59Phnr1M9GIoxNebHep13z446ZmidNZ3rPdy9mvN5Z38mfR3vLpc5Xz468c9eeNrO2+fPG9Wcs7xjYWb1nVlS2C1UtnS467x3vKGk5N5aypeWN6ZzNejXHzzt21zw0y5zfXfOZsrOdcs9LZ7u3lzm9LnnNcJ1tkzomJqS9NY9vXzebHflncEsKSXVzlaYmtsrN2aZ9ffz/K8nv+p6vD8zze30deWpMrmXljpmW16u3n8vH0aueWOnPG5LC2WtXPXeJGZdVq56ax6OnHtefS5wuJqasX6F8fHn1yuGou7nq5xbJ8nn9Des7Z1c4m/Njt6+vn8fH0k+t28HB1i6ueGOsli8s76ax6OnKRma553xz0hSR11i2RYqNazJd3PbfPprGcXxcvV6OnCNZXjz6c8766wO/Tjw59um8cefTjz6c87FsprWff6fLw59eedSXprEl9HXj31yltTM111z5TpvWfLx7c87SwtnTeEsXGdauetxq5zNefHX1deHk5ejMv1evg8U9PpvG2ePn6ec3UHS5/Td/hyX4ePqeLHp5436e3CmZe159GBF8mPRrWdJUzLxx19XThu55TfDHWSxR03zserfDzZ7dN48/Ltw59eeN2ztvmBbIsl6755lHq68Ouseq8PPO2V9GuPnnbSeXl35zdSBe3TlJcZ1Ftljtrlzm+Oemc69fbzyW2c879t82rn5PH3xdWaue2sfW38/dx83Ht8ufR5+fX3ejy6k5tehy7XlFkvzcezVnRn3b8vzufsqfQ7eThjryzvzZ7yMyl6b52Pf18ng5eve88OXXjjpjG97x13jGdasxnSwaS2Wt3G9Zpu59u/L552xNXU5Y6SW2ReWN2pGZdVCS9NYAqYmotTViIC0KkXdzZBym+c333yFsmb13ipzzvz47WzpcbucNbZ9nTzdLnz568M9czWJqElS9+nHjjrvWOOOvHn0kts6axrWZLmUsi1bKlrdyT39fJ2uPI9HZy53fHHRUlhy59Mylhu5tSMzVs6651MTcXljYA1c71mnfXLlOmJcZ1jOydd4775UVzzrvrnWeU6eXl3tbucy9N46bx31yHLG+u8IxN4l4464mpmq7b5efn25Y2lWU1ZbNXOZrMtsqWqlr19fPzzv19PPpnjOvdy8OfTqyKOHLrFksAJLbJL26cu+uRR5efbM1JRrWd3IGM7zKLZTWsgasqZl1YMZ101jlnpU+j28embUXbGbRqTm34OPr5Z3JVddY446c86mdLBqy2UEKWwWzVz9f2fP9PTh9Hn45i5ltfmOX3KnObhzx0zKJLbJLADprOrBDljdANWa1kDGdDprOJemsasxnWrNXOrMyyXdzlq2ccdKnTWfRvj6Lxi4mvRvjma5zXPO+LpGsZuZrMuM6HDl2grSLKC2UWUqWumsYmumue05TfS45zYLDGdCQW2SCiGrKQGZaQFLZSElgNWASUb1kSUlq2asxm71KnS43ciHS5kuVzLibyuZZLFzmjhz7EAtgtm7m1qyGrLZUHLG6QAKAOmsQLmW2IEXGdAC2JYDVmrkDM1q5LCS5mgQAVFdNY6ayqpzzuRqyiz09eMlxNSXhz65lEltklkcsdYVBRZTWs1LQtlS0OeNKRaglELZvWURZLbAIZzooIABbNWASW2AZzrMoAtEFN6xvWbZ01njjpJdXMWp6OvGS5msy8efSKjMurISa5Y6RKAWibsWUFsqKGM6AoIBKs3rKIoqBUlxnQAFqQNWW5pFktsAzLmWgAFsHTWdazU3rPPG8zRKXU79OQxnWM6543FkRdWSIvPHSBKAWqiygFsFMygAAAasEBSFISWFAAALZSBSASWKhRBQDes2ypazLI1YFddYhJZLzzuCJKoSXGdwFQACiwAUAAAAAgKQFAAApAUgAACAAAoAsoKiqihQC2IiiRFkokFhJqABKAAC0CAAAAAAAAAAAAAAAAAAoIAKBZQWwC2BCkFJFkokogWSwAAJQAAAAAAAAAAAAAAAAAAAAAAAWwCgWUFsCFCSgQSwBZBYAAAAAgAFICkKCKCAAAAAAAAAAAAoJQAC0QUAWAUEAlEBJQCwAAAAAAAAAAAAAAAAAAAAAAAAAFCACgushKAsQtJSSgRZBR//xAAsEAABAwMDAwMEAwEBAAAAAAABAAIRAxIhEBMxICJBBDAyFCNCYDNAQ1Ak/9oACAEBAAEFAv03z+mef0zz+2QoUKOmFChR1QoUKP7Pn/jjoPsH9BHQfYP6C3odz1lD/qQoUKNMrKyoUKNJhXK9F8qemdJRUqVKlSp6IUK33fPtx1joPsHgdDeNJTudRbZ2k2LtjtXZPZCd7UiCcyJ/qBgIey06R1QgFGp9g8DobxqeVjRptMBjy5uobcXFYTvZC8L8l44Duei0dHnrYOyr8uvw9oDAgrVCKjojU8BQojRje0iNTysIxp2luNMIBsWtVrE5rVAUBQoCgKAg0aBAYIg5jyhKODpjq89bXC2ocqVOkyso4CLiUFKnE9UqVKnFyuVyuTKTrajXU03vdtFO5ZSc8OokNX07k5r6L3DRrbiXXn1VJtMZRBVpVpVpULtp09xqMPZpILS7MjScSCCZOke82bat1yaYO9oItZFjnXOhQoWACA1GGowEcBykqSjpBTh2qFCoCa7y5z6cmgzt9OqmWvAutaz1FMN3nEmpzQEaENt9LTT2h7XMLSmiQ8ADMsbe9zryqT7H1mbdTXy1HLNBTlpZaLVEdPnrb8anOkatyqlItXIyirlcSrirlcUc6hecp3x1GDfSqJ9QWU6lh/8AOi69we0tuYxfAk0XPe8EL5Lb3KkBoXq6WHgJvJ+HAabXVGaUGhOde7zB0koYJJcrcEKp3UqYtGk49trm21CCUKdOSx4QY5xYAgYNynAynRNoUYhR1cqUTjpAJX219uTZeoREL84REJuA4qVKlDQCU7JVKtZT36aqVr26Cm4tgxBUGbSBtOsCuc1OqOcOqM2qFZkiB1CpTLnPuc6Wk9zW4U5lcN83OV7le5XOVzlc5SdQ6CcI8MGD8s6ZWWsa25W5YM+fKiX2ZLYLnBP1jQ9wItGg0bBdUDW6S8DgaDi59owuVaoxaoUY08yFIVzJeWlsaQmutdAk8Awmm19evvHhrqUCxyDCjlNCgKAoCxIEm1bfceIMrkK0FQsIMlSib2KFTaFLibaiIeBFXch6Lai2inUytoztmNh0ubCBhHPS35VU1QrVC82rEHKa1EAKBphHjTz0+dJkO4WIFB0solrn1LzDSrQoTQrcERp+TH2u3sCt3mp2bvcphDmh83t0HFrkDabQrNAYO46bzbuv3bzG66b3J7nrceDebd59x62/Krz51s7tsrbXk+x59ic1BgBSpCDo0lSVcU1xUlXFSvynVxE/ji7xMqll1Q9g7kC0DcbDnF5WU2eim1oMuYq1MWDlyhWq1ESFkDIPGvCyBBB1PylOFysTsdMKNIUYDDIpOuFF5Gy7bAzcg5HKFN1RPpupuLVaVaU5haDq1QAjECiXNt+5LFGe0kkWysKcHhrleUTIwsLCaGl1YBrm9DMGvUpy532EeONITuCjzVrGq4lSpV0Oq1DWdQpGrUNH0y9R6fZMInuRKLiUdByXOvPzTtZU5uM3GJMKNAmONMmaiDGAfTY+nDSaZRphWhWheZBRKbWLRPdFNYmGgmFhW6FsaAFxcaNM7tFVKTE5tMi1WIDOCNGPLSX008lyhcG5XK5XLEcaQhTcRtmbHAQYb2+nTZd6NXLcV6uRe4iEBk/IjvtCcNPPQ0F51HNya7BqGW1e/ddF9w8oOZBdTVzJuZBcxNcy8OpwXU4upy/kGF3KU74ql9unp6U7jJhbjyri1B+fFp0AzmVCcFCgrKgoAxaUcaCY0aYNJ+3Us9Oq9S4Q5XFXK9OidB8jYXnNQJ+nnXxSsl+3B040HGI7VamjBYRp2wYnUc6nSSsJ3xVK0pwtKo/Y9OmzVNSlUBhEybtGzdTo+nq06tD09OnVomm12m2FYFYFtizZbO0CRSEA4TQpCdGm39rZbuFgbT6Cm/N1apvP/mEqpOoyoCNqgQ0lh0Y0OPlNTO6p6ii2i7BY2AHVLlhBoJeIqLCwhzhY0MLCBg2hO+MaGrTcrqCe8VDhelrii/1fqG1nHSVKZhelq7dSvVDqlOpc6pLXLzdlfgT3DkcNK8/gatP6YnECf98bHqJ3pR6B8jU73fyYT9PLVEpwywZ6g4hSVLkLnHahOwu5dy5WVaoXClSpKysrKzBOLDNuFlXKTFxVxXKhQUGynnIcSBXe1u+VUqOquhQYgqCHS7aN9zb75ftSpKY4hbkom8saZn7ci93dTscrHK1FFyDocXsLy66pcU909F2S/NxIR9ig21t3aTJa+EUBnU86DBuVyuU6ALCIg9I1a4AOLVLU7PR+Pg/L/F3zb/J/jodG8ouBJLVLbpaiWLCeWolqwim/LKfp50lSpR62+nqOAbUJdQqsZT9NUqDbfc/0tVjWjMKFCPss5tCtbFrUR0DoPRHR4AkawgOhk7WPqKnw/OnFtS3cdx/lUi/Qc9qdGnn2xzVbVfVa8b9wHpw6KbdtlamKjCefx0P9EdBQgmoAH8ue1rXECYCAEwC9zWsc4CYCaGktDXVKkNqnnCbCps3Hj01Qn6eoWOoPCPpnB/0zyfp6hZU9O8MPp3h4oPJ2XWOpEDaddtuQpkrz0T7Ae9oyjVe5NrPYrynVqjgHkG8qSpXKzrlZ6JUlSp6pKkrPRyuFcpUqZQMK5SrlyhhZULhMquY4eoqBb77DWe5b9W8VqoW7UtdVqOG6+8VHhXm0vcVe665yDnBef6w6D0H2R0edT7I6DzqOYEGF5dEdfn+sFOp6Dx7A6POp9ka4R51HMI6O46/P9o9B49gdHnU+yNYR51HMI40PHX59yVPtSp0lSpUqfen3ZUqenypUo+x5/TPP6Z5/TPP6Z5/TP//EADcRAAICAAUCBAQDBgcBAAAAAAABAhEDEBIhMSBBEyJRYQQwMvBAQoFDUnGRoeEjUGBigLHBFP/aAAgBAwEBPwH/AIqWWWX02WWWX02WWX/oF9C+Qv8AQL6F8hf5y/kS6I/IQ/8AKq+VZZZeexsWWXlRpNAoUJdNZUIoooooross1fibL6n0L5C5H0S5zoj0O9R5kt2a/c818nm9Tz+p5rSvJfJZTvYSKfH4VzaZCeoWV9VjZea+QuR9EuehZb5SWpFuURRl9/pm5UrZFd/U3I/Jefa8+WR46dT+ZN+b+xhcfJhJ6hjNRYi87LzXIyy8pS3LvNZbivLzJ+2e4279jU/Q1S9CMn6Fv0L9i/Ytlsscn6ZMbE7Nuc3Qs9/nSi77mGtsqKyqi0Ld5KKQyityuqiihIaNJpNJLFje25BqfBLyq2eKvRkeCeLGOxHGTdZePHsmyMo4kdiL/L6ZN0hR0q32PhsVzbUjYTXqakakakWeactmeHL94VwlTzpp7CjsU8qKaYlWd/OlVmFVbZSV7Hhe+Tu+Cd6uCMaRZZZuxNyFbFbFuRKRSF6ZWRe+VlmM6w20QUYxSROliRaJ74sU8obNx7EG6cq3NUpYVtGI3o3IpKOxxiId85Juz4nE/ZojJxdojJS8+UmQbb3Nib0xIx0qssWGuNGDPXG+jtZIW0qzc6dCnbpmou/my5IcZ3nIhiauDh5I0mlI0o0mlC2zeWxHnoe6NGJDaPBDDerVPkxIa/4n+PxsKOhUOEk7gaZy+rg+rZiWLGNLchBrzPnL6fIjxNEdX8i23by+Fxd9DIt8Ml3F9TOSS1KjDl+V8rLGk/oXLIx0qllaypDVoSSNW4mQ2m7MR20lmlvfzJRdkE0t8nOdakthTi+45xSuybfYatWaRrfYe25G64NT9CyyxdPBQlv1N1uec8/qLVpWrnKxOz8pYnY99iKKKKH65N0R4yxcHVLUnR4M/wB8hhaXqbvL2HNJ0WrLRaNSbPFjq0jNKluRhGL267NRZr2E7yXS8OaWlPYjDSiNPgSpkt+CijlnY0xNEfQ0xNKNMTTEpZUNbCFySe4uNzbKkcyJS09jVtwTfsfoduD9C/LwatuBSveiMXyyOd5LbYTt5vKVpGG2+T3Ki3bOc36mmN6h7nBqL3LLLzoplM0yoimm7LyvuSjqVCYhqyS1RowcHwkcuyOLbfoa4+o5rsLYky2Wy2b0N0rs1cb8nibN3wLmrLXN5Vvlqa8xZuOdFCWmX8crMST4RUUaoCcG6Lw9Nlw4FKHJ4nuLEW+54q9TxFdHjRq7IysasW3TLgwiXoWaiyzUb3yIlITst5rn5jVEect7sePGtn/QliprTAjh6FsW0amWSZqE8uxOGpNHg7oeD5ZL1Fh+ZM8LZrKrHwY30kJcL775Pl7mpeo1qRqfdGr2PcavY8ONGhXZ4UdFGhXZ4cao0R/kRjHc8OLVGhXZ4UK00LrlwYfHTr24PE9hYntkvwNEHuNlFP1HG++VFI0olFFI0oo7FZxTO5vR7ldzF2Wkw15l9+o9hpt8Hhy+/v8AUjFRVLLYlXRiSbWiHJUZ2lLcwsR6tE+R+xEv0NRqE8tmbdhb58mz4LTXQuO5XsyLrszX7Ed+mxPKyxzVDxY1Y8WKZ4sdWkb7Gn/cOP8AuFt3HiKHmZDEjNWJ+5qRqRGak2kxZyLbFY8VJ7vk1eUqRe1nmSsSd2UblbiJR9jQvQSrsbm5uSbSMJuS3JdE904rkwcOdabojH/EXeskc5X6EfYXoLjSYWCsNCRRRptUYeGsNGNiLDhYsb4j9wwMfxOeSxLbh/z/ALlez/n/AHEvZ/z/ALiikLJ8CitNi+nKOVFFDivQpXwUruj9CyxkoqezF5PKhzm3t2H8R2SPHcl5UKa5SFNmpmpnYpoS9R4KbtorYuZvRcmKzfg1dz2E7ybpWyKxZ+a6PDxf3/6EMWX0y5RGU73NRqG9jdPfOcFJbihPvIglHgsqzSaTSafQ3zseIkeIqs1pstcEvNirVxlKl8QtOWn2NHsaPY0+woRRY3sLi9P9RPy7GpkX1yagtyu+bNJKIsNdmSwvLszw43saNPB2yanYoz+/0NM6NMr+/cUZff6Eoz0jjO/v3FGd/fsaZ0R4GrNufUrsR51ZYnnksPP4laJeL/Mo8OC3RSkOGx3LWText6n6liZZaNi0NqzUhO8nnJWYsNcNjXjmBh6blLktFL0Rp9kaPZEb75vgWtRqhbRof3sQ6u5ia63I6/zC6Gb2bmok9xTTy3sV10PoWVLj1P8Awjz/ABPYxb2xF2Iu98sX/FxdHZc5SrD80mQxYPh7F9kJUVlKqtmJjY2HLS2YWNjzlpTMPFU20LLWzWzWzxHZ4sq+/Q8VpDxH9/xGspPsin6kby1+ejxpab9eBTbnp6US+lkcKHhp0Q+hDow6zZbFqLfcaUlue2U5OK2zkT2iz4fGeKtzdS2JXZGGnhG45NK6IO4p5b5M3FeSs3GrRqf1EeaL75LCxI7Rexpxv3iEHAVnxOC8WOx8LgPCTsWVFE9z4nC1w1Llf9GDhuMduZf9GJh0k49jDpq1l2+/Q07P77H3/U/N9+rEtvv0Hw/vsh8/fqSWX5hYU/G13sJFuqP2a/jub+I/4bHw9eGULofAoeW9KI/SqHZDORdEWTe1dbimUiojpbs8W+URd8nlLWWxZeVFFGxsbG3Il2Na5NW+nLY0lKzSjSjgstDlRBbWOKQ8CLeo8Ber/mYeGsNUiy1bLWxaa/UqOsWmo/fYlp0yKjrKKRON7Cw6EtJKS5K8/synp90R2la4Zria4moQojjaFCajpFGo0afuiEa6NOwoCik7yXyMaVvSadxKkShYmN9CzfBpNJpKybPYTvqecotsipFMj0d5HeIuP1P2jI/TD77EvpmftM165S4yUWthKXqU6KkJS9RpkFISl6jsQ+DYj00UV7i65fEQi6HKCWojjYcpUjE+Iw4bM8SNar2IfE4c3RJ7Flli6L6ZcGpmqRqYn0PoXRfR3G98qysb7Z/u/wB/QnWvf/038JfoYf1Oj8r5v9Sd2rIXoZHlV/6fndkL0q82eYjfyF1PgwpYcYVPklB+Gim8VUONy0pbktcsNyfqYjw5pLDW4uKO+a/AvoQ7rYg247nCISlJboTZbG36FtR2IylJeZEW6LfoSbrgk3GOyMO5Q8wuMpGJPRHUx/E4aSZ48FKrI48Xce4viYuOo/8Aogkmzx4KWlkMeLk490LHg46h48ErPFWqhYibaPFjVmtDxEuqvkOMHu0bCworhEsGEvqRpRHBhHdIcUzSiiunY26KKKK6WUUV08mkooqhqyiijge5sWck8KMlTHgQdbHgw1ahYUI37ngYenT2Hg4bPChq1EcKCbrueFDTpoeHF9jQrsUEjRGqNKHGL5/EPoXQvkv5C+S+hcdD4LYryi3f49lFZLoXyX8hfJfQuOh8Fiyjz+PfQuhfJfyF8l52LofBYsl+Eoor5VFFFFFFFfKoor59FFddFC/5E//EAC0RAAIBBAIBAwMDBAMAAAAAAAABEQIQEiEgMUEDMGETQFEiMkJQYIDwUnGB/9oACAECAQE/Af8AFSCCCOMEEEcoIII/sFcH7D/sFcH7D/sGng/YYv6pBBHKCCLSZGY655TaRkkkkkk8IIMftovHNe4xcKeD5QaNcH7WvI2Su/tVQmVUwO0coEiLv2GLhT1wdtcJ46H7nmL9IffGPcp6K+/ZrSgVoIGRwi76EQRalaIu7aNW1fRq2hwR8kEEEIgS+bISGjfV1I7696lqCvu03mbeLZNiJJJ5SSSNkmRkZC0NmRI7RaDrh3pFdOKs5IZBDINULZmvwOKqZV5TQ6tk3lMb+xpmCuZstGV10O0W0NJD0OEPQySXeBrVosuzZ4PFlw82dmenT5GpUDXiySgatQsqiqrJzb06sapPVpxq4eYKR7U3x1I6I2iDr3aeivu8XQ1dkksyZkSx8dj64yTbQrRbzwdMit6tM/qKheB9HRS8XJWvKt6S/kyp5ObQ7SxaY22RoaK90KChQpd517lLUFb3aF0bsuLIIII5yPr2NCuzyQNWq4L8WgdqK4UGdP4Kq5UXVDakhkMhmLPp1RIiXTodbffOCCDEahc5kkc+bIkm8slkslkslku82fQh33wpJJJPN5KrxZ72dK6siqF1b9SUHV1+Caog6OyCCCOMmjKmSpppEXThzZiYnDK68jwOkgiyRCIRCvBA+iH1wi2iESd2gSIMSDyYkEIaIMTEaE4Hxp7PUFbEi0Go6GUoaIV37kjvgxU+WNzaLLh5JJJHVoz2naRC9hWm3kkm1V5Hzp7PU744mJjZ/ZVdEc5KbSSeSbtng1N0STaRubbKZ5Oz5dEvzw6OuxLjI9kfJVxgi0EaFS5PpuYF6dTPp1Y5EeSbxlpDpa17FNpVvJq7gm0+wiop5OzvAxj/ACV+pkNkkmUOSurNiUsikdMWm8jsuxtyP91nwklkslxE2iyE42d7IRiYkGJiY8FULshGiBwfJHg+SLLeirCnUGVP4HShpGJiRwpZ/wCD2QdGRJJPCDExItTr0213anfp7tl8mXyZfJl8mTII2eYka/UQipc0nU9HxwkXBcNGjRo1wfB9Wo/TTnenq8sndt2RLuyCGbIfFcKKsWY+kepVOqTZl8sy+WZfLHF/I8ZmR/uP97Kufp4zoqw8D4Lgur6HHBcHwZ8lH/BjUastLhHm02VnA0O2CMUYoxIIIE+DtjowUmMKeLF2ZPIf7hTBXdEDg14E3Sz5tSpuuC64PvgjRqzg1d/k+LP1KKt1Iy9P8DqyNCcDY7yIQ2JlVnzTvI7fyP4lf7iePknfY+zUFV6TsqRSucslkslkGzZDIIMSLSSSbNmzZ8keCPJFptJNotBUxOTNrRn8FVUkG9G9nk3iPti7RuCSRMyOxI8We0QQQMkkmmSZZl/slT4ZbHUZP2qV54QLg+EmRkN+0uDaJQ+H4PyeT+I+2eUeLv8AFqbSM82dqjRqy7NlXKSR816VTUkVdDpa7ItArQQP2UQQiBrguD4R7MCXm/nh5NDi3/RVE3XZofvLsrprdU0iazPU74eeD+xXBiK0k9HkrpSehxbRCb2VJJ6HF6UqqtsrhVaHZCItHkgas0fSqmBelUz6biR+m+z6bmDBiob95OpWzb7MmZGTJMiSeW+Ekkk8pJJ5SSSTJMEkknZ1aDoyMjIyZLJZLG2Z1TIq2ZOIHUzKqZJYqmvuFwfB+yvYfsrg++C7NDi1UR9+uD4P2V7D9lcHwXdnar+jv2V9irwPguyB2f8AQJJtJNpJ+7kknnJI/wDIn//EADoQAAECAwUGAwYEBgMAAAAAAAEAEQIhMRASIDJBAyJRYXGRMIGhEzNAkuHwQnKxwVBSkKLC0SNggv/aAAgBAQAGPwL+kTRUVMFLaKmKioqKniNr/FKYaFxXopQHush7rKX6obp7rKW6om7FyVPDY2Pr8LU9l9P4G6M9JKo+3tYIB5Q+NdaVobFXxBI/MhXzL+CZcPiZWNrpglmKzj1WceqzhZgswVQqhVVUd4W1axn8rat8FSDzC08sPVdaLkafCPEYYX/mKF7WhQEIcqUUBPB0XCeQHEoxBohxhNm9FBByiKDyOivNKK1gJxegUJhpQqhWU9lQqhVCpoGKFyV7sJwGItYyZSwB9PghmU387HWWFVWZnR37unkuAwa91r3Wvda91r3tqnxwA8USaraA0E1GRWQsgi/EYZqCExNDdTQmpYhSmycozymSZ7BP800dqdaIwmhR2ZqKKqCDWNoE9j902C61js07bxLK8C6qPG0+ZfV8c9Zp7dPgHjEUMWt3VXNmCIdX1VHhNQn3zyRiQh2gMqEI3HMXEp4TNORFCeSEMIaEWe0IpVCB9XiTCwbSGsKcaqBDqn4p1fGWKw7SLLCjEdbKYde1kN2iJipa3iCY+VSIPlYIDEb3opwprqmmkjKaLpmWYLMFVVVQq+KyoT5rKe6JgDQ4Bbe4YW44bkUAiD6r3EKuiEQjlY6vBUVFROyvNKxkx8Cq8kz6oTxiIwm91lZvSVVMhVVU7zNlVVVVVVVKrieXmi1MHMrMB1TXoe6O/D3TX4e6zDusw7ob47r3kPdMIgX4JgZBVwv3XXDNC6fVMrofngZXXLYji8l/6ULWsna3qgeCEmZNxUNTFryWU9lMEDjiomENUdwbtUBczUT3RJAXa0wXeAVLHAs/LaYjopEozMk7lXd5O5ZNvTR3aVUO6Z0RF0yTtJNdnw8AIJ8WVU+CpaA01PZn5lf2gkPVb3nbRUspbCeBUYaq2ZbKiGqoS1Bb+i8lEeX+rIZEkcFlKopRBZh3TaBOEZ1TaBXnmruid5hEfzVUPKiJeZqruivPPj4AQw1h7rND3WaHv8JwspNZVKGdkvD5H0XMLkfRMmQi5TR++CnQLMOaLkJzj9ptAbunVQmLZQ3UNrs8pqOCmp6VU+hVOXmqVl5qlbd4emGYw12fZZtn2WeBZ4VV8OmFldR5aIR6K8zgL3S90vds3JXQO6u8E91UVCgTCwNMM0GRaB7tS6YaqiZNRXSgdQiNCuYslEyzqcaqqqqDlbpwwxlogDlQj9mI35qL8IiMoWsHJfTRT6GWnFT6FF/NOhEhJaLTstOyvSQkhD6qe3QYvCaGzPB8izwfIs8HyJpdsBHPhZrhqnvLMmvSWZVVbLwkVeJmUL34qcuaJMQDFprfikKsmiioq4OCYIgREPVdFU2O5Nl5jzV2fJXu65Gxgrns7zVLr3H9yEUOSJC7W3kpPK2WskG2THqp00GDVaqa1wUTKidpcVHdza2G/QZbPeH5V7w/Ks5+VZz2VbAm9rP8qLr6eBIBNg+i+inDD2W9C4aiLgFy8wg47WilEafbrSv7rT7ZafbrRafbLSn+1pWzqrusKMTSKutMWHa60htOw84eqMphAEkjguqZgmkEbKLKsvqqeqp4s6GqrF2QggG6OSos+07LPtF7yNSJPW0IxX9XoiVX+9fXHu1W674udhmgy18V9YVo0XoucCfQqLZRUiomsO0/HHKGy7Bsw/Jbw3k5onsdACeqEYgrzRiMFOahi415YBZ98Fr9lCZXl+1rmiyhfpY+pLQpnlCN4q+anKMQRF6V5RdShm7BDFJST2TLYAOKDF3U1VMY3aiqgLwCId5+Hdeswr2oTaFdE8ezJi6r3Z7rgNBYbwkULtBg6Krc1cMhH6FF8my9SooY6bT9VdNRYfvVQ/eq8v2Xf9Aj1/yUPl+pXl/jb0Xs7m/Y+hR4iH/jUHAxb6L0FOmIIw+2jd+CIM5rT5TgZdQn4p+HgSsYTUolJVA8lULRaLRaeAz9E71qrvZXn6rRaLTsqjsqjsqjsqhVCqFyCZVVxoT1CybP5U8TWQ8youRQ/L+yE9VtZ/brZz+3VdbX0VLGdD+aA7qMt2Mb0qFCE5oaSqFRUwAoxOavRE8Sq/3L64aBN4FVVX+Mh/u15HqhNHwNcA4FcwgdDVN4In6L6Ytn1W06ofl/ZDqtt96rZfeqP5rWwOQpQ+qDj1VFl9VMeqosvqqW69sVFRZR4DsrjF+CeKYTgS5q5dLq8R28ek+C5cV+k6+LXA5KkcEynBt2jiFtGbit2676soqasg9130ZQyhu3eXBRMz81BTR1FeEPJmUN0Q1m7Itxwfh7eOEItmd3qopigRJLSV8xPs7tAoYISBu0UZ2sYu6J0fiZllJMZLdiVVVZlMst2JVWZZlvRJoS4GC4NUYWmFeENJEKGNt0q41aFGECYRiAoZhQxfhi1V066ohphXmQOhV1Hl47AkWb0RKN2Ih7AIoiW/g7unwXoaotFWquPJQzy0CvvNFid6quaIAmUNFfvTR3q1V15ITorzzRnVSP/Q6qRsr/AEcP/8QAKxAAAgICAQIFBAMBAQEAAAAAAREAITFBURBhIHGBkaGxwdHwMOHxQFBg/9oACAEBAAE/ISSzcZ5jPMZ5jPMZ5jPMZ5jPMZ5jPMZ5jPMZ5jPMZ5jPMZ5jPMZ5jPMZ5jPMZ5jPMZ5jPMZ5jPMvmXzL5l8xnmXL5l8y+ZcuXLly5cuXL5l8xnmM8y+ZfMvmXzGeYzzGeYzzGeYzzGeYzzGeYzzGeYzzGeYzzGeYzzGeYzzGeYzzGeYzzDl/8acv/HUXRReFf9py/wDKRl/x3/znJ/jUUUUUUUX/ACmoG6W5j8wheBeClIojFFFFFF/wnL+ceDf8o1474jW+m+mcXXcPgDEfUeA5/wCA5P8AOMeDf8o11vwMwyXEYi4jHYjML6W4WeuEGPAMeA5/4Dk/zgVF13/KBiARRdFFFAzFFcUwRw30VxdCZeUEcOegx4Dn/gOT41FF09PC445kxRReJuI3EbieSB1UcHBwBHAj8R+Ijymap5IXJ+6JQWIKjHEJfRh4hIwzBODJgJqeWHs6KahtiOOZgqzThMFTK3kiiqKL+E5eJRdFCEIOghTX8LLwDwmkEtYiMeEViI8RCT9ssVb6b6ATPM0xA12AyF/EIMteq9+3Yx/KP8R4mU/0IT72H+YqcHe79oTFnX8IzAQAmsERjAJYmJB7NTc0hNQ5h/gOT4lcUGTl4lEASWNpCEIB0JTXVT0e8O9e8YB11y8A6biqBAYgEVRd4Mqsxd4rzAt59DlCiIVRcEciAAIIuXMNazH6/mOmxDBzGOpGoIZ7w4RNdKhz0rwZTAKEBjTzMmQDyY7zczGUAvNQFx7Q+Ao8A5eIZ6EPwKxrBhEcQYihE11x5oaAAP4TOEj2OejlMuhdAIUAm+rpKgwq6WDEpUpzN5yoeMoylVA+hX3doeEqZCFHbR2GzOb9XlDR+r2ihXy/ifsGfsGL/tP0jOx+ZZj8wgaA9+mUPZA7nMIg5hOZ9XQeW4ABhR75gEgOYeh80rUrwHLxuCgCz1IAihjqocQQ0BZuBCFadhEQAA4+TmcFUU1zDcBIliEosv3jpJZii6IzGLFhEpAAVQeeKorxAlLhQ4ARWBYMIkUmgIwrgMXAIEgg4IidRydCHQFywvOFalIYHCJiSIstGGxAMIA126ApwAyTEGNgD2IFs09TmWDBh5Qlwf40/wAKFv2oSGBEAGC+joQuqYFD5IHQFRYQl2QZAhQoRBcdxKRQYeSDoxiGDBO4igzDmPt1OT1uX0PTHH0gShxzcVID5xv6oERiHmMOhEldCPIQInlUEK7KA4EJBiOoSZiEYIkODatn5RwZQAdnCCNn9g/MIghEogGzO5BM5A5Z8+lH9wgb7zcaEhA4iQh97G7mg8BvBcM5eJTwIg6PzLSe6Zs3DESAiAK36Bg1mQgcoVAIjJzcQDNAs+YBgmaIKugYsP6wazz2OIfl08nRJCAbbZhJdF7wZB337mEMs5vsJZATfeKGd/nClP0m4UehoORHg4NiHMwIrGnKOJ3gBkkNDEAURBK3MAd4czAg1KViMw2pHnNjBOkYq8By6b8BHQQlfBMOMa6AwOhRVBIW1uIVRBPKHzQoxIIzMZJEuRDkAH0hJkA+kc5APpGCwPaESZ6ATgcGEIgYk3Gym4+8dQkEFEQ99gRQXaBllDJpUfcCn3EgfMbB4AAwBPU4CEtCI9OAoqjB7eoUiZU0WyeT0owAiGeTDnMlmLMACEowRMc3lGNXwMxHR/Jik7tvoJ6zCFEOoAAdk85uf7umGyAoY7r2hbuFScMtBRmQ9ApQdvVFXfqIDGDIhGwJgjMOeh4VeA5PTfgzNQQBGe7QBwGkgDiMGBKoYEwWR6wFGxxCjXMDSTmAiQQW5gJ1x3iGBO+8BqQ+8/wDA4VHZGZpVyjCIGb3hCFCffqDHUNHsUY8dO4jxPSbnpCgAWTCQKHfVfxBs/X5RxXQgZxCLMEHMNwIvIgg5mRHZ5w1RuTG5MJcwwWePgZtYjQGt9oWHGh0aWGA0lk0I7tbdMH4QyBQjsjHad57Qbj2gKNeBU7eQgQj6xEjzGIrqceA3XB2Mzm+U4HSOCFxjtDpT6HqGJvCp5uYVzbgKAT7whgPzgAHQ05mOXnC4t/WMD901D3zNf3nf+8wX1uUZ+87ne5/pQnCJLzlx94DJXnO5D5wjgCLGUPzSoSQuBsRoY2T2fLc7b8pnwt4SsIO5ggCwrMVWampqpNZghX1YUE/JCCNUfPeBhNCCJmEuYQjPMcQQId2PlN9MMw0cxAConmHPuEFnuxGdQxaNnoMwmT+UUtnUQS/X7CZ5ZgK39YcztA5ht/cwigHqSG84OTZgRmLvCH0UAWQb94AhTGnEPDZ7SqhdIwgRQRpLg1Q1DcpcIcVtG/1ahVgQGAHoj4irzEpCZmAJvpVS6BFQwAwSSQF/mY4ncr5gKkeN/3AuCiRz+Y5ExcUQUERAadiZQgWHcSeSogo5CEEMTKJA6EJ3l5dNrmwRpyYAwLJ05d5kGYC0yaLMKAXTUK8NTZg1yRA0zcos8rEB5HTMbYgsLEcL2NGEN6jpcA8dwxsQmZyZvopufOmVvmCAy1jziTCERCBGEJAQjiaAO0FZ4m0zDghAiSAOo5dBHHWIzBhiuZgLZz0FLIYhPHoS8LmX7QcWBsJOSOTFtCEqJllGa+D/U7R+fxFSb5/EDYb3P4hFkC/3tCBaTc+yM0MAMOM4qu8CMGIdC7cxIyCod4BGOEDGjLGPSHqLI90sII2+kUFhKB7/lNSpswA+EZ3O0IMnzA7ELsHTMZxNBb2cmFFkGJf+Z3jwM2MCFDTTm+tahKOIQPEqAcvVKUnMeSaEKLmFdqlgQ9n1Btk9F1Rm586ASP8/eMUGB010NQkqhJCEhEPpBKh8Zy6DMfaax0ORBBBQQIDi2uJvYK1zEVvyc/WYAX5hx1iMDpO/K5cHRqDGIySl+yOsQmkoGC5qgmGCuPkj8puAWXtgR8ZR9kPMpq9TxFYZe2ZQ9telDzhBoBYB+n094c5iXL6cjly3LUAC2Kb4S7ogQAcmJgRQXaEgQqClyK3sZ2sbMHRiYKb3iEKwPJiBkSadjxLlLk3CVICCUZ6YpB7qcKfawILjpfRF+s/E/Sf4gSZF5A/iJ/t+IOC9w6qKPz7oU46OSY9oh5bhZIiA/OGYCyR2hCAGWVqGIA4uAapReIlVrtCAgjyGRj1R29IyRyY3HICvtCyj9oP6aFfbLcR11zMT2KeYkgUYYTDwHtDQSgozQy5hHPjJUFIC2C4w+huGoBoNZmfch2hAjWqIhEQiwRc/WIVTB5Rf4xf4xf4wYUxPZ6Q8303NZgDOyNZlJIaLgjsoQAOTIWOx6bAuiWRCNrACPLlFpP8CD2Q9GODA4DqmD+/eD6t1gwiBdlwqKF6zXp2j8Qd4gwgBbxCxRVANwrTUbIQRwP6jAruBSBX9ntHX7fiI/Z9JevaIg1FMPnBqGmEAuO5xLf4CNvoSWYyWoyHSAJZDuAJAZWYTDiagGsDAHGILGHaODGQIKEEoMNBgq7BcP7QbBw2/aN8ECXfiAAcALgB2cq3POhpIjZJALzgkGIQNNxJ+0DCRjCVP0Ztu9TWJgKeZC67Dvi2pE3NUhKrvgK3oc3BG4mhM6PA3A38saDICx25EtLRmJ3mW5bBYCyYjSo6EuX3nvLtSN5Q8EUJHIQncgPIEXkwkiMXvRq9cQCFlazkTVto9xLbYR7wErZC/PUFFkd5vAHpPXHp5qi44dc3BrGwDUMkbl2DoVnbaEncVwFh9hC0itylAND2hjDG3KkYFlCwEyCXUYse+LX4UUOXgEJw5nEBYqL7dQJAQkdBCg4JQgIhFRmkQFBWICoUysQkzsIA1JJUhJJlS1j4lm0a7Cbh7/fxOev4IELx+39pYvH7f0m2V/eJGdPp/aOUW/CC7f8AsZ9WXgQwCIhGjMQe0I+RSO8fzwD2mQ/eW8W9yMm5uALZNnEHAAZK6d0LIQJ2IdQt1lYUOoNyzcKSCKyoSTmVQxO5uw84QSL+CfqkJv5QlofPQXGHgmlgKQEIBKBw9ELJuXCCKY2ORDhIaATrmPJK/V+IY2r9U732lv6vmExkXp/cP+H+4xmGU6EHiUJ3g7rok0WCSeISUDJIt+7ocvBWPrOWpueYm4rrKvz6Cnc9MESGyAu9QWwfeB0KLca5R5l6QDDDCYmswbMy5e/Da6bmvQFqR9mYJh56h+z3szBFOAQ2LkcHUaHkFHon2UBswFFwRK3ln8mBASAwLY5jgkVOdwjBsxrDzAa7IBAGFhKwXcqCzoMNcJRcQ349pp0ISbNE/UCPIM2vqRGBvX2JgvM4P0H7wgMOhI+A+8DVYQ77kfaWTO3zM+ZDZgEcD5Mq/PAIcb+4QBlCAAGaws8mF4ztd7gQNIQX0OTHUNzccJz5IlzsC9ZZHoCAIJQHkfqAOhyYDKM1nHlAZ2AcKApFqyDGEhxmAIWFd+iiEU2Y23RV5BqXYpkSYNjowdQEkEluEKAC33hhFITDESY/MMxw5OoIUCIxvph1SXMNc3NwUFw0qW4nkcOiXQR2mQfYDBvLhGgLIRy+doDBTMCGlQ3UCYyIBRKcnMyPSxUPsw84IIMzNnhx+ZsRY+H97QmWuI9sR6bLPGhgkBREYS4SvMP0QaWx9cbHo+qAr0Re6vohPzoDXp/VKcQlxkV5h94KPqv7iPMQoOF4NczjGm1OQc7tyqBULjhMIT8HlrEUQsn7cG0oTJGYAoqQQwgPQLocoDYZMag7H4huxhDdixiiXhSI4hy4HtGnftCA3kuTCL2awM79IJqXuBErP7naIMtPYRFhp2iy+iMs2jrPshZRlmEuekRgW+Jj5Zjz15QMRkCLCENo4SCWafdCdYEwQV+Ep/SAwK+CCzs4dJWOINvox6+jP8OHLn5YYXArJGzNKGr+hjyEBee5/lJlMSoRo07yfaFJvB9ZkVWi25B8CH2V/RCR3H3QMHjHwYCHSIErAWOYcxNk8wmACEYHHnHNSuFriEtkVkFQl6KAo/GH/LGeoCGIQw3AGZi+jzNIsOVFETYH9o4cmBgsThC2LwYVkg2jcOIAdgv4AXKPucYCbyfmCnAfaEKXDVCpH0KAwmAlw5c1LfSVZhHeEg8REsD3muaxcCl263DUJ0W3ELf1QiT3i9SmTFbcIYteLfpuJ4mLPd7x2gP15xWKdY/uECBBJKvpvoPk/aH4n16a+v8AoJ9R9E+D90HxPoem5Sus+fWE9XG8w8WAwhiTB5684cKKARykwWAjT5miUAhlvWEC0FMCfpCH/FGYb9ehNqj7CA3gRHhEWEX/AE/gH4rwDTiS0oHhHYQWoTL6GjnxRUE2RvJSwSUHCgeuZhmYNzOKouiqEV0VTUAEHxKjQ7NiEGW2cLMAcIDGOLHEIXXfpvpn1QTJUAE1by6Os4j7m4RkQ8QCSlWlGeTeYy8msR0nURCh9oAAuEYroMiLsLE2HHaAhCa0bXPrAFBV6lgqAa4Oxw9IvUam+6MVwJB95ogqhKDjIeBs9oVYOA3zOy2x1VGl3EJ5e5OBeg6HLpvwHxGvOnaEiMIWCxWfOEFANmPBFEFmEEADAbuIfuLliBfSBuVGOO5nFF0VeEaihoR+PvpnBRQ5hcCp44lBoNeUExDUAw8TsfYwkAQXlCmGDXlBTjB8oHjHZGpbh7GBIIJ94NAABzBwkFBAMCYSyHGgHBxdoG0dwGXH5AlZCHI1AwwBfglVI2juBwrBsEQ0FFNOBogLLQym5NHcYQYFEbERd7RqEQkBeDqAhBXpBroecJtH0cfQ3LiMRlxGIw0DDkAwJcEAIMMzv6SMZe/OBQmDMIiDmEmb9ZRHhJLouIxQkiMRl9P7OPHlyx1BPQ7EfCFmIy5gGUYmZIPaEiSTvpeHeUdwF2CtRjHjRcQ7gPZnUUYQF+8YhBgxjI8zuJQYMsh5hoCZHkJnSI4PEa2sjuXwJDsh5hzVCahvCPPiFEJ5nc2/tl5MjERrj7oihcoFSBDl4hnwHEGI+mvG45lFFvoWLj64eG/4Gn8rGb8KhzCBo9PSgRVkqB9VCpuEDmGaHU5eIZ8BxAajjjr+HLof8Ycf/IMZuAxJnrIQ9NFmIFuO4I2hm5XMMGupy/iOIMdXXgZjPgGZcvoRjPRmEfCv/lGE30ZQV4WaZgFJb8VrqcvG44444/EOPwDrOHwCWHhfgBjEYjEd9DjhP8IKESJFhN9FWYQoDDCzCA3FcsMwzcUMfRw5f/APqam+h8Zy/wDcfVHqzH0uF+M5f++4/C/4Dl/8E4/4jl/8MZvofB//2gAMAwEAAgADAAAAEAIAAAAKQSAAAAAACbb/ANpJLv8AtpJAAAAAAAAAAAAEklsttNJpJJJJb22wJt/6/pIW27ZJJtksskkkkElsNkJJbbbb220NN+S9uRyNqW9JA7bbJJskkkkkkttpze2AgABJN+SlL2JUlROyMS6pIm37ZJMtkkJptbew/qSVt/8AkoSlTk6G+51qpdsYgodt2yTbSSbSSXwFabslkkpa8Cx4M/GqHiAoPVccsQNv2TIfNi2X8TWsvfbaS9hcvNY+HUX/AGPU7Dj0q0lbdkzbbFt6a94H1BktrI1OwM8dTMcxoP1U4Xe7klbtm7wml8WpM0mmknkO48yewi9cu1+WGYBLDW7JKjskk23THZVbBYFJ85A6CQ18NDRRYtberE5Mc005bM2S1/JAlWyk69hJG5p/LCe+wnAdv0bXIpGkW2pbcyUvAowPerLLMM7LA1VBEVdjZG7RsPGY7cvW2ELYyEg2GI5jn8OXkn3wA3uXDvmxK85f/KMarVZKgbWYk4E9MxORMFG+z2SwqdHV2RV3QOw7rXJKFD4ejTUhW4kypkdQgOzWWKCuvFc0bFKT1OvR9epk64S7a0FZQ79KedqqasBvzFFABarQFl6sBTuiVNeHFVw2gSO6ZZmSfzmlB1OxIqfnEroCNRTsconL0byLHWTEFyUiFJ+ddv3MfIR2nhjzLqaRs865icyigbnE5rCcTfFWdEUsh5QfgIhulXJa8ypQ4gJsyNwmo4sIsHpx4Nd8l8/clm0e5Oyo490+R/3R4gVoXw4NZETADOQKuzDFnmljE9EiP5j/AAyAwWY7GdOEYVrRW9D/AAz5KbuLd4Y3HeoPjaKdYHdQnVFQ354n9hQRjrDP0j8n6auXPG4uix4x6l6DFLO3QyyAxxDEioXcVAJC36RMPV7UA00zpe6xsizJZDdGZu9qWJWrZb234Hf4VDhAqItIHImklPZQKxjqvXegiEw+L/oorIFa2H0q9WkWH1tDH5c/xMUnb/XJBM46C9qURxidf99PF6gZ7q+Lg0J0iTP2h/u4BRawmZj20ZEPLaUOdfGAJQqcUEcUdehztX2kYjIDi2xswr6yu4hdeCkUcbr74i6IUdbUkaSFITFaeXrihGgkqq6ON6dFdiqmkKNaQIfj2aVpTbssrYTsIuIOGYbFihBG4Xj78IIT3/1hnxL2ftqtl+81kATd73NPlcsBISHIeir4JwPealrftpqQDaTdiSSktgctqYDN3t6++pS8KqkHJZUiVS8G5stsNl3lsLSWsaIyx3Mc3GQ5JS8FYdYilsSUkSMuaXsTsoJSwhadjGD34q1r3DpISXkbekkkkktlukkkEgkkktv/ANJUpn2gYsRzHqyTUlvYAk020kkkmm232200kkkAk1KnGy33rzHKSSSSkkt7bbbbbbt7bbbbbbbbZt7bE9anEsnY1ejSSSSSS22m00mS222222222222SkvYGpK2g2pU5kSSSSSSSSSSSSSSSSSSSSSSSSSSAm5K1JXy7JT5f//EACsRAQACAQIEBgMBAQEBAQAAAAEAESExQRBRYfBxkaGxwdEggeEw8WBAUP/aAAgBAwEBPxD/ANdf4XL/AAv/AMVcvhcv8bl8L/8A3bly5cxMS5ZBJf8Aljjf/wB9y5cuXLly/wDW4/k9y404aSsLS5cuXK8FYWiyyXLlkuXL/wDgv/4H8Nv9WP5YlJcvEuaZcvhtDgHA6wOKfgf/AFszxXP4Gn+rFJZLOF8KIQqWSypZK1KIUcKKhRLgxR1l8X8DT/4j87/G4uYMuXDT/VaxZcuXLly4tJcvEuKxlQxLl4lzWBMZlKhiaxMw4mn/AM1y5cuX+GJrKlcF0SyXLl/jSUlJSIc4hzlc0rmiDWV5yvOWc5nm54oVDMsaygqAwK4U1rAG8od4DnAG8bTxwhhtCKlTSOdEClzRe0uXLg/4V+Fy+Cy+FkG2LwFpefxUuXw0fg8LJiKN0UlksjIsuWQQGYKDMsmKmIjSynTnfnHRN+D9wVFHyenXqSthXh/ZWVjy/sClUvwfuXiHXw2rMDrMf8dEQtulBTMVnE2xN7Zowh/ssuOADziBU9biti8A3N+K1wHArUuXNH4LwuLFC1iy5ccXmXLxFglwILGDQxCQyOTlUJVjt7fVly8Qm0CUXTOr6/UIsa8Mw4Zhx0TVzBaal0S57xU2mjNQdolg4rULNPzvi8AFk9UReq/RUNY6y4M346saBefvwhdIWzOSaOC+DBZqbcTdM2F2ZhVIXTMzU0kzDnnMmY0Xdr8Px5QveZjgwYXR6ux30nJfp9wy5+n3LOV6fc6z0+4Pm9PuW5vT7nQ9vuHI9vuCrT2+4BMs8NEO6q2ALIFsP3NoVEmkuISyHAVLd5mH+Nyo10/oxBWv7gZjFIlGI3W7e8QbdtfHl30n7Br4uh+oFRKwguXlzxS8CpcvgpNcvLxRuKxm9y1RlS05Fy/vk1NEgGegiBaBzpqIQjZEbWrsZYSYjySr8IXvLlqOYWd+EXWs0f7C1OfV14Pm3xLJcW/bu97+ETLOp4cv1MGlPOB2ec6pOpCjUgHRirKg94VZUQEseCXFxyuMId5YVKagruWCbxxmBHUJa46QyRL/AB2jUxwOGfdesysP1LJVbVK80bHBpKDqDw185WAsGdsvXOh3pAOsur1d4BySpAVLZpPL+wq8bbdB5yrivL+xLtjp49ZZJjy6vXpAI2c+A8qVF4KrAaR0lIBj68pgQ4m81UepV+kJpIF/ZXtLayTFtDj9gpAGsl9IpaIsevOL2rr1S4hBgiqg1G/1pEUBn47zL5R7x0Mb7sPGgaw3rkEAYde/SAVkii13giAHp1fomBaR7qywCE2gJu2lKtdIaTVl4ZaZYmgGrici8QysHEwstmGqhhkY6FYg5/Lb8Blxt9fK5rfVcFzwXcvMYONYdtg0+MFo5xS5Soi7+YaB9YBg95U094A4fWEFHBZzGpBsEl2lNPBCVAIMM9HZd2fs1g7V7K0PD7lIpoZHlFRodc+39lKetvN5xCxnUdH6mCVBsb+MSqOGPEB1u/TWIK2vQ5EzGwpluuh/PqFuuKrt19iXWozJGEOH3/sqbhND70JcKtj3ZrrYgooqsjaOr+ZCHSIaRTeFbQJuoVDMiSytPOXYjqa+cDMWGkYB/kGIRrQfOMKJ+7i1FoHuqJY6vPSWJhBHRF1EQA3j9fUGhh336ywU+n9i1F6fc6j0+41dPb7mi69vuDWkfT7ityV5SjghALhlXOVlXBZzms2inOCFOkBFqH6/sbmB5f2Vg7ymS4OiMoYUHWkZS6rvr4f2FKcpSAhSjt7SyrJSWCqPBDWqrExapfoTz4akH25ZVq1nWjVrGkubpmBGzv8A7LQpaBxPw8Meictbzcra5YStPmIzql+ksjGmNPIM1yu/0YgUxHbuJp9948olUPSaaqFdCU11g9/5DZOh2cBdtz9ZlupRt2TYqBNhGp4IrSZbQQVBuun8hw3QA4iFTJKKjQ99vLXynMHwIXDbymERv6gqXfymcreUzrbylxtvKDbX8pUUiuZACGXuu949cQRmkBBGIfogM7Hf884ZOCzpDJpLFDMPa+lRwRTVXtBFexwdIEYXuC5ZUd834lhiCkhpQxhohZrjaMGy+s9M+dxq3V7RULqWIzJiJcTcxHchJzYhIDdxAeSBYoDQ3rziGzzgsIXlACiIGOFmmKKrX35REWB4fUMsvJp9RBpGr35RYJW6afUqHQNe6lo5jS0oMxvLdD9X2yzkYIZol4MBt7v7r58WBrPtECoUTGYM+EQULPCFl1XPELsC/wBR5SseEDZzadYzoa9JSCimUK2TaDbDnEpKnJgpRwWoMHE15gMa4fuWlrg2CqaoCTFjN3GwRYNSCy24n8TElZlEdGGW9oxFd994grgCwOO7jNz4pf8Ay40cG7C9DKWfj7nW9vuXu79vuLhv2+4Oy32+4C4Ztw0I6jDJvS715ViI2N1a7gZmsNB571FN7VZVkKKYXVtr4d/MuJOZ7y5sza+Z9JWZmFAefrXgRHZAQH/pCrJcrWrylW21fbvP7ghWkuBWmkDY1YWq4vTvvebbmBoGHWZhTombDXXrKSmDTp36Qt1yw5U5d93nWGqDhfBgk2mvGCfr4iNW6/gatvKUvV5QHd5QbLjLh/ixJWYw0Y1Go2KY2rMrxUteHE7REVOHKA3rKJnhZpiPAzNSl3MSG4GbiCVKuuT1794CX2fSVj3PXv3iUkIGMlbJXhfx9TzqeXq4O+msx5Vt57+Ll6AbwRKH9nlfqutENaBMcNlVKJRUouJFDd0OczL0LWmm3yRqzDI8yCx3R3db6fJ38Q87J4bnjLaje/ifZ9SxvpnxP53rHEt018HR76zELXkQEW/WIFyiYmFe0yZ6dY3BMTExLXx5j7nYT7imj0vuW5/T7j1VUK4WRaleTLOCSVupYPKAO2HBcO8HbafeEC2li/8Ar+y2/n/YFo3vrKtPKUG6yvDohuMebLASay1Z46ZYxglqiw2VbCveGVTSbt99/wDIPxIthmUB7IO0dHv+zIHc179YI6Hvv9y1oyzDatOBFWRfJL5JfJFqEvp7/UGnDbgm5CNa9Ll9ajoV43AWMhS2a9SaTU1v7/2Ds3zro8v39y9zxM77nfXlAe4z5nfxFk1Vkzqbn6+oz4eEApRAX8TfznrK9fOVrfzlFd8ozLjh68urt8soWe77lVDQ1IBi3kapFkjOl+a+7HmXFlGjo5sRR6EEr+sptwQyl3KUlRBWiLBdECWsxd4VylrqocWQqqyMKFBGD1nq8vL1SZBDZeP+yo1FQvprvp8xTuu8+EVtM3CM2ljBZGtdTC1hNP7GrHeZ6ogYJUpAigpdzmd9PaWxj176e0t+PfRi5bmvzNSE2gQXROhQ4jX9EqvIn96MGtu0tw0hNWCQpnvnMTEwRpmFUtM7ZgGGd3d8ZeAKS/fPnFN6f2b6rn+94U9nzEDj9fJEtuVjMvGqubhiVlOY35W8oQPgde3gN0uvfrANpetPnCrp82FNvnL1SfOKWEIyrmZGFReHkJR/0isv8WWRMQOUeCAuAP8AsC7NTrKGTzg0Km7Hx175wIWSisMQm2dcwABMXLSr1fdmLh27+s5R0+GNrD2/xORe3+psDp8Syod/f+JRWOvz/UNs6fBOdyh0RyQd/Hu7w/qDxfJk78MMZrYffvH/ACFGJjmmr4coAYJtEEbY6hharbGFkAecKjdB7/yBkL5sNzbyhcDvADSZjcGlQIaehni9GFs+kBuxgMnARDMARqEuFBiNQDVwKFk08dz9wICjzPuAl5dYc+Yvn/kC6d36h2v5KCgHh2SyCTJEYeXWvSGlbB1gu8QQH6qY/HOqeEzPoqXrP68ODl8IzUwbK0Y49/caUhFFZMaVjGGbx2picdpphCbcJEMtO3rrLVvN+DP/AH3iPB9PnvMMnMQmjnUdN5TBo8Ll13U7ES8RErrrXwXCr/s3PmVQTPtAFErhYmaiDSjQiXQ9D6gvV9D6hl20eZpfnxjh+vZfiIC+PsPzKGjvIRw/D1U+IMGuXufcipQYv2H5luuvwPaZoYIlmozNq9PqIPv8Pw/yLWWLVsC15cj7hRBlUOnNlOaBl68iVAqbSoKnoGO1CviULuRE1MebBlXz88VRcQ1dO6ipURQipQtwywC4FFRlxivBoe0SoqogGAkpnvrDS03l7uXbT2+4wCa75xHCrNOF2hc0y7xWm0dmGWYNDNwZMPfqdIKvMOf33mODTJ3/AGNfplgM2FRq0eUApyuV5sscw6PIxaeWDBKmBcNnP2jQ0X09/o6zcD1Nj31hkw9Lc99JRvOnqbne8Q2wwKgWDoe6O45+yJT+32RL/Yhh+B74a8Bgb/Z9stYFE0V7918/8jV+n/PGWPv336x6oevLz95es4cu+s/bMG0wE1dfHeaoK4kedy8Gqr16eEebDBFZy+ZEpn3H24XFVLpEZOz2wKrcgdR076S5dx4PDAMAw6yggNxfB36wVfE3303138IWQ9/uXagX9/2C6D6/csM5l6Myt7wN6MASUvSA5SsEZOCtEaNDDrAHHTSIGPR76QGQ8O+kEveNohy+7HAp82dJ837mCqfP+xrY+f8AYHk9/udB7/cMdX0/5AcGvtFdOf8AT5JVyjVYaxP+kmStSkpGtA9mFprU+CWPbWZJWx7sOn1+0F2tPojSK2fc+Yh1mKAAa+0TAe/OAYQw/wCSouRnx5/uAjOXGTJ1/Ud/WMmH+wB1gW8pUVsAhKQhQ0rV5VylPyB1iE0gA/VSuDSUzmdkCi34nNDr+JjwR5SukzXQy/B+9XpC3X89/ZAAhYtnh43KFsmAxKIVMVNMvOkGC6S13N/WNyvH1hm3Lcm5Au9n37x5S1vcad+kAWfnxMVE1nrt5b7yhn3/AJF9ff8AkCYeG3B9I+Yeg+xNftrPYPdnY8U7XgR0eD7nBqpllv7cZqDUe+UM59EtdPpDnekO59ETo+kAtvpAa+j+wLR9IE1ZrXBpt5srWOFRHnEa1lq1lr1i+b0+uB4P4FE+W0shK5zTy+XlFRM9NvGbM6o9LT1xcoAFsLYmDDKpplweGqDnheYMaKp1sc67/sEeuMf2FPvjTv0jusG/w1K4aeKt0EUGThRKg6AiFklHKIrSJm5ZWiItjHfvwbpl7Fve+pzxrFZdqiq8V6fqLcbvVrepfWIzWqNb1zzl7mTwa+WkqutZ0vpyj1rvWt+uYzLb3vo641heS6Yq/idYUcb1iB1eZANfw24P5KlQqiIi8ndQLU1b8QIC8kral3Lp0gM1wzXISONN3e8RTdGkkqViHEuDwuH4MuDcr8TKlSppjFhcOI/syqZYxZVNJ0PaBFILQXGXUi9HtMH8QaT2R63JFYFLGoWZuBqE2gS4Njjw8YmPUWO0yVh61yiAuCrN+UuFY78vmJiagjtL+amOdcooG2pvAFsMrDddHab8CCVxMG8MZqVKlSpXBVSyWSyWSyWR0ApG2I2pFypoalWCIIhekEBgWCUuV0gBMSyWS1LtLJZLIiVlZWWQR4gZSUlIUSyWS6cRUUEAFEpKw24mFVKkrKy9NRVqqJcaolJsPZTHA0NpdYZhiDOplNJFAIUacpqpmNgza/3AKMIEXo0mrmZdIa6ymsxFas0itj83SPBIaxMypUrP41wqVNEuXtwErjq4VK4Y/wABp/q1zaP4FsF3l4LckauyZqawQvebQWFzf/F4VKgZiZlSpWeFflUGOJX4tX41K/Maf6jmViJLb0l4qWwuGBXpEuspqNgm0thGD/g8ahrEzKlSs8KlSiUfhomJiVASjhRAX+OJj8xp/q1SsRqUuMTjjhFmIZRUrf4uv+VSpUqVLfkVK/BL41ocC3CUfxqVxS5aW4KxKZTKgf4orLRUvAo4XBuJZKbgmXqWGDwuESVK/wDAVK4meFw/8HRKOFkxwolHDEK/8NUr8KlSvxr/AMJUr/w5/icT8P/EACsRAAMAAgECBAYDAQEBAAAAAAABESExEEFRIGGR8DBxgaGx0WDB4UDxUP/aAAgBAgEBPxD+Zzxz+DwnEJ4YT+AzjPMZHxPg5/8AhQhCEIQn/IEIKuNFDUJzCuFDgSIyEIQhP/gL/hXjyUQmeNyE5fgLRR8LwP8A7JykTnr8VIyR+GsdshMkZdKx18V0dZBrglgnK8D/AOmeJJQc5e/ipCRCEIQghCZILkoyEyThsyMEUfCeB75e/wDmhCEJxGZ5pSkpGRkZPDRRRGJvsJvsV9ivsJmUX2I+xh0PkPkOwG66VDd4qo2fQr7DbsM30FB8o+BQOilNixrGycNp1IQhPjwnJrAihqfCPfgXg0KwJEZGaEZGNrsZt48EU0VN6I7GmvfodEXv0MdhTcG/L4VCbKCjqMkLJ1HqcMfxoQUJ1+gh4n9oJEJcJCY5SKGGBCG3gRCcaCaEiEEEIQTLIMOQThhMj39SHUnDE9OMD4wPlbNLA0qqdbrB1No0NCwPlDWb+EuFcxP1grSX80ehaINHTnSEnaXb8cVzbcJwkOFfAdBiOFw3Icc7MwMPsMGQ50MGw+wSQ0V6GR2ff9Ed/wA/ojv+f0R3/P6PM/P6Gnf8iWnw2Gy2IYnGNxl9DqMRFU4I04x8sdPiUjVL0GUSfQehCsTrFo7iTeF19+/qNpMlr+u/1HkaUbGhBkuDdIThJmhNJKKCVCQgiitMkdiRvRA2WJNjTY50K6jTYa68JJvBUyRsehlb0hG6M8ovsPtDZbQkq0rf4M+ojSI1wnBKE8QU6XQhOlyVSECT6Cm8DFqkQh7E/Fkzw+MGUxLfqZH2PlR9RRrY9qz9DNvJCmNOkRKr7/4Oevr5zsS3X39CDr7+hCJ59fJeXmO08FC7g6zqUkOQ6lDTRqHVYk6otiI7uMQcmB6jSEXThVNmaxDmGrPaHvA8l95YpJe+iI24hMOiGM4NUEuS0PZpEyRPAIrX0IwIaQ9iuzhDSjzwxLYax4uvga4RRr1NH7vCWOEJguHcOgk4VRPIN2xs2Nnst0Gby+EiYOpIL2OpSnUl7HSiE4QTXyaSHJ5STKImayFaHJG0IrVpja+9syW+9Ei9xqEFp9J8JTepfkaxuo9kOg/McoM6I2JKTfoQyLZqOdoHw9HwnnhNE2vQQ0jv0glSWWxrsI29CLqWYQ3WdC9BFdk9/wA/oVLf5NpfyNEt/keFh0zwmV64qDtjqR8dSEZUQKk3OIJB68UI6DaKysbY9y6kdjFTg9fGVKo8qTkUXGsjsiwUWjyBW0JCsKY8DJrPv/wmaCueMgr6nfTeXrCA6VD8uI+FRK1ezNknMCprZgssi7I7jcWx7PMPOPOPMPMPMKYoqUi7LBguKhnXBttZFaUNuCz1JnY0tZPcjuT3G01yY3RtLqQ8UTsxpo2NhqMwfcNYO40ITzHh7JbSYrEFlwsGjTScLY1QlF4FEr99kbCLxo8x7Ei5TQkE4+h9x/Qil5iQcIngxwioihLHcdXsUrGiyO4xJdy+wn66HkU3nmsxFYRdhp2JuhNkhOajZh6E6oW4EmjHYabmNxyV1II2NUNYIcPY54l4hJDGotFg1dfEIM0m6FW2REQaoaVGW0RMQ8QTWxKGDSGlBFPChMuCsWXyq6D1cVRKZFTK+4xMeqHGyDpByD0deCkdqGxBl3FMmjqOHgbOPodIy8R9hOERGYl4Ubx5KI1B1FwVaPh8TmMZpEbRfv8AsTVi8Dy2vUruiu69RqMRwfwUUuOHtCoqUyC6i+RV2E50LjQ3nBkqDbRkULRWjIqDeIZojTG/qR6D+xbUJ1QZtpjwHRSEt+/eBgzw2UyZpkmayO6EaKxnijr3y03hGTKeY0PD7DTThWZNJ1FUwGJmTJB72vT/AAruvf0E6mvf0Plff9CNdaPiEPnHHCZl5ERdxNbqEji0NSRgTPBYRHYvkVPpxDmhpdhrsJDSSVHHrnbjBoiawiGhzRgaIx4J9UYVXRjw80OQTL5nTiLuY7iJvZCeGNvjrxMp0baKmSCPZJw26idxXv3RnUgx1FDo9i/aLvT0KSvzHqaUMQPvHSDRtten+Gfa/wAG51Xp/g2eP6FwQTATdefZCOvqZ9wvrwmyuQq2iU7RKUTG7oBdqJO5FNjZg542NbtiKSUK1kgggeGVMb7DUmk9jUYR5USJ0RByjQdRCUNMVtGxm7p5nvs3VpjSwRx2hhrBnhieBtBarIG21I99hKvfQ6aZ7E01WLCh1EUzRtBMlCYF/wDAuMnt0NvqR3ehHf6DTv8AQaf+BsUbGFig1KZ/IgyfmJ3/AIyBPCiSQTq5JNsbFQyZo7B20deFOo37fUtCft9C+31KzwYg2jHGsyVQWwkbVEs29IrOo6cDa6FYyvCHSLA1kxtvYkZk0Nt7XCDbouCBgk4RkdMjuDrZkVQ/Lp7HXb9/QVGhDTdCvZ+yl7P7L937LOp0g0xYRiM/c7DVmvPyE8bDv274sTB81MHeR0+vCwhGnHUeuKcLDJmfg38TzIoYKraHh9jHTuh/kvra4V3fXhZwhp0rbQ3XWUXFKTSFGqJFYxK82hv31SE5pe9tFlfemyEvfYa333Jok9/IxDyxLiWvfoJCRX1ejRbwtjSrb0XA8nUo1NA1sr1N682JDfoik88pXBI9dRLokybFghKcFvG4WsRoLY1GOQkXjBs4wYNyQNRwkIeBYyKQaKCZywxfdGwL+Z5v1FPdDwwLYW2bcWuD6uwsXv6fseOdzN5Io4+o8cY3Rsv6/lCWV9PyxPHvsx699kN599zr77sTi99jEN1nQmQYSVvR+2dfksGJ7N5L2NBu8sWg1UV6f6Jmn5iUML0Yq6cpakJNouq9oZb3HW9EQkFwhCUPoGYTMIwwmPzHzmDZTbKKmxvNjqZU2NixoMXY7BvH3Ge3yG/VkbEaLK5aV3K7ir7FeRH5Cp+SGWEHv6P+hKUkfKGPWULD5h4Ze6Zj5f0WDvX9DP29ysnvLExTIodt6PlG240rjutFVeMMSCe1+BuNy6JEN2Jk0x51fp/o81efkUuoe5+6XhVZR7PMbcL+xsUEMXjkvs/ZS5KZLYmXkyZh1NyYGhOOkyEVeQod94MCSIsPoxJ66oxvoOrHj54TSR1Pv7k9fj/R08rjrwtB6HR8v6Fp8/0ez8xez58+phw2FRoMug9SqDJ6Ooyg32iabQ2uhmkGvN6IvrxRPyE86KroiaI7fn9/AYoE5ynTAhMydBskJl8aDwpuQa4mBricS2qSNSIohaHjxcG3MUrEjeHxSj1WxJNYZS5OhEyxCUPhDTrU+gtGKMfoK2jRDHUcn+P7MiczsN+X0ZPTheJ+C8NgLTMDDq9F/ZgxcUUTgk1smTLgpcmxCcTA/AiDU+E2FTcbg2pv8MNU8IR04lbIu4kzyzAtCOYRHsi7iSFxSQsb1IRJtIxCaZYKI4N6owNBHQj2PaQ5X6jRqZReSEEuhjTYTauwkvFKUpS0jMkZkjIxI0ngysj2FEooZJ0yiixtsyRkZGQRkZGJiyijI6uU2UUUOsjMkqyRJ1sbvJRQwSCyyybUS2pGaCdCdFljYzrzj8vhdRyI2PY9ngamdFMmSdj2Ion41vwPQnjilx46U2IThi86cXnPwD38VrwvARDS6cTUYYiaZiidQcOpEOC+CuaN4E8FKXBeL4tijfhQ08NL4z3xS/CNgpSKG3EQ5wNKbIR1EUHg6kQxDXwrw9CZSnTwVlfgWzJnhtjb4rGc8OfgHvwP4OnNQRp+E0EhkueFfCpSlKUpfBS+BPmo+Crg6XhpeUyoqKXJSlG/gpwgggbr4g1BOMqg0RFMkNTiDLxf4BSl4eOX/A6y8RmeKyvjI7/BqXw0v8HvFL/B38F8vwf/xAAqEAEAAgIBAwMFAAMBAQEAAAABABEhMUFRYZFxgaEQscHR8CDh8TBAUP/aAAgBAQABPxDem3md55nceZ3Hmdx5nceZ3Hmdx5nceZ3Hmdx5nceZ3nmd55nceZ3nmXcvM7jzO48zuPM7jzO48zuPM7jzO48zuPM7jzO48zuPMvqeZfU8y+p5l9TzO48y+p8y+p5l9TzL6nmX1PmX1PmX1PmX1PmX1PmX1PmX1PmX1PmX1PmX1PMvqeZ3Hmdx5l9TzL6nmX1PMvqeZ3Hmdx5nceZ3Hmdx5nceZ3Hmdx5nceZ3Hmdx5nceZ3Hmdx5nceZ3Hmdx5nceZ3Hmdx5nceZ3HmfMf/hr/wA6lSpUqVKlSpUqVKlSsypUqVKlSpUqVKlf51K/9/mP/wBdfTn68yu0qVK7SpUtnEsGpUWcRpxKlZlSpbpKriVKlUypUT/5vmP+XP8A8Ff41KlSpUrMqVKzKesrEpmb3M1uUxy394lMvzKlZlSmZ6xvr9M9Y2sBlQ3eZUplP/xnzMr6YmK+mJj6YmIWlesRx9AE3E8P0+uVn6VKz9KlSoEqVKlQvTcH1lq3LXuBKKlS9uHxFDxL4zG5/CKGR4l8FlFypWJsYYo39pfrFfxE2g0wz+qi7zLwTF3l+j1RKf8A1qVKnzH6O5iYr/HExDX14mk51PaVHb68/wCFZ+vMNantDjDpA3iVjUovUDtKxqVrEuz6o0AdIhRiUWx1lYcQ4Y4jlqVWye0FpjpMtk1xFcWRWNzANRVEcs1FjUcsqe3/ALB9fnM4jv8Azx9AwSjrE6TNQFImcTMzHb60yvpmUympTM3KalMLXoIDmU1KtAcympTiXLgzcKHpGgjY95gcQhu0WaQiW+Jkl0Y6RbCI1qI4gbYgaxGU3KahYzczMwRn/wBOD6k3csrG47lTj6UdZR1+lHWVAwSpWZVkDlEDhlYld4mUqcSsypWJUrMqVKzAxKmLLgmzJAVuUvcDeZpucMzZzOsOI4mTUc2TmVpyQUlmvzG6a4+gmIYc9JyzKrNzTgiouCYCVFUaxMuEMZj+UcsrvKxB9FfTn/xNfV+Zlxz/AIVLVLdJa9SqNQWiKekRHUtTUMFRozXU9MpwEv0l61L3qVWycfTFwzNGUybQo2igtVR6r65hQ/lMB+UyftCFRJh38zXn5hai2HmFAvdl2y+PznRFvHc+k4qU9YTGnFxZ2zXMDgnvMFNc9Zi58czpf3gdPB6xFa13lrdCusodkcTp7y1gpmoUftLYemembYItXppzcuwtaSubi7AI3+E26ReRkmILi9RY6lY/xuXLh8jOPpUrEqGRLBf4gLL/AMR4BQlv4irXxKbYntKzKldoW2U5x8SmtfEpsx8QPDiVjUp6Sm9QOMcymjHxAbcfEBrXxC3x8QNYcHEDTj4gUfhMmuOkFuPiHuHSaPwjiAsdCPDr6IjRj4lNsdeJTTj4gjIkQDDthtrxEfIGQPv+kDjTACSkNu2fFMoVyqijpj9oogIbEtnNcJSoYHAteM6+IWBrFwKVYtLw3xCxpVcEVKUx0ma18RO0zepUzOZmZqFjYw8HXRjlUUBugiNCWbVR6zpTDGhWNt2ksQNldCK9KDU0j/n85lfXj6EGhsj/AAeCp5h5hjM/DLy0lgFxpyRu2cxMpUrMLYJbr4IhZ8cWFY6iMorcrJmDq4nErvKzBkzzKwZIGWTmGTJuFzP5hVkaIFOSaMm5S9NEK2SA4NymMNQF8OYW0ijGSJtCnNY1HiUN9IZsCKDCYRl8R6NBcn6/5POUfz+QiY2QObklfK9EFWgVQMuDy/qOmGecS0dMQoc5I4mJTSEdI0uJUrE7k3KZMtd9ShqYPRERG2dQ7twxfChHItWIDG3hnZDm9Z7V5hoAYCjhrJNPpzAtC4Kxl6x39fmP1qVj6aIR5FM6B44hABx0LzNkBSXM/mIOW98xC0qVmAXc6ekIGGiHXKAtCQRooHSKGlPMsB6IPhLUd41BmLmUlieSAW94VXMrbf8AMrWPBzL9gfk/cqV61KL06IiTIKb7kobzbOGHXWGXDzzAa2OFjUytHnmcJtyzqDXMuIHFltLzTjr5mLGcLMXmHG5IBAbSoHmzyelwsMO84g4oDi7IWDV0Emj8f6R/0H6Rtf6eIc39PSOP+XiOp/L0iMhmDPsnH0Eq9tChb2jQ/K77xFqB1K/UBTTVc3qFS1GrvU4qIKj4QQcN5mkpUAywFq1W0lIW+Nj0nqi1Hr9PmMPoDM19AR1ChqLYcrX3NxpOGWF75iyKgAYj3JhbVlXdEdrhgHQbf7vAtgwEMByvG/WZYATYbrv1LjzEpart0i16VZ6YILbJsw+Ikin0dn+pS9PiZgOIJOIqrnMNzxEUw16TM4fEKtPiVAN+kqCsBxBpxp0mII76QUFuOIOEl1EL3W6mRG5SejSY4vgIO5tz1+nS/eJ0rGgjGIYcA3pbt9JwZID6WzxMWIt8EAcisBT0496iTaAtPQRMJKxsUEd59mPZJ0sxcoLDKygN/rxHfwQTAVT4v0B5YhfQqfxcKSxyXgA390Oer1xx/czQeTNCj1Ki6Pw+DHp/dI8ozGP4mW0gtnWcSxqF9UAlxFvrvcZgCWGWusATeMhUBtdPaIIZVtxLVKEEtZa9e8uIQAL3QVFZMSaHjvHKvNX8EaCi+3WEEGhhTYfWLfH0L7zAanMCNMwI2zMy8x0KHFw9oclfoA/ETl94uLvGR9GYFQ1wbDp/dpy3whI6Cis/jvGBjURPPVCW62c9Zoes7Vr7Z94gmEaS4KErPcly4vrHMcJAG3t2hujXkAwI6doQksvQMXXSEl6GgVgeneNkksACsnSCbGIDsmaCJls5lEuNF4P5n/kptz15lSWsdktyq15QumfmAi8B1gRf3ibDdC77RJ6mjpnXtA32ktsIx6ixpqODlbXygRJbS6xnAoWcgALugeICV+0oqWtHV57TKBAboTSN7xBBmmG7I/IiGxqnJcwsmRa1ZCHsXUCSYbxFL66gmixeYymYxYZFeuz57RRyMb1bZ9j0mRMEc+Iym5Q0cnuZ/wCw2QhLVwvM4PwRwIr5f7rCk84BAKVNrfd5fiNY0tBdHEqCzbiHJDWmrvQ8Qt5oQFTbGwX7mpTaQKZNlcsqdN1nfEREA6FhfivmOeBYu31YawxZddIyhwl8wbClErXPM5WWrIwy2nGRXeO63OBrDOn1+Yy8fRfeDZllRisPiBLe39VrxxODQ/iWXe4CSjNPiYuRN8SlqvxKxgi0OICrFrbvwK3/AGIDew9w4fx46wQC648wZS1cAKAKKVq5RL1raeW/usWvmsnFxN6FZxr9REFl2WcYD7BDVeACgCpi4tm9yptDpa08P93mSAiiTIVw3BtNQqkHTlMgK7iryBE4Y6opgputNUw612AXNXWAOhKqWpgPrwnDAslVtSeyM17SvAoD0IwB0I8wCqFF6b2TG60GO1oHedwUykiU0xpALGnd1bZ8xpqqJvqjrMU5ddIWWEBJ3q77fRjHLSXfPi69VmhdYDQRKhazNLUwTPV7Sh060e4f3CRFtgNws5tNt4wwBQtSdhy/jzHFytdTpLl1VVa5EQ5QeVTZj0T+7RqbYvbtDeEAE8loRgR7kXY6qtZr1g5wXklMK6wAD2CUTu2fgdS02WacCPpMi7KE0/33g5YaBTIKOkEHOoyVgnIF8fqbbjCfOYQg9IGNT2i2p6YqJgmRgM5sRHvzE0gAr/GIqC1wEAjgBFk0t3Q4WXZRd9Dk+YtJZBq2FKKaA9ht/H/IgOQgj79usp+Qim187ff1CZ4Ygs5vZ4+Qju0wLNHrjUMTFTBh30TZ/b7S4PfEr4lHdg4HpqJUZ0D8iVezqgw8kVcV8TnUWzW4tA1XSLXPKHD+PEKXMZRDjiDhiADc0gXSDhjpAQekmpyi8StiMVHqVpAciFuuYTKSH2mM5vrBFFBfLfWCQzV8f7mBpZ/uZQdBZt94Kw1IfO9zAksPXGYhgUqPXj4346wihRXLbmY37jGv8jElK8sYrmhfYfx7yksFDSdJnytl0csFEVSugcE41DQdaNot+X/qW8mpsKcam7lderr7fqA5d+cvpMHzJlk/vzP+sjwF/qmYi5GOr/de0tVRwLTXWoz0hXo4fZllKNirzCo0N0FR39Q0R+nEcJ8yxDYjxL1h/nEuPgr+24jli4OKagnIs7RipBXxA2a+F/vvKTDsgNksWNJpuPIGsAZNirqy0vrEuYsZyq35WFSgsLDXvFrRsWDPJ77PeE6zLC28FXGzcyt9UXiGrtNELwDujfrr2esbZOWEYrk92vq3Kac437Cj4gNAAw9GvEzDDVei7+8Xu1tT6tzOPQb9FfaKGqBT0agWHvE0dvWXFCrE5EyJmbG9kt/ZEAqTUAJxbXHrK7NpbcXBFsXEGHJXMKx0mfMNBWnbye+vMS94Tjv0iy9dDJZxBKog6DKoqWpgy7uEt6ek3ce709JSmVs8DtCCxi+A9ZdalGXNkPZdS23Pu+1S2gKzA3OQgKC9vWUByvvGouBAuCZOeH3r47zSVnY4H58REpcC+YShUV5YilL7zUaBwPmE1gjdn7Zl2wjbTLMAsA2xLazf2JmYbwGBa3nz09/1BcDZxlgZjIXb/C+kBe7Fu9schFg1hu6/EENGQ9S/6iFRKsHDdWxvkKDGe/8ApjZHOVzxj9y+8vvN94QCdxqNY5YmObhfKK0HSjBaLdTecPiDC+NyoKyZ/vSIxnU9Ffr7y8UooLxMQEdPUZZJSb5RchrtByFg7yYbgdgUBve8+0GGmjYNBk9P+QszT6B0a5TMEKMFmFKokLDCu34jgitAY4METUvXExuPiNbHMa2OkFwSub/DCEQ6pr7oq/UDvko8os6mNjIqHkO4wZEW8FuvgwMnIFuR1zEU5AHJLSnIY2cn58y0iLbgDLGU0CxdNn7V7XzEKMyZHI13gKxvp/uOOpQO0MUoyfmekMA3xfZx7kxjL4mLgxfEOAK6I2XR++xMY2wLL5ipitkLA6xQqYwCt9+zErb67dXV1fpBu6lsC7Cvki5SEKIN4vJGyK0i5Tr0lqACF2TXXcCBCO4HNvSFRdZTC559mENOoWF1dSoJkvUFVtlJpIqtaWzEBeLjUM7iVGGSsO0d5Dh6vwRrL0P3e2/E2ROWGVlkpQNxImtRvuDKr+KfKxoAFeLflZ3vSve46Ndvv/uY1sUHtKd3m7/ESed4/vMuachX2lSovIy8am0B0gMOqEkt9tqVXFtsOVjftfzCqMcw0eBeXHJ+fMFtPecagntaq2cNf2OkUjbgNYvOLjZ4kHlqD8xQO1cviiu0sQqlrYxi/PEA4FdYPdxXkuBrhsGW8nZBtwVqxmKY6RrhAINEjwMuyBp0xVs9YrMEOSjw6blK7DWIDljO4zsUKLUvTxBImNkUAYwrtARUKveuj16ezCWAJI+qFrLfIn4IspjmC2fcICmXdR9qhkCYOHm9fZ8RsetosPyMZnnyBrvjcQV63l+pS3KNh2bfij0lAxnW6blYHZR4wrn+zG0wCAQc/uGtrXVLT+x6Y1O+4VMXjMWL1kWO3Tt0g5kETRXqgAGmGjp/UencAU9HrfPXmJeXCJQ5z8/1Shv6QXX9j0xqPzjc3iKxrMSmGcEQq+e8Shc+O6/iAi1bC2Ah01HfvMZxLf8AqOaPzGNjvNaiC43ohxa+yZ9FGrVjBXeHrBQXOf8AB+i8jCXgGYu6eULogffgcwNHrHKAlU0TKCWWDa5MHEtutzwcuDUvWQM3b61N5vW7wwABQ001uusQ0K437yxbWu8TB+hAAZ+Jz5us4/UxOXXSYKw4fmPSTVdokTRCiRkWcfn9xURkbyXHgC87/pPHrEygveMP2Pw9pZdARQNnp6JfpFSLRtX5P78xsKlbXR/vxCmqqPS7Pvv1vpL97M+YyWmVnTp6rRKwV5Dw7exHeTxHhAUHnVnwPYXMOTOXbtLwlFcul3K93EWh6RbfeXZDI4SqG6zsic2LyhTL34GoVgtxb0/SGxF26wnclrMpMWu9Pb/XWILKm7ZWX7H6epFAsVyeifRr79CYrGUvSrfZ/PaNDU1npq/dePU7w6Nx0onawaON+fEMhBMiBrtiOS76PUmHbMrnMbAoy7BroZlYmrlVOQ/3RiMGqz16QHMqkpxF2e6qjImiFAKopCaznwB7tfIRt3KVlukGoWF8rMwfFjVtV9G5TGlmRbJgks57ReNTo4StxQW4p0ZgHpHZeOsoi5eSqmT2iyy0Vh1iCKPyNzpqZVWyt737TurPYa44p8Rhda5DTbDa1ZRUTmyJQJxHh5P7rEdx5zaUL64VoVQ4OYnw7lY2RMGSE3HEQALhBQBycdJ01TOUTZ8/Mx9gAZGUFZlolFdjD1/uJWFsNZl+tV8fMtkANjwM2evEN2Cpb574lJKts6AfnXjpBpAdLgDAv28SwZaLUbRr8jHTDKo44fU14h4I7xp5iXQqoNL1/u8KnKRLLLq1XG/XXVCtw8pj18oJUXZL7XxMMpG8j3pyc76XzLM+iKUZNRc8nM5YR1KqrMC3XQluAgtQ5DUJ4IcMOV6alWAJuJWByuRu/cfv2gWGWULO49Zj4lMogBRdFHx046saq0D36PL++sbBHvvHp98/hqMuNJo4fxvzKaHAExZs/uGNBQoEs36kUQirV1y88TAfYfqBB01w/UqYFDZ6611lRbFDa+9RiMRZajtz1cEC0QjQfaLnrEfP3PMSi49SJfhdEPEpFeHskQXp6ZHQovPeQuKX7xRuG6a0mBsFTuekBSbMQIhGInYy1yB9voIRcrcsN2nEvSb07QiUKlLeYzwNRbXUWu/QWusqsgQstpxfSM4brrz7cTdsaus9arXvBykoFvTwxdbL1OY4LhWt1j0K+zLeUP8AQb+Axk8oSWU7LcQQ3VWnBkMu66RitNGyBsTGkzAXAUr/AJMzO0ajMEcXh6xGTomrAYPeorOtbdq1b8HiLMOxOSZV3hhUAot4Ov8AczEonaLfr+fiLcyopDx2hVEZJTPf/UJByVysKGghrpN/KF+sEyI0lt/s+QgJHCaKtf3DzLrDkdTF4f7vMlGxMVCBVgXzAiZ6t25YlDbrH8VLrq15wz6kuILcuB6TTmMFYauX+wig/P7iFSLR2LqzB2jRbOUVDIPWIbbdHK2Rg6SqUHJVczKiHJhW0O0oBNnWClXhHk5I3GGIB2e1/csQwoX2GWokK3eh7n4I3FXay6cPqfiFm5oz3laJoUiNAckvJEAggxAuCzBBpdanZ6NWahmweg1Kd39DYsX8xt11DksFehmDvfmH1TLd308494ispu5Tmn7ioNf8cwwW/s/cSQsNY/uWxgpKfqChay4kEKekwaN1ltv06xKSkmwvoQuN3giLpz0f3T3z5jCE5httMGWYeAoAAR2V6EajfS4XnHxC618QEG+2otQgYBa8QYAvADXiKAcLPEKPiDD4PQ/Qo9pmyRLLUjYc46aBx4jY6sVqbO6Ak7UPdl+zLw9oPR9/Ihlah0as+1wZt1LwfzZ8pTpmVYP5z8Jm9y6NZ/aBzuuB/OPBigyQMG/3J8S1Y7OjV32qK0gUuqIuYroej7NMsKzQHPJrr1PeaTzm7BfTOSFX3fI9SHU0nv1iOyo1b4mIDsi6W3xcUWyravMFpjpxF5pVxqz4SUCqYHIa+HPsRCAKLN3xLtvyBHTh679K6xKTtTHbGXplPeAsqWPAXDffPiWKPMC6h2HxCKBF5AHbUSnByKbuEBADH/CJrf8AjtBBlzijFcOOQwFEC76kaixXtEuR5JTYeSCixxsikacWIblAtZ9Irkz0iKjOOIFHHxOVsENmE8RKKRsHHurUcwLNFBFLrqyLV3/ssUrDXRzI78LcW6NYwlzLhElQjfllNa+JQPwiuDAFxDIgXJ5bqHgQ5XVvniKGAa7J0QJquz4nzGH10Zb/ANJn3Nt8KuYXeOFTCs9T5VDW5g5/Cf7h6wcxF8UWFMtcf1nSJZju/wCkoEAL3YXHsQ8hRyKqt37QkMN72DrKLYbgRuFO+7hx7Nus4cx1uOzM7xqJ1G48ZImWTmaZcx0ZNSprAzy2w96weiSgwpsvIH7n2e8FwJhO8D5U/wBRGlTJvgzk9sPiVih57rDb3iYS4MzkzGjQsPn+j4jkUW83zKD/AGEFKyrREwgjmUIYb1XsdZjjW8GuyILSKvVlNFCwheZY0hbFcszldlZotv0PzBE0imxyb4Yh5hUbcG+scOnqRkXuGdzme8DxKhb06TosEbIDnr9oErkrq4ev3gQO3E30Bx1UCdRmenS9FLclRbZ6boJzdpt16HqRujFoqXBqYbI6zk0fn2mF1Ov7xtSA2OtftP8AcXYLglmqIYe8s1eCaGV9Ueg648xyF8nHeD24jZajw1NWxG4mJRNFQVo/3QwCCA0EXCNVBPL1ggwUkrAIox+Ei30nzmVo93pAhVNewbYGw1Ho6txGb0wMnU9IuVayokvnYqCi31qHMoVis1dcesc5zXtBMwMKX7hRAUXNLFOG/MAauqF+HX8RlQQCz1/357Rja7lZ0dOkzePiKVnRlxMzq/zUCZELIZb1ByLB8dxLKcMpDL3zEBtvHMZwdS02r5zCCiaGLilsPPMsgrvVyoZLRz6xk30jekSklmNq0ay00drcPc7RLmSOOihevR9usMLqoOa+M4YGshqL1B64CvU5qFXXjnFBB8YXtCTdW85i9G+C0MkBSZgpL+MRHvSzEtWMuKuDV7T3dX92jqyAPD5y7EtRtK4Fh935jrNUY/CfuC5uZvNfsvwxUdGXyTomAqnHNOmg4evSITacBuZWg45ocV7sSwn1plZVwwC2aesMmq1zGqhpJdy6+Fe3eO6jBSGLbvlaVjvLhTKi5qtv4/5GkWO3kbKncNdmUgnobaKwnVq5+M1WwPasx1YABYU0iFCPmCDFe8atxMVGqMPmCxFTUnGYzKsUNWNRRcgUm2c0TtvIBqOOX7vofIxzUqx37QQqX8XcUuFV9h09pb3A7XVdPfUveKCKRdQYOIOSDEkArGCMQlCyrV2m/GuMwIwACm5r5+xBxuF8SNzGLYO+5ju2qZFeLv8A3BRetCM+x90ccwZLPxL1llemc+ZnwuHT+oZHdYP1iNfeVil/aJrga4JYLPglIarXQmTfxFIFmSmYtlCo0NSoxbadJREaoC+p/dO8OO4Qxd3fzv1JhSvo7A/J8xNCGrJh49k+zC4LtTA/UCgrDqP1Ex/B6QSORbTp2mn7P9TLyE6K8VE6pe/+sUVr/nEzNDsxT8RHQUsF5rgO6/HpMmhroJt9OD0h8aFHSkx+J9paTVgJ5LfMxyiBCrSutT0oIV0Cq5ztAGzINuMte8oCLYj1TAnTvZrT6VUNZld6dLpmUtpPr1fmZn4s3mqq9KxAKPtCwz8SgagQxbR5z7QkoIVrm/aYTQADoBUF1Wbtrov11CgoxJOW3jhOYOIsir6xjOc+8F8GX1dBxxFqme79R4Uj3fqV9qMqjLioEaMvBEg2A6OJTncL1lbjmNMlbm+SFEwNEvkXUVvTxC3Y28xCQEcIxumw1QfUiUsDQCLuo9o9FCsnWoXRn5lrMwuoL1hdmfmC9fmW1v5iCYSuDnzNH2XH3lgJcqCv1DR3YQo0mC9HXu/6eIu8m+dRW1NRmPU2doZLSi+uf9/E4Np1Lo546xWmeesWjPTmNtnjrHAzQD0ai4VtdPMqZtZa5F1+veVtJnHqUBnxBACoE0xX6lwM2BZW/wDIi2IFIO3+tyzuK+oG69N+YFi06DIG/XhI0Ba2OHuRW9/MHv8AMzW/mZ6/Mze/mN5fMVxn5lts/MDRWC2FWbpo13uLPA6pLBSi1PUbYQUq3ruW1/uF0zC85+ZbZ7neG7fe7onb590L3+/G+zjlK+3jzG+z3YZ6/MBQGV4jqJZuHfL9f9ma38y3Pg5lqc8dZkgUqlFdfX/fWUXhjXHxKEKu0re+0Q2FyK2754gCq+k/Ex2RWlfipUWGQlX34igo9f6R4vV7K/iLYbgu6lnbZ0F13lBjhEDAegPt9C0NvWBDd5/cEvd2bhk4Oma+8UQH3L/cKz+HmIshOIJZBJZUsxK2wLTb0n7jGl5ZFHfoRijykF3/AHqY9kuA9P8AVEbL7g2Xv6d5jw9lW9f+oL13k36HvGzLRgZIBKoHtGg7WKlL54mYb3Ghduuksuc1ygNzFzmv4iUG4HuzQWhawX6wNCgLamTdN+nOLl9A+oXwVfpxzcRVQKBalYtv06XcZLA5A3a9ShvnpPecxEKUSy042ylM8TFzEKtMuMXcCjPAaXBMy9Mssdpen1HeAXAGlW1rrqXUAo6etZ6faLKrOzrnmBFLtnT0gr2ZXXEDZELAtiP0Fi0zynoZhWZXJq41aki4OBW3KXHPGylV9MVRRoJl6jG6hH4wBwKv1XA7mtblbZ5XMt5cnxm60gQ59Ei15usRhwIuf0NtQJrZWVt7pgABopirxUauNZiLPZdieCWz+L3iSXfW4+/0+Yw1BjmDiDHkgwcQckGXjUFTQAXzLEFDBGWVzmXTnQNkb/clVqNqi6aJTEhoRqnJuPcEGYqVnN7aj/Uu2HdnWOImMKoHhoO/f/kqZRCr5+fw+0RWjc0YOIs8cTI4igvEvMtliJQOJedS8S48YcEtTqBCw3HLUuXiX2l5i3FMYl5YJZWosMcQgLsF+0C/kGj9+5SBhW6JbZKG7tH1JmrwIthf65hmDIJBbYijNAUlDFZhyKFhtV0sjQMIXYckLES0VAcC4+93ASu2ddJVkEO74yd83AUwcdO3tqXwHz0i0heOsbUptasF/iUruva6w6l2guSMU653MOFPe9SK6jLV0LV+hKUTrequnXE5vqW47c7ifuEydpIgw2WgvcYhEltHo+0LKrsvB2gyAh7it+YXAjZli5QKEKnd9I3DQolrJ5hgpbdy8HLRSIHRMGmFphlAuCmBnZZwDbAZpLEbsdQXCayalUECCm4oUqm72uGw6grU4oCxbHN5OYmqVW2Lhg8zl/MsHNdZVOfMTv8AMy6YkZ+8ai3XrMumYdRAWkEUdO8wOYaS/vLEPzKB/uIGfvLZbcJdZ95ox8zI5eZi/aNCzPrMumU7W1iOEGM3k4gBqmdsxMLVa3LV/ufxcqiFFWvPRlZa6Zb44iq3K7VmbXzCjXzGkoTleXriYcT0Lw9cnEM2GCeY+s0jeF2wYA7kurK/MaE48tHrxCxACUs9XnUHkQA4V2i2ZIRvITBo3KABVtM9ZU1qDSz16zGpC3CtYiQGiCbyKwcRHHTynvEWCTaHfrABQBdgrWJWI0oTr0hgk0teX3l/2yqnzH6n10QYOIJZGXiK5lMZgluYpfMsllyypZUsuWS1bZttiOcsmIquiWW5icm42otnLLKlJxct6svG5ySqOWN1lfpzOcxiWW5llbinsSyyWZl4i19OPpzOPpzDUpz5glM9IVTlhVGXfSItnpCs5mFr7IULGVrbWXiNhW7xdQix4Q5Fq4OwlpjHeEBSsKTepRxAAwwqDX0+Y/4D9FhBg4g5Is5gYlJS9RyYly8y8TNGJ3qXLxLzFFqi3HEvLiBoxzOBqXllNagS1S8y+0uXmWjYly8xblmMS8uJeNRcPSXklmZeItQZeJcvMuXLzBxEceYOGIFOJ0O84gB12+0HcwbIACkYiuOsRaF6FwnRPdKNagsQ54ZUCswpHESjUUCVaRDrHE+Y/wCNw2QZbUFsibRNJbLbirS2W3LZhK+08HpLZeJbcbFU0+I8qaltxIXdX0jSWY9JbcwuPiJyuvScy2WzNyuiZDJLZbctmWy22W1FaektuW5ltROJf0ucy2Zl5gsb5wWkFpm5nHaJZnjFdoLmW1LZakQW3tDMr9otnvG+UVqK3MxuoLSNwufMf8hzKSsrcQkDRKyl7lKc/TncuWozLav6cTmIG5atxuVcrcsDOolAlLmkxE5+vJmeyKpn6cwi7Z3pm39JFGUuViagNZnv9fecfTmGodCwuIZswo3AbjDnMw0SgNkICsST9kKNvaW7blcI3BQZJsZjQWyCuYDBcUrcp1nzH/K/pf0uXLly5cvMuXLLly5eZcuXLl/S8y5cuXLl5ly8S5cuXLzLly8y5eJeZcv6XmXLl5ly4OYMrE0wZePovMrD+4Wl/eXcI1/uYBLzFizn6VPmP/lcuX/nefrf+N/48y5cuXLly/rz/lcuX/hctlszLzBlq5ltwWUF1ETZLbmDbFNXLbjgzqS2/rm5n6fMf/W5cuXLly/87ly5f0uXLly5cuXLly5cuXLly/8AK5f+F5ly5eYMtW425l5majZUvO5atxb2zn68y+/0+Y/+ly5cuXLly5cuXLly/rcuXLly5cuXLly5cuXLly5cv/C5f1uXLl5l/W5cuXmWjbc5ntGc/R/w+Y/5c/8Arz/+U6+nH+JuOpwhp9NP8P/Z\" alt=\"\" width=\"384\" height=\"192\"></p>\r\n<p><a href=\"https://www.youtube.com/watch?v=wA0N395JORw&amp;list=RDGMEM8rCiNo9r3kt8XsHUaTEI2gVMYKlDXS4xOFM&amp;index=27\" target=\"_blank\" rel=\"noopener\">4- KOUZ1 - LA RWINA . ( VAN GOGH ) - YouTube</a></p>', '2023-01-16 01:54:00.468459', 1);

-- --------------------------------------------------------

--
-- Table structure for table `eisenhowerapp_users`
--

CREATE TABLE `eisenhowerapp_users` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eisenhowerapp_users`
--

INSERT INTO `eisenhowerapp_users` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$FqOmnFAfAVt99zPAdlyDh1$66iQnvZnISH2nVinC/mmJu4NKoxnzSWGmTbpYV/a7kA=', '2023-01-14 13:38:44.687639', 1, 'leeuw', '', '', '', 1, 1, '2022-12-16 23:10:46.914409'),
(2, 'pbkdf2_sha256$390000$MhYY1S1zYPa0dcb6vOGUe8$OpSH/Y1CI9ksddZVWatrUf2wFZZMbt4IyfXgssH2LW8=', '2023-01-16 02:32:57.267502', 0, 'xmed', 'mohamed', 'essabir', 'mohamedessabir@gmail.com', 0, 1, '2022-12-16 23:57:09.924627');

-- --------------------------------------------------------

--
-- Table structure for table `eisenhowerapp_users_groups`
--

CREATE TABLE `eisenhowerapp_users_groups` (
  `id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `eisenhowerapp_users_user_permissions`
--

CREATE TABLE `eisenhowerapp_users_user_permissions` (
  `id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
-- Indexes for table `eisenhowerapp_tasks`
--
ALTER TABLE `eisenhowerapp_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EisenHowerApp_tasks_user_id_fc2ef960_fk_EisenHowerApp_users_id` (`user_id`);

--
-- Indexes for table `eisenhowerapp_users`
--
ALTER TABLE `eisenhowerapp_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `eisenhowerapp_users_groups`
--
ALTER TABLE `eisenhowerapp_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `EisenHowerApp_users_groups_users_id_group_id_03fa35ec_uniq` (`users_id`,`group_id`),
  ADD KEY `EisenHowerApp_users_groups_group_id_c6db9e3b_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `eisenhowerapp_users_user_permissions`
--
ALTER TABLE `eisenhowerapp_users_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `EisenHowerApp_users_user_users_id_permission_id_e6047c0e_uniq` (`users_id`,`permission_id`),
  ADD KEY `EisenHowerApp_users__permission_id_c399dc14_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `eisenhowerapp_tasks`
--
ALTER TABLE `eisenhowerapp_tasks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `eisenhowerapp_users`
--
ALTER TABLE `eisenhowerapp_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `eisenhowerapp_users_groups`
--
ALTER TABLE `eisenhowerapp_users_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eisenhowerapp_users_user_permissions`
--
ALTER TABLE `eisenhowerapp_users_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `eisenhowerapp_tasks`
--
ALTER TABLE `eisenhowerapp_tasks`
  ADD CONSTRAINT `EisenHowerApp_tasks_user_id_fc2ef960_fk_EisenHowerApp_users_id` FOREIGN KEY (`user_id`) REFERENCES `eisenhowerapp_users` (`id`);

--
-- Constraints for table `eisenhowerapp_users_groups`
--
ALTER TABLE `eisenhowerapp_users_groups`
  ADD CONSTRAINT `EisenHowerApp_users__users_id_3ea2bb08_fk_EisenHowe` FOREIGN KEY (`users_id`) REFERENCES `eisenhowerapp_users` (`id`),
  ADD CONSTRAINT `EisenHowerApp_users_groups_group_id_c6db9e3b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `eisenhowerapp_users_user_permissions`
--
ALTER TABLE `eisenhowerapp_users_user_permissions`
  ADD CONSTRAINT `EisenHowerApp_users__permission_id_c399dc14_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `EisenHowerApp_users__users_id_d17cb614_fk_EisenHowe` FOREIGN KEY (`users_id`) REFERENCES `eisenhowerapp_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
