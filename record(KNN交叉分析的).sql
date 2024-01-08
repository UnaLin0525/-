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
-- 資料表結構 `record`
--

CREATE TABLE `record` (
  `id` int(11) NOT NULL,
  `building` float NOT NULL,
  `room` float NOT NULL,
  `area` varchar(5) NOT NULL,
  `elevator` varchar(5) NOT NULL,
  `buildingtype` varchar(15) NOT NULL,
  `landtype` varchar(5) NOT NULL,
  `totalfloor` float NOT NULL,
  `house` float NOT NULL,
  `kmeans_cluster` int(11) NOT NULL,
  `kmeans_pep` varchar(5) NOT NULL,
  `knn_id` int(11) NOT NULL,
  `knn_pep` varchar(5) NOT NULL,
  `ca_pep` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `record`
--

INSERT INTO `record` (`id`, `building`, `room`, `area`, `elevator`, `buildingtype`, `landtype`, `totalfloor`, `house`, `kmeans_cluster`, `kmeans_pep`, `knn_id`, `knn_pep`, `ca_pep`) VALUES
(1, 1, 2, '七堵區', '無', '住宅大樓(11樓以上有電梯)', '商業用', 2, 2, 2, '無', 240, '無', 'NONE'),
(2, 1, 2, '七堵區', '無', '住宅大樓(11樓以上有電梯)', '商業用', 2, 2, 2, '無', 240, '無', 'NONE'),
(3, 6, 1, '中山區', '無', '透天厝', '商業用', 1, 1, 1, '無', 520, '無', '一定不會有管理組織'),
(4, 7, 7, '中山區', '無', '住宅大樓(11樓以上有電梯)', '住家用', 8, 8, 1, '無', 40, '有', 'NONE'),
(5, 6, 8, '七堵區', '有', '住宅大樓(11樓以上有電梯)', '住家用', 9, 7, 5, '有', 554, '有', '一定會有管理組織'),
(6, 1, 5, '七堵區', '無', '公寓(5樓以下無電梯)', '住家用', 6, 6, 2, '無', 199, '無', '一定不會有管理組織'),
(7, 1, 5, '中山區', '有', '住宅大樓(11樓以上有電梯)', '住家用', 6, 5, 5, '有', 173, '無', '一定會有管理組織'),
(8, 9, 7, '中山區', '無', '華廈(10樓以下有電梯)', '住商用', 1, 9, 1, '無', 538, '無', 'NONE'),
(9, 2, 4, '中山區', '無', '透天厝', '住家用', 3, 5, 1, '無', 40, '有', '一定不會有管理組織'),
(10, 1, 3, '七堵區', '無', '住宅大樓(11樓以上有電梯)', '住家用', 3, 4, 2, '無', 547, '無', 'NONE');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
