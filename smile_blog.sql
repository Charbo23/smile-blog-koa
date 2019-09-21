-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-09-21 10:43:48
-- 服务器版本： 5.7.14
-- PHP Version: 7.1.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smile_blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `cover` varchar(255) DEFAULT '',
  `description` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `public` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `like` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `cover`, `description`, `category_id`, `created_date`, `public`, `status`, `like`, `star`, `views`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '你好啊，陌生人', '如果快乐有颜色，那一定是淡蓝色', 'https://i.loli.net/2019/09/21/5AblygzpvEoKDhJ.jpg', '音乐是救世主', 1, '2019-09-21 16:10:40', 1, 1, 0, 2, 16, '2019-09-21 15:49:29', '2019-09-21 17:29:22', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `articleauthor`
--

CREATE TABLE `articleauthor` (
  `article_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `articleauthor`
--

INSERT INTO `articleauthor` (`article_id`, `author_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2019-09-21 15:49:29', '2019-09-21 15:49:29', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `articletag`
--

CREATE TABLE `articletag` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `articletag`
--

INSERT INTO `articletag` (`article_id`, `tag_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2019-09-21 15:49:29', '2019-09-21 15:49:29', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(320) NOT NULL,
  `description` varchar(255) NOT NULL,
  `auth` tinyint(4) NOT NULL DEFAULT '8',
  `password` varchar(127) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `author`
--

INSERT INTO `author` (`id`, `name`, `avatar`, `email`, `description`, `auth`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Charbo', 'https://i.loli.net/2019/09/21/r4NjZxbTU76MEfY.jpg', 'charbo233@foxmail.com', 'Super admin', 32, '$2a$10$e1zN7EeiRf3OJYVr0/nPdevUiR3ws7A5Dp0F4pooNu8hjZTZ656IC', '2019-09-21 15:03:13', '2019-09-21 15:03:13', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `cover`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '杂谈', '随心随性', 'https://resource.shirmy.me/lighthouse.jpeg', '2019-09-21 15:47:01', '2019-09-21 15:47:01', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(32) NOT NULL,
  `content` varchar(1023) NOT NULL,
  `like` int(11) NOT NULL DEFAULT '0',
  `email` varchar(320) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`id`, `parent_id`, `nickname`, `content`, `like`, `email`, `website`, `article_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'Charbo', '你也好', 1, 'charbo233@foxmail.com', 'https://charbo.me', 1, '2019-09-21 15:51:56', '2019-09-21 15:52:41', NULL),
(2, 1, 'Charbo', '233', 0, 'charbo233@foxmail.com', 'https://charbo.me', 1, '2019-09-21 17:29:04', '2019-09-21 17:29:04', '2019-09-21 17:29:20');

-- --------------------------------------------------------

--
-- 表的结构 `friend`
--

CREATE TABLE `friend` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `friend`
--

INSERT INTO `friend` (`id`, `name`, `link`, `avatar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'My Hexo Blog', 'https://charbo.me', 'https://i.loli.net/2019/09/21/SpLsoUzA9CxleYd.jpg', '2019-09-21 16:13:36', '2019-09-21 17:03:54', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `content` varchar(1023) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `tag`
--

INSERT INTO `tag` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '杂谈', '2019-09-21 15:47:13', '2019-09-21 15:47:13', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articleauthor`
--
ALTER TABLE `articleauthor`
  ADD PRIMARY KEY (`article_id`,`author_id`);

--
-- Indexes for table `articletag`
--
ALTER TABLE `articletag`
  ADD PRIMARY KEY (`article_id`,`tag_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `friend`
--
ALTER TABLE `friend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
