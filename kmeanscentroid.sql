-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2023 年 12 月 28 日 07:32
-- 伺服器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `simpleml1`
--

-- --------------------------------------------------------

--
-- 資料表結構 `kmeanscentroid`
--

CREATE TABLE `kmeanscentroid` (
  `cluster` int(11) NOT NULL,
  `building` float NOT NULL,
  `room` float NOT NULL,
  `area` varchar(5) NOT NULL,
  `elevator` varchar(5) NOT NULL,
  `buildingtype` varchar(15) NOT NULL,
  `landtype` varchar(5) NOT NULL,
  `totalfloor` float NOT NULL,
  `house` float NOT NULL,
  `pep` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `kmeanscentroid`
--

INSERT INTO `kmeanscentroid` (`cluster`, `building`, `room`, `area`, `elevator`, `buildingtype`, `landtype`, `totalfloor`, `house`, `pep`) VALUES
(1, 0, 1.9091, '中山區', '無', '公寓(5樓含以下無電梯)', '住家用', 4.039, 73.3961, '無'),
(2, 0.0541, 3.6216, '七堵區', '無', '公寓(5樓含以下無電梯)', '住家用', 3.7838, 107.478, '無'),
(3, 0.0278, 2.9907, '安樂區', '無', '公寓(5樓含以下無電梯)', '住家用', 4.463, 84.8244, '無'),
(4, 0.4353, 2.5412, '安樂區', '有', '華廈(10層含以下有電梯)', '住家用', 7.3765, 95.5568, '有'),
(5, 0.9778, 2.5519, '中山區', '有', '住宅大樓(11層含以上有電梯)', '住家用', 14.7, 63.7369, '有'),
(6, 0.2344, 2.3125, '安樂區', '有', '住宅大樓(11層含以上有電梯)', '住家用', 15.5625, 68.9172, '有');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
