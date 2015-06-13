-- phpMyAdmin SQL Dump
-- version 4.2.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-03-17 16:55:38
-- 服务器版本： 10.0.13-MariaDB
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tgcms`COLLATE utf8_general_ci
--
CREATE DATABASE IF NOT EXISTS `tgcms` DEFAULT CHARACTER SET utf8;
USE `tgcms`;

-- --------------------------------------------------------

--
-- 表的结构 `tgcms_info` img 代表企业信息
--

DROP TABLE IF EXISTS `tgcms_info`;
CREATE TABLE IF NOT EXISTS `tgcms_info` (
`id` tinyint(3) unsigned NOT NULL,
  `name` varchar(64) NOT NULL ,
  `logo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' ,
  `picspath` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci ,
  `img` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `icp` varchar(32) DEFAULT '' ,
  `tel` varchar(20) DEFAULT '',
  `fax` varchar(20) DEFAULT '',
  `email` varchar(64) DEFAULT '',
  `address` varchar(64) DEFAULT ''
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tgcms_info`
--

INSERT INTO `tgcms_info` (`id`, `name`, `logo`, `img`, `icp`, `tel`, `fax`, `email`, `address`) VALUES
(1, 'name', 'logo', 'img', 'icp', '13880334484', '028-88888888', 'szjywh@sina.net', 'address');

-- --------------------------------------------------------

--
-- 表的结构 `tgcms_link`PAGE_CHECKSUM=1 AUTO_INCREMENT=1 
--

DROP TABLE IF EXISTS `tgcms_link`;
CREATE TABLE IF NOT EXISTS `tgcms_link` (
`id` tinyint(3) unsigned NOT NULL,
  `name` varchar(8) NOT NULL,
  `url` varchar(128) NOT NULL,
  `seq` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--
-- 表的结构 `tgcms_video`PAGE_CHECKSUM=1 AUTO_INCREMENT=1
--

DROP TABLE IF EXISTS `tgcms_video`;
CREATE TABLE IF NOT EXISTS `tgcms_video` (
`id` tinyint(3) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `seq` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

-- --------------------------------------------------------
--
-- 表的结构 `tgcms_menu`
--

DROP TABLE IF EXISTS `tgcms_menu`;
CREATE TABLE IF NOT EXISTS `tgcms_menu` (
`id` tinyint(3) unsigned NOT NULL ,
  `name` varchar(8) NOT NULL ,
  `type` tinyint(4) NOT NULL ,
  `menu` tinyint(3) unsigned NOT NULL DEFAULT '0' ,
  `url` varchar(64) DEFAULT NULL ,
  `seq` tinyint(4) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tgcms_page`PAGE_CHECKSUM=1 AUTO_INCREMENT=1
--

DROP TABLE IF EXISTS `tgcms_page`;
CREATE TABLE IF NOT EXISTS `tgcms_page` (
`id` smallint(5) unsigned NOT NULL ,
  `menu` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `img` varchar(64) DEFAULT NULL ,
  `title` varchar(64) NOT NULL ,
  `isshowindex` varchar(64) NOT NULL DEFAULT '0',
  `message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tgcms_user`
--

DROP TABLE IF EXISTS `tgcms_user`;
CREATE TABLE IF NOT EXISTS `tgcms_user` (
`id` smallint(5) unsigned NOT NULL ,
  `account` varchar(16) NOT NULL ,
  `password` char(32) NOT NULL ,
  `email` varchar(128) DEFAULT NULL ,
  `name` varchar(16) DEFAULT NULL ,
  `role` tinyint(4) NOT NULL DEFAULT '0' 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `tgcms_user`
--

INSERT INTO `tgcms_user` (`id`, `account`, `password`, `email`, `name`, `role`) VALUES
(4, 'admin', '95ba0e0de7280c3ed0317600c874674f', 'szjywh@szjywh.net', 'szjywh', 1);


-- --------------------------------------------------------

--
-- 表的结构 `tgcms_job`
--

DROP TABLE IF EXISTS `tgcms_job`;
CREATE TABLE IF NOT EXISTS `tgcms_job` (
  `id` smallint(5) unsigned NOT NULL ,
  `title` varchar(16) NOT NULL ,
  `des` varchar(16) NOT NULL ,
  `desccipiton` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `tgcms_user`
--

INSERT INTO `tgcms_job` (`id`, `title`,`des`, `desccipiton`) VALUES
(4, 'title','des', 'desccipiton');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tgcms_info`
--
ALTER TABLE `tgcms_info`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tgcms_link`
--
ALTER TABLE `tgcms_link`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tgcms_video`
--
ALTER TABLE `tgcms_video`
 ADD PRIMARY KEY (`id`);


--
-- Indexes for table `tgcms_menu`
--
ALTER TABLE `tgcms_menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tgcms_page`
--
ALTER TABLE `tgcms_page`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tgcms_user`
--
ALTER TABLE `tgcms_user`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tgcms_job`
--
ALTER TABLE `tgcms_job`
 ADD PRIMARY KEY (`id`);
--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tgcms_info`
--
ALTER TABLE `tgcms_info`
MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tgcms_link`
--
ALTER TABLE `tgcms_link`
MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tgcms_video`
--
ALTER TABLE `tgcms_video`
MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tgcms_menu`
--
ALTER TABLE `tgcms_menu`
MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tgcms_page`
--
ALTER TABLE `tgcms_page`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT ;
--
-- AUTO_INCREMENT for table `tgcms_user`
--
ALTER TABLE `tgcms_user`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT ,AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tgcms_job`
--
ALTER TABLE `tgcms_job`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT ,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
