-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2023 年 12 月 24 日 11:50
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
-- 資料庫： `simpleml`
--

-- --------------------------------------------------------

--
-- 資料表結構 `record`
--

CREATE TABLE `record` (
  `id` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `region` varchar(20) NOT NULL,
  `income` float NOT NULL,
  `married` varchar(5) NOT NULL,
  `children` varchar(5) NOT NULL,
  `car` varchar(5) NOT NULL,
  `save_act` varchar(5) NOT NULL,
  `current_act` varchar(5) NOT NULL,
  `mortgage` varchar(5) NOT NULL,
  `kmeans_cluster` int(11) NOT NULL,
  `kmeans_pep` varchar(5) NOT NULL,
  `knn_id` int(11) NOT NULL,
  `knn_pep` varchar(5) NOT NULL,
  `ca_pep` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `record`
--

INSERT INTO `record` (`id`, `age`, `sex`, `region`, `income`, `married`, `children`, `car`, `save_act`, `current_act`, `mortgage`, `kmeans_cluster`, `kmeans_pep`, `knn_id`, `knn_pep`, `ca_pep`) VALUES
(1, 36, 'MALE', 'INNER_CITY', 21302.2, 'YES', '2', 'YES', 'YES', 'YES', 'NO', 5, 'NO', 543, 'NO', '強烈不會買'),
(2, 55, 'FEMALE', 'INNER_CITY', 38215.8, 'YES', '1', 'YES', 'YES', 'YES', 'NO', 6, 'YES', 505, 'YES', '強烈會買');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `record`
--
ALTER TABLE `record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
