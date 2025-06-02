-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jun 2025 pada 18.26
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `game_plays`
--

CREATE TABLE `game_plays` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `played_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `game_plays`
--

INSERT INTO `game_plays` (`id`, `game_id`, `user_id`, `played_at`) VALUES
(1, 1, 2, '2025-06-01 10:21:10'),
(2, 1, 1, '2025-06-01 10:22:09'),
(3, 1, 1, '2025-06-01 10:22:53'),
(4, 1, 2, '2025-06-01 13:21:28'),
(5, 1, 2, '2025-06-01 13:21:56'),
(6, 1, 2, '2025-06-01 13:22:20'),
(7, 1, 2, '2025-06-01 14:08:12'),
(8, 1, 2, '2025-06-02 04:31:26'),
(9, 1, 2, '2025-06-02 05:07:55'),
(10, 1, 2, '2025-06-02 05:08:01'),
(11, 1, 2, '2025-06-02 06:45:21'),
(12, 1, 2, '2025-06-02 08:11:55'),
(13, 2, 2, '2025-06-02 08:30:27'),
(14, 2, 2, '2025-06-02 08:32:52'),
(15, 2, 2, '2025-06-02 08:34:59'),
(16, 1, 2, '2025-06-02 08:35:18'),
(17, 2, 2, '2025-06-02 08:38:18'),
(18, 2, 2, '2025-06-02 08:46:44'),
(19, 2, 2, '2025-06-02 08:48:43'),
(20, 3, 2, '2025-06-02 09:00:00'),
(21, 3, 2, '2025-06-02 09:02:32'),
(22, 4, 2, '2025-06-02 09:04:04'),
(23, 5, 2, '2025-06-02 09:04:57'),
(24, 6, 2, '2025-06-02 09:06:00'),
(25, 7, 2, '2025-06-02 09:07:36'),
(26, 1, 2, '2025-06-02 09:17:09'),
(27, 1, 2, '2025-06-02 09:20:45'),
(28, 1, 2, '2025-06-02 09:21:49'),
(29, 7, 2, '2025-06-02 09:25:22'),
(30, 2, 2, '2025-06-02 09:27:40'),
(31, 3, 2, '2025-06-02 09:30:02'),
(32, 4, 2, '2025-06-02 09:31:33'),
(33, 5, 2, '2025-06-02 09:33:44'),
(34, 6, 2, '2025-06-02 09:36:20'),
(35, 6, 2, '2025-06-02 09:37:17'),
(36, 6, 2, '2025-06-02 09:37:55'),
(37, 4, 2, '2025-06-02 09:39:03'),
(38, 2, 2, '2025-06-02 09:43:48'),
(39, 7, 2, '2025-06-02 09:43:59'),
(40, 3, 2, '2025-06-02 09:44:58'),
(41, 4, 2, '2025-06-02 09:45:05'),
(42, 5, 2, '2025-06-02 09:45:12'),
(43, 6, 2, '2025-06-02 09:45:43'),
(44, 7, 2, '2025-06-02 09:45:51'),
(45, 5, 2, '2025-06-02 09:48:20'),
(46, 6, 2, '2025-06-02 09:48:50'),
(47, 6, 2, '2025-06-02 09:48:57'),
(48, 6, 2, '2025-06-02 09:49:02'),
(49, 4, 2, '2025-06-02 09:54:07'),
(50, 1, 2, '2025-06-02 10:00:44'),
(51, 3, 2, '2025-06-02 10:24:39'),
(52, 2, 4, '2025-06-02 11:42:22'),
(53, 6, 4, '2025-06-02 11:43:06'),
(54, 7, 4, '2025-06-02 11:47:02'),
(55, 5, 4, '2025-06-02 11:51:56'),
(56, 1, 4, '2025-06-02 11:53:57'),
(57, 6, 4, '2025-06-02 11:54:51'),
(58, 7, 4, '2025-06-02 11:56:53'),
(59, 1, 2, '2025-06-02 15:53:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `rating`, `comment`, `created_at`) VALUES
(1, 2, 5, 'bagus banget webnya kk, mantul pokonyaaa\r\n', '2025-06-02 14:15:36'),
(2, 2, 3, 'mantapp betull', '2025-06-02 14:16:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('topup','game_purchase') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `game_id`, `amount`, `type`, `created_at`) VALUES
(1, 2, 1, 10000.00, '', '2025-05-31 23:36:33'),
(2, 2, 1, 10000.00, '', '2025-05-31 23:37:50'),
(3, 2, 1, 10000.00, '', '2025-05-31 23:38:39'),
(4, 2, 1, 10000.00, '', '2025-05-31 23:38:49'),
(5, 2, 1, 10000.00, '', '2025-05-31 23:41:22'),
(6, 2, 1, 10000.00, '', '2025-05-31 23:41:25'),
(7, 2, 1, 10000.00, '', '2025-05-31 23:41:33'),
(8, 2, 1, 10000.00, '', '2025-05-31 23:41:39'),
(9, 2, 1, 10000.00, '', '2025-05-31 23:41:43'),
(10, 2, 0, 10000.00, 'topup', '2025-06-01 12:12:25'),
(11, 2, 0, 45000.00, 'topup', '2025-06-01 12:12:35'),
(12, 2, 0, 10000.00, 'topup', '2025-06-01 13:22:11'),
(13, 2, 0, 10000.00, 'topup', '2025-06-01 14:08:28'),
(14, 2, 0, 20000.00, 'topup', '2025-06-02 04:31:18'),
(15, 4, 0, 20000.00, 'topup', '2025-06-02 11:53:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `saldo` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `saldo`) VALUES
(1, 'antrahmaa', '112233', 203456),
(2, 'juki', 'jukimandibunga', 242000),
(3, 'ayam', 'goyeng', 5000),
(4, 'penyet', '123321', 78000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `game_plays`
--
ALTER TABLE `game_plays`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `game_plays`
--
ALTER TABLE `game_plays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
